import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:intro_rocket/Model/Data/Manobra.dart';

class ManobrasView extends StatefulWidget {
  @override
  _ManobrasViewState createState() => _ManobrasViewState();
}

class _ManobrasViewState extends State<ManobrasView> {
  List<Manobra> manobras = [];
  List<String> manobrasDisponiveis = [
    'Lançamento',
    'Translação',
    'Rotação',
    'Desacoplamento',
    'Órbita',
    'Reentrada',
    'Docking',
    'Pouso'
  ];

  Widget exibirManobrasCriadas() {
    if (this.manobras.isNotEmpty) {
      return Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          itemCount: manobras.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, '');
                },
                title: Text(
                  manobras[index].getTitle(),
                  style: TextStyle(
                    color: Color(0xFF3C4F76),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF3C4F76),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
        ),
      );
    } else {
      return Text(
        'Adicione uma manobra',
        style: TextStyle(color: Colors.white, fontSize: 18),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MANOBRAS'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundHome.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            this.exibirManobrasCriadas(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              width: double.infinity,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Card(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Transform.rotate(
                                      angle: -math.pi / 2,
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Color(0xFF3C4F76),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'MANOBRAS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF3C4F76),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox()
                                ],
                              ),
                              Expanded(
                                child: ListView.separated(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: manobrasDisponiveis.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        onTap: () {
                                          Manobra m = Manobra(
                                              this.manobrasDisponiveis[index]);
                                          setState(() {
                                            this.manobras.add(m);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        title: Text(manobrasDisponiveis[index]),
                                        trailing: Icon(
                                          Icons.add,
                                          color: Color(0xFF3C4F76),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        );
                      });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Color(0xFF3C4F76),
                textColor: Colors.white,
                child: Text(
                  'ADICIONAR MANOBRA',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
