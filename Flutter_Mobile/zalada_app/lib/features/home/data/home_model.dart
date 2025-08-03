class HomeModel {
   String ?image;
   String ?title;
   double ?price;
   int ?id;
   bool isFav ;

  HomeModel(  {this.isFav=false,  this.image,  this.title, this.price ,this.id});

  factory HomeModel.fromJson( Map<String, dynamic> json) {
    return HomeModel(image: json['image'], title: json['title'], price: (json['price'] as num).toDouble(),id:json['id'] );
  }
}
