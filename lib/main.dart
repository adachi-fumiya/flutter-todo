import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

void main() {
  // runApp関数でウィジェットツリーのルートとなる。
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // stateLessWidget または stateFulWidgetを継承した場合は必ずbuildメソッドをオーバーライドしないといけない。
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

// 途中で値が変わったらそれを反映させる必要があるのでStatefulWidgetを記載する
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

// StatefulWidgetはWidgetにstateの概念をいれて拡張したもの
// StatefulWidgetはcreateStateメソッドを持ち、これがStateクラスを返す
  @override
  ////stateを継承している型
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 初めに3つTODOリストを作成
  final _todos = List.generate(
    2,
    (index) => ToDo(),
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // scaffold:足場
    return Scaffold(
        appBar: AppBar(
          title: const Text('ToDo App'),
          backgroundColor: const Color(0xFF388E3C),
        ),
        // ListView.builder()は基本的なリストを作成する
        body: ListView.builder(
          //生成する個数を指定する
          itemCount: _todos.length,

          // ↓itemBuilderの関数型の定義 Widget型を返す 引数にはこれら↓
          // IndexedWidgetBuilder = Widget Function(BuildContext context, int index);
          // CheckboxListTileについて 公式 https://api.flutter.dev/flutter/material/CheckboxListTile-class.html
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Checkbox(
                value: _todos[index].checked,
                onChanged: (e) {
                  // setStateはフレームワーク側に画面更新が必要であることを通知します。
                  setState(() {
                    _todos[index].checked = e; //イベントeを受け取り反映 true, false
                  });
                },
              ),
              title: TextFormField(
                style: _todos[index].checked == true
                    ? const TextStyle(decoration: TextDecoration.lineThrough) // 取り消し線
                    : const TextStyle(color: Colors.black), // falseの時はただの黒色
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: const Color(0xFF388E3C),
          onPressed: () {
            // setState()を呼び出すことで裏では再度buildメソッドを呼び出して変更された変数で再描画している
            setState(() {
              _todos.add(
                ToDo(),
              );
            });
          },
        ),
        // ボトムにバーを追加できる。
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              activeIcon: Icon(Icons.book_online),
              label: 'Book',
              tooltip: "This is a Book Page",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              activeIcon: Icon(Icons.book_online),
              label: 'Book',
              tooltip: "This is a Book Page",
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        // 左上のdrawer
        drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              ElevatedButton(
                onPressed: _closeDrawer,
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ));
  }
}
