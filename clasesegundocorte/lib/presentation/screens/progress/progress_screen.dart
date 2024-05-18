import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("progresss"),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Circular Progress'),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black38,
          ),
          SizedBox(height: 20),
          Text('Progress controller'),
          SizedBox(height: 20),
          _ControllerProgress()
        ],
      ),
    );
  }
}

class _ControllerProgress extends StatefulWidget {
  const _ControllerProgress({super.key});

  @override
  State<_ControllerProgress> createState() => __ControllerProgressState();
}

class __ControllerProgressState extends State<_ControllerProgress> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(microseconds: 500), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progres = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.black87,
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: LinearProgressIndicator(
                value: progres,
              ))
            ],
          ),
        );
      },
    );
  }
}
