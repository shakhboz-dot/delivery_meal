import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam/model/favorite.dart';
import 'package:exam/screens/zoom/zoom.dart';
import 'package:exam/service/favoriteService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  SlidableController _slidableController = SlidableController();
  int son = 1;

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Favorite>>(context);

    orders.forEach((element) {
      print(element.image);
      print(element.cost);
      print(element.name1);
      print(element.index);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Favorites')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  if (orders.length != 0) {
                    return ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final item = orders[index];
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          key: Key(item.toString()),
                          controller: _slidableController,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 15.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 110.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      item.image.toString(),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                item.name1.toString(),
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                              Text(
                                                item.name2.toString(),
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              item.cost.toString(),
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.red),
                                            ),
                                            SizedBox(width: 70.0),
                                            Container(
                                              width: 50.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: Colors.red),
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 10.0),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        if (son >= 1) {
                                                          son -= 1;
                                                        }
                                                      });
                                                    },
                                                    child: Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                    "$son",
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        son += 1;
                                                      });
                                                    },
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          color: Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            IconSlideAction(
                              onTap: () {},
                              icon: Icons.archive,
                              iconWidget: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.transparent,
                            ),
                            IconSlideAction(
                              onTap: () {},
                              icon: Icons.archive,
                              iconWidget: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child:
                                    Icon(Icons.favorite, color: Colors.white),
                              ),
                              color: Colors.transparent,
                            ),
                          ],
                          secondaryActions: [
                            IconSlideAction(
                              onTap: () {},
                              icon: Icons.archive,
                              iconWidget: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child:
                                    Icon(Icons.favorite, color: Colors.white),
                              ),
                              color: Colors.transparent,
                            ),
                            IconSlideAction(
                              onTap: () {},
                              icon: Icons.archive,
                              iconWidget: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.transparent,
                            ),
                          ],
                          dismissal: SlidableDismissal(
                            child: SlidableDrawerDismissal(),
                            onDismissed: (action) async {
                              await FavoriteService()
                                  .deleteFirestore(item.index.toString());
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 150.0),
                        Center(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/home/order.png",
                                  height: 100.0,
                                  width: 100.0,
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  "No orders yet",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  "Hit the orange button down",
                                  style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.0,
                                  ),
                                ),
                                Text(
                                  "below to Create an order",
                                  style: TextStyle(
                                    color: Colors.black26,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 150.0, left: 40.0, right: 40.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Start ordering"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width, 60.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0))),
                          ),
                        )
                      ],
                    );
                  }
                } else {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}
