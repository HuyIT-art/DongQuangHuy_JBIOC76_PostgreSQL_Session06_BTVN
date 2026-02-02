create table Orders(
	id serial primary key,
	customer_id int,
	order_date date,
	total_amount numeric(10,2)
);
--Thêm 10 dữ liệu
insert into Orders (customer_id, order_date, total_amount) values
(1, '2022-01-15', 12000000.00),
(2, '2022-06-20', 18000000.00),
(3, '2022-11-05', 25000000.00),

(1, '2023-02-10', 30000000.00),
(2, '2023-05-18', 22000000.00),
(4, '2023-09-30', 15000000.00),

(3, '2024-01-25', 40000000.00),
(5, '2024-03-12', 35000000.00),
(2, '2024-07-08', 28000000.00),
(6, '2024-10-19', 45000000.00);

--Hiển thị tổng doanh thu, số đơn hàng, giá trị trung bình mỗi đơn (dùng SUM, COUNT, AVG) - Đặt bí danh cột lần lượt là total_revenue, total_orders, average_order_value
select customer_id, sum(total_amount) as total_revenue, count(*) as total_orders, round(avg(total_amount),2) as average_order_value
from Orders
group by customer_id;

--Nhóm dữ liệu theo năm đặt hàng, hiển thị doanh thu từng năm (GROUP BY EXTRACT(YEAR FROM order_date))
select Extract(year from order_date) as "Năm", sum(total_amount) as "Doanh thu"
from Orders
group by Extract(year from order_date);

--Chỉ hiển thị các năm có doanh thu trên 50 triệu (HAVING)
select Extract(year from order_date) as "Năm", sum(total_amount) as "Doanh Thu"
from Orders
group by Extract(year from order_date)
having sum(total_amount) > 50000000;

--Hiển thị 5 đơn hàng có giá trị cao nhất (dùng ORDER BY + LIMIT)
select * 
from Orders
order by total_amount desc
limit 5;











