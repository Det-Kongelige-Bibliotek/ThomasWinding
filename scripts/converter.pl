#!/usr/bin/perl -w

use strict;
print '<?xml version="1.0" encoding="UTF-8" ?>';
print "\n";
print '<?xml-stylesheet type="text/xsl" href="show_films.xsl"?>';
print "\n";
print "<table>\n";
my $k = 0;
while(my $line = <>) {
    $k++;
    next if($k==1);
    
    chomp($line);
    my @cols = split /\s*;\s*/,$line;

    print "<tr>";
    my $i = 1;
    foreach my $col (@cols) {
	my $semantic = "";
	if($i ==  1) {
	    $semantic = " class='folderName'";
	} elsif ($i == 2) {
	    $semantic = " class='VideoName'";
	} elsif ($i == 3) {
	    $semantic = " class='Header1'";
	} else {
	    $semantic = " class='Header2'";
	}
	print "<td $semantic>".$col."</td>";
	$i++;
    }
    print "</tr>\n";
   
}
print "</table>\n";
