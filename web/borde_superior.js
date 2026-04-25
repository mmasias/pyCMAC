/* Creado el 13 de Octubre del 2002 */
/* by 0r3j0 & P14j3n0 */
/*
	ESTE DOCUMENTO CONTIENE LAS DEFINICIONES DEL INDICE SUPERIOR DE LAS PAGINAS DEL WEB
	PARA INCLUIRLO INSERTE EN EL HTML LA SIGUIENTE LINEA:
		<script src='NombreDelArchivo.js'></script>		
*/

var separador = "<font color='#FFFFFF'>&nbsp;&nbsp;|&nbsp;&nbsp;</font>";

/* PARTE SUPERIOR - SEA CUIDADOSO AL MODIFICAR */
/* SE REQUIERE QUE LAS RUTAS SEAN ABSOLUTAS! */
document.write("<table border='0' cellspacing='0' bordercolor='#111111' width='100%' bgcolor='#EEEEEE'>");
document.write("<tr>");
	document.write("<td align='center'>");
		document.write("<img border='0' src='/images/logo001.gif' hspace='2' vspace='2' width='54'>");
	document.write("</td>");
	document.write("<td valign='bottom'>");
		document.write("<table height='67' border='0' cellpadding='0' cellspacing='0' bordercolor='#111111' width='100%'>");
		document.write("<tr>");
		document.write("<td width='100%' align='right' valign='top'>");
		document.write("<p class='TextoNormal'><script>miFecha()</script></p>");
		document.write("</td>");
		document.write("</tr>");
		document.write("<tr>");
		document.write("<td width='100%' height='100%' valign='bottom'>");
		document.write("<img border='0' valign='bottom' src='/images/logo_caja_municipal.gif' width='384' height='42'>");
		document.write("</td>");
		document.write("</tr>");
		document.write("</table>");
	document.write("</td>");
document.write("</tr>");

/* BOTON INICIO */
/* La pagina de inicio deberia definir una variable llamada PaginaInicial = 1 */
/* Para que no aparezca alli este botón */
document.write("<tr>");
	document.write("<td height='22' align='center' style='border-left-width: 1; border-right-width: 1; border-top: 1px solid #DD0000; border-bottom-width: 1'>");
		document.write("<p class='Menu'>&nbsp;");

		if (OcultaBotonInicio!=1) 
			{
				document.write("<a class='btnInicio' href='/index.htm'>Inicio</a>")
			}
		
		document.write("</p>");
	document.write("</td>");
document.write("<td style='border-left-width: 1; border-right-width: 1; border-top: 1px solid #DD0000; border-bottom-width: 1' bgcolor='#DD0000'>");

/* TIRA DE MENU */
/* SE REQUIERE QUE LAS RUTAS SEAN ABSOLUTAS! */
document.write("<p class='Menu'>&nbsp;");
	document.write("<a class='Menu' href='/001_000.htm'>Nuestra Institución</a>");
	document.write(separador);
	document.write("<a class='Menu' href='/002_000.htm'>Nuestro Equipo</a>");
	document.write(separador);
	document.write("<a class='Menu' href='/003_000.htm'>Servicios</a>");
	document.write(separador);
	document.write("<a class='Menu' href='/cgi-bin/busqueda.emails.pl'>Directorio Electrónico</a>");
	document.write("</p>");
document.write("</td>");
document.write("</tr>");

document.write("</table>");