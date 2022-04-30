const Controller =require('egg').Controller;
 
class PageController extends Controller{
        async page(){
            await this.ctx.render('files/page.tpl');
        }

        async getpage(){
            let id      = this.ctx.params.id;
            let filed  = await this.ctx.service.page.read(id);
        console.log(filed)
            await this.ctx.render('files/page.tpl', {filed});
        }
        
        async gpage(){
            let id      = this.ctx.params.id;
            let filed  = await this.ctx.service.page.read(id);
            console.log(filed)
            await this.ctx.render('files/pagedetail.tpl', {filed});
        }

        async getpages(){
            let files=await this.ctx.service.page.reads();
            await this.ctx.render('files/page.tpl', {files});//获取页面所有数据
        }
        async getcount(){//后台文件页面分页
                let count=await this.ctx.service.page.getcount();
                let limit=1;
                let pages=Math.ceil(count/limit);//进一,总共多少页
                if(pages<1){
                    pages=1;
                }
                // let pager= files.slice((pagenum-1)*limit,(pagenum-1)*limit+limit);//数据截取
                // console.log(pager);
                // var pagelist = JSON.stringify(pager);
                // console.log(pagelist);
                let page=parseInt(this.ctx.request.query.page);//当前第几页,解析一个字符串并返回十进制整数      
                if(isNaN(page)||page<1){//检测是否为非字符
                    page=1;
                }
                if(page>pages){
                    page=pages;
                }
                let offset=(page-1)*limit;//offset开端索引，跳过多少数据
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
                let files=await this.ctx.service.page.reads(offset, limit);
                console.log(files) ;
                //   let files=await this.ctx.service.page.reads();
                    await this.ctx.render('files/page.tpl', {
                            page:page,
                            pages:pages,
                            limit:limit,
                            count:count,
                            offset:offset,
                            start:start,
                            stop:stop,
                            files:files,
                    });
            } 
    
        async updateimgs(){
            let id       = this.ctx.params.id;
            let filed   = await this.ctx.service.files.gimg(id);
            if (this.ctx.request.method === 'POST') {
                filed.content        = this.ctx.request.body.content,
                    await this.ctx.service.page.update(filed);
                    this.ctx.redirect('/getcount');
                }
                await this.ctx.render('files/editfile.tpl', {filed});
        }
        
        async deletep() {
            let id  = this.ctx.request.query.id;
            await this.ctx.service.page.delete(id);
            this.ctx.redirect('/getcount');
        }
}
module.exports=PageController;