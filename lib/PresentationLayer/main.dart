import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Login';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            ),
          ),
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 400,
          //
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'NickNme',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
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
                    width: double.infinity,
                    height: 53,
                    child: ElevatedButton(
                      // style: style,
                      onPressed: () {},
                      child: const Text('Sign in'),
                    ),
                  )),
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
    );
  }
}
