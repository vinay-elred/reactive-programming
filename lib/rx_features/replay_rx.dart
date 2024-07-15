import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ReplayRX extends StatefulWidget {
  const ReplayRX({super.key});

  @override
  State<ReplayRX> createState() => _ReplayRXState();
}

class _ReplayRXState extends State<ReplayRX> {
  final ReplaySubject<int> timerSubject = ReplaySubject();

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
      await Future.delayed(const Duration(milliseconds: 500));
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
            const Text("Timer 1 Replay"),
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
