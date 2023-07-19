import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:socialgeneric/common/widgets/avatarCarousel/avatar_carousel.dart';
import 'package:socialgeneric/common/widgets/avatarGeneric/avatar_generic.dart';
import 'package:socialgeneric/common/widgets/avatarPrincipal/avatar_principal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          // background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [theme.background, theme.primary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Center(
              child: Column(children: [
            GlassContainer(
              border: Border.all(color: Color.fromRGBO(0, 0, 0, 0)),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.24,
              blur: 10,
              child: SafeArea(
                child: Column(
                  children: [
                    Text(
                      'Social Generic',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        AvatarPrincipal(),
                        AvatarCarousel(),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //posteos
            Expanded(
              child: RefreshIndicator(
                strokeWidth: 2,
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 2));
                },
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Card(
                          color: theme.background.withOpacity(0.8),
                          child: Column(
                            children: [
                              ListTile(
                                  leading: AvatarGeneric(
                                    index: index,
                                    size: 35,
                                    border: false,
                                  ),
                                  title: Text('Usuario $index'),
                                  subtitle: Text('Hace 2 horas'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.more_horiz_rounded),
                                    onPressed: () {},
                                  )),
                              Container(
                                width: double.infinity,
                                height: 200,
                                child: Image.network(
                                  'https://picsum.photos/600/300?random=$index',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.favorite_border),
                                title: Text('Like'),
                                trailing: Icon(Icons.comment),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
            ),

            // bottom navigation bar
            BottomNavigationBar(
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Buscar',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_outlined),
                  label: 'Crear',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notificaciones',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
              ],
              selectedItemColor: theme.primary,
              unselectedItemColor: theme.onSurface.withOpacity(0.38),
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
            ),
          ])),
        ],
      ),
    );
  }
}
