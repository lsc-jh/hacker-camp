FILE=$(basename $1)
clear

showLoading() {
  	mypid=$!
  	loadingText=$1
  	echo -ne "$loadingText\r"

  	for i in {0..3} 
	do
    		echo -ne "$loadingText.\r"
    		sleep 0.5
    		echo -ne "$loadingText..\r"
    		sleep 0.5
    		echo -ne "$loadingText...\r"
    		sleep 0.5
    		echo -ne "\r\033[K"
    		echo -ne "$loadingText\r"
    		sleep 0.5
  	done
  	echo "$loadingText...FINISHED"
}

echo
echo
echo "************* Welcome to the Password Cracker 2.0**************"
sleep 1
echo
showLoading "Checking selected file "

echo "Selected file for cracking: $FILE" 
echo
showLoading "Starting decryption on $FILE " 


max_length=$(( $2*100 )) 
min_length=$(( $3*100 ))


for ((i=$max_length; i >= $min_length; i--)); 
do
	((length=i/100))
	NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -n 1)
	echo "Password guess: $NEW_UUID"
	sleep 0.0001
	
done
echo
echo "===> Password found"

showLoading "  -> Trying to unlock "
echo
sleep 1
echo "==> Unlock failed."

