import 'package:eventvalle/views/profile.dart';
import 'package:eventvalle/widgets/SkeletonCard.dart';
import 'package:flutter/material.dart';
import 'package:eventvalle/data/models/event.dart';
import 'package:eventvalle/services/event_service.dart';
import 'package:eventvalle/views/event_details.dart';
import 'package:eventvalle/widgets/EventCard.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final EventService _eventService = EventService();
  bool _isSearching = false;
  late TextEditingController _searchController;
  late AnimationController _slideAnimation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _slideAnimation = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _slideAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<EventEntity> events2 = [
    //   EventEntity(
    //     address: '123 Main St',
    //     createdAt: '2023-11-17T10:00:00Z',
    //     description: 'An exciting event',
    //     endDate: DateTime.parse('2023-11-18T15:00:00Z'),
    //     id: '1',
    //     images: ['image1.jpg', 'image2.jpg'],
    //     latitud: 40.7128,
    //     locationDetail: 'Event Hall',
    //     locationName: 'Event Venue 1',
    //     longitud: -74.0060,
    //     principalImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRor5usjyY1Uv-MRr3kVMMzGO1u8SsEIA3pCfOiYPI3mw&s',
    //     startDate: DateTime.parse('2023-11-18T10:00:00Z'),
    //     status: EventStatus.PUBLISH,
    //     subtitle: 'Join us for an amazing time',
    //     tags: ['tag1', 'tag2'],
    //     title: 'Event 1',
    //     updatedAt: '2023-11-17T12:30:00Z',
    //   ),
    //   EventEntity(
    //     address: '456 Oak St',
    //     createdAt: '2023-11-18T12:00:00Z',
    //     description: 'A fantastic gathering',
    //     endDate: DateTime.parse('2023-11-19T18:00:00Z'),
    //     id: '2',
    //     images: ['image3.jpg', 'image4.jpg'],
    //     latitud: 34.0522,
    //     locationDetail: 'Conference Room',
    //     locationName: 'Event Venue 2',
    //     longitud: -118.2437,
    //     principalImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRor5usjyY1Uv-MRr3kVMMzGO1u8SsEIA3pCfOiYPI3mw&s',
    //     startDate: DateTime.parse('2023-11-19T14:00:00Z'),
    //     status: EventStatus.DRAFT,
    //     subtitle: 'Don\'t miss out on the fun',
    //     tags: ['tag3', 'tag4'],
    //     title: 'Event 2',
    //     updatedAt: '2023-11-18T14:45:00Z',
    //   ),
    //   EventEntity(
    //     address: '789 Pine St',
    //     createdAt: '2023-11-19T08:30:00Z',
    //     description: 'A memorable experience',
    //     endDate: DateTime.parse('2023-11-20T17:30:00Z'),
    //     id: '3',
    //     images: ['image5.jpg', 'image6.jpg'],
    //     latitud: 37.7749,
    //     locationDetail: 'Outdoor Space',
    //     locationName: 'Event Venue 3',
    //     longitud: -122.4194,
    //     principalImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRor5usjyY1Uv-MRr3kVMMzGO1u8SsEIA3pCfOiYPI3mw&s',
    //     startDate: DateTime.parse('2023-11-20T10:00:00Z'),
    //     status: EventStatus.PUBLISH,
    //     subtitle: 'Create lasting memories with us',
    //     tags: ['tag5', 'tag6'],
    //     title: 'Event 3',
    //     updatedAt: '2023-11-19T11:20:00Z',
    //   ),
    //   EventEntity(
    //     address: '101 Elm St',
    //     createdAt: '2023-11-20T15:45:00Z',
    //     description: 'A captivating show',
    //     endDate: DateTime.parse('2023-11-21T22:00:00Z'),
    //     id: '4',
    //     images: ['image7.jpg', 'image8.jpg'],
    //     latitud: 41.8781,
    //     locationDetail: 'Main Stage',
    //     locationName: 'Event Venue 4',
    //     longitud: -87.6298,
    //     principalImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRor5usjyY1Uv-MRr3kVMMzGO1u8SsEIA3pCfOiYPI3mw&s',
    //     startDate: DateTime.parse('2023-11-21T18:00:00Z'),
    //     status: EventStatus.DRAFT,
    //     subtitle: 'Experience the magic live',
    //     tags: ['tag7', 'tag8'],
    //     title: 'Event 4',
    //     updatedAt: '2023-11-20T18:30:00Z',
    //   ),
    // ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            child: _isSearching
                ? TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search events...',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (query) {
                      // Handle search functionality based on the query
                      // You may want to update the FutureBuilder with the filtered results
                    },
                  )
                : const Text(
                    'Eventos',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isSearching ? Icons.cancel : Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (_isSearching) {
                  _slideAnimation.forward();
                } else {
                  _slideAnimation.reverse();
                }
              });
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      // body: ListView.builder(
      //   physics: const BouncingScrollPhysics(),
      //   padding: EdgeInsets.symmetric(horizontal: 20),
      //   itemCount: events2.length,
      //   itemExtent: 350,
      //   itemBuilder: (context, index) {
      //     final EventEntity event = events2[index];
      //     return Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      //       child: EventCard(
      //         event: event,
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             PageRouteBuilder(
      //               pageBuilder: (_, animation, __) => FadeTransition(
      //                 opacity: animation,
      //                 child: EventDetailsView(
      //                   event: event,
      //                   screenHeight: MediaQuery.of(context).size.height,
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     );
      //   },
      // ),
      body: FutureBuilder<List<EventEntity>>(
        future: _eventService.getListOfEventsForThisWeek(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //skeleton aqui
            return Column(
              children: [
                EventCardSkeleton(),
                SizedBox(height: 16), // Agrega espacio entre los esqueletos
                EventCardSkeleton(),
                SizedBox(height: 16),
                EventCardSkeleton(),
              ],
            );
            ;
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No events available for this week.');
          } else {
            List<EventEntity> events = snapshot.data!;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: events.length,
              itemExtent: 350,
              itemBuilder: (context, index) {
                final EventEntity event = events[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: EventCard(
                    event: event,
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, animation, __) => FadeTransition(
                            opacity: animation,
                            child: EventDetailsView(
                              event: event,
                              screenHeight: MediaQuery.of(context).size.height,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),

      //Navbarrrrr Rodri
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
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileView()),
                    );
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
