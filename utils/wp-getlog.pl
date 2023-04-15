#!/usr/bin/env -S perl -w
use strict;
use v5.34;
use utf8;
use open qw/:std :utf8/;
use Time::Piece;
use Time::Seconds;

my $sec_name = (shift or 'Music');
say STDERR "filtering $sec_name";
my $sec = 'uninit';
my $task = 'uninit';
my $now = localtime;

open(my $fin, '<', '.record.org') or die "open record.org error: $!";
while (<$fin>) {
    chomp;
    if (/\A(\*\*\*?) (?:(\w+)|(?:STUDYING (.+)))\Z/) {
        if ($1 eq '**') {
            $sec = $2;
            say STDERR "cap sec=$sec";
        } else {
            $task = $3;
            $task =~ s/\[\[\S+\]\[(.+)\]\]/$1/;
            say STDERR "cap task=$task";
        }
    } elsif (/\A\s+- State "DONE"\s+from "STUDYING"\s+\[(\d+-\d+-\d+)\s\S\s(\d+:\d+)\]\Z/) {
        my $tag = "$1 $2";
        my $tag_t = Time::Piece->strptime($tag, "%Y-%m-%d %H:%M");
        if ($now - $tag_t < ONE_WEEK) {
            say STDERR "cap this week tag=$tag";
            say "[$tag] $task";
        }
    }
}
