class HomeModel {
  bool? status;
  String? message;
  HomeDataModel? data;

  // HomeModel(/this.status, this.message, this.data);

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<ProductModel> products = [];
  List<BannerModel> banners = [];
  String? ad;
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((v) {
      banners.add(BannerModel.fromJson(v));
    });
    json['products'].forEach((v) {
      products.add(ProductModel.fromJson(v));
    });
  }
}

class BannerModel {
  int? id;
  String? image;
  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorite;
  bool? inCart;
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
