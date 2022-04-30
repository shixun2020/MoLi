{% extends 'houtai/sbar.tpl' %}


{% block script %}
  <link rel="stylesheet" href="/public/css/page.css">
  <!-- <link rel="stylesheet" href="/public/js/bootstrap.min.js"> -->
  <!-- <link rel="stylesheet" href="/public/css/bootstrap.min.css"> -->
	<style>
   .pagination{
    list-style: none;
    margin-top: 10%;
    margin-left: 25%;
    list-style: none; 
    }
    a{
      text-decoration: none;
      color:black
    }

    </style>
{% endblock %}
{% block h1 %}分页浏览{% endblock %}

{% block main%}
<div id="global">
  <div class="container-fluid" >  
     <div class="panel panel-default">
      <div class="panel-heading">文件内容</div>
      <div class="panel-body">
          <div style="width:100%;border-radius:8%;height:100%;background:rgb(205, 219, 219);font-size: medium;">    
              <div style="margin-left:10%">内容：</div>
              <div style="margin-left:15%">
                  <img src="/public/upload/{{filed.filename }}" style="border-radius:8%; width:100px;height:80px;">
              </div> 
              <div style="margin-left:15%">{{ filed.content}}</div>
              <div style="margin-left:80%;margin-bottom:5%;">
                <button class="btn btn-xs " > 
                    <i class="fa fa-fw  fa-pencil-square-o"></i>
                    <a href="/updateimgs/{{ filed.id }}">编辑</a>
                  </button>
                  <button class="btn btn-xs " >
                    <i class="fa fa-fw   fa-remove "></i>
                    <a href="/deletep?id={{ filed.id }}" >删除</a>
                  </button>         
          </div>
       </div>
     </div>        
    </div>
  </div>
</div>
</div>
  
{% endblock %}