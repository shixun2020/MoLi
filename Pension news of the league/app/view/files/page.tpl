{% extends 'houtai/sbar.tpl' %}

{% block h1 %}分页浏览{% endblock %}

{% block main%}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
     <div class="panel panel-default" style="width:1050px">
      <div class="panel-heading" style="font-size: 20px;">文件浏览</div>
      <div class="panel-body">

          {% for filed in files  %}
          <div style="float:left;border-radius:8%;width:450px;height:400px;background:rgb(205, 219, 219);margin-left:30%">           
              <div style="margin-left:10%"><h3>标题：</h3><a href="/gpage/{{filed.id }}"style="color:blue">{{filed.title}}</a></div>
              <div style="margin-left:10%"><h3>图片：</h3> <img src="/public/upload/{{filed.filename }}"style="border-radius:8%; width:200px;height:150px"></div>
              <!-- <div>{{ lmed.id}}</div> -->
             <div style="margin-top: 10%;margin-left:50%">
                  <button class="btn btn-xs " >
                    <i class="fa fa-fw  fa-pencil-square-o"></i>
                    <a href="/updateimgs/{{ filed.id }}">编辑</a>
                  </button>
                  <button class="btn btn-xs " >
                    <i class="fa fa-fw   fa-remove "></i>
                    <a href="/deletep?id={{ filed.id }}" >删除</a>
                  </button>
                  <button class="btn btn-xs " >
                    <i class="fa fa-fw   fa-eye "></i>
                    <a href="/seefrontfile/{{ filed.id }}" >浏览</a>
                  </button>
             </div>
          </div>
      {% endfor %}
           
  
  <div class="kuai"style="width:100%;margin-right:70%">
      <nav aria-label="Page navigation">
            <ul class="pagination"style="margin-left:25%;margin-top:10%;">    
              {% if page=== 1 %}       
                  <li>
                    <a href="/getcount?page=1" aria-label="Previous">首页</a>
                  </li>            
                  <li>
                      <a aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>上一页
                      </a>
                  </li> 
              {% else %}
                  <li>
                    <a href="/getcount?page=1" aria-label="Previous">首页</a>
                  </li>            
                  <li>
                      <a href="/getcount?page={{page - 1}}" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>上一页
                      </a>
                  </li> 
              {% endif %}
              {% for i in range(start,stop+1) %}
                    {% if page===i %}
                        <li><a >{{i}}</a></li>
                    {% else %}
                        <li><a href="/getcount?page={{i}}">{{i}}</a></li>
                    {% endif %}                 
              {% endfor %}
              {% if page=== pages %}
                  <li>
                    <a aria-label="Next">下一页
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                    <li><a href="/getcount?page={{pages}}">尾页</a></li> 
                    {% else %}   
                    <li>
                      <a href="/getcount?page={{page + 1}}" aria-label="Next">下一页
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                      <li><a href="/getcount?page={{pages}}">尾页</a></li>   
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
                      <a >当前第 {{page}} 页</a>
                    </li>          
            </ul>
        </nav>
      </div>
    </div>
  </div>
</div>
</div>
{% endblock %}