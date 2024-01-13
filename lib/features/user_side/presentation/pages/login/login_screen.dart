import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management_user/config/routes/app_routes.dart';
import 'package:hr_management_user/config/size/size.dart';
import 'package:hr_management_user/core/navigator_services/navigator_services.dart';
import 'package:hr_management_user/core/utils/screen_controllers/screen_controllers.dart';
import 'package:hr_management_user/features/user_side/application/login/login_bloc.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/login/widgets/login_email_textformfield.dart';
import 'package:hr_management_user/features/user_side/presentation/pages/login/widgets/login_password_textformfield.dart';
import 'package:hr_management_user/features/user_side/presentation/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            SizedBox(
              height: mWidth! * .85,
              child: Center(
                child: Icon(
                  Icons.token,
                  size: mWidth! * .2,
                ),
              ),
            ),
            TextWidget(
              textValue: "Welcome to Naro Tech.",
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            fHight10,
            TextWidget(
              textValue:
                  "Empowering Tomorrow, Today. Naro Tech - Innovate, Transform, Thrive.",
              fontColors: Colors.grey,
              fontSize: 16,
            ),
            Form(
              key: LoginControlls.formkey,
              child: Column(
                children: [
                  const LoginEmailTextFormField(),
                  LoginPasswordTextFormField(),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: const Size.fromHeight(55),
              ),
              onPressed: () {
                if (LoginControlls.formkey.currentState!.validate()) {
                  context.read<LoginBloc>().add(
                        LoginButtonClickEvent(
                          email: LoginControlls.emailControllers.text.trim(),
                          password:
                              LoginControlls.passwordControllers.text.trim(),
                        ),
                      );
                }
              },
              child: BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    NavigatorService.pushNamedAndRemoveUntil(
                        AppRoutes.dashBoardScreen);
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoadignState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return TextWidget(
                        textValue: "Login",
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontColors: Colors.white);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
