<%--
  Created by IntelliJ IDEA.
  User: 637
  Date: 2022/8/22
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理</title>

    <style>

        a {
            text-decoration: none;
            color: black;
            font-size: 18px;
        }

        h2 {
            width: 180px;
            height: 38px;
            margin: 80px auto;
            text-align: center;
            line-height: 38px;
            background: deepskyblue;
            border-radius: 4px;
        }

        img {
            display: block;
        }

        #img-div {
            width: 100px;
            height: 100px;
            border-radius: 100%;
            overflow: hidden;
            padding: 0px;
            margin: 0px;
            display: none;
        }

    </style>
</head>
<link href="https://www.bootcss.com/p/layoutit/css/bootstrap-combined.min.css" rel="stylesheet">

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/cropperjs/1.5.12/cropper.js"></script>
<link href="https://cdn.bootcdn.net/ajax/libs/cropperjs/1.5.12/cropper.css" rel="stylesheet">
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script type="text/javascript">
    var cropper;

    function cropImg(obj) {
        let options = {
            initialAspectRatio: 1 / 1,
            aspectRatio: 1 / 1,
            crop: function (e) {

            }
        };

    //    创建div
    // <div style="width: 300px;height: 200px;margin: 0 auto" id="cut-module"></div>
        let divElement = document.createElement('div');
        divElement.style.width = '300px';
        divElement.style.height = '200px';
        divElement.style.margin = '0 auto';
        divElement.id = 'cut-module';
        $("#cut-parent-div").append(divElement);

        //创建图片
        let imageElement = document.createElement('img');
        imageElement.src = window.URL.createObjectURL(obj.files[0]);
        imageElement.style.width = '100%';
        imageElement.style.height = '100%';
        imageElement.id = 'img';
        $('#cut-module').append(imageElement);

        //调用截图
        cropper = new Cropper(imageElement, options);

        //创建换行
        let br = document.createElement('br');
        $('#cut-module').append(br);

        //创建截取按键
        // <input type="button" value="截取" id="docut">
        let inputElement = document.createElement('input');
        inputElement.id = "docut";
        inputElement.type = "button";
        inputElement.value = "截取";
        $('#cut-module').append(inputElement);

        $('#docut').on('click', function () {
            let src = cropper.getCroppedCanvas().toBlob(function (blob) {
                let formData = new FormData();
                formData.append("file", blob);
                $.ajax({//将裁切好的头像以blob的格式发送给后端
                    url: '/book/uploadImg', //要上传的地址
                    type: 'post',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function () {//上传完成后，回调函数，将刚才的头像从数据库取出并展示在应有的位置
                        axios({
                            url: '/book/imageDisplay',
                            responseType: 'blob'//接收的值类型
                        }).then((data) => {
                            let blob = data.data;
                            let src = window.URL.createObjectURL(blob)//转换为图片路径
                            console.log(src)//该src直接赋值给img的src路径中就可以了
                            document.getElementById("previewImg").src = src;
                        })
                    }
                });
            })

            divElement.remove();

        })

    }

    function clickInput() {//实现点击div，来选取要上传的图片
        document.getElementById("img-file").click();
    }

    window.onload = function () {
        $.ajax({
            url: '/book/isLogged',
            type: 'get',
            success: function (isLogged) {
                if (isLogged=="true"){
                    $("#img-div").css("display","block");
                    $("#welcomeTip").css("display","block");
                    axios({
                        url: '/book/imageDisplay',
                        responseType: 'blob'//接收的值类型
                    }).then((data) => {
                        let blob = data.data;
                        let src = window.URL.createObjectURL(blob)//转换为图片路径
                        console.log(src)//该src直接赋值给img的src路径中就可以了
                        document.getElementById("previewImg").src = src;
                    })
                }
            }
        })

    }
</script>

<body>
<div class="container">
    <h1 align="center">637图书管理系统</h1>
    <hr>

    <h3 align="center" id="welcomeTip" style="display: none">欢迎用户~${pageContext.request.session.getAttribute("u")}~</h3>

    <div class="row-fluid">

        <div class="span4">
        </div>

        <div class="span4" align="center">
            <form action="/book/uploadImg" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                <div style=""
                     class="col-md-4 column" onclick="clickInput()" id="img-div">
                    <img src="img/3825a8910c4d6f2e786ba4b6f84e0688.jpeg" id="previewImg">
                </div>
                <div>
                    <input type="file" id="img-file" onChange="cropImg(this)" hidden/>
                    <input type="file" id="blob-file" hidden name="blob">
                </div>
            </form>
            <h2 onclick="onh2()">
                <a href="${pageContext.request.contextPath}/book/listAll">显示所有书籍</a>
            </h2>
        </div>

        <div class="span4" id="cut-parent-div">

        </div>
    </div>
</div>
<button id="btn">测试</button>
</body>
</html>
