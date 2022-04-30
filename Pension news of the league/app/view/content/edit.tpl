{% extends 'houtai/sbar.tpl' %}

{% block main %}
<div id="global">
    <div class="container-fluid" style="width:1000px">  
        <div class="panel panel-default" style="width:1050px">
                <div class="panel-heading" style="font-size: 20px;">编辑区域</div>
                <div class="panel-body">
    {% include 'content/form.tpl' %}
</div>
</div>
</div>
</div>
{% endblock %}x