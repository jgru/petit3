#!/usr/bin/env python
"""
Library of utility code useful for systems administrators, analyzing and
manipulating log data.
"""
################################################################################
#
# Writen By: Scott McCarty
# Date: 7/2009
# Email: scott.mccarty@gmail.com
#
# Copyright (C) 2009 Scott McCarty
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
#################################################################################
from optparse import OptionParser
from UserDict import UserDict
from UserString import UserString
from UserList import UserList
from random import choice
from math import ceil
import os
import time
import fileinput
import signal
import re
import sys
import logging
global logging

# Process Signals
## Ignore problems when piping to head
signal.signal(signal.SIGPIPE, signal.SIG_DFL)

## Exit when control-C is pressed
def signal_handler(signal, frame):
        sys.exit(0)
signal.signal(signal.SIGINT, signal_handler)

class LogEntry:
	"""Interface class which specifies generic log format for consumption by other classes"""

	month = ""
	day = ""
	hour = ""
	minute = ""
	second = ""
	host = ""
	daemon = ""
	log_entry = ""

	def display(self):
		print "Month:",self.month,"Day:",self.day,"Hour:", self.hour, "Minute:", self.minute, "Second:", self.second, "Host:",self.host,"Payload",self.log_entry


class SyslogEntry(LogEntry):
	"""Driver for Syslog formatted files. Conforms to LogEntry interface class."""

	def __init__(self, line):

		# Split the line up
		value = line.split()

		# Should be normal log entry
		if len(value) >= 5:
			self.month, self.day, time, self.host, self.daemon = value[:5]
			self.log_entry = ' '.join(value[5:])
			self.hour, self.minute, self.second = time.split(":") 

		# Abnormal log entry
		elif len(value) >= 1:
			self.month, self.day, self.hour, self.minute, self.second, self.host, self.daemon = ["#","#","#","#","#","#","#"]
			self.log_entry = ' '.join(value)

		# Blank line, will be sorted out by scrub
		else:
			self.month, self.day, self.hour, self.minute, self.second, self.host, self.daemon = ["#","#","#","#","#","#","#"]
			self.log_entry = "#"

	def is_type(line):
		"""Standard function from interface class to determine type"""

		if len(line) >= 3:

			# Look for something similar to: "11:53:08" in third column
			if re.search("[0-9{2}:[0-9]{2}:[0-9]{2}",line[2]):
				return True
			else:
				return False
		else:
			return False

	# Declare Static Methods
	is_type = staticmethod(is_type)

class ApacheEntry(LogEntry):
	"""Driver for Apache formatted log files. Conforms to LogEntry interface class."""

	def __init__(self, line):

		# Split the line up
		value = line.split()

		# Should be normal log entry
		if len(value) >= 12:
			# Grab major chunks from the line
			rhost, ident, ruser, apachedate, junk, junk2, uri, protocol, status, bytes, referer, agent = value[:12]
			self.log_entry = uri

			# Split up something that looks like this: [03/Aug/2009:11:53:08
			datetime = apachedate.split(':')
			date = datetime[0]
			self.hour = datetime[1]
			self.minute = datetime[2]
			self.second = datetime[3]
			dmy = date.split('/')
			self.day = re.sub("\[", "", dmy[0])
			self.month = dmy[1]
			self.host = uri
			daemon = "webserver"

		# Abnormal log entry
		elif len(value) >= 1:
			self.month, self.day, self.hour, self.minute, self.second, self.host, self.daemon = ["#","#","#","#","#","#","#"]
			self.log_entry = ' '.join(value)

		# Blank line, will be sorted out by scrub
		else:
			self.month, self.day, self.hour, self.minute, self.second, self.host, self.daemon = ["#","#","#","#","#","#","#"]
			self.log_entry = "#"

	def is_type(line):
		"""Standard function from interface class to determine type"""

		if len(line) >= 4:

			# Look for something similar to: "03/Aug/2009:11:53:08" in forth column
			if re.search("[0-9]{2}/[a-zA-Z]{3}/[0-9]{4}:[0-9{2}:[0-9]{2}:[0-9]{2}",line[3]):
				return True
			else:
				return False
		else:
			return False

	# Declare Static Methods
	is_type = staticmethod(is_type)

class RawEntry(LogEntry):
	"""
	Driver for Raw log files. Conforms to LogEntry interface class.
	This also allows raw logs to contain all of the correct fields
	to be worked with just like other entries that actually have time
	 values
	"""

	def __init__(self, line):

		# Split the line up
		value = line.split()

		# Fake the time/date values, put the entire line in the key
		if len(value) >= 1:
			self.month, self.day, self.hour, self.minute, self.second, self.host, self.daemon = ["#","#","#","#","#","#","#"]
			self.log_entry = ' '.join(value)

		# Blank line, will be sorted out by scrub
		else:
			self.month, self.day, self.hour, self.minute, self.second, self.host, self.daemon = ["#","#","#","#","#","#","#"]
			self.log_entry = "#"

	def is_type(line):
		"""Standard function from interface class to determine type"""

		if len(line) >= 1:

			# Look for any length of text in the line
			if re.search(".+",line):
				return True
			else:
				return False
		else:
			return False

	# Declare Static Methods
	is_type = staticmethod(is_type)

class Log(UserList):
	"""
	Generic log class which contains a payload of objects which conform to the LogEntry specification.
	Log, which is an array of type LogEntry,  is relied upon and consumed to build a SuperHash or GraphHash.
	"""

	def __init__(self, filename=""):
		UserList.__init__(self)

		# Create new array to hold log data
		buffer = []

		# Check for logfile or read stdin
        
		if filename == "__none__":
			f = sys.stdin
		else:
			logging.info("File: "+filename)
			f = open(filename)

		# Read entire contents into array for speed
		for line in f.readlines():
			buffer.append(line)

		# Close file
		f.close();

		# Buffer has bow been created and work with file is done
		# Now it is time to determine what kind of objects will be
		# used for construction of self.

		# Check to make sure buffer has data
		if len(buffer) >= 1:

			# Get a sample of the first entry
			first_entry = buffer[0].split()

			if SyslogEntry.is_type(first_entry):
				Entry = SyslogEntry
			elif ApacheEntry.is_type(first_entry):
				Entry = ApacheEntry
			else:
				Entry = RawEntry

		# Finally, build self with the correct subclassed LogEntry constructor type
		for line in buffer:
			self.append(Entry(line))
			#self[len(self)-1].display()

	def contains(self, object):
		"""Determine what kind of objects are contained in this Log"""
		if len(self) >= 1:
			return isinstance(self[len(self)-1], object)
		else:
			return False
		
    #def subset(self, string):
    #    """Return a Log object that contains a subset of entries based on a filter"""
    #   pass
        


class Filter:
	"""Filter object used to lad filters into memory once, to save on file operations"""		

	file = ""
	prefixes =  [ \
		"/var/lib/petit/filters/", \
		"/usr/local/petit/var/lib/filters/",
		"/opt/petit/var/lib/filters/"]

	stopwords = []

	def __init__(self, file="__none__"):

		for prefix in self.prefixes:

			# Set class variable to file & path
			self.file = prefix+file
			self.stopwords = []

			if file == "__none__":
				return
				
                        if os.path.exists("%s" % self.file):
				try:
					f = open(self.file)
					for line in f.readlines():

						# Read entire contents into array for speed
						self.stopwords.append(line.rstrip())
					break

				except IOError:
					print "Could not open Filter file",self.file
					sys.exit(16)

		logging.info("Filter File: "+str(self.file))

	def scrub(self, string):
		# Check each stopword against each key
		for stopword in self.stopwords:

			# Replace mathces with hash signs
			oldstring = string
			string = re.sub(stopword, "#", string)
			logging.info(" SCRUBBING\t"+oldstring+" OF\t"+stopword+" BECOMES\t"+string)

		return string

	def bleach(self, string):
		
		if self.scrub(string) == "#":
			return True
		else:
			return False

class SuperHash(UserDict):
	"""Interface and parent class for all hash/dict based objects. """

	filter = Filter()

	def __init__(self, log=["__none__"], filter_filename="__none__"):

		# Call parent init
		UserDict.__init__(self)

		if log[0] == "__none__" and filter_filename == "__none__":
			pass
		else:
			# Setup the filter
			if options.filter:
				self.filter = Filter(filter_filename)

			# Fill the data structure
			self.fill(log)

	def fill(self, log):
		pass

	def increment(self, key, entry):

		# Check to make sure it exists
		if key not in self:
			self[key] = [0, []]

		# Increment the hashed count
		# Create an array of un-hashed values for sampling later
		self[key][0] += 1
		self[key][1].append(entry)

	def display(self):

		# Use the global flags
		global options

		# Set static sample threshold
		sample_threshold = 3

		# Print out the dictionary first sorted by the word with
		# the most entries with an alphabetical subsort
		for key in sorted(sorted(self.keys()),cmp=lambda x,y: cmp(self[y][0], self[x][0])):

			# Print all lines as sample
			if options.allsample:
				print str(self[key][0])+":	"+choice(self[key][1]).log_entry

			elif options.sample:

				# Print sample for small values below/equal to threshold
				if self[key][0] <= sample_threshold:
					print str(self[key][0])+":	"+self[key][1][0].log_entry
				else:
					print str(self[key][0])+":	"+str(key)
			else:
				print str(self[key][0])+":	"+str(key)

	def fingerprint(self):
		"""
		Remove all fingerprints from a given LogHash and replace with a single string"
		"""

		# Declarations & Variables
		threshold_coefficient = 0.3
		fingerprints = []
		fingerprint_files = ["__none__"]

		# Load & assign fingerprint files
		prefixes =  [ \
			"/var/lib/petit/fingerprints/", \
			"/usr/local/petit/var/lib/fingerprints/" \
			"/opt/petit/var/lib/fingerprints/"]

		for prefix in prefixes:
			if os.path.exists(prefix) and len(os.listdir(prefix)) >= 1:
				fingerprint_files = os.listdir(prefix)
				break

		if fingerprint_files[0] == "__none__":
			print "Could not locate fingerprint files: ", prefix
			sys.exit()

		for fingerprint_file in fingerprint_files:
			if re.search("fp",fingerprint_file):

				# Create a fullpath name
				filename = prefix+fingerprint_file

				# Build a Log for the fingerprint
				log = Log(filename)

				# Build a SuperHash
				x = SuperHash.manufacture(log, "syslog.stopwords")

				x.file_name = fingerprint_file
				fingerprints.append(x)


		# Iterate each fingerprint
		for fingerprint in fingerprints:

			logging.info("FINGERPRINT:"+fingerprint.file_name)

			# Reset counter for each fingerprint
			count = 0
			threshold = (len(fingerprint) * threshold_coefficient)
			logging.info("Threshold:"+str(threshold))

			# Look for fingerpring
			for key in fingerprint.keys():
				if key in self:
					count = count+1

				# If Threshold is reached, remove everyline of fingerprint
				# Saves time on searching every entry
				if count > threshold:
					logging.info("FOUND FINGERPRING:"+fingerprint.file_name)
					for key in fingerprint.keys():

						# Key found, plenty to remove
						if key in self:
							del self[key]

					# Force the sample entry to be the same as the key
					# and based off of the filename of the fingerprint
					fingerprint[key][1][0].log_entry = fingerprint.file_name
					self.increment(fingerprint.file_name, fingerprint[key][1][0]) 
					break

			logging.info("Count: "+str(count))

	def manufacture(log, filter):

		# Select the correct build method
		if log.contains(SyslogEntry):
			LogHash = SyslogHash
		elif log.contains(ApacheEntry):
			LogHash = ApacheLogHash
		elif log.contains(RawEntry):
			LogHash = RawLogHash
		else:
			print "Could not determine what type of objects are contained in generic Log"""
			sys.exit(15)

		# Build and return the correct subclass instance based on log file type
		return LogHash(log, "syslog.stopwords")

	manufacture = staticmethod(manufacture)


class SyslogHash(SuperHash):
	"""Overrides the fill method specifically for LogHashes built from Syslog files"""
	
	def fill(self, log):
		# Create a dictionary with an entry for each line. Increment
		# the value for each time the word is found. Merge lines by
		# Removing numbers and replacing them with a single '#'
		for entry in log:

			# Scrub sections of SyslogEntry which will be used to key the hash
			key = self.filter.scrub(entry.daemon+" "+entry.log_entry)

			# increment the LogHash with the new key
			self.increment(key, entry)

		# Finally, remove valueless lines
		if "#" in self:	
			del self["#"]

class ApacheLogHash(SuperHash):
	"""Overrides the fill method specifically for LogHashes built from Apache logs"""
	
	def fill(self, log):
		# Create a dictionary with an entry for each line. Increment
		# the value for each time the word is found. Merge lines by
		# Removing numbers and replacing them with a single '#'
		for entry in log:

			# Scrub sections of SyslogEntry which will be used to key the hash
			key = self.filter.scrub(entry.log_entry)

			# increment the LogHash with the new key
			self.increment(key, entry)

		# Finally, remove valueless lines
		if "#" in self:	
			del self["#"]

class RawLogHash(SuperHash):
	"""Overrides the fill method specifically for LogHashes built from text files without date/time"""
	
	def fill(self, log):
		# Create a dictionary with an entry for each line. Increment
		# the value for each time the word is found. Merge lines by
		# Removing numbers and replacing them with a single '#'
		for entry in log:

			# Scrub sections of SyslogEntry which will be used to key the hash
			key = self.filter.scrub(entry.log_entry)

			# increment the LogHash with the new key
			self.increment(key, entry)

		# Finally, remove valueless lines
		if "#" in self:	
			del self["#"]

class DaemonHash(SyslogHash):

	def fill(self, log):

		# Create a dictionary with an entry for each line. Increment
		# the value for each time the word is found. Merge lines by
		# Removing numbers and replacing them with a single '#'
		for entry in log:

			# Scrub sections of SyslogEntry which will be used to key the hash
			key = self.filter.scrub(entry.daemon)

			# increment the LogHash with the new key
			self.increment(key, entry)

		# Finally, remove valueless lines
		if "#" in self:	
			del self["#"]

class HostHash(SyslogHash):

	def fill(self, log):

		# Create a dictionary with an entry for each line. Increment
		# the value for each time the word is found. Merge lines by
		# Removing numbers and replacing them with a single '#'
		for entry in log:

			# Scrub sections of SyslogEntry which will be used to key the hash
			key = self.filter.scrub(entry.host)

			# increment the LogHash with the new key
			self.increment(key, entry)

		# Finally, remove valueless lines
		if "#" in self:	
			del self["#"]

class WordHash(SuperHash):
	"""
	Subclass which creates a dictionary of words which may hold value in a given log file
	Date, time, and other common words are excluded from the count.
	"""

	def fill(self, log): 

		# Create a dictionary with an entry for each word. Increment
		# the value for each time the word is found
		for entry in log:
	
			# Base the wordcount on the log_entry payload
			for word in entry.log_entry.split():

				# increment the WordHash with the new key
				self.increment(word, word)


		# Perform bleach at the end because it is more efficient
		for key in self.keys():

			# First scrub any unwanted words
			newkey = self.filter.scrub(key)
			if newkey in self:
				self[newkey] = self[newkey] + self[key]
			else:
				self[newkey] = self[key]

			if newkey != key:
				del self[key]

		# Finally, remove valueless lines
		if "#" in self:	
			del self["#"]

class GraphHash(UserDict):

	begin_time = ""
	end_time = ""
	max_value = 0
	min_value = 0
	second = ""
	minute = ""
	hour = ""
	day = ""
	month = ""
	scale = 0.0

	def __init__(self, log, filter, type):

		# Call parent init
		UserDict.__init__(self)

	def increment(self, key, entry):

		# Check to make sure it exists
		if key not in self:
			self[key] = [0, []]

		# Increment the hashed count
		# Create an array of un-hashed values for sampling later
		self[key][0] += 1
		self[key][1].append(entry)

	def zero(self, key, entry):

		# Check to make sure it exists
		if key not in self:
			self[key] = [0, []]
			self[key][1].append(entry)

	def display(self):

		# Declarations & Variables
		graph_height = 6
		graph_width = len(self)
		scale = float(float(self.max_value)/float(graph_height))
		print options.tick

		# Setup tick charachter to use
		if options.tick:
			tick = options.tick[:1]
		else:
			tick = "#"

		# Use wide scale or small scale
		if options.wide:
			char_fill = tick+" "
			char_blank = "  "
		else:
			char_fill = tick
			char_blank = " "
		

		# Create a little space at the top of the screen
		print
		print "Start Time:",self.month, self.day, self.hour+":"+self.minute+":"+self.second,"\t\tMinimum Value:",self.min_value
		print "Duration:",self.duration,"\t\t\tMaximum Value:",self.max_value
		print "Scale:",str(scale)
		print

		# Normalize data
		for key in self.keys():
			if self[key][0] > 0:
				self[key][0] = ceil((float(self[key][0])/float(self.max_value))*graph_height)

		# Print out the dictionary first sorted by the word with
		# the most entries with an alphabetical subsort
		for i in reversed(range(1,graph_height)):
			for key in sorted(self.keys()):
					
				if self[key][0] >= i:
					sys.stdout.write(char_fill)
				else:
					sys.stdout.write(char_blank)
			print

		# Print line of '#' charachters at bottom of screen
		for key in self.keys():
			sys.stdout.write(char_fill)
		print

		# Print marker numbers
		if options.wide:
			transposed_graph_width = (graph_width*2)
			graph_mid = 2
			graph_end = 3
		else:
			transposed_graph_width = graph_width
			graph_mid = 1
			graph_end = 2
			
	 	for i in range(1,transposed_graph_width):
			if i == 1:
				sys.stdout.write("01")
			elif i == (transposed_graph_width/2-graph_mid):
				sys.stdout.write(str(graph_width/2))
			elif i == (transposed_graph_width-graph_end):
				sys.stdout.write(str(graph_width))
			else:
				sys.stdout.write(" ")
		print
			

class SecondsGraph(GraphHash):

	def __init__(self, log):

		# Call parent init
		UserDict.__init__(self)

		# Turn first line into syslog
		if len(log) > 0:
			first_entry = log[0]
		else:
			sys.exit()

		self.second = "00"
		self.minute = first_entry.minute
		self.hour = first_entry.hour
		self.day = first_entry.day
		self.month = first_entry.month
		self.duration = "60 Seconds"

		# Zero out each entry, this will fill in blanks which
		# may be in the log, especailly sparse logs. Also,
		# adds false sample entry for debugging/printing
		for i in range(0, 60):
			# Convert to two digits
			j =   "%.2d" % (i)
			key = self.month+self.day+self.hour+self.minute+j
			self.zero(key, first_entry)

		# Create a dictionary with an entry for each line. Increment
		# the value for each time the word is found. Merge lines by
		# Removing numbers and replacing them with a single '#'
		for entry in log:

			# Create key rooted in time
			key = self.month+self.day+self.hour+self.minute+entry.second

			# Check to make sure there are not more than 60
			# Also, make sure we are on the right
			# month, day, hour, and minute
			if len(self) <= 60 \
				and entry.month == self.month \
				and entry.day == self.day \
				and entry.hour == self.hour \
				and entry.minute == self.minute:
					self.increment(key, entry)

		# find max value of any key
		for key in self.keys():
			if self[key][0] > self.max_value:
				self.max_value = self[key][0]
		for key in self.keys():
			if self[key][0] < self.max_value:
				self.min_value = self[key][0]

class MinutesGraph(GraphHash):

	def __init__(self, log):

		# Call parent init
		UserDict.__init__(self)

		# Turn first line into syslog
		if len(log) > 0:
			first_entry = log[0]
		else:
			sys.exit()

		self.second = "00"
		self.minute = "00"
		self.hour = first_entry.hour
		self.day = first_entry.day
		self.month = first_entry.month
		self.duration = "60 Minutes"

		# Zero out each entry, this will fill in blanks which
		# may be in the log, especailly sparse logs. Also,
		# adds false entry for debugging/printing
		for i in range(0, 60):
			# Convert to two digits
			j =   "%.2d" % (i)
			key = self.month+self.day+self.hour+j
			self.zero(key, first_entry)

		# Create a dictionary with an entry for each line. Increment
		# the value for each time the word is found. Merge lines by
		# Removing numbers and replacing them with a single '#'
		for entry in log:

			# Create key rooted in time
			key = self.month+self.day+self.hour+entry.minute

			# Check to make sure there are not more than 60
			# Also, make sure we are on the right
			# month, day, hour, and minute
			if len(self) <= 60 \
				and entry.month == self.month \
				and entry.day == self.day \
				and entry.hour == self.hour:
					self.increment(key, entry)

		# find max value of any key
		for key in self.keys():
			if self[key][0] > self.max_value:
				self.max_value = self[key][0]

class HoursGraph(GraphHash):

	def __init__(self, log):

		# Call parent init
		UserDict.__init__(self)

		# Turn first line into syslog
		if len(log) > 0:
			first_entry = log[0]
		else:
			sys.exit()

		self.second = "00"
		self.minute = "00"
		self.hour = "00"
		self.day = first_entry.day
		self.month = first_entry.month
		self.duration = "24 Hours"

		# Zero out each entry, this will fill in blanks which
		# may be in the log, especailly sparse logs. Also,
		# adds false entry for debugging/printing
		for i in range(0, 24):
			# Convert to two digits
			j =   "%.2d" % (i)
			key = self.month+self.day+j
			self.zero(key, first_entry)

		# Create a dictionary with an entry for each line. Increment
		# the value for each time the word is found. Merge lines by
		# Removing numbers and replacing them with a single '#'
		for entry in log:

			# Create key rooted in time
			key = self.month+self.day+entry.hour

			# Check to make sure there are not more than 60
			# Also, make sure we are on the right
			# month, day, hour, and minute
			if len(self) <= 24 \
				and entry.month == self.month \
				and entry.day == self.day:
					self.increment(key, entry)

		# find max value of any key
		for key in self.keys():
			if self[key][0] > self.max_value:
				self.max_value = self[key][0]

