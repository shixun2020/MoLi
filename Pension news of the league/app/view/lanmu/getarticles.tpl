{% extends 'houtai/sbar.tpl' %}

{% block h1 %}分页浏览{% endblock %}

{% block main%}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
     <div class="panel panel-default" style="width:1050px">
      <div class="panel-heading" style="font-size: 20px;">浏览文章</div>
      <div class="panel-body">
  <table  cellspacing="0" class="table table-hover">
    <thead>
            <tr style="color:#434343;"> 
                <th>ID</th>
                <th>栏目名称</th>
                <!-- <th>内容</th> -->
                <th>操作</th>  
            </tr>
        </thead>
        <tbody>
             {% for article in garticles  %}
             <tr style="color:#434343;">
                <td class="btbg font-center titfont" rowspan="1">{{ article.id }}</td>
                <td class="btbg font-center titfont" rowspan="1">{{  article.titles }}</td>             
                <!-- <td>{{ article.contents }}</td> -->
                <td class="btbg font-center titfont" rowspan="1">
                <div style="display:flex">
                    <div>
                        <button class="btn btn-xs " style="margin-left:50%">
                            <i class="fa fa-fw  fa-pencil-square-o"></i>
                            <a href="/getupdate/{{ article.id }}" style="text-decoration: none;">编辑</a>
                        </button>
                    </div>
                    <div>
                        <button class="btn btn-xs " style="margin-left:80%">
                            <i class="fa fa-fw   fa-remove "></i>
                            <a href="/getdelete?id={{article.id }}" style="text-decoration: none;">删除</a>
                        </button>
                    </div>
                </div>
                </td>
            </tr>
            {% endfor %}
        </tbody>
    </table>
  </div>
  <div class="kuai"style="width:100%;margin-right:70%">
      <nav aria-label="Page navigation">
            <ul class="pagination"style="margin-left:20%;margin-top:10%;">    
              {% if page=== 1 %}       
                  <li>
                    <a href="/getacount?page=1" aria-label="Previous">首页</a>
                  </li>            
                  <li>
                      <a aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>上一页
                      </a>
                  </li> 
              {% else %}
                  <li>
                    <a href="/getacount?page=1" aria-label="Previous">首页</a>
                  </li>            
                  <li>
                      <a href="/getacount?page={{page - 1}}" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>上一页
                      </a>
                  </li> 
              {% endif %}
              {% for i in range(start,stop+1) %}
                    {% if page===i %}
                        <li><a >{{i}}</a></li>
                    {% else %}
                        <li><a href="/getacount?page={{i}}">{{i}}</a></li>
                    {% endif %}                 
              {% endfor %}
              {% if page=== pages %}
                  <li>
                    <a aria-label="Next">下一页
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                    <li><a href="/getacount?page={{pages}}">尾页</a></li> 
                    {% else %}   
                    <li>
                      <a href="/getacount?page={{page + 1}}" aria-label="Next">下一页
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                      <li><a href="/getacount?page={{pages}}">尾页</a></li>   
              {% endif %}  
                    <li>
                      <a >共 {{ count }} 条</a>
                    </li>
                    <li>
                      <a >{{limit}} 条/页</a>
                    </li>
                    <li>
                      <a >总 {{pages}} 页</a>
                    </li>
                    <li>
                      <a>当前第 {{page}} 页</a>
                    </li>          
            </ul>
      </nav>
     </div>
    </div>
  </div>
{% endblock %}
