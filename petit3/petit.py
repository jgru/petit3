#!/usr/bin/python3
"""Log & text analysis tool for systems administrators and
investigators


This logtool provides trimming and analysis of ascii based log files
such as syslog. Different options allow different types of analysis
such as line hashing, hash counting, and word usage counting. These
options can be used to determine WHAT is normal and WHAT to look for.

"""
import logging
import signal
import sys

from .processing import log_hash

__author__ = "Scott McCarty"
__copyright__ = "Copyright 2009, Scott McCarty"
__license__ = "LGPL"
__version__ = "3.0"
__maintainer__ = "Scott McCarty"
__email__ = "scott.mccarty@gmail.com"
__status__ = "Production"

import argparse

from .processing.log_crunch import CrunchLog
from .processing.log_graph import (DaysGraph, HoursGraph, MinutesGraph,
                                   MonthsGraph, SecondsGraph, YearsGraph)
from .processing.log_hash import DaemonHash, HostHash, SuperHash, WordHash

logger = logging.getLogger()

# Process Signal
def sigint_handler(signal, frame):
    sys.exit(0)


## Exit when control-C is pressed
signal.signal(signal.SIGINT, sigint_handler)

# Ignore problems when piping to head
signal.signal(signal.SIGPIPE, signal.SIG_DFL)

def handle_cli():
    """Adds all options in one concise function"""
    parser = argparse.ArgumentParser()

    # Handle flags
    parser.add_argument(
        "-v",
        "--verbose",
        action="count",
        default=0,
        help="Show verbose output",
    )

    parser.add_argument(
        "--sample",
        action="store_const",
        const="threshold",
        default="threshold",
        help="Show sample output for small numbered entries",
    )

    parser.add_argument(
        "--nosample",
        dest="sample",
        action="store_const",
        const="none",
        help="Do not sample output for low count entries",
    )

    parser.add_argument(
        "--allsample",
        dest="sample",
        action="store_const",
        const="all",
        help="Show samples instead of munged text for all entries",
    )

    parser.add_argument(
        "--filter",
        action="store_true",
        dest="_filter",
        default=True,
        help="Use filter files during processing",
    )

    parser.add_argument(
        "--nofilter",
        dest="_filter",
        action="store_false",
        help="Do not use filter files during processing",
    )

    parser.add_argument(
        "--wide",
        dest="wide",
        action="store_true",
        help="Use wider graph characters",
    )

    parser.add_argument(
        "--tick=",
        dest="tick",
        action="store",
        default="#",
        help="Change tick character from default",
    )

    parser.add_argument(
        "--fingerprint",
        dest="fingerprint",
        action="store_true",
        default=False,
        help="Use fingerprinting to remove certain patterns, e.g., reboots.",
    )

    # Handle modes
    parser.add_argument(
        "-V",
        "--version",
        dest="mode",
        action="store_const",
        const="mode_version",
        help="Show verbose output",
    )

    parser.add_argument(
        "--hash",
        dest="mode",
        action="store_const",
        const="mode_hash",
        help="Show hashes of log files with numbers removed",
    )

    parser.add_argument(
        "--wordcount",
        dest="mode",
        action="store_const",
        const="mode_wordcount",
        help="Show word count for given word",
    )

    parser.add_argument(
        "--daemon",
        dest="mode",
        action="store_const",
        const="mode_daemon",
        help="show a report of entries from each daemon",
    )

    parser.add_argument(
        "--host",
        dest="mode",
        action="store_const",
        const="mode_host",
        help="show a report of entries from each host",
    )

    parser.add_argument(
        "--sgraph",
        dest="mode",
        action="store_const",
        const="mode_sgraph",
        help="show graph of first 60 seconds",
    )

    parser.add_argument(
        "--mgraph",
        dest="mode",
        action="store_const",
        const="mode_mgraph",
        help="show graph of first 60 minutes",
    )

    parser.add_argument(
        "--hgraph",
        dest="mode",
        action="store_const",
        const="mode_hgraph",
        help="show graph of first 24 hours",
    )

    parser.add_argument(
        "--dgraph",
        dest="mode",
        action="store_const",
        const="mode_dgraph",
        help="show graph of first 31 days",
    )

    parser.add_argument(
        "--mograph",
        dest="mode",
        action="store_const",
        const="mode_mograph",
        help="show graph of first 12 months",
    )

    parser.add_argument(
        "--ygraph",
        dest="mode",
        action="store_const",
        const="mode_ygraph",
        help="show graph of first 10 years",
    )

    parser.add_argument("--end", choices=["now", "last"], default="now")

    parser.add_argument(
        "log",
        nargs="?",
        type=argparse.FileType("r"),
        default=sys.stdin,
        help="Log data to process",
    )
    return parser


def main():
    """Captures command line args and perform initializations"""

    # Declarations & Variables
    parser = handle_cli()

    # parse options/args
    args = parser.parse_args()

    # Set Verbosity
    log_level = logging.WARNING

    if args.verbose:
        if args.verbose == 1:
            log_level = logging.INFO
        elif args.verbose >= 2:
            log_level = logging.DEBUG

    # Set up basic configuration
    logging.basicConfig(level=log_level)

    if args.mode:
        dispatch(args)
    else:
        parser.print_help()
        sys.exit(0)


def print_version():
    """Version information"""
    print("Version: 1.1.2")
    sys.exit(0)


def mode_version(args):
    print_version()


def mode_hash(args):
    """Runs in hashing mode"""

    # Get entire log file into ram for speed
    log = CrunchLog(args.log.name)

    # Build the Hash
    if args._filter == None or args._filter == True:
        x = SuperHash.manufacture(log, log_hash.STOPWORDS_HASH)
    else:
        x = SuperHash.manufacture(log, None)

    if args.fingerprint:
        x.fingerprint()

    # Set sampling type
    x.sample = args.sample

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()

    sys.exit(0)


def mode_wordcount(args):
    """Runs wordcount mode"""
    # Get input
    log = CrunchLog(args.log.name)

    # Create new word hash based on log file and filter created
    x = WordHash(log, log_hash.STOPWORDS_WORDS)

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


def mode_daemon(args):
    """Runs daemon report mode"""

    # Setup default behavior
    if args.sample == None:
        args.sample = False
    if args._filter == None:
        args._filter = True

    # Get input
    log = CrunchLog(args.log.name)

    # Create new syslog hash based on log file and filter created
    x = DaemonHash(log, log_hash.STOPWORDS_DAEMON)

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


def mode_host(args):
    """Runs host report mode"""

    # Setup default behavior
    if args.sample == None:
        args.sample = False
    if args._filter == None:
        args._filter = True

    # Get input
    log = CrunchLog(args.log.name)

    # Create new syslog hash based on log file and filter created
    x = HostHash(log, log_hash.STOPWORDS_HOST)

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


def mode_seconds_graph(args):
    """Runs seconds graph mode"""

    # Get input
    log = CrunchLog(args.log.name)

    # Create new syslog hash based on log file and filter created
    x = SecondsGraph(log, end=args.end)

    # Set tick & width options
    x.tick = args.tick
    x.wide = args.wide

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


def mode_minutes_graph(args):
    """Runs minutes graph mode"""

    # Get input
    log = CrunchLog(args.log.name)

    # Create new syslog hash based on log file and filter created
    x = MinutesGraph(log, end=args.end)

    # Set tick & width options
    x.tick = args.tick
    x.wide = args.wide

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


def mode_hours_graph(args):
    """Runs hours graph mode"""

    # Get input
    log = CrunchLog(args.log.name)

    # Create new syslog hash based on log file and filter created
    x = HoursGraph(log)

    # Set tick & width options
    x.tick = args.tick
    x.wide = args.wide

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


def mode_days_graph(args):
    """Runs days graph mode"""

    # Get input
    log = CrunchLog(args.log.name)

    # Create new syslog hash based on log file and filter created
    x = DaysGraph(log, end=args.end)

    # Set tick & width options
    x.tick = args.tick
    x.wide = args.wide

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


def mode_months_graph(args):
    """Runs months graph mode"""

    # Get input
    log = CrunchLog(args.log.name)

    # Create new syslog hash based on log file and filter created
    x = MonthsGraph(log, end=args.end)

    # Set tick & width options
    x.tick = args.tick
    x.wide = args.wide

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


def mode_years_graph(args):
    """Runs years graph mode"""

    # Get input
    log = CrunchLog(args.log.name)

    # Create new syslog hash based on log file and filter created
    x = YearsGraph(log, end=args.last)

    # Set tick & width options
    x.tick = args.tick
    x.wide = args.wide

    # Print out the dictionary first sorted by the word with
    # the most entries with an alphabetical subsort
    x.display()
    sys.exit(0)


modes = {
    "mode_hash": mode_hash,
    "mode_wordcount": mode_wordcount,
    "mode_host": mode_host,
    "mode_daemon": mode_daemon,
    "mode_sgraph": mode_seconds_graph,
    "mode_mgraph": mode_minutes_graph,
    "mode_hgraph": mode_hours_graph,
    "mode_dgraph": mode_days_graph,
    "mode_mograph": mode_months_graph,
    "mode_ygraph": mode_years_graph,
    "mode_version": mode_version,
}


def dispatch(args):
    modes.get(args.mode, mode_version)(args)


if __name__ == "__main__":
    main()
