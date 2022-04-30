<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>登录</title>
    <link rel="stylesheet" href="/public/css/bootstrap.min.css">
    <style> 
        .login{
          margin:10rem auto;
          width:22rem;
        } 
      </style>
  </head>
  <body class="bg-light ">
    <div class="login bg-dark p-5">
          <h1 class="text-center fs-8 text-white mb-5">P U</h1>
          <form method="POST"  class="d-flex flex-column">
                <div class="alert alert-warning my-7 py-2{{' d-none' if not error}}">格式或密码错误,请重新输入！</div>
                <!-- 获取后台传入的error -->
                <div class="input-group my-3">
                    <input type="text" class="form-control{{'is-invalid' if error and error.username}}" name="username" value="{{username}}" placeholder="账号">
                </div>
                <div><p style="font-size: 12px;color:white">*请输入4~18位字符</p></div>
                <div class="input-group my-3">
                    <input type="password" class="form-control{{'is-invalid' if error and error.password}} " name="password"  value="{{password}}" placeholder="密码">
                </div>
                <div><p style="font-size: 12px;color:white">*请输入4~18位字符</p></div>
                <div class="yanzheng" style="display:flex;">
                    <div class="input-group my-3" >
                        <input type="text" placeholder=" 验证码" style="width:120px;height:38px;border:none;padding:0px;margin:0px"name="code">
                    </div>
                    <div class="input-group  my-3" ><img src="/captcha" style="border:none" onclick="this.src = this.src + '?' +Math.random()"></div> 
                </div>
                <div class="input-group" style="display:flex;">
                    <div  style="padding:35px"><button class="btn btn-primary w-90 "style="background-color:white; border:1px solid gray;color:black" >登录</button></div>
                    <div style="padding:35px"><button class="btn btn-primary w-90 "style="background-color:white; border:1px solid gray;color:black"><a href="/register" style="text-decoration: none;color:black">注册</a></button></div>
              </div>
          </form>
    </div>
    <script src="/public/js/bootstrap.min.js"></script>
  </body>
  </html>