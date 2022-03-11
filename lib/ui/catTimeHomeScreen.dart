// @dart=2.9
import 'package:flutter/material.dart';

import 'package:cat_db/db/dbHelper.dart';
import 'package:cat_db/models/catPro.dart';
import 'package:cat_db/models/cattles.dart';

class CatTimeHomeScreen extends StatefulWidget {
  final CattlePro catpro;
  const CatTimeHomeScreen({
    Key key,
    this.catpro,
  }) : super(key: key);

  @override
  State<CatTimeHomeScreen> createState() => _CatTimeHomeScreenState();
}

class _CatTimeHomeScreenState extends State<CatTimeHomeScreen> {
  DBHelper dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    dbHelper = new DBHelper();
    loadData();
    super.initState();
  }

  loadData() async {
    // catProList = dbHelper.getListCattlePro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cattle DB Demo")),
        body: Column(
          children: [
            // Expanded(
            //   child: FutureBuilder(
            //       future: catProList,
            //       builder: (context, AsyncSnapshot<List<CattlePro>> snapshot) {
            //         if (snapshot.hasData) {
            //           return ListView.builder(
            //               reverse: false,
            //               shrinkWrap: true,
            //               itemCount: snapshot.data?.length,
            //               itemBuilder: (context, index) {
            //                 return InkWell(
            //                   onTap: () {},
            //                   child: Dismissible(
            //                     direction: DismissDirection.endToStart,
            //                     background: Container(
            //                         color: Colors.red,
            //                         alignment: Alignment.centerRight,
            //                         padding: const EdgeInsets.symmetric(
            //                             horizontal: 10.0),
            //                         child: Icon(Icons.delete_forever)),
            //                     onDismissed: (DismissDirection direction) {
            //                       setState(() {
            //                         dbHelper
            //                             .deleteCatPro(snapshot.data[index].id);
            //                         catProList = dbHelper.getListCattlePro();
            //                         snapshot.data.remove(snapshot.data[index]);
            //                       });
            //                     },
            //                     key: ValueKey<int>(snapshot.data[index].id),
            //                     child: Card(
            //                       child: ListTile(
            //                         contentPadding: EdgeInsets.all(16),
            //                         title: Text(
            //                             "${snapshot.data[index].name.toString()}",style: TextStyle(fontSize: 18,fontWeight:FontWeight.w500),),
            //                         subtitle: Text(
            //                             "Gender: ${snapshot.data[index].gender.toString()}\nSpecies: ${snapshot.data[index].species.toString()}"),
            //                         trailing: IconButton(
            //                           icon: Icon(Icons.edit),
            //                           onPressed: () {
            //                             dbHelper.updateCatPro(CattlePro(
            //                                 id: snapshot.data[index].id,
            //                                 name: 'cattle000',
            //                                 gender: 'female',
            //                                 species: 'chalolais'));

            //                             setState(() {
            //                               catProList =
            //                                   dbHelper.getListCattlePro();
            //                             });
            //                           },
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               });
            //         } else {
            //           return CircularProgressIndicator();
            //         }
            //       }),
            // ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dbHelper
                .insertCatTime(CattleTime(
              CPid: widget.catpro.id,
              bodyLenght: 10,
              heartGirth: 10,
              hearLenghtSide: 10,
              hearLenghtRear: 10,
              hearLenghtTop: 10,
              PixelReference: 10,
              DistanceReference: 10,
              date: DateTime.now().toString(),
            ))
                .then((value) {
              print("Add data completed");
              setState(() {
                // catProList = dbHelper.getListCattlePro();
              });
            }).onError((error, stackTrace) {
              print("Error: " + error.toString());
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
