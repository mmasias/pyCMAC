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

# Esta variable contiene la ubicacion raiz del Web
# Habría que cambiarla a la ubicacion real
	$DirectorioDeDatos = '/export/htdocs/cmac-sullana';
    # $DirectorioDeDatos = 'C:/Inetpub/wwwroot/cmac';

	$Linea = "<hr size=1 color=#000080>";
	$accion = 'noticortas.graba.pl';
	$separador = "¤";

	$PlantillaDeIngreso = $DirectorioDeDatos."/cgi-bin/plantillas/noticortas.ingresos.htm";
	$BaseDeDatos = $DirectorioDeDatos."/archivossubidos/noticortas.bd";

	open ('PAGINA',$BaseDeDatos);
		$i = 0;
		while(<PAGINA>){
			($Titular[$i],$Noticia[$i]) = split($separador,$_);
			$Noticia[$i] =~ s/<BR>/\n/g;
			$i = $i+1;
		}
	close ('PAGINA');


	# ##################################################
	# LO LOGRE!!!
	# 4:05 14/06/00 
	# escuchando 'One of this days' de Pink Floyd
	# ##################################################
		open ('PAGINA',$PlantillaDeIngreso);
			while(<PAGINA>){
				$_ =~ s/"/'/g;
				$texto=$texto."print \"$_\";\n";
			}
		close ('PAGINA');
		eval ($texto);