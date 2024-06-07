import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:list0/ed.dart';

class newList extends StatefulWidget {
  const newList({super.key});

  @override
  State<newList> createState() => _newListState();
}

class _newListState extends State<newList> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  List<List<String>> abc = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "User name",
                  ),
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phonenumber,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Phone number"),
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        abc.add([username.text, password.text, phonenumber.text]);
                        username.clear();
                        password.clear();
                        phonenumber.clear();
                      });
                    }
                  },
                  child: Text(" Submit"),
                ),
              ),
              Container(
                height: 500,
                width: 400,
                child: ListView.builder(
                  itemCount: abc.length,
                  itemBuilder: (context, index) => Column(
                    children: abc.map((item) {
                      return GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => editList(
                                name: item[0],
                                pass: item[1],
                                phone: item[2],
                              ),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              final index =
                              abc.indexWhere((element) => element == item);
                              abc[index] = result;
                            });
                          }
                        },
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name: ${item[0]}",
                                      style: TextStyle(fontSize: 20)),
                                  Text("Password: ${item[1]}",
                                      style: TextStyle(fontSize: 20)),
                                  Text("Phone: ${item[2]}",
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {

                                          abc.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.delete)),
                                  GestureDetector(
                                    child: Icon(Icons.edit),
                                    onTap: () async {
                                      final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => editList(
                                            name: item[0],
                                            pass: item[1],
                                            phone: item[2],
                                          ),
                                        ),
                                      );
                                      if (result != null) {
                                        setState(() {
                                          final index = abc.indexWhere(
                                                  (element) => element == item);
                                          abc[index] = result;
                                        });
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
