import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora Simples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _display = '';
  double _firstOperand = 0;
  double _secondOperand = 0;
  String _operator = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == '+' || value == '-' || value == '*' || value == '/') {
        _operator = value;
        _firstOperand = double.tryParse(_display) ?? 0;
        _display = '';
      } else if (value == '=') {
        _secondOperand = double.tryParse(_display) ?? 0;
        switch (_operator) {
          case '+':
            _display = (_firstOperand + _secondOperand).toString();
            break;
          case '-':
            _display = (_firstOperand - _secondOperand).toString();
            break;
          case '*':
            _display = (_firstOperand * _secondOperand).toString();
            break;
          case '/':
            _display = (_firstOperand / _secondOperand).toString();
            break;
        }
        _operator = '';
      } else if (value == 'C') {
        _display = '';
        _operator = '';
        _firstOperand = 0;
        _secondOperand = 0;
      } else {
        _display += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _display,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          _buildButtonRow(['7', '8', '9', '/']),
          _buildButtonRow(['4', '5', '6', '*']),
          _buildButtonRow(['1', '2', '3', '-']),
          _buildButtonRow(['0', 'C', '=', '+']),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) {
        return ElevatedButton(
          onPressed: () => _onButtonPressed(button),
          child: Text(button, style: const TextStyle(fontSize: 24)),
        );
      }).toList(),
    );
  }
}
