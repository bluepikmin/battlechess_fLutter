import 'package:battle_chess/models/game.dart';
import 'package:battle_chess/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LiveGameTile extends StatelessWidget {
  final Game game;
  const LiveGameTile({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final white = ref.watch(playerProvider(this.game.whiteId));
        final black = ref.watch(playerProvider(this.game.blackId));
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    white.map(
                      data: (data) {
                        return Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Image(
                                  height: 30,
                                  image:
                                      AssetImage('assets/img/white_piece.png'),
                                ),
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/100?img=${data.value.id}",
                                ),
                                radius: 15.0,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(data.value.username),
                            ],
                          ),
                        );
                      },
                      loading: (_) {
                        return CircularProgressIndicator();
                      },
                      error: (_) {
                        return Text(_.error.toString());
                      },
                    ),
                    Text('Vs.'),
                    black.map(
                      data: (data) {
                        return Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(data.value.username),
                              SizedBox(
                                width: 8,
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/100?img=${data.value.id}",
                                ),
                                radius: 15.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Image(
                                  height: 30,
                                  image:
                                      AssetImage('assets/img/black_piece.png'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      loading: (_) {
                        return CircularProgressIndicator();
                      },
                      error: (_) {
                        return Text(_.error.toString());
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${this.game.turn} turn !'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
