// ignore_for_file: use_build_context_synchronously

import 'package:e_esap/componentes/meu_botao_registar.dart';
import 'package:e_esap/componentes/meu_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PaginaRegisto extends StatefulWidget {
  final VoidCallback mostrarPaginaDeLogin;
  const PaginaRegisto({super.key, required this.mostrarPaginaDeLogin});

  @override
  State<PaginaRegisto> createState() => _PaginaRegistoState();
}

class _PaginaRegistoState extends State<PaginaRegisto> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confimarpasswordController = TextEditingController();

  bool ispasswordHidden = true;

  void registar() async {
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Validar o e-mail
    if (!validaremail(emailController.text)) {
      Navigator.pop(context);
      mostrarMensagemErroEmail();
      return;
    }

    // Validar a confirmação da palavra-passe
    if (!passwordConfirmada()) {
      Navigator.pop(context); // Fechar o diálogo
      mostrarMensagemErroPassword();
      return;
    }

    // Tentar criar o utilizador no Firebase
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
      mostrarMensagemSucesso();
    } catch (e) {
      Navigator.pop(context);
      mostrarMensagemErro();
    }
  }

  bool validaremail(String email) {
    return email.endsWith('@esap.edu.pt');
  }

  bool passwordConfirmada() {
    return passwordController.text == confimarpasswordController.text;
  }

  void mostrarMensagemSucesso() {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Text('Utilizador registado com sucesso!'),
        );
      },
    );
  }

  void mostrarMensagemErro() {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Text('Erro ao registar o utilizador!'),
        );
      },
    );
  }

  void mostrarMensagemErroEmail() {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Text('Email não termina com "@esap.edu.pt".'),
        );
      },
    );
  }

  void mostrarMensagemErroPassword() {
    showDialog(
      context: context, 
      builder: (context) {
        return const AlertDialog(
          title: Text('As Palavras-Passes não coincidem!'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                
                const SizedBox(height: 25),
                //logo
                Image.asset("imagens/LogoESAP.png", width: 300),

                const SizedBox(height: 100),
                
                //texto a dizer "Bem-vindo(a)"
                Text(
                  "Para se registar preencha os campos abaixo!",
                  style: TextStyle(color: Colors.grey[700],
                  fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                //utilizador
                MeuTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                //password
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: ispasswordHidden,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Palavra-Passe',
                    ),
                  ),
                ),

                //confimar password
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: confimarpasswordController,
                    obscureText: ispasswordHidden,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Confimar Palavra-Passe',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            ispasswordHidden = !ispasswordHidden;
                          });
                        },
                        icon: Icon(ispasswordHidden ? Icons.visibility_off : Icons.visibility),
                      )
                    ),
                  ),
                ),
                
                const SizedBox(height: 25),

                //Botão de Entrar
                MeuBotaoRegistar(
                  onTap: registar,
                ),

                const SizedBox(height: 10),

                //Já tem conta? Crie aqui
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Já tem conta?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.mostrarPaginaDeLogin,
                        child: const Text(
                          'Clique aqui',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,  
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}