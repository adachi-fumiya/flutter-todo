import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/// 日本時間を取得する
String getDate() {
  initializeDateFormatting("ja");
  // return 'sss';
  return DateFormat.yMMMMEEEEd('ja').format(DateTime.now()).toString();
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<String> entries = <String>['きなこ', 'もな'];
  final List<String> imagePaths = <String>['kina', 'mona'];
  final double imageSize = 120;
  final mornigFlag = [false, false];
  final dinnerFlag = [false, false];

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getDate(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[200],
        actions: const [
          // アイコンを追加できる。
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 150,
            child: Row(
              children: [
                // プロフィール画像
                Container(
                  width: 110.0,
                  height: 110.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/${imagePaths[index]}.jpg"),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    SizedBox(
                      width: _screenSize.width * 0.3,
                      height: _screenSize.width * 0.3,
                      child: ElevatedButton.icon(
                        onPressed: () => setState(() => 
                          mornigFlag[index] = !mornigFlag[index]
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: mornigFlag[index] ? Colors.red[200] : Colors.blue,
                        ),
                        icon: Icon(Icons.light_mode),
                        label: mornigFlag[index] ? Text('full') : Text('hungry')
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: _screenSize.width * 0.3,
                      height: _screenSize.width * 0.3,
                      child: ElevatedButton.icon(
                        onPressed: () => setState(() => 
                          dinnerFlag[index] = !dinnerFlag[index]
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: dinnerFlag[index] ? Colors.red[200] : Colors.blue,
                        ),
                        icon: const Icon(Icons.dark_mode),
                        label: dinnerFlag[index] ? Text('full') : Text('hungry')
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
