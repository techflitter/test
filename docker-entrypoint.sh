sleep 5
service redis-server start
sleep 5
service php7.2-fpm start
sleep 5
service nginx start
exit 0
