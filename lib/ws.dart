import 'package:flutter/material.dart';

import 'edit.dart';

class list23 extends StatefulWidget {
  const list23({Key? key}) : super(key: key);

  @override
  State<list23> createState() => _list23State();
}

class _list23State extends State<list23> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final abc = [];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                child: TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 350,
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      abc.add({
                        'username': usernameController.text,
                        'password': passwordController.text,
                        'email': emailController.text,
                      });
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
                              Text(
                                abc[index]['username'].toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: () {
                                    setState(() {
                                      abc.remove(abc[index]);
                                    });
                                  }, icon: Icon(Icons.delete)),
                                  IconButton(
                                    onPressed: () async {
                                      Map<String, dynamic>? newValue = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => EditPage(initialValue: abc[index])),
                                      );
                                      if (newValue != null) {
                                        setState(() {
                                          abc[index] = newValue;
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
                      abc.sort((a, b) => b['username'].compareTo(a['username']));
                    });
                  },
                  child: Text('Reverse Sort'),
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
                        var a = abc.reduce((value, element) => value['username'].length > element['username'].length ? value : element);
                        return AlertDialog(
                          title: Text("LONGEST USERNAME"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Longest username is: ${a['username']}",
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
                  child: Text("Longest Username"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        var a = abc.reduce((value, element) => value['username'].length < element['username'].length ? value : element);
                        return AlertDialog(
                          title: Text("SHORTEST USERNAME"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Shortest username is: ${a['username']}",
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
                  child: Text("Shortest Username"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username: ${data['username']}'),
            Text('Password: ${data['password']}'),
            Text('Email: ${data['email']}'),
          ],
        ),
      ),
    );
  }
}
