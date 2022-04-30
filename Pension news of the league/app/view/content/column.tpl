{% extends 'houtai/sbar.tpl' %}
<!-- nunjucks模板语法继承 -->

{% block main %}
<div id="global">
    <div class="container-fluid" style="width:1000px">  
        <div class="panel panel-default" style="width:1050px">
                <div class="panel-heading" style="font-size: 20px;">栏目</div>
                <div class="panel-body">
<div class="topnav">
  <a href="/login" style="float:right">#</a>
  <a href="/register" style="float:right">#</a>
</div>
 <table border="1" cellpadding="30" width="100%">
    <caption  style="font-size:30px;">栏目</caption>
        <thead>
            <tr>
                <th>ID</th>
                <th>内容</th>
                <th>板块</th>
                <th>创建时间</th>
                <th>设置</th>
              
            </tr>
        </thead>
        <tbody>
            {% for contented in contents %}
            <tr>
                <td>{{ contented.id }}</td>
                <td><a href="/content/{{ contented.id }}">{{ contented.content }}</a></td>
                <td>{{ contented.plate }}</td>
                <td>{{ contented.create_time.toLocaleString('UTC',  {year: 'numeric', month: 'numeric', day: 'numeric',
                                                                     hour: 'numeric', minute: 'numeric', second: 'numeric',
                                                                   hour12: false}) }}</td>
                <td>
                    <a href="/edit/{{ contented.id }}">编辑</a>
                    <a href="/delete?id={{contented.id }}">删除</a>
                </td>
            </tr>
            {% endfor %}
        </tbody>
    </table>
<div class="a" style="margin:0 auto"> <a href="/add">增加栏目</a></div>
</div>
</div>
</div>
</div>
{% endblock %}