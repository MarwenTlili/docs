-- create employee table OneToMany reward
CREATE TABLE employee(
    employee_id int NOT NULL AUTO_INCREMENT IDENTITY PRIMARY KEY,
    first_name varchar(45) NULL,
    last_name varchar(45) NULL,
    salary decimal(18,0) NULL,
    joining_date datetime(6) DEFAULT NOW(),
    departement varchar(45) NULL,
    PRIMARY KEY(employee_id)
);

CREATE TABLE reward(
	reward_id int NOT NULL,
	employee_ref_id
);
