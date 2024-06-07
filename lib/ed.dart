import 'package:flutter/material.dart';

class editList extends StatefulWidget {
  final String name;
  final  String pass;
  final String phone;

  const editList({
    Key? key,
    required this.name,
    required this.pass,
    required this.phone,
  }) : super(key: key);

  @override
  State<editList> createState() => _editListState();
}

class _editListState extends State<editList> {

  TextEditingController name2 = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  TextEditingController phone2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    name2 = TextEditingController(text: widget.name);
    pass2 = TextEditingController(text: widget.pass);
    phone2 = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pass2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phone2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Phone Number",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.pop(context, [name2.text, pass2.text, phone2.text]);
            },
              child: Text("OK"),
            ),
          ),
        ],
      ),
    );
    // Text(widget.data!);
  }
}

