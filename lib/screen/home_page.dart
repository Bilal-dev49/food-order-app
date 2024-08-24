import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  Widget categoriesCointainer({@required String ? image, @required String? name}){
    return  Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image!)
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        SizedBox(height:10 ,),
        Text(name!,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buttonContainer({@required String ? image,
    @required String? name,
    @required int? price}){
    return Container(
      height: 250,
      width: 220,
      decoration: BoxDecoration(
        color: Color(0xff3a3e3e),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 58,
            backgroundImage: AssetImage(image!),
          ),
          ListTile(
            leading: Text(name!,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            trailing: Text("\$ $price",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

          Padding(padding: const EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.white, size: 20,),
                Icon(Icons.star, color: Colors.white, size: 20,),
                Icon(Icons.star, color: Colors.white, size: 20,),
                Icon(Icons.star, color: Colors.white, size: 20,),
                Icon(Icons.star, color: Colors.white, size: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem({@required IconData ? icon, @required String? name }){
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
      title: Text(name!,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext Context){
    return Scaffold(
      drawer: Drawer(
        child:Container(
          color: Colors.black87,
          child:  SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/background.jpg"),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/profile.jpg") ,
                  ),
                  accountName: Text("Bilal Ahmed",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text("bilal32049@iqraisb.edu.pk",
                    style: TextStyle(
                      fontSize: 16.5,
                    ),
                  ),
                ),
                drawerItem(icon: Icons.person_outline, name: "Profile"),
                drawerItem(icon: Icons.shopping_cart_checkout_sharp, name: "My Cart"),
                drawerItem(icon: Icons.shop_outlined, name: "Order"),
                drawerItem(icon: Icons.info_outline_rounded, name: "About"),
                Divider(
                  thickness: 2,
                  color: Colors.white70,
                ),
               ListTile(
                 leading:  Text("Communicate",
                   style: TextStyle(
                     fontSize: 19,
                     color: Colors.white70,
                   ),
                 ),
               ),
                drawerItem(icon: Icons.lock_outline, name: "Change Password"),
                drawerItem(icon: Icons.exit_to_app, name: "Logout"),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Tastee",
          style:TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal
          ),
        ),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/profile.jpg"),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                  hintText: "Search food",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  prefixIcon: Icon(Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: Color(0xff3a3e3e),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoriesCointainer(
                    image: 'images/1.png',
                    name: "All",
                  ),
                  categoriesCointainer(
                    image: 'images/b3.png',
                    name: "Burger",
                  ),
                  categoriesCointainer(
                    image: 'images/3.png',
                    name: "Recipe",
                  ),
                  categoriesCointainer(
                    image: 'images/4.png',
                    name: "Pizza",
                  ),
                  categoriesCointainer(
                    image: 'images/5.png',
                    name: "Drink",
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  buttonContainer(
                    image: 'images/2.png',
                    name: "Burger",
                    price: 10,
                  ),
                  buttonContainer(
                    image: 'images/6.png',
                    name: "BBQ Pizza",
                    price: 15,
                  ),
                  buttonContainer(
                    image: 'images/9.png',
                    name: "Smoky Pizza",
                    price: 17,
                  ),
                  buttonContainer(
                    image: 'images/8.png',
                    name: "Italian Pizza",
                    price: 20,
                  ),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}