/*配置信息*/

//服务器监听的端口
const PORT = 80;
//session过期时间 24 hours
const SESSION_OUTDATE = 2 * 24 * 60 * 60 * 1000


//引入需要的模块
const cookieSession = require('cookie-session')
const path = require('path')
const constant = require("../utils/constant.js")
const bodyParser = require('body-parser')

//服务器app配置对象
class AppConfig {
    //注册app
    register() {
        // express html 模板注册
        this.app.engine('html', require('express-art-template'));
        this.app.set('view options', { debug: process.env.NODE_ENV !== 'production' });
        this.app.set('views', path.join(__dirname, "..", 'views'));
        this.app.set('view engine', 'html');

        // session注册
        this.app.use(cookieSession({
            name: constant.SESSION_NAME,
            keys: [constant.SESSION_KEY],
            maxAge: SESSION_OUTDATE
        }))

        // parse application/x-www-form-urlencoded
        this.app.use(bodyParser.urlencoded({ extended: true, limit: "10mb" }))
        // parse application/json
        this.app.use(bodyParser.json({ extended: true, limit: "10mb" }))

        // 静态资源目录设置
        this.app.use(require("express").static(path.join(__dirname, "..", 'public')));

        //配置上传文件上限
        this.app.use(require("express").json({ limit: "5120kb" }));
    }
    //构造函数,赋值
    constructor(app) {
        this.app = app;
        this.port = PORT;
        this.register();
    }
}

module.exports = AppConfig;
