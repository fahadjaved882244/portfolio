import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/home/home_view.dart';
import 'package:portfolio/features/project/view/project_view.dart';
import 'package:portfolio/features/responsive/controller.dart/responsive_controller.dart';
import 'package:portfolio/features/responsive/utils/media_query_extension.dart';

import 'components/custom_nav_bar.dart';
import 'components/custom_nav_rail.dart';
import 'components/responsive_padding.dart';

final widgets = [
  HomeView(),
  ProjectView(),
  HomeView(),
  HomeView(),
];

class ResponsiveView extends HookConsumerWidget {
  const ResponsiveView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(responsiveIndexProvider);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (context.showRail)
              CustomNavRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: (i) => onDestinationSelected(i, ref),
              ),
            Expanded(
              child: ResponsivePadding(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  child: widgets[selectedIndex],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: !context.showRail
          ? CustomNavBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (i) => onDestinationSelected(i, ref),
            )
          : null,
    );
  }

  void onDestinationSelected(int i, WidgetRef ref) {
    ref.read(responsiveIndexProvider.notifier).index = i;
  }
}




// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//         child: Column(
//           children: [
//             Flexible(
//               fit: FlexFit.tight,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "About Me",
//                     style: Theme.of(context).textTheme.displayMedium,
//                   ),
//                 ],
//               ),
//             ),
//             Flexible(
//               flex: 5,
//               child: Row(
//                 children: [
//                   Container(
//                     constraints: BoxConstraints(
//                       maxWidth: 396,
//                       maxHeight: 396,
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(24),
//                       child: Image.asset('assets/about-pic.png'),
//                     ),
//                   ),
//                   SizedBox(width: 64),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: OutlineContainer(
//                                 child: Column(
//                                   children: [
//                                     const Icon(
//                                       Icons.military_tech_outlined,
//                                       size: 32,
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Text(
//                                       'Experience',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyLarge
//                                           ?.copyWith(
//                                               fontWeight: FontWeight.bold),
//                                     ),
//                                     const Text('5+ years'),
//                                     const Text('Flutter Developer'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 32),
//                             Expanded(
//                               child: OutlineContainer(
//                                 child: Column(
//                                   children: [
//                                     Icon(Icons.people, size: 32),
//                                     SizedBox(height: 8),
//                                     Text(
//                                       'Education',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyLarge
//                                           ?.copyWith(
//                                               fontWeight: FontWeight.bold),
//                                     ),
//                                     Text('MSc Software Engineering'),
//                                     Text('BSc Computer Science'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 32),
//                         const Text(
//                           "Hi, I'm Fahad, a Senior Flutter Developer with 5 years of industrial experience and a Master's degree in Software Engineering. Over the years, I've helped brands and businesses build high-performance cross-platform applications, driving business growth through technology.",
//                           maxLines: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Flexible(fit: FlexFit.tight, child: SizedBox()),
//           ],
//         ),
//       ),
//     );
//   }
// }
