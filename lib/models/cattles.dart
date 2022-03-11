class CattleTime {
  final int? id;
  final int CPid;
  final int bodyLenght;
  final int heartGirth;
  final int hearLenghtSide;
  final int hearLenghtRear;
  final int hearLenghtTop;
  final int PixelReference;
  final int DistanceReference;
  final String date;

  CattleTime(
      {this.id,
      required this.CPid,
      required this.bodyLenght,
      required this.heartGirth,
      required this.hearLenghtSide,
      required this.hearLenghtRear,
      required this.hearLenghtTop,
      required this.PixelReference,
      required this.DistanceReference,
      required this.date});

  CattleTime.fromMap(Map<String,dynamic> res):
  id=res['id'],
  CPid=res['CPid'],
  bodyLenght=res['bodyLenght'],
  heartGirth=res['heartGirth'],
  hearLenghtSide=res['hearLenghtSide'],
  hearLenghtRear=res['hearLenghtRear'],
  hearLenghtTop=res['hearLenghtTop'],
  PixelReference=res['PixelReference'],
  DistanceReference=res['DistanceReference'],
  date=res['date'];

  Map<String, Object?> toMap() {
    return {
      'id': (id == 0) ? null : id,
      'CPid': CPid,
      'bodyLenght': bodyLenght,
      'heartGirth': heartGirth,
      'hearLenghtSide': hearLenghtSide,
      'hearLenghtRear': hearLenghtRear,
      'hearLenghtTop': hearLenghtTop,
      'PixelReference': PixelReference,
      'DistanceReference': DistanceReference,
      'date': date,
    };
  }
}
