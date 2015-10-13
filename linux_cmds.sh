#1. get GTK version
~$ apt-cache policy libgtk2.0-0 libgtk-3-0
libgtk2.0-0:
  已安裝：2.24.22-1ubuntu1~saucy1
  候選： 2.24.22-1ubuntu1~saucy1
  版本列表：
 *** 2.24.22-1ubuntu1~saucy1 0
        500 http://ppa.launchpad.net/gnome3-team/gnome3/ubuntu/ saucy/main amd64 Packages
        500 http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/ saucy/main amd64 Packages
        100 /var/lib/dpkg/status
     2.24.20-1ubuntu1 0
        500 http://ubuntu.cs.nctu.edu.tw/ubuntu/ saucy/main amd64 Packages
libgtk-3-0:
  已安裝：3.10.7-0ubuntu1~saucy1
  候選： 3.10.7-0ubuntu1~saucy1
  版本列表：
 *** 3.10.7-0ubuntu1~saucy1 0
        500 http://ppa.launchpad.net/gnome3-team/gnome3/ubuntu/ saucy/main amd64 Packages
        100 /var/lib/dpkg/status
     3.10.6-0ubuntu2~saucy1 0
        500 http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/ saucy/main amd64 Packages
     3.8.6-0ubuntu3.1 0
        500 http://ubuntu.cs.nctu.edu.tw/ubuntu/ saucy-updates/main amd64 Packages
     3.8.4-0ubuntu3 0
        500 http://ubuntu.cs.nctu.edu.tw/ubuntu/ saucy/main amd64 Packages


#2. Redirect output to screen and file - tee
http://ithelp.ithome.com.tw/question/10106956

#3. display full path when use find command
~$ find "$PWD" -iname inputreader.cpp
/xczone/workshop/regular_task/google_release_checking/2014W31_android_l_release/M8ULGenWWEK443MainS60StableMRCL369921002/frameworks/base/services/input/InputReader.cpp

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
~$ ssh -t u16@10.116.64.19 'cd SST_PARSING_SERVER/foral/; java -jar autosyncpqcs_20151012CL18738.jar'
