drop database ASSIGNMENT_JAVA5;
go
use ASSIGNMENT_JAVA5;

go
create table categories(
id varchar(10) primary key,
name nvarchar(50)
)

go
create table products(
id int identity(1,1) primary key ,
name nvarchar(max),
image varchar(50),
price float,
createdate date,
avaiable bit,
categoryid varchar(10),
description nvarchar(max),
constraint fk_products_categories foreign key (categoryid) references categories(id)
)

go
create table account(
username varchar(50) primary key,
password varchar(50),
fullname nvarchar(50),
email varchar(50),
photo varchar(50),
activated bit,
admin bit
)

go
create table orders(
id bigint identity(1,1) primary key,
username varchar(50),
createdate date,
address nvarchar(max),
phone varchar(50),
constraint fk_orders_account foreign key (username) references account(username)
)

go
create table orderdetails(
id bigint identity(1,1) primary key,
orderid bigint,
productid int,
price float,
quantity int,
constraint fk_orderdetails_orders foreign key (orderid) references orders(id),
constraint fk_orderdetails_products foreign key (productid) references products(id)
)
go
create table cart_items(
id int identity(1,1) primary key,
name nvarchar(max),
image varchar(50),
price float,
quantity int,
productid int,
username varchar(50),
constraint fk_cart_items_product foreign key (id) references products(id),
constraint fk_cart_items_account foreign key (username) references account(username)
)
go
insert into account(username,password,fullname,email,photo,activated,admin) values
('phuongvdd','111',N'Võ Đình Duy Phương','phuongduy220502@gmail.com','avt1.jpg',1,1),
('hieulg','222',N'Lê Gia Hiếu','hieulegia@gmail.com','avt2.jpg',1,0),
('ngoclh','333',N'Lê Hoàng Ngọc','ngocle2205@gmail.com','avt3.jpg',1,1),
('hathi','444',N'Phạm Hà Thi','hathi@gmail.com','avt4.jpg',1,0),
('hchi','555',N'Nguyễn Hạnh Chi','hanhchi@gmail.com','avt5.jpg',1,1)
go
insert into categories(id,name) values 
('Men','Men Fashion'),
('Women','Women Fashion'),
('Kid','Kid Fashion')

go
/*Nam*/

insert into products(name,image,price,avaiable,createdate,description,categoryid) values
(N'ÁO SƠ MI KẺ SỌC','ao1.jpg','125.000','1','2022-05-23',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Men'),
(N'ÁO SƠ MI IN HỌA TIẾT','ao2.jpg','775.234','1','2022-06-23',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững.','Men'),
(N'ÁO SƠ MI COTTON PHỐI THÊU','ao3.jpg','425.000','1','2022-02-13',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Men'),
(N'ÁO SƠ MI SEAMLESS','ao4.jpg','125.000','1','2022-05-12',N'Áo sơ mi cổ điển, cổ bẻ, cài cúc và tay dài','Men'),
(N'ÁO SƠ MI IN HỌA TIẾT','ao5.jpg','125.000','1','2022-05-13',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Men'),
(N'ÁO SƠ MI COTTON HỌA TIẾT','ao6.jpg','425.000','1','2022-10-23',N'Người mẫu mặc size S và cao 185 cm,button placket at the front','Men'),
(N'ÁO SƠ MI IN HỌA TIẾT','ao7.jpg','775.000','1','2022-11-27',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Men'),
(N'ÁO SƠ MI FLOATY','ao8.jpg','875.000','1','2022-05-22',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Men'),
(N'ÁO SƠ MI FLOATY','ao9.jpg','125.000','1','2022-07-25',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững','Men'),
(N'ÁO SƠ MI HỌA TIẾT','ao10.jpg','475.000','1','2022-12-14',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Men'),
(N'ÁO SƠ MI HỌA TIẾT','ao11.jpg','775.000','1','2022-09-23',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Men'),
(N'ÁO KHOÁC SƠ MI OVERSIZE','ao12.jpg','575.000','1','2022-02-19',N'Áo sơ mi kẻ sọc, cổ sơ mi cổ điển, dài tay, túi ngực, thiết kế ôm vừa (Regular fit), người mẫu mặc size S','Men'),
(N'ÁO SƠ MI KẺ','ao13.jpg','775.000','1','2022-12-30',N'Áo sơ mi cổ điển, cổ bẻ, cài cúc và tay dài','Men'),
(N'ÁO SƠ MI COTTON','ao14.jpg','425.000','1','2022-07-21',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Men'),
(N'ÁO SƠ MI COTTON KẺ SỌC','ao15.jpg','075.000','1','2022-01-09',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Men'),
(N'ÁO SƠ MI OVERSIZE','ao16.jpg','425.000','1','2022-05-25',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Men'),
(N'ÁO SƠ MI DẠ','ao17.jpg','875.000','1','2022-06-18',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Men'),
(N'ÁO SƠ MI OXFORD','ao1.jpg','425.000','1','2022-09-19',N' Tay dài, phối túi ngực, hàng khuy bấm phía trước, người mẫu mặc size S','Men'),
(N'ÁO SƠ MI POPLIN PHỐI','ao2.jpg','775.000','1','2022-04-16',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Men'),
(N'ÁO SƠ MI KẺ SỌC','ao3.jpg','425.000','1','2022-02-27',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững.','Men')

/*Nu*/
insert into products(name,image,price,avaiable,createdate,description,categoryid) values
(N'Áo Khoác Phối Sọc','ao18.jpg','125.000','1','2022-05-23',N'Chất liệu dù bền, dễ giặt mang lại cảm giác thoáng mát, thích hợp sử dụng suốt mọi mùa trong năm. Thiết kế phong cách, năng động mang đến vẻ ngoài cá tính, trẻ trung cho phái nữ.','Women'),
(N'Áo Khoác Dù Nữ','ao19.jpg','775.234','1','2022-06-23',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững.','Women'),
(N'Áo Khoác Dù Nữ Đen','ao20.jpg','425.000','1','2022-02-13',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Women'),
(N'Áo Khoác Nữ Bomber','ao21.jpg','125.000','1','2022-05-12',N'Áo sơ mi cổ điển, cổ bẻ, cài cúc và tay dài','Women'),
(N'Áo Sơ Mi Nữ','ao22.jpg','125.000','1','2022-05-13',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Women'),
(N'Áo Kiểu Nữ Bẹt Vai','ao23.jpg','425.000','1','2022-10-23',N'Người mẫu mặc size S và cao 185 cm,button placket at the front','Women'),
(N'Áo Khoác Ren Nữ Tính','ao25.jpg','775.000','1','2022-11-27',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Women'),
(N'Set Áo Lumia','ao24.jpg','875.000','1','2022-05-22',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Women'),
(N'Đầm Voan Xẻ Tà','ao26.jpg','125.000','1','2022-07-25',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững','Women'),
(N'Đầm Dạo Phố Chấm Bi','ao27.jpg','475.000','1','2022-12-14',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Women'),
(N'Đầm Dạo Phố Tay Lửng','ao28.jpg','775.000','1','2022-09-23',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Women'),
(N'Đầm Dạo Phố Phối Sọc','ao29.jpg','575.000','1','2022-02-19',N'Áo sơ mi kẻ sọc, cổ sơ mi cổ điển, dài tay, túi ngực, thiết kế ôm vừa (Regular fit), người mẫu mặc size S','Women'),
(N'Đầm Suông Cách Điệu Cổ','ao30.jpg','775.000','1','2022-12-30',N'Áo sơ mi cổ điển, cổ bẻ, cài cúc và tay dài','Women'),
(N'Đầm Hở Vai Dập Ly','ao31.jpg','299.000','1','2022-07-21',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Women'),
(N'Đầm Suông Cách Điệu','ao32.jpg','240.447','1','2022-01-09',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Women'),
(N'Đầm Xòe Chuồn Chuồn','ao33.jpg','249.000','1','2022-05-25',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Women'),
(N'Đầm Hoa Vạt Xéo','ao34.jpg','289.124','1','2022-06-18',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Women'),
(N'Đầm Voan Hoa Nhún','ao35.jpg','289.000','1','2022-09-19',N' Tay dài, phối túi ngực, hàng khuy bấm phía trước, người mẫu mặc size S','Women'),
(N'Đầm Rớt Vai Hoa','ao36.jpg','279.000','1','2022-04-16',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Women'),
(N'Đầm Xòe Con Bướm','ao37.jpg','259.000','1','2022-02-27',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững.','Women')

/*Tre Em*/
insert into products(name,image,price,avaiable,createdate,description,categoryid) values
(N'Áo polo bé trai A164','ao39.jpg','280.000','1','2022-05-23',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Kid'),
(N'Áo sơ mi bé trai A104','ao40.jpg','250.000','1','2022-06-23',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững.','Kid'),
(N'Áo cổ vest bé trai A161','ao41.jpg','270.000','1','2022-02-13',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Kid'),
(N'Áo sơ mi bé trai A162','ao42.jpg','310.000','1','2022-05-12',N'Áo sơ mi cổ điển, cổ bẻ, cài cúc và tay dài','Kid'),
(N'Áo sơ mi bé trai B169','ao43.jpg','240.000','1','2022-05-13',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Kid'),
(N'Áo sơ mi hoạ tiết Caro A102','ao44.jpg','220.000','1','2022-10-23',N'Người mẫu mặc size S và cao 185 cm,button placket at the front','Kid'),
(N'Áo sơ mi hoạ tiết kẻ sọc A101','ao45.jpg','240.000','1','2022-11-27',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Kid'),
(N'Áo thun bé gái A166','ao46.jpg','220.000','1','2022-05-22',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Kid'),
(N'Áo thun bé trai A123','ao47.jpg','225.000','1','2022-07-25',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững','Kid'),
(N'Áo thun bé trai A124','ao48.jpg','175.000','1','2022-12-14',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Kid'),
(N'Áo thun trẻ em A180','ao49.jpg','220.000','1','2022-09-23',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Kid'),
(N'Áo thun trẻ em A177','ao50.jpg','255.000','1','2022-02-19',N'Áo sơ mi kẻ sọc, cổ sơ mi cổ điển, dài tay, túi ngực, thiết kế ôm vừa (Regular fit), người mẫu mặc size S','Kid'),
(N'Áo thun bé trai A139','ao51.jpg','230.000','1','2022-12-30',N'Áo sơ mi cổ điển, cổ bẻ, cài cúc và tay dài','Kid'),
(N'Áo thun dài tay bé trai A122','ao52.jpg','250.000','1','2022-07-21',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Kid'),
(N'Áo thun dài tay bé trai A146','ao53.jpg','259.000','1','2022-01-09',N'Lyocell trong thiết kế này được sản xuất từ bột gỗ bạch đàn tôn trọng môi trường. Việc sản xuất sợi phân hủy sinh học này làm giảm tiêu thụ nước và khiến nó trở thành một sản phẩm có trách nhiệm với môi trường','Kid'),
(N'Áo thun dài tay bé trai A158','ao54.jpg','260.000','1','2022-05-25',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Kid'),
(N'Áo thun trẻ em A129','ao55.jpg','247.000','1','2022-06-18',N'Sản phẩm này được làm từ sợi viscose thân thiện với môi trường. Các nhà thiết kế của chúng tôi lựa chọn loại sợi có nguồn gốc từ bột gỗ này bởi nó đảm bảo quản lý rừng bền vững.','Kid'),
(N'Áo thun trẻ em A159','ao56.jpg','210.000','1','2022-09-19',N' Tay dài, phối túi ngực, hàng khuy bấm phía trước, người mẫu mặc size S','Kid'),
(N'Áo thun trẻ em A157','ao39.jpg','213.000','1','2022-04-16',N'Áo cắt cổ điển với một nút nút, cổ áo nhọn rộng và chữ ký "S" thêu ở mặt trước.','Kid'),
(N'Áo khoác trẻ em A151','ao57.jpg','230.000','1','2022-02-27',N'Sản phẩm này được làm bằng viscose có trách nhiệm với môi trường. Các nhà thiết kế của chúng tôi đã chọn loại sợi này có nguồn gốc từ bột gỗ vì nó đảm bảo quản lý rừng bền vững.','Kid')

--thong ke doanh thu
select ct.id ,pr.name,sum(odt.quantity),count(od.username),od.createdate,sum(odt.quantity * odt.price) 
      from orderdetails odt join products pr on  odt.productid = pr.id 
	                        join categories ct on ct.id = pr.categoryid
                            join orders od on odt.orderid = od.id  
							join account ac on ac.username = od.username 
							group by pr.name,ct.id,od.createdate 
							order by sum(odt.quantity) desc