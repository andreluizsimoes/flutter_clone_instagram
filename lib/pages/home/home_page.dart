import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clone_instagram/model/post.dart';
import 'package:flutter_clone_instagram/model/story.dart';
import 'package:flutter_clone_instagram/pages/my_bars/my_appbar.dart';
import 'package:flutter_clone_instagram/widgets/post_widget.dart';
import 'package:flutter_clone_instagram/widgets/stories_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var stories = <Story>[];
  var posts = <Post>[];

  @override
  void initState() {
    super.initState();
    _loadStories();
    _loadPosts();
  }

  Future<void> _loadStories() async {
    final storyJson = await rootBundle.loadString('assets/json/stories.json');
    setState(() {
      var storyLista = json.decode(storyJson);
      stories = storyLista.map<Story>((story) => Story.fromMap(story)).toList();
    });
  }

  Future<void> _loadPosts() async {
    final postJson = await rootBundle.loadString('assets/json/posts.json');
    setState(() {
      var postList = json.decode(postJson);
      posts = postList.map<Post>((post) => Post.fromMap(post)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppbar(),
      // bottomNavigationBar: MyBottomNavigationBar(),
      body: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                color: Colors.black,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    var story = stories[index];
                    return StoriesWidget(
                      urlImage: story.urlImage,
                      nome: story.nome,
                      aoVivo: story.aoVivo,
                      favorito: story.favorito,
                    );
                  },
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  var post = posts[index];
                  return PostWidget(
                    urlImage: post.urlImage,
                    nome: post.nome,
                    urlPostagem: post.urlPostagem,
                    descricao: post.descricao,
                    curtidas: post.curtidas,
                    comentarios: post.comentarios,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
