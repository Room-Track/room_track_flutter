import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Asegúrate de importar el paquete

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro
      body: Stack(
        children: [
          // Imagen SVG de fondo
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(40.0), // Ajusta el padding según lo que necesites
              child: Opacity(
                opacity: 1, // Transparencia de la imagen
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  fit: BoxFit.contain, // Ajuste para controlar el tamaño de la imagen
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2), // Para empujar el contenido hacia el centro
                Column(
                  children: [
                    // Campo de correo
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: 'example@usm.cl',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Campo de contraseña
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: 'Insert your password',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Enlace de "Forgot your password?"
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Agrega aquí tu lógica para recuperar contraseña
                        },
                        child: const Text(
                          'Forgot your password?',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Botón de iniciar sesión
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Color del botón
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          // Lógica de inicio de sesión
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Texto "or"
                    const Text(
                      'or',
                      style: TextStyle(color: Colors.white54),
                    ),
                    const SizedBox(height: 20),

                    // Botón de "Outlook" con imagen PNG
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: SvgPicture.asset(
                          'assets/outlook.svg', // Aquí va tu imagen PNG
                          width: 24, // Ajusta el tamaño según lo necesites
                          height: 24,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Color del botón
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          // Lógica de autenticación con Outlook
                        },
                        label: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Outlook',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(), // Empuja todo hacia arriba
                const Text(
                  'PORTALS©',
                  style: TextStyle(color: Colors.white54),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
