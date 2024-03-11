  Select e.emp_no, last_name, first_name, sex, salary
from public."Employee" e
inner join public."Salaries" s ON
e.emp_no = s.emp_no;

select first_name, last_name, hire_date
from public."Employee" e
where extract(year from hire_date) = 1986;

select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name  
from public."Departments" d
inner join public."Dept_Manager" m on 
d.dept_no = m.dept_no
inner join public."Employee" e on
m.emp_no = e.emp_no
order by d.dept_no;

select z.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from public."Employee" e 
inner join public."Dept_Emp" z on 
z.emp_no = e.emp_no
join public."Departments" d on 
d.dept_no = z.dept_no;

select e.first_name, e.last_name, e.sex
from public."Employee" e
where e.first_name like '%Hercules%'
and e.last_name like 'B%'
order by e.last_name;

select z.emp_no, e.last_name, e.first_name
from public."Dept_Emp" z
inner join public."Employee" e on
z.emp_no = e.emp_no 
where z.dept_no = 'D007'
order by e.last_name; 

select z.emp_no, e.last_name, e.first_name, d.dept_name
from public."Dept_Emp" z
inner join public."Employee" e on
z.emp_no = e.emp_no 
join public."Departments" d on
d.dept_no = z.dept_no
where z.dept_no In ('D007','D005')
order by z.dept_no, e.last_name;

select count (last_name), last_name 
from public."Employee" 
Group by last_name 
order by last_name desc; 
