import 'dart:html';

import 'package:flutter/material.dart';
import 'package:whatsappweb/uteis/paleta_cores.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerNome = TextEditingController(text: "");
  TextEditingController _controllerEmail = TextEditingController(text: "");
  TextEditingController _controllerSenha = TextEditingController(text: "");
  bool _cadastroUsuario = false;


  @override
  Widget build(BuildContext context) {

    double alturaTela = MediaQuery.of(context).size.height;
    double LarguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: PaletaCores.colorBackground,
        height: alturaTela,
        width: LarguraTela,

          //Stack cor verde na página de login ocupando 50% da tela
          child: Stack(
            children: [
              Positioned(
                child: Container(
                    height: alturaTela * 0.5,
                    width: LarguraTela,
                    color: PaletaCores.colorPrimaria,
                ),
              ),

              //card central
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10)
                        ),
                      ),

                      //Conteudo do card
                      child: Container(
                        padding: EdgeInsets.all(40),
                        //height: 400,
                        width: 500,
                          child: Column(
                            children: [
                              
                              //Imagem perfil com botão
                              Visibility(
                                visible: _cadastroUsuario,
                                child: ClipOval(
                                  child: Image.asset(
                                    "imagens/perfil.png",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              
                              //botão de adicionar foto
                              Visibility(
                                visible: _cadastroUsuario,
                                child: OutlinedButton(
                                  child: Text("Selecionar Foto"),
                                  onPressed: (){},
                                  ),
                              ),
                              
                              SizedBox(height: 8),

                              //Caixa de texto nome
                              Visibility(
                                visible: _cadastroUsuario,
                                child: TextField(
                                keyboardType: TextInputType.text,
                                controller: _controllerNome,
                                decoration: InputDecoration(
                                  hintText: "Nome",
                                  labelText: "Nome",
                                  suffixIcon: Icon(Icons.person_outline),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              //Input de email
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _controllerEmail,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  labelText: "Email",
                                  suffixIcon: Icon(Icons.mail_outline),
                                ),
                              ),

                              SizedBox(height: 8),

                               //Input de password
                              TextField(
                                keyboardType: TextInputType.text,
                                controller: _controllerSenha,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  labelText: "Password",
                                  suffixIcon: Icon(Icons.lock_outlined),
                                ),
                              ),

                              SizedBox(height: 20),

                              //Botão Login
                              Container(
                                width: double.infinity, 
                                child: ElevatedButton(
                                  onPressed: (){}, 
                                  style: ElevatedButton.styleFrom(
                                    primary: PaletaCores.colorPrimaria,  
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(_cadastroUsuario ? "Cadastro": "Login"),
                                  )
                                ),
                              ),
                              
                              //switch login e cadastro
                              Row(
                                children: [
                                  Text("Login"),
                                  Switch(
                                    value: _cadastroUsuario, 
                                    onChanged:(bool valor){
                                      setState(() {
                                        _cadastroUsuario = valor;

                                      });
                                    },
                                  ),
                                  Text("Cadastro"),
                                ],
                              ),
                            ],
                          ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}