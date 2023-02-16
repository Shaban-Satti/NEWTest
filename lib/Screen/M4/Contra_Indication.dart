// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:bnf_conversion_to_db/Models/Contra_Indicaton_Model.dart';
import 'package:bnf_conversion_to_db/Screen/M4/Details_Option_Screen.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';

class M4_ContraIndication_Screen extends StatefulWidget {
  const M4_ContraIndication_Screen({super.key});

  @override
  State<M4_ContraIndication_Screen> createState() =>
      _M4_ContraIndication_ScreenState();
}

class _M4_ContraIndication_ScreenState
    extends State<M4_ContraIndication_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(m4name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ContraIndication(m4),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<intraction>? interactions = snapshot.data;
                    return ListView.builder(
                        itemCount: interactions!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                ListTile(
                                  // onTap: (() {
                                  //   setState(() {
                                  //     medid =
                                  //         snapshot.data![index].mId.toString();
                                  //     mmname = snapshot.data![index].mName
                                  //         .toString();
                                  //   });
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const OptionScreen()));
                                  // }),
                                  title: Text(
                                      snapshot.data![index].medName.toString()),
                                  subtitle: Text(snapshot
                                      .data![index].mDiscription
                                      .toString()),
                                ),
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
