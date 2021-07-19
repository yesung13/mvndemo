select a.object_id from dba_objects a,

(select obj_id, row_cnt from sys._dd_tbl ) b  

where a.object_id= b.obj_id 

and b.row_cnt is null;

update sys._dd_tbl set row_cnt=0
where obj_id in (
select a.object_id from dba_objects a,
(select obj_id, row_cnt from sys._dd_tbl ) b  
where a.object_id= b.obj_id 
and b.row_cnt is null);