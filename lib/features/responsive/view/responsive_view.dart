import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/features/contact/contact_view.dart';
import 'package:portfolio/features/experience/view/exprience_list_view.dart';
import 'package:portfolio/features/home/home_view.dart';
import 'package:portfolio/features/project/view/project_list_view.dart';
import 'package:portfolio/features/responsive/utils/media_query_extension.dart';
import 'package:portfolio/features/responsive/view/widgets/custom_nav_menu.dart';

import 'widgets/custom_nav_bar.dart';
import 'widgets/responsive_padding.dart';

const widgets = [
  HomeView(),
  ProjectListView(),
  ExperienceListView(),
  ContactView(),
];

class ResponsiveView extends HookConsumerWidget {
  const ResponsiveView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final pageController = usePageController(initialPage: 0);

    useEffect(() {
      if (pageController.hasClients) {
        pageController
            .animateToPage(
              selectedIndex.value,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
            )
            .then((v) {});
      }
      return;
    }, [selectedIndex.value]);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (context.showRail)
              CustomNavMenu(
                selectedIndex: selectedIndex.value,
                onDestinationSelected: (i) => selectedIndex.value = i,
              ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (not) {
                  if (not is ScrollEndNotification) {
                    if (pageController.page?.toInt() != null &&
                        pageController.page!.toInt() != selectedIndex.value) {
                      selectedIndex.value = pageController.page!.toInt();
                    }
                  }
                  return true;
                },
                child: PageView.builder(
                  pageSnapping: true,
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: widgets.length,
                  itemBuilder: (context, i) {
                    return ResponsivePadding(
                      child: widgets[i],
                    );
                  },
                  onPageChanged: (i) {
                    // if ((selectedIndex.value - i).abs() == 1) {
                    //   selectedIndex.value = i;
                    // }
                    // if (!pageController.position.isScrollingNotifier.value) {
                    //   selectedIndex.value = i;
                    // }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: !context.showRail
          ? CustomNavBar(
              selectedIndex: selectedIndex.value,
              onDestinationSelected: (i) => selectedIndex.value = i,
            )
          : null,
    );
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
