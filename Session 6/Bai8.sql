drop table Customer;
create table Customer(
	id serial primary key,
	name varchar(100)
);
insert into Customer (name) values
('Nguyễn Văn An'),
('Trần Thị Bình'),
('Lê Hoàng Cường'),
('Phạm Minh Đức'),
('Võ Thị Lan'),
('Đặng Quốc Huy'); -- khách này chưa mua gì

drop table Orders;
create table Orders(
	id serial primary key,
	customer_id int references Customer(id),
	order_date date,
	total_amount numeric(10,2)
);
insert into Orders (customer_id, order_date, total_amount) values
(1, '2024-01-10', 15000000),
(1, '2024-03-15', 20000000),

(2, '2024-02-05', 12000000),
(2, '2024-06-18', 18000000),

(3, '2024-04-20', 30000000),

(4, '2024-05-12', 8000000),
(4, '2024-07-25', 9000000),

(5, '2024-08-30', 22000000);

--Hiển thị tên khách hàng và tổng tiền đã mua, sắp xếp theo tổng tiền giảm dần
select c.name "Tên khách hàng", round(sum(o.total_amount)) "Tổng tiền đã mua"
from Customer c left join Orders o on c.id = o.customer_id
group by c.name, c.id 
order by sum(o.total_amount) desc;

--Tìm khách hàng có tổng chi tiêu cao nhất (dùng Subquery với MAX)
select i.name "Tên khách hàng", i.total "Tổng chi tiêu"
from (select c.name name, round(sum(o.total_amount)) total
	 from Customer c left join Orders o on c.id = o.customer_id
	 group by c.name, c.id) i 
where i.total = (select max(k.total) from(select c.name, round(sum(o.total_amount)) total
				from Customer c left join Orders o on c.id = o.customer_id
				group by c.name, c.id) k);

--Liệt kê khách hàng chưa từng mua hàng (LEFT JOIN + IS NULL)
select c.id ID, c.name "Tên khách hàng"
from Customer c left join Orders o on c.id = o.customer_id
where o.id is null;

--Hiển thị khách hàng có tổng chi tiêu > trung bình của toàn bộ khách hàng (dùng Subquery trong HAVING)
select c.name "Tên khách hàng", round(sum(o.total_amount)) "Tổng tiền đã mua"
from Customer c left join Orders o on c.id = o.customer_id
group by c.name, c.id
having sum(o.total_amount) > (select avg(k.total) from (select c.id, round(sum(o.total_amount)) total
														from Customer c left join Orders o on c.id = o.customer_id
														group by c.id) k);












