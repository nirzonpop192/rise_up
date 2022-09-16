class CreateDTO {
  String? context;
  String? at_id;
  String? type;
  String? id;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  CreateDTO(
      {this.context,
        this.at_id,
        this.type,
        this.id,
        this.address,
        this.quota,
        this.used,
        this.isDisabled,
        this.isDeleted,
        this.createdAt,
        this.updatedAt});

  CreateDTO.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    at_id = json['@id'];
    type = json['@type'];
    id = json['id'];
    address = json['address'];
    quota = json['quota'];
    used = json['used'];
    isDisabled = json['isDisabled'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['@context'] = context;
    data['@id'] = at_id;
    data['@type'] = type;
    data['id'] = id;
    data['address'] = address;
    data['quota'] = quota;
    data['used'] = used;
    data['isDisabled'] = isDisabled;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}