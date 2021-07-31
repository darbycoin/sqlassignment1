create database assignment_one;

use assignment_one;

create table product(
product_id int PRIMARY KEY auto_increment NOT NULL,
sku varchar(25) NOT NULL UNIQUE,
product_name varchar(40) NOT NULL,
product_desc varchar(255),
inventory int NOT NULL,
unit_price double NOT NULL,
shipping_price double NOT NULL
);

create table user_account(
account_id int PRIMARY KEY auto_increment NOT NULL,
first_name varchar(25) NOT NULL,
last_name varchar(40) NOT NULL,
date_of_birth date,
email varchar(40) NOT NULL UNIQUE,
phone char(10) NOT NULL UNIQUE,
password varchar(20) NOT NULL
);

create table address(
shipping_address_id int PRIMARY KEY auto_increment NOT NULL,
street_number int NOT NULL,
street_name varchar(30) NOT NULL,
civic_number int DEFAULT NULL,
city varchar(30) NOT NULL,
province char(2) NOT NULL,
country varchar(30) NOT NULL,
account_id int NOT NULL,
FOREIGN KEY (account_id) references user_account(account_id)
);

create table user_order(
order_id int PRIMARY KEY auto_increment NOT NULL,
order_date datetime NOT NULL,
total_price double NOT NULL,
shipping_address_id int NOT NULL UNIQUE,
payment_method_id int NOT NULL,
cart_id int NOT NULL UNIQUE,
FOREIGN KEY (shipping_address_id) REFERENCES address(shipping_address_id),
FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_id),
FOREIGN KEY  (cart_id) references cart(cart_id)
);

create table category(
category_id int PRIMARY KEY NOT NULL auto_increment,
category_name varchar(20) NOT NULL,
product_id int UNIQUE,
FOREIGN KEY (product_id) references product(product_id)
);

create table cart(
cart_id int PRIMARY KEY NOT NULL auto_increment,
total_price double NOT NULL,
quantity int NOT NULL DEFAULT '1',
product_id int NOT NULL,
foreign key (product_id) references product(product_id))
;

create table payment_method(
payment_id int auto_increment NOT NULL PRIMARY KEY,
payment_method_id int NOT NULL
);

create table payment_gift_card(
method_id int NOT NULL,
code int NOT NULL,
used_status tinyint NOT NULL,
PRIMARY KEY (method_id),
FOREIGN KEY (method_id) references payment_method(payment_id)
);


create table payment_credit(
credit_id int PRIMARY KEY auto_increment NOT NULL,
card_number char(16) UNIQUE NOT NULL,
card_name varchar(80) NOT NULL,
expiry_date date NOT NULL,
method_id int NOT NULL,
billing_address_id int NOT NULL UNIQUE,
FOREIGN KEY (payment_id) references payment_method(payment_id),
FOREIGN KEY (billing_address_id) references address(shipping_address_id)
);

create table payment_paypal(
paypal_id int NOT NULL auto_increment PRIMARY KEY,
email varchar(40) NOT NULL,
payment_id int NOT NULL,
FOREIGN KEY (payment_id) references payment_method(payment_id)
);

create table wishlist(
wishlist_id int PRIMARY KEY auto_increment NOT NULL,
wishlist_name varchar(20),
product_id int NOT NULL,
account_id intNOT NULL,
FOREIGN KEY (product_id) references product(product_id),
FOREIGN KEY (account_id) references user_account(account_id)
);

create table user_store(
product_id int NOT NULL,
account_id int NOT NULL,
FOREIGN KEY (product_id) references product(product_id),
FOREIGN KEY (account_id) references user_account(id)
);


