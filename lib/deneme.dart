import 'package:flutter/material.dart';

class DenemePage extends StatefulWidget {
  const DenemePage({ Key key }) : super(key: key);

  @override
  State<DenemePage> createState() => _DenemePageState();
}

class _DenemePageState extends State<DenemePage> {
  DateTime date = DateTime(11,08,2022);
  @override
  Widget build(BuildContext context) =>Scaffold (
     body :Center( child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children :[
            Text('${date.year}/${date.month}/${date.day}',
          style: TextStyle(fontSize:32 ),
          ),
          const SizedBox(height:16),
          ElevatedButton(
             child: Text('Tarih'),
             onPressed: () async{
              DateTime newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(1950),
                lastDate: DateTime(2050), );

                if (newDate==null)return;
                setState(() =>date=newDate);

             },)
          ]
     ),
        ),
  );
     
  }
