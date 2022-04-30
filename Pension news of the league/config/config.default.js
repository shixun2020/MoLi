//配置文件，配置相应插件
exports.keys = 'abdgfhjiklld';//可以更改值，配置文件只有在启动时才加载，若添加配置最好重新npm run dev

exports.view = {
    defaultViewEngine: 'nunjucks',
    mapping: {
      '.tpl': 'nunjucks',
    },
};

exports.security = {
    csrf: {
      enable:false
      // headerName: 'x-csrf-token', // 通过 header 传递 CSRF token 的默认字段为 x-csrf-token
    },
};

exports.multipart = {
  mode: 'file',
};

exports.assets = {
    publicPath: 'app/public/upload', //配置外部访问本地图片的路径的名字
}

exports.validate = {
    convert: false,
  // validateRoot: false,
};

exports.session = {
    key: 'ghgsdgsdsdgdg',//可以更改值
    maxAge: 24 * 3600 * 1000, // 1 天 
    encrypt: true,
    renew:true,
};

exports.cookie = {
    key: 'gsbgbgjilkdfi',
    maxAge: 24 * 3600 * 1000, // 1 天
    httpOnly: true, // 仅允许服务获取,不允许js获取
    signed: true, // 对cookie进行签名 防止用户修改cookie
    encrypt: true // 是否对cookie进行加密 如果cookie加密那么获取的时候要对cookie进行解密
};

exports.mysql = {
  // 单数据库信息配置
  client: {
    // host
    host: '127.0.0.1',
    // 端口号
    port: '3306',
    // 用户名
    user: 'egghhr',
    // 密码
    password: 'abcdef',
    // 数据库名
    database: 'hhr',
  },
  // 是否加载到 app 上，默认开启
  app: true,
  // 是否加载到 agent 上，默认关闭
  agent: false,
};
  
 