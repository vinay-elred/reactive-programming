import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MergeStreams extends StatefulWidget {
  const MergeStreams({super.key});

  @override
  State<MergeStreams> createState() => _MergeStreamsState();
}

class _MergeStreamsState extends State<MergeStreams> {
  Stream<int> get stream1 async* {
    for (var i = 0; i <= 5; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield i;
    }
  }

  Stream<int> get stream2 async* {
    for (var i = 6; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 800));
      yield i;
    }
  }

  Stream<int> get mergeStreams {
    return Rx.merge([stream1, stream2]);
  }

  Stream<int> get concatStreams {
    return Rx.concatEager([stream1, stream2]);
  }

  Stream<List<int>> get forkJoinStreams {
    return Rx.forkJoinList([stream1, stream2]);
  }

  Stream<int> get callableFutureStream {
    return FromCallableStream(() async {
      return await Future.delayed(
        const Duration(seconds: 5),
        () => 5,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: stream1,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Stream 1"),
                    Text(snapshot.data.toString()),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            StreamBuilder(
              stream: stream2,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Stream 2"),
                    Text(snapshot.data.toString()),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            StreamBuilder(
              stream: mergeStreams,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Meregd Stream"),
                    Text(snapshot.data.toString()),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            StreamBuilder(
              stream: concatStreams,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Contact egger Stream"),
                    Text(snapshot.data.toString()),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            StreamBuilder(
              stream: forkJoinStreams,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Fork join Stream"),
                    Text(snapshot.data.toString()),
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
            StreamBuilder(
              initialData: 0,
              stream: callableFutureStream,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Future Stream"),
                    Text(snapshot.data.toString()),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
