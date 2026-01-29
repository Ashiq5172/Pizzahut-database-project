create table pizza_types (
    pizza_type_id varchar(50) primary key,
    name varchar(100) not null,
    category varchar(50),
    ingredients text
);

create table pizzas (
    pizza_id varchar(50) primary key,
    pizza_type_id varchar(50),
    size varchar(10),
    price decimal(10, 2),
    foreign key (pizza_type_id) references pizza_types(pizza_type_id)
);

create table orders (
    order_id int primary key,
    date date not null,
    time time not null
);

create table order_details (
    order_details_id int primary key,
    order_id int,
    pizza_id varchar(50),
    quantity int,
    foreign key (order_id) references orders(order_id),
    foreign key (pizza_id) references pizzas(pizza_id)
);
