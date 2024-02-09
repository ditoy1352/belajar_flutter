import 'package:belajar_flutter/conponents/my_button.dart';
import 'package:belajar_flutter/conponents/my_textfield.dart';
import 'package:belajar_flutter/pages/daftar_pages.dart'; // Import halaman pendaftaran
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // text editing
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {
    // Implementasi login dapat ditambahkan di sini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              const Icon(Icons.lock, size: 100),
              SizedBox(height: 50),
              Text(
                'Halo tampan',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 25),
              MyTextField(
                controller: usernameController,
                hintText: 'username',
                obscureText: false,
              ),
              SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'daftar',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Ganti ke halaman lupa password
                        // Misalnya: Navigator.push(context, MaterialPageRoute(builder: (context) => LupaPasswordPage()));
                        print('Pindah ke halaman lupa password');
                      },
                      child: Text(
                        'lupa pw kawan?',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              MyButton(
                onTap: () {
                  // Validasi password
                  if (validatePassword(passwordController.text)) {
                    // Kode validasi berhasil, lakukan login
                    signUserIn();
                  } else {
                    // Password tidak valid, beri tahu pengguna
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password tidak valid'),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  bool validatePassword(String password) {
    // Contoh validasi sederhana: Minimal 6 karakter
    return password.length >= 6;
  }
}
