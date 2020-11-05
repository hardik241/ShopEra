import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';

class Cart extends StatefulWidget {

  const Cart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _CartState createState() => _CartState(this.product);
}

class _CartState extends State<Cart > {

  Product  product;
  _CartState(this.product);

  var items=[];

  void item(){
    items.add(product.title);
  }

  @override
  Widget build(BuildContext context) {
    item();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 85.0,
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blue.shade100,
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      height: 100.0,
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            alignment: Alignment.centerLeft,
                            child: Text("${items[index]}",
                              style: TextStyle(
                                color: Colors.teal.shade900,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          FlatButton(
                            splashColor: Colors.transparent,
                            onPressed: (){
                              setState(() {
                                items.remove(items[index]);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red
                              ),
                              child: Icon(Icons.remove,color: Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: items.length,
              ),
            ),
          ],
        ),
    );
  }
}
