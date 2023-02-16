// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Api_Calling/Api_Function.dart';
import '../Models/Search_Model.dart';
import 'Search_Detail.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    setState(() {
      _searchTerm = _searchController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with  name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  )),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<maintable>>(
                future: fetchMaintable(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // Filter the list based on the search term

                    List<maintable> filteredList = snapshot.data!
                        .where((maintable) => maintable.medName!
                            .toLowerCase()
                            .contains(_searchTerm.toLowerCase()))
                        .toList();

                    return ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              organ_name: filteredList[index]
                                                  .oName
                                                  .toString(),
                                              med_name: filteredList[index]
                                                  .medName
                                                  .toString(),
                                              med_company: filteredList[index]
                                                  .medCompany
                                                  .toString(),
                                              med_description:
                                                  filteredList[index]
                                                      .medDescription
                                                      .toString(),
                                              med_indications:
                                                  filteredList[index]
                                                      .medIndications
                                                      .toString(),
                                              med_side_effects:
                                                  filteredList[index]
                                                      .medSideEffects
                                                      .toString())));
                                },
                                title: Text("${filteredList[index].medName}"),
                                subtitle:
                                    Text("${filteredList[index].medName1}")),

                            // and so on for the rest of the fields
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }),
          ),
        ]),
      ),
    );
  }
}
