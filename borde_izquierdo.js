/* Creado el 13 de Octubre del 2002 */
/* by 0r3j0 & P14j3n0 */

/*
	ESTE DOCUMENTO CONTIENE LAS DEFINICIONES DEL INDICE IZQUIERDO DE LAS PAGINAS DEL WEB
	PARA INCLUIRLO INSERTE EN EL HTML LA SIGUIENTE LINEA:
	
		<script src='NombreDelArchivo.js'></script>		
*/

document.write("<table border='0' cellpadding='2' cellspacing='0' bordercolor='#111111' width='100%'");

document.write("<tr>");
document.write("<td width='100%' align='center' bgcolor='#DD0000'>");
document.write("<p class='TituloIndice'>Servicios Web</td>");
document.write("</tr>");



// ****************************************
// INICIO DE 1º INDICE 
// ****************************************
	document.write("<tr>");
	document.write("<td width='100%'>");
		document.write("  <p class='Indice'>");
		document.write("  <b>- SIMULADORES</b><br>");
		document.write("  &nbsp; » <a class='Indice' href='/cgi-bin/calculadora.prestamos.soles.pl'>Préstamos en Soles</a><br>");
		document.write("  &nbsp; » <a class='Indice' href='/cgi-bin/calculadora.prestamos.dolares.pl'>Préstamo en Dólares</a><br>");
		document.write("  &nbsp; » <a class='Indice' href='/cgi-bin/calculadora.plazo.fijo.soles.pl'>Plazo Fijo en Soles</a><br>");
		document.write("  &nbsp; » <a class='Indice' href='/cgi-bin/calculadora.plazo.fijo.dolares.pl'>Plazo Fijo en Dólares</a><br>");
		document.write("  <br>");

// ****************************************
// INICIO DE 2º INDICE 
// ****************************************
		document.write("  <b>- CONTACTOS<br></b>");
		document.write("  &nbsp; » <a class='Indice' href='/archivossubidos/noticortas.htm'>Noticortas CMAC</a><br>");
		document.write("  &nbsp; » <a class='Indice' href='nuestras_oficinas.htm'>Nuestras Oficinas</a><br>");
		document.write("  &nbsp; » <a class='Indice' href='/cgi-bin/consultas.pl'>Buzón de sugerencias</a>");
		document.write("  &nbsp;");
	document.write("  </td>");
	document.write("  </tr>");
// ****************************************
// FIN DE INDICES 
// ****************************************

document.write("  <tr>");
document.write("    <td width='100%' align='center' bgcolor='#DD0000'>");
document.write("    <p class='TituloIndice'>Promociones</td>");
document.write("  </tr>");

// ****************************************
// INICIO BANNER (IMAGEN CON LINK)
// ****************************************
		document.write("<tr>");
		document.write("<td width='100%' align='center'>");
			// IMAGEN CON LINK
			document.write("<a href='cts.htm'>");
			document.write("<img border='1' src='images/webcts_small.gif'>");
			document.write("</a>");
			document.write("<br>");
			// DESCRIPCION LARGA
			document.write("<font face='Verdana' size='1'>");		
			document.write("<b>¡Ahorro que da seguridad y rinde más!</b>");
			document.write("</font>");
		document.write("</td>");
		document.write("</tr>");
		document.write("<tr>");
		document.write("<td width='100%' align='right'>");
			// LINK DE DETALLES	
			document.write("<font color='#DD0000' face='Verdana' size='1'>");
			document.write("[&nbsp;<a href='cts.htm'><font color='#DD0000'>Detalles</font></a>&nbsp;]");
			document.write("</font>");
		document.write("</td>");
		document.write("</tr>");
// ****************************************
// FIN BANNER 
// ****************************************


// ****************************************
// INICIO DE UNA LINEA
// ****************************************
		document.write("  <tr>");
		document.write("    <td width='100%' align='center'>");
		document.write("    <hr color='#DD0000' width='80%' size='1'>");
		document.write("    </td>");
		document.write("  </tr>");
// ****************************************
// FIN DE UNA LINEA
// ****************************************

// ****************************************
// INICIO BANNER (IMAGEN CON LINK)
// ****************************************
		document.write("<tr>");
		document.write("<td width='100%' align='center'>");
			// IMAGEN CON LINK
			// document.write("<a href='cts.htm'>");
			document.write("<img border='1' src='images/creditos_alcance_mano.gif'>");
			// document.write("</a>");
			document.write("<br>");
			// DESCRIPCION LARGA
/*			document.write("<font face='Verdana' size='1'>");		
			document.write("<b>¡Ahorro que da seguridad y rinde más!</b>");
			document.write("</font>");*/
		document.write("</td>");
		document.write("</tr>");
		document.write("<tr>");
		document.write("<td width='100%' align='right'>");
			// LINK DE DETALLES	
			document.write("<font color='#DD0000' face='Verdana' size='1'>");
			document.write("[&nbsp;<a href='003_001.htm'><font color='#DD0000'>Detalles</font></a>&nbsp;]");
			document.write("</font>");
		document.write("</td>");
		document.write("</tr>");
// ****************************************
// FIN BANNER 
// ****************************************
		
document.write("  <tr>");
document.write("    <td width='100%' align='center'>&nbsp;</td>");
document.write("  </tr>");
document.write("  </table>");