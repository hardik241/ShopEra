import 'package:flutter/material.dart';
import 'package:startup_try_2/constants.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:startup_try_2/screens/details/details_screen.dart';
import 'package:startup_try_2/cart.dart';
import 'components/item_card.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  final Product product;
  final Function press;
  const HomeScreen({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        elevation: 0,
        leading: FlatButton(onPressed: (){Navigator.pop(context);},child: Icon(Icons.arrow_back, color: Colors.white,)),
        actions: <Widget>[
          Container(
            width: size.width/7,
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            onPressed: (){showSearch(context: context, delegate: DataSearch());},
              child: Icon(
              Icons.search, color: Colors.white,
              ),
            ),
          ),
          Container(
            width: size.width/7,
            //color: Colors.deepOrangeAccent,
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart(),),
                  );
              },
              child: Icon(
                Icons.shopping_cart, color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: (MediaQuery
                .of(context)
                .size
                .width)/50,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height/20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                      product: products[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          ),),
                    ),),
              ),
            ),
        ],
      ),
    );
  }
}