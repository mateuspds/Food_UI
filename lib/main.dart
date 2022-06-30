// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:foodscren/models/provider.dart';
import 'package:provider/provider.dart';
import 'Routes/routes.dart';
import 'Screen/home.dart';
import 'compras.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => Listprodutos(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: Home(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.purple,
            ).copyWith(
              secondary: Colors.indigo[600],
            ),
            fontFamily: 'Georgia',
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14, fontFamily: 'Hind'),
            ),
          ),
          initialRoute: Rotas.Home,
          routes: {
            Rotas.Home: (context) => Home(),
            Rotas.Compras: (context) => Compras(),
          },

          onUnknownRoute: (error) {
            return MaterialPageRoute(builder: (ctx) {
              return Home();
            });
          },
        ),
      ),
    );
