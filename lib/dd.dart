// IconButton(onPressed: ()
// {
// setState(() {
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return  AlertDialog(
// title: Text("CHANGE VALUE :"),
// content: Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// TextField(
// controller: ss,
// decoration: InputDecoration(
// border: OutlineInputBorder(),
// ),
// ),
// ],
// ),
// actions: [
// TextButton(
// onPressed: () {
// setState(() {
// abc[index] = double.parse(ss.text);
// });
// Navigator.of(context).pop();
// ss.clear();
// },
// child: Text("ok",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
// ),
// TextButton(
// onPressed: () {
// Navigator.of(context).pop(
// );
// },
// child: Text("cancel",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
// ),
// ],
// );
// },
// );
// });
// },
// icon: Icon(Icons.edit)),