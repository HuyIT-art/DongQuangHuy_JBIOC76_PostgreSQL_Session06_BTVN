create table Course(
	id serial primary key,
	title varchar(100),
	instructor varchar(50),
	price numeric(10,2),
	duration int
);

--Thêm ít nhất 6 khóa học vào bảng
insert into Course (title, instructor, price, duration) values
('SQL Cơ Bản', 'Nguyễn Văn A', 600000, 25),
('SQL Nâng Cao', 'Trần Thị B', 1200000, 40),
('PostgreSQL Thực Hành', 'Lê Hoàng C', 1800000, 45),
('MySQL Demo', 'Phạm Minh D', 400000, 15),          -- chứa Demo
('Lập Trình Python Cơ Bản', 'Võ Thị E', 900000, 35),
('Python Nâng Cao', 'Đặng Quốc F', 2200000, 50),
('Data Analysis with SQL', 'Nguyễn Văn G', 1500000, 30),
('Web Backend Demo', 'Trần Thị H', 300000, 20),     -- chứa Demo
('SQL Performance Tuning', 'Lê Hoàng I', 2000000, 55),
('Cơ Sở Dữ Liệu', 'Phạm Minh K', 750000, 28);

--Cập nhật giá tăng 15% cho các khóa học có thời lượng trên 30 giờ
update Course
set price = price * 1.15
where duration > 30;

select * from Course;

--Xóa khóa học có tên chứa từ khóa “Demo”
delete from Course
where title ilike '%Demo%';

--Hiển thị các khóa học có tên chứa từ “SQL” (không phân biệt hoa thường)
select * 
from Course
where title ilike '%SQL%';

--Lấy 3 khóa học có giá nằm giữa 500,000 và 2,000,000, sắp xếp theo giá giảm dần
select * 
from Course
where price between 500000 and 2000000
order by price desc
limit 3;











