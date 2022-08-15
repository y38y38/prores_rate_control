rm -rf table
mkdir table/
for ((i=2;i<32;i++)) ;do 
	for ((j=1;j<12;j++)) ;do 
		python3 make_table5.py   ${i} ${j} > ./table/`printf "ver_%02d" "${i}"`_`printf "%02d" "${j}"`.txt
	done
done
