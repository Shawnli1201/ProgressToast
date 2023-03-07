<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

ProgressToast

## Add Dependencies

add dependencies in pubspec.yaml file

```yaml
 progress_toast: ^latest
```
## Steps

simulate network request, show loading toast and hide toast.

```dart
ProgressToast.loading(
                      context: context, message: 'LOADING...');
                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    ProgressToast.dismiss();
                  });
```dart

simulate network request, show loading toast and show sucess text.

```dart
ProgressToast.loading(
                      context: context, message: 'LOADING...');
                  Future.delayed(const Duration(seconds: 3)).then((value) {
                    ProgressToast.text(context: context, message: 'SUCCESS!!!')
                  });
```dart

custom loading and text widget which you like.

```dart
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
```dart


## More Information

For more cases, please follow up the example project.

Feel free to pull request when you found issues.

Welcome to connect Email:shawnli1201@gmail.com if you have any questiones.
 

