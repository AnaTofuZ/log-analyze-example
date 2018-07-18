#!/usr/bin/env perl
use strict;
use warnings;

my $file = "/var/log/system.log";

if(@ARGV == 2){
    if ( $ARGV[0] eq "-f"){
        $file = $ARGV[1];
    }
}

my $user_name = qr/anatofuzMBP|anatofuz-15/;
open my $fh, "<",$file;
my $count = {};

while (my $line = <$fh>) {
    if ( $line =~ /\w \d{0,2} (?:\d{2}:?){3} $user_name ([\w.]+)\[\d+\]/){
        $count->{$1}++;
    }
}

my $sum = 0;

for my $key (keys %$count){
    $sum += $count->{$key};
}

print "$sum\n";
