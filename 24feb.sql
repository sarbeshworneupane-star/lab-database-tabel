/* Clean start */
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS dept;


/* Create original table */
CREATE TABLE dept (
    deptno INT(2),
    dname  VARCHAR(20),
    loc    VARCHAR(20)
);

/* Sample data */
INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES (20,'RESEARCH','DALLAS');
INSERT INTO dept VALUES (30,'SALES','CHICAGO');


-------------------------------------------------
-- 1) Rename table DEPT → DEPARTMENT
-------------------------------------------------
ALTER TABLE dept RENAME TO department;


-------------------------------------------------
-- 2) Add PINCODE column with NOT NULL
-------------------------------------------------
ALTER TABLE department
ADD COLUMN pincode INT(6) NOT NULL DEFAULT 0;


-------------------------------------------------
-- 3) (Skipped as you requested)
-------------------------------------------------


-------------------------------------------------
-- 4) Rename column DNAME → DEPT_NAME
-------------------------------------------------
ALTER TABLE department
RENAME COLUMN dname TO dept_name;


-------------------------------------------------
-- 5) Change datatype LOC → CHAR(10)
-------------------------------------------------
ALTER TABLE department
MODIFY COLUMN loc CHAR(10);


/* Check structure */
DESCRIBE department;
SELECT * FROM department;


-------------------------------------------------
-- 6) Delete (Drop) the table completely
-------------------------------------------------
DROP TABLE department;