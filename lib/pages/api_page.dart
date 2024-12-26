import 'dart:convert';
import 'package:coversor_de_moedas/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  Future<Map<String, dynamic>> getData() async {
    const request = "https://api.hgbrasil.com/finance?key=bf82caee";
    http.Response response = await http.get(Uri.parse(request));
    // final Uri url = Uri.https('www.api.hgbrasil.com', 'finance', {'key': 'bf82caee'});
    // http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Falha ao Carregar Dados");
    }
  }

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: widget.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                        strokeWidth: 8,
                      ),
                    ),
                  ),
                  Text(
                    "Carregando Dados",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 25.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            );
          default:
            if (snapshot.hasError) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 40,),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Erro ao carregar os dados!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20.0,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return HomePage(
                dollar: snapshot.data?['results']['currencies']['USD']['buy'],
                euro: snapshot.data?['results']['currencies']['EUR']['buy'],
              );
            }
        }
      },
    );
  }
}
