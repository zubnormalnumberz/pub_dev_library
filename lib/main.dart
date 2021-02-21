import 'package:flutter/material.dart';
import 'package:pub_dev_library/screens/dataScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Liquid Progress Indicator Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Download data'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// The library we hace choosen is liquid_progress_indicator (https://pub.dev/packages/liquid_progress_indicator)

// Liquid progress indicator is a variant of the classic linear or circular progress indicator based on an AnimationController

// Progress indicators are very useful when applications have to perform enormous processes such as downloading a large amount of data or performing difficult calculations

// That is the reason why we have chosen this library, because in this way the app maintains feedback with the user in a very elegant way

// In this case, when we click on a button we navigate to a screen where it automatically begins to download some "false" data (it is a set time). At the end of the process, shows the data (a poem)

// Both elements ('liquid_progress_indicator' and the text) are inside a 'Visibility' widget in a StatefulWidget. When the process ends, we change the state of the two elements to hide one and show the other
