create database assignment418_08
use assignment418_08

create table Products
(PId int primary Key identity(500,1),
PName nvarchar(50),
Price float,
PTax as Price * 0.1 persisted,
PCompany nvarchar(50) check  (PCompany in ('samsung','apple','xiaomi','realme','redmi','Htc')),
PQty int default 10 check(PQty>=1)

)
select * from Products

Create proc sp_Retrive
with encryption
As

select PId,PName,(Price+PTax) as 'price with Tax', 
PCompany,(PQty*(Price+PTax)) as 'Total price' from products
Exec sp_Retrive


Create proc sp_tax
@pcom nvarchar(50)

With encryption
As
select sum(PTax) from products where PCompany=@pcom

Exec sp_tax 'apple'
