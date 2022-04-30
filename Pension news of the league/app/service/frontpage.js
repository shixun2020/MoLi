'use strict';//前台系统
const Service = require('egg').Service;

class FrontpageService extends Service {

      async create(fc) {
            let result  = await this.app.mysql.insert('feedback',fc);
            console.log(result);
            return result.insertId;
      }
      
      async read(id){
        return await this.app.mysql.get('feedback', {id});
      }
      
      async reads( offset,limit){
          return await this.app.mysql.select('feedback',  {
            orders: [['id', 'esc']],
            offset,
            limit
        });
      }
      
      async getcount(){
        return await this.app.mysql.count('feedback', {});
    }
}

module.exports = FrontpageService;
