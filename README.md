# scan_ssrf.sh
Este script permite hacer un escaneo de puertos a través de los host vulnerables a CVE-2021-40438. 

Uso:

1. Cambiar la variable "host" dentro del script por el nombre de host vulnerable en este formato. https://hostname o http://hostname. 
2. Ejecutar el script:

En el parámetro host hay que reemplazar por el host al que se quiere escanear los puertos abiertos, ya sea con nombre o con ip.  

Uso:

```javascript
./scan_ssrf.sh -p <port1,port2,port3...> <host>
```

Ejemplo:
  
  En el script se establecerá la variable host en la linea 5.
  
  ```javascript
  host = "https://misitiovulnerable.com"
  ```
  
  Para ejecutar.
```javascript
  ./scan_ssrf.sh -p 25,80,443,8080 www.google.com
```

  Esto escaneará los puertos 25,80,443,80 en el host www.google.com, todas las peticiones del escaneo llegarán originados desde la dirección ip del host misitiovulnerable.com.  

