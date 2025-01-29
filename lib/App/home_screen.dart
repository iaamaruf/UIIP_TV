import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'screen/second_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  int _selectedIndex = 0;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello Rafsan",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            Text("Let's watch today",
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        actions: const [
          CircleAvatar(backgroundImage: AssetImage('assets/images/propic.png',
            
          )

          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                          prefix: Icon(Icons.search),
                        filled: true,
                         fillColor: Colors.black,
                         border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                         borderSide: BorderSide(color: Colors.blue, width: 2),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                Icon(Icons.menu, color: Colors.grey,),
              ],
            ),

            _buildCategorySection(),
            _taitleImage(),
            _buildSection("Trending Movies"),
            _buildMovieList(),
            _buildSection("Continue Watching"),
            _buildMovieList(),
            _buildSection("Recommended For You"),
            _buildMovieList(),
          ],
        ),
      ),

    );
  }

  Widget _buildCategorySection() {
    List<String> categories = ["All", "Action", "Anime", "Sci-Fi", "Thriller"];
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              backgroundColor: index == 0 ? Colors.red : Colors.grey.shade800,
              label: Text(categories[index],
                  style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }

  Widget _taitleImage() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 220,
          width: double.infinity,
          child: Image.asset(
            'assets/images/top image.png',
            fit: BoxFit.cover,
          ),
        ));
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const Text("See More",
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildMovieList() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/movie ${index + 1}.png',
                  width: 100, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Get.to(() =>SecondScreen());
    }
  }
}
