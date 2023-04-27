import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:haberler/HaberApi.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class Spor extends StatefulWidget {
  @override
  State<Spor> createState() => _SporState();
}

class _SporState extends State<Spor> {
  Future<Haber> haberGetir() async {
    var url = Uri.parse(
        "https://api.collectapi.com/news/getNews?country=tr&tag=sport");
    var response = await http.get(url, headers: {
      'Authorization': 'apikey 1Djuv5aGeWJbuue5aWH3bA:2suqPREUSuAyIKSZ3RrirL',
      'Content-Type': 'application/json'
    });
    return Haber.fromJson(jsonDecode(response.body));
  }

  final Uri _url = Uri.parse("www.google.com.tr");

  Future<void> _launchUrl(Uri parse) async {
    if (!await launchUrl(parse)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        color: Colors.white,
        backgroundColor: Colors.black,
        onRefresh: _handleRefresh,
        animSpeedFactor: 6,
        child: FutureBuilder(
            future: haberGetir(),
            builder: (context, AsyncSnapshot<Haber> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.result.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: GestureDetector(
                          onTap: () {
                            _launchUrl(
                                Uri.parse(snapshot.data!.result[index].url));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Card(
                              shape: BorderDirectional(
                                  bottom: BorderSide(
                                color: Colors.black12,
                                width: 1,
                              )),
                              elevation: 0,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 20),
                                    child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            snapshot.data!.result[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          snapshot.data!.result[index].source,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshot.data!.result[index].name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }
            }),
      ),
    );
  }
}
