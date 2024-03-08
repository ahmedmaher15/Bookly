import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entites/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_ratting.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailView);
      },
      child: SizedBox(
        height: 120,
        width: double.maxFinite,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: bookEntity.image??'',
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child:  Text(
                        bookEntity.title??'No title',
                        style: Styles.textStyle20.copyWith(    fontFamily: kGtSectraFine,),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  const SizedBox(height: 3,),
                   Text(bookEntity.authorName??'no author Name',style: Styles.textStyle14,),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      Text('${bookEntity.price==null?0.0 :bookEntity.price} \$',style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold,),),
                      const Spacer(),
                      const BookRatting()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
