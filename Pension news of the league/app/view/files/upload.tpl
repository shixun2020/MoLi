{% extends 'houtai/sbar.tpl' %}

{% block main%}
<div id="global">
  <div class="container-fluid" style="width:1000px">  
    <div class="panel panel-default" style="width:1050px">
          <!-- <div class="panel-heading" style="font-size: 20px;">上传文件</div> -->
          <div class="panel-body">
            <script src="/public/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>
              <div style="margin-top:5%">
                    <form method="POST" action="/gfile"  enctype="multipart/form-data">
                        <div class="edit3">
                          <textarea id="editor"  name="filename"></textarea>
                        </div>
                        <input type="submit">
                        </form>
                </div>
             </div>
          </div>
    </div>
  </div>
<script>
    tinymce.init({//配置所见即所得编辑器
        selector: '#editor',
        plugins: 'image code advlist autolink link lists preview',
        height:600,
        width:1250,
        relative_urls : false,
        remove_script_host : true,
        document_base_url : '/',
        toolbar: [ 'undo redo|cut|copy |styleselect|removeformat|subscript|superscript|fontselect|fontsizeselect| bold italiclineheight | italic  | underline | alignleft | aligncenter | alignright | alignjustify|bullist|numlist|outdent|indent',

                 'image code',
                ],
        language: 'zh_CN', 
        images_upload_handler: example_image_upload_handler,
    //     menubar: 'my1',
    // menu: {
    //     my1: {title: '菜单', items: 'copy  formats' }
    // },
    });

          function example_image_upload_handler (blobInfo, success, failure, progress) {
          var xhr, formData;

          xhr = new XMLHttpRequest();
          xhr.withCredentials = false;
          xhr.open('POST', '/gfile');

          xhr.upload.onprogress = function (e) {
            progress(e.loaded / e.total * 100);
          };

          xhr.onload = function() {
            var json;

            if (xhr.status === 403) {
              failure('HTTP Error: ' + xhr.status, { remove: true });
              return;
            }

            if (xhr.status < 200 || xhr.status >= 300) {
              failure('HTTP Error: ' + xhr.status);
              return;
            }

            json = JSON.parse(xhr.responseText);

            if (!json || typeof json.location != 'string') {
              failure('Invalid JSON: ' + xhr.responseText);
              return;
            }

            success(json.location);
          };

          xhr.onerror = function () {
            failure('Image upload failed due to a XHR Transport error. Code: ' + xhr.status);
          };

          formData = new FormData();
          formData.append('file', blobInfo.blob(), blobInfo.filename());

          xhr.send(formData);
        };
</script>
{% endblock %}