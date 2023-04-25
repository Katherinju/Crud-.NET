CREATE TABLE Usuarios (
    Id_Usuario SERIAL PRIMARY KEY,
    Nombre VARCHAR(15),
    Edad INT,
    Correo TEXT,
    Fecha_Nacimiento DATE
);

CREATE OR REPLACE FUNCTION sp_load()
RETURNS SETOF Usuarios AS $$
BEGIN
    RETURN QUERY SELECT * FROM Usuarios;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION sp_create(
    _nombre VARCHAR(15),
    _edad INT,
    _correo TEXT,
    _fecha DATE
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Usuarios (Nombre, Edad, Correo, Fecha_Nacimiento)
    VALUES (_nombre, _edad, _correo, _fecha);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION sp_read(_id INT)
RETURNS SETOF Usuarios AS $$
BEGIN
    RETURN QUERY SELECT * FROM Usuarios WHERE Id_Usuario = _id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION sp_update(
    _id INT,
    _nombre VARCHAR(15),
    _edad INT,
    _correo TEXT,
    _fecha DATE
)
RETURNS VOID AS $$
BEGIN
    UPDATE Usuarios SET
        Nombre = _nombre,
        Edad = _edad,
        Correo = _correo,
        Fecha_Nacimiento = _fecha
    WHERE Id_Usuario = _id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION sp_delete(_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Usuarios WHERE Id_Usuario = _id;
END;
$$ LANGUAGE plpgsql;