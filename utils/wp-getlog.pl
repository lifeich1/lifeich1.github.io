#!/usr/bin/env -S perl -w
use strict;
use v5.34;
use utf8;
use open qw/:std :utf8/;
use Time::Piece;
use Time::Seconds;

my $sec  = 'uninit';
my $task = 'uninit';
my $now  = localtime;

my $verb = 0;
while ( defined( my $opt = shift ) ) {
  if ( $opt eq "-v" ) {
    $verb = 1;
  }
}

my %col = ();

open( my $fin, '<', '.record.org' ) or die "open record.org error: $!";
while (<$fin>) {
  chomp;
  if (/\A(\*\*\*?) (?:(\w+)|(?:STUDYING (.+)))\Z/) {
    if ( $1 eq '**' ) {
      $sec = $2;
      say STDERR "cap sec=$sec" if $verb;
    }
    elsif ( defined($3) ) {
      $task = $3;
      $task =~ s/\[\[\S+\]\[(.+)\]\]/$1/;
      say STDERR "cap task=$task" if $verb;
    }
  }
  elsif (
    /\A\s+- State "DONE"\s+from "STUDYING"\s+\[(\d+-\d+-\d+)\s\S\s(\d+:\d+)\]\Z/
    )
  {
    my $tag   = "$1 $2";
    my $tag_t = Time::Piece->strptime( $tag, "%Y-%m-%d %H:%M" );
    if ( $now - $tag_t < ONE_WEEK ) {
      say STDERR "cap this week tag=$tag" if $verb;
      $col{$sec} = () unless exists $col{$sec};
      push @{ $col{$sec} }, ("[$tag] $task");
    }
  }
}

while ( my ( $sec, $ar ) = each %col ) {
  say "### $sec\n";
  say "#### log";
  say "```";
  foreach ( @{$ar} ) {
    say;
  }
  say "```";
}
