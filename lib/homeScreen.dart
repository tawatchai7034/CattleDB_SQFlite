// @dart=2.9
import 'package:cat_db/db/dbHelper.dart';
import 'models/catPro.dart';
import 'models/cattles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper dbHelper;
  Future<List<CattlePro>> catProList;

  @override
  void initState() {
    // TODO: implement initState
    dbHelper = new DBHelper();
    loadData();
    super.initState();
  }

  loadData() async {
    catProList = dbHelper.getListCattlePro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cattle DB Demo")),
        body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: catProList,
                builder: (context, AsyncSnapshot<List<CattlePro>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        reverse: false,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                             
                           
                            },
                            child: Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Icon(Icons.delete_forever)),
                              onDismissed: (DismissDirection direction) {
                                setState(() {
                                  
                                });
                              },
                              key: ValueKey<int>(snapshot.data[index].id),
                              child: Card(
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text(
                                      snapshot.data[index].name.toString()),
                                  subtitle: Text(snapshot.data[index].gender
                                      .toString()),
                                  trailing:
                                      Text(snapshot.data[index].species.toString()),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dbHelper
                .insertCatPro(CattlePro(
                    name:'cattle123',gender:'male', species:'barhman'))
                .then((value) {
              print("Add data completed");
              setState(() {
                catProList = dbHelper.getListCattlePro();
              });
            }).onError((error, stackTrace) {
              print("Error: " + error.toString());
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
