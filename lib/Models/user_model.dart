class UsersModel {
  String? uId;
  String? name;
  String? email;
  String? image;

  UsersModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.image,
  });
  UsersModel.fromJson(Map<String,dynamic>json){
    uId = json['uId'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }
  Map<String,dynamic>toMap(){
    return {
      'uId':uId,
      'name':name,
      'email':email,
      'image':image,
    };
  }
}