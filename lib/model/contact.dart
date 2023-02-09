class ContactModel {
  String? status;
  Data? data;

  ContactModel({this.status, this.data});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? surname;
  String? occupation;
  String? email;
  String? phoneNumber;
  String? address;
  String? description;
  String? token;

  Data(
      {this.id,
      this.name,
      this.surname,
      this.occupation,
      this.email,
      this.phoneNumber,
      this.address,
      this.description,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    occupation = json['occupation'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    description = json['description'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['occupation'] = occupation;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['description'] = description;
    data['token'] = token;
    return data;
  }
}
