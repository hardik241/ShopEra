import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/constants.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/cart.dart';
import '../details/components/rateproduct.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.blue.shade200,
      appBar: buildAppBar(context),
      body: Container(
        height: size.height,
        child: Stack(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  //left: kDefaultPaddin,
                  //right: kDefaultPaddin,
                ),
                // height: 500,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width/20,
                          ),
                          Text(
                            '${product.rating}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16.0,
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width/20,
                          ),
                          Text(
                            '${product.rating}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16.0,
                          )
                        ],
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          // fontSize: 16.0,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          // fontSize: 16.0,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          // fontSize: 16.0,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: kDefaultPaddin / 10),
                      RateProduct(product: product),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 0),
                            color: Colors.deepOrange,
                            width: MediaQuery.of(context).size.width/2,
                            child: FlatButton(
                              onPressed: (){},
                              child: Text("Buy Now",style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width/2,
                            child: FlatButton(
                              onPressed: (){},
                              child: Text("Add To Cart",style: TextStyle(
                                color: Colors.deepOrange,
                              ),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            // ProductTitleWithImage(product: product)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Product Type",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    product.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: kDefaultPaddin),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Hero(
                          tag: "${product.id}",
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: kDefaultPaddin),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Price\n"),
                            TextSpan(
                              text: "Rs. ${product.price}",
                              style: Theme.of(context).textTheme.headline.copyWith(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade200,
      elevation: 0,
      leading: FlatButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        Icon(Icons.search,color: Colors.white,),
        Container(
          width: 60,
          //color: Colors.deepOrangeAccent,
          child: FlatButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart(product: product,)),
              );
            },
            child: Icon(
              Icons.shopping_cart, color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
