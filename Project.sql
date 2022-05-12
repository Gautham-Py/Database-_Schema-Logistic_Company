create database Project;
use project;
/* Employee_Details TAble */

Create table Employee(
		Emp_id          int          primary key,
		Emp_Name        varchar(30)  not null,
		Emp_Branch      varchar(15)  not null,
		Emp_Designation varchar(40)  not null,
		Emp_Addr 		varchar(100) not null,
		Emp_Cont_No     varchar(10)  unique);
		
Select* from employee;
describe employee;

/* Membership_TAble */

create table Membership(
		M_ID        int     primary key,
		Start_Date  date,
 		End_Date    date);
        
select * from membership;

/* Customer_ table */

Create table Customer(
		Cust_id		  int 	      primary key,
		Cust_name	  varchar(30),
		Cust_email_id varchar(50),
		Cust_cont_no  varchar(10),
		Cust_Addr     varchar(100),
		Cust_type     varchar(30) check(Cust_type in ('Wholesale','Retail','Internal Goods')),
		M_id          int ,       foreign key(M_id) references membership (m_id));
        
select * from customer;

describe customer;

/* Shipment_details */

create table Shipment(
		SH_id        varchar(6)   primary key,
		Sh_Content   varchar(40),
		Sh_Domain	 varchar(15)  check (Sh_domain in ('International','Domestic')),
		Sh_Type		 varchar(15)  check (Sh_Type in ('Express','Regular')),
 		Sh_Weight    varchar(10)  not null,
		Sh_charges   int,
		Sr_Addr		 varchar(100) not null,
		Ds_Addr      varchar(100) not null,
	    Cust_id      int,         foreign key(Cust_id) references Customer(Cust_id));
        
select * from Shipment;

describe shipment;

/* Payment_details */

create table Payment(
		Payment_id	    varchar(40)  primary key,
		Amount	        int          not null,
		Payment_status  varchar(10)  check(Payment_status in ('PAID','NOT PAID')),
		Payment_date    Text,
		Payment_mode    varchar(25)  check(Payment_mode in ('COD','CARD PAYMENT')),
		SH_id	        varchar(6),  foreign key (SH_id) references Shipment(SH_id),
		Cust_id         int,         foreign key (Cust_id) references Customer(Cust_id));
      
select * from Payment;

describe payment;
 /* Status_TAble */
 
 Create table Status(
		Current_St		varchar(15),
		Sent_date		Text,
		Delivery_date   Text,
		Status_Sh_id	varchar(6)  primary key);
        
select * from status;
describe status;

/* Employee_Manages_SHipment */

Create table Employee_Manages_Shipment(
		Emp_id	     	int,       foreign key (Emp_id)           references Employee(Emp_id),
		Shipment_Sh_id  varchar(6), foreign key (Shipment_Sh_id)  references Shipment(SH_id),
		Status_Sh_id    varchar(6), foreign key (Status_Sh_id)    references Status(Status_Sh_id));
        
        
select * from employee_Manages_shipment;

describe employee_Manages_shipment;