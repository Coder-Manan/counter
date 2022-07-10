class Binary {
  String? status;
  String? original;
  String? converted;
  String? from;
  String? to;

  Binary({this.status, this.original, this.converted, this.from, this.to});

  factory Binary.fromJson(Map<String, dynamic> json) {
    return Binary(
        status : json['status'],
        original : json['original'],
        converted : json['converted'],
        from : json['from'],
        to : json['to'],
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'status' : status,
      'original' : original,
      'converted' : converted,
      'from' : from,
      'to' :to,
    };

  }
}
