// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../Api_Calling/Api_Function.dart';
import '../Models/Medicine_Model.dart';
import 'Details_Option_Screen.dart';

var medid, mmname;

class MainMedicineScreen extends StatefulWidget {
  const MainMedicineScreen({super.key});

  @override
  State<MainMedicineScreen> createState() => _MainMedicineScreenState();
}

class _MainMedicineScreenState extends State<MainMedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getMed(medid),
                builder: (context, AsyncSnapshot<List<Medicine>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: mainlst.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                onTap: (() {
                                  //  Medicine apimodel = snapshot.data![index];
                                  // medid = apimodel.mId.toString();
                                  //mmname = apimodel.sName.toString();
                                  setState(() {
                                    Medicine apimodel = snapshot.data![index];
                                    medid = apimodel.mId.toString();
                                   // print("Main Medicine Id Get" + medid);
                                    mmname = apimodel.sName.toString();
                                  });

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const OptionScreen())));
                                }),
                                title: Text(
                                    snapshot.data![index].sName.toString()),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
