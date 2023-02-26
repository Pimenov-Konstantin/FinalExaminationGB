Create schema `HumanFriendsgb`;
drop schema `HumanFriendsgb`;
use `HumanFriendsgb`;

create table dog (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);

create table hamster (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);

create table cat (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);

create table horse (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);

create table camel (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);

create table donkey (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);

create table pet (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);

create table packAnimal (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);

create table humanFriend(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday Date
    );
    
    insert into cat (Name, Command, Birthday) values
    ('Лилу', 'Спать', '2022-01-01'),
    ('Мурка', 'Спать', '2021-01-01');
    
    select * from cat;

    insert into dog (Name, Command, Birthday) values
    ('Шарик', 'Лежать', '2020-01-01'),
    ('Чаппи', 'Лежать', '2019-01-01');
	
    select * from dog;
 
	insert into hamster (Name, Command, Birthday) values
    ('Хома', 'Бежать', '2018-01-01'),
    ('Хомячный', 'Бежать', '2017-01-01');
	
    select * from hamster;
     
	insert into camel (camelName, camelCommand, camelLiftWeight, camelBirthday) values
    ('Плевок', 'Плюнуть', 100, '2016-01-01'),
    ('Трехгорбый', 'Плюнуть', 50, '2015-01-01');
	
    select * from camel;
     
	insert into horse (Name, Command, liftWeight, Birthday) values
    ('Быстрый', 'Галопом', 150, '2014-01-01'),
    ('Скакун', 'Галопом', 250, '2013-01-01');
	
    select * from horse;    
     
	insert into donkey (Name, Command, liftWeight, Birthday) values
    ('Долгий', 'Идти', 35, '2012-01-01'),
    ('Тугой', 'Идти', 10, '2011-01-01');
	
    select * from donkey;  	
 
 ## Удаление таблицы верблюдов
 delete from camel where id > 0;
 select * from camel;
 
## Объединение таблицы лошадей и ослов в одну таблицу.
create table packAnimalNew (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
select  Name, 
        Command, 
        Birthday
from horse union 
select  Name, 
        Command, 
        Birthday
from donkey;

select * from packAnimalNew;

## Создание таблицы, в которой все животные в возрасте от 1 до 3 лет.
INSERT into pet (Name, Command, Birthday)
select  Name, 
        Command, 
        Birthday
from cat union 
select  Name, 
        Command, 
        Birthday
from dog union
select  Name, 
        Command, 
        Birthday
from hamster;
select * from pet;

INSERT into humanFriend (Name, Command, Birthday)
select  Name, 
        Command, 
        Birthday
from pet union 
select  Name, 
        Command, 
        Birthday
from packAnimalNew;
select * from humanFriend;

create table youngAnimals (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
select Name, 
        Command, 
        Birthday,
        Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) as age
from humanFriend
where Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) > 1 
	and Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) < 3;
select * from youngAnimals;

## Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.

create table newhumanFriend (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
select  Name, 
        Command,
        Birthday,
        'cat' as oldTable
from cat union 
select  Name, 
        Command, 
        Birthday,
        'dog' as oldTable
from dog union
select  Name, 
        Command, 
        Birthday,
        'hamster' as oldTable
from hamster union 
select  Name, 
        Command, 
        Birthday,
        'horse' as oldTable
from horse union 
select  Name, 
        Command, 
        Birthday,
        'donkey' as oldTable
from donkey;

select * from newhumanFriend;