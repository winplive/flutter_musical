import 'package:flutter/material.dart';
import 'signup_details_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  bool isAgree = false;
  bool isVisibilityPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                '이메일',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 18.0),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              const Text(
                '비밀번호',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: isVisibilityPassword,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isVisibilityPassword = !isVisibilityPassword;
                        });
                      },
                    )),
                ),
              const SizedBox(
                height: 17,
              ),
              const Text(
                '비밀번호 확인',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: isVisibilityPassword,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isVisibilityPassword = !isVisibilityPassword;
                        });
                      },
                    )),
                ),
              const SizedBox(
                height: 17,
              ),
              const Text(
                '닉네임',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                '언제든 변경할 수 있어요',
                style: TextStyle(
                  fontSize: 16,
                    color: Colors.grey,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 6,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                style: const TextStyle(fontSize: 18.0),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                    side: WidgetStateBorderSide.resolveWith(
                          (states) {
                        if (states.contains(WidgetState.selected)) {
                          return const BorderSide(color: Colors.black, width: 1);
                        }
                        return const BorderSide(color: Colors.black, width: 1);
                      },
                    ),
                    value: isAgree,
                    onChanged: (value) {
                      setState(() {
                        isAgree = value!;
                      });
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignupDetailsScreen(),
                          ),
                        );
                      },
                      child: Text('개인정보 수집 및 이용동의',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                        textAlign: TextAlign.left,
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '회원가입',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(70.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
