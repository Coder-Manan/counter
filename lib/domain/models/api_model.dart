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
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['status'] = this.status;
    // data['original'] = this.original;
    // data['converted'] = this.converted;
    // data['from'] = this.from;
    // data['to'] = this.to;
    // return data;
    return {
      'status' : status,
      'original' : original,
      'converted' : converted,
      'from' : from,
      'to' :to,
    };

  }
}
