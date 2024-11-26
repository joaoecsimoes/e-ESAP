import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaLogin extends StatelessWidget {
  const PaginaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Image(
          image: AssetImage("imagens/LogoESAP.png"),
          width: 140,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent, 
              Colors.lightBlueAccent
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text("Preencha os campos abaixo com os seus dados de acesso.", 
            style: TextStyle(color: Colors.white,
            ),
            ),
            const SizedBox(height: 30),
            const CupertinoTextField(
              cursorColor: Colors.lightBlueAccent,
              padding: EdgeInsets.all(15),
              placeholder: "Utilizador",
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
              ),),
            ),
            const SizedBox(height: 5),
            const CupertinoTextField(
              cursorColor: Colors.lightBlueAccent,
              padding: EdgeInsets.all(15),
              placeholder: "Senha",
              obscureText: true,
              placeholderStyle: TextStyle(color: Colors.white70, fontSize: 14),
              style: TextStyle(color: Colors.white, fontSize: 14),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
              ),),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: Colors.white70,
                child: const Text("Entrar", 
                style: TextStyle(
                  color: Colors.lightBlueAccent, 
                  fontSize: 14, 
                  fontWeight: FontWeight.w600),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}