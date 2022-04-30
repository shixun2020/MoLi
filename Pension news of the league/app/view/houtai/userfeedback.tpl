{% extends 'houtai/sbar.tpl' %}


{% block main%}
<div id="global">
    <div class="container-fluid" >  
      <div class="panel panel-default" >
            <div class="panel-heading"><h2>用户反馈</h2></div>
            <div class="panel-body">
                <table  cellspacing="0" class="table table-hover">
                    <thead>
                        <tr style="color:#434343;">
                            <th>联系方式</th>
                            <th>反馈内容</th>          
                        </tr>
                    </thead>
                    <tbody>
                        {% for userback in user_back   %}
                        <tr style="color:#434343;">
                            <td class="btbg font-center titfont" rowspan="1">{{ userback.contract }}</td>
                            <td class="btbg font-center titfont" rowspan="1">{{ userback.content }}</td>             
                            </td>
                        </tr>
                        {% endfor %}
                        </tbody>
                    </table>
                <div class="kuai"style="width:100%;margin-left:20%;">
                    <nav aria-label="Page navigation">
                          <ul class="pagination"style="margin-left:13%;margin-top:10%;">    
                            {% if page=== 1 %}       
                                <li>
                                  <a href="/feedbackcount?page=1" aria-label="Previous">首页</a>
                                </li>            
                                <li>
                                    <a aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>上一页
                                    </a>
                                </li> 
                            {% else %}
                                <li>
                                  <a href="/feedbackcount?page=1" aria-label="Previous">首页</a>
                                </li>            
                                <li>
                                    <a href="/feedbackcount?page={{page - 1}}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>上一页
                                    </a>
                                </li> 
                            {% endif %}
                            {% for i in range(start,stop+1) %}
                                  {% if page===i %}
                                      <li><a >{{i}}</a></li>
                                  {% else %}
                                      <li><a href="/feedbackcount?page={{i}}">{{i}}</a></li>
                                  {% endif %}                 
                            {% endfor %}
                            {% if page=== pages %}
                                <li>
                                  <a aria-label="Next">下一页
                                    <span aria-hidden="true">&raquo;</span>
                                  </a>
                                </li>
                                  <li><a href="/feedbackcount?page={{pages}}">尾页</a></li> 
                                  {% else %}   
                                  <li>
                                    <a href="/feedbackcount?page={{page + 1}}" aria-label="Next">下一页
                                      <span aria-hidden="true">&raquo;</span>
                                    </a>
                                  </li>
                                    <li><a href="/feedbackcount?page={{pages}}">尾页</a></li>   
                            {% endif %}  
                                  <li>
                                    <a >共 {{ count }} 条</a>
                                  </li>
                                  <li>
                                    <a >{{limit}} 条/页</a>
                                  </li>
                                  <li>
                                    <a  >总 {{pages}} 页</a>
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
