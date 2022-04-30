<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="/public/css/base.css">
<title>Person Union</title>
{% block head %}{% endblock %}
</head>
<body>
<div class="header">
  <h1>养老联盟</h1>
</div>
<div class="topnav">
  <a href="homepage">网页首页</a>
  <a href="/guide">新手指南</a>
  <a >健康养生</a>
  <a >生活百科</a>
  <a >娱乐学习</a>
  <a >智能产品</a>
  <a href="/feedback">用户反馈</a>
  <a href="/login" style="float:right">登录</a>
  <a href="/register" style="float:right">注册</a>
</div>
{% block main%}{% endblock %}
<div class="footer">
  <h2>养老联盟</h2>
</div>
</body>
</html>