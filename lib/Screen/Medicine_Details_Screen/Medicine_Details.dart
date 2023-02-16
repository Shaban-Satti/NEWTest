// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';
import '../../Models/Medicine_Details.Model.dart';
import '../Medicine.dart';

class MedicineDetailsScreen extends StatefulWidget {
  const MedicineDetailsScreen({super.key});

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getMedDetails(medid),
                builder:
                    (context, AsyncSnapshot<List<MedicineDetails>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: detailslst.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                Card(
                                    child: ListTile(
                                  title: Text(
                                      snapshot.data![index].medName.toString()),
                                  subtitle: Text(snapshot
                                      .data![index].medCompany
                                      .toString()),
                                )
                                ),
                                snapshot.data![index].medDescription
                                            .toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title:
                                            const Text('Medicine Description'),
                                        subtitle: Text(snapshot
                                            .data![index].medDescription
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medDose.toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title: const Text('Medicine Dose'),
                                        subtitle: Text(snapshot
                                            .data![index].medDose
                                            .toString()))
                                    : Container(),
                                snapshot.data![index].medCompany.toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title: const Text('Medicine Company'),
                                        subtitle: Text(snapshot
                                            .data![index].medCompany
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medIndications
                                            .toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title:
                                            const Text('Medicine Indication'),
                                        subtitle: Text(snapshot
                                            .data![index].medIndications
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medCautions.toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title: const Text('Medicine Cautions'),
                                        subtitle: Text(snapshot
                                            .data![index].medCautions
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medContraIndications
                                            .toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title: const Text(
                                            'Medicine ContraIndicaion'),
                                        subtitle: Text(snapshot
                                            .data![index].medContraIndications
                                            .toString()),
                                      )
                                    : Container(),
                                snapshot.data![index].medSideEffects
                                            .toString() !=
                                        'Not given'
                                    ? ListTile(
                                        title:
                                            const Text('Medicine SideEffect'),
                                        subtitle: Text(snapshot
                                            .data![index].medSideEffects
                                            .toString()),
                                      )
                                    : Container(),
                              ],
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
