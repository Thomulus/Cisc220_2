while [ 1 ]; do
	read -p "Please insert a number: " numberone
	for (( n=0; n<=10; n ++ )) ; do
		if [[ $numberone == ":q" ]]; then
			broken="broke"
			break 2;
		fi
		if [[ $numberone == $n ]]; then
			break 2;
		fi
	done
	echo -n "Error! "
done
total=0
ops=""
while [ 1 ]; do
	if [[ $broken == "broke" ]]; then
		break 1;
	fi
	while [ 1 ]; do
		read -p "Please insert an operator: " operator
		if [[ $operator == ":q" ]]; then
			break 2;
		fi
		for string in {"+","-","/","*"} ; do
			if [[ $string == $operator ]]; then
				ops=$operator
				break 2;
			fi
		done
		echo -n "Error! "
	done
	while [ 1 ]; do
		read -p "Please insert a number: " numbertwo
		if [[ $numbertwo == ":q" ]]; then
			break 2;
		fi
		for ((n=0; n<=10; n ++ )) ; do
			if [[ $numbertwo == $n ]]; then
				break 2;
			fi
		done
		echo -n "Error! "
	done
	if [[ $ops == "+" ]]; then
		numberone=$(($numberone + $numbertwo));
	elif [[ $ops == "-" ]]; then
		numberone=$(($numberone - $numbertwo));
	elif [[ $ops == "*" ]]; then
		numberone=$(($numberone * $numbertwo));
	else 
		numberone=$(($numberone / $numbertwo));
	fi
	echo -n "Result so far is: " 	
	echo $numberone
done

