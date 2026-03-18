import 'package:flutter/material.dart';

void main() {
  runApp(const AlaburgerApp());
}

class AlaburgerApp extends StatelessWidget {
  const AlaburgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALABURGER App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF5722),
          primary: const Color(0xFF212121), // Color Carbón
        ),
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // Lista de tus hamburguesas
  final List<Map<String, String>> menu = const [
    {
      'categoria': 'ALABURGER',
      'nombre': 'Al Carbón Tradicional',
      'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-Act-9-una-pantalla-dise-o-FSCC/refs/heads/master/ultraqueso.jpg',
    },
    {
      'categoria': 'ESPECIALIDAD',
      'nombre': 'La Ahumada Pro',
      'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-Act-9-una-pantalla-dise-o-FSCC/refs/heads/master/carnepollo.jpg',
    },
    {
      'categoria': 'PROMO',
      'nombre': 'Combo Familiar',
      'img': 'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-Act-9-una-pantalla-dise-o-FSCC/refs/heads/master/vegana.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text(
          'ALABURGER AL CARBÓN',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF212121),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return CustomBurgerCard(
            categoria: menu[index]['categoria']!,
            nombre: menu[index]['nombre']!,
            imageUrl: menu[index]['img']!,
          );
        },
      ),
    );
  }
}

// Este es el Widget de la Tarjeta (basado en tu imagen)
class CustomBurgerCard extends StatelessWidget {
  final String categoria;
  final String nombre;
  final String imageUrl;

  const CustomBurgerCard({
    super.key,
    required this.categoria,
    required this.nombre,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Imagen del producto
          SRectImage(url: imageUrl),
          
          // Textos (Nombre y Categoría)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoria,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF757575), // Gris suave
                    ),
                  ),
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para la imagen redonda
class SRectImage extends StatelessWidget {
  final String url;
  const SRectImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4),
        ),
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}