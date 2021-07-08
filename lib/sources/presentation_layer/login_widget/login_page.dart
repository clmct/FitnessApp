import 'package:fitness_app/sources/presentation_layer/login_widget/login_page_state.dart';
import 'package:fitness_app/sources/presentation_layer/news_widget/news_page.dart';
import 'package:fitness_app/sources/service_layer/news.dart';
import 'package:fitness_app/sources/service_layer/result.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/sources/service_layer/network_service.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart';

class LoginPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Login';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(213, 78, 78, 1),
              Color.fromRGBO(175, 85, 117, 1),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            centerTitle: false,
            title: Text(
              appTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: LoginWidget(),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/news': (context) => NewsPageWidget(
            // items: List<ListItem>.generate(
            //   100,
            //   (i) => i % 6 == 0 ? MessageItem('1 $i') : MessageItem('2 $i'),
            // ),
            ),
      },
    );
  }
}

class LoginWidget extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<LoginWidget> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  bool _isObscure = true;

  final LoginStore store = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Observer(
          builder: (_) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            margin: EdgeInsets.only(left: 15, right: 15),
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: TextFormField(
                    onChanged: (value) {
                      store.setUsername(value);
                    },
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'NickName',
                      errorText: store.isValidUsername
                          ? null
                          : 'NickName can\'t be empty or invalid',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: TextFormField(
                    onChanged: (value) {
                      store.setPassword(value);
                    },
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                      errorText: store.isValidPassword
                          ? null
                          : 'Password must be between 3 and 9 characters',
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 45),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(213, 78, 78, 1),
                          Color.fromRGBO(175, 85, 117, 1),
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: 53,
                    child: MaterialButton(
                      disabledColor: Colors.black12,
                      disabledElevation: 1,
                      disabledTextColor: Colors.blueGrey,
                      onPressed: () {
                        store.login();
                        if (store.isValidForm == true) {
                          Navigator.pushNamed(context, '/news');
                        }
                      },
                      child: Text('Sign in'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 40),
                  child: Text("Регистрируясь вы принимаете наши условия:"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                  child: Text(
                    "политику использования данных",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                  child: Text(
                    "политику в отношении файлов cookie",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
