import 'package:flutter/material.dart';
class buttons extends StatelessWidget {
  const buttons({
    Key key,
    @required this.size,
    @required this.page,
    @required this.title,
    
  }) : super(key: key);

  final Size size;
  final page;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFeeeee0),
        border: Border.all(width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.50),
            blurRadius: 20,
            offset: Offset(0, 4),
          )
        ],
      ),
      width: size.width * 0.70,
      height: size.height * 0.08,
      child: TextButton(
          onPressed: () => Navigator.pushReplacement(
                //Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              ),
          child:
              Text(title, style: TextStyle(fontSize: 20, color: Colors.black))),
    );
  }
}