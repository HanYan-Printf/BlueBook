import 'package:flutter/material.dart';
import 'login_page.dart';
import 'new_login_page.dart';
import 'logo_login_page.dart';
import 'login_register_page.dart';
import 'my_data.dart';
import 'my_attention.dart';
import 'my_fans.dart';
import 'my_favorites.dart';
import 'my_notes.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation:50,
      child:ListView(
        padding: EdgeInsets.zero, // 适配水滴屏、刘海屏等
        children: <Widget>[
          // 用户头像
          UserAccountsDrawerHeader(
            accountName: Text('八阿哥Bug'),
            accountEmail: Text('1713293551@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://img.xiaohongshu.com/avatar/5b5d931b14de412246d05364.jpg@80w_80h_90q_1e_1c_1x.jpg"),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Text('编辑资料'),
            leading: Icon(Icons.settings, size: 22),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return MyData();
              }));
            }
          ),
          ListTile(
            title: Text('创作中心'),
            leading: Icon(Icons.mode_edit, size: 22),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return MyNotes();
                }));
              }
          ),
          ListTile(
            title: Text('收藏'),
            leading: Icon(Icons.favorite, size: 22),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return MyFavorites();
                }));
              }
          ),

          ListTile(
            title: Text('粉丝'),
            leading: Icon(Icons.people, size: 22),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return MyFans();
                }));
              }
          ),
          ListTile(
            title: Text('关注'),
            leading: Icon(Icons.tag_faces, size: 22,),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return MyAttention();
              }));
            }
          ),
          ListTile(
            title: Text('退出'),
            leading: Icon(Icons.directions, size: 22,),
            onTap: () {
              Navigator.pop(context); // 对于在drawer中使用导航，需关闭drawer 再跳转，否则返回报错
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context){
                return LoginPage();
              }));
            }
          )
        ],
      )
    );
  }
}
