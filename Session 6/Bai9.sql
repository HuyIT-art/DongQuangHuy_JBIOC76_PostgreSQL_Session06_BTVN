drop table Product;
drop table Orders;
drop table OrderDetail;
create table Product(
	id serial primary key,
	name varchar(100),
	category varchar(50),
	price numeric(10,2)
);
insert into Product (name, category, price) values
('Laptop Dell', 'Laptop', 25000000),
('Laptop HP', 'Laptop', 22000000),
('MacBook Air', 'Laptop', 30000000),

('iPhone 14', 'Điện thoại', 28000000),
('Samsung S23', 'Điện thoại', 24000000),
('Xiaomi 13', 'Điện thoại', 18000000),

('Chuột Logitech', 'Phụ kiện', 800000),
('Bàn phím Keychron', 'Phụ kiện', 2500000),
('Tai nghe Sony', 'Phụ kiện', 3500000),

('Màn hình LG 27"', 'Màn hình', 9000000),
('Màn hình Dell 24"', 'Màn hình', 6500000);

create table Orders(
	id serial primary key,
	customer_id int references Customer(id),
	order_date date,
	total_amount numeric(10,2)
);
insert into Orders (customer_id, order_date, total_amount) values
(1, '2024-01-10', 78000000),
(2, '2024-02-15', 52000000),
(3, '2024-03-20', 45000000),
(1, '2024-04-05', 30000000),
(4, '2024-05-18', 62000000),
(2, '2024-06-22', 27000000);


create table OrderDetail(
	id serial primary key,
	order_id int references Orders(id),
	product_id int references Product(id),
	quantity int
);
insert into OrderDetail (order_id, product_id, quantity) values
-- Order 1
(1, 1, 2),   -- Laptop Dell
(1, 7, 3),   -- Chuột
(1, 8, 1),   -- Bàn phím

-- Order 2
(2, 3, 1),   -- MacBook Air
(2, 9, 1),   -- Tai nghe
(2, 7, 2),   -- Chuột

-- Order 3
(3, 4, 1),   -- iPhone 14
(3, 8, 1),   -- Bàn phím
(3, 7, 1),   -- Chuột

-- Order 4
(4, 2, 1),   -- Laptop HP
(4, 10, 1),  -- Màn hình LG

-- Order 5
(5, 3, 1),   -- MacBook Air
(5, 5, 1),   -- Samsung S23
(5, 9, 2),   -- Tai nghe

-- Order 6
(6, 6, 2),   -- Xiaomi 13
(6, 11, 1);  -- Màn hình Dell

--Tính tổng doanh thu từng sản phẩm, hiển thị product_name, total_sales (SUM(price * quantity))
select p.name product_name, coalesce(sum(p.price * o.quantity),0) total_sale
from Product p left join OrderDetail o on p.id = o.product_id
group by p.id, p.name;

--Tính doanh thu trung bình theo từng loại sản phẩm (GROUP BY category)
select p.category category_name, round(avg(coalesce(p.price * o.quantity,0)),2) total_averger
from Product p left join OrderDetail o on p.id = o.product_id
group by p.category;

--Chỉ hiển thị các loại sản phẩm có doanh thu trung bình > 20 triệu (HAVING)
select p.category category_name, round(avg(coalesce(p.price * o.quantity,0)),2) total_averger
from Product p left join OrderDetail o on p.id = o.product_id
group by p.category
having avg(coalesce(p.price * o.quantity,0)) > 20000000;

--Hiển thị tên sản phẩm có doanh thu cao hơn doanh thu trung bình toàn bộ sản phẩm (dùng Subquery)
select i.product_name, i.total_sale
from (select p.name product_name, coalesce(sum(p.price * o.quantity),0) total_sale
	  from Product p left join OrderDetail o on p.id = o.product_id
	  group by p.id, p.name) i
where i.total_sale > (select avg(k.total_sale) from( select coalesce(sum(p.price * o.quantity),0) total_sale
							   from Product p left join OrderDetail o on p.id = o.product_id
							   group by p.id) k);						

--Liệt kê toàn bộ sản phẩm và số lượng bán được (nếu có) – kể cả sản phẩm chưa có đơn hàng (LEFT JOIN)
select p.id ID, p.name  "Tên sản phẩm", sum(o.quantity) "Số lượng bán được"
from Product p left join OrderDetail o on p.id = o.product_id
group by p.id, p.name;





























