import datetime
import logging
import re
import time

logger = logging.getLogger(__name__)

class LogEntry:
    """Interface class which specifies generic log format for consumption
    by other classes"""

    year = 0
    month = 0
    day = 0
    hour = 0
    minute = 0
    second = 0
    host = 0
    daemon = 0
    log_entry = 0

    def display(self):
        print(
            "Year: ",
            self.year,
            "Month:",
            self.month,
            "Day:",
            self.day,
            "Hour:",
            self.hour,
            "Minute:",
            self.minute,
            "Second:",
            self.second,
            "Host:",
            self.host,
            "Payload",
            self.log_entry,
        )

    @staticmethod
    def tally_logic(tally, tally_threshold, max_sample_lines):
        if tally > tally_threshold:
            return True
        else:
            return False

    def set_abnormal(self, value):
        (
            self.year,
            self.month,
            self.day,
            self.hour,
            self.minute,
            self.second,
            self.host,
            self.daemon,
        ) = [1900, 1, 1, 1, 1, 1, "#", "#"]
        self.log_entry = " ".join(value)

    def set_blank(self):
        (
            self.year,
            self.month,
            self.day,
            self.hour,
            self.minute,
            self.second,
            self.host,
            self.daemon,
        ) = [1900, 1, 1, 1, 1, 1, "#", "#"]
        self.log_entry = "#"


class SyslogEntry(LogEntry):
    """Driver for Syslog. Conforms to LogEntry interface class."""

    order = 0

    def __init__(self, line):

        # Split the line up
        value = line.split()

        # Should be normal log entry
        if len(value) >= 5:

            # Syslog does not store year information so, set to current year
            self.year = str(datetime.date.today().year)
            self.month, self.day, clocktime, self.host, self.daemon = value[:5]
            self.log_entry = " ".join(value[5:])
            self.hour, self.minute, self.second = clocktime.split(":")

            # Convert month to integer
            self.month = str(time.strptime(self.month, "%b")[1])

            # Normalize integers to standard widths and convert to strings
            self.year = int(self.year)
            self.month = int(self.month)
            self.day = int(self.day)
            self.hour = int(self.hour)
            self.minute = int(self.minute)
            self.second = int(self.second)

        # Abnormal log entry
        elif len(value) >= 1:
            (
                self.year,
                self.month,
                self.day,
                self.hour,
                self.minute,
                self.second,
                self.host,
                self.daemon,
            ) = [1900, 1, 1, 1, 1, 1, "#", "#"]
            self.log_entry = " ".join(value)

        # Blank line, will be sorted out by scrub
        else:
            (
                self.year,
                self.month,
                self.day,
                self.hour,
                self.minute,
                self.second,
                self.host,
                self.daemon,
         ) = [1900, 1, 1, 1, 1, 1, "#", "#"]
            self.log_entry = "#"

    @staticmethod
    def is_type(line):
        """Standard function from interface class to determine type"""

        if len(line) >= 6:

            # Look for something similar to: "Feb 29 11:53:08" in first
            # three columns
            if (
                re.search(r"[A-Z][a-z]{2}", line[0])
                and re.search(r"[0-9][0-9]?", line[1])
                and re.search(r"[0-9{2}:[0-9]{2}:[0-9]{2}", line[2])
                and not (
                    re.search(r"^pam_", line[5])
                    or re.search(r"^sshd\[", line[4])
                )
            ):
                return True
            else:
                return False
        else:
            return False


class RSyslogEntry(LogEntry):
    """Driver for RSyslog. Conforms to LogEntry interface class."""

    order = 0

    def __init__(self, line):

        # Split the line up
        value = line.split()

        # Should be normal log entry
        if len(value) >= 5:

            # Complete major splits: 2010-06-24T17:56:32.197716-04:00
            date, rtime = value[0].split("T")  # Raw time

            # High precision time with timezone info: 17:56:32.197716-04:00
            hptime, offset = rtime.split("-")

            # Patch for mixed enviornments, milliseconds do not get logged
            # if older Ubuntu 8.04 boxes log to a newer 10.04 server with
            # Rsyslog precision time on.
            if re.search(r"[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{6}", hptime):
                time, mseconds = hptime.split(".")  # Miliseconds
            else:
                time = hptime

            # Complete secondary splits
            self.year, self.month, self.day = date.split("-")
            self.hour, self.minute, self.second = time.split(":")
            self.host = value[1]
            self.daemon = value[2]
            self.log_entry = " ".join(value[3:])

            # Normalize integers to standard widths and convert to strings
            self.year = int(self.year)
            self.month = int(self.month)
            self.day = int(self.day)
            self.hour = int(self.hour)
            self.minute = int(self.minute)
            self.second = int(self.second)

        # Abnormal log entry
        elif len(value) >= 1:
            (
                self.year,
                self.month,
                self.day,
                self.hour,
                self.minute,
                self.second,
                self.host,
                self.daemon,
            ) = [1900, 1, 1, 1, 1, 1, "#", "#"]
            self.log_entry = " ".join(value)

        # Blank line, will be sorted out by scrub
        else:
            (
                self.year,
                self.month,
                self.day,
                self.hour,
                self.minute,
                self.second,
                self.host,
                self.daemon,
            ) = [1900, 1, 1, 1, 1, 1, "#", "#"]
            self.log_entry = "#"

    @staticmethod
    def is_type(line):
        """Standard function from interface class to determine type"""

        if len(line) >= 1:

            # Look for something similar to: "2011-04-04T"
            if re.search("[0-9]{4}-[0-9]{2}-[0-9]{2}T", line[0]):
                return True
            else:
                return False
        else:
            return False


class ApacheAccessEntry(LogEntry):
    """Driver for Apache Access formatted log files"""

    order = 0

    def __init__(self, line):

        # Split the line up
        value = line.split()

        # Should be normal log entry
        if len(value) >= 12:
            # Grab major chunks from the line
            (
                rhost,
                ident,
                ruser,
                apachedate,
                junk,
                junk2,
                uri,
                protocol,
                status,
                bytes,
                referer,
                agent,
            ) = value[:12]
            self.log_entry = uri

            # Split up something that looks like this: [03/Aug/2009:11:53:08
            datetime = apachedate.split(":")
            date = datetime[0]
            self.hour = datetime[1]
            self.minute = datetime[2]
            self.second = datetime[3]
            dmy = date.split("/")
            self.day = re.sub(r"\[", "", dmy[0])
            self.month = dmy[1]
            self.year = dmy[2]
            self.host = uri
            daemon = "webserver"

            # Convert month to integer
            self.month = time.strptime(self.month, "%b")[1]

            # Normalize integers to standard widths and convert to strings
            self.year = int(self.year)
            self.month = int(self.month)
            self.day = int(self.day)
            self.hour = int(self.hour)
            self.minute = int(self.minute)
            self.second = int(self.second)
            
        # Abnormal log entry
        elif len(value) >= 1:
            self.set_abnormal(value)

        # Blank line, will be sorted out by scrub
        else:
            self.set_blank()

    @staticmethod
    def is_type(line):
        """Standard function from interface class to determine type"""

        if len(line) >= 4:

            # Look for: "03/Aug/2009:11:53:08" in forth column
            r = r"[0-9]{2}/[a-zA-Z]{3}/[0-9]{4}:[0-9{2}:[0-9]{2}:[0-9]{2}"
            if re.search(r, line[3]):
                return True
            else:
                return False
        else:
            return False


class ApacheErrorEntry(LogEntry):
    """Driver for Apache Error formatted log files"""

    order = 0

    def __init__(self, line):

        # Split the line up
        value = line.split()

        # Should be normal log entry
        if len(value) >= 5:
            # Grab major chunks from the line
            # Split up something that looks like this:
            # [Sat Feb 27 12:16:10 2010]
            junk, self.month, self.day, clocktime, self.year = value[:5]
            self.log_entry = " ".join(value[5:])
            self.hour, self.minute, self.second = clocktime.split(":")

            # Convert month to integer
            self.month = time.strptime(self.month, "%b")[1]

            # Clean up the year field
            self.year = re.sub(r"\]", "", self.year)

            # Normalize integers to standard widths and convert to strings
            self.year = int(self.year)
            self.month = int(self.month)
            self.day = int(self.day)
            self.hour = int(self.hour)
            self.minute = int(self.minute)
            self.second = int(self.second)
        # Abnormal log entry
        elif len(value) >= 1:
            self.set_abnormal(value)

        # Blank line, will be sorted out by scrub
        else:
            self.set_blank()

    @staticmethod
    def is_type(line):
        """Standard function from interface class to determine type"""

        if len(line) >= 5:

            # Look for : [Sat Feb 27 12:16:10 2010]
            if (
                re.search(r"[\[a-zA-Z]{3}", line[0])
                and re.search(r"[0-9]{2}:[0-9]{2}:[0-9]{2}", line[3])
                and re.search(r"[0-9]{4}", line[4])
            ):
                return True
            else:
                return False
        else:
            return False


class SecureLogEntry(LogEntry):
    """Driver for Syslog. Conforms to LogEntry interface class."""

    order = 0

    def __init__(self, line):

        # Split the line up
        value = line.split()

        # Should be normal log entry
        if len(value) >= 5:
            # Syslog does not store year information so, set to current year
            self.year = str(datetime.date.today().year)
            self.month, self.day, clocktime, self.host, self.daemon = value[:5]
            self.log_entry = " ".join(value[5:])
            self.hour, self.minute, self.second = clocktime.split(":")

            # Convert month to integer
            self.month = str(time.strptime(self.month, "%b")[1])

            # Normalize integers to standard widths
            self.year = int(self.year)
            self.month = int(self.month)
            self.day = int(self.day)
            self.hour = int(self.hour)
            self.minute = int(self.minute)
            self.second = int(self.second)
            
        # Abnormal log entry
        elif len(value) >= 1:
            self.set_abnormal(value)

        # Blank line, will be sorted out by scrub
        else:
            self.set_blank()

    @staticmethod
    def is_type(line):
        """Standard function from interface class to determine type"""

        if len(line) >= 6:

            # Look for something similar to: "29 11:53:08" in third column
            if (
                re.search(r"[0-9][0-9]?", line[1])
                and re.search(r"[0-9{2}:[0-9]{2}:[0-9]{2}", line[2])
                and (
                    re.search(r"^pam_", line[5])
                    or re.search(r"^sshd\[", line[4])
                )
            ):
                return True
            else:
                return False
        else:
            return False

    @staticmethod
    def tally_logic(tally, tally_threshold, max_sample_lines):
        """Override tally logic for secure logs"""

        if tally >= max_sample_lines:
            return True
        else:
            return False


class ScriptlogEntry(LogEntry):
    """
    Driver for scriptlog entries. Conforms to LogEntry interface class.
    This allows for a standard syslog entry to have extra fields which
    are used with scriptlogs.
    """

    order = 0

    # Extra variables
    label = "__none__"
    id = "__none__"
    type = "__none__"

    def __init__(self, line):

        # Split the line up
        value = line.split()

        # Should be normal log entry
        if len(value) >= 5:

            # Syslog does not store year information so scriptlog does not
            # So set to current year, set the other fields normally
            self.year = datetime.date.today().year
            (
                self.month,
                self.day,
                time,
                self.host,
                self.daemon,
                self.label,
                self.id,
                self.type,
            ) = value[:8]

            self.log_entry = " ".join(value[8:])
            self.hour, self.minute, self.second = time.split(":")

            # Normalize integers to standard widths and convert to strings
            self.year = int(self.year)
            self.month = int(self.month)
            self.day = int(self.day)
            self.hour = int(self.hour)
            self.minute = int(self.minute)
            self.second = int(self.second)
            
        # Abnormal log entry
        elif len(value) >= 1:
            self.set_abnormal(value)

        # Blank line, will be sorted out by scrub
        else:
            self.set_blank()

    @staticmethod
    def is_type(line, label="__none__"):
        """Standard function from interface class to determine type"""

        # Split the line up
        value = str(line).split()

        if len(value) >= 8:

            # Look for special label to determine scriptlog type
            if re.search(re.escape(value[5]), re.escape(label)):
                return True
            else:
                return False
        else:
            return False


class SnortEntry(LogEntry):
    """
    Driver for Snort formatted log files. Conforms to LogEntry interface class.
    """

    order = 0

    def __init__(self, line):

        # Split the line up
        value = line.split()

        # Should be normal log entry
        if len(value) >= 2:

            # Snort does not store year information so, set to current year
            self.year = datetime.date.today().year

            # Initial break down
            snortdate = value[:1]
            self.log_entry = " ".join(value[1:])

            # Looks like "09/29-10:18:46.026172"
            snortdate, junk = snortdate[0].split(".")

            # Looks like "09/29-10:18:46"
            self.month, snortdate = snortdate.split("/")

            # Looks like "29-10:18:46"
            self.day, snortdate = snortdate.split("-")

            # Looks like "10:18:46"
            self.hour, self.minute, self.second = snortdate.split(":")

            # Normalize integers to standard widths and convert to strings
            self.year = int(self.year)
            self.month = int(self.month)
            self.day = int(self.day)
            self.hour = int(self.hour)
            self.minute = int(self.minute)
            self.second = int(self.second)

        # Abnormal value
        elif len(value) >= 1:
            self.set_abnormal(value)

        # Blank line, will be sorted out by scrub
        else:
            self.set_blank()

    @staticmethod
    def is_type(line):

        if len(line) >= 4:

            # Look for : "09/29-10:18:46.026172" in first column
            r = r"[0-9]{2}\/[0-9]{2}\-[0-9]{2}\:[0-9]{2}\:[0-9]{2}\.[0-9]{6}"
            if re.search(r, line[0]):
                return True
            else:
                return False
        else:
            return False


# This must be the last class in here, for last resort logic!
class RawEntry(LogEntry):
    """
    Driver for Raw log files. Conforms to LogEntry interface class.
    This also allows raw logs to contain all of the correct fields
    to be worked with just like other entries that actually have time
    values
    """

    order = -1

    def __init__(self, line):

        # Split the line up
        value = line.split()

        # Fake the time/date values, put the entire line in the key
        if len(value) >= 1:
            self.set_abnormal(value)

        # Blank line, will be sorted out by scrub
        else:
            self.set_blank()

    @staticmethod
    def is_type(line):
        """
        Do minimum checking to ensure there is some data
        """

        if len(line) >= 1:

            # Look for any length of text in the line
            if re.search(".+", str(line)):
                return True
            else:
                return False
        else:
            return False
