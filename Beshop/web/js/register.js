$(function () {

    $("#register_form").validate({
        rules: {
            username: {
                required: true,
                rangelength: [3, 12]
            },
            password: {
                required: true,
                minlength: 4
            },
            ckpassword: {
                required: true,
                equalTo:"#password"
            },
            email: {
                required:true,
                email: true,
            },
            nickname: {
                required: true,
                rangelength: [3, 12]
            },
            sex: {
                required: true,
            },
            birthday: {
                required: true,
            },
            captcha: {
                required: true,
            }

        },
        messages: {
            username: {
                required: "用户名不能为空",
                rangelength: "用户名长度必须在3到12之间"
            },
            password: {
                required: "密码不能为空",
                minlength: "密码长度必须大于4"
            },
            ckpassword: {
                required: "请再次输入密码",
                equalTo:"密码必须相同"
            },
            email: {
                required:"邮箱不能为空",
                email: "请输入正确的邮箱"
            },
            nickname: {
                required: "昵称不能为空",
                rangelength: "昵称长度必须在3到12之间"
            },
            sex: {
                required: "请选择性别"
            },
            birthday: {
                required: "请输入生日"
            },
            captcha: {
                required: "请输入验证码",
            }
        },
        errorPlacement: function (error, element) {
            error.appendTo(element.parent());
            $(error).css({color: "red"});
        }
    });

});

