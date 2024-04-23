import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  var num1 = TextEditingController();
  List contentadd = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: const Text(
          'TODO',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 12.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 6.0),
              child: TextField(
                controller: num1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.text_fields),
                    labelText: 'Enter the Text'),
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      var text = num1.text;
                      contentadd.add(text);
                      num1.clear();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contentadd = [];
                      num1.clear();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent),
                  child: Text('Clear', style: TextStyle(fontSize: 20.0)),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Today Task is',
              style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: contentadd.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    padding: EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFF0F8FF),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3.0,
                              spreadRadius: 2.0),
                        ]),
                    child: Row(
                      children: [
                        Text(
                          '• ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            contentadd[index],
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context)
                  .padding
                  .bottom, // Add bottom padding to prevent overlap with the keyboard
            ),
          ],
        ),
      ),
    );
  }
}
