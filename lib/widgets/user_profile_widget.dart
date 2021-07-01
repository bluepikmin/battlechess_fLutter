import 'package:battle_chess/models/user.dart';
import 'package:battle_chess/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      child: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final user = ref.watch(userProvider);
            return user.map(
              data: (data) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${data.value.username}'s Profile",
                    style: TextStyle(fontSize: 22.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    clipBehavior: Clip.antiAlias,
                    elevation: 2.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://i.pravatar.cc/100?img=${data.value.id}",
                              ),
                              radius: 50.0,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Victories",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.auto_awesome),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "13/45",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Points",
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "1257",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              loading: (_) => CircularProgressIndicator(),
              error: (_) => Text(_.error.toString()),
            );
          },
        ),
      ),
    );
  }
}
