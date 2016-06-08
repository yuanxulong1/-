#! /bin/sh
ids=`ps -ef |grep yzservice |grep -v grep |awk '{print $2}'`
echo $ids

for pid in $ids
do
  kill  $pid
  echo 'shutdown and restart process,pid='$pid
  
  for i in {1..50}
  do
   endedId=`ps -ef |grep yzservice |grep -v grep |awk '{print $2}'`
   if [ -z $endedId ];then
    echo '已结束进程，pid='$pid
    break
   else
    sleep 1
   fi 
  done

endedId=`ps -ef |grep yzservice |grep -v grep |awk '{print $2}'`
echo $endedId
if [ $endedId ];then
  echo '进程未正确结束，请手工关闭'
fi
done

