import 'package:coversor_de_moedas/widgets/build_text_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.dollar, required this.euro});

  final double dollar;
  final double euro;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController realController = TextEditingController();
  final TextEditingController dollarController = TextEditingController();
  final TextEditingController euroController = TextEditingController();

  void _clearAll(){
    realController.clear();
    dollarController.clear();
    euroController.clear();
  }

  void realChanged(String text) {
    if (text.isEmpty) {
      return _clearAll();
    }

    double real = double.parse(text);
    dollarController.text = (real/widget.dollar).toStringAsFixed(2);
    euroController.text = (real/widget.euro).toStringAsFixed(2);
  }

  void dollarChanged(String text) {
    if (text.isEmpty) {
      return _clearAll();
    }

    double dollar = double.parse(text);
    realController.text = (dollar * widget.dollar).toStringAsFixed(2);
    euroController.text = (dollar * widget.dollar/widget.euro).toStringAsFixed(2);
  }

  void euroChanged(String text) {
    if (text.isEmpty) {
      return _clearAll();
    }

    double euro = double.parse(text);
    realController.text = (euro * widget.euro).toStringAsFixed(2);
    euroController.text = (euro * widget.euro/widget.dollar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("\$ Conversor \$",),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Icon(Icons.monetization_on, size: 150, color: Colors.amber,),
              ),
              BuildTextField(
                label: "Reais",
                prefix: "R\$",
                controller: realController,
                onChanged: realChanged,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BuildTextField(
                  label: "Dólares",
                  prefix: "\$",
                  controller: dollarController,
                  onChanged: dollarChanged,
                ),
                ),
              BuildTextField(
                label: "Euro",
                prefix: "€",
                controller: euroController,
                onChanged: euroChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
