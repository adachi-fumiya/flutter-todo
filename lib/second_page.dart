import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/mona.jpg'),
            Text(name,
              style: const TextStyle(
                fontSize: 50
              ),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.pop(context)
              },
              child: const Text('hoge'),
            ),
          ],
        ),
      )
    );
  }
}