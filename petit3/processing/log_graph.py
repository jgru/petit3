import datetime
import logging
import sys
from collections import UserDict
from math import ceil

logger = logging.getLogger()

class GraphHash(UserDict):
    """Interface class used to control structure & use of all GraphHash subtypes"""

    max_value = 0
    min_value = 0
    scale = 0.0
    tick = "#"
    wide = False
    def __init__(self, log, duration, unit):
        # Call parent init
        UserDict.__init__(self)

        # Turn first line into syslog
        if len(log) > 0:
            self.first_entry = log[-1]
        else:
            sys.exit()

        self.unit = unit
        self.duration = duration


        self.start_date, self.middle_date = None, None

        self.end_date = datetime.datetime(
            int(self.first_entry.year),
            int(self.first_entry.month),
            int(self.first_entry.day),
            int(self.first_entry.hour),
            int(self.first_entry.minute),
            int(self.first_entry.second),
        )

        # Create a dictionary with an entry for each line.
        for entry in log:
            # Create key rooted in time
            key = self.create_key(entry)
            logger.debug(key)
            self.increment(key)

    def build_date_range(self):

        self.end_key = self.create_key(self.end_date)
        logger.info(f"End key {self.end_key}")

        self.duration = self.duration

        # Save final values
        self.start_date, self.middle_date = (
            self.calc_dates(self.end_date, self.unit, self.duration)
        )

    def create_key(self, entry):
        return (
            f"{entry.year}{entry.month:02d}{entry.day:02d}"
            f"{entry.hour:02d}{entry.minute:02d}{entry.second:02d}"
        )

    def get_timedelta(self, i):
        return {"seconds" : i}

    def increment(self, key):
        """Adds new entry. Similar to append method on list"""

        # Check to make sure it exists
        if key not in self:
            self[key] = 0

        # Increment the hashed count
        # Create an array of un-hashed values for sampling later
        self[key] += 1

    def zero(self, key):
        """Creates empty entry"""

        # Check to make sure it exists
        if key not in self:
            self[key] = 0

    def build_calculations(self):
        """Calculates and saves important graph information"""

        # find max value of any key
        for key in list(self.keys()):
            if self[key] > self.max_value:
                self.max_value = self[key]

        # find the minimum value of any key
        self.min_value = self.max_value
        for key in list(self.keys()):
            if self[key] < self.min_value:
                self.min_value = self[key]

    def display(self):
        """Common display function used by all graph subtypes"""

        # Declarations & Variables
        graph_height = 6
        graph_width = len(self)
        scale = float(
            float(self.max_value - self.min_value) / float(graph_height)
        )
        graph_position = {}
        graph_value = {}

        # Debug output
        logger.debug("length: " + str(graph_width))

        # Use wide scale or small scale
        if self.wide:
            char_fill = self.tick + " "
            char_blank = "  "
        else:
            char_fill = self.tick
            char_blank = " "

        # Calculate the graph min/max, so that the information is better normalized
        graph_min_value = self.min_value
        graph_max_value = self.max_value

        # Find the real minimum, could very well be zero
        graph_min_value = self.max_value
        for key in list(self.keys()):
            if self[key] < graph_min_value:
                graph_min_value = self[key]

        # Check if it should be normalized
        if graph_min_value == 0:

            # Recalculate
            graph_min_value = self.max_value
            for key in list(self.keys()):
                if self[key] < graph_min_value and self[key] != 0:
                    graph_min_value = self[key] / 2
                    print(graph_min_value)

        # Normalize data
        for key in list(self.keys()):
            if self[key] > 0:

                # Ensure difference between min/max or don't normalize
                if graph_max_value > graph_min_value:
                    self[key] = ceil(
                        (
                            float(self[key] - graph_min_value)
                            / float(graph_max_value - graph_min_value)
                        )
                        * graph_height
                    )

                # Normalize because of difference between min/max
                else:
                    self[key] = ceil(
                        (float(self[key]) / float(graph_max_value))
                        * graph_height
                    )

        # Start Graph Printing
        print()

        # Print out the dictionary first sorted by the word with
        # the most entries with an alphabetical subsort
        for i in reversed(list(range(1, graph_height))):
            for key in sorted(self.keys()):
                if self[key] >= i:
                    print(char_fill, end="")
                else:
                    print(char_blank, end="")
            print()

        # Print line of '#' charachters at bottom of screen
        for key in list(self.keys()):
            print(char_fill, end="")
        print()

        # Determine numbers for normal and wide graphs
        if self.wide:

            graph_width = graph_width * 2

            # Calculate Positions
            graph_position["begin"] = 1
            graph_position["middle"] = graph_width / 2 - (
                (graph_width / 2) % 2
            )
            graph_position["end"] = graph_width - 3

        else:

            # Calculate Positions
            graph_position["begin"] = 1
            graph_position["middle"] = graph_width / 2
            graph_position["end"] = graph_width - 2

        # Calculate Values
        graph_value["begin"] = eval("self.start_date." + self.unit[:-1])
        graph_value["middle"] = eval("self.middle_date." + self.unit[:-1])
        graph_value["end"] = eval("self.end_date." + self.unit[:-1])

        # Draw numbers at bottom of the screen
        for i in range(1, graph_width):

            # Beginning
            if i == graph_position["begin"]:
                print(str("%.2d" % (graph_value["begin"] % 2000)), end="")
            # Half
            elif i == graph_position["middle"]:
                print(str("%.2d" % (graph_value["middle"] % 2000)), end="")
            # Last
            elif i == graph_position["end"]:
                print(str("%.2d" % (graph_value["end"] % 2000)), end="")
            else:
                print(" ", end="")
        print()

        # Create a little space at the top of the screen
        print()
        print(
            "Start Time:\t",
            str(self.start_date),
            "\t\tMinimum Value:",
            self.min_value,
        )
        print(
            "End Time:\t",
            str(self.end_date),
            "\t\tMaximum Value:",
            self.max_value,
        )

        print(
            "Duration:\t",
            str(self.duration),
            self.unit + "s",
            f"\t\t\tScale: {scale:.12f}"
        )
        print()

    def calc_dates(self, end_date, unit, duration):
        start_date, middle_date = None, None

        # Zero out each entry, this will fill in blanks which
        # may be in the log, especially sparse logs.
        for i in range(0, duration):
            # Calculate the current date, the last one will be the end date
            start_date = end_date - datetime.timedelta(**(self.get_timedelta(i)))
            start_key = self.create_key(start_date)

            self.zero(start_key)

            # Check for middle date and save
            if i == (self.duration // 2):
                middle_date = start_date
        logger.info(f"Start key {start_key}")
        return start_date, middle_date

class SecondsGraph(GraphHash):
    """60 second graph subtype"""

    def __init__(self, log):

        # Call parent init
        super().__init__(log, 60, "seconds")

        self. build_date_range()
        self.build_calculations()


class MinutesGraph(GraphHash):
    """60 minute graph subtype"""

    def __init__(self, log):
        # Call parent init
        super().__init__(log, 60, "minutes")

        self.end_date.replace(second=0)

        self.build_date_range()
        print(self.start_date)
        print(self.end_date)
        self.build_calculations()


    def create_key(self, entry):
        return (
            str(entry.year)
            + str("%.2d" % (entry.month))
            + str("%.2d" % (entry.day))
            + str("%.2d" % (entry.hour))
            + str("%.2d" % (entry.minute))
        )

    def get_timedelta(self, i):
        return {"minutes": i}

class HoursGraph(GraphHash):
    """24 hour graph subtype"""

    def __init__(self, log):
        # Call parent init
        super().__init__(log, 24, "hours")
        self.end_date.replace(second=0, minute=0)

        self. build_date_range()
        self.build_calculations()


    def create_key(self, entry):
        return (
            str(entry.year)
            + str("%.2d" % (entry.month))
            + str("%.2d" % (entry.day))
            + str("%.2d" % (entry.hour))
        )

    def get_timedelta(self, i):
        return {"hours": i}

class DaysGraph(GraphHash):
    """30 day graph subtype"""


    def __init__(self, log):
        # Call parent init
        super().__init__(log, 31, "days")
        self.end_date.replace(second=0, minute=0, hour=0)

        self. build_date_range()
        self.build_calculations()

    def create_key(self, entry):
        return (
            str(entry.year)
            + str("%.2d" % (entry.month))
            + str("%.2d" % (entry.day))
        )

    def get_timedelta(self, i):
        return {"days": i}

class MonthsGraph(GraphHash):
    """12 month graph subtype"""

    def __init__(self, log):
        # Call parent init
        super().__init__(log, 12, "months")
        self.end_date.replace(second=0, minute=0, hour=0, day=1)

        self. build_date_range()
        self.build_calculations()

    def create_key(self, entry):
        return (
            str(entry.year)
            + str("%.2d" % (entry.month))
        )

    def get_timedelta(self, i):
        return {"days": i * 365 / 12 + 1}

class YearsGraph(GraphHash):
    """10 year graph subtype"""
    def __init__(self, log):
        # Call parent init
        super().__init__(log, 10, "years")
        self.end_date.replace(second=0, minute=0, hour=0, day=1, month=1)

        self. build_date_range()
        self.build_calculations()

    def create_key(self, entry):
        return (
            str(entry.year)
            + str("%.2d" % (entry.month))
            + str("%.2d" % (entry.day))
        )
    def get_timedelta(self, i):
        return {"days": i * 365}
