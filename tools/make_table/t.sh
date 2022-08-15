for ((i=2;i<63;i++)) ;do 
	python3 make_table.py   ${i} > `printf "%02d" "${i}"`.txt
done
