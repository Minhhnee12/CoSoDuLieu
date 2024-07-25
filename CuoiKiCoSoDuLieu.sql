create database nuoithu
create table Room (
	room_id int not null,
	name_ nvarchar(20),
	max_ int,
	primary key (room_id)
)

create table Animal (
	animal_id int not null,
	name_ nvarchar(50),
	age int,
	buy_at datetime,
	roomid int,
	staffid int,
	primary key (animal_id)
)
create table staff (
	staff_id int not null,
	name_ nvarchar(50),
	age int,
	birthday datetime,
	theaddress nvarchar (50),
	roomwork_id int,
	primary key (staff_id)
)


create table FoodType (
	foodtype_id int not null,
	name_ nvarchar(50),
	price float,
	primary key (foodtype_id)
)

create table FoodAnimal (
	foodtypeid int not null,
	animalid int not null,
	price float,
	amount float
)
alter table Animal
add constraint FK_Animal_Room
foreign key (roomid)
references Room (room_id)

alter table Animal
add constraint FK_Animal_staff
foreign key (staffid)
references staff (staff_id)

alter table FoodAnimal
add constraint FK_FoodAnimal_FoodType
foreign key (foodtypeid)
references FoodType (foodtype_id)

alter table FoodAnimal
add constraint FK_FoodAnimal_Animal
foreign key (animalid)
references Animal (animal_id)

insert into Room
values
	(6, 'Chuong 6', 10),
	(7, 'Chuong 7', 9),
	(8, 'Chuong 8', 10),
	(9, 'Chuong 9', 4),
	(10, 'Chuong 10', 11),
	(1, 'Chuong 1', 5),
	(2, 'Chuong 2', 1),
	(3, 'Chuong 3', 10),
	(4, 'Chuong 4', 12),
	(5, 'Chuong 5', 21)

insert into FoodType
values
	(26, 'Thit ca', 80000),
	(27, 'Dua hau', 90000),
	(28, 'Thit cuu', 1200000),
	(29, 'Rong reu', 60000),
	(30, 'Trung', 60000),
	(21, 'Thit bo', 100000),
	(22, 'Thit lon', 50000),
	(23, 'Thit ga', 70000),
	(24, 'Tao', 50000),
	(25, 'Co', 5000)
	
insert into Animal
values
	(36, 'Hong Hac', 2, '2021-5-19 08:00:00', 6,2564),
	(37, 'Ca Sau', 3, '2021-2-28 10:00:00', 7,1586),
	(38, 'Rua', 4, '2021-7-1 09:30:00',8,4258),
	(39, 'Ha Ma', 7, '2021-2-10 12:00:00', 9,6528),
	(40, 'Seu', 2, '2021-8-9 11:00:00', 10,7845),
	(31, 'Ho cai', 3, '2021-01-01 08:00:00', 2,3584),
	(32, 'Ho duc', 5, '2021-03-12 08:35:00', 2,3584),
	(33, 'Da dieu', 6, '2021-04-01 08:00:00', 3,9684),
	(34, 'Huou', 4, '2021-04-10 16:00:00', 5,8324),
	(35, 'Su tu cai', 1, '2021-04-15 08:00:00', 4,8974)

insert into staff
values
	(2564, 'Nguyen Hong Xuan', 27, '1989-12-8', 'CC26', 08),
	(1586, 'Tran Van Khanh', 56, '1970-9-11', 'AA06', 03),
	(4258, 'Hong Anh Tu', 22, '1998-3-12', 'BB06', 04),
	(6528, 'Nguyen Kim Han', 19,'2003-8-11', 'CC14', 06),
	(7845, 'Pham Thuy Tien', 24, '1998-7-2', 'CC84', 07),
	(8456, 'Le Thi Nam', 46, '1984-5-5', 'BB65', 05),
	(3584, 'Nguyen Van Khang', 28, '1999-12-12', 'AA01', 01),
	(9684, 'Tran Nhat Ku', 69, '1996-6-9', 'AA69', 69),
	(8324, 'Nguyen Nhat Duy', 21, '2002-10-21', 'AA73', 02),
	(8974, 'Lam Van Phich', 38, '1989-1-30', 'BB83', 38)
insert into FoodAnimal
values
	(26, 36, 80000, 80),
	(27, 39, 90000, 120),
	(28, 37, 1200000, 90),
	(29, 38, 60000, 30),
	(30, 40, 60000, 100),
	(21, 31, 100000, 50),
	(23, 32, 50000, 80),
	(24, 34, 50000, 100),
	(25, 33, 5000, 600),
	(22, 35, 50000, 140)

select Room.room_id 'IdChuong', Room.name_ 'TenChuong', Animal.name_ 'TenDongVat', Animal.age 'Tuoi', Animal.buy_at 'NgayMuaVe'
from Room join Animal on Room.room_id = Animal.roomid
order by Room.room_id

select Room.*, count(Animal.roomid) 'SoLuongCan', count(Animal.roomid) - Room.max_ 'SoLuongConThieu'
from Room join Animal on Room.room_id = Animal.roomid
group by Room.room_id, Room.name_, Room.max_
having count(Animal.roomid) > Room.max_

select Room.*, count(Animal.roomid) 'SoLuongCan', Room.max_ - count(Animal.roomid) 'SoLuongConThua'
from Room join Animal on Room.room_id = Animal.roomid
group by Room.room_id, Room.name_, Room.max_
having count(Animal.roomid) < Room.max_