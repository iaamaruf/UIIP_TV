import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class PostController extends GetxController {
  var post = Rxn<Map<String, String>>();
  late Box postsBox;

  @override
  void onInit() {
    super.onInit();
    postsBox = Hive.box('postsBox');
    fetchAndSavePost();
  }

  Future<void> fetchAndSavePost() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final newPost = {
        'title': data['title'],
        'subtitle': data['body']
      };


      postsBox.put('post1', newPost);
      post.value = newPost.cast<String, String>();
    } else {
      throw Exception('Failed to load post');
    }
  }
}