import 'package:flutter/material.dart';
import 'models/medicine.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final List<Medicine> _listmed = [];

  void _addMed(){
    setState(() {
      _listmed.add(Medicine(name: 'Paracetamol 500mg', quantity: 10, expiry: DateTime(2027, 10, 29),));
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: _listmed.isEmpty
      ?const Center(child: Text('Not have medicine yet!'),)
      :ListView.builder(
        itemCount: _listmed.length,
        itemBuilder: (context, index){
          final med = _listmed[index];
          return ListTile(
            title: Text(med.name),
            subtitle: Text('Quantity: ${med.quantity}'),
            trailing: Text(med.isExpired?'Expired':'Valid'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMed,
        child: const Icon(Icons.add),),
    );
  }
}