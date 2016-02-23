
#1. get GTK version
~$ apt-cache policy libgtk2.0-0 libgtk-3-0

#2. Redirect output to screen and file - tee  http://ithelp.ithome.com.tw/question/10106956

#3. display full path when use find command
~$ find "$PWD" -iname inputreader.cpp
/zone/workshop/regular_task/google_release_checking/input/InputReader.cpp

#4. check ubuntu version from command line
#https://help.ubuntu.com/community/CheckingYourUbuntuVersion
~$ lsb_release -a

#5. How to untar a file (not zip/tar.gz)
~$ tar xvf L_Release.tar

#6. restart i-bus from command line
~$ pkill ibus-daemon |nohup ibus-daemon -d
~$ ibus-daemon &

#7. Too many open files - how to find the culprit
#use lsof to understand who's opening so many files
~$ lsof > ~/Desktop/lsof.log
~$ cat ~/Desktop/lsof.log | awk '{ print $2 " " $1; }' | sort -rn | uniq -c | sort -rn | head -20
~$ vim ~/Desktop/lsof.log

#8. get main board model, use dmidecode
~$ sudo dmidecode

#9. get cpu info

#10. get entropy value
~$ cat /proc/sys/kernel/random/entropy_avail

#11. Single command to login to SSH and run program
~$ ssh -t uuuyy@10.99.99.19 'cd SST_PARSING_SERVER/foral/; java -jar automakr_20151012da18738.jar'

#12. sort du -h output by size
~$ du -h -d1 | sort -h

#13. reverse the result of comparisons pass the -r option
~$ du -h -d1 | sort -h -r

#14. Top 10 files pass the output to the head command
~$ du -h -d1 | sort -hr | head

#15. Linux讓記錄檔內容歸零的方法
#如果要將記錄內容清空，移除再建立是一個方法，但不是很好的方法，可以採用下面這個指令
~$ cat /dev/null > /var/log/log_filename

#16 get svn log information
~$ svn log | sed -n '/username/,/-----$/ p'
~$ svn log -r {2015-01-01}:{2015-12-31} | sed -n '/username/,/-----$/ p'
~$ svn log --xml | grep author | sort -u | perl -pe 's/.*>(.*?)<.*/$1 = /'

#17 move file by date
~$ find . -maxdepth 1 -type f -mtime +40 -name "XXXxxx_*" -exec mv {} ./tool_backup/2015/ \;

#18. find out screen resolution from a shell script
~$ xdpyinfo | grep dimensions

#19. Netcat or nc is a networking utility for debugging and investigating the network.
#    Netcat Cheat Sheet 
#    https://www.sans.org/security-resources/sec560/netcat_cheat_sheet_v1.pdf
~$ nc

#20. Execute Commands After You Exit From a Shell Prompt 
~$ nohup

#21. displays the last few lines of a file.
~$ tail

#22. extract a vertical selection of columns or fields from one or more Unix or Linux files.
~$ cut

#23. sort/order lines in text files
~$ sort
