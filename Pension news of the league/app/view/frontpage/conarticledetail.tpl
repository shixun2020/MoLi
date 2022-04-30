{% extends 'base.tpl' %}

{% block head %}
<link rel="stylesheet" type="text/css" href="/public/css/cont.css">
{% endblock %}

{% block main%}
<div class="Content-Main">
    <h1>百科</h1>
    <div class="Content-Mains"style="border-radius:8%;">  
        <div style="width:100%;border-radius:8%;height:100%;background:rgb(205, 219, 219);font-size: medium;">
            <div style="margin-left:3%"><h1>内容：</h1></div>
            <div style="margin-left:10%"><h3>{{article.contents}}</h3></div>
            <div style="margin-left:10%"><h3>{{article1.content}}</h3></div>
            
     </div>

{% endblock %}