const Controller =require('egg').Controller;//文件上传
const fs = require('fs');
class FilesController extends Controller{
        async fi(){
          await  this.ctx.render('files/fi.tpl',{});
      }
        async upload() {
              console.log(this.ctx.request);
              var file = this.ctx.request.files[0];//file包含了文件名，文件类型，大小，路径等信息
              // console.log(file);
              var filename =file.filename;
              // var filepath =file.filepath;//要复制的源文件名称
              var fpath = 'app/public/upload/' + filename;//复制操作将创建的目标文件名
                let result = await new Promise((resolve, reject) => {
                  fs.copyFile(file.filepath, fpath, (error) => {//fs.copyFile()方法用于将文件从源路径异步复制到目标路径。
                      if (error) {
                          reject(error);
                          console.log("fail");
                      } else {
                          resolve(true);
                          console.log("success");
                      }
                  });
              });
                  this.ctx.response.body = {
                    // location:"/public/upload/"+filename
                      state: result,
                      filename: filename//获得的文件名称值会传到前端页面
                  };
      }

        async sc(){//ajax上传文件至数据库内容，数据上传成功,可以预览图片
            if (this.ctx.request.method === 'POST') {
                await this.ctx.service.files.createf({
                          filename:this.ctx.request.body.cover,
                          title:this.ctx.request.body.title,
                          content:this.ctx.request.body.content
                  });
                  this.ctx.redirect('/uploadsuccess');//可以更改页面
            }          
                  await  this.ctx.render('files/fi.tpl',{});
      }
  
        async getimg(){//获得文件
            let id      = this.ctx.params.id;
            let filed  = await this.ctx.service.files.gimg(id);
            await this.ctx.render('files/imgs.tpl', {filed});
        }

        async getimgs(){//获得数据库所有文件信息
            let files=await this.ctx.service.files.gimgs();
            await this.ctx.render('files/imgs.tpl', {files});
        }

        async delete() {
            let id  = this.ctx.request.query.id;
            await this.ctx.service.files.deletefile(id);
            this.ctx.redirect('/getimgs');
        }

        async updateimg(){
            let id       = this.ctx.params.id;
            let filed   = await this.ctx.service.files.gimg(id);
                if (this.ctx.request.method === 'POST') {
                    filed.content        = this.ctx.request.body.content,
                        await this.ctx.service.files.updatefile(filed);
                        this.ctx.redirect('/getimgs');
                    }
                await this.ctx.render('files/editfile.tpl', {filed});
        }
      
}
module.exports=FilesController