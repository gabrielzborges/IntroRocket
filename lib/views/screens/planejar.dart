import 'package:flutter/material.dart';

class PlanejarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PLANEJAR'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundHome.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: SizedBox(
          height: 300,
          width: 300,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/planejar/manobras');
                  },
                  padding: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color(0xFF3C4F76),
                  textColor: Colors.white,
                  child: Text(
                    'MANOBRAS',
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.white,
                  textColor: Color(0xFF3C4F76),
                  child: Text(
                    'CONFIGURAÇÕES',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
