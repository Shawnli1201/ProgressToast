import 'package:flutter/material.dart';
import 'package:progress_toast/progress_toast.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  void dispose() {
    super.dispose();
    ProgressToast.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Allow Back When Loading'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  ProgressToast.loading(
                      context: context,
                      message: 'LOADING...',
                      style: const ProgressToastStyle(
                          safeAreaMinimum: EdgeInsets.only(top: 120, left: 5)));
                },
                child: const Text('show loading'))
          ],
        ));
  }
}

class ExampleWidget2 extends StatefulWidget {
  const ExampleWidget2({Key? key}) : super(key: key);

  @override
  State<ExampleWidget2> createState() => _ExampleWidget2State();
}

class _ExampleWidget2State extends State<ExampleWidget2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Not Allow Back When Loading'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  ProgressToast.loading(
                    context: context,
                    message: 'LOADING...',
                  );
                  Future.delayed(const Duration(seconds: 5)).then((value) {
                    ProgressToast.dismiss();
                  });
                },
                child: const Text('show loading'))
          ],
        ));
  }
}
