import 'package:flutter/material.dart';
import 'package:flutter_grocery_app_ui/widgets/drawer_navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_grocery_app_ui/widgets/categories_tile.dart';
import 'package:flutter_grocery_app_ui/widgets/top_product_tile.dart';

class GroceriesPageScreen extends StatefulWidget {
  @override
  _GroceriesPageScreenState createState() => _GroceriesPageScreenState();
}

class _GroceriesPageScreenState extends State<GroceriesPageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.gripLines),
          onPressed: () {
            _scaffoldState.currentState.openDrawer();
          },
          color: Colors.grey,
          tooltip: 'Menu',
        ),
        actions: _buildActions(),
      ),
      drawer: DrawerNavigator(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/banner.png',
                ),
              ),
              _buildCategories(),
              _buildTopProducts(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildActions() => <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: Colors.grey,
          tooltip: 'Search',
        ),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.shoppingBasket,
            size: 20,
          ),
          onPressed: () {},
          color: Colors.grey,
          tooltip: 'Cart',
        )
      ];

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Categories',
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _ExploreAllButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildCategoriesList()
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CategoriesTile(
          assetPath: 'assets/images/bread.png',
          color: Color(0xffFCE8A8),
          title: 'Bakery',
        ),
        CategoriesTile(
          assetPath: 'assets/images/apple.png',
          color: Color(0xffDFECF8),
          title: 'Fruits',
        ),
        CategoriesTile(
          assetPath: 'assets/images/vegetable.png',
          color: Color(0xffE2F3C2),
          title: 'Vegetables',
        ),
        CategoriesTile(
          assetPath: 'assets/images/milk.png',
          color: Color(0xffFFDBC5),
          title: 'Drinks',
        ),
      ],
    );
  }

  Widget _buildTopProducts() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Top Products',
                  style: GoogleFonts.varelaRound(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _ExploreAllButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildTopProductsList()
        ],
      ),
    );
  }

  Widget _buildTopProductsList() {
    List topProductList = [
      TopProductTile(
        assetPath: 'assets/images/kiwi.png',
        color: Color(0xffDFECF8),
        price: '\$2.25',
        title: 'Kiwi Fruit',
      ),
      TopProductTile(
        color: Color(0xffF4DEF8),
        assetPath: 'assets/images/summer.png',
        title: 'Watermelon',
        price: '\$1.50',
      ),
      TopProductTile(
        color: Color(0xffFFF2C5),
        assetPath: 'assets/images/strawberry.png',
        title: 'Strawberry',
        price: '\$3.50',
      ),
    ];

    return Column(
      children: <Widget>[
        Container(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => topProductList[index],
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemCount: topProductList.length,
          ),
        )
      ],
    );
  }
}

class _ExploreAllButton extends StatelessWidget {
  final Function onTap;
  const _ExploreAllButton({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xffE0E6EE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Text(
          'Explore All',
          style: GoogleFonts.varelaRound(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700]),
        ),
      ),
    );
  }
}
