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
	$Accion = 'calculadora.plazo.fijo.soles.pl';
	$Separador = "¤";

	$Plantilla		= $DirectorioDeDatos."/cgi-bin/plantillas/plazo.fijo.soles.htm";
	$Encabezado		= $DirectorioDeDatos."/cgi-bin/plantillas/!encabezado.generico.htm";
	$Pie			= $DirectorioDeDatos."/cgi-bin/plantillas/!pie.generico.htm";
	$TablaDias		= $DirectorioDeDatos."/cgi-bin/basesdatos/pfsDias.bd";
	$TablaMontos 	= $DirectorioDeDatos."/cgi-bin/basesdatos/pfsMontos.bd";
	$TablaTasas		= $DirectorioDeDatos."/cgi-bin/basesdatos/pfsTabla.bd";

# OBTENER VARIABLES
	$miIDDia 	= $ObjetoCGI->param("txtDias");
	$miMonto 	= $ObjetoCGI->param("txtMonto");
	
# EXTRAER TASA
	# EXTRAER ID DE DIA
		open ('DIA',$TablaDias);
		$miPlazo = "<table cellpadding='2' border=1><tr>";
			while (<DIA>){
				$_ =~ s/\n//g;
				($ID, $Dia) = split($Separador, $_);
				if ($miIDDia eq $ID) { $miDia = $Dia }
				$miPlazo = $miPlazo."<td><input type='radio' name='txtDias' value='$ID'>$Dia</td>"	
			}
		# $miPlazo = $miPlazo."<td><input type='text' size='4' name='txtDias'></td>";		
		$miPlazo = $miPlazo."</tr></table>";	
		close ('DIA');
		
	# EXTRAER ID DE MONTO
		open ('MONTO',$TablaMontos);
			while (<MONTO>){
				$_ =~ s/\n//g;
				($ID, $Monto) = split($Separador, $_);
				if ($miMonto >= $Monto) { $miIDMonto = $ID }
			}
		close ('MONTO');
		
	#	EXTRAER TASA NOMINAL
		open ('TASA',$TablaTasas);
			while (<TASA>){
				$_ =~ s/\n//g;
				($IDDia, $IDMonto, $TNA) = split($Separador, $_);
				if (($IDMonto eq $miIDMonto) && ($IDDia eq $miIDDia)) {$miTNA = $TNA}
			}
		close ('TASA');
	
# CALCULAR FACTOR DIARIO
	$FactorDiario = (($miTNA/36000)+1);
	
# NUEVO MONTO	
	$NuevoMonto = $miMonto * (($FactorDiario) ** $miDia);

# Cadena a imprimir
  if ($NuevoMonto>0) {
     $NuevoMonto = sprintf("%.2f",$NuevoMonto);
  	 $Resultado = "<h1 class='TitularSeccion'>Resultados de la simulación</h1>
	 			  <div align='center'>
	 			  <table border='0' cellpadding='5' cellspacing='5' width='500' bgcolor='#EEEEEE'>
				  <tr><td>
	 			  <p class='TextoNormal2'>
				  Para un monto inicial de <b>$miMonto</b>,<br>
				  durante un período de <b>$miDia</b> días,<br>
				  el monto final que se obtiene es de <b>$NuevoMonto</b>
				  </td></tr></table>
				  </div>";	
				  # con un factor diario de <b>$FactorDiario</b> (TNA = $miTNA)<br>
	}
	
# LEER DIAS
	open ('DIAS',$TablaDias);
		while(<DIAS>){
			($ID, $Dia) = split($Separador, $_);
			$_ =~ s/\n//g;
			if ($_ eq $Dias) {$Muestra = "checked"} else {$Muestra = ""}
			$optPlazos = $optPlazos."[ <input type='radio' name='optDia' value='$ID' $Muestra>$Dia ]  "
		}
	close ('DIAS');




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