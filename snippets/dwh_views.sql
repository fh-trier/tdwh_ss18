DECLARE
   stmt VARCHAR2(600) := '';
BEGIN

   FOR tbl IN (
     SELECT table_name
     FROM all_tables
     WHERE UPPER(owner)='DWH')
   LOOP
     stmt := 'CREATE VIEW ' || tbl.table_name || ' AS SELECT * FROM dwh.'
|| tbl.table_name || ';';
     --DBMS_OUTPUT.PUT_LINE(stmt);
     EXECUTE IMMEDIATE stmt;
   END LOOP;
END;
/