import 'package:flutter/material.dart';
import 'package:startup_try_2/cart.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue.shade800,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hardik Modi',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),Text(
                    'Status : Active',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),

                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle,color: Colors.white,),
              title: Text('Profile',style: TextStyle(color: Colors.white),),
              // onTap: () => {Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CalendarPage()),
              // )},
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket,color: Colors.white,),
              title: Text('My Orders',style: TextStyle(color: Colors.white),),
              // onTap: () => {Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CalendarPage()),
              // )},
            ),
            ListTile(
              leading: Icon(Icons.favorite,color: Colors.white,),
              title: Text('Favourites',style: TextStyle(color: Colors.white),),
              // onTap: () => {Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CalendarPage()),
              // )},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart,color: Colors.white,),
              title: Text('My cart',style: TextStyle(color: Colors.white),),
              // onTap: () => {Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CalendarPage()),
              // )},
            ),
            ListTile(
              leading: Icon(Icons.help,color: Colors.white,),
              title: Text('Help',style: TextStyle(color: Colors.white),),
              // onTap: () => {Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CalendarPage()),
              // )},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app,color: Colors.white,),
              title: Text('Logout',style: TextStyle(color: Colors.white),),
              // onTap: () => {Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CalendarPage()),
              // )},
            ),
          ],
        ),
      ),
    );
  }
}