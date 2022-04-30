{% extends 'houtai/sbar.tpl' %}

{% block main %}
        <div id="global">
            <div class="container-fluid cm-container-white">
                <h2 style="margin-top:0;margin-left:35%">欢迎来到养老联盟后台系统</h2> 
                <p></p>
            </div>
            <div class="container-fluid">
                <div class="row cm-fix-height">
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                        <a href="/home" class="panel panel-default thumbnail cm-thumbnail">
                            <div class="panel-body text-center">
                                <span class="svg-48">
                                    <img src="/public/img/sf/house.svg">
                                </span>
                                <h4>后台主页</h4> <small>后台系统管理</small>
                            </div>
                        </a>
                    </div>         
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                        <a href="/homepage" class="panel panel-default thumbnail cm-thumbnail">
                            <div class="panel-body text-center">
                                <span class="svg-48">
                                    <img src="/public/img/sf/globe.svg" >
                                </span>
                                <h4>浏览页面</h4> <small>前台页面显示</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                        <a href="/getlmcount" class="panel panel-default thumbnail cm-thumbnail">
                            <div class="panel-body text-center">
                                <span class="svg-48">
                                    <img src="/public/img/sf/window-layout.svg" >
                                </span>
                                <h4>栏目管理</h4> <small>页面栏目管理</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                        <a href="/getacount" class="panel panel-default thumbnail cm-thumbnail">
                            <div class="panel-body text-center">
                                <span class="svg-48">
                                    <img src="/public/img/sf/file-text.svg" >
                                </span>
                                <h4>文章管理</h4> <small>页面文章管理</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                        <a href="/getcount" class="panel panel-default thumbnail cm-thumbnail">
                            <div class="panel-body text-center">
                                <span class="svg-48">
                                    <img src="/public/img/sf/file-picture.svg">
                                </span>
                                <h4>图片管理</h4> <small>前端图片管理</small>
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                        <a href="/feedbackcount" class="panel panel-default thumbnail cm-thumbnail">
                            <div class="panel-body text-center">
                                <span class="svg-48">
                                    <img src="/public/img/sf/envelope.svg" >
                                </span>
                                <h4>用户反馈</h4> <small>用户体验反馈信息</small>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">挑选喜欢的颜色</div>
                    <div class="panel-body" id="demo-buttons">
                        <p>单击下面的按钮以更改导航栏的主要颜色:</p>
                        <div class="row">
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-primary" data-switch-color="primary">primary</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-success" data-switch-color="success">success</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-info" data-switch-color="info">info</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-warning" data-switch-color="warning">warning</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-danger" data-switch-color="danger">danger</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-gray" data-switch-color="gray">gray</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-yellow" data-switch-color="yellow">yellow</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-purple" data-switch-color="purple">purple</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-turquoise" data-switch-color="turquoise">turquoise</button>
                                <br>
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                <button class="btn btn-block btn-midnight" data-switch-color="midnight">midnight</button>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <footer class="cm-footer"><span class="pull-left">Connected as John Smith</span><span class="pull-right">&copy; PAOMEDIA SARL</span></footer> -->
        </div>
        {% endblock %}