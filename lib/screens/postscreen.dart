import 'package:first_project/model/posts.dart';
import 'package:first_project/service/postservice.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class PostScreen extends StatefulWidget {
  @override
  // ignore: override_on_non_overriding_member
  _PostScreenState createState() => _PostScreenState();
}

// ignore: camel_case_types
class _PostScreenState extends State<PostScreen> {
  bool loading = true;

  // ignore: non_constant_identifier_names
  List<Post> Posts = [];
  getpostlist() async {
    Posts = await postService().getposts();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getpostlist();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("postsscreen"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: Posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Container(
                  height: 20,
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text("${Posts[index].name}"),
                  ),
                ));
              },
            ),
    );
  }
}
