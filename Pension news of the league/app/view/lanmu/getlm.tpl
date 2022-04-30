{% extends 'houtai/sbar.tpl' %}

{% block main %}
<div id="global">
    <div class="container-fluid" style="width:1000px">  
        <div class="panel panel-default" style="width:1050px">
                <div class="panel-heading" style="font-size: 20px;">栏目内容</div>
                <div class="panel-body">
    <table border="1" cellpadding="30" width="100%" style="color:black">
        <tr>
            <th>ID</th>
            <td>{{lmed.id }}</td>
        </tr>
        <tr>
            <th>栏目内容</th>
            <td>{{ lmed.lmname }}</td>
        </tr>
        <tr>
            <th>栏目名称</th>
            <td>{{lmed.lmcontent }}</td>
        </tr>
    </table>
    </div>
    </div>
    </div>
    </div>
{% endblock %}