import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:perros_sos/blocs/Authentication/authentication_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Form(
        key: _formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 100, child: Text("User")),
                Expanded(
                  child: TextFormField(
                    controller: userController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Usuario no puede estar vacio';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const SizedBox(width: 100, child: Text("Password")),
                Expanded(
                  child: TextFormField(
                    controller: passController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Usuario no puede estar vacio';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text("Validar..."),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    RegisterStarted(
                      username: userController.text.trim(),
                      password: passController.text.trim(),
                    ),
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "LLene los valores de forma correcta",
                      timeInSecForIosWeb: 4,
                      textColor: Colors.white);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}