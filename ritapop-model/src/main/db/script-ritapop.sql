-- Aquí iremos pegando las modificaciones que hagamos en la base de datos creando dos comentarios para acotar los cambios realizados para una nueva historia

-- INICIO Cambios para FG4-3 FECHA: 12-07-2022 15:00

-- Añade los campos de la foto y el teléfono a la tabla TUSER
ALTER TABLE PUBLIC.TUSER ADD PHOTO VARBINARY(16777216) NULL;
ALTER TABLE PUBLIC.TUSER ADD PHONE NVARCHAR(255) NULL;

-- Modifica el nombre, NIF y email para hacerlos obligatorios
ALTER TABLE PUBLIC.TUSER ALTER COLUMN NAME NVARCHAR(50) SET NOT NULL;
ALTER TABLE PUBLIC.TUSER ALTER COLUMN NIF NVARCHAR(50) SET NOT NULL;
ALTER TABLE PUBLIC.TUSER ALTER COLUMN EMAIL NVARCHAR(50) SET NOT NULL;

-- Modifica los permisos del rol ADMINISTRADOR
UPDATE PUBLIC.TROLE
SET PERMISSIONS = ('{"components": [{"attr": "roleform","selector": "o-form","components": [{ "attr": "badmin", "visible": true, "enabled": true },{ "attr": "bmanager", "visible": false, "enabled": false }]}],"menu": [{ "attr": "home", "visible": true, "enabled": true },{ "attr": "users", "visible": true, "enabled": true },{ "attr": "client", "visible": true, "enabled": true },{ "attr": "transaction", "visible": true, "enabled": true },{ "attr": "logout", "visible": true, "enabled": true }]}')
WHERE ROLENAME = 'admin';

-- Modifica los permisos del rol GESTOR
UPDATE PUBLIC.TROLE
SET PERMISSIONS = ('{"components": [{"attr": "roleform","selector": "o-form","components": [{ "attr": "badmin", "visible": false, "enabled": false },{ "attr": "bmanager", "visible": true, "enabled": true }]}],"menu": [{ "attr": "home", "visible": true, "enabled": true },{ "attr": "users", "visible": false, "enabled": false },{ "attr": "client", "visible": true, "enabled": true },{ "attr": "transaction", "visible": true, "enabled": true },{ "attr": "logout", "visible": true, "enabled": true }]}')
WHERE ROLENAME = 'gestor';


-- FIN cambios para FG4-3 FECHA: 12-07-2022 15:00