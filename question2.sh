Internet=$(ifconfig)
while [[ ${Internet} > 10 ]]; do
	if [[ $Internet == *"inet addr:"* ]]
	then
		Internet="${Internet#*inet addr:}"
		Internet1=${Internet:0:16}
		Internet1=${Internet1}
		for (( n=0; n<16; n++ )); do
			for (( o=0; o<10; o++ )); do
				if [[ $o == ${Internet1:$n:1} ]]; then
					echo -n  ${Internet1:$n:1} 
				fi
			done
			if [[ ${Internet1:$n:1} ==  "." ]]; then
				echo -n ${Internet1:$n:1}
			fi
		done
		if [[ ${Internet:0:3} == "127" ]]; then
			echo " Local IP"
		else
			echo " Private IP"
		fi		
	fi
	Internet=${Internet:17}
	
done

