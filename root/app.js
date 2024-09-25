/*网站服务器入口脚本*/

//引入express对象
const express = require("express");
//引入路由注册脚本
const routes = require("../routes/routes.js");
//引入配置脚本
const config = require("./config.js");


//创建服务器app对象
const app = express();

//配置信息
const cfg = new config(app);

//注册路由
routes.register(app);

//服务器启动...
app.listen(cfg.port, () => {
    console.log(`NodeJS Server Running In Port ${cfg.port} ...`);
})
