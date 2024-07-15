import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class PublishRX extends StatefulWidget {
  const PublishRX({super.key});

  @override
  State<PublishRX> createState() => _PublishRXState();
}

class _PublishRXState extends State<PublishRX> {
  final PublishSubject<int> timerSubject = PublishSubject();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      addValues();
    });
  }

  void addValues() async {
    int i = 0;
    while (i <= 50) {
      timerSubject.add(i);
      i++;
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Timer 1"),
            StreamBuilder(
              initialData: 0,
              stream: timerSubject.stream,
              builder: (context, snapshot) => Text(snapshot.data.toString()),
            ),
            const SizedBox(height: 100),
            const Text("Timer 1 Publish"),
            StreamBuilder(
              initialData: 0,
              stream: timerSubject.stream.delay(const Duration(seconds: 5)),
              builder: (context, snapshot) => Text(snapshot.data.toString()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timerSubject.close();
    super.dispose();
  }
}
