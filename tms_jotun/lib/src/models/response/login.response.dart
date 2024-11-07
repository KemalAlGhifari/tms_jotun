class Login {
  int? status;
  String? message;
  Data? data;
  String? sId;

  Login({this.status, this.message, this.data, this.sId});

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['_id'] = this.sId;
    return data;
  }
}

class Data {
  String? userId;
  String? name;
  String? username;
  int? warehouseId;
  String? token;
  String? expires;
  List<Roles>? roles;
  List<Modules>? modules;

  Data(
      {this.userId,
      this.name,
      this.username,
      this.warehouseId,
      this.token,
      this.expires,
      this.roles,
      this.modules});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    username = json['username'];
    warehouseId = json['warehouse_id'];
    token = json['token'];
    expires = json['expires'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    if (json['modules'] != null) {
      modules = <Modules>[];
      json['modules'].forEach((v) {
        modules!.add(new Modules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['username'] = this.username;
    data['warehouse_id'] = this.warehouseId;
    data['token'] = this.token;
    data['expires'] = this.expires;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.modules != null) {
      data['modules'] = this.modules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  String? idSecRole;
  String? name;

  Roles({this.idSecRole, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    idSecRole = json['id_sec_role'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_sec_role'] = this.idSecRole;
    data['name'] = this.name;
    return data;
  }
}

class Modules {
  String? id;
  String? code;
  String? application;
  String? module;
  String? feature;
  int? isWrite;
  List<String>? roleIds;

  Modules(
      {this.id,
      this.code,
      this.application,
      this.module,
      this.feature,
      this.isWrite,
      this.roleIds});

  Modules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    application = json['application'];
    module = json['module'];
    feature = json['feature'];
    isWrite = json['is_write'];
    roleIds = json['role_ids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['application'] = this.application;
    data['module'] = this.module;
    data['feature'] = this.feature;
    data['is_write'] = this.isWrite;
    data['role_ids'] = this.roleIds;
    return data;
  }
}