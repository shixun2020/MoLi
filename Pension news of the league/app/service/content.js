const Service=require('egg').Service;

class ContentService extends Service {

      async read(id){
          return await this.app.mysql.get('content', {id});
      }
     
      async gcontents(){
          return await this.app.mysql.select('content',  {
            orders: [['id', 'esc']]
          });
      } 
  
      async savecontent(contented) {
        let result  = await this.app.mysql.insert('content', contented);
        console.log(result);
        return result.insertId;
      }

      async updatecontent(contented) {
        await this.app.mysql.update('content',contented);
      }

      async deletecontent(id){
          let result  = await this.app.mysql.delete('content', {id});
          return result.affectedRows;
      }
  }
  module.exports=ContentService;