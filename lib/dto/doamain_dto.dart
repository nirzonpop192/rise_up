class DomainDTO {
  String? context;
  String? id;
  String? type;
  List<HydraMember>? hydraMember;
  int? hydraTotalItems;

  DomainDTO(
      {this.context,
        this.id,
        this.type,
        this.hydraMember,
        this.hydraTotalItems});

  DomainDTO.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    id = json['@id'];
    type = json['@type'];
    if (json['hydra:member'] != null) {
      hydraMember = <HydraMember>[];
      json['hydra:member'].forEach((v) {
        hydraMember!.add( HydraMember.fromJson(v));
      });
    }
    hydraTotalItems = json['hydra:totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = context;
    data['@id'] =  id;
    data['@type'] =  type;
    if ( hydraMember != null) {
      data['hydra:member'] =  hydraMember!.map((v) => v.toJson()).toList();
    }
    data['hydra:totalItems'] =  hydraTotalItems;
    return data;
  }
}

class HydraMember {
  String? at_id;
  String? type;
  String? id;
  String? domain;
  bool? isActive;
  bool? isPrivate;
  String? createdAt;
  String? updatedAt;

  HydraMember(
      {this.at_id,
        this.type,
        this.id,
        this.domain,
        this.isActive,
        this.isPrivate,
        this.createdAt,
        this.updatedAt});

  HydraMember.fromJson(Map<String, dynamic> json) {
    at_id = json['@id'];
    type = json['@type'];
    id = json['id'];
    domain = json['domain'];
    isActive = json['isActive'];
    isPrivate = json['isPrivate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['@id'] = at_id;
    data['@type'] =  type;
    data['id'] =  id;
    data['domain'] =  domain;
    data['isActive'] =  isActive;
    data['isPrivate'] =  isPrivate;
    data['createdAt'] =  createdAt;
    data['updatedAt'] =  updatedAt;
    return data;
  }
}

