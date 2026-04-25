# pyCMAC - CMAC Sullana Web Site

## Descripción del Proyecto

**pyCMAC** es el sitio web institucional de la Caja Municipal de Ahorro y Crédito de Sullana (CMAC Sullana), desarrollado alrededor de 2000-2001. A pesar del nombre del repositorio, la aplicación está construida principalmente en Perl/CGI, no Python. El proyecto incluye simuladores financieros, sistemas de gestión de contenidos (CMS) para noticias, herramientas administrativas y páginas informativas sobre servicios financieros.

## Arquitectura Técnica

### Stack Tecnológico

- **Backend**: Perl 5.003 con módulo CGI (CPAN)
- **Frontend**: HTML 4.01, JavaScript, CSS
- **Motor de plantillas**: Sistema de plantillas basado en archivos .htm con sustitución de variables
- **Base de datos**: Archivos de texto plano delimitados por el carácter `¤` (Windows-1252)
- **Servidor web**: Diseñado para Apache en UNIX o IIS en Windows

### Estructura de Directorios

```
pyCMAC/
├── cgi-bin/                 # Scripts Perl CGI
│   ├── basesdatos/         # "Bases de datos" en texto plano
│   │   ├── correos.bd      # Directorio de correos
│   │   ├── ciudades.bd     # Lista de ciudades
│   │   ├── cargos.bd       # Lista de cargos
│   │   ├── pfsTabla.bd     # Tasas plazo fijo soles
│   │   ├── pfdTabla.bd     # Tasas plazo fijo dólares
│   │   ├── scsMontos.bd    # Tasas préstamos soles
│   │   └── scdMontos.bd    # Tasas préstamos dólares
│   └── plantillas/         # Plantillas HTML para scripts CGI
├── archivossubidos/        # Archivos generados dinámicamente
├── images/                 # Imágenes y banners
├── plantillas/             # Plantillas del sitio estático
├── *.htm                   # Páginas estáticas del sitio
├── *.js                    # Scripts JavaScript
└── estilo_generico.css     # Hoja de estilos global
```

## Componentes Principales

### 1. Simuladores Financieros

#### Calculadora de Plazo Fijo
- `calculadora.plazo.fijo.soles.pl`: Simulador para depósitos en soles
- `calculadora.plazo.fijo.dolares.pl`: Simulador para depósitos en dólares

**Lógica de cálculo**:
```
FactorDiario = (TNA/36000) + 1
NuevoMonto = MontoInicial × (FactorDiario ^ Dias)
```

Donde TNA (Tasa Nominal Anual) se obtiene de tablas bidimensionales basadas en:
- Rango de monto (umbrales predefinidos)
- Rango de días (30, 60, 90, 180, 360)

#### Calculadora de Préstamos
- `calculadora.prestamos.soles.pl`: Simulador de cuotas en soles
- `calculadora.prestamos.dolares.pl`: Simulador de cuotas en dólares

**Lógica de cálculo (sistema francés)**:
```
Factor = (i × (1+i)^n) / ((1+i)^n - 1)
Cuota = Monto × Factor
```

Donde:
- `i` = Tasa de interés mensual (según rango de monto)
- `n` = Número de cuotas

La calculadora genera una tabla de amortización detallada mostrando:
- Número de periodo
- Saldo al inicio del periodo
- Cuota total (constante)
- Pago a capital
- Pago de intereses
- Saldo restante

### 2. Sistema de Gestión de Contenidos (CMS)

#### NotiCortas
- `noticortas.edita.pl`: Editor de noticias (solo lectura)
- `noticortas.graba.pl`: Grabador de noticias

El sistema permite gestionar hasta 5 noticias concurrentes con:
- Titular
- Cuerpo de la noticia
- Publicación automática en `archivossubidos/noticortas.htm`
- Almacenamiento en `archivossubidos/noticortas.bd`

### 3. Directorio de Contactos

#### Buscador de Emails
- `busqueda.emails.pl`: Motor de búsqueda de personal

**Filtros disponibles**:
- Por ciudad (Sullana, Talara, Tumbes, Huacho, Barranca, Huaral, Ayabaca, Aguas Verdes)
- Por cargo (Gerentes, Jefes, Administradores, Ejecutivos, Asistentes)
- Por nombre (búsqueda insensible a mayúsculas)

**Datos almacenados** (`correos.bd`):
```
Numero¤Agencia¤Ciudad¤Cargo¤Apellidos¤Nombres¤Email
```

### 4. Navegación y UI

#### Sistema de Inclusión dinámica
El sitio utiliza JavaScript para incluir componentes comunes:
- `borde_superior.js`: Header con logo y navegación principal
- `borde_izquierdo.js`: Menú lateral con servicios y promociones
- `borde_inferior.js`: Footer con información legal
- `banner_rotador.js`: Banner rotatorio aleatorio

#### Estilos
- `estilo_generico.css`: Hoja de estilos centralizada
  - Clases tipográficas: `.TextoNormal`, `.TextoNormal2`, `.TitularSeccion`
  - Estilos de navegación: `.Menu`, `.Indice`
  - Colores corporativos: Rojo (#DD0000) como color primario

### 5. Páginas Estáticas

El sitio incluye numerosas páginas estáticas organizadas por sección:
- `index.htm`: Página principal
- `acerca_de.htm`: Información sobre el sitio
- `nuestras_oficinas.htm`: Directorio de oficinas
- `003_000.htm` a `003_006.htm`: Secciones de productos
- `002_000.htm` a `002_010.htm`: Información de servicios
- `001_000.htm` a `001_004.htm`: Información institucional
- `sorteo_casa.htm`: Promociones y sorteos
- `cts.htm`: Sistema de Compensación por Tiempo de Servicios
- `cmac_admin.htm`: Panel de administración

## Características Técnicas Notables

### Manejo de Codificación
- Originalmente codificado en Windows-1252
- Uso del carácter `¤` como delimitador en archivos de datos
- Comentarios de encoding en HTML y CSS
- Advertencias de compatibilidad con caracteres extendidos

### Patrón de Plantillas
Los scripts Perl siguen un patrón consistente:
1. Cargar plantilla de encabezado (`!encabezado.generico.htm`)
2. Procesar lógica de negocio
3. Cargar plantilla específica del módulo
4. Cargar plantilla de pie (`!pie.generico.htm`)
5. Evaluar todo el HTML generado con `eval()`

### Configuración del Directorio Raíz
Los scripts tienen una variable para configurar la ruta raíz:
```perl
$DirectorioDeDatos = '/export/htdocs/cmac-sullana';  # Producción UNIX
# $DirectorioDeDatos = 'C:/Inetpub/wwwroot/cmac';     # Desarrollo Windows
```

### Comentarios de los Desarrolladores
Los scripts incluyen comentarios originales:
```
# ##################################################
# LO LOGRE!!!
# 4:05 14/06/00 
# escuchando 'One of this days' de Pink Floyd
# ##################################################
```
```
/* Creado el 13 de Octubre del 2002 */
/* by 0r3j0 & P14j3n0 */
```

## Datos de Ejemplo

### Tasas de Interés - Plazo Fijo Soles (pfsTabla.bd)
Ejemplos de TNA según rangos:
- Monto menor a 1000, 30-59 días: 7.70%
- Monto 1000-5000, 30-59 días: 8.16%
- Monto 5000-10000, 30-59 días: 8.62%
- Monto 10000-20000, 30-59 días: 9.08%
- Monto mayor a 20000, 30-59 días: 9.53%

### Cobertura Geográfica
El sistema maneja 8 ciudades en la región norte de Perú:
- Sullana (sede principal)
- Talara
- Tumbes
- Huacho
- Barranca
- Huaral
- Ayabaca
- Aguas Verdes (oficina especial)

## Requisitos de Ejecución

### Requisitos del Servidor
- Perl 5.003 o superior
- Módulo CGI (incluido en Perl)
- Servidor web con soporte CGI (Apache o IIS)
- Permisos de escritura en directorios `cgi-bin/basesdatos/` y `archivossubidos/`

### Configuración Recomendada
- Resolución mínima: 800x600
- Profundidad de color: 16 bits
- Navegador con soporte JavaScript y Flash 4+
- Se recomienda Internet Explorer o Netscape Communicator (según notas del 2001)

## Archivos de Referencia

### Scripts CGI Principales
- `cgi-bin/calculadora.plazo.fijo.soles.pl`:117 - Cálculo de plazo fijo en soles
- `cgi-bin/calculadora.prestamos.soles.pl`:144 - Cálculo de préstamos en soles
- `cgi-bin/busqueda.emails.pl`:130 - Buscador de personal
- `cgi-bin/noticortas.graba.pl`:61 - CMS de noticias

### Archivos de Datos
- `cgi-bin/basesdatos/correos.bd`:53 - 52 registros de personal
- `cgi-bin/basesdatos/pfsTabla.bd`:26 - Matriz de tasas plazo fijo
- `cgi-bin/basesdatos/ciudades.bd`:8 - Lista de ciudades
- `cgi-bin/basesdatos/cargos.bd`:30 - Lista de cargos

### Archivos de Interfaz
- `index.htm`:175 - Página principal
- `borde_izquierdo.js`:124 - Navegación lateral
- `estilo_generico.css`:27 - Estilos globales
- `banner_rotador.js`:25 - Banner aleatorio

## Estado Actual del Proyecto

El proyecto es un repositorio histórico de código web de principios de los años 2000, rescatado de copias de seguridad. Incluye archivos auxiliares de Microsoft FrontPage (`_vti_cnf/`), copias de seguridad de archivos (con prefijos "Copia de"), y archivos en el directorio `basurero/` que parecen ser trabajos descartados.

## Consideraciones Históricas

- El código refleja prácticas de desarrollo web de la época: CGI puro, plantillas manuales, JavaScript para inclusión dinámica
- Uso de Flash para animaciones y banners
- Dependencia de navegadores específicos de la época (IE5, Netscape 4)
- Sistema de archivos como base de datos (común antes de popularizar MySQL/PostgreSQL en la región)
- Codificación Windows-1252 estándar en aplicaciones Windows/Latin America de la época

## Análisis Crítico

### Fortalezas (contexto histórico)
- **Arquitectura funcional**: El patrón de plantillas con JavaScript para inclusión dinámica era una solución elegante para la época, antes de que frameworks como React o Vue existieran
- **Cálculos financieros correctos**: Las fórmulas implementadas (sistema francés para préstamos, cálculo compuesto para plazo fijo) son matemáticamente correctas
- **Separación razonable**: Aunque primitiva, existe separación entre lógica de negocio (scripts Perl), presentación (plantillas HTML) y datos (archivos .bd)
- **Mantenibilidad**: El uso de plantillas centralizadas (`borde_*.js`, `estilo_generico.css`) facilitaba actualizaciones globales

### Vulnerabilidades evidentes (seguridad moderna)
- **SQL Injection**: Aunque usa archivos de texto, el código usa `eval()` con HTML sin sanitización, vulnerable a XSS
- **Ejecución de código arbitrario**: El patrón `eval($texto)` donde `$texto` proviene de archivos HTML permite ejecución de código Perl si el contenido HTML contiene código malicioso
- **Inyección de dependencias**: Los paths son absolutos y configurados manualmente en cada script

### Problemas técnicos (obsolescencia)
- **Dependencias obsoletas**: Flash 4+, IE5, Perl 5.003 - ninguna versión soportada actualmente
- **Codificación**: Windows-1252 no es UTF-8, causa problemas con caracteres internacionales
- **Concurrencia**: Archivos de texto como BD sin locks, race conditions en escrituras simultáneas
- **Escalabilidad**: Carga de archivos completos en memoria, sin paginación ni optimización de consultas

### Valor didáctico actual
Este proyecto es un **excelente arqueológico de código** para enseñar:
- **Evolución del desarrollo web**: Transición de "web 1.0" estática a aplicaciones dinámicas
- **Historia de la banca digital**: Cómo las instituciones financieras regionales adoptaron tecnología web
- **Ingeniería de software antes de frameworks**: Cómo se construían aplicaciones con herramientas básicas
- **Deuda técnica**: Código funcional pero que requiere refactorización completa para estándares actuales

### Conclusión general
El proyecto es un **documento histórico perfectamente preservado** de programación web empresarial circa 2001-2002 en Perú. No tiene utilidad práctica hoy en día, pero su valor académico es significativo: permite a estudiantes de informática comprender cómo se desarrollaba software en una era anterior a frameworks modernos, bases de datos relacionales accesibles y estándares de seguridad establecidos.

Los comentarios de los desarrolladores ("LO LOGRE!!!", "escuchando Pink Floyd") añaden valor humano al código, mostrando el proceso creativo detrás de aplicaciones que para muchos usuarios finales eran "caja negra".
