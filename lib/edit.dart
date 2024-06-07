import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final double initialValue;

  const EditPage({Key? key, required this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: initialValue.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Value'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter New Value',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double newValue = double.tryParse(controller.text) ?? initialValue;
                Navigator.pop(context, newValue);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
