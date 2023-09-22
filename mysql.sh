source common.sh

echo disable mysql 8 version
dnf module disable mysql -y &>>$log_file
stat_check

echo copy mysql repo file
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>$log_file
stat_check

echo install mysql server
dnf install mysql-community-server -y &>>$log_file
stat_check

echo start mysql service
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file
stat_check

echo setup root password
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_file
stat_check

