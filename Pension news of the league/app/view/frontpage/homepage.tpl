{% extends 'base.tpl' %}

{% block main %}
<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <div class="slideshow-container">
        <div class="mySlides fade">
          <img src="/public/img/1.jpg" style="width:100%">
        </div>
        <div class="mySlides fade">
          <img src="/public/img/2.jpg" style="width:100%">
        </div>
        <div class="mySlides fade">
          <img src="/public/img/3.jpg" style="width:100%">
        </div>
         <a class="prev" onclick="plusSlides(-1)">❮</a>
        <a class="next" onclick="plusSlides(1)">❯</a>
      </div>
      <br>
      <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span> 
        <span class="dot" onclick="currentSlide(2)"></span> 
        <span class="dot" onclick="currentSlide(3)"></span> 
      </div>
    </div>
    <div class="card">
      <h1>互联网养老院</h1>
      <h3>“互联网+养老”深入推进，智慧养老开启养老新模式”</h3>
      <img src="/public/img/养老.jpg" style="width:100%;height:350px">
      <p>技巧改变生活</p>
    </div>
  </div>
  <div class="rightcolumn"style="height:900px">
    <div class="card"style="height:500px">
      <h1>老友提醒</h1>
      <h3>新手指南</h3>
        {% for article in garticles   %}
        <div style="float:left;width:250px;height:100px;background:rgb(241, 239, 239);margin-right: 2%;margin-top: -2%;margin-bottom: -20%;">
            <div style="margin-left:10%;"><a href="/conarticledetail/{{article.id }}"style="font-size:20px;text-decoration:none">{{  article.titles }}</a></div>   
        </div>
        {% endfor %} 
    </div>
    <div class="card"style="height:320px">
      <h3>热门文章</h3>
      {% for article1 in garticles1   %}
      <div style="float:left;width:250px;height:80px;background:rgb(241, 239, 239);margin-right: 2%;margin-top: -2%;margin-bottom: -10%;">
          <div style="margin-left:10%;"><a href="/conarticledetail/{{article1.id }}"style="font-size:20px;text-decoration:none">{{  article1.title }}</a></div>   
      </div>
      {% endfor %}
    </div>
    <div class="card"style="height:260px">
      <h3>游山玩水</h3>
      {% for filed in files  %}
      <div style="float:left;width:250px;height:80px;background:rgb(241, 239, 239);margin-right: 2%;margin-top: -2%;margin-bottom: -10%;">
          <div style="margin-left:10%;"><a href="/conimgdetail/{{filed.id }}"style="font-size:20px;text-decoration:none">{{ filed.title }}</a></div>   
      </div>
      {% endfor %}
    </div>
  </div>
</div>
<script>
  var slideIndex = 0;
      showSlides();
function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // 切换时间为 2 秒
}
</script>
{% endblock %}