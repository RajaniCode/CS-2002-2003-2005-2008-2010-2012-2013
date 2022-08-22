--Listing 30.1: 
CREATE TABLE Authors(au_id varchar(11), au_lname varchar(20), au_fname
varchar(20))

--Listing 30.2: 
DECLARE @idoc int
DECLARE @doc varchar(1000)
SET @doc ='
<ROOT>
<Authors>
<au_id>238-95-7766</au_id>
<au_lname>Carson</au_lname>
<au_fname>Cheryl</au_fname>
</Authors>
<Authors>
<au_id>722-51-5454</au_id>
<au_lname>DeFrance</au_lname>
<au_fname>Michel</au_fname>
</Authors>
<Authors>
<au_id>527-72-3246</au_id>
<au_lname>Greene</au_lname>
<au_fname>Morningstar</au_fname>
</Authors>
<Authors>
<au_id>846-92-7186</au_id>
<au_lname>Hunter</au_lname>
<au_fname>Sheryl</au_fname>
</Authors>
<Authors>
<au_id>756-30-7391</au_id>
<au_lname>Karsen</au_lname>
<au_fname>Livia</au_fname>
</Authors>
</ROOT>'
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc
INSERT INTO Authors(au_id, au_lname, au_fname)
SELECT au_id, au_lname, au_fname
FROM OPENXML(@idoc, '/ROOT/Authors', 2)
WITH (au_id varchar(11),
au_lname varchar(20),
au_fname varchar(20)
)
EXEC sp_xml_removedocument @idoc

--Listing 30.3: 
SELECT * FROM Authors

--Listing 30.4: 
SELECT * FROM Authors FOR XML RAW

--Listing 30.5: 
SELECT * FROM Authors FOR XML AUTO

--Listing 30.6: 
SELECT 1 as Tag,
NULL as Parent,
au_id as [Author!1!au_id],
au_lname as [Author!1]
FROM Authors FOR XML EXPLICIT

--Listing 30.7:
SELECT * FROM Authors FOR XML PATH

--Listing 30.8: 
DECLARE @x xml
DECLARE @y bit
SET @x = '<ROOT>
<Authors au_id="238-95-7766" au_lname="Carson" au_fname="Cheryl" />
<Authors au_id="722-51-5454" au_lname="DeFrance" au_fname="Michel" />
<Authors au_id="527-72-3246" au_lname="Greene" au_fname="Morningstar" />
<Authors au_id="846-92-7186" au_lname="Hunter" au_fname="Sheryl" />
<Authors au_id="756-30-7391" au_lname="Karsen" au_fname="Livia" />
</ROOT>'
SET @y = @x.exist('/ROOT/Authors[@au_id eq xs:string("846-92-7186")]')
SELECT @y

--Listing 30.9: 
DECLARE @x xml
DECLARE @y int
SET @x = '<ROOT>
<Authors au_id="101" au_lname="Carson" au_fname="Cheryl" />
<Authors au_id="102" au_lname="DeFrance" au_fname="Michel" />
<Authors au_id="103" au_lname="Greene" au_fname="Morningstar" />
<Authors au_id="104" au_lname="Hunter" au_fname="Sheryl" />
<Authors au_id="105" au_lname="Karsen" au_fname="Livia" />
</ROOT>'
SET @y = @x.value('(/ROOT/Authors/@au_id)[2]', 'int' )
SELECT @y

--Listing 30.10: 
DECLARE @x xml
SET @x = '<ROOT>
<Authors>
<au_id>238-95-7766</au_id>
<Name>
<au_lname>Carson</au_lname>
<au_fname>Cheryl</au_fname>
</Name>
</Authors>
<Authors>
<au_id>722-51-5454</au_id>
<Name>
<au_lname>DeFrance</au_lname>
<au_fname>Michel</au_fname>
</Name>
</Authors>
<Authors>
<au_id>527-72-3246</au_id>
<Name>
<au_lname>Greene</au_lname>
<au_fname>Morningstar</au_fname>
</Name>
</Authors>
<Authors>
<au_id>846-92-7186</au_id>
<Name>
<au_lname>Hunter</au_lname>
<au_fname>Sheryl</au_fname>
</Name>
</Authors>
<Authors>
<au_id>756-30-7391</au_id>
<Name>
<au_lname>Karsen</au_lname>
<au_fname>Livia</au_fname>
</Name>
</Authors>
</ROOT>'
SELECT @x.query('/ROOT/Authors/Name')

--Listing 30.11: 
DECLARE @x xml
SET @x='<ROOT>
<Authors au_id="238-95-7766" au_lname="Carson" au_fname="Cheryl" />
<Authors au_id="722-51-5454" au_lname="DeFrance" au_fname="Michel" />
<Authors au_id="527-72-3246" au_lname="Greene" au_fname="Morningstar" />
<Authors au_id="846-92-7186" au_lname="Hunter" au_fname="Sheryl" />
<Authors au_id="756-30-7391" au_lname="Karsen" au_fname="Livia" />
</ROOT>'
SELECT T.C.query('.') AS result
FROM @x.nodes('/ROOT/Authors') T(C)

--Listing 30.12: 
DECLARE @x xml
SET @x = '<ROOT>
<Authors>
<au_id>238-95-7766</au_id>
<au_lname>Carson</au_lname>
<au_fname>Cheryl</au_fname>
</Authors>
<Authors>
<au_id>722-51-5454</au_id>
<au_lname>DeFrance</au_lname>
<au_fname>Michel</au_fname>
</Authors>
<Authors>
<au_id>527-72-3246</au_id>
<au_lname>Greene</au_lname>
<au_fname>Morningstar</au_fname>
</Authors>
<Authors>
<au_id>846-92-7186</au_id>
<au_lname>Hunter</au_lname>
<au_fname>Sheryl</au_fname>
</Authors>
</ROOT>'
SET @x.modify('
insert <au_phone>(408) 555-5472</au_phone>
as last into (/ROOT/Authors)[1]')
SELECT @x

--Listing 30.13: 
DECLARE @x xml
SET @x = '<ROOT>
<Authors>
<au_id>238-95-7766</au_id>
<au_lname>Carson</au_lname>
<au_fname>Cheryl</au_fname>
<au_phone>(408) 555-5472</au_phone>
</Authors>
<Authors>
<au_id>722-51-5454</au_id>
<au_lname>DeFrance</au_lname>
<au_fname>Michel</au_fname>
</Authors>
<Authors>
<au_id>527-72-3246</au_id>
<au_lname>Greene</au_lname>
<au_fname>Morningstar</au_fname>
</Authors>
<Authors>
<au_id>846-92-7186</au_id>
<au_lname>Hunter</au_lname>
<au_fname>Sheryl</au_fname>
</Authors>
</ROOT>'
SET @x.modify('delete(/ROOT/Authors[1]/au_phone)')
SELECT @x

--Listing 30.14: 
DECLARE @x xml
SET @x = '<ROOT>
<Authors>
<au_id>238-95-7766</au_id>
<au_lname>Carson</au_lname>
<au_fname>Cheryl</au_fname>
</Authors>
<Authors>
<au_id>722-51-5454</au_id>
<au_lname>DeFrance</au_lname>
<au_fname>Michel</au_fname>
</Authors>
<Authors>
<au_id>527-72-3246</au_id>
<au_lname>Greene</au_lname>
<au_fname>Morningstar</au_fname>
</Authors>
<Authors>
<au_id>846-92-7186</au_id>
<au_lname>Hunter</au_lname>
<au_fname>Sheryl</au_fname>
</Authors>
</ROOT>'
SET @x.modify('replace value of (/ROOT/Authors[1]/au_id/text())[1] with "101-10-
1001"')
SELECT @x


