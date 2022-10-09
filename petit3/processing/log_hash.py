"""Contains SuperHash and all closely related children"""

import logging
import os
import re
import sys
from collections import UserDict
from random import choice

from .log_crunch import CrunchLog
from .log_entries import (
    ApacheAccessEntry,
    ApacheErrorEntry,
    RawEntry,
    RSyslogEntry,
    SecureLogEntry,
    SnortEntry,
    SyslogEntry,
)
from .log_filter import Filter

logger = logging.getLogger(__name__)

PRECEEDING_DIR = "/var/lib/petit/"
FINGERPRINTS = "fingerprints"

STOPWORDS_HASH = "hash.stopwords"
STOPWORDS_HOST = "host.stopwords"
STOPWORDS_DAEMON = "daemon.stopwords"
STOPWORDS_WORDS = "words.stopwords"


class SuperHash(UserDict):
    """Interface and parent class for all hash/dict based objects."""

    _filter = Filter()
    sample = "none"

    def __init__(self, log, filter_filename=None):

        # Call parent init
        UserDict.__init__(self)

        if log[0] and filter_filename:
            # Setup log and filter
            self._filter = Filter(filter_filename)
            self.fill(log)

        elif log[0]:
            # Setup log without filter
            self.fill(log)

        else:
            # Create empty filter
            pass

    def fill(self, log):
        """Interface method which is flled in by subclasses"""
        pass

    def increment(self, key, entry):
        """Adds a new entry to superhash data structures.
        Similar to append for a list"""

        # Check to make sure it exists
        if key not in self:
            self[key] = [0, []]

        # Increment the hashed count
        # Create an array of un-hashed values for sampling later
        self[key][0] += 1
        self[key][1].append(entry)

    def display(self):
        """Displays all entries held in the SuperHash structure"""

        # Set static sample threshold
        sample_threshold = 3

        # Debugging
        logger.info(f"Sample Type: {self.sample}")

        # Print out the dictionary first sorted by the word with
        # the most entries with an alphabetical subsort
        for key in sorted(sorted(self.keys()), key=lambda x: self[x][0], reverse=True):

            # Print all lines as sample
            if self.sample == "all":
                self.print_entry(self[key][0], choice(self[key][1]).log_entry)

            elif self.sample == "none":
                self.print_entry(self[key][0], str(key))

            elif self.sample == "threshold":
                # Print sample for small values below/equal to threshold
                if self[key][0] <= sample_threshold:
                    self.print_entry(self[key][0], self[key][1][0].log_entry)
                else:
                    self.print_entry(self[key][0], str(key))
            else:
                print(f"That type of sampling is not supported: {self.sample}")
                sys.exit(16)

    def fingerprint(self):
        """
        Remove all fingerprints from a given LogHash and replace with a
        single string"
        """

        # Declarations & Variables
        threshold_coefficient = 0.31
        fingerprints = []
        fingerprint_files = []

        # Load & assign fingerprint files
        prefixes = [
            os.path.join(PRECEEDING_DIR, FINGERPRINTS),  # takes precedence
            f"{os.path.join(os.path.dirname(os.path.dirname(__file__)), FINGERPRINTS)}",
        ]
        prefix = ""

        # Search for fingerprints and load the first one encountered
        for prefix in prefixes:
            if os.path.exists(prefix) and len(os.listdir(prefix)) >= 1:

                # Process in order from largest to smallest which prevents
                # double labeling with similar fingerprints
                fingerprint_files = os.listdir(prefix)
                fingerprint_files = [os.path.join(prefix, f) for f in fingerprint_files]
                fingerprint_files.sort(key=lambda x: os.path.getsize(x))
                break

        if not len(fingerprint_files):
            print(
                f"Could not locate fingerprint files in the following directories: {prefixes}"
            )
            sys.exit(1)

        for fingerprint_file in fingerprint_files:
            # Ensure its a fingerprint file by checking the file prefix
            if re.search(r"\.fp", fingerprint_file):

                # Build a Log for the fingerprint
                log = CrunchLog(fingerprint_file)

                # Build a SuperHash
                x = SuperHash.manufacture(log, STOPWORDS_HASH)

                # Remove the prefix & set name
                x._filter._file = re.sub(prefix + "/", "", fingerprint_file)
                fingerprints.append(x)

        # Iterate each fingerprint
        for fingerprint in fingerprints:

            logger.info("Testing Fingerprint:" + fingerprint._filter._file)

            # Reset counter for each fingerprint
            count = 0
            threshold = len(fingerprint) * threshold_coefficient
            logger.info("Threshold:" + str(threshold))

            # Look for fingerpring
            for key in list(fingerprint.keys()):
                if key in self:
                    count = count + 1

                # If Threshold is reached, remove everyline of fingerprint
                # Saves time on searching every entry
                if count > threshold:
                    logger.info("Found Fingerprint:" + fingerprint._filter._file)
                    for key in list(fingerprint.keys()):
                        # Key found, plenty to remove
                        if key in self:
                            del self[key]

                    # Force the sample entry to be the same as the key
                    # and based off of the filename of the fingerprint
                    fingerprint[key][1][0].log_entry = fingerprint._filter._file
                    self.increment(fingerprint._filter._file, fingerprint[key][1][0])
                    break

            logger.info("Count: " + str(count))

    def cleanup(self):
        """Removes meaningless entries

        This function removes meaningless entries that contain only
        the following characters: #,[,(,) and :

        """
        for k in list(self.keys()):
            cs = "".join(sorted(set(k)))
            if re.match(r"#*\[?\]?\(?\)?:?$", cs):
                del self[k]

    @staticmethod
    def print_entry(cnt, entry):
        cnt = str(cnt) + ":"
        print(f"{cnt:<8}{entry}")

    @staticmethod
    def manufacture(log, _filter):
        """Factory method which creates new SuperHash of correct subtype"""

        # Select the correct build method
        if log.contains(SyslogEntry):
            LogHash = SyslogHash
        elif log.contains(RSyslogEntry):
            LogHash = SyslogHash
        elif log.contains(ApacheAccessEntry):
            LogHash = ApacheLogHash
        elif log.contains(ApacheErrorEntry):
            LogHash = ApacheLogHash
        elif log.contains(SnortEntry):
            LogHash = SnortLogHash
        elif log.contains(RawEntry):
            LogHash = RawLogHash
        elif log.contains(SecureLogEntry):
            LogHash = SecureLogHash
        else:
            print(
                "Could not determine what type of objects are contained in generic Log"
            )
            sys.exit(15)

        # Build and return the correct subclass instance based on log file type
        return LogHash(log, _filter)


class SyslogHash(SuperHash):
    """Overrides the fill method specifically for LogHashes built from Syslog files"""

    def fill(self, log):
        # Create a dictionary with an entry for each line. Increment
        # the value for each time the word is found. Merge lines by
        # Removing numbers and replacing them with a single '#'
        for entry in log:

            # Scrub sections of SyslogEntry which will be used to key the hash
            key = self._filter.scrub(entry.daemon + " " + entry.log_entry)

            # increment the LogHash with the new key
            self.increment(key, entry)

        self.cleanup()


class ApacheLogHash(SuperHash):
    """Overrides the fill method specifically for LogHashes built from Apache logs"""

    def fill(self, log):
        # Create a dictionary with an entry for each line. Increment
        # the value for each time the word is found. Merge lines by
        # Removing numbers and replacing them with a single '#'
        for entry in log:

            # Scrub sections of SyslogEntry which will be used to key the hash
            key = self._filter.scrub(entry.log_entry)

            # increment the LogHash with the new key
            self.increment(key, entry)

        self.cleanup()


class SnortLogHash(SuperHash):
    """Overrides the fill method specifically for LogHashes built from Snort logs"""

    def fill(self, log):
        # Create a dictionary with an entry for each line. Increment
        # the value for each time the word is found. Merge lines by
        # Removing numbers and replacing them with a single '#'
        for entry in log:

            # Scrub sections of SyslogEntry which will be used to key the hash
            key = self._filter.scrub(entry.log_entry)

            # increment the LogHash with the new key
            self.increment(key, entry)

        self.cleanup()


class SecureLogHash(SuperHash):
    """Overrides the fill method specifically for LogHashes built from Syslog files"""

    def fill(self, log):
        # Create a dictionary with an entry for each line. Increment
        # the value for each time the word is found. Merge lines by
        # Removing numbers and replacing them with a single '#'
        for entry in log:

            # Clean up the log entry better since it is a secure log hash

            ## Session Entries
            entry.log_entry = re.sub(
                "session closed for.*", "session closed for #", entry.log_entry
            )
            entry.log_entry = re.sub(
                "session opened for.*", "session opened for #", entry.log_entry
            )

            ## Auth Entries
            entry.log_entry = re.sub(
                "Accepted publickey for.*",
                "Accepted publickey for #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "Accepted password for.*",
                "Accepted password for #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "Postponed publickey for.*",
                "Postponed publickey for #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "input_userauth_request: invalid user.*",
                "input_userauth_request: invalid user #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "Invalid user.*", "Invalid user #", entry.log_entry
            )
            entry.log_entry = re.sub(
                "reverse mapping checking getaddrinfo for.*",
                "reverse mapping checking getaddrinfo for #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "Connection closed by.*",
                "Connection closed by #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "Failed password for invalid user.*",
                "Failed password for invalid user #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "Failed password for.*from.*",
                "Failed password for # from #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "error retrieving information about user.*",
                "error retrieving information about user #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "authentication failure.*",
                "authentication failure #",
                entry.log_entry,
            )

            ## Misc
            entry.log_entry = re.sub(
                "Received disconnect from.*",
                "Received disconnect from #",
                entry.log_entry,
            )
            entry.log_entry = re.sub(
                "Could not reverse map address.*",
                "Could not reverse map address #",
                entry.log_entry,
            )
            # entry.log_entry = re.sub("", "", entry.log_entry)

            # Scrub sections of SyslogEntry which will be used to key the hash
            key = self._filter.scrub(entry.daemon + " " + entry.log_entry)

            # increment the LogHash with the new key
            self.increment(key, entry)

        self.cleanup()


class RawLogHash(SuperHash):
    """Overrides the fill method specifically for LogHashes built from text files without date/time"""

    def fill(self, log):
        # Create a dictionary with an entry for each line. Increment
        # the value for each time the word is found. Merge lines by
        # Removing numbers and replacing them with a single '#'
        for entry in log:

            # Scrub sections of SyslogEntry which will be used to key the hash
            key = self._filter.scrub(entry.log_entry)

            # increment the LogHash with the new key
            self.increment(key, entry)

        self.cleanup()


class DaemonHash(SyslogHash):
    """Overides the fill method specifically for a DaemonHashes built from text files with date/time"""

    def fill(self, log):

        # Create a dictionary with an entry for each line. Increment
        # the value for each time the word is found. Merge lines by
        # Removing numbers and replacing them with a single '#'
        for entry in log:

            # Scrub sections of SyslogEntry which will be used to key the hash
            key = self._filter.scrub(entry.daemon)

            # increment the LogHash with the new key
            self.increment(key, entry)

        self.cleanup()


class HostHash(SyslogHash):
    """Overides the fill method specifically for a HostHashes built from text files with date/time"""

    def fill(self, log):

        # Create a dictionary with an entry for each line. Increment
        # the value for each time the word is found. Merge lines by
        # Removing numbers and replacing them with a single '#'
        for entry in log:

            # Scrub sections of SyslogEntry which will be used to key the hash
            key = self._filter.scrub(entry.host)

            # increment the LogHash with the new key
            self.increment(key, entry)

        self.cleanup()


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
        for key in list(self.keys()):
            # First scrub any unwanted words
            newkey = self._filter.scrub(key)

            # Nothing was scrubbed
            if newkey == key:
                continue

            # Add scrubbed result
            if newkey in self:
                # Correct way of adding up
                self[newkey][0] += self[key][0]
                self[newkey][1].append(self[key][1])

            else:
                self[newkey] = self[key]

            # Remove non-scrubbed entry
            del self[key]

        self.cleanup()
