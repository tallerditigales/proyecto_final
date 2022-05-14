# Proyecto Final: Procesamiento de texto.

## Descripción General

Este proyecto final deberá solucionar el siguiente problema, utilizando un procesador ARMV4,
con programación propia de cada grupo.
El sistema deberá contar con una memoria ROM en la que se precargan frases distintas (una por una), las cuales son el insumo para el procesamiento. 
La función del procesador será encontrar palabras con al menos 3 vocales y cambiarlas por algún símbolo de entrada (también escrito en la memoria ROM). 
Es importante destacar que al inicio, el mensaje original se debe mostrar en el Monitor VGA, posteriormente, el usuario accionará el procesamiento con un botón. Una vez presionado el botón, el cpu ejecutará las instrucciones cargadas en la memoria de instrucciones, las cuales manipularán los caracteres ingresados. El procesamiento consiste en los siguientes aspectos:
 1. El programa deberá ser capaz de identificar las palabras con más de tres vocales, coloreándolas con un color distinto.
  2. Una vez identificadas las palabras deberá cambiar las vocales de dichas palabras por el símbolo de entrada.
