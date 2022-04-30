const Service=require('egg').Service;

class LanmuService extends Service{
        async read(id){
            return await this.app.mysql.get('lm', {id});
        }
        
        async lmreads( offset,limit){
            return await this.app.mysql.select('lm',  {
            orders: [['id', 'esc']],
            offset,
            limit
        });
        }
    
        async getlmcount(){
            return await this.app.mysql.count('lm', {});
        }
        
        async create(lmed){    
            let result  = await this.app.mysql.insert('lm',lmed);
            console.log(result);
            return result.insertId;
        
        }

        async updatelmed(lmed){
            let result = await this.app.mysql.update('lm',lmed);
            console.log(result);
            return result.affectedRows === 1;      
        }

        async deletelmed(id){
            let result=await this.app.mysql.delete('lm',{id});
            return result.affectedRows;
        }
}
module.exports=LanmuService;