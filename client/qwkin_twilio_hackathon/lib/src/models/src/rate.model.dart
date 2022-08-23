class Rate {
  final String? name;
  final String? unitNumber;
  final String? condoName;
  final String? gateName;
  final int? score;
  final String? comments;
  final String? staffName;

  Rate({
    this.name,
    this.unitNumber,
    this.condoName,
    this.gateName,
    this.score,
    this.comments,
    this.staffName,
  });

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      name: json['name'],
      unitNumber: json['unitNumber'],
      condoName: json['condoName'],
      gateName: json['gateName'],
      score: json['score'],
      comments: json['comments'],
      staffName: json['staffName'],
    );
  }
}
