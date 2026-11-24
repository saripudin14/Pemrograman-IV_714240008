import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'botnav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();

    // isi otomatis username jika Remember Me pernah aktif
    final remembered = loginData.getBool('remember_me') ?? false;
    if (remembered) {
      setState(() {
        _rememberMe = true;
        _usernameController.text =
            loginData.getString('remember_username') ?? '';
      });
    }

    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DynamicBottomNavBar(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) {
    if (value != null && value.length < 4) {
      return 'Masukkan minimal 4 karakter';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value != null && value.length < 3) {
      return 'Masukkan minimal 3 karakter';
    }
    return null;
  }

  Future<void> _login() async {
    final isValidForm = _formKey.currentState!.validate();
    if (!isValidForm) return;

    final username = _usernameController.text;
    loginData = await SharedPreferences.getInstance();

    await loginData.setBool('login', false);
    await loginData.setString('username', username);

    if (_rememberMe) {
      await loginData.setBool('remember_me', true);
      await loginData.setString('remember_username', username);
    } else {
      await loginData.remove('remember_me');
      await loginData.remove('remember_username');
    }

    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const DynamicBottomNavBar(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Remember Me'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _usernameController,
                      validator: _validateUsername,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        hintText: 'Write username here...',
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Color.fromARGB(255, 242, 254, 255),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: _validatePassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password_rounded),
                        hintText: 'Write your password here...',
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        fillColor: Color.fromARGB(255, 242, 254, 255),
                        filled: true,
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                    title: const Text('Remember Me'),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}