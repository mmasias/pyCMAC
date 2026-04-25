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

	$Linea = "<hr size=1 color=#000080>";
	$separador = "¤";
	$SaltoDeLinea = "\n";

# Esta variable contiene la ubicacion raiz del Web
# Habría que cambiarla a la ubicacion real
	$DirectorioDeDatos = '/export/htdocs/cmac-sullana';
    # $DirectorioDeDatos = 'C:/Inetpub/wwwroot/cmac';
	
	$PlantillaDeEgreso = $DirectorioDeDatos."/cgi-bin/plantillas/noticortas.egresos.htm";
	$ArchivoDeEgreso = $DirectorioDeDatos."/archivossubidos/noticortas.htm"; 
	$BaseDeDatos = $DirectorioDeDatos."/archivossubidos/noticortas.bd";
	$Registros="T¤JEJE\n";

foreach $key ($ObjetoCGI->param){
	if ((substr($key,0,7) eq 'Titular') && ($ObjetoCGI->param($key) gt '')) {
		$Titular = $ObjetoCGI->param($key);
		$Noticorta=$Noticorta."<h3>".$Titular."</h3>";
		$Registros=$Registros.$Titular.$separador;
		}
	elsif ((substr($key,0,7) eq 'Noticia') && ($ObjetoCGI->param($key) gt '')) {
		$Noticia = $ObjetoCGI->param($key);
			$Noticia =~ s/\n/<BR>/g;	
			$Noticia =~ s/\r//g;
		$Noticorta=$Noticorta."<p>".$Noticia."</p>$Linea";
		$Registros=$Registros.$Noticia.$SaltoDeLinea;
		}
}

# Creación de la pagina noticortas.htm
# ###################################################
	print "<h1><font color='red'>Presentacion preliminar</font></h1>";
	print "Si desea corregir algo, pulse el botón ATRAS de su navegador $Linea";
	open ('PAGINA',$PlantillaDeEgreso);
	open ('NUEVAPAGINA',">".$ArchivoDeEgreso);
		while(<PAGINA>){
			$_ =~ s/"/'/g;
			$texto=$texto."print \" $_ \";\n";
			$textoHTML=$textoHTML."print NUEVAPAGINA \" $_ \";\n";
		}
	eval($texto);
	eval($textoHTML);
	close ('PAGINA');
	close ('NUEVAPAGINA');
	
	open ('BASEDATOS',">".$BaseDeDatos);
		print BASEDATOS "$Registros";
	close ('BASEDATOS');
#	print "<hr>Base de datos: $BaseDeDatos<hr>Archivo de datos $ArchivoDeEgreso<hr>";	