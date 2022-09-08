
class CategoryModel{
  String name='';String image='';
  bool isLoad= false;
  CategoryModel({required this.name, required this.image});
  CategoryModel.fromJson(Map <dynamic , dynamic> map){
    if(map==null){
      return;
    }
      name = map['name'];
      image= map['image'];
    isLoad= true;
  }

  toJson(){
    isLoad= false;
    return{
      'name': name,
      'image':image
    };
  }
}