import 'package:e_esap/paginas/pagina_login.dart';
import 'package:e_esap/paginas/pagina_registo.dart';
import 'package:flutter/material.dart';

class TrocaPaginas extends StatefulWidget {
  const TrocaPaginas({super.key});

  @override
  State<TrocaPaginas> createState() => _TrocaPaginasState();
}

class _TrocaPaginasState extends State<TrocaPaginas> {

  bool mostrarPaginaDeLogin = true;

  void togglescreens() {
    setState(() {
      mostrarPaginaDeLogin = !mostrarPaginaDeLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mostrarPaginaDeLogin){
      return PaginaLogin(mostrarPaginaDeRegisto: togglescreens);
    }
    else{
      return PaginaRegisto(mostrarPaginaDeLogin: togglescreens);
    }
  }
}