class Game {
  int id;
  String uuid;
  DateTime createdAt;
  DateTime? lastMoveTime;
  int ownerId;
  int whiteId;
  int blackId;
  String status;
  String? turn;
  String? winner;
  bool public;

  Game(
      {required this.id,
      required this.uuid,
      required this.createdAt,
      this.lastMoveTime,
      required this.ownerId,
      required this.whiteId,
      required this.blackId,
      required this.status,
      this.turn,
      this.winner,
      required this.public});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? "aaaa",
      createdAt: (json['created_at'] != null)
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      lastMoveTime: (json['last_move_time'] != null)
          ? DateTime.parse(json['last_move_time'])
          : DateTime.now(),
      ownerId: json['owner_id'] ?? 0,
      whiteId: json['white_id'] ?? 0,
      blackId: json['black_id'] ?? 0,
      status: json['status'] ?? "finished",
      turn: json['turn'] ?? null,
      winner: json['winner'] ?? null,
      public: json['public'] ? true : false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['created_at'] = this.createdAt;
    data['last_move_time'] = this.lastMoveTime;
    data['owner_id'] = this.ownerId;
    data['white_id'] = this.whiteId;
    data['black_id'] = this.blackId;
    data['status'] = this.status;
    data['turn'] = this.turn;
    data['winner'] = this.winner;
    data['public'] = this.public;
    return data;
  }
}
