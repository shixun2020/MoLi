<!-- 使用tinymce所见即所得编辑器文件上传 -->
{% extends 'houtai/sbar.tpl' %}

{% block h1 %}文件{% endblock %}

{% block main%}

<div id="global">
    <div class="container-fluid" >  
      <div class="panel panel-default" >
            <div class="panel-heading">分页浏览</div>
            <div class="panel-body">
                <form method="post"  action="/sc" enctype="multipart/form-data">
                    <div class="from-group-lg col-md-15">
                        <label class="form-label">图片预览</label>
                        <div class="border text-center p-5 upload">
                            <div class="upload-preview"></div>
                            <input type="file" name="upload" class="d-none upload-file">
                            <input type="hidden" name="cover">
                            <a href="#" class="upload-trigger text-decoration-none">
                                <i class="bi bi-cloud"></i>
                                <span>请选择文件</span>
                            </a>
                        </div>
                    </div>
                    <div class="from-group-lg">
                        <label class="form-label">标题：</label><input name="title" value="{{filed.title}}" style="margin-bottom:5%">
                    </div>
                    <div class="from-group-lg">
                        <textarea id="editor" name="content" value="{{filed.content}}">{{filed.content}}</textarea>
                        <button style="width:80px;height:50px;margin-left:45%;margin-top:10%">上传</button>
                    </div>
                </form>
           </div> 
        </div>
     </div>
   </div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="/public/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
<script>
    tinymce.init({
        selector: '#editor',
        forced_root_block:'null',
    });
// document.cookie='a=lfdsscabcdebghnrf';
        let Cookie={};
        document.cookie.split('; ').forEach((item)=>{
           let temp=item.split('=');//split() 方法用于把一个字符串分割成字符串数组。
           Cookie[temp[0]]=temp[1];
           console.log(Cookie);
        })
        var upload = document.querySelector('.upload');
        var cover = upload.querySelector('input[name=cover]');
        var uploadFile = upload.querySelector('.upload-file');
        var uploadPreview = upload.querySelector('.upload-preview');
        var uploadTrigger = upload.querySelector('.upload-trigger');
        uploadFile.addEventListener("change", (e) => {
            var formData = new FormData();
            formData.append('upload', uploadFile.files[0]);
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/upload');
            xhr.setRequestHeader('x-csrf-token',Cookie.csrfToken);
            xhr.addEventListener('load', () => {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log(xhr.responseText);
                    let result = JSON.parse(xhr.responseText);
                    console.log(result);
                    cover.setAttribute('value', result.filename);
                    let image = document.createElement('img');
                    image.classList.add('col-md-3');
                    image.setAttribute('src', '/public/upload/' + result.filename);
                    uploadPreview.append(image);
                }
            });
            xhr.send(formData);
        });

        uploadTrigger.addEventListener("click", (e) => {
            e.preventDefault();
            uploadFile.click();
        });
    </script>
{% endblock %}
