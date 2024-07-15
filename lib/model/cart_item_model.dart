// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItemModel {
  final bool isLiked;
  final int id;
  CartItemModel({
    required this.isLiked,
    required this.id,
  });

  CartItemModel copyWith({
    bool? isLiked,
    int? id,
  }) {
    return CartItemModel(
      isLiked: isLiked ?? this.isLiked,
      id: id ?? this.id,
    );
  }
}
