{% extends 'houtai/sbar.tpl' %}

{% block main %}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
    <div class="panel panel-default" style="width:1050px">
      <div class="panel-heading" style="font-size: 20px;">修改密码</div>
      <div class="panel-body">       
          <form method="POST"  style="margin-left: 30%;">
              <div class="lan">
                <lable>*ID：</lable>
                  <div>
                    <input type="text" style="width:50%;margin-bottom: 5%;" name="id" value="{{user.id}}">
                  </div>
                <lable>*用户名：</lable>
                  <div> 
                    <input style="width:50%;"  name="username"  value="{{user.username}}">
                  </div>
                  <lable style="font-size:20px">* 修改密码</lable>
                  <div class="edit2" style="width:100%;margin:0px 0px 30px 0px";>
                        <input type="password" name="password"  style="width:500px;height:40px;">
                  </div>
                <div>
                  <input type="submit" value="保存"style="width:80px;height:50px;background:white;margin-top:5%;margin-left:20%;font-size:20px">
                </div>
            </div>
          </form>
        </div>
    </div>
  </div>
</div>
{% endblock %}