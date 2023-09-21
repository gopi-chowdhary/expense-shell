log_file=/tmp/expense.log

download_and_extract() {
  echo Download $component Code
  curl -s -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >>$log_file
  echo $?

  echo Extracting $component Code
  unzip /tmp/$component.zip >>$log_file
  echo $?
}