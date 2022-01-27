set pagesize 100
set linesize 200

column env new_value env noprint

column db_name        format a20
column session_user   format a20
column current_schema format a20
column proxy_user     format a20

set timing off;
set head off;
select SYS_CONTEXT('USERENV', 'DB_NAME')||'_'||SYS_CONTEXT('USERENV', 'SESSION_USER')||'_'||to_char(sysdate,'YYYYMMDDHH24MI') env FROM dual;
set head on;

spool ./_logs/run_01_MODUL1_USER_&env..log


select sys_context('userenv','db_name') as db_name, 
       sys_context('userenv','session_user') as session_user, 
       sys_context('userenv','current_schema') as current_schema,
       sys_context('userenv','proxy_user') as proxy_user
from   dual;


SELECT TO_CHAR(SYSDATE,'YYYY.MM.DD HH24:MI:SS') START_SYSDATE FROM DUAL;

set timing on;

set serveroutput on;

prompt
prompt =====================
prompt MODUL1 patch started
prompt =====================
prompt


prompt
prompt ======================
prompt sequence statements
prompt ======================
prompt


prompt
prompt
@./MODUL1/sequences/sequence1.sql;



prompt
prompt ======================
prompt table statements
prompt ======================
prompt


prompt
prompt
@./MODUL1/tables/table1.sql;


prompt
prompt ======================
prompt index statements
prompt ======================
prompt


prompt
prompt 
@./MODUL1/indexes/index1.sql;


prompt
prompt ======================
prompt constraint statements
prompt ======================
prompt


prompt
prompt 
@./MODUL1/constraints/constraint1.sql;

prompt
prompt ======================
prompt trigger statements
prompt ======================
prompt

prompt
prompt 
@./MODUL1/triggers/trigger1.sql;


prompt
prompt ======================
prompt view statements
prompt ======================
prompt

prompt
prompt 
@./MODUL1/views/view1.sql;

prompt
prompt ==========================
prompt procedure statements
prompt ==========================
prompt

prompt
prompt 
@./MODUL1/procedures/procedure1.sql;

prompt
prompt ==========================
prompt function statements
prompt ==========================
prompt

prompt
prompt 
@./MODUL1/functions/function1.sql;


prompt
prompt ======================
prompt package statements
prompt ======================
prompt

prompt
prompt 
@./MODUL1/packages/package1.sql;

prompt
prompt ==========================
prompt package body statements
prompt ==========================
prompt

prompt
prompt 
@./MODUL1/packagebodies/packagebody1.sql;

alter package "package" compile;

prompt
prompt ==========================
prompt synonym statements
prompt ==========================
prompt


prompt
prompt 
@./MODUL1/synonyms/synonym1.sql;


prompt
prompt ======================
prompt data statements
prompt ======================
prompt

prompt
prompt 
@./MODUL1/data/data1.sql;

commit;


prompt
prompt ======================
prompt grant statements
prompt ======================
prompt

prompt
prompt 
@./MODUL1/grant/grant1.sql;


set timing off;

SELECT TO_CHAR(SYSDATE,'YYYY.MM.DD HH24:MI:SS') END_SYSDATE FROM DUAL;

spool off;

set serveroutput off;
