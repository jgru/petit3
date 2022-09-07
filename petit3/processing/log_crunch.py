"""Generic log class which contains a payload of objects that conform
to the LogEntry specification. Log, which is a list of type LogEntry,
is relied upon and consumed to build any of the XHash objects such as
SuperHash or GraphHash.

"""

import datetime
import logging
import random
import re
import sys
from collections import UserList
from contextlib import contextmanager


class Tally:

    matrix = {}
    tally_threshold = 0

    def __init__(self, entry_types, max_sample_lines):

        self.matrix = {}
        self.max_sample_lines = max_sample_lines
        self.tally_threshold = max_sample_lines / 4

        for entry_type in entry_types:
            self.matrix[entry_type] = 0

    def append(self, entry_type):
        self.matrix[entry_type] += 1

    def is_type(self, entry_type):

        # Setup the correct tally logic method
        tally_logic = entry_type.tally_logic

        m = self.matrix[entry_type]
        th = self.tally_threshold
        msl = self.max_sample_lines

        if tally_logic(m, th, msl):
            return True
        else:
            return False


class CrunchLog(UserList):
    """
    Class which extends UserList to provide robust in memory log object
    """

    def __init__(self, f=""):
        UserList.__init__(self)

        buf = []

        with CrunchLog.stream(f) as _in:
            for line in _in:
                buf.append(line)

        if len(buf) < 1:
            print("No data found")
            sys.exit()

        # Automatically select log format
        self.Entry = self.select_log_format(buf)

        # Save for introspective purpose
        self.payload_type = self.Entry.__name__
        self.file_name = f
        self.build_date = datetime.datetime.now()

        # Build from entry type
        counter = 0
        for line in buf:
            try:
                self.append(self.Entry(line))
                counter += 1
            except (ValueError, TypeError):
                print("Cannot parse values on line: " + str(counter))
                sys.exit()

        del buf

    @staticmethod
    def populate_entry_types(log_entry_module="petit3.processing.log_entries"):
        """
        Collects all known types of log entries from the log_entry_module
        """

        entry_types = [
            cls
            for name, cls in inspect.getmembers(
                sys.modules[log_entry_module], inspect.isclass
            )
            if name != "LogEntry"
        ]

        entry_types.sort(key=lambda x: x.order, reverse=True)

        return entry_types

    @contextmanager
    @staticmethod
    def stream(s):
        if s == "<stdin>":
            yield sys.stdin
        else:
            with open(s, "r") as f:
                yield f

    def select_log_format(self, buf):
        """
        Determines which type of entry to use when building CrunchLog by
        by sampling the buffer and using a quarum based on votes for each
        log type
        """
        assert len(buf) >= 1, "Buf is empty"

        sample_lines = []
        max_sample_lines = 10
        entry_types = CrunchLog.populate_entry_types()
        t = Tally(entry_types, max_sample_lines)

        # Keep building samples until we get a good set
        while True:

            # Get X number of samples
            for i in range(0, max_sample_lines):
                sample_lines.append(random.choice(buf).split())

            # Build tallies for the collected samples
            for line in sample_lines:
                for entry_type in entry_types:
                    if entry_type.is_type(line):
                        t.append(entry_type)
                        break

            # Tally logic is determined by driver
            for entry_type in entry_types:
                if t.is_type(entry_type):
                    logging.info(
                        "Determined "
                        + str(entry_type)
                        + ": "
                        + str(t.matrix[entry_type])
                    )

                    return entry_type

    def contains(self, obj):
        """Determine what kind of objects are contained in this Log"""
        if len(self) >= 1:
            return isinstance(self[len(self) - 1], obj)
        else:
            return False

    def display(self):
        """Simple display function to show entire log"""
        for entry in self:
            entry.display()

    def subset(self, string):
        """Return Log object with subset of entries based on a filter"""

        newlog = CrunchLog()
        for entry in self:
            if re.search(string, entry.log_entry):
                newlog.append(entry)

        return newlog


import inspect
