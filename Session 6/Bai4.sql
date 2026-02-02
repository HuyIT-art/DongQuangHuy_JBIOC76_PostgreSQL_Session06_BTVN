create table OrderInfo(
	id serial primary key,
	customer_id int,
	order_date date,
	total numeric(10,2),
	status varchar(20)
);

--Thêm 5 đơn hàng
insert into OrderInfo (customer_id, order_date, total, status) VALUES
(1, '2024-10-05', 450000.00, 'Completed'),
(2, '2024-10-12', 820000.00, 'Pending'),
(3, '2024-09-28', 1200000.00, 'Completed'),
(1, '2024-10-20', 600000.00, 'Processing'),
(4, '2024-11-02', 300000.00, 'Cancelled');

--Truy vấn các đơn hàng có tổng tiền lớn hơn 500,000
select * 
from OrderInfo
where total > 500000;

--Truy vấn các đơn hàng có ngày đặt trong tháng 10 năm 2024
select *
from OrderInfo
where order_date between '2024-10-01' and '2024-10-31';

--Liệt kê các đơn hàng có trạng thái khác “Completed”
select *
from OrderInfo
where status <> 'Completed';

--Lấy 2 đơn hàng mới nhất
select *
from OrderInfo
Order by order_date desc
limit 2;













