sleep 1
counter=0
while [ "$counter" -lt 5 ] ; do
   ((counter+=1))
   progress.sh
   if [ $? -ne 127 ] ; then break; else sleep 1 ; fi
done
source /root/.environment
history -c
cat > fin.sh<<EOF
#printf "    \b\b\b\b"
#echo ""
echo "Configured"
EOF
bash fin.sh