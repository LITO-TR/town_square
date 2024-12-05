import 'package:flutter/material.dart';
import 'package:town_square/infrastructure/constants/data.dart';
import 'package:town_square/presentation/profile/widgets/comment_item_widget.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        key: ValueKey(comments.length),
        children: comments.map((comment) {
          return CommentItemWidget(
            name: comment.name,
            comment: comment.comment,
            urlImage: comment.urlImage,
          );
        }).toList(),
      ),
    );
  }
}
