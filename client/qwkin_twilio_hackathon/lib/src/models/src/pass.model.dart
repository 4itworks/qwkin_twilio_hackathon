class Pass {
  final String? guestName;
  final String? unitNumber;
  final String? condoName;
  final String? phoneNumber;
  final int? id;

  Pass({
    this.guestName,
    this.unitNumber,
    this.condoName,
    this.id,
    this.phoneNumber,
  });

  factory Pass.fromJson(Map<String, dynamic> json) {
    return Pass(
      guestName: json['guestName'],
      unitNumber: json['unitNumber'],
      condoName: json['condoName'],
      phoneNumber: json['phoneNumber'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guestName': guestName,
      'unitNumber': unitNumber,
      'condoName': condoName,
      'phoneNumber': phoneNumber,
      'id': id,
    };
  }
}
