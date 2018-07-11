DECLARE
   stmt VARCHAR2(600) := '';
BEGIN

   FOR tbl IN (
     SELECT table_name
     FROM all_tables
     WHERE UPPER(owner)='DWH')
   LOOP
      dropTable := 'DROP TABLE ' || tbl.table_name || ' CASCADE CONSTRAINTS PURGE;';
      dropView := 'DROP VIEW ' || tbl.table_name || ';';
      createView := 'CREATE VIEW ' || tbl.table_name || ' AS SELECT * FROM dwh.' || tbl.table_name || ';';

      --DBMS_OUTPUT.PUT_LINE(dropTable);
      --DBMS_OUTPUT.PUT_LINE(dropView);
      --DBMS_OUTPUT.PUT_LINE(createView);

      EXECUTE IMMEDIATE dropTable;
      EXECUTE IMMEDIATE dropView;
      EXECUTE IMMEDIATE createView;
   END LOOP;
END;
/
