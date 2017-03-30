#!/usr/bin/perl
#2013-08-15 15:34:36.083
my $start_expr = '^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]{3}';
my $line = '';

while (my $cline = <STDIN>) {
  $cline =~ s/\n//;
  if ( $cline =~ /$start_expr/ ) {
    print "$line\n";
    $line = $cline;
  } else {
    my $aux_line = $cline;
    $aux_line =~ s/^\s*//;
    $aux_line =~ s/\s*$//;
    $line = "${line} ${aux_line}";
  }
}
print "$line\n";

