'use strict'//前台栏目表
const Controller = require('egg').Controller;
class LanmuController extends Controller {
      async lm() {
            await this.ctx.render('lanmu/lm.tpl');
      }

      async success() {
            await this.ctx.render('lanmu/success.tpl');
      }

      async firstpage() {
        await this.ctx.render('lanmu/firstpage.tpl');
      }

      async getlm(){
            let id      = this.ctx.params.id;
            let lmed  = await this.ctx.service.lanmu.read(id);
            await this.ctx.render('lanmu/lmpage.tpl', {lmed});
      }

      async getlms(){
          let lms=await this.ctx.service.lanmu.lmreads();
              await this.ctx.render('lanmu/lmpage.tpl', {lms});
      }

      async getlmcount(){//后台栏目分页
          
          let count=await this.ctx.service.lanmu.getlmcount();
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
          let lms=await this.ctx.service.lanmu.lmreads(offset, limit);
          console.log(lms) ;
              await this.ctx.render('lanmu/lmpage.tpl', {  //往页面传输数据
                      page:page,
                      pages:pages,
                      limit:limit,
                      count:count,
                      offset:offset,
                      start:start,
                      stop:stop,
                      lms:lms,
              });
      } 
    async createlm(){    
            if (this.ctx.request.method === 'POST') {
              await this.ctx.service.lanmu.create({
                      lmcontent: this.ctx.request.body.lmcontent,
                        lmname : this.ctx.request.body.lmname,                
                        create_time  : new Date()
              });
            await this.ctx.redirect('/getlms');
          }
          await this.ctx.render('lanmu/lm.tpl', {});
          }
          
    async updatelm(){
            let id       = this.ctx.params.id;
            let lmed   = await this.ctx.service.lanmu.read(id);
            if (this.ctx.request.method === 'POST') {
                  lmed.lmname     = this.ctx.request.body.lmname,
                  lmed.lmcontent  = this.ctx.request.body.lmcontent;
                  // lmed.lmcontent_con       = this.ctx.request.body.lmcontent_con;
                  await this.ctx.service.lanmu.updatelmed(lmed);
                  this.ctx.redirect('/getlms');
            }
            await this.ctx.render('lanmu/updatelm.tpl', {lmed});
    }

    async deletelm(){
          let id  = this.ctx.request.query.id;
          await this.ctx.service.lanmu.deletelmed(id);
          this.ctx.redirect('/getlmcount');
        }
  }

module.exports = LanmuController;
