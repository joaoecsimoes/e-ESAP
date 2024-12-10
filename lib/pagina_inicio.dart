import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

//método para dar logout
  void sair() {
    FirebaseAuth.instance.signOut();
  } 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: sair, 
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(child: Text("Logado")),
    );
  }
}