import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

const List<String> urls = [
  "https://live.staticflickr.com/65535/50489498856_67fbe52703_b.jpg",
  "https://live.staticflickr.com/65535/50488789068_de551f0ba7_b.jpg",
  "https://live.staticflickr.com/65535/50488789118_247cc6c20a.jpg",
  "https://live.staticflickr.com/65535/50488789168_ff9f1f8809.jpg"
];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Photo Viewer',
        home: GalleryPage(title: "Image Gallery", urls: urls));
  }
}

class GalleryPage extends StatelessWidget {
  final String title;
  final List<String> urls;

  GalleryPage({this.title, this.urls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(this.title)),
        body: GridView.count(
            primary: false,
            crossAxisCount: 2,
            children: List.of(urls.map((url) => Photo(url: url)))));
  }
}

class Photo extends StatefulWidget {
  final String url;

  Photo({this.url});

  @override
  PhotoState createState() => PhotoState(url: this.url);
}

class PhotoState extends State<Photo> {
  String url;
  int index = 0;

  PhotoState({this.url});

  onTap() {
    setState(() {
      index >= urls.length - 1 ? index = 0 : index++;
    });
    url = urls[index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: GestureDetector(
          child: Image.network(url),
          onTap: onTap,
        ));
  }
}
