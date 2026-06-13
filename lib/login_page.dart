import 'package:flutter/material.dart';
import 'places_cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // DEGRADADO: De un azul fuerte a uno más suave
    const Color blueTop = Color(0xFF0D47A1);    // Azul fuerte/marino profundo
    const Color blueBottom = Color(0xFF42A5F5); // Azul suave/celeste brillante

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              // 1. Cabecera con el degradado de azules corregido
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.48,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [blueTop, blueBottom],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // 2. Interfaz de usuario
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.12),

                      // Título principal
                      const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),

                      // Frase de la app con opacidad nativa limpia
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          "Tu próximo destino comienza aquí",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.15),

                      // Formulario
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Campo de Correo Electrónico
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.black87, fontSize: 16),
                              decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Color(0xFFC4C7D0), fontSize: 15),
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFE2E4E9), width: 1.5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: blueTop, width: 2.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                                ),
                                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingresa tu correo';
                                }
                                if (!value.trim().toLowerCase().endsWith('@gmail.com')) {
                                  return 'Debe terminar en @gmail.com';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 20),

                            // Campo de Contraseña
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              style: const TextStyle(color: Colors.black87, fontSize: 16),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(color: Color(0xFFC4C7D0), fontSize: 15),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFE2E4E9), width: 1.5),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: blueTop, width: 2.0),
                                ),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
                                ),
                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                                ),
                                errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: const Color(0xFFC4C7D0),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingresa tu contraseña';
                                }
                                if (value.length < 6) {
                                  return 'Mínimo 6 caracteres';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 40),

                            // Botón de Login azulado
                            Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: const LinearGradient(
                                  colors: [blueTop, blueBottom],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: blueTop.withValues(alpha: 0.3), // Solución moderna para evitar 'withOpacity' deprecado
                                    offset: const Offset(0, 8),
                                    blurRadius: 16,
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlacesCupertino(),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Enlace inferior para recuperar contraseña
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "¿Olvidaste tu contraseña?",
                              style: TextStyle(
                                color: Color(0xFFA1A4B0),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.82);

    var firstControlPoint = Offset(size.width * 0.38, size.height * 0.70);
    var firstEndPoint = Offset(size.width * 0.75, size.height * 0.90);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy
    );

    var secondControlPoint = Offset(size.width * 0.90, size.height * 0.97);
    var secondEndPoint = Offset(size.width, size.height * 0.88);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}