rm -rf ./tmp
mkdir ./tmp/
PRORES_HOME=/home/y/prores/
#HQ422_TARGET_SIZE=916000
HQ422_TARGET_SIZE=700000
yuv_file=${1}
TABLE_DIR=./table/
QSCALE_DIR=./qscale/

#for yuv_file in ${1}/*.cmm ; do
	for table_file in ${TABLE_DIR}/*.txt;do
		for q_file in ${QSCALE_DIR}/*.txt;do
#			echo  ${table_file} ${q_file}
			BASE_NAME=`basename ${yuv_file%.cmm}`
			TABLE=`basename ${table_file%.txt}`
			SCALE=`basename ${q_file%.txt}`
			echo -n ${BASE_NAME} "," ${TABLE} "," ${SCALE} "," 
			${PRORES_HOME}/prores_encoder/encoder -l ${table_file} -c ${table_file} -q ${q_file} -h 1920 -v 1080 -m 8 -i ${yuv_file} -o ./tmp/out.bin 
			echo -n `ls -lt ./tmp/out.bin |cut -f 5 -d " "` ","
			SIZE=`ls -lt ./tmp/out.bin |cut -f 5 -d " "`
			if (( "$SIZE" < "$HQ422_TARGET_SIZE" ))
			then
				echo 
				break
			fi
			${PRORES_HOME}/prores_decoder/decoder ./tmp/out.bin ./tmp/out.yuv 
			${PRORES_HOME}/yuv/formatconv/422_10_to_420_8/yuv10422_1088to1080  ./tmp/out.yuv ./tmp/out2.yuv
			${PRORES_HOME}/yuv/sn16/sn16 ./tmp/out2.yuv ${yuv_file} 1920 1080
			echo 
#			${PRORES_HOME}/yuv/formatconv/cmm10to16/cmm10to16 ./tmp/out2.yuv ./tmp/${BASE_NAME}_16bit_${TABLE}_${SCALE}.yuv
#			ffmpeg  -y -loglevel quiet -s 1920x1080 -f rawvideo -pix_fmt yuv422p16le -i ./tmp/${BASE_NAME}_16bit_${TABLE}_${SCALE}.yuv ./tmp/${BASE_NAME%.cmm}_${TABLE}_${SCALE}.bmp  > /dev/null
			rm ./tmp/*
		done
	done
#done
