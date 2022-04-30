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
      
{% block main %}
<div id="global">
    <div class="container-fluid" style="width:1000px">  
        <div class="panel panel-default" style="width:1050px">
                <div class="panel-heading" style="font-size: 20px;">文章</div>
                <div class="panel-body">
        <table border="1" cellpadding="30" width="100%">
            <tr>
                <th>ID</th>
                <td>{{article.id }}</td>
            </tr>
            <tr>
                <th>文章标题</th>
                <td>{{ article.titles }}</td>
            </tr>
            <tr>
                <th>文章内容</th>
                <td>{{article.contents}}</td>
            </tr>
        </table>
    </div>
   </div>
   </div>
   </div>
</div>
 {% endblock %}