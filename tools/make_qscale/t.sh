for ((i=1;i<64;i++)) ;do 
#	python make_qscale.py   ${i} > q_`printf "%03d" "${i}"`.txt
	python3 make_qscale.py   ${i} > q_`printf "%03d" "${i}"`.txt
	 
#	echo   ${i} > q_`printf "%03d" "${i}"`.txt
done
