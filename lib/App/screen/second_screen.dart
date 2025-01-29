import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uiip_tv/App/common/controler.dart';

class SecondScreen extends StatefulWidget {
  static const String routeName = "SecondScreen";
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final PostController controller = Get.put(PostController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Card')),
      body: Center(
        child: Obx(() {
          final post = controller.post.value;
          return post == null
              ? CircularProgressIndicator()
              : Card(
                  margin: EdgeInsets.all(16.0),
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post['title']!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          post['subtitle']!,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        SizedBox(height: 16.0),
                        Image.network(
                          'https://www.apple.com/v/iphone-16/d/images/overview/apple-intelligence/apple_intelligence_endframe__ewm1810mnb0i_xlarge.jpg',
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
