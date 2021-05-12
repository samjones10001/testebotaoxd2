import 'package:flutter/material.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Botão XD',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Teste Botão XD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool statusBotao = true;
  bool statusBotao2 = false;

  void _Pressionado(TapDownDetails tapDownDetails) async {
    setState(() {
      statusBotao = false;
      statusBotao2 = true;
    });
  }

  void _Solta(TapUpDetails tapUpDetails) async {
    setState(() {
      statusBotao = true;
      statusBotao2 = false;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Testando Novos Controles'),
      ),
      backgroundColor: Colors.grey[800] ,
      body:Center(
        child: Container(
          child: GestureDetector(
            onTapUp: _Solta,
            onTapDown: _Pressionado,
            child: Column(
              children: [
                Visibility(
                  visible: statusBotao,
                  child:Image(
                    image: AssetImage('Assets/drawable-hdpi/Grupo_39.png'),
                  ),
                ),
                Visibility(
                  visible: statusBotao2,
                  child: Image(
                    image: AssetImage('Assets/drawable-hdpi/Grupo_51.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
