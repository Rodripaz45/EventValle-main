import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _slideAnimation = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 200),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset(0, 0),
            ).animate(CurvedAnimation(
              parent: _slideAnimation,
              curve: Curves.easeInOut,
            )),
            child: const Text(
              'Perfil',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '350',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Seguidores',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text(
                      '340',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Siguiendo',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para editar el perfil
                print('Editar Perfil');
              },
              icon: Icon(
                Icons.edit_note,
                color: Colors.black,
              ),
              label: Text(
                'Editar Perfil',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.pink),
                ),
                padding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Sobre mi',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink,
        selectedItemColor:
            Colors.white, // Color de los íconos y texto seleccionados
        unselectedItemColor:
            Colors.white, // Color de los íconos y texto no seleccionados
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                print('Elemento seleccionado: Inicio');
                // Aquí puedes realizar acciones específicas para "Inicio"
                break;
              case 1:
                print('Elemento seleccionado: Favoritos');
                // Aquí puedes realizar acciones específicas para "Favoritos"
                break;
              case 2:
                print('Elemento seleccionado: Perfil');
                // Aquí puedes realizar acciones específicas para "Perfil"
                break;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
