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

	$Plantilla	    = $DirectorioDeDatos."/cgi-bin/plantillas/monto.prestamo.htm";	
	$Encabezado		= $DirectorioDeDatos."/cgi-bin/plantillas/!encabezado.generico.htm";
	$Pie			= $DirectorioDeDatos."/cgi-bin/plantillas/!pie.generico.htm";
	$ArchivoTasas	= $DirectorioDeDatos."/cgi-bin/basesdatos/scdMontos.bd";
	
$miOperacion = $ObjetoCGI->param('btnOperacion');

# #########################
# Le' Encabe... perdón!!! The Header!!! :oP
# #########################
	open ('PAGINA',$Encabezado);
	while(<PAGINA>){
		$_ =~ s/"/'/g;
		$texto=$texto."print \"$_\";\n";
	}
	close ('PAGINA');
	
	eval($texto);
	$texto = "";
# #########################

print "<h1 class='TitularSeccion'>Simulador de Préstamo - Dólares americanos</h1>";

if ($miOperacion eq "-=CALCULAR=-") {
# #########################
# Calculos
# #########################
   $Prestamo 		= $ObjetoCGI->param('txtPrestamo');
   $NumeroDeCuotas 	= $ObjetoCGI->param('txtCuotas');
   $FormaPago 		= $ObjetoCGI->param('cmbFormaPago');

   # ###########################
   # Definir Tasa de Interes
   # ###########################
    $TasaDeInteres = 0;
	open ('PAGINA',$ArchivoTasas);
	while(<PAGINA>){
	  ($Monto, $TasaMensual, $TasaAnual) = split("¤",$_);
	  # print "$Prestamo - $Monto - $TasaMensual - $TasaAnual<br>";
	  if ($Prestamo < $Monto) {
	      $TasaDeInteres = $TasaMensual / 100; 
		  last;
		  }
	}
	close 'PAGINA';

   $Factor = ($TasaDeInteres * ((1 + $TasaDeInteres) ** $NumeroDeCuotas)) / (((1 + $TasaDeInteres) ** $NumeroDeCuotas) - 1);
   $Cuota = $Prestamo * $Factor;

   print "<div align='center'>";
   print "<table border='0' cellpadding='5' cellspacing='5' width='650' bgcolor='#EEEEEE'>";
   print "<tr><td>";
   
   print "<p class='TextoNormal2'>Se ha solicitado un prestamo de US$ <b>$Prestamo</b><br>
   		 a pagar en <b>$NumeroDeCuotas</b> cuotas mensuales.<br><br>";
#		 TASA DE INTERES MENSUAL= $TasaDeInteres (NOTA: Esto no saldrá publicado en la version final)<br><br>";
   print "A continuación se muestra la tabla que resume el ejercicio:</p>";

   $Periodo=1;

   $PrincipalAlFinal   	  = $Prestamo; 
   print "<div align='center'>";
   print "<table border=1 cellpadding=4>";
   print "<tr bgcolor='#000000' class='Menu'>
   		 	  <td>Nº</td>
			  <td>Saldo</td> 
			  <td>Cuota</td>
			  <td>Capital</td> 
			  <td>Intereses</td>   
			  <td>Saldo a cancelar</td>
		  </tr>";

   while ($Periodo<=$NumeroDeCuotas) {
   
      $PrincipalAlInicio = $PrincipalAlFinal;
      if ($PrincipalAlInicio <= 0) {$Cuota = 0}
	  $PagoTotal = $Cuota;
	  $PagoDeIntereses = $PrincipalAlInicio * $TasaDeInteres;
	  $PagoDelPrincipal = $PagoTotal - $PrincipalAlInicio * $TasaDeInteres;
	  $PrincipalAlFinal = $PrincipalAlInicio - $PagoDelPrincipal;
	  printf ("<tr>
   			  	  <td align='right' class='TextoNormal2'>%.0f</td>
				  <td align='right' class='TextoNormal2'>%.2f</td> 
			  	  <td align='right' class='TextoNormal2'>%.2f</td> 
			  	  <td align='right' class='TextoNormal2'>%.2f</td> 
			  	  <td align='right' class='TextoNormal2'>%.2f</td> 
			  	  <td align='right' class='TextoNormal2'>%.2f</td>
		       </tr>", $Periodo,
		  		       $PrincipalAlInicio,
					   $PagoTotal, 
				  	   $PagoDelPrincipal, 
				  	   $PagoDeIntereses, 
				  	   $PrincipalAlFinal);

   	  $Periodo = $Periodo+1;
   }   
   print "</table>";
   print "</div>";
   print "</td></tr></table>";
   print "</div>";
   
   print "<h1 class='TitularSeccion'>Nueva Simulación:</h1>";   
	   
}
# #########################
# Le Formularie :oP
# #########################
  
	open ('paginaFormulario',$Plantilla);
	while(<paginaFormulario>){
	    $_ =~ s/"/'/g;
		$texto=$texto."print \" $_ \";\n";									
	}
	close('paginaFormulario');

# #########################
# Le' Pie :oP
# #########################

	open ('PAGINA',$Pie);
	while(<PAGINA>){
		$_ =~ s/"/'/g;
		$texto=$texto."print \"$_\";\n";
	}
	close ('PAGINA');
	 
	 eval($texto);