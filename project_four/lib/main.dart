import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
     home: MyApp(),
  ) );
}

class MyApp extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}


// we cannot declare build method in StatefulWidget so we have to create another class and extends the state
class MyAppState extends State<MyApp>{
  int _counter = 0;

  void increaseNum(){
    setState(() {
      _counter = _counter +1;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('counter App'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text(
            'Counter Value',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => increaseNum(), 
        tooltip: 'Increament',
        child: Icon(Icons.add),),
    );
  }

}
