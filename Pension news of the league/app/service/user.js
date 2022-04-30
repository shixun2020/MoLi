const Service=require('egg').Service;

class UserService extends Service{
        async read(username){
            let user=  await this.app.mysql.get('users3', {username});
            return user;
        }
        async read1(id){
            let user=  await this.app.mysql.get('users3', {id});
            return user;
        }
    
        async gusers(){
            return await this.app.mysql.select('users3',  {
                orders: [['id', 'esc']]
            });
        }

        async reads( offset,limit){//分页相关
            return await this.app.mysql.select('users3',  {
            orders: [['id', 'esc']],
            offset,
            limit
        });
        }
    
        async getucount(){//分页相关
            return await this.app.mysql.count('users3', {});
        }

        async create(user){    
            let result  = await this.app.mysql.insert('users3', user);
            return result.insertId;
        }

        async userupdate(user1){
            let result =  await this.app.mysql.update('users3',user1);
            return result.affectedRows === 1;   
        }

        async userdelete(id){
            let result=await this.app.mysql.delete('users3',{id});
            return result.affectedRows;
        }
}
module.exports=UserService;