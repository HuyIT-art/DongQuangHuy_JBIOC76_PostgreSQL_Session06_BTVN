create table Department(
	id serial primary key,
	name varchar(50)
);

insert into Department (name) values
('IT'),
('Kế toán'),
('Nhân sự'),
('Marketing'),
('Kinh doanh'),
('R&D');   -- phòng này sẽ không có nhân viên
drop table Employees;
create table Employees(
	id serial primary key,
	full_name varchar(100),
	department_id int references Department(id),
	salary numeric(10,2)
);

insert into Employees (full_name, department_id, salary) values
('Nguyễn Văn An', 1, 15000000.00),   -- IT
('Trần Thị Bình', 1, 18000000.00),   -- IT
('Lê Hoàng Cường', 2, 12000000.00),  -- Kế toán
('Phạm Minh Đức', 2, 9000000.00),    -- Kế toán
('Võ Thị Lan', 3, 8000000.00),       -- Nhân sự
('Đặng Quốc Huy', 4, 11000000.00),   -- Marketing
('Nguyễn Minh Khoa', 4, 13000000.00),-- Marketing
('Trần Quốc Bảo', 5, 9500000.00);    -- Kinh doanh

--Liệt kê danh sách nhân viên cùng tên phòng ban của họ (INNER JOIN)
select e.id, e.full_name, d.name
from Department d join Employees e on d.id = e.department_id;

/*Tính lương trung bình của từng phòng ban, hiển thị:
department_name
avg_salary
Gợi ý: dùng GROUP BY và bí danh cột*/
select d.name department_name, round(avg(salary),2) avg_salary
from Department d join Employees e on d.id = e.department_id
group by d.name;

--Hiển thị các phòng ban có lương trung bình > 10 triệu (HAVING)
select d.name department_name, round(avg(salary),2) avg_salary
from Department d join Employees e on d.id = e.department_id
group by d.name having avg(salary) > 10000000;

--Liệt kê phòng ban không có nhân viên nào (LEFT JOIN + WHERE employee.id IS NULL)
select d.name department_name
from Department d left join Employees e on d.id = e.department_id
where e.id is null;












