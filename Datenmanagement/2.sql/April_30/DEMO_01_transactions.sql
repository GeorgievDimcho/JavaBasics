-- select person
select * from person
where personid = 1;


-- update first name
update person
set vorname = 'Charlie'
where personid = 1;


-- check update
select * from person
where personid = 1;


-- set savepoint
savepoint sp1;


-- update surname
update person
set nachname = 'Winka'
where personid = 1;


-- check update
select * from person
where personid = 1;


-- rollback to savepoint
rollback to savepoint sp1;


-- check person
select * from person
where personid = 1;


-- update surname
update person
set nachname = 'Wonka'
where personid = 1;


-- check update
select * from person
where personid = 1;


-- rollback all;
rollback;


-- check update
select * from person
where personid = 1;
