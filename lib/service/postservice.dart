// ignore: camel_case_types

import 'package:first_project/model/posts.dart';

import 'package:dio/dio.dart';

// ignore: camel_case_types
class postService {
  var base = 'https://jsonplaceholder.typicode.com/';
  var posts = 'posts';

  Future<List<Post>> getposts() async {
    // ignore: unused_local_variable
    List<Post> post = [];
    // ignore: unused_local_variable
    Response response = await Dio().get("$base$posts");
    var data = response.data;
    data.forEach((element) {
      post.add(Post.fromJson(element));
    });
    return post;
  }
}
