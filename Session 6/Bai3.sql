create table Customer(
	id serial primary key,
	name varchar(100),
	email varchar(100),
	phone varchar(20),
	points int
);

--Thêm 7 khách hàng (trong đó có 1 người không có email)
insert into Customer (name, email, phone, points) values
('Nguyễn Văn An', 'an.nguyen@gmail.com', '0901234567', 120),
('Trần Thị Bình', 'binh.tran@gmail.com', '0912345678', 300),
('Lê Hoàng Cường', NULL, '0923456789', 180),       -- không có email
('Phạm Minh Đức', 'duc.pham@gmail.com', '0934567890', 450),
('Võ Thị Lan', 'lan.vo@gmail.com', '0945678901', 220),
('Đặng Quốc Huy', 'huy.dang@gmail.com', '0956789012', 500),
('Nguyễn Văn An', 'an2.nguyen@gmail.com', '0967890123', 150);

--Truy vấn danh sách tên khách hàng duy nhất (DISTINCT)
select distinct name
from Customer;

--Tìm các khách hàng chưa có email (IS NULL)
select * 
from Customer
where email is null;

--Hiển thị 3 khách hàng có điểm thưởng cao nhất, bỏ qua khách hàng cao điểm nhất (gợi ý: dùng OFFSET)
select *
from Customer
order by points desc
limit 3 offset 1;

--Sắp xếp danh sách khách hàng theo tên giảm dần
select *
from Customer
order by name desc;













