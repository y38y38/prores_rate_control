rm -rf ./tmp
mkdir -p ./tmp
PRORES_HOME=${1}
BASE_NAME=`basename ${2%.cmm}`
TABLE=`basename ${3%.txt}`
SCALE=`basename ${4%.txt}`
echo -n ${BASE_NAME} "," ${TABLE} "," ${SCALE} "," 
${PRORES_HOME}/prores_encoder/encoder -l ${3} -c ${3} -q ${4} -h 1920 -v 1080 -m 8 -i ${2} -o ./tmp/out.bin 
echo -n `ls -lt ./tmp/out.bin |cut -f 5 -d " "` ","
SIZE=`ls -lt ./tmp/out.bin |cut -f 5 -d " "`
${PRORES_HOME}/prores_decoder/decoder ./tmp/out.bin ./tmp/out.yuv 
${PRORES_HOME}/yuv/formatconv/422_10_to_420_8/yuv10422_1088to1080  ./tmp/out.yuv ./tmp/out2.yuv
${PRORES_HOME}/yuv/sn16/sn16 ./tmp/out2.yuv ${2} 1920 1080
echo 
${PRORES_HOME}/yuv/formatconv/cmm10to16/cmm10to16 ./tmp/out2.yuv ./tmp/${BASE_NAME}_16bit_${TABLE}_${SCALE}.yuv
ffmpeg  -y -loglevel quiet -s 1920x1080 -f rawvideo -pix_fmt yuv422p16le -i ./tmp/${BASE_NAME}_16bit_${TABLE}_${SCALE}.yuv ./tmp/${BASE_NAME%.cmm}_${TABLE}_${SCALE}.bmp  > /dev/null
