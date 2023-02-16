// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:bnf_conversion_to_db/Models/Contra_Indicaton_Model.dart';
import 'package:bnf_conversion_to_db/Screen/M2/Generic_Medicine.dart';
import 'package:bnf_conversion_to_db/Screen/M3/Details_Option_Screen.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';

import '../Medicine.dart';

class M2_ContraIndication_Screen extends StatefulWidget {
  const M2_ContraIndication_Screen({super.key});

  @override
  State<M2_ContraIndication_Screen> createState() =>
      _M2_ContraIndication_ScreenState();
}

class _M2_ContraIndication_ScreenState extends State<M2_ContraIndication_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(m2name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ContraIndication(m2),
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
                                  onTap: (() {
                                    setState(() {
                                      m3 =
                                          snapshot.data![index].mId.toString();
                                      m3name = snapshot.data![index].mName
                                          .toString();
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const M3_OptionScreen()));
                                  }),
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
