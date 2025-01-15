import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _dbHelper = DatabaseHelper.instance;
  String _errorMessage = '';
  bool _isLoading = false;

  _register() async {
    print('Fungsi _register dipanggil.');
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      String username = _usernameController.text;
      String password = _passwordController.text;

      print('Mencoba mendaftar dengan username: $username');
      int result = await _dbHelper.registerUser(username, password);
      print('Hasil registrasi: $result');

      setState(() {
        _isLoading = false;
      });

      if (result > 0) {
        print('Registrasi berhasil, kembali ke halaman login.');
        Navigator.pop(context);
      } else if (result == -1) {
        setState(() {
          _errorMessage = 'Username sudah terdaftar.';
        });
      } else {
        setState(() {
          _errorMessage = 'Terjadi kesalahan saat mendaftar.';
        });
      }
    } else {
      print('Form tidak valid.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong.';
                    }
                    if (value.length < 6) {
                      return 'Password minimal 6 karakter.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Konfirmasi password tidak boleh kosong.';
                    }
                    if (value != _passwordController.text) {
                      return 'Konfirmasi password tidak cocok.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.0),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  child: _isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Text('Daftar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DatabaseHelper {
  static var instance;
}
