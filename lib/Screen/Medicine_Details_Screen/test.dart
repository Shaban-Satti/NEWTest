import 'package:bnf_conversion_to_db/Models/Contra_Indicaton_Model.dart';
import 'package:bnf_conversion_to_db/Screen/Details_Option_Screen.dart';
import 'package:bnf_conversion_to_db/Screen/Medicine.dart';
import 'package:bnf_conversion_to_db/Screen/Organs_Screen.dart';
import 'package:bnf_conversion_to_db/Screen/Search_Detail.dart';
import 'package:bnf_conversion_to_db/Screen/searchpage.dart';
import 'package:flutter/material.dart';
import '../../Api_Calling/Api_Function.dart';
import '../../Models/Organs_Model.dart';
import '../../Models/Search_Model.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  final TextEditingController _search = TextEditingController();
  final TextEditingController _diseas = TextEditingController();
  final TextEditingController _med = TextEditingController();
  final TextEditingController _contra = TextEditingController();
  final TextEditingController _age = TextEditingController();
  var title = 'Gastro-intestinal system';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: <Widget>[
        Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.only(top: 10, left: 10,right: 10),
            //   child: DropdownButtonFormField<String>(
            //     validator: (value) {
            //       if (value!.isEmpty) {
            //         return 'Please select title';
            //       }
            //     },
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.all(18),
            //       fillColor: Colors.grey.shade200,
            //       filled: true,
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(8),
            //         ),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(8),
            //         ),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(8),
            //         ),
            //       ),
            //       hintText: 'Choose title',
            //     ),
            //     items: [
            //       'Gastro-intestinal system',
            //       'Musculoskeletal and joint diseases',
            //       'Cardiovascular system',
            //       'Ear, nose, and oropharynx',
            //       'Skin',
            //       'Eye',
            //       'Immunological products and vaccines',
            //       'Anaesthesia',
            //       'Respiratory system',
            //       'Central nervous system',
            //       'Infections',
            //       'Endocrine system',
            //       'Obstetrics, gynaecology, and urinary-tract disorders',
            //       'Malignant disease and immunosuppression',
            //       'Nutrition and blood'
            //     ]
            //         .map(
            //           (e) => DropdownMenuItem(
            //             child: Text(
            //               e.toString(),
            //               style: TextStyle(color: Colors.grey),
            //             ),
            //             value: e,
            //           ),
            //         )
            //         .toList(),
            //     value: title,
            //     onChanged: (String? value) {
            //       title = value!;
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                controller: _search,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with  Organ name',
                    labelText: 'Organ name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: _diseas,
                onChanged: (v) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with  Disease',
                    labelText: 'Search with  Disease name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: _med,
                onChanged: (a) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with  Medicine',
                    labelText: 'Search with  Medicine',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                controller: _contra,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with  Contra Indication',
                    labelText: 'Search with  Contra Indication',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //   child: TextField(
            //     controller: _age,
            //     onChanged: (value) {
            //       setState(() {});
            //     },
            //     decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            //         hintText: 'Search with  Age Limit',
            //         labelText: 'Search with  Age Limit',
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         )),
            //   ),
            // ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => NewScreen()));
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: const Center(
                        child: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                  ),
                )),
          ],
        ),
        Expanded(
            child: FutureBuilder(
                future: getOrgans(),
                builder: (context, AsyncSnapshot<List<OrganModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: Orglst.length,
                      itemBuilder: (context, index) {
                        if (_search.text.isEmpty) {
                          return Container();
                        } else if (snapshot.data![index].O_name
                            .toString()
                            .toLowerCase()
                            .contains(
                                _search.text.toLowerCase().toLowerCase())) {
                          return ListTile(
                            onTap: () {
                              _search.text =
                                  snapshot.data![index].O_name.toString();
                              o1 = snapshot.data![index].O_name.toString();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrgansScreen()));
                              print(_search);
                              setState(() {});
                            },
                            title: Text("${snapshot.data![index].O_name}"),
                            // subtitle: Text(
                            //     "${snapshot.data![index].medName1}")
                          );
                        } else
                          return Container();
                      },
                    );
                  } else
                    return Container();
                })),
        Expanded(
            child: FutureBuilder<List<maintable>>(
                future: fetchMaintable(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (_diseas.text.isEmpty) {
                          return Container();
                        } else if (snapshot.data![index].dName
                            .toString()
                            .toLowerCase()
                            .contains(
                                _diseas.text.toLowerCase().toLowerCase())) {
                          return ListTile(
                            onTap: () {
                              //_diseas.text =
                              snapshot.data![index].dName.toString();
                              //d1 = snapshot.data![index].dName.toString();
                              //print(_search);
                              //_diseas.text =
                              //   snapshot.data![index].dName.toString();
                              //print(_search);
                              setState(() {});

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          organ_name: snapshot
                                              .data![index].oName
                                              .toString(),
                                          med_name: snapshot
                                              .data![index].medName
                                              .toString(),
                                          med_company: snapshot
                                              .data![index].medCompany
                                              .toString(),
                                          med_description: snapshot
                                              .data![index].medDescription
                                              .toString(),
                                          med_indications: snapshot
                                              .data![index].medIndications
                                              .toString(),
                                          med_side_effects: snapshot
                                              .data![index].medSideEffects
                                              .toString())));
                            },
                            title: Text("${snapshot.data![index].dName}"),
                            // subtitle: Text(
                            //     "${snapshot.data![index].medName1}")
                          );
                        } else
                          return Container();
                      },
                    );
                  } else
                    return Container();
                })),
        Expanded(
            child: FutureBuilder<List<maintable>>(
                future: fetchMaintable(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (_med.text.isEmpty) {
                          return Container();
                        } else if (snapshot.data![index].mName
                            .toString()
                            .toLowerCase()
                            .contains(_med.text.toLowerCase().toLowerCase())) {
                          return Visibility(
                            visible: true,
                            child: ListTile(
                              onTap: () {
                                _med.text =
                                    snapshot.data![index].mName.toString();
                                m1 = snapshot.data![index].mName.toString();
                                print(_search);
                                //_diseas.text =
                                //   snapshot.data![index].dName.toString();
                                print(_search);
                                setState(() {});

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                            organ_name: snapshot
                                                .data![index].oName
                                                .toString(),
                                            med_name: snapshot
                                                .data![index].medName
                                                .toString(),
                                            med_company: snapshot
                                                .data![index].medCompany
                                                .toString(),
                                            med_description: snapshot
                                                .data![index].medDescription
                                                .toString(),
                                            med_indications: snapshot
                                                .data![index].medIndications
                                                .toString(),
                                            med_side_effects: snapshot
                                                .data![index].medSideEffects
                                                .toString())));
                              },
                              title: Text("${snapshot.data![index].mName}"),
                              // subtitle: Text(
                              //     "${snapshot.data![index].medName1}")
                            ),
                          );
                        } else
                          return Container();
                      },
                    );
                  } else
                    return Container();
                })),
        Expanded(
          child: FutureBuilder(
              future: Interaction(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<intraction>? interactions = snapshot.data;
                  return ListView.builder(
                      itemCount: interactions!.length,
                      itemBuilder: (context, index) {
                        if (_contra.text.isEmpty) {
                          return Container();
                        } else if (snapshot.data![index].mName
                            .toString()
                            .toLowerCase()
                            .contains(
                                _contra.text.toLowerCase().toLowerCase())) {
                          return ListTile(
                            onTap: (() {
                              setState(() {
                                medid = snapshot.data![index].mId.toString();
                                mmname = snapshot.data![index].mName.toString();
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OptionScreen()));
                            }),
                            title:
                                Text(snapshot.data![index].medName.toString()),
                          );
                        } else
                          return Container();
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        )
      ])),
    );
  }
}
