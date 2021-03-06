#!/bin/bash

# Topic DA refers to "Data Availability"
# Topic JC refers to "Chained Jobs"
# Topic "CL" refers to "Cluster Load"
# Job Priority 0(maximum) to 'n'(minimum)

# Jobs
job1="/home/hduser/yarn/hadoop-2.0.2-alpha/bin/hadoop jar /home/hduser/yarn/hadoop-2.0.2-alpha/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.0.2-alpha.jar wordcount /in1 /out1"

job2="/home/hduser/yarn/hadoop-2.0.2-alpha/bin/hadoop jar /home/hduser/yarn/hadoop-2.0.2-alpha/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.0.2-alpha.jar wordcount /in2 /out2"

job3="/home/hduser/yarn/hadoop-2.0.2-alpha/bin/hadoop jar /home/hduser/yarn/hadoop-2.0.2-alpha/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.0.2-alpha.jar wordcount /in3 /out3"

job4="/home/hduser/yarn/hadoop-2.0.2-alpha/bin/hadoop jar /home/hduser/yarn/hadoop-2.0.2-alpha/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.0.2-alpha.jar wordcount /in4 /out4"

job5="/home/hduser/yarn/hadoop-2.0.2-alpha/bin/hadoop jar /home/hduser/yarn/hadoop-2.0.2-alpha/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.0.2-alpha.jar wordcount /in5 /out5"

job6="/home/hduser/yarn/hadoop-2.0.2-alpha/bin/hadoop jar /home/hduser/yarn/hadoop-2.0.2-alpha/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.0.2-alpha.jar wordcount /in6 /out6"


if [ $1 = "DA" ]; then
	if [ $2 = "in1" ]; then
		echo "$job1"
		`./pigeon.sh publish DA in3 tcp://10.0.2.15:61616`
	elif [ $2 = "in2" ]; then
		echo "$job2"
		`./pigeon.sh publish JC in4 tcp://10.0.2.15:61616`
	elif [ $2 = "in3" ]; then
		echo "$job3"
	fi

elif [ $1 = "JC" ]; then
	if [ $2 = "in4" ]; then
		echo "$job4"
	elif [ $2 = "in5" ]; then
		echo "$job5"
	fi

elif [ $1 = "CL" ]; then
	if [ $2 = "in6" ]; then
		echo "$job6"
	fi

else
	echo "Bad Topic"
fi

read input

