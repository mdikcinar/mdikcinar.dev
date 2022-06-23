import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('mailto:mustafaalidikcinar@hotmail.com');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/png/mad-designer.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Web site is under construction', style: Theme.of(context).textTheme.headline4),
                      InkWell(
                          onTap: () {
                            try {
                              launchUrl(_url);
                            } catch (e) {
                              throw Exception(e);
                            }
                          },
                          child:
                              Text('Contact me: mustafaalidikcinar@hotmail.com', style: Theme.of(context).textTheme.headline6)),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
