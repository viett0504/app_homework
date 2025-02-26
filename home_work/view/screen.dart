import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomeWork2(),
//   ));
// }

class HomeWork2 extends StatefulWidget  {
  const HomeWork2 ({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomeWork2>  {
  Color _backgroundColor = Colors.white;
  int _count = 0;
  void _changCount(bool isIncrease)  {
    setState(() {
      if(isIncrease) {
        _count++;
      } else {
        _count--;
      }
    });
  }
  void _changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Example",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
            ),
            onPressed: () => _changCount(true) ,
            child: const Text(
              'Increase'
            )
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Count: $_count',
            style: const TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              onPressed: () => _changCount(false) ,
              child: const Text(
                  'Decrease',
              ),
          ),

          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ColorButton(color: Colors.green, label: "GREEN", onPressed: _changeColor),
              ColorButton(color: Colors.red, label: "RED", onPressed: _changeColor),
              ColorButton(color: Colors.orange, label: "ORANGE", onPressed: _changeColor),
              ColorButton(color: Colors.blue, label: "BLUE", onPressed: _changeColor),
            ],
          )
        ],
      ),
    );
  }
}
class ColorButton extends StatelessWidget {
  const ColorButton({super.key,  required this.color, required this.label, required this.onPressed});
  final Color color;
  final String label;
  final Function(Color) onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(100, 50)
        ),
        onPressed: () => onPressed(color),
        child: Text(label, style: TextStyle(color: Colors.white),),
    )
    );
  }
}