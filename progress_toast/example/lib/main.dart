import 'package:example/example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_toast/progress_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ProgressToast Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  ProgressToast.loading(
                      context: context, message: 'LOADING...');
                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    ProgressToast.dismiss();
                  });
                },
                child: const Text('defalut loading')),
            TextButton(
                onPressed: () {
                  ProgressToast.loading(
                      context: context, message: 'LOADING...');
                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    ProgressToast.text(context: context, message: 'SUCCESS!!!');
                  });
                },
                child: const Text('defalut loading and text')),
            TextButton(
                onPressed: () {
                  ProgressToastStyle customStyle = const ProgressToastStyle(
                    loadingSize: 20,
                    textSize: 20,
                    toastTextColor: Colors.red,
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(50),
                  );
                  ProgressToast.loading(
                      context: context,
                      message: 'LOADING...',
                      style: customStyle);
                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    ProgressToast.text(
                        context: context,
                        message: 'SUCCESS!!!',
                        style: customStyle);
                  });
                },
                child: const Text('custom ProgressToastStyle')),
            TextButton(
                onPressed: () {
                  ProgressToast.loading(
                      context: context,
                      customWidget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          CupertinoActivityIndicator(
                              radius: 18, color: Colors.white),
                          SizedBox(height: 10),
                          Text('LOADING...',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ))
                        ],
                      ));
                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    ProgressToast.text(
                        context: context,
                        customWidget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(
                              Icons.check_circle_outline,
                              size: 36,
                              color: Colors.green,
                            ),
                            SizedBox(height: 10),
                            Text('SUCCESS!!!',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ))
                          ],
                        ));
                  });
                },
                child: const Text('custom loading and text')),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push<dynamic>(MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => const ExampleWidget(),
                  ));
                },
                child: const Text('allow back when loading')),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push<dynamic>(MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => const ExampleWidget2(),
                  ));
                },
                child: const Text('not allow back when loading')),
          ],
        ));
  }
}
