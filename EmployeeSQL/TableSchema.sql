BEGIN;


CREATE TABLE IF NOT EXISTS public."Departments"
(
    dept_no character(4) COLLATE pg_catalog."default" NOT NULL,
    dept_name character(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Departments_pkey" PRIMARY KEY (dept_no)
);

CREATE TABLE IF NOT EXISTS public."Dept_Emp"
(
    emp_no integer NOT NULL,
    dept_no character(5) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Dept_Emp_pkey" PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS public."Dept_Manager"
(
    dept_no character(5) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    CONSTRAINT "Dept_Manager_pkey" PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS public."Employee"
(
    emp_no integer NOT NULL,
    emp_title_id character(6) COLLATE pg_catalog."default" NOT NULL,
    birth_date date NOT NULL,
    first_name character(30) COLLATE pg_catalog."default" NOT NULL,
    last_name character(30) COLLATE pg_catalog."default" NOT NULL,
    sex character(1) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Salaries"
(
    emp_no integer NOT NULL,
    salary numeric(15, 2) NOT NULL,
    CONSTRAINT "Salaries_pkey" PRIMARY KEY (emp_no)
);

CREATE TABLE IF NOT EXISTS public."Titles"
(
    title_id character(7) COLLATE pg_catalog."default" NOT NULL,
    title character(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Titles_pkey" PRIMARY KEY (title_id)
);

ALTER TABLE IF EXISTS public."Dept_Emp"
    ADD CONSTRAINT "Employee Department" FOREIGN KEY (dept_no)
    REFERENCES public."Departments" (dept_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Dept_Manager"
    ADD CONSTRAINT "Department" FOREIGN KEY (dept_no)
    REFERENCES public."Departments" (dept_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD CONSTRAINT "Salary" FOREIGN KEY (emp_no)
    REFERENCES public."Salaries" (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD CONSTRAINT "Title" FOREIGN KEY (emp_title_id)
    REFERENCES public."Titles" (title_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD CONSTRAINT "Department" FOREIGN KEY (emp_no)
    REFERENCES public."Dept_Emp" (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD CONSTRAINT "Manager" FOREIGN KEY (emp_no)
    REFERENCES public."Dept_Manager" (emp_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
