{% extends 'houtai/sbar.tpl' %}
{% block main %}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
    <div class="panel panel-default" style="width:1050px">
      <div class="panel-heading" style="font-size: 20px;">更新栏目</div>
      <div class="panel-body">
          <form method="POST" style="margin-left: 30%;">
              <div class="lan">
                <lable>ID：</lable>
                <div><input type="text"  name="id" style="width:50%;margin-bottom: 5%;" value="{{lmed.id}}"placeholder="ID"></div>
                <lable>栏目名称：</lable>
                  <div><input type="text" style="width:50%;margin-bottom: 5%;" name="lmname" value="{{lmed.lmname}}"placeholder="栏目名称"></div>
                <lable>栏目内容：</lable>
                  <div > <textarea  style="width:50%;"  name="lmcontent"  value="{{lmed.lmcontent}}" placeholder="栏目内容">{{lmed.lmcontent}}</textarea></div>
                <div><input type="submit" value="保存"style="width:80px;height:50px;background:white;margin-top:5%;margin-left:20%;font-size:20px"></div>
        </div>
        </form>
      </div>
    </div>
  </div>
</div>
{% endblock %}