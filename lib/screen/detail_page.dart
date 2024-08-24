import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange,
        title: Text("Tastee",
          style:TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: (){},
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: CircleAvatar(
                  radius: 95,
                  backgroundImage: AssetImage("images/1.png"),
                ),
              ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff3a3e3e),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Neapolitan",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text("Pizza",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.remove, size: 28,),
                          ),
                          SizedBox(width: 10,),
                          Text("1",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.add, size: 28,),
                          ),
                        ],
                      ),
                      Text("\$ 50",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      ),
                    ],
                  ),
                  Text("Description",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("You have the sweet tang from the BBQ sauce, the meaty chicken, the zesty red onion, fresh cilantro, smoky gouda, soft crust, crispy edges, and ultra cheesy mozzarella",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: (){},
                      color: Color(0xff2b2b2b),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart,
                          size: 26,
                          color: Colors.white,
                          ),
                          SizedBox(width: 10,),
                          Text("Add to Cart",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}