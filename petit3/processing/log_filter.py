"""Defines filter class for use with SuperHash"""

import logging
import os
import re
import sys

logger = logging.getLogger(__name__)

PRECEEDING_DIR = "/var/lib/petit/"
FILTERS = "filters"


class Filter:
    """Filter object used to load filters into memory once, to save on file operations"""

    _file = ""

    _dirs = [
        os.path.join(PRECEEDING_DIR, FILTERS),  # takes precedence
        f"{os.path.dirname(os.path.dirname(__file__))}/filters/",
    ]

    stopwords = []

    def __init__(self, _file=None):

        for _dir in self._dirs:
            if not _file:
                return

            # Set class variable to file & path
            self._file = os.path.join(_dir + _file)
            self.stopwords = []

            re.purge()  # Clear re cache

            # Open the file and get each stopword or regex
            if os.path.exists(self._file):
                try:
                    with open(self._file) as f:
                        for line in f.readlines():
                            # Read entire contents into array for speed
                            # Save them as compiled regexes for speed
                            self.stopwords.append(re.compile(line.rstrip(), re.DOTALL))
                    break

                except IOError:
                    print("Could not open Filter file", self._file)
                    sys.exit(16)

        logger.info("Filter File: " + str(self._file))

    def scrub(self, string):
        """Used to remove entries and replace them with the scrub character"""
        # Check each stopword against each key
        for stopword in self.stopwords:
            # Replace matches with hash signs
            old_string = string
            string = re.sub(stopword, "#", string)
            logger.debug(
                " SCRUBBING "
                + old_string
                + " OF "
                + stopword.pattern
                + " BECOMES "
                + string
            )

        return string
