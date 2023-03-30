import 'package:flutter/material.dart';
import 'package:space/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  late FToast fToast;
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isShowPasswordError = false;
  bool isRememberMe = false;
  bool isLoading = false;
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          emailInput(),
          passwordInput(),
          rememberCheckbox(),
          loginButton(),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              child: Text(
                'OR',
                style:
                    greyTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
            ),
          ),
          loginWithGoogleButton(),
          registerButton(),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(top: 84),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login to your\naccount',
            style:
                blackAccentTextStyle.copyWith(fontSize: 24, fontWeight: bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 87,
                height: 4,
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kBlackColor,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Container(
                width: 8,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kBlackColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteGreyColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration.collapsed(
            hintText: 'Email',
            hintStyle: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            )),
      ),
    );
  }

  Widget passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 32),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kWhiteGreyColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Password',
                        hintStyle: greyTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: Icon(
                    isPasswordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: kGreyColor,
                  ),
                ),
              ],
            )),
        if (isShowPasswordError)
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              'Password kamu salah',
              style: redTextStyle,
            ),
          )
      ],
    );
  }

  Widget rememberCheckbox() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
                value: isRememberMe,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            'Remember me',
            style: blackTextStyle.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.only(top: 32),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: kBlackColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14))),
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (passwordController.text != 'qweqwe') {
              setState(() {
                isShowPasswordError = true;
              });
              fToast.showToast(
                  child: errorToast(),
                  toastDuration: const Duration(seconds: 2));
            } else {
              setState(() {
                isShowPasswordError = false;
              });
              Navigator.pushNamed(context, '/home');
            }
          });
        },
        child: isLoading
            ? CircularProgressIndicator(
                color: kWhiteColor,
                backgroundColor: kGreyColor,
              )
            : Text(
                'Login',
                style:
                    whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
      ),
    );
  }

  Widget loginWithGoogleButton() {
    return Container(
      width: double.infinity,
      height: 56,
      margin: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Login with Google',
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
      ),
    );
  }

  Widget registerButton() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don`t have an account?',
            style: greyTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Register',
                style:
                    blueTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ))
        ],
      ),
    );
  }

  Widget errorToast() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kRedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Password salah',
        style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
      ),
    );
  }
}
