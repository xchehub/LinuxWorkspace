
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

#8. get main board model

#9. get cpu info

#10. get entropy value
~$ cat /proc/sys/kernel/random/entropy_avail

#11. Single command to login to SSH and run program
~$ ssh -t uuuyy@10.99.99.19 'cd SST_PARSING_SERVER/foral/; java -jar automakr_20151012da18738.jar'

#12. sort du -h output by size
~$ du -h -d1 | sort -h
