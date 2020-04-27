import 'package:cema/models/cereal.dart';
import 'package:flutter/material.dart';



class DetailScreen extends StatefulWidget {
  final Cereal cereal;
  DetailScreen({ this.cereal });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Cereal _cereal;

  @override
  void initState() {
    super.initState();

    _cereal = widget.cereal;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xffecd3a7),
        elevation: 0,
        actions: <Widget>[

        ],
      ),

      body: SafeArea(
        child: CustomPaint(
          painter: DetailsPainter(),
          child: ListView(
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.only( 
                  left: 32, right: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    // name
                    Hero(
                      tag: '${_cereal.id} ${_cereal.name}',
                      child: Text(
                        _cereal.name,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),

                    SizedBox(height: 40,),

                    // size and weight
                    Row(
                      children: <Widget>[

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            
                            Text(
                              'SIZE',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.1,
                                color: Colors.black26
                              ),
                            ),
                            Text(
                              _cereal.size,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.1,
                              ),
                            ),

                          ],
                        ),

                        SizedBox(width: screenSize.width*0.4,),
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.1,
                                color: Colors.black26
                              ),
                            ),
                            
                            Text(
                              '${_cereal.grams}g',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.1,
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                    
                    SizedBox(height: 40,),

                    // image
                    Padding(
                      padding: EdgeInsets.only(
                        right: screenSize.width*0.08,
                      ),
                      child: Align(
                      alignment: Alignment.centerRight,
                        child: Hero(
                          tag: _cereal.id,
                          child: ClipOval(
                            child: Image(
                              height: screenSize.width*0.5,
                              width: screenSize.width*0.5,
                              fit: BoxFit.cover,
                              image: AssetImage(_cereal.image),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenSize.height*0.04,),

                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,

                      ),
                    ),
                    
                    SizedBox(height: 20,),

                    Text(
                      '${_cereal.description} ${_cereal.description}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black38,
                        letterSpacing: 0.5
                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar:
        Container(
          height: screenSize.height*0.1,
          child: Stack(
            children: <Widget>[
              
              Positioned(
                left: 0, right: 0, bottom: 0,
                child: Container(
                  height: screenSize.height*0.06,
                  decoration: BoxDecoration(
                    color: Color(0xffecd3a7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60), 
                      topRight: Radius.circular(60),
                    )
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: screenSize.width*0.1,
                right: screenSize.width*0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    
                    Container(
                      width: screenSize.width*0.3,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xffff3cf4c),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: (){},
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 26,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){},
                          ),

                        ],
                      ),
                    ),
                    
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(0xff8f583f),
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.shopping_cart,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    
                  ],
                )
              ),

            ],
          ),
        ),
      
    );
  }
}




class DetailsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Paint paint = Paint()
                   ..color = Color(0xffecd3a7)
                   ..style = PaintingStyle.fill;

    Path path = Path();
    path.lineTo(0, height*0.24);
    path.quadraticBezierTo(
      width*0.6, height*0.6, width, height*0.35,
    );
    path.lineTo(width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }// void paint(Canvas canvas, Size size) { .. }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }


}