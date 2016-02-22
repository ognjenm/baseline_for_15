delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `hethi_registration`(
in cust_name varchar(50),in cust_contact_name varchar(50),
in cust_business_name varchar(50),in cust_business_email varchar(100),
in cust_contact_number varchar(20),
in cust_login_id varchar(50),in cust_password varchar(50))
BEGIN
declare customer_id bigint(11);
declare user_id bigint(11);
declare addressid bigint(11);
set addressid=(select ifnull((select max(`dcustomercommn`.`addressid`) from `hethi`.`dcustomercommn`),0));
set addressid=addressid+1;
INSERT INTO `hethi`.`dcustomercommn`
(`address1`,
`address2`,
`address_type`,
`addressid`,
`contact_email`,
`contact_fax`,
`contact_tel`,
`cust_country`,
`cust_loc_zip`,
`gps_coordinate`,
`lastupdtm`,
`lastupuser`,
`linkedin`,
`socialtype`,
`whatsapp`)
VALUES
(
'',
'',
'',
addressid,
cust_business_email,
'',
'',
'',
'',
'',
now(),
1,
'',
'',
''
);

set customer_id=(select ifnull((select max(`dcustomer`.`customer_id`) from `hethi`.`dcustomer`),0));
set customer_id=customer_id+1;

INSERT INTO `hethi`.`dcustomer`
(`business_address`,
`business_email`,
`business_fax`,
`business_name`,
`contact_name`,
`contact_number`,
`customer_id`,
`customer_name`)
VALUES
(
addressid,
cust_business_email,
'',
cust_business_name,
cust_contact_name,
cust_contact_number,
customer_id,
cust_name
);
set user_id=(select ifnull((select max(`duser`.`user_id`) from `hethi`.`duser`),0));
set user_id=user_id+1;

INSERT INTO `hethi`.`duser`
(`customer_id`,
`lastupdtm`,
`user_address`,
`user_id`,
`user_login_id`,
`user_login_password`,
`user_name`,
`role_id`)
VALUES
(
customer_id,
now(),
addressid,
user_id,
cust_login_id,
cust_password,
cust_name,
1);
INSERT INTO `hethi`.`drole`
(`customer_id`,
`lastupdtm`,
`role_id`,
`role_name`)
VALUES
(
customer_id,
now(),
1,
'Administrator'
);
Select
  hethi.dcustomer.*,
  hethi.dcustomercommn.*,
  hethi.drole.role_name,
  hethi.drole.role_id,
  hethi.duser.user_id,
  hethi.roles.role_homepage 
From
  hethi.dcustomer Inner Join
  hethi.drole On hethi.dcustomer.customer_id = hethi.drole.customer_id
  Inner Join
  hethi.dcustomercommn On hethi.dcustomer.business_address =
    hethi.dcustomercommn.addressid Inner Join
  hethi.duser On hethi.dcustomer.customer_id = hethi.duser.customer_id 
inner join hethi.roles on hethi.roles.role_id=hethi.drole.role_id
Where
  hethi.duser.user_login_id = cust_login_id And
  hethi.duser.user_login_password = cust_password;
END$$

