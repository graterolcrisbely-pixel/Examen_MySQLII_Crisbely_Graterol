1921-Consultas

Pide crear una consulta en SQL que muestre el nombre del usuario, el tipo de membresía y el total pagado por reservas de todos los usuarios que tengan una membresía activa.

Pide que incluya un (JOIN) entre las tablas de usuarios, membresías, pagos y reservas. Y ordenar los resultados de mayor a menor..


MI SOLUCION ANTE LO QUE ME PIDIO.


1. La CTE suma lo que cada usuario pagó en facturas de reservas.
2. Se une con usuarios, membresías activas y tipo de membresía.
3. Se filtran los totales mayores a 100 y se ordenan de mayor a menor.


<img width="981" height="750" alt="image" src="https://github.com/user-attachments/assets/16683b53-5419-48aa-9a78-675c6aaf6404" />

<img width="981" height="750" alt="image" src="https://github.com/user-attachments/assets/8a15f6c7-7dde-4805-bd86-c3421fa834f9" />

