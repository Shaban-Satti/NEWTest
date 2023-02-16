// ignore_for_file: file_names, unused_import, camel_case_types
import 'package:bnf_conversion_to_db/Models/Contra_Indicaton_Model.dart';
import 'package:bnf_conversion_to_db/Screen/M1/Details_Option_Screen.dart';
import 'package:bnf_conversion_to_db/Screen/M2/Details_Option_Screen.dart';
import 'package:bnf_conversion_to_db/Screen/M2/Generic_Medicine.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';

class M1_ContraIndication_Screen extends StatefulWidget {
  const M1_ContraIndication_Screen({super.key});

  @override
  State<M1_ContraIndication_Screen> createState() =>
      _M1_ContraIndication_ScreenState();
}

class _M1_ContraIndication_ScreenState
    extends State<M1_ContraIndication_Screen> {
  @override
  Widget build(BuildContext context) {
   // print('m1111111111111111111111111111' + m1);
    return Scaffold(
      appBar: AppBar(
        title: Text(m1name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ContraIndication(m1),
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
                                      m2 = snapshot.data![index].mId.toString();
                                      m2name = snapshot.data![index].mName
                                          .toString();
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const M2_OptionScreen()));
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
