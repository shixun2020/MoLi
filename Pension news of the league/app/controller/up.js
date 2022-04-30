const Controller =require('egg').Controller;//测试Ajax上传文件
const error = require('egg').error;
const fs = require('mz/fs');
class UpController extends Controller{//
      async gfile(){
          await  this.ctx.render('files/upload.tpl',{});
      }
      async uploadfile(){
              console.log(this.ctx.request);
                var file = this.ctx.request.files[0];//file包含了文件名，文件类型，大小，路径等信息
                console.log(file);
                var filename =file.filename;
                var content=this.ctx.request.body.content;
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
            // this.ctx.redirect('/upsuccess');  
                    this.ctx.response.body = {
                      location:"/public/upload/"+filename
                        // state: result,
                        
                    };
      }
        async testform(){//上传成功，数据库正常，为mulipart/form-data,file模式，无法预览图片
          await  this.ctx.render('files/testform.tpl',{});
        }
        async testup() {
             var file = this.ctx.request.files[0];
             var filename =file.filename;
             var title=this.ctx.request.body.title;
             var content=this.ctx.request.body.content;
             let result=await new Promise((resolve,reject)=>{
                 fs.copyFile(file.filepath,'app/public/'+file.filename,error=>{
                     if(error){
                         reject(error);
                     }else{
                         resolve(true);
                     }
                 });          
             });
             const res = await this.ctx.service.files.createf({
                'filename':filename,
                'content':content,
                'title':title
              });
              console.log(res);
            //  console.log(result);
             if(result===true){
             this.ctx.redirect('/uploadsuccess')
           }
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
                    this.ctx.redirect('/getpages');
                }
              await this.ctx.render('files/editfile.tpl', {filed});
      }
  
}
module.exports=UpController