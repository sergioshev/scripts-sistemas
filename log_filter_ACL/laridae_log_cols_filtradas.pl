#!/usr/bin/perl

use Text::CSV;

my $logfile = $ARGV[0];

open(my $fh, "<", $logfile)
  or die "Cannot open «$logfile»: $!";

$csv = Text::CSV->new ({
  eol                 => $\,
  sep_char            => ',',
  allow_whitespace    => 0,
  blank_is_undef      => 0,
  empty_is_undef      => 0,
  quote_char          => '"',
  allow_loose_quotes  => 0,
  escape_char         => '"',
  allow_loose_escapes => 0,
  binary              => 1,
  decode_utf8         => 0,
  always_quote        => 0,
  quote_space         => 1,
  quote_null          => 1,
  keep_meta_info      => 0,
  verbatim            => 0,
  auto_diag           => 0,
});

# Filtrado de las columnas
# ------------------------
#
# TABLE postgres_log:
#  0	log_time timestamp(3) with time zone
#  1	user_name text
#  2	database_name text
#  3	process_id integer
#  4	connection_from text
#  5	session_id text
#  6	session_line_num bigint
#  7	command_tag text
#  8	session_start_time timestamp with time zone
#  9	virtual_transaction_id text
#  10	transaction_id bigint
#  11	error_severity text
#  12	sql_state_code text
#  13	message text
#  14	detail text
#  15	hint text
#  16	internal_query text
#  17	internal_query_pos integer
#  18	context text
#  19	query text
#  20	query_pos integer
#  21	location text
#  22	application_name text

# Columnas que son necesarias = 0,1,7,11,13,14,19
while (my $row = $csv->getline($fh)) {
  print "\"$row->[0]\";\"$row->[1]\";\"$row->[7]\";\"$row->[11]\";\"$row->[13]\";\"$row->[14]\";\"$row->[19]\"" . "\n";
}

close $fh;
