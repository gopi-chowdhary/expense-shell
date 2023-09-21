source common.sh

echo Install Nodejs Repos
curl -sL https://rpm.nodesource.com/setup_lts.x | bash >>$log_file
echo Install NodeJs
dnf install nodejs -y >>$log_file

echo Copy Backend Service file
cp backend.service /etc/systemd/system/backend.service >>$log_file

echo Add application user
useradd expense >>$log_file

echo clean app content
rm -rf /app >>$log_file
mkdir /app

echo Download app content
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >>$log_file

cd /app
echo Extract app content
unzip /tmp/backend.zip >>$log_file

echo download dependencies
npm install >>$log_file

echo start backend service
systemctl daemon-reload >>$log_file
systemctl enable backend >>$log_file
systemctl start backend >>$log_file

echo install mysql client
dnf install mysql -y >>$log_file

echo load schema
mysql -h <mysql.vdevops69.online> -uroot -pExpenseApp@1 < /app/schema/backend.sql >>$log_file