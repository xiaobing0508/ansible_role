if [ `netstat -lntp|grep nginx|wc -l` -lt 2 ];then
systemctl restart nginx
sleep 2
        if [ `netstat -lntp|grep nginx|wc -l` -lt 2 ];then
        pkill keepalived
      fi
fi
