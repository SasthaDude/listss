import 'package:flutter/material.dart';

import 'edit.dart';

class list2 extends StatefulWidget {
  const list2({Key? key}) : super(key: key);

  @override
  State<list2> createState() => _list2State();
}

class _list2State extends State<list2> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final  abc = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350 ,
                child: TextFormField(
                  controller: username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350 ,
                child: TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(),

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350 ,
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate())
                 {
                 setState(() {
                 abc.add([username.text,password.text,email.text]);
                 username.clear();
                 password.clear();
                 email.clear();

                 });
                  }
                },
                child: Text('OK'),
              ),
            ),
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: ListView.builder(
                itemCount: abc.length,
                itemBuilder: (BuildContext con, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to another page here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(data: abc[index]),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Card(
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('')
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    setState(() {
                                      abc.remove(abc[index]);
                                    });
                                  }, icon: Icon(Icons.delete)),
                                  IconButton(
                                    onPressed: () async {
                                      double newValue = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditPage(initialValue: abc[index])),
                                      );
                                      if (newValue != null) {
                                        setState(() {
                                          abc.add([username.text,password.text,email.text]);
                                          username.text;
                                          password.text;
                                          email.text;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.edit),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      abc.sort();
                    });
                  },
                  child: Text("Sort"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      abc.sort((b, a) => a.compareTo(b));
                    });
                  },
                  child: Text('Reverse'),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        var a = abc.reduce((value, element) => value > element ? value : element);
                        return AlertDialog(
                          title: Text("MAXIMUM VALUE"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "maximum value is: $a",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Maximum"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        var a = abc.reduce((value, element) => value < element ? value : element);
                        return AlertDialog(
                          title: Text("MINIMUM VALUE"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "minimum value is: $a",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("minimum"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          List valuesLessThan5 = abc.where((value) => value < 5).toList();
                          return AlertDialog(
                            title: Text("Values Less Than 5"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Values less than 5: $valuesLessThan5",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Values Less Than 5"),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext  context) {
                            List valuesGreaterthan5 =abc.where((value) => value > 5).toList();
                            return AlertDialog(
                              title: Text('Values Greater Than 5'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Values Greater Than 5 = $valuesGreaterthan5",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                    child: Text('Close'))
                              ],
                            );
                      },
                      );

                },
                    child:Text('Values Greater Than 5'))
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final double data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Text('Selected Value: $data',style: TextStyle(fontSize: 15),),
      ),
    );
  }
}





