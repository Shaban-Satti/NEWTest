// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables
import 'package:bnf_conversion_to_db/Screen/Task.dart';
import 'package:bnf_conversion_to_db/Screen/searchpage.dart';
import 'package:flutter/material.dart';
import '../Api_Calling/Api_Function.dart';
import '../Models/Organs_Model.dart';
import 'Disease_Screen.dart';

import 'Medicine_Details_Screen/test.dart';
import 'Search/bnfsearch.dart';
import 'Search_Screen.dart';

var id, oname;

class OrgansScreen extends StatefulWidget {
  const OrgansScreen({super.key});

  @override
  State<OrgansScreen> createState() => _OrgansScreenState();
}

class _OrgansScreenState extends State<OrgansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organs System',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => test())), //test())), //SearchPage()
              icon: const Icon(
                Icons.search,
                size: 35,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getOrgans(),
                builder: (context, AsyncSnapshot<List<OrganModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: Orglst.length,
                        itemBuilder: (context, index) {
                          return Card(
                            // elevation: 10,
                            //shadowColor: Colors.black,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                                color: Colors.white10,
                              ),
                              child: ListTile(
                                trailing: Icon(Icons.arrow_forward_ios_sharp),
                                title: Text(
                                    snapshot.data![index].O_name.toString()),
                                onTap: () {
                                  OrganModel apimodel = snapshot.data![index];
                                  id = apimodel.O_id.toString();
                                  oname = apimodel.O_name.toString();
                                  Did = id;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DiseaseScreen()));
                                },
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
