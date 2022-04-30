<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>注册</title>
  <link rel="stylesheet" href="/public/css/bootstrap.min.css">
<style>  
     .login{
          margin:10rem auto;
          width:22rem;
     }
  </style>
</head>
<body class="bg-light ">
    <div class="login bg-info p-5">
          <h1 class="text-center fs-8 text-white mb-5">后台管理系统</h1>
          <form action="/hregister" method="POST" class="d-flex flex-column">
                <div class="alert alert-warning my-7 py-2{{' d-none' if not error}}">格式错误,请重新输入！</div>
                <div class="input-group my-3">
                     <input type="text" class="form-control{{'is-invalid' if error and error.username}}" name="username" value="{{username}}" placeholder="账号">
                </div>
                <div><p style="font-size: 12px;color:white">*请输入4~18位字符</p></div>
                <div class="input-group my-3">
                     <input type="password" class="form-control{{'is-invalid' if error and error.password}} " name="password"  value="{{password}}" placeholder="密码">
                </div>
                <div><p style="font-size: 12px;color:white">*请输入4~18位字符</p></div>
                <div class="input-group my-3">
                     <input type="password" class="form-control{{'is-invalid' if error and error.password1}} " name="password1"  value="{{password1}}" placeholder="确认密码">
                </div>
                <div class="yanzheng" style="display:flex;">
                    <div class="input-group my-3" >
                        <input type="text" placeholder=" 验证码" style="width:120px;height:38px;border:none;padding:0px;margin:0px"name="code">
                    </div>
                    <div class="input-group  my-3" ><img src="/captcha" style="border:none" onclick="this.src = this.src + '?' +Math.random()"></div> 
                </div>
                 <button type="submit" class="btn btn-primary" style="background-color:white; border:1px solid gray;color:black">注册</button>
          </form> 
    </div>
        <script src="/public/js/bootstrap.min.js"></script>
</body>
</html>