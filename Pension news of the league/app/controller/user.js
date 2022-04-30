const Controller=require('egg').Controller;
const Crypto=require('crypto');//导入crypto加密模块
class UserController extends Controller{
    async uindex(){
        this.ctx.body="欢迎进入usercontroller";
    }
    async fail(){
      await this.ctx.render('fail.tpl');
    }
    async register(){
      await this.ctx.render('frontpage/register.tpl');
    }
    async doregister(){
        let error={};
          try{
            this.ctx.validate({
                username:{
                    type:'string',
                    required:true,
                    min:4,
                    max:18
                },
                password:{
                    type:'string',
                    required:true,
                    min:4,
                    max:18
                }
            });    
            let username=this.ctx.request.body.username;
            let salt=Crypto.randomBytes(6).toString('hex');//使盐值生成强伪随机数据，用于作为密钥或者盐值字节数为6，转换成字符串。
            let password = Crypto.pbkdf2Sync(this.ctx.request.body.password,salt,10000,64,'sha512' ).toString('hex');
              // console.log(password);
            let password1=this.ctx.request.body.password1;
            // var userregister={ username,password}
            let user=await this.ctx.service.user.create({//
                  'username':username,
                  'password':password,
                  'salt':salt//数据库存入相应盐值字段
            }); 
            let session_captcha=this.ctx.session.captcha//获取captcha.js的验证码
            console.log(this.ctx.session.captcha);
            let code=this.ctx.request.body.code;//前台用户输入的验证码
            // console.log(code);
                if (code.toUpperCase() !==session_captcha.toUpperCase()) {//将用户输入验证码和svg-captcha生成的统一换成大写，进行比对
                  // ctx.body = await ctx.service.user.read(username, password)
                  this.ctx.redirect('/failregister');//对比失败重定向
                }
                  else{
                       this.ctx.redirect('/login');
                  }
        
              }catch(e){
                error=e;//捕获异常，传到前台，前台获取错误弹出警告数据
              }
              await this.ctx.render('frontpage/register.tpl',{
                error
              });
    }

    async login(){
         await this.ctx.render('frontpage/login.tpl');
    }
    
    async dologin() {
          let error={};
          try  {  //validate验证
              this.ctx.validate({
                username:{
                    type:'string',
                    required:true,
                    min:4,
                    max:18
              },
              password:{
                type:'string',
                required:true,
                min:4,
                max:18
              }
          });
          let username=this.ctx.request.body.username;//获取页面表单输入的内容 
          let user= await this.ctx.service.user.read(username);//去service层user()查找数据库内容
          this.ctx.session.user=user;//将用户信息存储到session，页面调用{{ctx.session.user.username}}能获取用户名在页面上显示
            console.log(this.ctx.session.user);
            if(!user){
              throw new Error('找不到用户');
            }
            let password = Crypto.pbkdf2Sync(this.ctx.request.body.password,user.salt,10000,64,'sha512').toString('hex');
            //从数据库拿出盐值即user.salt,和用户输入密码进行散列
            if(user.password!==password){
              throw  new Error('密码错误');
            } 
            let session_captcha=this.ctx.session.captcha
              console.log(this.ctx.session.captcha);
              let code=this.ctx.request.body.code;
              // console.log(code);
                  if (code.toUpperCase() !==session_captcha.toUpperCase()) {
                    // ctx.body = await ctx.service.user.read(username, password)
                    this.ctx.redirect('/fail');
                  }
                    else{
                         this.ctx.redirect('/homepage');
                    }
                
                }catch(e){     
                 error=e
              // throw new Error ('用户或密码错误')
              }    
              await this.ctx.render('frontpage/login.tpl',{
                error
              });
    }

    async updateuser(){
            let id=this.ctx.params.id;
            let user    = await this.ctx.service.user.read(id);
            if (this.ctx.request.method === 'POST') {
              user.username    = this.ctx.request.body.username;
              user.password    = this.ctx.request.body.password
              await this.ctx.service.user.userupdate(user); 
            console.log(user);
            // this.ctx.render('/');
            this.ctx.body={
              msg:"更新成功"
            }
            await this.ctx.render('user/edit.tpl', {user});
        }
      }

    async deleteuser(){
            let id=this.ctx.request.query.id;
            await this.ctx.service.user.userdelete(id); 
            // this.ctx.render('/')
            this.ctx.body={
              msg:"删除成功"
            }
    }

//后台分页查看用户相关
      async getu(){
            let id      = this.ctx.params.id;
            let user = await this.ctx.service.user.read(id);
            await this.ctx.render('user/getuser.tpl', {user});
      }

      async getus(){
            let users=await this.ctx.service.user.reads();
            await this.ctx.render('user/users.tpl', {users});
      } 

      async getucount(){
            let count=await this.ctx.service.user.getucount();
            let limit=6;
            let pages=Math.ceil(count/limit);//进一,总共多少页
            if(pages<1){
                pages=1;
            }
            let page=parseInt(this.ctx.request.query.page);//当前第几页
            if(isNaN(page)||page<1){
                page=1;
            }
            if(page>pages){
                page=pages;
            }
            let offset=(page-1)*limit;
            let start=1;
            let stop=pages;
            if(pages>5){
                start=page-2;
                stop=page+2;
                if(start<1){
                    stop+=1-start;
                    start=1;
                }
                if(stop>pages){
                    start-=stop-pages;
                    stop=pages;
                }
            }
            let  users=await this.ctx.service.user.reads(offset, limit);
                await this.ctx.render('user/users.tpl', {
                        page:page,
                        pages:pages,
                        limit:limit,
                        count:count,
                        offset:offset,
                        start:start,
                        stop:stop,
                        users:users,
                });
    } 

      async createu(){    
            if (this.ctx.request.method === 'POST') {
                await this.ctx.service.user.create({
                    username: this.ctx.request.body.username,
                  password: this.ctx.request.body.password,          
                  });
                  await this.ctx.redirect('/getus');
              }                             
              await this.ctx.render('user/createu.tpl');
              }
              
      async updateu(){//更新用户失败
              let id       = this.ctx.params.id;
              let user   = await this.ctx.service.user.read1(id);
                if (this.ctx.request.method === 'POST') {
                    user.username       = this.ctx.request.body.username,
                    user.password      = this.ctx.request.body.password;
                        await this.ctx.service.user.userupdate(user);
                        this.ctx.redirect('/users');
                    }
                  await this.ctx.render('user/editu.tpl', {user});
          }
          
      async deleteu(){
              let id  = this.ctx.request.query.id;
              await this.ctx.service.user.userdelete(id);
              this.ctx.redirect('/getucount');
              }
    }
    module.exports=UserController;