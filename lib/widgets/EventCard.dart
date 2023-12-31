import 'package:eventvalle/data/models/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final EventEntity event;
  final VoidCallback onPressed;
  bool guardado = false;
  void toggle_guardado() {
    guardado = !guardado;
  }

  EventCard({Key? key, required this.event, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String image =
        'https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/irving-redesign/Events_Page_Header_2903ed9c-40c1-4f6c-9a69-70bb8415295b.jpg';
    print(event.principalImage);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 400,
        height: 200,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(event.principalImage),
                fit: BoxFit.cover,
                scale: 1,
                colorFilter: ColorFilter.mode(
                  Colors.black26,
                  BlendMode.darken,
                ))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWIotHotczo-GHEp_iWoQVBC-MjeWvniZyZmNy7X6Lgw&s'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alejandro Montero',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Publicado 10/11/2023 8:00 PM',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: toggle_guardado,
                    icon: Icon(
                      guardado ? Icons.turned_in : Icons.turned_in,
                      color: Colors.white,
                    )),
              ],
            ),
            const Spacer(),
            const Spacer(),
            Text(
              event.title,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Spacer(),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(129, 27, 3, 20),
                backgroundBlendMode: BlendMode.colorBurn,
              ),
              child: Text(
                'Jueves, 16 de noviembre, a las 10:00 ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
