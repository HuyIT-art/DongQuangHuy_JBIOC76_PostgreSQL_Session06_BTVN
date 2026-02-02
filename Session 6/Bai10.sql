create table OldCustomers(
	id serial primary key,
	name varchar(100),
	city varchar(50)
);
insert into OldCustomers (name, city) values
('Nguyễn Văn An', 'Hà Nội'),
('Trần Thị Bình', 'Hà Nội'),
('Lê Hoàng Cường', 'Đà Nẵng'),
('Phạm Minh Đức', 'TP HCM'),
('Võ Thị Lan', 'TP HCM'),
('Đặng Quốc Huy', 'Cần Thơ');

create table NewCustomers(
	id serial primary key,
	name varchar(100),
	city varchar(50)
);
insert into NewCustomers (name, city) values
('Nguyễn Văn An', 'Hà Nội'),     -- trùng với Old
('Trần Thị Bình', 'Hà Nội'),     -- trùng với Old
('Nguyễn Minh Khoa', 'TP HCM'),
('Phạm Minh Đức', 'TP HCM'),     -- trùng với Old
('Lê Thị Mai', 'Đà Nẵng'),
('Hoàng Quốc Bảo', 'Hà Nội');

--Lấy danh sách tất cả khách hàng (cũ + mới) không trùng lặp (UNION)
select name, city from OldCustomers
union
select  name, city from NewCustomers;

--Tìm khách hàng vừa thuộc bảng OldCustomers vừa thuộc bảng NewCustomers (INTERSECT)
select  name, city from OldCustomers
intersect
select  name, city from NewCustomers;

--Tính số lượng khách hàng ở từng thành phố (dùng GROUP BY city)
select k.city, count(*) "Số lượng khách hàng"
from   (select  name, city from OldCustomers
		union
		select  name, city from NewCustomers) k
group by k.city;

--Tìm thành phố có nhiều khách hàng nhất (dùng Subquery và MAX)
select u.city, u.amount
from (select k.city city, count(*) amount
	  from (select name, city from OldCustomers
			union
			select name, city from NewCustomers) k
			group by k.city) u
where u.amount = (select max(i.amount) from (select k.city, count(*) amount
							from   (select  name, city from OldCustomers
							union
							select  name, city from NewCustomers) k
					  group by k.city) i);

















