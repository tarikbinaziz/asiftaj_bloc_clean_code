import 'package:asiftaj_bloc_clean_code/utils/enum.dart';
import 'package:asiftaj_bloc_clean_code/views/login/bloc/login_bloc.dart';
import 'package:asiftaj_bloc_clean_code/views/login/widgets/custom_button.dart';
import 'package:asiftaj_bloc_clean_code/views/login/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Login Screen Page
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputWidget(emailFocusNode: emailFocusNode),
              SizedBox(height: 16),
              PasswordInputWidet(passFocusNode: passwordFocusNode),
              SizedBox(height: 24),
              SubmitLoginButton(formkey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitLoginButton extends StatelessWidget {
  final GlobalKey<FormState>? formkey;
  const SubmitLoginButton({super.key, this.formkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Loading...")));
        }
        if (state.postApiStatus == PostApiStatus.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state.postApiStatus == PostApiStatus.success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) {
          return CustomButton(
            text: "Login",
            onPressed: () {
              context.read<LoginBloc>().add(const LoginSubmittedEvent());
            },
          );
        },
      ),
    );
  }
}

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextField(
          focusNode: emailFocusNode,
          hintText: "Email",
          icon: Icons.email,
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChangedEvent(value));
          },
        );
      },
    );
  }
}

class PasswordInputWidet extends StatelessWidget {
  final FocusNode passFocusNode;
  const PasswordInputWidet({super.key, required this.passFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
          focusNode: passFocusNode,
          hintText: "pass",
          icon: Icons.lock,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChangedEvent(value));
          },
        );
      },
    );
  }
}
