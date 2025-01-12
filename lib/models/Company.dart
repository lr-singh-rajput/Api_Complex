class Company {
  Company({
      this.name, 
      this.catchPhrase, 
      this.bs,});

  Company.fromJson(dynamic json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }
  String? name;
  String? catchPhrase;
  String? bs;
Company copyWith({  String? name,
  String? catchPhrase,
  String? bs,
}) => Company(  name: name ?? this.name,
  catchPhrase: catchPhrase ?? this.catchPhrase,
  bs: bs ?? this.bs,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['catchPhrase'] = catchPhrase;
    map['bs'] = bs;
    return map;
  }

}