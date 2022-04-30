{% extends 'base.tpl' %}


{% block head %}
<link rel="stylesheet" type="text/css" href="/public/css/cont.css">
{% endblock %}

{% block main%}
<div class="Content-Main">
    <h1>文章内容</h1>
    <div class="Content-Mains">  
        <div style="width:100%;height:100%;border-radius:8%;background:rgb(205, 219, 219);font-size: medium;">
            <div style="margin-left:3%"><h1>内容：</h1></div>
            <div style="margin-left:15%">
                <img src="/public/upload/{{filed.filename }}" style="border-radius:8%; width:200px;height:150px">
            </div> 
            <div style="margin-left:15%"><h3>{{ filed.content}}</h3></div>
     </div>

{% endblock %}