import 'package:flutter/material.dart';
import 'package:haberler/Ekonomi.dart';
import 'package:haberler/Gundem.dart';
import 'package:haberler/Magazin.dart';
import 'package:haberler/Saglik.dart';
import 'package:haberler/Spor.dart';
import 'package:haberler/Teknoloji.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Bilgi"),
                          content: Text(
                              "Sayfayı yenilemek için aşağıya doğru kaydırın."),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Tamam"),
                                style:
                                    TextButton.styleFrom(primary: Colors.black))
                          ],
                        );
                      });
                },
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ))
          ],
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text('Doğru Haber', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Tab(
                //child: Text("Gündem", style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.newspaper, color: Colors.black),
              ),
              Tab(
                //child: Text("Ekonomi", style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.monetization_on, color: Colors.black),
                ),
                 Tab(
                //child: Text("Spor", style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.sports_soccer, color: Colors.black),
                ),
                Tab(
                //child: Text("Sağlık", style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.medical_services, color: Colors.black),
                ),
              Tab(
                //child: Text("Teknoloji", style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.computer, color: Colors.black),
              ),
              Tab(
                //child: Text("Magazin", style: TextStyle(color: Colors.black)),
                icon: Icon(Icons.movie, color: Colors.black),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Gundem(),
            Ekonomi(),
            Spor(),
            Saglik(),
            Teknoloji(),
            Magazin(),
          ],
        ),
      ),
    );
  }
}
