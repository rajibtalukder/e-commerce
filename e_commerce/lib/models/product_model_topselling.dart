class ProductModelTopSelling {
  String productId='', name='', image='', description='', color='', sized='', price='';

  ProductModelTopSelling(
      {required this.name,
      required this.image,
      required this.description,
      required this.color,
      required this.sized,
      required this.productId,
      required this.price,});
  ProductModelTopSelling.fromJson(Map<dynamic, dynamic>map){
    if(map==null){
      return;
    }

    name= map['name'];
    image= map['image'];
    description= map['description'];
    color= map['color'];
    sized= map['sized'];
    productId= map['productId'];
    price= map['price'];

  }

  toJson(){
    return {
      'name':name,
      'image':image,
      'description':description,
      'color':color,
      'sized':sized,
      'productId':productId,
      'price':price,
    };
  }

}
