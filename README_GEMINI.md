# Proyecto pyCMAC: Arqueología de Software (Circa 2002)

Este repositorio contiene el rescate del portal web institucional y sistema de simuladores financieros de la Caja Municipal de Sullana (CMAC-Sullana). Representa un caso de estudio sobre la transición tecnológica de la web estática a la web dinámica funcional a principios del siglo XXI.

## Datación e Inferencia
- Fecha de desarrollo identificada: 13 de octubre de 2002 (según metadatos en borde_superior.js).
- Herramientas de autoría: Microsoft FrontPage 5.0 (versión 2002).
- Contexto tecnológico: Fase de madurez de Macromedia Flash y predominio de CGI (Common Gateway Interface) para el procesamiento en servidor.

## Stack Tecnológico

### Frontend
- HTML/CSS: Maquetación estructural basada en tablas, optimizada para codificación windows-1252.
- JavaScript: Utilizado para la generación dinámica de componentes de interfaz (menús y cabeceras) mediante manipulación del flujo de escritura del documento.
- Multimedia: Integración de objetos binarios SWF (Flash 4.0) para elementos de identidad corporativa.

### Backend
- Lenguaje: Perl 5.003.
- Interfaz de Servidor: CGI (Common Gateway Interface).
- Lógica de Plantillas: Sistema de preprocesamiento de documentos HTML mediante expresiones regulares para la inyección de datos calculados.
- Compatibilidad de Entorno: Arquitectura preparada para despliegue agnóstico en sistemas Unix/Linux y Windows/IIS.

### Estructura de Datos
- Persistencia: Sistema de archivos planos (Flat-file databases).
- Formato: Archivos .bd con delimitadores específicos para el almacenamiento de tasas financieras, tablas de amortización, organigrama y directorios electrónicos.

## Magnitud y Alcance del Sistema

El proyecto constituye una plataforma de servicios financieros integrales para la época:

1. Motores de Cálculo: Simuladores financieros para productos de ahorro y crédito, con gestión de tasas vinculada a la base de datos plana.
2. Arquitectura de Información: Clasificación jerárquica de contenidos (Institución, Equipo, Servicios) reflejada en la nomenclatura sistemática de archivos.
3. Directorio Institucional: Aplicación de búsqueda y filtrado de personal y canales de comunicación.
4. Gestión de Activos: Biblioteca extensa de recursos gráficos que documentan la identidad visual y la presencia regional de la institución.

## Créditos de Desarrollo
El código fuente registra la autoría de:
- [Dr.+ías]
- [0r3j0]
- [P14j3n0]

## Conclusiones y Valor de Ingeniería

Desde la perspectiva de la ingeniería de software, el proyecto pyCMAC destaca por su eficiencia pragmática y un diseño modular avanzado para su época.

### 1. Pragmática de Datos (Flat-file Databases)
La elección de archivos .bd procesados mediante Perl en lugar de un motor de base de datos relacional (RDBMS) representa una solución óptima para el contexto de 2002. Esta arquitectura minimizaba los costes de infraestructura y la sobrecarga del servidor, proporcionando persistencia y dinamismo suficientes para la escala de la institución sin introducir complejidad innecesaria en el despliegue.

### 2. Componentización Primitiva
El uso de scripts JavaScript externos (borde_superior.js, etc.) para inyectar elementos comunes de la interfaz es un precursor funcional de la componentización moderna. Esta técnica resolvió el problema del mantenimiento centralizado bajo el principio DRY (Don't Repeat Yourself), permitiendo actualizaciones globales de la navegación sin necesidad de recurrir a Server Side Includes (SSI) o procesamientos costosos en el servidor.

### 3. Rigor en el Cálculo Financiero
El núcleo del sistema reside en su capacidad algorítmica. Los scripts de simulación de créditos y plazos fijos implementan lógica de negocio crítica, separando las variables financieras (tasas de interés) del código ejecutable. Esta abstracción permitía la reconfiguración del sistema por parte de administradores sin intervención en el código fuente, una práctica de diseño profesional y robusta.

### 4. Robustez y Portabilidad
La estructura del código revela una previsión para el despliegue multiplataforma, incluyendo configuraciones específicas para entornos Unix/Linux y Windows/IIS. Esta flexibilidad era fundamental en un periodo de transición y competencia entre arquitecturas de servidores web.

En definitiva, este proyecto es un ejemplo de artesanía digital donde la escasez de recursos (ancho de banda y capacidad de cómputo) fue compensada con una arquitectura ingeniosa, modular y estrictamente funcional.
