{% extends 'base.tpl' %}

{% block head %}
<link rel="stylesheet" type="text/css" href="/public/css/material-design.css">
<link rel="stylesheet" type="text/css" href="/public/css/cont.css">

{% endblock %}

{% block main %}
<div style="display:flex;margin-left:20%">
    <div style="width:300px;height:180px;background:white;margin-right:15%">
       <a href="/register" style="text-decoration: none;color:black">
           <img src="/public/img/md/dark/person-add.svg"  >注册一个账号吧
        </a>
    </div>
    <div style="width:300px;height:180px;background:white;margin-right:15%">
        <a  style="text-decoration: none;color:black">
            <img src="/public/img/sf/star.svg" >系统介绍
        </a>
    </div>
 </div>
{% endblock %}