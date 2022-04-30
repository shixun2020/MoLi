{% extends 'houtai/sbar.tpl' %}

{% block script %}
  <script src="/public/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
  <script type="text/javascript">
    tinymce.init({
      selector: 'textarea',
      skin: 'oxide-dark',
      forced_root_block:'null',
      height:300,
      width:500
    });
  </script>
{% endblock %}
      
{% block main%}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
    <div class="panel panel-default" style="width:1050px">
      <div class="panel-heading" style="font-size: 20px;">添加文章</div>
      <div class="panel-body">
          <form method="post" action="/getcreate"  style="margin-left: 30%;">
          <div class="editform" style="display:inline;
                                        float:left;
                                        margin:30px 0px 0px 0px;
                                        width:100%">
              <lable style="font-size:20px">* 标题</lable>
              <div class="edit1" style="width:100%;margin:0px 0px 30px 0px";>
                    <input type="text" name="titles" value="{{article.titles}}" style="width:500px;height:40px;">
              </div>
              <lable style="font-size:20px">* 所属栏目</lable>
              <div class="edit2" style="width:100%;margin:0px 0px 30px 0px";>
                    <input type="text" name="lmcontent_ip" value="{{article.lmcontent_ip}}" style="width:500px;height:40px;">
              </div>
              <lable style="font-size:20px">* 内容详情</lable>
              <div class="edit3">
                        <textarea  name="contents" value="{{article.contents}}">{{article.contents}}</textarea>
              </div>
              <div class="btn" style="margin:30px 0px 0px 0px">
                <input type="submit" value="保存" style="width:80px;height:50px;background:white;margin-left:200px;font-size:20px">
              </div>
            </form>
          </div>
      </div>
    </div>
  </div>
</div>
 {% endblock %}