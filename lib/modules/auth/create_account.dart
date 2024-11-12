import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  String? _selectedRole;

  bool _isObscure = true;
  bool _isObscurePassword = true;
//correo
  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  // contraseña
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su contraseña';
    } else if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  // confirmación de la contraseña
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme su contraseña';
    } else if (value != _password.text) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    final RegExp phoneRegExp = RegExp(r'^[0-9]{10}$');

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su número de teléfono';
    } else if (!phoneRegExp.hasMatch(value)) {
      return 'El número de teléfono debe ser de 10 dígitos y contener solo números';
    }
    return null;
  }

  // alertas
  void showAlertDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FixyPro'),
        centerTitle: true,
        backgroundColor: const Color(0xFF063852),
        titleTextStyle: const TextStyle(fontSize: 30, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 80,
                        ),
                        const SizedBox(width: 10),
                        const Spacer(),
                        const Text(
                          'Crear cuenta nueva',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Nombre completo o nombre de la empresa
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Nombre completo o Nombre de la Empresa',
                          labelText: 'Nombre completo o Nombre de la Empresa',
                          border: OutlineInputBorder(),
                        ),
                        controller: _nombre,
                      ),
                      const SizedBox(height: 16),
                      // Correo electrónico
                      TextFormField(
                        validator: validateEmail,
                        controller: _email,
                        decoration: const InputDecoration(
                          hintText: 'Correo electrónico',
                          labelText: 'Correo electrónico',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Teléfono
                      TextFormField(
                        validator: validatePhoneNumber,
                        controller: _telefono,
                        decoration: const InputDecoration(
                          hintText: 'Teléfono',
                          labelText: 'Teléfono',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Contraseña con icono de visibilidad
                      TextFormField(
                        controller: _password,
                        obscureText: _isObscure,
                        validator: validatePassword,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Confirmar contraseña con icono de visibilidad
                      TextFormField(
                        controller: _confirmPassword,
                        obscureText: _isObscurePassword,
                        validator: validatePassword,
                        decoration: InputDecoration(
                          hintText: 'Confirmar contraseña',
                          labelText: 'Confirmar contraseña',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscurePassword = !_isObscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _selectedRole,
                        decoration: const InputDecoration(
                            labelText: 'Selecciona tu rol',
                            border: OutlineInputBorder()),
                        items: <String>['Usuario', 'Proveedor']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedRole = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      // Botón de registrarse
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFA500),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/home');
                            }
                          },
                          child: const Text('Registrarse'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
