import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'set_password_page.dart';
import 'package:flutter/cupertino.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('重置密码'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 20),
          child: Form(
//          autovalidate: true,
            child: Column(
              children: <Widget>[
                _getTelephone(),
                SizedBox(height: 6),
                _getCode(),
                _loginBtn(context),
              ],
            ),
          )),
    );
  }

  Widget _getTelephone() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: '请输入账号',
          border: InputBorder.none,
          prefixIcon: Container(
            width: 80,
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child: Text('账号'),
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        validator: (v) {
          return v.trim().length == 11 ? null : "请输入正确的手机号码";
        },
      ),
      decoration: BoxDecoration(
          // 下滑线浅灰色，宽度1像素
          color: Colors.grey.withOpacity(0.1),
          border:
              Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
    );
  }

  Widget _getCode() {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '请输入验证码',
                    border: InputBorder.none,
                    prefixIcon: Container(
                      width: 80,
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      child: Text('验证码'),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                  validator: (v) {
                    return v.trim().length != 6 ? null : "请输入6位验证码";
                  },
                ),
                decoration: BoxDecoration(
                    // 下滑线浅灰色，宽度1像素
                    color: Colors.grey.withOpacity(0.1),
                    border: Border(
                        bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                height: ScreenUtil().setHeight(80),
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2))),
                      iconColor: MaterialStateProperty.all(Colors.pink)
                  ),
                  onPressed: () {},
                  child: Text(
                    '获取验证码',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              flex: 1,
            ),
          ],
    ));
  }

  Widget _getUsername() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: '手机号',
          hintText: '请输入手机号',
//            icon: Icon(Icons.account_circle)
        ),
        validator: (v) {
          return v.trim().length > 0 ? null : "手机号不能为空";
        },
      ),
    );
  }

  Widget _getVerifyCode() {
    return Container(
//      width: ScreenUtil().setWidth(600),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: '验证码',
              hintText: '请输入验证码',
//            icon: Icon(Icons.account_circle)
            ),
            validator: (v) {
              return v.trim().length > 0 ? null : "验证码不能为空";
            },
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  iconColor: MaterialStateProperty.all(Colors.pink)
              ),
              onPressed: () {},
              child: Text(
                '获取验证码',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          flex: 1,
        ),
      ],
    ));
  }

  Widget _loginBtn(context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      width: double.infinity,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (BuildContext context) {
            return SetPasswordPage();
          }));
        },
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(Colors.pink)
        ),
        child: Text(
          '下一步',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
