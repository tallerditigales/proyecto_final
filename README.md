# Proyecto Final: Procesamiento de texto.
<img src="https://user-images.githubusercontent.com/43531122/168409664-59c24098-27cd-45e0-9d83-9615d7d2c7f7.png" align="right"
     alt="Size Limit logo by Anton Lovchikov" width="120" height="178">
     
> Instituto Tecnológico de Costa Rica
> Área Académica de Ingeniería en Computadores
> CE-3201 Taller de diseño digital
> Prof. Jason Leitón Jiménez
> Integrantes:
> Adrián Araya Ramírez
> Alejandro Díaz 
> Shakime Richards Sparks
## Descripción General

Este proyecto final deberá solucionar el siguiente problema, utilizando un procesador ARMV4,
con programación propia de cada grupo.
El sistema deberá contar con una memoria ROM en la que se precargan frases distintas (una por una), las cuales son el insumo para el procesamiento. 
La función del procesador será encontrar palabras con al menos 3 vocales y cambiarlas por algún símbolo de entrada (también escrito en la memoria ROM). 
Es importante destacar que al inicio, el mensaje original se debe mostrar en el Monitor VGA, posteriormente, el usuario accionará el procesamiento con un botón. Una vez presionado el botón, el cpu ejecutará las instrucciones cargadas en la memoria de instrucciones, las cuales manipularán los caracteres ingresados. El procesamiento consiste en los siguientes aspectos:
 1. El programa deberá ser capaz de identificar las palabras con más de tres vocales, coloreándolas con un color distinto.
  2. Una vez identificadas las palabras deberá cambiar las vocales de dichas palabras por el símbolo de entrada.


Cada grupo creará un diseño de CPU e implementará los módulos de acuerdo con el diagrama establecido. Generalmente, se recomienda ejecutar las siguientes actividades:
1. Realizar la tarca para familiarizarse con ARM.
2. Crear y verificar el código de ARM que implementa el procesamiento solicitado.
3. Obtener el código del código ARM.
4. Crear la memoria de instrucciones e inicializarla con el código binario.
5. Crear e implementar los módulos que implementan el fetch.
6. Crear e implementar los módulos que implementan el decode.
7. Integrar la ALU del laboratorio 3.
8. Crear e implementar los módulos que implementan el acceso amemoria de datos (RAM).
9. Crear e implementar los módulos que implementan el writeback.
10. Realizar las simulaciones de cada módulo.