#!/usr/bin/perl -w
use strict;
use IO::Socket;

sub Wait {
	wait; # wait needed to keep <defunct> pids from building up
}

$SIG{CHLD} = \&Wait;

my $server = IO::Socket::INET->new(
	LocalPort 	=> 1337,	# set port disini kita bisa ganti port yg kita ingin kan
	Type 		=> SOCK_STREAM, #apa itu port ok  iya pokok nya contoh nya kita login cpanel
	Reuse 		=> 1, #untuk cpanel biasa nya 2083 2084 ke nya g tau gua lupa
	Listen 		=> 10) or die "$@\n"; #disini gua mau ganti port nya jadi 1337 ok kita sape dulu
my $client ;

while($client = $server->accept()) {
	select $client;
	print $client "HTTP/1.0 200 OK\r\n";
	print $client "Content-type: text/html\r\n\r\n";
	print $client 'hacked by kawan kelamo WTT'; # set your html content disini kita taru html kode 
} #karena gua mager ya gua yg simpel aja ke gini yoi 
continue {
	close($client); #kills hangs
	kill CHLD => -$$;
} # ok langsung ae lah kita ke tutor nya 