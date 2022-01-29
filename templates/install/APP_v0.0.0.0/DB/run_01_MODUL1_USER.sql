column env new_value v_env noprint

set timing off;
set head off;
select sys_context('userenv','db_name')||'_'||sys_context('userenv','session_user')||'_'||to_char(sysdate,'YYYYMMDD_HH24MI') env FROM dual;
set head on;

spool ./_logs/run_01_MODUL1_USER_&v_env..log

set head off;

select 'DB_NAME:        '||sys_context('userenv','db_name')||chr(10)||
       'SESSION_USER:   '||sys_context('userenv','session_user')||chr(10)||
       'SESSION_USER:   '||sys_context('userenv','session_user')||chr(10)||
       'CURRENT_SCHEMA: '||sys_context('userenv','current_schema')||chr(10)||
       'PROXY_USER:     '||sys_context('userenv','proxy_user')||chr(10)||
       'OS_USER:        '||sys_context('userenv','os_user') from dual;

select 'START_DATE: '||to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') datetime from dual;

set head on;

set serveroutput on;

set doc off;

set timing on;

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


prompt TABLE1_SEQ
prompt
@./MODUL1/sequences/table1_seq.sql;



prompt
prompt ======================
prompt table statements
prompt ======================
prompt


prompt TABLE1
prompt
@./MODUL1/tables/table1.sql;


prompt
prompt ======================
prompt index statements
prompt ======================
prompt


prompt TABLE1_I1
prompt 
@./MODUL1/indexes/table1_i1.sql;


prompt
prompt ======================
prompt constraint statements
prompt ======================
prompt


prompt TABLE1_PK
prompt 
@./MODUL1/constraints/table1_pk.sql;

prompt
prompt ======================
prompt trigger statements
prompt ======================
prompt

prompt TABLE1_BRI
prompt 
@./MODUL1/triggers/table1_bri.sql;


prompt
prompt ==========================
prompt synonym statements
prompt ==========================
prompt


prompt TABLE2
prompt 
@./MODUL1/synonyms/table2.sql;

prompt
prompt ======================
prompt view statements
prompt ======================
prompt

prompt TABLE1_V
prompt 
@./MODUL1/views/table1_v.sql;

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
@./MODUL1/packagebodies/package1.sql;

rem alter package "package" compile;


prompt
prompt ======================
prompt data statements
prompt ======================
prompt

prompt TABLE1
prompt 
@./MODUL1/data/table1.sql;

commit;


prompt
prompt ======================
prompt grant statements
prompt ======================
prompt

prompt table1_to_modul2
prompt 
@./MODUL1/grants/table1_to_modul2.sql;


set timing off;

set head off;
select 'END_DATE: '||to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') datetime from dual;
set head on;

spool off;

set serveroutput off;
