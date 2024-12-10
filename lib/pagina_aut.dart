import 'package:e_esap/pagina_inicio.dart';
import 'package:e_esap/paginas/pagina_login.dart';
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
          //utilizador logado
          if (snapshot.hasData) {
            return const PaginaInicio();
          }
  
          //utilizador não está logado
          else {
            return const PaginaLogin();
          }
        },
      ),
    );
  }
}