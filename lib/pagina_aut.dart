import 'package:e_esap/paginas/pagina_inicio.dart';
import 'package:e_esap/troca_paginas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaginaAut extends StatelessWidget {
  const PaginaAut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return const PaginaInicio();
          }
          else {
            return const TrocaPaginas();
          }
        },
      ),
    );
  }
}