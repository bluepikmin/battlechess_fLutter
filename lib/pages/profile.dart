import 'package:battle_chess/widgets/expandable_fab.dart';
import 'package:battle_chess/widgets/finished_game_tile.dart';
import 'package:battle_chess/widgets/user_games_list.dart';
import 'package:battle_chess/widgets/live_game_tile.dart';
import 'package:battle_chess/widgets/user_profile_widget.dart';
import 'package:battle_chess/widgets/vs_live_game_tile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: const Text('Battle Chess'),
        elevation: 0,
      ),
      floatingActionButton: ExpandableFab(
        distance: 80.0,
        open: Icon(Icons.more_horiz),
        close: Icon(Icons.close),
        children: [
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.help_outlined),
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorLight
                    ],
                  ),
                ),
                child: UserProfile(),
              ),
              UserGamesList(),
            ],
          ),
        ],
      ),
    );
  }
}
