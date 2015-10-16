#!/usr/bin/perl -w
use strict;
use LWP::Simple;

## Grab a Web page, and throw the content in a Perl variable.
my $content;
my $i;
my $j;
my $k;

#for ($i=228; $i<=229; $i++){   # range 0xe4~e9 
#for ($j=189; $j<=191; $j++){   # range 0xb8~bf
#for ($k=128; $k<=130; $k++){  # range 0x80~bf

for ($i=229; $i<=233; $i++){   # range 0xe5~e9 
for ($j=128; $j<=191; $j++){   # range 0x80~bf
for ($k=128; $k<=191; $k++) {  # range 0x80~bf

    my $utf8word = sprintf("\\x%x\\x%x\\x%x", $i, $j, $k);
    #my $utf8code = sprintf("0x%x%x%x", $i, $j, $k);
    my $utf8code = sprintf("%x %x %x", $i, $j, $k);
    my $url = sprintf("http://www.zdic.net//zd/zi/Zdic%xZdic%xZdic%x.htm", $i, $j, $k);

    #print $url , "\n";
    sleep(1);
    $content = get($url);
    if ($content){
    my $keystring1 = "笔顺编号:</span><span title=\"";
    #my $keystring1 = "笔顺编号";
    my $keystr1len = length($keystring1);
    my $startpos = index($content, $keystring1);

    #print "string 1 pos:", $startpos, ", length: ", $keystr1len, "\n";

    #if ($startpos != -1) {
        my $keystring2 = "<\/span>　　<span class=\"diczx6\">四角号码:";
        my $keystr2len = length($keystring2);
        my $endpos = index($content, $keystring2);

        #print "string 2 pos:", $endpos, ", length: ", $keystr2len, "\n";

        my $substring = substr($content, $startpos+$keystr1len, $endpos-$startpos-$keystr1len);
        #print $substring, "\n";
        my $seppos = index($substring, "\">");

        my $strokeword = substr($substring, 0, $seppos);
        my $strokecode = substr($substring, $seppos+2, length($substring) - 2 - $seppos);

        #print $substring, "\n", $strokeword, "\n", $strokecode, "\n\n++++++++++++++++++++\n\n";

        #print $utf8code, ",", $utf8word, ",", $strokeword, ",", $strokecode, "\n\n";
        print $utf8code, ",", $strokeword, ",", $strokecode, "\n";
    }else{
        print $utf8code, ",---,---\n";
    }    
}
}
}
#print $content

#print $strokes;
