'use strict';

const Service = require('egg').Service;

class FilesService extends Service {

      async gimg(id){
        return await this.app.mysql.get('files', {id});
      }

      async gimgs(){
          return await this.app.mysql.select('files',  {
            orders: [['id', 'esc']]
      });
      } 
      async createf(content) {        
                  let result=await this.app.mysql.insert('files', content)
                    console.log(result);
                    return result;
          }

      async savefile(filed) {
        let result  = await this.app.mysql.insert('content', filed);
        console.log(result);
        return result.insertId;
    }
      async updatefile(filed) {
        let result =  await this.app.mysql.update('files',filed);
        console.log(result);
        return result.affectedRows === 1;      
    }

      async deletefile(id){
        let result  = await this.app.mysql.delete('files', {id});
        return result.affectedRows;
    }

}

module.exports = FilesService;
