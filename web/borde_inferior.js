/* Creado el 13 de Octubre del 2002 */
/* by 0r3j0 & P14j3n0 */

/*
	ESTE DOCUMENTO CONTIENE LAS DEFINICIONES DEL INDICE INFERIOR DE LAS PAGINAS DEL WEB
	PARA INCLUIRLO INSERTE EN EL HTML LA SIGUIENTE LINEA:
	
		<script src='NombreDelArchivo.js'></script>		
*/

var separador = "&nbsp;]&nbsp;&nbsp;|&nbsp;&nbsp;[&nbsp;";

/* PARTE SUPERIOR - SEA CUIDADOSO AL MODIFICAR */
/* SE REQUIERE QUE LAS RUTAS SEAN ABSOLUTAS! */
document.write("<table border='0' cellpadding='2' cellspacing='0' style='border-collapse: collapse; border-top: 1px solid #000000' bordercolor='#111111' width='100%' id='AutoNumber14' bgcolor='#C0C0C0'>");
document.write("<tr>");
document.write("<td width='80%' valign='top'>");
document.write("<font face='MS Sans Serif' size='1'>");
document.write("[&nbsp;");

document.write("<a href='mailto:maestrada@cmac-sullana.com.pe'><font color='#000000'>");
document.write("Contactos");
document.write("</font></a>");

document.write(separador);
document.write("<a href='/declaratoria_privacidad.htm'><font color='#000000'>");
document.write("Privacidad");
document.write("</font></a>");
document.write(separador);

document.write("<a href='/Plan2002.htm'><font color='#000000'>");
document.write("Plan anual de adquisiciones 2002");
document.write("</font></a>");
document.write(separador);

document.write("<a href='/acerca_de.htm'><font color='#000000'>");
document.write("Acerca de este sitio");
document.write("</a>");
document.write("&nbsp;]");
document.write("</font>");
document.write("</td>");

document.write("<td width='20%'>");
document.write("<form action='/cgi-bin/find.pl' method='GET'>");
document.write("<input type='text' name='buscar' size='15' style='font-family: MS Sans Serif; font-size: 8pt; color: #000000'>");
document.write("&nbsp;&nbsp;");
document.write("<input type='submit' value='Buscar!' style='font-family: MS Sans Serif; font-size: 8pt; color: #000000'>");
document.write("&nbsp;");
document.write("</form>");
document.write("</td>");

document.write("</tr>");
document.write("<tr>");
document.write("<td width='100%' align='right' colspan='2'>");
document.write("<font face='MS Sans Serif' size='1'>");
document.write("Copyright <b>Caja Municipal de Sullana</b> - Todos los derechos reservados");
document.write("<br>");
document.write("Desarrollado & Programado para la CMAC por <a href='mailto:mmasias@viabcp.com'><font color='#000000'>¶0r</font></a>");
document.write("</font>");
document.write("</td>");
document.write("</tr>");
document.write("</table>");




