function miFecha() {
		Stamp = new Date();
		
		year = Stamp.getYear();
		if (year < 2000) year = 1900 + year;
		
		meses= new Array ("Enero","Febrero","Marzo","Abril","Mayo",
		"Junio","Julio","Agosto","Septiembre","Octubre","Noviembre",
		"Diciembre");
		mes = Stamp.getMonth();
		mes = meses[mes];
		
		dias = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");
		dia = Stamp.getDay();
		dia = dias[dia];
		
	    document.write(dia +' '+ Stamp.getDate()+' de '+ mes + " del "+ year );
}