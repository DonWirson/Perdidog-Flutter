import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/validators/login_validators.dart';
import '../../../../../core/extension/font_extension.dart';
import '../../../../../core/utils/loading_progress_indicator.dart';
import '../../bloc/authentication_bloc.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginSuccessful) {
            context.goNamed("landing");
          }
        },
        builder: (context, state) {
          if (state is LoginInProgress || state is LoginSuccessful) {
            return const LoadingProgressIndicator();
          }
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Text(
                  "Perdidog_placeholder",
                  style: Theme.of(context).textTheme.title1,
                ),
                TextFormField(
                  controller: userController,
                  validator: LoginValidators.emailValidator,
                  decoration: InputDecoration(
                    labelText: "login_username".tr(),
                    hintText: "login_username_hint".tr(),
                  ),
                ),
                TextFormField(
                  controller: passController,
                  validator: LoginValidators.passwordValidator,
                  decoration: InputDecoration(
                    labelText: "login_passwordaaaaaaaa".tr(),
                    hintText: "login_password_hint".tr(),
                  ),
                ),
                // GenericTextFormField(
                //   labelText: "login_username",
                //   hintText: "login_username_hint",
                //   textEditingController: userController,
                //   validatorFunction: LoginValidators.emailValidator,
                // ),
                // GenericTextFormField(
                //   labelText: "login_password",
                //   hintText: "login_password_hint",
                //   textEditingController: passController,
                //   isPasswordInput: true,
                //   validatorFunction: LoginValidators.passwordValidator,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    child: const Text("Login_form_validate").tr(),
                    onPressed: () => onLoginPressed(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ElevatedButton(
                    onPressed: () => context.pushNamed("register"),
                    child: const Text("missing_account").tr(),
                  ),
                ),
                TextButton(
                  onPressed: () => print("atataaaa anonimus"),
                  child: Text(
                    "anonymus_login",
                    style: Theme.of(context).textTheme.h4Hypertext,
                  ).tr(),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> onLoginPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthenticationBloc>(context).add(
        LoginStarted(
          email: userController.text.trim(),
          password: passController.text.trim(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Login_form_login_validate_failure").tr(),
        ),
      );
    }
  }
}
