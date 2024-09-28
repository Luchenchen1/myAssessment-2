//这是数据库的配置文件
module.exports = {
	// 主机名  数据库所在电脑的主机名
	host:'localhost',
	// 数据库的账号
	user:'newuser',
	// 数据库密码
	password:'123456',
	// 当前连接的数据库名称
	database:'crowdfunding_db',
	// 端口号
	port:'3306',
	connectionLimit : 20,
	waitForConnections: false
}
