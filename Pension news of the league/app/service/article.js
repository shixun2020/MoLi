'use strict';

const Service = require('egg').Service;

class ArticlesService extends Service {
    async read(id){
        return await this.app.mysql.get('articles', {id});
    }

    async reads( offset,limit){//分页相关
        return await this.app.mysql.select('articles',  {
           orders: [['id', 'esc']],
           offset,
           limit
       });
      }
 
    async getacount(){//查询数据库记录数
        return await this.app.mysql.count('articles', {});
    }

    async create(article){    
        let result  = await this.app.mysql.insert('articles',article);
        console.log(result);
        return result.insertId;
    }

    async update_a(article){
        let result = await this.app.mysql.update('articles',article);
        console.log(result);
        return result.affectedRows === 1;      
    }
    
    async delete_a(id){
         let result=await this.app.mysql.delete('articles',{id});
         return result.affectedRows;
    }

    async read1(id){
        return await this.app.mysql.get('article', {id});
    }

    async reads1( ){
        return await this.app.mysql.select('article',  {});
      }

}

module.exports = ArticlesService;
