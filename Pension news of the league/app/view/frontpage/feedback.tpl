{% extends 'base.tpl' %}

{% block head %}
    <title>用户反馈</title>
    <link rel="stylesheet" type="text/css" href="/public/css/cont.css">
{% endblock %}

{% block main %}
<div class="Content-Main">
    <div class="Content-Main1">
        <h1>用户反馈</h1>
          <h3 style="text-align: center;"> 
                亲爱的用户：
                您有任何意见和建议，或在使用过程中遇到问题，请在本页面反馈。我们会每天关注您的反馈，不断优化产品，为您提供更好的服务！</h3>
    </div>
    <form action="/feedback" method="post" class="form-report">
        <label>
            <span>联系方式:</span>
            <select name="select2" class="select2">
                <option value="Email">Email</option>
                <option value="Phone">Phone</option>
                <option value="QQ">QQ</option>
            </select>
            <input type="text"  name="contract" placeholder="联系方式" >
        </label>
        <label>
            <span>反馈信息:</span>
            <textarea id="message" name="content" placeholder="请写下您的建议"></textarea>
        </label>
        <label>
            <button style="margin-left:45%">发送</button>
        </label>
    </form>
</div>
{% endblock %}