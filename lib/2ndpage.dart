import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class imam extends StatefulWidget {
  const imam({Key? key}) : super(key: key);

  @override
  _imamState createState() => _imamState();
}

class _imamState extends State<imam> {

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }


  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffe House'),
        actions: [
          PopupMenuButton(
              onSelected: (val){
                switch(val){
                  case 'home':

                   break;

                  case 'rating':

                    break;

                  case 'maccoffe':

                    break;

                  case 'kfc':
                    _launchInBrowser("https://kfcbd.com/");

                    break;
                   case 'rubelpoint':
                     _makePhoneCall("01884585755");
                    break;


                }
              },
              itemBuilder: (BuildContext context) {
              return [
              PopupMenuItem(
                child: Text('Home'),
                value: 'home',
              ),
              PopupMenuItem(
                child: Text('Rating'),
                value: 'rating'
              ),
              PopupMenuItem(
                child: Text('MacCoffe'),
                value: 'maccoffe',
              ),
              PopupMenuItem(
                child: Text('Kfc'),
                value: 'kfc',
              ),
              PopupMenuItem(
                child: Text('Call to RubelPoint'),
                value: 'rubelpoint',
              ),

            ];
          })
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
              items: [
                Card(
                  elevation: 5,
                  child: Center(
                      child: Text(
                    'Zisan the superStar',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Card(
                    elevation: 5,
                    child: Center(
                      child: Text('Imam the superStar',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    )),
                Card(
                  elevation: 5,
                  child: Center(
                      child: Text('Ishak the superStar',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))),
                ),
                Card(
                  elevation: 5,
                  child: Center(
                      child: Text('Sneha the superStar',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))),
                ),
                Card(
                  elevation: 5,
                  child: Center(
                      child: Text('jisan2 the superStar',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))),
                ),
              ],
              options: CarouselOptions(
                height: 300,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ))
        ],
      ),
    );
  }
  getNews()async{
    var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2021-11-29&sortBy=publishedAt&apiKey=79767cd4e7e248c8ae67eab27b525e1e"));

    var jsonData = jsonDecode(response.body);
    print(jsonData.statusCode);
    print(jsonData.body);

  }
}
