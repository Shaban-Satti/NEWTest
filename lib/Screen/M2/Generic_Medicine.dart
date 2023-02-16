// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:bnf_conversion_to_db/Screen/M3/Details_Option_Screen.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';
import '../../Models/Medicine_Subsectin_Model.dart';

import '../Medicine.dart';

var m2, m2name;

class M2_SubSection_Screen extends StatefulWidget {
  const M2_SubSection_Screen({super.key});

  @override
  State<M2_SubSection_Screen> createState() => _M2_SubSection_ScreenState();
}

class _M2_SubSection_ScreenState extends State<M2_SubSection_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generic Medicine',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getSubMed(m2),
                builder: (context,
                    AsyncSnapshot<List<Medicine_Subsection>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: submedlst.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: (() {
                                    setState(() {
                                      m3 = snapshot.data![index].subId
                                          .toString();
                                      m3name = snapshot.data![index].subName
                                          .toString();
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                M3_OptionScreen()));
                                  }),
                                  title: Text(
                                      snapshot.data![index].subName.toString()),
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
