import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 4,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 200),
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '커뮤니티',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: communityTabBar(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.campaign_rounded),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '<<어쩌면 해피엔딩>> 아직도 안 본 사람이 있다고??',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                children: [
                  CommentCard(
                    title: '<<어쩌면 해피엔딩>> 아직도 안 본 사람이 있다고??',
                    contents: '거짓말.. 이걸 어떻게 안 봐..',
                    likes: 21,
                    comments: 14,
                  ),
                  CommentCard(
                    title: '나랑 뮤지컬 보러 갈 사람',
                    contents: '뭔가 새로운 느낌의 뮤지컬이 보고 싶어졌어',
                    likes: 0,
                    comments: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  communityTabBar() {
    return TabBar(
        controller: tabController,
        labelColor: Colors.black,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(color: Colors.transparent),
        tabs: [
          Tab(
            text: '전체',
          ),
          Tab(
            text: '후기',
          ),
          Tab(
            text: '같이 볼 사람',
          ),
          Tab(
            text: '거래',
          ),
        ]);
  }
}

class TabItem extends StatelessWidget {
  final String title;

  TabItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String title;
  final String contents;
  final bool isReply;
  final int likes;
  final int comments;

  CommentCard({
    required this.title,
    required this.contents,
    this.isReply = false,
    this.likes = 0,
    this.comments = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              contents,
              style: TextStyle(fontSize: 12),
            ),
            if (!isReply)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(likes.toString()),
                    SizedBox(width: 16.0),
                    Icon(Icons.comment_outlined, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(comments.toString()),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
