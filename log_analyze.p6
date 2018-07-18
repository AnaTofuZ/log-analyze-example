#!/usr/bin/env perl
use v6;

unit sub MAIN(:f($file) where { .IO.f } = '/var/log/system.log');

my $user_name = /'anatofuzMBP'|'anatofuz-15'/;
my $fh = open $file,:r;
my %count =();

for $fh.lines -> $line {
     if ( $line ~~ /\w+ \s \d**0..3 \s [\d**2\:?]**3 \s $user_name \s (<[\w.]>+)\[\d+\]/) {
         %count{$0}++;
    }
}
$fh.close;
my $sum = 0;

for %count.keys -> $key {
    $sum += %count{$key};
}

$sum.say;
