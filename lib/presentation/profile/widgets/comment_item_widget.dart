import 'package:flutter/material.dart';

class CommentItemWidget extends StatelessWidget {
  final String name;
  final String comment;
  final String urlImage;

  const CommentItemWidget({
    super.key,
    required this.name,
    required this.comment,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 17,
            backgroundImage: AssetImage(urlImage),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: List.generate(4, (index) {
                  return const Icon(
                    Icons.star,
                    color: Color(0xFFFBBE47),
                    size: 20,
                  );
                }),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: size.width * 0.73,
                child: Text(
                  comment,
                  style: textTheme.bodyMedium
                      ?.copyWith(fontSize: 16, color: const Color(0xFF8C8CA1)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
