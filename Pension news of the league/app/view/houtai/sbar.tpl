<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
        <link rel="stylesheet" type="text/css" href="/public/css/bootstrap-clearmin.min.css">
        <link rel="stylesheet" type="text/css" href="/public/css/roboto.css">
        <link rel="stylesheet" type="text/css" href="/public/css/material-design.css">
        <link rel="stylesheet" type="text/css" href="/public/css/small-n-flat.css">
        <link rel="stylesheet" type="text/css" href="/public/css/font-awesome.min.css">
        <script src="/public/js/jquery.min.js"></script>
        <script src="/public/js/jquery.mousewheel.min.js"></script>
        <script src="/public/js/jquery.cookie.min.js"></script>
        <script src="/public/js/fastclick.min.js"></script>
        <script src="/public/js/bootstrap.min.js"></script>
        <script src="/public/js/clearmin.min.js"></script>
        <script src="/public/js/home.js"></script>
        {% block script %}{% endblock %}
        <title>Person Union</title>
    </head>
    <body class="cm-no-transition cm-1-navbar">
        <div id="cm-menu">
            <nav class="cm-navbar cm-navbar-primary">
                <div class="cm-flex"><h1>后台管理系统</h1></div>
                <div class="btn btn-primary md-menu-white" data-toggle="cm-menu"></div>
            </nav>
            <div id="cm-menu-content">
                <div id="cm-menu-items-wrapper">
                    <div id="cm-menu-scroller">
                        <ul class="cm-menu-items">
                            <li><a href="/home" class="sf-house">后台主页</a></li>
                            <li><a href="/homepage" class="sf-globe">浏览页面</a></li>
                            <li class="cm-submenu">
                                <a class="sf-window-layout">栏目管理<span class="caret"></span></a>
                                <ul>
                                    <li><a href="/createlm">增加栏目</a></li>
                                    <li><a href="/getlmcount">浏览栏目</a></li>
                                </ul>
                            </li>
                            <li class="cm-submenu">
                                <a class="sf-file-text">文章管理<span class="caret"></span></a>
                                <ul>
                                    <li><a href="/getcreate">增加文章</a></li>
                                    <li><a href="/getacount">浏览文章</a></li>
                                </ul>
                            </li>
                            <li class="cm-submenu">
                                <a class="sf-file-picture" href="#">文件管理<span class="caret"></span></a>
                                <ul>   
                                    <li><a href="/up">增加文件 </a></li>
                                    <li><a href="/sc">增加预览 </a></li>
                                    <li><a href="/getcount">浏览文件</a></li>
                                </ul>
                            </li>
                            <li class="cm-submenu">
                                <a class="sf-profile-group">用户管理<span class="caret"></span></a>
                                <ul>    
                                    <li><a href="/getucount">查看用户</a></li>                               
                                </ul>
                            </li>
                            <li class="cm-submenu">
                                <a class="sf-envelope">用户反馈<span class="caret"></span></a>
                                <ul>
                                    <li><a href="/feedbackcount">查看内容</a></li>
                                </ul>
                            </li>
                            <li class="cm-submenu">
                                <a class="sf-cat">Icons <span class="caret"></span></a>
                                <ul>
                                    <li><a href="/icom">设计小图标</a></li>
                                    <li><a href="/icos">精致小图标</a></li>
                                </ul>
                            </li>
                            <li><a href="/hlogin" class="md-person">登录</a></li>
                            <li><a href="/hregister" class="md-person-add">注册</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>   
    <div>
        <header id="cm-header">
            <nav class="cm-navbar cm-navbar-primary">
                <div class="btn btn-primary md-menu-white hidden-md hidden-lg" data-toggle="cm-menu"></div>
                <div class="cm-flex">
                    <h1>{% block h1 %}{% endblock %}</h1> 
                    <form id="cm-search" action="/sidebar1" method="get">
                        <input type="search" name="q" autocomplete="off" placeholder="Search...">
                    </form>
                </div>
                <div class="pull-right">
                    <div id="cm-search-btn" class="btn btn-primary md-search-white" data-toggle="cm-search"></div>
                </div>
                <div class="dropdown pull-right">
                    <button class="btn btn-primary md-notifications-white" data-toggle="dropdown"> <span class="label label-danger">23</span> </button>
                    <div class="popover cm-popover bottom">
                        <div class="arrow"></div>
                        <div class="popover-content">
                            <div class="list-group">
                                <a  class="list-group-item">
                                    <h4 class="list-group-item-heading text-overflow">
                                        <i class="fa fa-fw fa-envelope"></i> Nunc volutpat aliquet magna.
                                    </h4>
                                    <p class="list-group-item-text text-overflow">Pellentesque tincidunt mollis scelerisque. Praesent vel blandit quam.</p>
                                </a>
                                <a  class="list-group-item">
                                    <h4 class="list-group-item-heading">
                                        <i class="fa fa-fw fa-envelope"></i> Aliquam orci lectus
                                    </h4>
                                    <p class="list-group-item-text">Donec quis arcu non risus sagittis</p>
                                </a>
                                <a  class="list-group-item">
                                    <h4 class="list-group-item-heading">
                                        <i class="fa fa-fw fa-warning"></i> Holy guacamole !
                                    </h4>
                                    <p class="list-group-item-text">Best check yo self, you're not looking too good.</p>
                                </a>
                            </div>
                            <div style="padding:10px"><a class="btn btn-success btn-block" href="#">Show me more...</a></div>
                        </div>
                    </div>
                </div>
                <div class="dropdown pull-right">
                    <button class="btn btn-primary md-account-circle-white" data-toggle="dropdown"></button>
                    <ul class="dropdown-menu">
                        <li class="disabled text-center">
                            <a style="cursor:default;"><strong>{{ctx.session.user.username}}</strong></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a>个人信息</a>
                        </li>
                        <li>
                            <a>设置</a>
                        </li>
                        <li>
                            <a href="/deleteSession">退出登录</a>
                        </li>
                    </ul>
                </div>
            </nav>
          </header>
        {% block main %} {% endblock %}
        </div>
        </div>
    </body>
</html>
