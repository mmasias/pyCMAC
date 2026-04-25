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
	# $DirectorioDeDatos = '/export/htdocs/cmac-sullana';
    $DirectorioDeDatos = 'C:/Inetpub/wwwroot/cmac';

	$Linea = "<hr size=1 color=#000080>";
	$Accion = 'busqueda.emails.pl';
	$Separador = "¤";

	$Plantilla 	 	 	    = $DirectorioDeDatos."/cgi-bin/plantillas/busqueda.emails.htm";
	$Encabezado				= $DirectorioDeDatos."/cgi-bin/plantillas/!encabezado.generico.htm";
	$Pie					= $DirectorioDeDatos."/cgi-bin/plantillas/!pie.generico.htm";
	$Correos				= $DirectorioDeDatos."/cgi-bin/basesdatos/correos.bd";
	$TablaDeCargos 			= $DirectorioDeDatos."/cgi-bin/basesdatos/cargos.bd";
	$TablaDeCiudades 		= $DirectorioDeDatos."/cgi-bin/basesdatos/ciudades.bd";

# EXTRAER CRITERIOS
	if ($ObjetoCGI->param("btnBuscar") ne "") {$Busca = "SI" } else {$Busca = "NO" };
	if ($ObjetoCGI->param("cmbCiudad") ne $Separador) {$Ciudad = $ObjetoCGI->param("cmbCiudad")};
	if ($ObjetoCGI->param("cmbCargo")  ne $Separador) {$Cargo  = $ObjetoCGI->param("cmbCargo")};
	if ($ObjetoCGI->param("txtNombre") ne "") {$Nombre = $ObjetoCGI->param("txtNombre");};
	
#	if (($Ciudad ne "" || $Cargo ne "" || $Nombre ne "") && ($Busca eq "SI")) {	
#		$Criterios = "Se encontraron las siguientes coincidencias:"
#	}
#	else
#	{
#		$Busca = "NO"
#	}


# LEER CARGOS
	open ('CARGOS',$TablaDeCargos);
		while(<CARGOS>){
			$_ =~ s/\n//g;
			if ($_ eq $Cargo) {$Muestra = "selected"} else {$Muestra = ""}
			$ListaCargos = $ListaCargos."<OPTION $Muestra>$_</OPTION>\n"
		}
	close ('CARGOS');

# LEER CIUDADES
	open ('CIUDADES',$TablaDeCiudades);
		while(<CIUDADES>){
			$_ =~ s/\n//g;
			if ($_ eq $Ciudad) {$Muestra = "selected"} else {$Muestra = ""}
			$ListaCiudades = $ListaCiudades."<OPTION $Muestra>$_</OPTION>\n"
		}
	close ('CIUDADES');


# HACER LA MALDITA BUSQUEDA
	$Prueba = '</td><td>';
	open ('CORREOS',$Correos);
		while (<CORREOS>){
			($miNumero,$miAgencia,$miCiudad,$miCargo,$miApellidos,$miNombres,$miEmail) = split($Separador);

			$Linea  = $_;

			$Linea  =~ tr/A-Z/a-z/;
			$Linea  =~ tr/¤/ /;
			$Nombre =~ tr/A-Z/a-z/;
			 

			
			print "$Busca // $Nombre --- $Linea -- // $Ciudad - $Cargo //";
			
			if ((($Linea =~ /$Nombre/) ) && ($Busca eq "SI")) 
			{
				
				$Muestra = "SI";
				
				if (($Ciudad ne "") && ($miCiudad ne $Ciudad)) 
					{
					 $Muestra = "NO";
					}
				if (($Cargo ne "") && ($miCargo ne $Cargo))
					{
					 $Muestra = "NO";
				    }
			 }
			if ($Muestra eq "SI") 
				{
					$Respuesta = $Respuesta."<tr>
											<td class='TextoNormal2'>$miCiudad</td>
											<td class='TextoNormal2'>$miCargo</td>
											<td class='TextoNormal2'>$miApellidos, $miNombres</td>
											<td class='TextoNormal'><a href='mailto:$miEmail'>$miEmail</a></td></tr>";
			}
						
			
			print "$Muestra <br>";	
		}

	# ##################################################
	# LO LOGRE!!!
	# 4:05 14/06/00 
	# escuchando 'One of this days' de Pink Floyd
	# ##################################################
		open ('PAGINA',$Encabezado);
			while(<PAGINA>){
				$_ =~ s/"/'/g;
				$texto=$texto."print \"$_\";\n";
			}
		close ('PAGINA');
		open ('PAGINA',$Plantilla);
			while(<PAGINA>){
				$_ =~ s/"/'/g;
				$texto=$texto."print \"$_\";\n";
			}
		close ('PAGINA');
		open ('PAGINA',$Pie);
			while(<PAGINA>){
				$_ =~ s/"/'/g;
				$texto=$texto."print \"$_\";\n";
			}
		close ('PAGINA');
		
		eval ($texto);