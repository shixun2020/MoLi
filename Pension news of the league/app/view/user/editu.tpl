{% extends 'houtai/sbar.tpl' %}
      
{% block main%}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
    <div class="panel panel-default" style="width:1050px">
      <div class="panel-heading" style="font-size: 20px;">编辑用户</div>
      <div class="panel-body"> 
            <form method="post"  style="margin-left: 30%;">
            <div class="editform" style="display:inline;
                                          float:left;
                                          margin:30px 0px 0px 0px;
                                          width:100%">
                <lable style="font-size:20px">*ID </lable>
                <div class="edit1" style="width:100%;
                                        margin:0px 0px 30px 0px";>
                      <input type="text" name="id" value="{{user.id}}" style="width:500px;height:40px;">
                </div>
                <lable style="font-size:20px">*用户名 </lable>
                <div class="edit1" style="width:100%;
                                        margin:0px 0px 30px 0px";>
                      <input type="text" name="username" value="{{user.username}}" style="width:500px;height:40px;">
                </div>
                <lable style="font-size:20px">* 密码</lable>
                <div class="edit2" style="width:100%;margin:0px 0px 30px 0px";>
                      <input type="password" name="password" value="{{user.password}}" style="width:500px;height:40px;">
                </div>

                <div class="btn" style="margin:30px 0px 0px 0px">
                  <input type="submit" value="保存" style="width:80px;
                                                          height:50px;
                                                          background:white;
                                                          margin-left:200px;
                                                          font-size:20px">
                </div>
              </form>
          </div>
      </div>
  </div>
</div>
 {% endblock %}