select * from Departments;
select * from Employees;
select * from Dept_Emp;
select * from Dept_Manager;
select * from Dept_Emp;
select * from Salaries;
select * from Titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
select Employees.emp_no, Employees.last_name, Employees.first_name, Employees.gender, Salaries.salary from Employees
join Salaries on Employees.emp_no=Salaries.emp_no;

--List employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date from Employees
where hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select Departments.dept_no, Departments.dept_name, Employees.emp_no, Employees.last_name, Employees.first_name,
Dept_Manager.from_date, Dept_Manager.to_date from Employees
join Dept_Manager on Employees.emp_no=Dept_Manager.emp_no
join Departments on Departments.dept_no=Dept_Manager.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name from Employees
join Dept_Emp on Employees.emp_no=Dept_Emp.emp_no
join Departments on Departments.dept_no=Dept_Emp.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select last_name, first_name from Employees
where first_name='Hercules' and last_name like 'B%' order by last_name;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name from Employees
join Dept_Emp on Employees.emp_no=Dept_Emp.emp_no
join Departments on Departments.dept_no=Dept_Emp.dept_no
where Departments.dept_name='Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.
select Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name from Employees
join Dept_Emp on Employees.emp_no=Dept_Emp.emp_no
join Departments on Departments.dept_no=Dept_Emp.dept_no
where Departments.dept_name='Sales' or Departments.dept_name='Development' order by Departments.dept_name;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) from Employees group by last_name order by count(last_name) desc;