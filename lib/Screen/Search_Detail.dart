// ignore_for_file: unused_import, file_names, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {

  String med_name, med_company;

  String med_description, med_indications, med_side_effects, organ_name;

  DetailScreen({
    required this.organ_name,
    required this.med_name,
    required this.med_company,
    required this.med_description,
    required this.med_indications,
    required this.med_side_effects,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.med_name),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  //top: MediaQuery.of(context).size.height * .0),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .06),
                        ReUseAble(
                            title: 'Organ Name',
                            value: widget.organ_name.toString()),
                        ReUseAble(
                            title: 'Medicine  Name',
                            value: widget.med_name.toString()),
                        ReUseAble(
                            title: 'Medicine Company ',
                            value: widget.med_company.toString()),
                        ReUseAble(
                            title: 'Med_Description',
                            value: widget.med_description.toString()),
                        ReUseAble(
                            title: 'Med_Indications',
                            value: widget.med_indications.toString()),
                        ReUseAble(
                            title: 'Med_Side_effects',
                            value: widget.med_side_effects.toString()),
                        ReUseAble(
                            title: 'Med_Side_effects',
                            value: widget.med_side_effects.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ReUseAble extends StatelessWidget {
  String title, value;
  ReUseAble({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5, right: 10, left: 10),
      child: Column(
        children: [
          value == "Not given"
              ? Container()
              : ListTile(
                  title: Text(title),
                  subtitle: Text(value),
                ),
          // const SizedBox(height: 5),
          //const Divider(),
        ],
      ),
    );
  }
}
