import 'package:flutter/material.dart';

class list1 extends StatefulWidget {
  const list1({super.key});

  @override
  State<list1> createState() => _list1State();
}

class _list1State extends State<list1> {
  TextEditingController ss = TextEditingController();

   final abc = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: ss,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(onPressed: (){
              setState(() {
                abc.add(double.parse(ss.text));
              });
            }, child: Text('OK')),
          ),
          Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: ListView.builder(
              itemCount: abc.length,
                itemBuilder: (BuildContext con, index)
                    {
                      return Column(
                        children: [
                          Card(
                            child: Row(
                              children: [
                                Text(abc[index].toString(),style: TextStyle(fontSize: 30),),
                              ],
                            ),
                          )
                        ],
                      );

                    }
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  abc.sort();
                });

              }, child: Text("Sort")),
              ElevatedButton(onPressed: (){
                setState(() {
                  abc.sort((b,a) => a.compareTo(b));
                });

              }, child: Text('Reverse'))

            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    var a=abc.reduce((value, element) => value > element ? value : element);
                    return  AlertDialog(
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
                onPressed:(){
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        var a=abc.reduce((value, element) => value < element ? value : element);
                        return  AlertDialog(
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
                  }
                },
                child: Text("minimum"),
              ),
            ],
          ),

        ],
          )
    );


  }
}
