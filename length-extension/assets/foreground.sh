sleep 1
counter=0
while [ "$counter" -lt 5 ] ; do
   ((counter+=1))
   timeout 5 wait.sh
   exit_code=$?
   if [ $exit_code -ne 127 ] ; then break; else sleep 1 ; fi
   
done
unset counter
source /root/.environment
echo clear >> .clean.sh
echo 'if [[ "$exit_code" -eq 124 ]]; then echo "Timeout (90s): Configuring"; else echo Configured; fi' >> .clean.sh
echo 'rm -- "$0"' >> .clean.sh
cat /dev/null > ~/.bash_history && history -c
bash .clean.sh