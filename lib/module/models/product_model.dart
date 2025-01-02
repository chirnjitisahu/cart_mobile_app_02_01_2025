class Product {
  final String id;
  final String title;
  final String thumbnail;
  final double price;
  final double rating;
final List<Review> reviews;
  Product({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.rating,
     required this.reviews,
  });

  // Method to convert Product to JSON (for API response)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString()??"", // Convert to string if it's an int
      title: json['title']??"",
      thumbnail: json['thumbnail']??'',
      price: json['price'].toDouble()??"",
      rating: json['rating'].toDouble()??"",
        reviews: (json['reviews'] as List)
          .map((reviewJson) => Review.fromJson(reviewJson))
          .toList(),
    );
  }
}
class Review {
  final int rating;
  final String comment;
  final String reviewerName;

  Review({
    required this.rating,
    required this.comment,
    required this.reviewerName,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      reviewerName: json['reviewerName'],
    );
  }
}