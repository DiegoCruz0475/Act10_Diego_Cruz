import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: InicioPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Escala de colores
    const Color azulPrimario = Color(0xFF0D47A1); 
    const Color azulLlamativo = Color(0xFF1976D2);
    const Color cafeMenu = Color(0xFF6D4C41); // Color café formal
    const Color azulFondo = Color(0xFFF5F7FA);

    return Scaffold(
      backgroundColor: azulFondo,
      appBar: AppBar(
        title: const Text(
          'Inicio',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: azulPrimario,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              // Fila que contiene el botón Vendedores y el Desplegable Café
              Row(
                children: [
                  // 3. Botón Vendedores (Ocupa el espacio principal)
                  Expanded(
                    flex: 5, // Toma la mayor parte del ancho
                    child: _buildMenuButton("Vendedores", Icons.people, azulLlamativo),
                  ),
                  const SizedBox(width: 10),
                  
                  // 2. Botón de barra desplegable (Pequeño y Café)
                  Expanded(
                    flex: 1, // Aproximadamente 1/6 del ancho total
                    child: Container(
                      height: 55, // Misma altura que el botón de al lado
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: cafeMenu,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: PopupMenuButton<String>(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                        itemBuilder: (context) => [
                          const PopupMenuItem(value: '1', child: Text("Opción 1")),
                          const PopupMenuItem(value: '2', child: Text("Opción 2")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 4 al 7. Resto de los botones
              _buildMenuButton("Casas en venta", Icons.sell, azulLlamativo),
              _buildMenuButton("Casas en renta", Icons.key, azulLlamativo),
              _buildMenuButton("Contacto", Icons.contact_mail, azulLlamativo),
              _buildMenuButton("Agendar cita", Icons.calendar_today, azulPrimario),

              const SizedBox(height: 40),

              // 8. Imagen de pie de página centrada
              const Center(
                child: Column(
                  children: [
                    Text(
                      "Yeyo Dwellings",
                      style: TextStyle(
                        color: azulPrimario,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: Image(
                        image: NetworkImage('https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=500'),
                        width: 240,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para los botones principales
  Widget _buildMenuButton(String texto, IconData icono, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icono, color: Colors.white, size: 20),
        label: Text(
          texto,
          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
    );
  }
}