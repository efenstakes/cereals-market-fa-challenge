import 'package:cema/models/cereal.dart';
import 'package:cema/screens/detail/detail_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<String> _categories = [ 'nuts', 'fruits', 'vegetables', 'seafood' ];
  String _selectedCategory;
  
  List<Cereal> _cerealList = cerealList;

  

  @override
  void initState() {
    super.initState();
    _selectedCategory = _categories[0];
  }
  

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],

      appBar: _buildAppBar(),

      body: SafeArea(
        child: ListView(
          children: <Widget>[

            SizedBox(height: 56,),
            
            _buildInfoText(),
            
            SizedBox(height: 40,),

            _buildSearchForm(),
            
            SizedBox(height: 40,),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  
                  ..._categories.map((cat) {

                    return GestureDetector(
                      child: _buildCategory( category: cat, ),
                      onTap: () {
                        setState(()=> _selectedCategory = cat);
                      },
                    );
                  }).toList()

                ],
              ),
            ),
            
            SizedBox(height: 10,),

            _buildCerealCards(
              context: context
            ),


          ],
        ),
      ),
      
    );
  }// Widget build(BuildContext context) { .. }

  Widget _buildAppBar() {

    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 32,
        color: Colors.black87,
        onPressed: (){},
      ),
      actions: <Widget>[

        IconButton(
          icon: Icon(Icons.person),
          iconSize: 32,
          color: Colors.black87,
          onPressed: (){},
        ),

      ],
      backgroundColor: Colors.grey[50],
      elevation: 0,
    );
  }//  Widget _buildAppBar() { .. }

  Widget _buildInfoText() {

    return Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
              'Order',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2
              ),
            ),
            
            Text(
              'Healthy food can keep you fit.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
                color: Colors.grey
              ),
            ),

          ],
        ),
      );
  }// Widget _buildInfoText() { .. }

  Widget _buildSearchForm() {

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Form(
        child: 
          
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search something',
              prefixIcon: Icon(Icons.search),
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              )
            ),
          )

      ),
    );
  }// Widget _buildSearchForm() { .. }

  Widget _buildCategory({ @required String category }) {

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20, vertical: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20, vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          Text(
            category,
            style: TextStyle(
              fontSize: category == _selectedCategory ? 20 : 18,
              color: category == _selectedCategory
                      ? Colors.black54 : Colors.black38,
              fontWeight: category == _selectedCategory
                      ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
          SizedBox(height: 3,),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 9, width: 9,
              decoration: BoxDecoration(
                color: category == _selectedCategory 
                        ? Colors.black54 : Colors.black38,
                shape: BoxShape.circle
              ),
            ),
          ),

        ],
      ),
    );
  }// Widget _buildCategory({ .. }) { .. }

  Widget _buildCerealCards({ @required BuildContext context }) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          
          ..._cerealList.map((Cereal cer) {

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_)=> DetailScreen(cereal: cer)
                  )
                );
              },
              child: _buildCerealCard(
                context: context, cereal: cer
              ),
            );
          }).toList()

        ],
      ),
    );
  }// Widget _buildCerealCards({ @required BuildContext context }) { .. }

  Widget _buildCerealCard({ @required BuildContext context, @required Cereal cereal, }) {
    Size screenSize = MediaQuery.of(context).size;
    double cardHeight = screenSize.height*0.5;
    double cardWidth = screenSize.width*0.4;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Stack(
        children: <Widget>[
          
          Container(
            height: cardHeight,
            width: cardWidth,
            // color: Colors.black54,
          ),
  
          Positioned(
            top: cardHeight*0.15,
            left: 0,
            child: Container(
              height: cardHeight*0.85,
              width: cardWidth,
              decoration: BoxDecoration(
                color: Color(0xffecd3a7).withOpacity(0.2),
                borderRadius: BorderRadius.circular(160),
              ),
            ),
          ), 

          Positioned(
            top: 0,
            left: cardWidth-cardWidth*0.825,
            right: cardWidth-cardWidth*0.825,
            child: Hero(
              tag: cereal.id,
              child: Container(
                height: cardWidth*0.65,
                width: cardWidth*0.65,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(160),
                  image: DecorationImage(
                    image: AssetImage(cereal.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),  

          Positioned(
            top: cardWidth*0.65,
            left: 0,
            right: 0,
            child: Container(
              // color: Colors.black54,
              padding: EdgeInsets.only(
                left: 24, right: 24, top: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  // stars
                  Row(
                    children: <Widget>[
                      ...[1, 2, 1, 3, 5].map((_) {
                        return Icon(Icons.star, color: Colors.brown,);
                      }).toList()
                    ],
                  ),

                  SizedBox(height: 8,),

                  // country and weight
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       
                      Text(
                        cereal.country,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18
                        ),
                      ),

                      SizedBox(width: 20,),

                      Container(
                        height: 20,
                        width: 3,
                        color: Colors.black54,
                      ),

                      SizedBox(width: 20,),

                      Text(
                        '${cereal.grams}g',
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: 24,),
                  
                  // name
                  Hero(
                    tag: '${cereal.id} ${cereal.name}',
                    child: Text(
                      cereal.name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 36,),

                  // description
                  Text(
                    cereal.description,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }// Widget _buildCerealCard({ BuildContext context }) { .. }

}