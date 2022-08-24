#!/bin/bash
# 
# Written By: Scott McCarty <smccarty@eyemg.com>
# Date: 9/2009
# Description: Simple integration test to make sure things work rudamentarily well

PETIT="python3 ../petit3.py"

# First test with no input, should print version
if ! $PETIT -h > /dev/null
then
	echo " Failed: Default with no input"
	exit 1
else
        VERSION=$($PETIT -V)
	echo " Passed: Petit $VERSION with no input"
fi



# Routine Tests
functions="hash host daemon" #  hash host daemons graph mgraph hgraph dgraph mograph ygraph wordcount

for function in $functions
do
        TMP=$(mktemp -d)
	for test in `ls data/*.log`
	do
		# Get the right name for the test
		test=`basename $test | cut -f1 -d"."`

		# Update files?
		if [ "$1" == "update" ]
		then
			echo "Updating: petit --$function $test.log: "
			$PETIT --${function} data/${test}.log > output/${test}-${function}.output
		fi

                ACTUAL=$TMP/${test}-${function}.actual.tmp
                TARGET=$TMP/${test}-${function}.target.tmp
                
		# Run test
		echo -n -e "Testing: petit --$function $test.log: \n"

                cat output/${test}-${function}.output > $TARGET
                
		$PETIT --${function} data/${test}.log >  $ACTUAL
                  
                # Split fields since we don't care about whitespace
                if [[ "$function" != *"graph"* ]]; then
                  sed -i 's/\:\s*/,/' $ACTUAL
                  sed -i 's/\:\s*/,/' $TARGET
                fi

                
		if ! diff $TARGET $ACTUAL
		then
			echo " Failed"
            # Leave data in place to inspect on failure #
			#exit 1
		else
			rm $ACTUAL $TARGET
			echo " Passed"
		fi

	done
done
exit 0
# Special hashing tests

options="fingerprint nosample nofilter"
function="hash"

for option in $options
do
	for test in `ls data/*.log`
	do
		# Get the right name for the test
		test=`basename $test | cut -f1 -d"."`

		# Run test
		# Update files?
		if [ "$1" == "update" ]
		then
			echo "Updating: petit --$function --${option} $test.log: "
			$PETIT --${function} --${option} data/${test}.log > output/${test}-${function}-${option}.output
		fi

		# Run Test
		echo -n "Testing: petit --$function --${option} $test.log: "

                ACTUAL=$TMP/${test}-${function}-${option}.actual.tmp
                TARGET=$TMP/${test}-${function}-${option}.target.tmp
                
                # Split fields since we don't care about whitespace
                cat output/${test}-${function}-${option}.output \
                  | sed 's/\:\s*/,/' > $TARGET
                
                
		$PETIT --${function} --${option} data/${test}.log \
                  | sed 's/\:\s*/,/' > $ACTUAL

		if ! diff $TARGET $ACTUAL
		then
			echo " Failed"
                        # Leave data in place to inspect on failure #
			exit 1
		else
                        rm $ACTUAL $TARGET
			echo " Passed"
		fi
	done
done
