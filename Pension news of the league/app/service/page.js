'use strict';

const Service = require('egg').Service;

class PageService extends Service {
    async read(id){
        return await this.app.mysql.get('files', {id});
    }

    async reads( offset,limit){//分页相关
       return await this.app.mysql.select('files',  {
          orders: [['id', 'esc']],
          offset,
          limit
      });
     }

    async delete(id)
     {
         let result  = await this.app.mysql.delete('files', {id});
         return result.affectedRows;
     }

    async update(filed) {
        let result =  await this.app.mysql.update('files',filed);
        console.log(result);
        return result.affectedRows === 1;      
    }

     async getcount(){//分页相关
        return await this.app.mysql.count('files', {});
    }

}

module.exports = PageService;
