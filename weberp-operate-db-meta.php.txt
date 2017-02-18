<?php 
function operate_db_meta($db_link)
{
	/*
	$tb_name = 'tb_fixed_asset';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`product_code` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE COMMENT '资产号',		
			`product_name` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产名称',		
			`type_code` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类号',		
			`type` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产类别',		
			`brand` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NULL NULL DEFAULT '' COMMENT '品牌',		
			`specification` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品型号规格',		
			`external_product_code` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外部货号',		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
			PRIMARY KEY(`product_code`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	*/

	// table for the full list of the fixed assets
	/*
	$tb_name = 'tb_fixed_asset_list';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`sn` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE COMMENT '序号',
			`product_code` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产号',		
			`product_name` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产名称',		
			`type_code` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类号',		
			`type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产类别',		
			`brand` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NULL NULL DEFAULT '' COMMENT '品牌',		
			`specification` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品型号规格',		
			`external_product_code` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外部货号',		
			`location` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL NULL DEFAULT '' COMMENT '存放地点',		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
			PRIMARY KEY(`sn`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	*/
	//$sql = "ALTER TABLE $tb_name MODIFY type VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资产类别'";
	//$sql = "ALTER TABLE $tb_name DROP PRIMARY KEY";


	// insert the inventory history into database 
	$tb_name = 'tb_asset_full_history';
	/*
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
			(
				`transaction_id` INT NOT NULL AUTO_INCREMENT COMMENT '事务序号',
				`barcode` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条形码',
				`quantity` INT NOT NULL DEFAULT 0 COMMENT '数量',
				`update_type` VARCHAR(1) NOT NULL DEFAULT '' COMMENT '库存更新类型',
				`update_date` DATE NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
				`update_time` TIME NOT NULL DEFAULT '00:00:00' COMMENT '时间',
				PRIMARY KEY(`transaction_id`)
			)
			ENGINE = INNODB DEFAULT CHARSET=UTF8";
	*/
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
			(
				`transaction_id` INT NOT NULL AUTO_INCREMENT COMMENT '事务序号',
				`barcode` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条形码',
				`quantity` INT NOT NULL DEFAULT 0 COMMENT '数量',
				`update_type` VARCHAR(1) NOT NULL DEFAULT '' COMMENT '库存更新类型',
				`update_datetime` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '数据库时间',
				PRIMARY KEY(`transaction_id`)
			)
			ENGINE = INNODB DEFAULT CHARSET=UTF8";
			
	/*			
	$tb_name = 'tb_asset_full';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
			(
				`barcode` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE COMMENT '条形码',
				`quantity` INT NOT NULL COMMENT '数量',
				`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
				PRIMARY KEY(`barcode`)
			)
			ENGINE = INNODB DEFAULT CHARSET=UTF8";
	*/			

	/*
	$tb_name = 'tb_incoming_asset_full';
	
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`sn` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE COMMENT '序号',
			`product_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',		
			`brand` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌',		
			`external_product_code` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外部货号',		
			`unit` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',		
			`least_quantity` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最小订货量',		
			`supplier` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '供货商户名称',		
			`contact_person` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系人',		
			`phone` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电话',		
			`QQ_online_contact` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'QQ/在线订购',		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
			PRIMARY KEY(`sn`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	*/

	/*
	$tb_name = 'tb_incoming_asset';
	
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`sn` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE COMMENT '序号',
			`product_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',		
			`brand` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌',		
			`external_product_code` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '外部货号',		
			`unit` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',		
			`least_quantity` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最小订货量',		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
			PRIMARY KEY(`sn`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	*/
	//$sql = "ALTER TABLE $tb_name CHANGE prdoct_name product_name VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称'";

	//$tb_name = 'tb_outgoing_asset';
	/*
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`product_code` VARCHAR(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE COMMENT '产品货号',
			`product_name_cn` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称',		
			`product_name_en` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品英文名称',		
			`product_specification` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品规格',		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
			PRIMARY KEY(`product_code`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	*/
	//$sql = "ALTER TABLE $tb_name CHANGE prdoct_name_cn product_name_cn VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品名称'";
	//$sql = "ALTER TABLE $tb_name CHANGE prdoct_name_en product_name_en VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品英文名称'";

	//$sql = "ALTER TABLE $tb_name ADD UNIQUE (`asset_name`)";
	//$sql = "DROP TABLE IF EXISTS $tb_name";

	// Create table doesn't return a resultset
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created/altered/dropped.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}

	return TRUE;


	// drop table 'customers'
	//$tb_name = 'customers';
	//$sql = "DROP TABLE IF EXISTS `customers`";
	// Drop table doesn't return a resultset 
	/*
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully dropped.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	*/
	
	// create `tb_inventory`, `tb_asset_name`, `tb_unit`, `tb_unit_convertion`, 
	// `tb_person`, `tb_org`, `tb_order`, `tb_invoice`, `tb_contract`, `tb_check_stock`,
	// `customers`, `orders`, `employees` tables
	
	/*
	$tb_name = 'tb_test';
	$sql = "CREATE TABLE IF NOT EXISTS tb_test
		(
			id INT NOT NULL AUTO_INCREMENT,
			sn VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			`序列号` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			remark VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(id)
		)
		ENGINE = INNODB";
	
	// Create table doesn't return a resultset
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	*/



	$tb_name = 'tb_asset_name';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`asset_name_id` INT NOT NULL AUTO_INCREMENT,
			`asset_name` VARCHAR(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`asset_name_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	//$sql = "ALTER TABLE $tb_name ADD UNIQUE (`asset_name`)";
	
	// Create table doesn't return a resultset
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}

	$tb_name = 'tb_brand';
	// alter table, use "show create table tb_brand" to see the actual name of the foreign key
	/*
	$sql = "ALTER TABLE $tb_name 
				DROP FOREIGN KEY tb_brand_ibfk_1, DROP FOREIGN KEY tb_brand_ibfk_2, DROP FOREIGN KEY tb_brand_ibfk_3, 
				DROP city_id, DROP province_id, DROP country_id";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully altered.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	*/
	// create table
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
	        (
	                `brand_id` INT NOT NULL AUTO_INCREMENT,
	                `brand_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	                `manufacturer_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	                `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	                PRIMARY KEY (`brand_id`),
					UNIQUE KEY brand_name_manufacturer_name (brand_name, manufacturer_name)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	//$sql = "ALTER TABLE $tb_name MODIFY manufacturer_name VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL";
	//$sql = "ALTER TABLE $tb_name ADD UNIQUE KEY brand_name_manufacturer_name (brand_name, manufacturer_name)";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created/altered.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}

	$tb_name = 'tb_unit';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`unit_id` INT NOT NULL AUTO_INCREMENT,
			`unit_symbol` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,		
			`unit_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
			`unit_name_chinese` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`unit_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	/*
	$sql = "ALTER TABLE $tb_name
				MODIFY COLUMN `unit_symbol` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL";
	*/
	/*
	$sql = "ALTER TABLE tb_unit 
			CHANGE `unit_symbol2name` `unit_name`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			CHANGE `unit_name2symbol` `unit_symbol`  VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL";
	*/
	//$sql = "ALTER TABLE tb_unit MODIFY unit_name VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_unit_convertion';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`unit_convertion_id` INT NOT NULL AUTO_INCREMENT,
			`unit_great_id` INT NOT NULL,		
			`unit_small_id` INT NOT NULL,		
			`convertion_factor` DECIMAL(12,2) NOT NULL,
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`unit_convertion_id`),
			FOREIGN KEY (`unit_great_id`) REFERENCES tb_unit(`unit_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY (`unit_small_id`) REFERENCES tb_unit(`unit_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			UNIQUE KEY unit_great_id_unit_small_id (unit_great_id, unit_small_id)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	//$sql = "ALTER TABLE tb_unit_convertion ADD UNIQUE KEY unit_great_id_unit_small_id (unit_great_id, unit_small_id)";
	
	/*
	$sql = "ALTER TABLE `tb_unit_convertion` MODIFY `convertion_factor` DECIMAL(12,2) NOT NULL";
	*/
	
	/*
	$sql = "UPDATE tb_unit_convertion
		SET tb_unit_convertion.convertion_factor=100
		WHERE tb_unit_convertion.unit_great_id IN (SELECT tb_unit.unit_id from tb_unit WHERE tb_unit.unit_symbol='m')
		AND tb_unit_convertion.unit_small_id IN (SELECT tb_unit.unit_id from tb_unit WHERE tb_unit.unit_symbol='cm')";
	*/
	/*
	$sql = "INSERT INTO tb_unit_convertion
		(unit_great_id, unit_small_id, convertion_factor)
		(SELECT tb1.unit_id, tb2.unit_id, 1000 FROM tb_unit AS tb1 INNER JOIN tb_unit AS tb2
			ON (tb1.unit_symbol='l' AND tb2.unit_symbol='pg'))";
	*/
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created/altered/updated.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_package';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`package_id` INT NOT NULL AUTO_INCREMENT,
			`package_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`package_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	//$sql = "ALTER TABLE tb_package MODIFY package_name VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_contact';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`contact_id` INT NOT NULL AUTO_INCREMENT,
			`person_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`nationality` INT NOT NULL,		
			`phone` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`mobile` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			`email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			`qq` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			`sex` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`position` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`idcard` VARCHAR(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`passport` VARCHAR(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`contact_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";

	$tb_name = 'tb_guest_post';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
			(
				`guest_post_id`	INT NOT NULL AUTO_INCREMENT,
				`org_name` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
				`person_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
				`phone` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
				`email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
				`qq` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
				`post_content` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
				PRIMARY KEY(`guest_post_id`)
			)
			ENGINE = INNODB DEFAULT CHARSET=UTF8";
		
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_country';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`country_id` INT NOT NULL AUTO_INCREMENT,
			`country_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`country_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_province';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`province_id` INT NOT NULL AUTO_INCREMENT,
			`province_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`country_id` INT NOT NULL,
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`province_id`),
			FOREIGN KEY(`country_id`) REFERENCES tb_country(`country_id`) ON UPDATE CASCADE ON DELETE RESTRICT
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_city';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`city_id` INT NOT NULL AUTO_INCREMENT,
			`city_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`province_id` INT NOT NULL,
			`country_id` INT NOT NULL,
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`city_id`),
			FOREIGN KEY(`province_id`) REFERENCES tb_province(`province_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`country_id`) REFERENCES tb_country(`country_id`) ON UPDATE CASCADE ON DELETE RESTRICT
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_org';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`org_id` INT NOT NULL AUTO_INCREMENT,
			`org_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`org_class` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`country_id` INT NOT NULL,		
			`province_id` INT NOT NULL,		
			`city_id` INT NOT NULL,		
			`street` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`postcode` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			`contact_id` INT NOT NULL,		
			`org_phone` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`org_mobile` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			`org_email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`org_id`),
			FOREIGN KEY(`city_id`) REFERENCES tb_city(`city_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`province_id`) REFERENCES tb_province(`province_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`country_id`) REFERENCES tb_country(`country_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`contact_id`) REFERENCES tb_contact(`contact_id`) ON UPDATE CASCADE ON DELETE RESTRICT
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_invoice';
	
	$sql = "CREATE TABLE IF NOT EXISTS `tb_invoice`
		(
			`invoice_id` INT NOT NULL AUTO_INCREMENT,
			`invoice_class_code` CHAR(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`invoice_serial_number` CHAR(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`supplier` INT NOT NULL,
			`buyer` INT NOT NULL,
			`value` DECIMAL(12,2) NOT NULL, 
			`currency` CHAR(3) NOT NULL, 
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`invoice_id`),
			FOREIGN KEY (`supplier`) REFERENCES tb_org(`org_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY (`buyer`) REFERENCES tb_org(`org_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			UNIQUE KEY invoice_class_code_invoice_serial_number (invoice_class_code, invoice_serial_number)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	//$sql = "ALTER TABLE $tb_name MODIFY `value` DECIMAL(12,2) NOT NULL";
	//$sql = "ALTER TABLE $tb_name ADD UNIQUE KEY invoice_class_code_invoice_serial_number (invoice_class_code, invoice_serial_number)";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created/altered.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_contract';
	$sql = "CREATE TABLE IF NOT EXISTS `tb_contract`
		(
			`contract_id` INT NOT NULL AUTO_INCREMENT,
			`contract_code` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,		
			`supplier` INT NOT NULL,
			`buyer` INT NOT NULL,
			`value` DECIMAL(12,2) NOT NULL, 
			`currency` CHAR(3) NOT NULL, 
			`invoice_id` INT NOT NULL,
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`contract_id`),
			FOREIGN KEY (`supplier`) REFERENCES tb_org(`org_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY (`buyer`) REFERENCES tb_org(`org_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY (`invoice_id`) REFERENCES tb_invoice(`invoice_id`) ON UPDATE CASCADE ON DELETE RESTRICT
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	//$sql = "ALTER TABLE $tb_name MODIFY `value` DECIMAL(12,2) NOT NULL";
	//$sql = "ALTER TABLE $tb_name MODIFY contract_code VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_order';
	$sql = "CREATE TABLE IF NOT EXISTS `tb_order`
		(
			`order_id` INT NOT NULL AUTO_INCREMENT,
			`order_code` VARCHAR(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,		
			`order_class` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`org_id` INT NOT NULL,
			`value` DECIMAL(12,2) NOT NULL, 
			`currency` CHAR(3) NOT NULL, 
			`invoice_id` INT NOT NULL,
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`order_id`),
			FOREIGN KEY (`org_id`) REFERENCES tb_org(`org_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY (`invoice_id`) REFERENCES tb_invoice(`invoice_id`) ON UPDATE CASCADE ON DELETE RESTRICT
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	//$sql = "ALTER TABLE $tb_name MODIFY `value` DECIMAL(12,2) NOT NULL";
	//$sql = "ALTER TABLE $tb_name MODIFY order_code VARCHAR(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_employee';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
		(
			`employee_id` INT NOT NULL AUTO_INCREMENT,
			`staff_id` VARCHAR(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`person_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`sex` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			`phone` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`mobile` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			`email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
			`depart` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			`position` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`idcard` VARCHAR(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`passport` VARCHAR(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
			`nationality` INT NOT NULL,		
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`employee_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
		
	$tb_name = 'tb_currency';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
	        (
	                `currency_id` INT NOT NULL AUTO_INCREMENT,
	                `code` CHAR(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
	                `chinese_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
	                `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	                PRIMARY KEY(`currency_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	//$sql = "ALTER TABLE $tb_name MODIFY code CHAR(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_site';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
	        (
	                `site_id` INT NOT NULL AUTO_INCREMENT,
	                `site_code` VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
	                `site_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
	                `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	                PRIMARY KEY(`site_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	/*
	$sql = "ALTER TABLE $tb_name
				MODIFY site_code VARCHAR(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
				MODIFY site_name VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	*/
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_store_condition_light';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
	        (
	                `light_id` INT NOT NULL AUTO_INCREMENT,
	                `light_requirement` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
	                `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	                PRIMARY KEY(`light_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	//$sql = "ALTER TABLE $tb_name MODIFY `light_requirement` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_store_condition_container';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
	        (
	                `container_id` INT NOT NULL AUTO_INCREMENT,
	                `container_requirement` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
	                `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	                PRIMARY KEY(`container_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	//$sql = "ALTER TABLE $tb_name MODIFY `container_requirement` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_store_condition_air';
	$sql = "CREATE TABLE IF NOT EXISTS $tb_name
	        (
	                `air_id` INT NOT NULL AUTO_INCREMENT,
	                `air_requirement` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE,
	                `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	                PRIMARY KEY(`air_id`)
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	//$sql = "ALTER TABLE $tb_name MODIFY `air_requirement` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL UNIQUE";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	$tb_name = 'tb_inventory';
	$sql = "CREATE TABLE IF NOT EXISTS `tb_inventory`
		(
			`inventory_id` INT NOT NULL AUTO_INCREMENT,
			`asset_name_id` INT NOT NULL,		
			`brand_id` INT NULL,
			`spec` VARCHAR(127) NULL,
			`sn_lot` VARCHAR(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			`store_condition_temperature` INT NOT NULL,
			`store_condition_light_id` INT NOT NULL,
			`store_condition_container_id` INT NOT NULL,
			`store_condition_air_id` INT NOT NULL,
			`warranty` DATE NOT NULL,
			`quantity_per_package` DECIMAL(6,2) NOT NULL,
			`unit_id_per_package` INT NOT NULL,
			`package_id_per_package` INT NOT NULL,
			`quantity_package` DECIMAL(12,2) NOT NULL,
			`package_id` INT NOT NULL,
			`quantity` DECIMAL(12,2) NOT NULL,
			`unit_id` INT NOT NULL,
			`check_date` DATE NOT NULL, 
			`original_value` DECIMAL(12,2) NULL, 
			`currency_id` INT NOT NULL, 
			`order_id` INT NULL, 
			`contract_id` INT NULL, 
			`invoice_id` INT NULL, 
			`person2receive_id` INT NOT NULL, 
			`store_keeper_id` INT NOT NULL, 
			`approver_id` INT NOT NULL, 
			`supplier_id` INT NULL, 
			`site_id` INT NOT NULL, 
			`store_place` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL, 
			`remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
			PRIMARY KEY(`inventory_id`),
			FOREIGN KEY(`asset_name_id`) REFERENCES tb_asset_name(`asset_name_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`brand_id`) REFERENCES tb_brand(`brand_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`store_condition_light_id`) REFERENCES tb_store_condition_light(`light_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`store_condition_container_id`) REFERENCES tb_store_condition_container(`container_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`store_condition_air_id`) REFERENCES tb_store_condition_air(`air_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`unit_id_per_package`) REFERENCES tb_unit(`unit_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`package_id_per_package`) REFERENCES tb_package(`package_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`package_id`) REFERENCES tb_package(`package_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`unit_id`) REFERENCES tb_unit(`unit_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`currency_id`) REFERENCES tb_currency(`currency_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`order_id`) REFERENCES tb_order(`order_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`contract_id`) REFERENCES tb_contract(`contract_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`invoice_id`) REFERENCES tb_invoice(`invoice_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`person2receive_id`) REFERENCES tb_employee(`employee_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`store_keeper_id`) REFERENCES tb_employee(`employee_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`approver_id`) REFERENCES tb_employee(`employee_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`supplier_id`) REFERENCES tb_org(`org_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
			FOREIGN KEY(`site_id`) REFERENCES tb_site(`site_id`) ON UPDATE CASCADE ON DELETE RESTRICT
		)
		ENGINE = INNODB DEFAULT CHARSET=UTF8";
	/*
	$sql = "ALTER TABLE $tb_name
		MODIFY `quantity_per_package` DECIMAL(6,2) NOT NULL, 
		MODIFY `quantity_package` DECIMAL(12,2) NOT NULL,
		MODIFY `quantity` DECIMAL(12,2) NOT NULL,
		MODIFY `original_value` DECIMAL(12,2) NULL";
	*/
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	
	/*
	$tb_name = 'fields';
	$sql = "CREATE TABLE IF NOT EXISTS `fields`
		(
			`table` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			`field` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			`field_display` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			CONSTRAINT table_field PRIMARY KEY (`table`, `field`)
		)
		ENGINE = INNODB";
	
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	*/
	
	/*
	$tb_name = 'genelibrary';
	$sql = "CREATE TABLE IF NOT EXISTS `genelibrary`
		(
			`accession` CHAR(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,		
			`gene_id` INT(9) NOT NULL,
			`symbol` VARCHAR(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			`description` VARCHAR(210) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			`unigene_cluster` CHAR(71) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
			PRIMARY KEY `accession`,
			ENGINE = INNODB
		)";
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	*/
	
	// change customers table, orders table, employees table
	/*
	$tb_name = 'customers';
	$sql = "ALTER TABLE `customers` 
		CHANGE `local_id` `local_id` TINYINT NOT NULL,
		ADD COLUMN `customer_class` boolean NULL AFTER `local_id`,
		CHANGE `phone_area` `phone_area` VARCHAR(5) NULL, 
		CHANGE `phone_number` `phone_number` VARCHAR(10) NULL, 
		CHANGE `mobile` `mobile` VARCHAR(19) NULL,
		CHANGE `remark` `remark` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL";
	*/
	
	//$sql = "ALTER TABLE `customers` ENGINE = INNODB";
	//$sql = "DELETE FROM `customers` WHERE CHAR_LENGTH(`company_name`)<1";
	//tb_name = 'customers';
	/* Create table doesn't return a resultset */
	/*
	if(mysqli_query($db_link, $sql) === TRUE)
	{
	    printf("Table %s successfully created/altered.\n", $tb_name);
	}
	else
	{
	    $message  = 'Invalid query: ' . mysqli_error($db_link) . "\n";
	    $message .= 'Whole query: ' . $sql;
	    die($message);
	}
	*/

	return TRUE;
}
?>
