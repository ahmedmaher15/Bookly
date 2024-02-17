import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeatureListView(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:24),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text('Best Seller',style: Styles.titleMedium,)
            ],
          ),
        )

      ],
    );
  }
}

