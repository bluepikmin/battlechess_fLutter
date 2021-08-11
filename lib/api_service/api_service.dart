import 'package:battle_chess/models/game.dart';
import 'package:battle_chess/models/user.dart';
import 'package:dio/dio.dart';

class ApiService {
  String baseUrl = 'http://sxbn.org:8080';
  String? token;

  Future<bool> auth(String login, String password) async {
    print(login);
    print(password);
    var formData = FormData.fromMap({
      'username': login,
      'password': password,
    });

    try {
      var response = await Dio().post(
        "${this.baseUrl}/token",
        data: formData,
      );
      this.token = response.data['access_token'];
      return this.token != null ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<User> getUser() async {
    if (this.token == null) {
      print('no token');
      throw NullThrownError();
    }
    print(this.token);
    Dio dio = new Dio();
    dio.options.headers['authorization'] = 'bearer ${this.token}';
    try {
      var response = await dio.get("${this.baseUrl}/users/me/");
      return User.fromJson(response.data);
    } catch (e) {
      throw NullThrownError();
    }
  }

  Future<User> getUserFromId(int id) async {
    if (this.token == null) {
      print('no token');
      throw NullThrownError();
    }
    print(this.token);
    Dio dio = new Dio();
    dio.options.headers['authorization'] = 'bearer ${this.token}';
    try {
      var response = await dio.get("${this.baseUrl}/users/u/$id");
      return User.fromJson(response.data);
    } catch (e) {
      throw NullThrownError();
    }
  }

  // récupère la liste des parties de l'utlisateur connecté
  // filtre le resultat pour retourner celles dont le status est demandé.
  Future<List<Game>> _getGames(String status) async {
    if (this.token == null) {
      print('no token');
      return [];
    }
    Dio dio = new Dio();
    dio.options.headers['authorization'] = 'bearer ${this.token}';
    try {
      var response = await dio.get("${this.baseUrl}/users/me/games/");
      List<Game> gameListe = [];
      for (var item in response.data) {
        if (item['status'] == status) {
          gameListe.add(Game.fromJson(item));
        }
      }
      print(gameListe);
      return gameListe;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // liste des parties débutées
  Future<List<Game>> getLiveGames() async {
    return _getGames("started");
  }

  // liste des parties terminées
  Future<List<Game>> getFinishedGames() async {
    return _getGames('finished');
  }

  // liste des parties ouverte en attente
  // dommage que ce ne soit pas la meme URL...
  Future<List<Game>> getOpenGames() async {
    if (this.token == null) {
      print('no token');
      return [];
    }
    Dio dio = new Dio();
    dio.options.headers['authorization'] = 'bearer ${this.token}';
    try {
      var response =
          await dio.get("${this.baseUrl}/games/?status_filter=waiting");
      List<Game> gameListe = [];
      for (var item in response.data) {
        gameListe.add(Game.fromJson(item));
      }
      print(gameListe);
      return gameListe;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
