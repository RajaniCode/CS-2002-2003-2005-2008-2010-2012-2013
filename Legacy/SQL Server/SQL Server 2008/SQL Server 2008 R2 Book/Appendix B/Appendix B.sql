--Listing B.1: 
CREATE TABLE Spt_geometry
(id int IDENTITY (1,1),
Spt_Col1 geometry,
Spt_Col2 AS Spt_Col1.STAsText())

--Listing B.2: 
INSERT INTO Spt_geometry (Spt_Col1)
VALUES (geometry::STGeomFromText('LINESTRING (60 20, 20 20, 60 60)', 0))
INSERT INTO Spt_geometry (Spt_Col1)
VALUES (geometry::STGeomFromText('POLYGON ((0 0, 90 0, 90 90, 0 90, 0 0))', 0))

--Listing B.3: 
SELECT * FROM Spt_geometry

--Listing B.4: 
CREATE TABLE Spt_geography
(id int IDENTITY (1,1),
Spt_Col1 geography,
Spt_Col2 AS Spt_Col1.STAsText())

--Listing B.5: 
INSERT INTO Spt_geography (Spt_Col1)
VALUES (geography::STGeomFromText('LINESTRING(20 50, 30 70)', 4326))
INSERT INTO Spt_geography (Spt_Col1)
VALUES (geography::STGeomFromText('POLYGON((30 80, 40 70, 50 60, 60 90, 30
80))', 4326))

--Listing B.6: 
SELECT * FROM Spt_geography


