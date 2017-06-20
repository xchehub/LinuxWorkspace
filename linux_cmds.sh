
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
