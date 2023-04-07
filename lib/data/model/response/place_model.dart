class PlaceModel {
  PlaceModel(
      {this.isFavorite,
      required this.name,
      required this.image,
      required this.address,
      this.category,
      this.dayPrice,
      this.nightPrice});

  final String name;
  final String image;
  final String address;
  final String? category;
  final String? dayPrice;
  final String? nightPrice;
  final bool? isFavorite;
}
