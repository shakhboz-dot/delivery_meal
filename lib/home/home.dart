import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/home/indexed.dart';
import 'package:exam/screens/orders/order.dart';
import 'package:exam/screens/history.dart';
import 'package:exam/screens/favorite/favoritePage.dart';
import 'package:exam/screens/profile.dart';
import 'package:exam/screens/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  ZoomDrawerController? _controller;

  Home([this._controller]);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  TabController? _controller;

  Stream<QuerySnapshot> snapshotData =
      FirebaseFirestore.instance.collection("Meal").snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 80.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            onPressed: () {
              setState(() {
                widget._controller!.open!();
              });
            },
            icon: Icon(
              Icons.sort,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Order())),
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black12,
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: snapshotData,
        builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
          if (!snap.hasData) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Delicious\nfood for you",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    width: 250.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        showCursor: true,
                        readOnly: true,
                        focusNode: AlwaysDisabledFocusNode(),
                        keyboardType: TextInputType.text,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search()));
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.black12)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: TabBar(
                    controller: _controller,
                    isScrollable: true,
                    indicatorWeight: 3.0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.red,
                    unselectedLabelColor: Colors.black12,
                    labelColor: Colors.red,
                    labelStyle: TextStyle(fontSize: 17.0),
                    tabs: [
                      Tab(
                        text: "Foods",
                      ),
                      Tab(
                        text: "Drinks",
                      ),
                      Tab(
                        text: "Snacks",
                      ),
                      Tab(
                        text: "Sauce",
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 250.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "see more",
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w400),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            padding: EdgeInsets.only(left: 60.0),
                            shrinkWrap: true,
                            itemCount: snap.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Indexed(
                                            snap.data!.docs[index], index)),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Container(
                                    width: 170.0,
                                    height:
                                        MediaQuery.of(context).size.height,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 40.0,
                                          child: Container(
                                            width: 170.0,
                                            height: 210.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 90.0,
                                          left: 0.0,
                                          right: 0.0,
                                          child: Image.network(
                                            snap.data!.docs[index]['image'],
                                            height: 185.0,
                                            width: 185.0,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 45.0,
                                          left: 45.0,
                                          child: Column(
                                            children: [
                                              Text(
                                                snap.data!.docs[index]
                                                    ['name1'],
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                              Text(
                                                snap.data!.docs[index]
                                                    ['name2'],
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                              SizedBox(height: 25.0),
                                              Text(
                                                snap.data!.docs[index]
                                                    ['number'],
                                                style: GoogleFonts.actor(
                                                  color: Colors.red,
                                                  fontSize: 12.0,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15.0,
                  ),
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        label: "",
                        icon: Icon(Icons.home_sharp),
                      ),
                      BottomNavigationBarItem(
                        label: "",
                        icon: Icon(Icons.favorite_border),
                      ),
                      BottomNavigationBarItem(
                        label: "",
                        icon: Icon(Icons.person_outline_sharp),
                      ),
                      BottomNavigationBarItem(
                        label: "",
                        icon: Icon(Icons.history),
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    unselectedIconTheme: IconThemeData(color: Colors.black26),
                    selectedIconTheme: IconThemeData(color: Colors.red),
                    elevation: 0.0,
                    type: BottomNavigationBarType.shifting,
                    onTap: (value) {
                      if (value == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoritePage()));
                      } else if (value == 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile()));
                      } else if (value == 3) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => History()));
                      }
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
