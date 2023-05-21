import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> dataList = [
    {
      'image': 'https://placehold.jp/50x50.png',
      'title': 'きなこ',
    },
    {
      'image': 'https://placehold.jp/50x50.png',
      'title': 'もなりざ',
    },
    // {
    //   'image': 'https://placehold.jp/50x50.png',
    //   'title': 'タイトル3',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Example'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        // itemExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: ListItem(
              image: dataList[index]['image'],
              title: dataList[index]['title'],
            ),
          );
        },
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  final String image;
  final String title;

  ListItem({required this.image, required this.title});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _isToggled1 = false;
  bool _isToggled2 = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(widget.image),
      leading: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Image.network(
          widget.image,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: _isToggled1,
            onChanged: (value) {
              setState(() {
                _isToggled1 = value;
              });
            },
          ),
          Switch(
            value: _isToggled2,
            onChanged: (value) {
              setState(() {
                _isToggled2 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
