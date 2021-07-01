import 'package:battle_chess/models/game.dart';
import 'package:battle_chess/providers/providers.dart';
import 'package:battle_chess/widgets/finished_game_tile.dart';
import 'package:battle_chess/widgets/live_game_tile.dart';
import 'package:battle_chess/widgets/vs_live_game_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserGamesList extends StatelessWidget {
  const UserGamesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ExpansionTile(
            title: Row(
              children: [
                Text("Open Games. "),
                Text(
                  'Games you can join',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sorry, no open game at the moment."),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => {
                    //do something
                  },
                  child: Text('Create a new game'),
                ),
              )
            ],
          ),
          Consumer(
            builder: (context, ref, _) {
              final games = ref.watch(liveGamesProvider);
              return games.map(
                data: (data) {
                  return ExpansionTile(
                    title: Row(
                      children: [
                        Text("Live Games. "),
                        Text(
                          'Your current games',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      for (Game game in data.value) LiveGameTile(game: game)
                    ],
                  );
                },
                loading: (_) {
                  return CircularProgressIndicator();
                },
                error: (_) {
                  return Text(_.error.toString());
                },
              );
            },
          ),
          Consumer(
            builder: (context, ref, _) {
              final games = ref.watch(finishedGamesProvider);
              return games.map(
                data: (data) {
                  return ExpansionTile(
                    title: Row(
                      children: [
                        Text("Finished Games. "),
                        Text(
                          'Glory and Pain',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      for (Game game in data.value) FinishedGameTile(game: game)
                    ],
                  );
                },
                loading: (_) {
                  return CircularProgressIndicator();
                },
                error: (_) {
                  return Text(_.error.toString());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
