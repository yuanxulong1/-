#!/bin/sh
cp="."
#遍历lib目录
for file in `ls ../lib`
do
  #cp=$cp:$file
  #echo `pwd`/$file
  cp=$cp:`pwd`/../lib/$file
done
cp=$cp:../classes/
cp=$cp:../conf/
java_opts="-server -d64 -Xmx4096m -Xms4096m -Xmn2048m -XX:+UseG1GC -XX:-UseGCOverheadLimit  -Xloggc:/usr/local/gclogs/yzservicegclog.log -XX:GCTimeRatio=98 -XX:+PrintGCApplicationStoppedTime -XX:+PrintGCDetails -XX:+PrintGCDateStamps"
java="../../jdk17/bin/java"
CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote=true"
CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.port=50013"
CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
#echo $cp
nohup $java $CATALINA_OPTS  $java_opts  -classpath $cp com.chaoxing.main.Main &
echo "yzservice start OK ....."
