{% extends 'houtai/sbar.tpl' %}

{% block main %}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
    <div class="panel panel-default" style="width:1050px">
          <!-- <div class="panel-heading" style="font-size: 20px;">分页浏览</div> -->
          <div class="panel-body">
                <table border="1" cellpadding="30" width="100%" style="color:black;border-collapse: collapse;margin-top: 6%;">
                <caption style="font-size: 20px;">所有文件</caption>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>图片</th>
                            <th>创建时间</th>
                            <th>操作</th>          
                        </tr>
                    </thead>
                    <tbody>
                        {% for filed in files %}
                        <tr>
                            <td>{{ filed.id }}</td>
                            <td><img src="/public/upload/{{filed.filename }}" style="border-radius:8%; width:100px;height:80px"></td>
                
                            <td>{{filed.create_time.toLocaleString('UTC',  { year: 'numeric', month: 'numeric', day: 'numeric',
                                                                            hour: 'numeric', minute: 'numeric', second: 'numeric',
                                                                            hour12: false}) }}
                            </td>
                            <td>
                                <button style="width:50px;
                                            height:30px;
                                        background:white;
                                        font-size:15px">
                                    <a href="/updatef/{{filed.id }}" style="text-decoration: none;color:black">编辑</a>
                                </button>
                                <button style="width:50px;
                                            height:30px;
                                        background:white;
                                        font-size:15px;
                                        margin-left: 5%;">
                                    <a href="/deletef?id={{filed.id }}" style="text-decoration: none;color:black">删除</a>
                                </button>
                            </td>
                        </tr>
                        {% endfor %}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
{% endblock %}