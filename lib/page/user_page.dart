import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '마이 페이지',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          ListTile(
            title: Text('설정'),
            onTap: () {},
          ),
          ListTile(
            title: Text('내게 쓴 글'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            title: Text('이메일 변경'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            title: Text('비밀번호 찾기'),
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          ListTile(
            title: Text('문의하기'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            title: Text('로그아웃'),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            title: Text('회원 탈퇴'),
            onTap: () {
              // Handle tap
            },
          ),
        ],
      ),
    );
  }
}
