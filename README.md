# pyCMAC

Sitio web institucional de la **Caja Municipal de Ahorro y Crédito de Sullana** (CMAC Sullana), institución financiera peruana fundada en 1986 especializada en microcrédito y captación de ahorro popular en las provincias de Sullana, Talara, Tumbes, Barranca y Huaura-Huacho.

Proyecto desarrollado entre **2000 y 2002** por `[0r3j0]` y `[P14j3n0]`.

---

## Autoría

Los archivos firman con dos pares de autores en leet speak:

- Los componentes JavaScript (`borde_*.js`, `banner_rotador.js`) llevan firma `0r3j0 & P14j3n0`, con fecha **13 de octubre de 2002**.
- Los scripts CGI/Perl llevan firma `[Dr.+ñas] & [0r3j0]`.
- El pie de página del sitio enlaza a `mmasias@viabcp.com` con el texto `©0r` — `0r3j0` es el compañero de proyecto.

---

## Cronología

Los scripts CGI incluyen el siguiente comentario en múltiples archivos:

```perl
# ##################################################
# LO LOGRE!!!
# 4:05 14/06/00
# escuchando 'One of this days' de Pink Floyd
# ##################################################
```

El timestamp `14/06/00` sitúa la primera versión funcional del backend en la **madrugada del 14 de junio de 2000** — más de dos años antes del empaquetado final del frontend (13 de octubre de 2002). El comentario marca el momento exacto en que se resolvió el patrón de motor de plantillas que usa todos los scripts.

---

## Estructura del sitio

```
pyCMAC/
├── index.htm                    # Portada
├── 001_000.htm ... 001_004.htm  # Nuestra Institución
├── 002_000.htm ... 002_003.htm  # Nuestro Equipo
├── 003_000.htm ... 003_006.htm  # Servicios
├── cts.htm                      # Producto CTS
├── nuestras_oficinas.htm        # Agencias
├── acerca_de.htm                # Requisitos técnicos del sitio
├── estilo_generico.css          # Hoja de estilos global
├── fecha.js                     # Componente: fecha en español
├── borde_superior.js            # Componente: cabecera + menú principal
├── borde_izquierdo.js           # Componente: menú lateral + banners
├── borde_inferior.js            # Componente: pie + buscador
├── banner_rotador.js            # Componente: banner con texto aleatorio
├── images/                      # Logos, fotos, animaciones Flash (.swf)
├── cgi-bin/
│   ├── calculadora.prestamos.soles.pl
│   ├── calculadora.prestamos.dolares.pl
│   ├── calculadora.plazo.fijo.soles.pl
│   ├── calculadora.plazo.fijo.dolares.pl
│   ├── busqueda.emails.pl
│   ├── noticortas.edita.pl
│   ├── noticortas.graba.pl
│   ├── basesdatos/              # Tablas de tasas y datos de empleados
│   └── plantillas/              # Plantillas HTML para los scripts CGI
├── archivossubidos/             # Noticias publicadas (noticortas.htm + .bd)
└── basurero/                    # Hojas de estilo descartadas
```

### Secciones de contenido

| Sección | Archivos | Contenido |
|---------|----------|-----------|
| Portada | `index.htm` | Animación Flash, mensaje del presidente, banner rotador, sorteo de departamento |
| Nuestra Institución | `001_000` - `001_004` | Historia (1986-2001), Visión, Misión, Valores, Grupo Objetivo |
| Nuestro Equipo | `002_000` - `002_003` | Directorio, Gerencia, Funcionarios, Personal |
| Servicios | `003_000` - `003_006` | Créditos (pequeña empresa, agrícola, personal), Ahorro Corriente, Plazo Fijo, CTS |

---

## Tecnología

### Frontend

- **Maquetación:** tablas HTML anidadas a 700 px de ancho fijo, optimizadas para resolución 800x600 a 16 bits de color
- **Estilos:** hoja CSS externa (`estilo_generico.css`) en `iso-8859-1`; paleta institucional rojo `#DD0000` + gris `#EEEEEE`
- **Fuentes:** Verdana y Arial Narrow como primarias; MS Sans Serif en el pie
- **Multimedia:** animación Macromedia Flash 4 en portada (`images/cmac_001.swf`)
- **Editor:** Microsoft FrontPage 5.0
- **Navegadores objetivo:** Internet Explorer y Netscape Communicator (con soporte declarado para Java, Acrobat Reader y Shockwave Flash)

### Componentización JavaScript

La arquitectura de componentes es la decisión técnica más notable del proyecto. En lugar de duplicar cabeceras, menús y pies en cada página, se extraen a archivos `.js` independientes e incluidos con:

```html
<script src='borde_superior.js'></script>
```

Cada archivo genera su HTML mediante `document.write()`:

```javascript
/* borde_superior.js — Creado el 13 de Octubre del 2002 by 0r3j0 & P14j3n0 */

document.write("<table border='0' ...>");
document.write("<img border='0' src='/images/logo001.gif'>");
// ...
if (OcultaBotonInicio != 1) {
    document.write("<a class='btnInicio' href='/index.htm'>Inicio</a>");
}
```

La variable `OcultaBotonInicio` se define en cada página HTML antes de incluir el componente, permitiendo que la portada suprima el botón de inicio sin lógica en el servidor. Es un proto-componente parametrizado, sin frameworks, sin preprocesadores, sin server-side includes — solo JavaScript del lado del cliente.

El menú de navegación, el menú lateral con simuladores y banners promocionales, y el pie con buscador y copyright se construyen todos con este mismo patrón.

El `banner_rotador.js` combina aleatoriedad doble: elige una imagen entre 5 (`banner_001.gif` ... `banner_005.gif`) y un eslogan entre dos según otra variable aleatoria:

```javascript
var r = 5;
n = (Math.round(Math.random() * r) + 1);
m = (Math.round(Math.random() * 10) + 1);

if (m < 5) {
    document.write("Solidez de una institución que crece");
} else {
    document.write("Somos la mano amiga que necesitas");
}
document.write("<img src='/images/banners/banner_00" + n + ".gif'>");
```

El `fecha.js` muestra la fecha actual en español con arrays de nombres de días y meses, con corrección manual del bug del año 2000 en `getYear()`:

```javascript
year = Stamp.getYear();
if (year < 2000) year = 1900 + year;
```

### Backend: CGI/Perl

Todos los scripts están escritos en **Perl 5.003** usando el módulo `CGI` del CPAN. El servidor de producción era Unix (`/export/htdocs/cmac-sullana`); el entorno de desarrollo era Windows IIS (`C:/Inetpub/wwwroot/cmac`). La ruta activa está comentada/descomentada según el entorno — algunos scripts quedaron con la ruta de desarrollo.

#### Motor de plantillas por `eval()`

El patrón central del backend, resuelto a las 4:05 del 14 de junio de 2000, es un motor de plantillas construido sobre `eval()`:

```perl
open ('PAGINA', $PlantillaHTML);
while (<PAGINA>) {
    $_ =~ s/"/'/g;                        # comillas dobles -> simples
    $texto = $texto . "print \"$_\";\n";  # envuelve cada línea en print "..."
}
close ('PAGINA');
eval($texto);  # ejecuta el Perl generado; las variables ya definidas se interpolan
```

La plantilla HTML es un archivo estático. El script define sus variables de resultado antes de leer la plantilla; cuando `eval()` ejecuta los `print "..."` generados, Perl interpola las variables en las cadenas. No hay sintaxis de plantilla especial: es Perl interpolando Perl.

#### Bases de datos en texto plano

Los datos de tasas y empleados se almacenan en archivos `.bd` con `ñ` (`\xf1`, ISO-8859-1) como separador de campos — un carácter elegido por ser improbable en los datos financieros:

`scsMontos.bd` (tasas para préstamos en soles):
```
2999ñ3.95ñ59.18
9999ñ3.5ñ51.11
29999ñ3ñ42.58
999999999ñ2.8ñ39.29
```

Formato: `límite_de_monto | tasa_mensual_% | tasa_anual_%`

Hay seis tablas de tasas (`scs`/`scd` para préstamos en soles/dólares; `pfs`/`pfd` para plazo fijo en soles/dólares), más tablas de empleados (`correos.bd`), cargos y ciudades.

#### Simulador de préstamos

Implementa la tabla de amortización completa usando la fórmula de anualidad:

```perl
$Factor = ($TasaDeInteres * ((1 + $TasaDeInteres) ** $NumeroDeCuotas))
        / (((1 + $TasaDeInteres) ** $NumeroDeCuotas) - 1);
$Cuota = $Prestamo * $Factor;
```

La tasa de interés se determina leyendo `scsMontos.bd` y buscando el primer tramo cuyo límite supere al monto solicitado. El script genera la tabla de amortización período a período, mostrando saldo inicial, cuota, capital, intereses y saldo final en cada fila.

#### Simulador de plazo fijo

Usa capitalización compuesta diaria con tasa nominal anual:

```perl
$FactorDiario = (($miTNA / 36000) + 1);
$NuevoMonto   = $miMonto * ($FactorDiario ** $miDia);
```

La tasa nominal (`$miTNA`) se extrae de una tabla bidimensional indexada por tramo de monto y tramo de días (`pfsTabla.bd`). Los plazos menores a 31 días se rechazan explícitamente.

#### Directorio electrónico

Búsqueda de empleados por nombre, ciudad y cargo sobre `correos.bd`. El script aplica los filtros secuencialmente: primero filtra por nombre (con `=~ /$Nombre/` sobre la línea normalizada a minúsculas), luego descarta por ciudad y cargo si se especificaron. El resultado es una tabla con ciudad, cargo, apellidos/nombres y enlace `mailto:`.

El script dejó en el código de producción dos líneas de debug:
```perl
print "$Busca // $Nombre --- $Linea -- // $Ciudad - $Cargo //";
print "$Muestra <br>";
```

#### Sistema de noticias cortas (CMS)

El módulo más sofisticado: un CMS mínimo de dos scripts.

- `noticortas.edita.pl`: lee `noticortas.bd` (base de datos de noticias) y genera un formulario HTML con los titulares y cuerpos actuales pre-rellenados.
- `noticortas.graba.pl`: recibe el formulario, genera la página `noticortas.htm` estática (usando el motor de plantillas + `eval()`), y actualiza simultáneamente `noticortas.bd`. La vista previa se muestra antes de confirmar; el redactor puede pulsar "Atrás" para corregir.

Es generación de páginas estáticas desde un panel de administración — el mismo modelo que usan hoy los generadores de sitios estáticos.

---

## Notas de época

- La portada anunciaba un sorteo de un departamento en la zona residencial "más exclusiva de Lima" para el 4 de enero (previsiblemente 2003).
- El pie enlaza al "Plan anual de adquisiciones 2002" (`Plan2002.htm`) — archivo que no se conserva en este repositorio.
- El correo de contacto institucional era `maestrada@cmac-sullana.com.pe`.
- `basurero/` contiene dos hojas de estilo (`estilo_cmac.css`, `estilo_maestria.css`) descartadas durante el desarrollo.
- `borde_izquierdo.pbp` es el archivo de proyecto de un editor de la época (probablemente HomeSite o similar).
