// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../Api_Calling/Api_Function.dart';
import '../Models/Injection_Level4.dart';
import 'Diseases_Class_Screen.dart';
import 'Medicine.dart';

var mid;
var medi;

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dcname,
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getMedicine(mid),
                builder:
                    (context, AsyncSnapshot<List<MedicineModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: medicinelst.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                MedicineModel apimodel = snapshot.data![index];
                                medi = apimodel.mId.toString();
                                medid = medi;
                              //  print('Medicine ID====' + medid);
                                getMed(medid).then((result) {
                                  if (result != null && result.length > 0) {
                                    // Navigate to the next screen if the result is not empty
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MainMedicineScreen(),
                                      ),
                                    );
                                  } else {}
                                });
                              },
                              title:
                                  Text(snapshot.data![index].mName.toString()),
                              subtitle: Text(snapshot.data![index].mDescription
                                  .toString()),
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
