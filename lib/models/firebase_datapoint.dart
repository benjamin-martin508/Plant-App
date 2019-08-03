class PlantDatapoint {
  String _friendlyName;
  String _type;

  PlantDatapoint(this._friendlyName, this._type);

  PlantDatapoint.map(dynamic obj) {
    this._friendlyName = obj['friendly_name'];
    this._type = obj['type'];
  }

  String get timestamp => _friendlyName;
  String get chargeState => _type;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['timestamp'] = _friendlyName;
    map['type'] = _type;

    return map;
  }

  PlantDatapoint.fromMap(Map<String, dynamic> map) {
    this._friendlyName = map['friendly_name'];
    this._type = map['type'];
  }
}
