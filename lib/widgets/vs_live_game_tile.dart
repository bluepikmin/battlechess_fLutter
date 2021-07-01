import 'package:flutter/material.dart';

class VsLiveGameTile extends StatelessWidget {
  const VsLiveGameTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text('Vs.'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/100?img=4",
                  ),
                  radius: 15.0,
                ),
              ),
              Text('Antoine'),
              Text('. You play as'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Image(
                    image: AssetImage('assets/img/black_piece.png'), width: 16),
              ),
            ],
          ),
          Row(
            children: [
              Text('Move 36, Your Turn'),
              Icon(Icons.play_arrow),
            ],
          ),
        ],
      ),
    );
  }
}
