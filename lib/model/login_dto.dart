class LoginDTO {
  String? token;
  String? id;

  LoginDTO({this.token, this.id});

  LoginDTO.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}