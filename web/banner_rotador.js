/* Creado el 13 de Octubre del 2002 */
/* by 0r3j0 & P14j3n0 */

/*
	ESTE DOCUMENTO CONTIENE LAS DEFINICIONES DEL BANNER VARIABLE
	PARA INCLUIRLO INSERTE EN EL HTML LA SIGUIENTE LINEA:
	
		<script src='NombreDelArchivo.js'></script>		
*/

	var n = 1; 
	var m = 1; // Valor inicial
	var r = 5; // Numero de imagenes - 1
	
	n = (Math.round(Math.random()*r) + 1);
	m = (Math.round(Math.random()*10) + 1);

/* PARTE SUPERIOR - SEA CUIDADOSO AL MODIFICAR */
/* SE REQUIERE QUE LAS RUTAS SEAN ABSOLUTAS! */
document.write("<font face='Arial Narrow' size='4' color='#F70000'><b>");
if (m<5) {document.write("Solidez de una institución que crece");} else {document.write("Somos la mano amiga que necesitas");}
document.write("</b></font><br><br>");
document.write("<img src='/images/banners/banner_00" + n + ".gif'>");


