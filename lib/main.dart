import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:third_party_modular/models/pokemon.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const PokemonPage(),
            transition: TransitionType.rightToLeft),
        ChildRoute('/second',
            child: (context, args) => const SecondPage(),
            transition: TransitionType.leftToRight),
      ];
}

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});


  Future<void> fetchApi() async {
    var url = Uri.https('pokeapi.co', '/api/v2/pokemon');
    var response =
        await http.get(url);

    var pokemonResponse = PokemonResponse.fromJson(jsonDecode(response.body));
    print(pokemonResponse);
  }

  @override
  Widget build(BuildContext context) {
    List<PokeMonModel> pokemonList = [];

    fetchApi();
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate('/second'),
          child: const Text('Navigate to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate('/'),
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
