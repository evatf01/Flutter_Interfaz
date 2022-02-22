import 'package:flutter/material.dart';
import 'shoedata.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'shoedetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//to call the data
  final List<Shoes> shoes = Shoes.getShoes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              "Tienda",
              style: TextStyle(
                color: Colors.black,
                fontSize: 29,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              width: 100,
              height: 100,
              // alignment: Alignment.topRight,
              // alignment: Alignment.bottomRight,

              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/147/147144.png",
                    ),
                    fit: BoxFit.scaleDown,
                  )),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: shoes.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                Positioned(child: shoeCard(shoes[index], context)),
                Positioned(
                    top: 12,
                    right: 12,
                    child: shoesImage(shoes[index].images[0]))
              ],
            );
          }),
    );
  }
}

Widget shoeCard(Shoes shoeData, BuildContext context) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(right: 50),
      width: MediaQuery.of(context).size.width,
      height: 210.0,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 2.0,
          left: 10.0,
          right: 2.1,
        ),
        child: Container(
          height: 10,
          margin: EdgeInsets.only(left: 20),
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 50, right: 50, bottom: 50),
                  child: Text(
                    shoeData.brand,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 50),
                  child: Text(
                    "Precio: ${shoeData.price}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShoeDetails(
// shoedata:,.name,
                    shoename: shoeData.brand,
                    shoedata: shoeData,
                  )));
    },
  );
}

//gets the circle image

Widget shoesImage(String imageUrl) {
  return Container(
    child: AvatarGlow(
      startDelay: Duration(milliseconds: 1000),
      glowColor: Colors.lightBlue[400],
      endRadius: 100.0,
      duration: Duration(milliseconds: 1600),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 80),
      child: Material(
        elevation: 8.0,

        shape: CircleBorder(),
        child: Container(
          width: 150.0,
          height: 150.0,
          // alignment: Alignment.topRight,
          // alignment: Alignment.bottomRight,
          margin: EdgeInsets.all(8.0),

          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl ??
                      "https://logodownload.org/wp-content/uploads/2014/05/gucci-logo-2.png",
                ),
                fit: BoxFit.cover,
              )),
        ),

        // child: CircleAvatar(

        //   backgroundColor:Colors.grey[100] ,

        //   child: Image.asset('assets/images/flutter.png',height: 60,),

        //   radius: 40.0,

        // ),
      ),
      shape: BoxShape.circle,
      animate: true,
      curve: Curves.fastOutSlowIn,
    ),
  );
}
