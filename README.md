# Proyecto Final: Procesamiento de texto
<img src="https://user-images.githubusercontent.com/43531122/168410498-98b2cb97-fe94-4a17-917c-e7d1c4a02ea7.png" align="right"
     alt="Size Limit logo by Anton Lovchikov" width="330" height="320">

#### _Instituto Tecnológico de Costa Rica_
#### _Área Académica de Ingeniería en Computadores_
#### _CE-3201 Taller de diseño digital_
#### _Prof. Jason Leitón Jiménez_
#### _Integrantes:_
* _Adrián Araya Ramírez_
* _Alejandro Díaz_
* _Shakime Richards Sparks_

## Descripción General

Este proyecto final deberá solucionar el siguiente problema, utilizando un procesador ARMV4,
con programación propia de cada grupo.
El sistema deberá contar con una memoria ROM en la que se precargan frases distintas (una por una), las cuales son el insumo para el procesamiento. 
La función del procesador será encontrar palabras con al menos 3 vocales y cambiarlas por algún símbolo de entrada (también escrito en la memoria ROM). 
Es importante destacar que al inicio, el mensaje original se debe mostrar en el Monitor VGA, posteriormente, el usuario accionará el procesamiento con un botón. Una vez presionado el botón, el cpu ejecutará las instrucciones cargadas en la memoria de instrucciones, las cuales manipularán los caracteres ingresados. El procesamiento consiste en los siguientes aspectos:
1. El programa deberá ser capaz de identificar las palabras con más de tres vocales, coloreándolas con un color distinto.
2. Una vez identificadas las palabras deberá cambiar las vocales de dichas palabras por el símbolo de entrada.

## Actividades Pendientes
Cada grupo creará un diseño de CPU e implementará los módulos de acuerdo con el diagrama establecido. Generalmente, se recomienda ejecutar las siguientes actividades:
- [x] Realizar la tarea para familiarizarse con ARM.
- [ ] Crear y verificar el código de ARM que implementa el procesamiento solicitado.
- [ ] Obtener el código del código ARM.
- [ ] Crear la memoria de instrucciones e inicializarla con el código binario.
- [ ] Crear e implementar los módulos que implementan el fetch.
- [ ] Crear e implementar los módulos que implementan el decode.
- [ ] Integrar la ALU del laboratorio 3.
- [ ] Crear e implementar los módulos que implementan el acceso amemoria de datos (RAM).
- [ ] Crear e implementar los módulos que implementan el writeback.
- [ ] Realizar las simulaciones de cada módulo.
