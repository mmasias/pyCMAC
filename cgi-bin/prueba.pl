#!/usr/bin/perl
# ##############################################################
# Script desarrollado para CMAC Sullana por [Dr.+ías] & [0r3j0]
# ##############################################################
# Este script requiere el PERL 5.003 y la libreria
# CGI del CPAN la cual ya viene incluida con el PERL
# ##############################################################
	use CGI;              # Cargar rutinas CGI
	$ObjetoCGI = new CGI; # Crea un nuevo objeto CGI
	print $ObjetoCGI->header;
# ##############################################################

$prueba = "Prueba";

print "<h1>$prueba</h1>";