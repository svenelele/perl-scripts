#!/usr/bin/env perl

use Proc::ProcessTable;
use Data::Dumper;

my $FORMAT = "  %-4s %-4s %s %s\n";
my $t = Proc::ProcessTable->new;
printf($FORMAT, "CPU", "MEM", "FILENAME", "COMMAND");
foreach my $p ( @{$t->table} ){

  my @commend = split / /, $p->cmndline;

  if ($commend[0] ne "") {
    print $p->pctcpu, ",", $p->pctmem, ",", $p->fname, ",", $commend[0],"\n";
  }

}
