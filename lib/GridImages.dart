import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
      '/': (context) => Gridmain(),
      '/detail': (context) => GridZoom(image: ''),
    }),
  );
}

class Gridmain extends StatelessWidget {
  final List<String> _items = [
    "assets/images/alpacas.jpg",
    "assets/images/cebra.jpg",
    "assets/images/delfines.jpg",
    "assets/images/foca.jpg",
    "assets/images/lobo.jpg",
    "assets/images/mono.jpg",
    "assets/images/oveja.jpg",
    "assets/images/cabra.jpg",
    "assets/images/perezoso.jpg",
    "assets/images/rana.jpg",
    "assets/images/cerdos.jpg",
    "assets/images/tortuga.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid Principal'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return new GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GridZoom(
                      image: _items[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(_items[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class GridZoom extends StatelessWidget {
  final String image;


  GridZoom({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid con Zoom️'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ),
        ],
      ),
    );
  }
}