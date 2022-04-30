{% extends 'houtai/sbar.tpl' %}

{% block main %}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
    <div class="panel panel-default" style="width:1050px">
      <div class="panel-heading" style="font-size: 20px;">栏目内容</div>
      <div class="panel-body">
          <form method="POST" action="/createlm" style="margin-left: 8%;">
              <div class="lan" style="margin-left:25%">
                <lable>栏目名称：</lable>
                  <div>
                    <input type="text" style="width:50%;margin-bottom: 5%;" name="lmname" value="{{lmed.lmname}}"placeholder="栏目名称">
                  </div>
                <lable>栏目内容：</lable>
                  <div> 
                    <textarea  style="width:50%;"  name="lmcontent"  value="{{lmed.lmcontent}}" placeholder="栏目内容">
                    </textarea>
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