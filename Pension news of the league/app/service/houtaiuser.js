 'use strict';//后台商家用户

const Service = require('egg').Service;

class BusinessService extends Service {

        async read(username){
            let user=  await this.app.mysql.get('business', {username});
            return user;
        }
        async read1(id){
            let user=  await this.app.mysql.get('business', {id});
            return user;
        } 
    
        async create(user){    
                let result  = await this.app.mysql.insert('business', user);
                return result.insertId;
        }
    
        async userupdate(id){
            let result = await this.app.mysql.update('business',{id});
            return result.affectedRows === 1;      
        }
    
        async userdelete(id){
            let result=await this.app.mysql.delete('business',{id});
            return result.affectedRows;
        }
}

module.exports = BusinessService;
