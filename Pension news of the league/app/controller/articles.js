 'use strict';
const Controller = require('egg').Controller;//文章内容页面逻辑

class ArticlesController extends Controller {
    async tiny(){
        await this.ctx.render('lanmu/ti.tpl')
    }

    async getarticle(){
          let id      = this.ctx.params.id;
          let article  = await this.ctx.service.article.read(id);
          await this.ctx.render('lanmu/getarticle.tpl', {article});
    }

    async getarticles(){
          let garticles=await this.ctx.service.article.reads();
          await this.ctx.render('lanmu/getarticles.tpl', {garticles});
    } 

    async getacount(){  
            let count=await this.ctx.service.article.getacount();
            console.log(count) ;
            let limit=3;
            let pages=Math.ceil(count/limit);//进一,总共多少页
            //   console.log(pages);
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
            let  garticles=await this.ctx.service.article.reads(offset, limit);
            console.log( garticles) ;
                await this.ctx.render('lanmu/getarticles.tpl', {
                        page:page,
                        pages:pages,
                        limit:limit,
                        count:count,
                        offset:offset,
                        start:start,
                        stop:stop,
                        garticles:garticles,
                });
} 

    async getcreate(){    
            if (this.ctx.request.method === 'POST') {
                await this.ctx.service.article.create({
                    titles: this.ctx.request.body.titles,
                    contents: this.ctx.request.body.contents,
                    lmcontent_ip: this.ctx.request.body.lmcontent_ip,
                            
                    });
                    await this.ctx.redirect('/getacount');
                }                             
                await this.ctx.render('lanmu/ti.tpl');
                }
                
    async getupdate(){
                let id       = this.ctx.params.id;
                let article   = await this.ctx.service.article.read(id);
                if (this.ctx.request.method === 'POST') {
                    article.titles        = this.ctx.request.body.titles,
                    article.lmcontent_ip        = this.ctx.request.body.lmcontent_ip,
                    article.contents      = this.ctx.request.body.contents;
                        await this.ctx.service.article.update_a(article);
                        this.ctx.redirect('/getacount');
                    }
                    await this.ctx.render('lanmu/editarticle.tpl', {article});
            }
            
    async getdelete(){
                let id  = this.ctx.request.query.id;
                await this.ctx.service.article.delete_a(id);
                this.ctx.redirect('/getacount');
                }
}

module.exports = ArticlesController;
