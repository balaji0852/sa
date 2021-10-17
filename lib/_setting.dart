// ignore: camel_case_types
class simple {
  static List<String> preferredItem = ["flag"];
  static List<String> preferredCities = ["flag"];
  static double minPriceRange = 299;
  static double maxPriceRange = 999;
  static List<item> items = [];
}

// ignore: camel_case_types
class item {
  late int itemID;
  late String productID;
  late String sellerDetails;
  late double sellerLocationLat;
  late double sellerLocationLong;
  late String itemImageUrl;
  late String itemDetails;
  late String category;
  late int price;
  late String locationName;
  late String sub_category;

  item(
      this.itemID,
      this.productID,
      this.sellerDetails,
      this.sellerLocationLat,
      this.sellerLocationLong,
      this.itemImageUrl,
      this.itemDetails,
      this.category,
      this.price,
      this.locationName,
      this.sub_category);
}
