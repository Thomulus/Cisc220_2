list=( $(ps axo pid))
for (( i=1; i<${#list[*]}; i++ )); do
	count=0
	PID1=${list[i]}
	Storage=()
	StorageCount=0
	while true; do
		PPID1=$( ps j $PID1 | awk 'NR>1 {print $1}')
		id=$( ps axo pid,user | grep $PID1 | awk '{print $2}')
		DERP="$( ps axo pid,comm | grep $PID1 | awk '{print $2}') PID: $PID1 PPID: $PPID1 Started: $( ps axo pid,start | grep $PID1 | awk '{print $2}') by: $id) "
		if [[ $PPID1 > 0 ]]; then		
			count=$(($count+1))
			PID1=$PPID1
		else 
			break;
		fi
		Storage+=$DERP
		StorageCount=$((StorageCount + 1))
	done
	for (( j=0; j<=StorageCount; j++ )); do
		for ((k=0; k<j; k++ )); do
		echo -n "-"
		done
		echo ${Storage[$((StorageCount - j))]}
	done
done
