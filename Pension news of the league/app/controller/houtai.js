const Controller =require('egg').Controller;//后台管理系统相关逻辑
const Crypto=require('crypto');
class HoutaiController extends Controller{
   
    async houtai(){
        if(this.ctx.session.user===null){//清空用户登录信息session值
            this.ctx.redirect('/login')
        }
        await this.ctx.render('houtai/home.tpl');
    }
    async hlogin(){
        if(this.ctx.session.user===null){
            this.ctx.redirect('/hlogin')
        }
        await this.ctx.render('houtai/hlogin.tpl');
    }

    async dologin() {
        let error={};
        try  {  //进行输入参数校验,能够通过catch检测到数据不符合格式
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

        let user= await this.ctx.service.houtaiuser.read(username);
        this.ctx.session.user=user;
          console.log(this.ctx.session.user);
          if(!user){
            throw new Error('找不到用户');
          }
          let password = Crypto.pbkdf2Sync(this.ctx.request.body.password,user.salt,10000,64,'sha512').toString('hex');
          if(user.password!==password){
            throw  new Error('密码错误');
          } 
          let session_captcha=this.ctx.session.captcha
            console.log(this.ctx.session.captcha);
            let code=this.ctx.request.body.code;
            // console.log(code);
                if (code.toUpperCase() !==session_captcha.toUpperCase()) {
                  // ctx.body = await ctx.service.user.read(username, password)
                  this.ctx.redirect('/hfaillogin');
                }
                  else{
                       this.ctx.redirect('/home');
                  }             
              }catch(e){     
                error=e;
            }    
            await this.ctx.render('houtai/hlogin.tpl',{
                error
              });
  }
    async hregister(){
        await this.ctx.render('houtai/hregister.tpl');
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
          let salt=Crypto.randomBytes(6).toString('hex');//使盐值生成强伪随机数据，字节数为6，转换成字符串
          let password = Crypto.pbkdf2Sync(this.ctx.request.body.password,salt,10000,64,'sha512' ).toString('hex');
            // console.log(password);
          let password1=this.ctx.request.body.password1;
          let user=await this.ctx.service.houtaiuser.create({
                'username':username,
                'password':password,
                'salt':salt
          }); 
          let session_captcha=this.ctx.session.captcha
          console.log(this.ctx.session.captcha);
          let code=this.ctx.request.body.code;
          // console.log(code);
              if (code.toUpperCase() !==session_captcha.toUpperCase()) {
                // ctx.body = await ctx.service.user.read(username, password)
                this.ctx.redirect('/hfailregister');
              }
                else{
                     this.ctx.redirect('/hlogin');
                }
            }catch(e){
               error=e;
            }
            await this.ctx.render('houtai/hregister.tpl',{
                error
              });
}
    async faillogin(){  
        await this.ctx.render('houtai/fail.tpl');
    }

    async failregister(){     
        await this.ctx.render('houtai/failregister.tpl');
    }

    async resetpw1(){
        let id=this.ctx.params.id;
        let user= await this.ctx.service.user.read1(id);
        await this.ctx.render('houtai/resetpw.tpl',{user});
    }
    async resetpw(){//后台修改用户密码有点问题
        let error={};
        try  {  
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
        let username       = this.ctx.request.body.username;
        let salt=Crypto.randomBytes(6).toString('hex');
        let password = Crypto.pbkdf2Sync(this.ctx.request.body.password,salt,10000,64,'sha512').toString('hex');
                let user=await this.ctx.service.user.userupdate({
                    'password':password,
                    'username':username,
                    'salt':salt
                }); 
                console.log(user)
                if(user){
                   this.ctx.redirect('/getucount')
                }
              }catch(e){     
               error=e
            }    
            await this.ctx.render('houtai/resetpw.tpl');
    }

    async deleteSession(){
        this.ctx.session.user=null;
        await this.ctx.render('houtai/hlogin.tpl');
    }

    async sbar(){
        if(this.ctx.session.user===null){
            this.ctx.redirect('/login')
        }
        await this.ctx.render('houtai/sbar.tpl');
    }

    async icom(){
        if(this.ctx.session.user===null){
            this.ctx.redirect('/login')
        }
        await this.ctx.render('houtai/ico-md.tpl');
    }
    
    async icos(){
        if(this.ctx.session.user===null){
            this.ctx.redirect('/login')
        }
        await this.ctx.render('houtai/ico-sf.tpl');
    }

    async uploadsuccess(){
        await this.ctx.render('files/uploadsuccess.tpl');
    }

    async feedbackcount(){  //用户反馈分页
        let count=await this.ctx.service.frontpage.getcount();
        let limit=3;
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
        let user_back=await this.ctx.service.frontpage.reads(offset, limit);
            await this.ctx.render('houtai/userfeedback.tpl', {
                    page:page,
                    pages:pages,
                    limit:limit,
                    count:count,
                    offset:offset,
                    start:start,
                    stop:stop,
                    user_back,user_back
            });
        }

        async seefrontfile(){//后台浏览前台上传的文件
            let id       = this.ctx.params.id;
            let filed   = await this.ctx.service.files.gimg(id);
            let files=await this.ctx.service.page.reads();
            console.log(filed)
            await this.ctx.render('houtai/seefrontfile.tpl',{filed,files});
        }
}
module.exports=HoutaiController;