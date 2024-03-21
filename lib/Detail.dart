import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'groceries.dart';

class DetailPage extends StatefulWidget {
  final Groceries groceries;

  DetailPage({required this.groceries});
  
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groceries.name),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.groceries.name,
              child: Image.network(
                widget.groceries.productImageUrls[0],
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Name: ${widget.groceries.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Is Favorite: ${widget.groceries.isFavorite}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
            SizedBox(height: 8),
            Text(
              widget.groceries.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Price: ${widget.groceries.price}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Stock: ${widget.groceries.stock}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Discount: ${widget.groceries.discount}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Store Name: ${widget.groceries.storeName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Product URL:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: _launchProductUrl,
              child: Text(
                widget.groceries.productUrl,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: widget.groceries.name,
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
                widget.groceries.isFavorite = _isFavorite;
              });},
            child: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
  heroTag: widget.groceries.name,
  onPressed: () async {
    final url = widget.groceries.productUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  },
  child: Icon(Icons.open_in_browser),
)
        ],
      ),
    );
  }

Future<void> _launchProductUrl() async {
  if (await canLaunch(widget.groceries.productUrl)) {
    await launch(widget.groceries.productUrl);
  } else {
    throw Exception('Could not launch ${widget.groceries.productUrl}');
  }
}

}