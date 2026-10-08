
-- Examen

USE coworking_db;

-- Proyecto consultas SQL
-- Modulo = Sistema de coworkin
 
-- LOGICA ---
-- Pagos_reserva suma,por usuarios,los pagos de las facturas a una reserva. Se agrega antes de unir una membresia
-- para no multiplicar los montos si un usuario tuviera mas de una membresia activa

-- ===========================================================
-- CONSULTAS ---
-- ==============================================================
-- Consulta que muestre el nombre usuario,membresia,total pagado de reservas de todos los usuarios con membresia activa --- 

WITH pagos_reservas AS (
    SELECT
        f.id_usuario,
        SUM(p.monto) AS total_pagado_reservas
    FROM pagos p
    INNER JOIN facturas f  ON f.id_factura = p.id_factura
    INNER JOIN reservas r  ON r.id_reserva = f.id_reserva   -- solo facturas de reservas
    WHERE p.estado_transaccion = 'Pagado'
    GROUP BY f.id_usuario
)
SELECT
    CONCAT(u.nombre, ' ', u.apellidos) AS usuario,
    tm.nombre                          AS tipo_membresia,
    pr.total_pagado_reservas
FROM usuarios u
INNER JOIN membresias m        ON m.id_usuario = u.id_usuario
                              AND m.estado = 'Activa'
INNER JOIN tipos_membresia tm  ON tm.id_tipo_membresia = m.id_tipo_membresia
INNER JOIN pagos_reservas pr   ON pr.id_usuario = u.id_usuario
WHERE pr.total_pagado_reservas > 100
ORDER BY pr.total_pagado_reservas DESC;

-- Consulta activa ---

WITH pagos_reservas AS (
    SELECT f.id_usuario, SUM(p.monto) AS total_pagado_reservas
    FROM pagos p
    INNER JOIN facturas f ON f.id_factura = p.id_factura
    INNER JOIN reservas r ON r.id_reserva = f.id_reserva
    WHERE p.estado_transaccion = 'Pagado'
    GROUP BY f.id_usuario
)
SELECT
    CONCAT(u.nombre, ' ', u.apellidos) AS usuario,
    tm.nombre                          AS tipo_membresia,
    pr.total_pagado_reservas
FROM usuarios u
INNER JOIN membresias m        ON m.id_usuario = u.id_usuario
                              AND m.estado = 'Activa'
                              AND NOW() BETWEEN m.fecha_inicio AND m.fecha_vencimiento
INNER JOIN tipos_membresia tm  ON tm.id_tipo_membresia = m.id_tipo_membresia
INNER JOIN pagos_reservas pr   ON pr.id_usuario = u.id_usuario
WHERE pr.total_pagado_reservas > 100
ORDER BY pr.total_pagado_reservas DESC;





