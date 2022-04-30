const Controller = require('egg').Controller;//文章内容

class TestController extends Controller {
    async column(){
        await this.ctx.render('content/column.tpl');
    }

    async lanmu(){
        await this.ctx.render('content/lanmu.tpl');
    }

    async getcontent(){//获得编号内容
        let id      = this.ctx.params.id;
        let contented  = await this.ctx.service.content.read(id);
        await this.ctx.render('content/index.tpl', {contented});
    }

    async getcontents(){//获得数据库所有信息
        let contents=await this.ctx.service.content.gcontents();
        // console.log(contents);
        await this.ctx.render('content/column.tpl', {contents});
    }

    async add() {//增加信息
        if (this.ctx.request.method === 'POST') {
            await this.ctx.service.content.savecontent({
                    plate: this.ctx.request.body.plate,
               content   : this.ctx.request.body.content,
               create_time  : new Date()
            });

           await this.ctx.redirect('/getcontents');
        }

        await this.ctx.render('content/add.tpl', {});
    }

    async edit() {//编辑信息
        let id        = this.ctx.params.id;
        let contented    = await this.ctx.service.content.read(id);

        if (this.ctx.request.method === 'POST') {
            contented.plate         = this.ctx.request.body.plate,
            contented.content       = this.ctx.request.body.content;
            await this.ctx.service.content.updatecontent(contented);
            this.ctx.redirect('/getcontents');
        }
        await this.ctx.render('content/edit.tpl', {contented});
    }
    
    async delete() {
        let id  = this.ctx.request.query.id;
        await this.ctx.service.content.deletecontent(id);
        this.ctx.redirect('/getcontents');
    }

}

module.exports = TestController;
