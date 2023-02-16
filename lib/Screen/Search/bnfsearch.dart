import 'package:bnf_conversion_to_db/Models/Task.dart';
import 'package:bnf_conversion_to_db/Screen/searchpage.dart';
import 'package:flutter/material.dart';

import '../../Api_Calling/Api_Function.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please select title';
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      hintText: 'Choose title',
                    ),
                    items: [
                      'Gastro-intestinal system',
                      'Musculoskeletal and joint diseases',
                      'Cardiovascular system',
                      'Ear, nose, and oropharynx',
                      'Skin',
                      'Eye',
                      'Immunological products and vaccines',
                      'Anaesthesia',
                      'Respiratory system',
                      'Central nervous system',
                      'Infections',
                      'Endocrine system',
                      'Obstetrics,urinary-tract disorders',
                      'Malignant disease and immunosuppression',
                      'Nutrition and blood'
                    ]
                        .map(
                          (e) => DropdownMenuItem(
                            child: SingleChildScrollView(
                              child: Text(
                                e.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            value: e,
                          ),
                        )
                        .toList(),
                    value: title,
                    onChanged: (String? value) {
                      title = value!;
                    },
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //   child: TextField(
            //     controller: _search,
            //     onChanged: (value) {
            //       setState(() {});
            //     },
            //     decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            //         hintText: 'Search with  Organ name',
            //         labelText: 'Organ name',
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10.0),
            //         )),
            //   ),
            // ),
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
                onChanged: (value) {
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
                    o1 = title;
                    d1 = _diseas.text.toString();
                    m1 = _med.text.toString();
                    c1 = _contra.text.toString();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewScreen()));
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
      ])),
    );
  }
}
