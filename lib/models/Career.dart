
class Career {
  final String _id;
  final String _name;

  get getId=>_id;
  get getName=>_name;

  Career():_id="",_name="";
  Career.fullParam(this._id,this._name);

  Career.fromJson(Map<String, dynamic> json):_id=json['id'],_name=json['name'];
}
