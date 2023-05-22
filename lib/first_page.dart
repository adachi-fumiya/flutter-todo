import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final List<String> entries = <String>['きなこ', 'もな'];
  final List<String> imagePaths = <String>['kina', 'mona'];
  final double imageSize = 120;
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation Food',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.red[200],
        actions: const [
          // Icon(Icons.cast),
          // SizedBox(width: 24),
          // Icon(Icons.search),
          // SizedBox(width: 24),
          // Icon(Icons.bar_chart),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 150,
            // width: double.infinity,
            // padding: const EdgeInsets.all(8),
            child: Container(
              // color: Colors.orange,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // プロフィール画像
                  Container(
                    width: 110.0,
                    height: 110.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/${imagePaths[index]}.jpg")
                      )
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Container(
                        height: imageSize,
                        width: imageSize,
                        color: Colors.white,
                        child: const Icon(Icons.light_mode, size: 50,),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: imageSize,
                        width: imageSize,
                        color: Colors.white,
                        child: const Icon(Icons.dark_mode, size: 50,),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      )
    );
  }
}