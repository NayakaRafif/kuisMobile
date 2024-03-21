import 'package:untitled1/groceries.dart';
import 'Detail.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Groceries> groceriesList = groceryList;
    return Scaffold(
      appBar: AppBar(
        title: Text("KUIS TPM IF-E"),
        backgroundColor: Colors.green[400],
        
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      groceries: groceriesList[index],
                    ),
                  ));
            },
            child: Card(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.network(groceriesList[index].productImageUrls[0]),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            groceriesList[index].name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            groceriesList[index].price,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            groceriesList[index].discount,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: groceriesList.length,
      ),
    );
  }
}