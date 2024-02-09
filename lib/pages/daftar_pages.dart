import 'package:flutter/material.dart';
import 'package:belajar_flutter/conponents/my_textfield.dart';
import 'package:belajar_flutter/conponents/my_button.dart'; // Tambahkan import untuk MyButton

class RegisterPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // username
            MyTextField(
              controller: usernameController,
              hintText: 'username',
              obscureText: false,
            ),

            SizedBox(height: 10),

            // Password 1
            MyTextField(
              controller: passwordController1,
              hintText: 'Password',
              obscureText: true,
            ),

            SizedBox(height: 10),

            // Password 2
            MyTextField(
              controller: passwordController2,
              hintText: 'Konfirmasi Password',
              obscureText: true,
            ),

            SizedBox(height: 20),

            // Tombol Daftar
            MyButton(
              onTap: () {
                // Validasi password untuk pendaftaran
                if (validatePasswords(
                    passwordController1.text, passwordController2.text)) {
                  // Kode validasi berhasil, lakukan pendaftaran
                  signUserUp();
                } else {
                  // Password tidak valid, beri tahu pengguna
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password tidak valid atau tidak cocok'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool validatePasswords(String password1, String password2) {
    // Validasi sederhana: Minimal 6 karakter dan kedua password harus cocok
    return password1.length >= 6 && password1 == password2;
  }

  void signUserUp() {
    // Implementasi pendaftaran dapat ditambahkan di sini
    print('Melakukan pendaftaran...');
  }
}
