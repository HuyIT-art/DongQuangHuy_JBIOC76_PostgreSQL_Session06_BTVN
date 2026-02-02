create table Employees(
	id serial primary key,
	full_name varchar(100),
	department varchar(50),
	salary numeric(10,2),
	hire_date date
);

--Thêm 6 nhân viên mới
insert into Employees (full_name, department, salary, hire_date) values
('Nguyễn Văn Hùng', 'IT', 5000000.00, '2023-03-15'),
('Nguyễn Văn An', 'IT', 15000000.00, '2023-03-15'),
('Trần Thị Bình', 'Kế toán', 12000000.00, '2022-08-01'),
('Lê Hoàng Cường', 'Nhân sự', 10000000.00, '2021-11-20'),
('Phạm Minh Đức', 'Marketing', 13000000.00, '2023-01-10'),
('Võ Thị Lan', 'Kinh doanh', 14000000.00, '2022-05-05'),
('Đặng Quốc Huy', 'IT', 18000000.00, '2020-09-18');


--Cập nhật mức lương tăng 10% cho nhân viên thuộc phòng IT
update Employees
set salary = salary*1.1
where department = 'IT';

select * from Employees;

--Xóa nhân viên có mức lương dưới 6,000,000
delete from Employees
where salary < 6000000;

--Liệt kê các nhân viên có tên chứa chữ “An” (không phân biệt hoa thường)
select *
from Employees
where full_name ilike '%An%';

--Hiển thị các nhân viên có ngày vào làm việc trong khoảng từ '2023-01-01' đến '2023-12-31'
select * 
from Employees
where hire_date between '2023-01-01' and '2023-12-31';










