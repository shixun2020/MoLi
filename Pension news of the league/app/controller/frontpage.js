 'use strict';//前台页面相关逻辑
const Controller = require('egg').Controller;

class FrontpageController extends Controller {
    async homepage(){//首页
        let id      = this.ctx.params.id;
        let article  = await this.ctx.service.article.read(id);
        let garticles=await this.ctx.service.article.reads();
        let article1  = await this.ctx.service.article.read1(id);
        let garticles1=await this.ctx.service.article.reads1();
        let id1      = this.ctx.params.id;
        let filed  = await this.ctx.service.page.read(id1);
        let files=await this.ctx.service.page.reads();
        await this.ctx.render('frontpage/homepage.tpl',{
            article:article,
            garticles:garticles,
            article1:article1,
            garticles1:garticles1,
            filed:filed,
            files:files
        });
    }
    async guide(){
        await this.ctx.render('frontpage/guide.tpl');
    }

    async feedback(){
        if (this.ctx.request.method === 'POST') {
            await this.ctx.service.frontpage.create({
                contract: this.ctx.request.body.contract,
               content   : this.ctx.request.body.content,
               create_time  : new Date()
            });
           await this.ctx.redirect('/fbsuccess');
        }
        await this.ctx.render('frontpage/feedback.tpl', {});    
    }

    async fbsuccess(){
        await this.ctx.render('frontpage/feedbacksuccess.tpl', {});  
    }
  
    async conimgdetail(){
        let id      = this.ctx.params.id;
        let filed  = await this.ctx.service.files.gimg(id);
        let files=await this.ctx.service.files.gimgs();
        await this.ctx.render('frontpage/conimgdetail.tpl', {filed,files});
    }

    async conarticledetail(){
        let id      = this.ctx.params.id;
        let article  = await this.ctx.service.article.read(id);
        let article1  = await this.ctx.service.article.read1(id);
        
        await this.ctx.render('frontpage/conarticledetail.tpl', {article,article1});
    }

    async failregister(){  
        await this.ctx.render('frontpage/failregister.tpl');
    }
}

module.exports = FrontpageController;
