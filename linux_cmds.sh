
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

#15. Linuxto empty the contents of a log file
#If you want to empty a log, removing it and recreating it is one way, but not a very good one, you can use the following command
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
# send file 
~$ nc xxx.xxx.xxx.xxx xxxx < file
# retrive file
~$ nc -l xxxx > file

#20. Execute Commands After You Exit From a Shell Prompt 
~$ nohup

#21. displays the last few lines of a file.
~$ tail

#22. extract a vertical selection of columns or fields from one or more Unix or Linux files.
~$ cut

#23. sort/order lines in text files
~$ sort

#24 find find depends on current working directory.
~$ find $(pwd) -name *.* -print

#25 pdf compress
#If the -dPDFSETTINGS=/screen setting is low quality, -dPDFSETTINGS=/ebook for better quality. For the high quality default -dPDFSETTINGS=/prepress.
~$ gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=output.pdf input.pdf

#26. dump svn commit comment to xml format fot import inexcel
~$ svn log -l 100 --xml > repository_log.xml

#27. count csv file columns
~$ head -1 some_file.csv | sed 's/[^,]//g' | wc -c

#28. remove csv file columns
~$ cut -d, -f1-100 some_file.csv > some_file_test.csv

#29 delete mount point
~$ sudo umount mountpoint
## Then edit /etc/fstab and remove the mountpoint from there.
~$ sudo rmdir mountpoint

#30 replace single quotes with space in sed
~$ sed "s/'/ /g" myfile.txt

#31 Change the system folder name back to English
~$ LANG=C xdg-user-dirs-update --force
php -S 127.0.0.1:8252 -t .
#32 borad message to all login users
~$ echo "message" | wall

#33 real time watching Nvidia GPUs status
~$ sudo watch nvidia-smi

#34 run php in local, php 7
~$ php -S 127.0.0.1:<port> -t .

#35 Find all files with size greater than XXXX
~$ find ./ -size +10M

#36 Query localhost public IP, diff from ifconfig, it will query IP address for connect outside in NAT env. 查詢本地機器公開 IP 位址的指令, 不同於 ifconfig，它可以在 NAT 的環境中查詢到與外部連線時的 IP 位址。
~$ wget http://ipinfo.io/ip -qO -

#37 get system reboot shutdown time
~$ last -x | grep shutdown | less
~$ last | grep reboot

#38 integrate mv command after find command result
~$ find path_A -name '*AAA*' -exec mv -t path_B {} +

#39 kill processes with partial name?
~$ pkill -f pattern
~$ pkill -P $$

#40 see process names
~$ pgrep -l xxxxx

#41 see full command lines
~$ pgrep -a xxxxx

#42 check apt update history
~$ less /var/log/apt/history.log

#43. List top 10 commands in history
# ref. http://www.commandlinefu.com/commands/view/12470/statistic-of-the-frequnce-of-your-command-from-your-history
~$ history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10

# 44. skype for linux
# no gpu 
~$ skypeforlinux --disable-gpu --enable-lcd-text

# 45. pipe viewer
~$ pv access.log | gzip > access.log.gz
~$ pv -cN source access.log | gzip | pv -cN gzip > access.log.gz
~$ tar -czf - . | pv > out.tgz
~$ tar -cf - . | pv -s $(du -sb . | awk '{print $1}') | gzip > out.tgz
~$ dd if=/dev/zero | pv | dd of=/dev/null
~$ dd if=/dev/disk2 | pv | pv -cN gzip > disk.gz
~$ pv /dev/zero > /dev/null
# transfer file between 2 PCs
# PC A
~$ tar cf a.file | pv | nc -l -p 6969 -q 5
# PC B
~$ nc 192.168.1.0 6969 | pv | tar xf a.file
# transfert directory
# on computer A, with IP address 192.168.1.100
~$ tar -cf - /path/to/dir | pv | nc -l -p 6666 -q 5
# on computer B
~$ nc 192.168.1.100 6666 | pv | tar -xf -

# 46. cURL
~$ curl someurl.com # if the host cannot connect, you will ther error message.
~$ curl -v someurl.com # display response and request header
~$ curl curl –-limit-rate 2000B https://someurl.com # limit download rate
~$ curl --proxy someproxy:port https://someurl.com # useong a proxy
~$ 

# 47. dig

# 48. find folder and remove
~$ find ./ -type d -name node_modules -exec rm -rf {} \;

# 49. find files and copy
~$ find ./ -type f -name "*.app" -exec cp {} /tmp/somefolder \;

# 50. pipe commands to a telnet session
## it needs to osleep few milliseconds to wait foe the coommand completed.
`~$ eval "{ echo user_name; sleep 1; echo pass; sleep 1; echo '?'; sleep 5; }" | telnet host_address`

# 51. generate random number
~$ echo $RANDOM
~$ echo $(($RANDOM%10))
## between x to y
### RANGE=$((Y-X+1))
### RANDOM=$$
### R=$(($(($RANDOM%$RANGE))+X))
```shell
echo "upper bounds:"
read X
echo "lower bounds:"
read Y
RANGE=$((Y-X+1))
RANDOM=$$
R=$(($(($RANDOM%$RANGE))+X))
echo "The random integer is $R"
```
# 52. get text from line1 to line2
~$ sed -n '123, 124p' mytext.log
# -n: tells sed does not print lines scanned.
# 123,234: define the range of lines we are interested in
# p: print lines.

