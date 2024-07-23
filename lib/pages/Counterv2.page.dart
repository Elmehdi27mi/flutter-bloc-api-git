import 'package:flutter/material.dart';

class CounterPagev2 extends StatefulWidget {
  const CounterPagev2({super.key});

  @override
  State<CounterPagev2> createState() => _CounterPagev2State();
}

class _CounterPagev2State extends State<CounterPagev2> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Statefull"),
      ),
      body: Center(
        child: Text("Counter =>$counter"),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  --counter;
                });
              }),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  ++counter;
                });
              }),
        ],
      ),
    );
  }
}
