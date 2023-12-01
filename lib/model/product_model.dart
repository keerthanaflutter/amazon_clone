class Productmodel {
  final String url;
  final String productname;
  final double cost;
  final int discount;
  final String uid;
  final String sellername;
  final String smalleruid;
  final int rating;
  final int noofRating;

  Productmodel(
      {required this.url,
      required this.productname,
      required this.cost,
      required this.discount,
      required this.uid,
      required this.sellername,
      required this.smalleruid,
      required this.rating,
      required this.noofRating});
}
