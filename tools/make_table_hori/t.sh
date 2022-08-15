rm -rf table
mkdir table/
for ((i=2;i<63;i++)) ;do 
	for ((j=1;j<12;j++)) ;do 
		python3 make_table4.py   ${i} ${j} > ./table/`printf "hori_%02d" "${i}"`_`printf "%02d" "${j}"`.txt
	done
done
