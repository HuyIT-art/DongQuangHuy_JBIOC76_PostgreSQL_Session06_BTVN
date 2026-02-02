create table Product(
	id serial primary key,
	name varchar(100),
	category varchar(50),
	price numeric (10,2),
	stock int
);

insert into product (name, category, price, stock) values
('Bàn phím cơ', 'Phụ kiện', 850000.00, 20),
('Chuột không dây', 'Phụ kiện', 350000.00, 35),
('Laptop Dell Inspiron', 'Máy tính', 15500000.00, 10),
('Tai nghe Bluetooth', 'Âm thanh', 650000.00, 25),
('Màn hình LG 24 inch', 'Màn hình', 3200000.00, 8);

--Hiển thị danh sách toàn bộ sản phẩm
select * from Product;

--Hiển thị 3 sản phẩm có giá cao nhất
select * 
from Product
order by price desc
limit 3;

--Hiển thị các sản phẩm thuộc danh mục “Phụ kiện” có giá nhỏ hơn 10,000,000
select *
from Product
where category = 'Phụ kiện' and price < 10000000;

--Sắp xếp sản phẩm theo số lượng tồn kho tăng dần
select * 
from Product
order by stock asc;













