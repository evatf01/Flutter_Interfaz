import 'package:flutter/material.dart';
import 'shoedata.dart';
import 'startimage.dart';
import 'poster.dart';

// import 'smallbox.dart';

class ShoeDetails extends StatelessWidget {
  final Shoes shoedata;
  final String shoename;

  const ShoeDetails({Key key, this.shoedata, this.shoename}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              this.shoename,
              style: TextStyle(
                color: Colors.black,
                fontSize: 29,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Shoetumbnail(mainposter: shoedata.images),
          Line(),
          ShoePoster(posters: shoedata.images),
          Line(),
          Text("Marca: " + shoedata.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
          Line(),
          Text("TAMAÑO",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
          //SmallBox(),
          ShoeSize(shoedata.size),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00f5f5f5), Colors.black45],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            height: 30,
          ),
        ],
      ),
    );
  }

  ShoeSize(List<int> sizes) {
    return Padding(
      padding: const EdgeInsets.only(left: 45.0),
      child: Container(
        height: 70.0,
        padding: EdgeInsets.symmetric(vertical: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: sizes.length,
          itemBuilder: (context, index) => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              padding: EdgeInsets.only(left: 2),
              width: 50.0,
              height: 25.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlue[200], width: 3.0),
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.grey[100],
              ),
              child: Text(sizes[index].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(width: 14.0),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      child: Container(
        height: 2.0,
        color: Colors.blue.shade100,
      ),
    );
  }
}
