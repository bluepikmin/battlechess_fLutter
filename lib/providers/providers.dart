import 'package:battle_chess/api_service/api_service.dart';
import 'package:battle_chess/models/game.dart';
import 'package:battle_chess/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider((ref) => ApiService());

//retourne l'utilisateur connecter
final userProvider = FutureProvider<User>((ref) async {
  final api = ref.read(apiProvider);
  return await api.getUser();
});

//Retourne un utilisateur spécifique
final playerProvider = FutureProvider.family<User, int>((ref, id) async {
  final api = ref.read(apiProvider);
  return await api.getUserFromId(id);
});

final liveGamesProvider = FutureProvider<List<Game>>((ref) async {
  final api = ref.read(apiProvider);
  return await api.getLiveGames();
});

final finishedGamesProvider = FutureProvider<List<Game>>((ref) async {
  final api = ref.read(apiProvider);
  return await api.getFinishedGames();
});

final openGamesProvider = FutureProvider<List<Game>>((ref) async {
  final api = ref.read(apiProvider);
  return await api.getOpenGames();
});
