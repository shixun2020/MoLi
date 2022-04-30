{% extends 'houtai/sbar.tpl' %}


{% block script %}
  <script src="/public/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
  <script type="text/javascript">
      tinymce.init({
        selector: 'textarea',
        skin: 'oxide-dark',
        height:300,
        width:500,
        forced_root_block:"",         
            plugins: 'paste',
            height:400,
            paste_auto_cleanup_on_paste : true,
            paste_remove_styles: true,
            paste_remove_styles_if_webkit: true, 
            paste_strip_class_attributes:true
      });
  </script>
{% endblock %}

{% block h1 %}编辑页面{% endblock %}

{% block main%}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
    <div class="panel panel-default" style="width:1050px">
          <div class="panel-heading" style="font-size: 20px;">分页浏览栏目</div>
          <div class="panel-body">
  <form method="post" action="/up"  enctype="multipart/form-data">
  <div class="editform" style="display:inline;
                                float:left;
                                margin:30px 0px 0px 0px;
                                width:100%">
      <lable style="font-size:20px">* 上传图片</lable>
      <div class="edit1" style="width:100%;
                               margin:0px 0px 30px 0px";>
            <input type="file" name="file" value="{{filed.filename}}" style="width:500px;height:40px;">
      </div>
      <lable style="font-size:20px">* 文章标题</lable>
      <div class="edit2" style="width:100%;margin:0px 0px 30px 0px";>
            <input type="text" name="title" value="{{filed.title}}" style="width:500px;height:40px;">
      </div>
      <lable style="font-size:20px">* 文章内容详情</lable>
      <div class="edit3">
                <textarea  name="content" value="{{filed.content}}">{{filed.content}}</textarea>
      </div>
      <div class="btn" style="margin:30px 0px 0px 0px">
        <input type="submit" value="保存" style="width:80px;
                                                height:50px;
                                                background:white;
                                                margin-left:200px;
                                                font-size:20px">
        <!-- <button>保存</button> -->
      </div>
    </form>
  </div>
</div>
</div>
</div>

{% endblock %}
