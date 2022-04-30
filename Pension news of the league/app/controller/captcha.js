const Controller=require('egg').Controller;//svg-captcha验证码
const svgCaptcha = require('svg-captcha');

class CaptchaController extends Controller{
    async index(){
            const captcha = svgCaptcha.create({
                //该方法返回的是一个对象类型的数据，
                //参数（text，类型string，图形验证码字符串，主要用于对比用户输入的验证码；
                //data，string，图形验证的svg代码片段，主要用于生成图像
                  size: 4,//验证码长度
                  noise: 2,//干扰线条数量
                  fontSize: 50,
                  ignoreChars: 'Ooli',//排除0o1i字符
                  width: 120,
                  height: 38,
                  color: true,//验证码字符颜色，默认没有，若设定了背景颜色，则默认有
                  background: '#ffffff',//验证码图片背景颜色
            });
            this.ctx.session.captcha = captcha.text;
            this.ctx.response.type = 'image/svg+xml';
            this.ctx.body = captcha.data;
          

            
      
        }
}
module.exports=CaptchaController;