import 'package:flutter/material.dart';
import 'package:portfolio/utils/media_query_extension.dart';
import 'package:portfolio/views/home/components/custom_nav_bar.dart';
import 'package:portfolio/views/home/components/custom_nav_rail.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  bool wideScreen = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    wideScreen = context.isTablet || context.isDesktop;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (wideScreen)
            CustomNavRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: context.margin,
                  child: const Placeholder(),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: context.bodySize,
                    maxWidth: context.bodySizeMax,
                  ),
                  child: ColoredBox(
                    color: Colors.cyan.shade500,
                    child: Column(
                      children: [
                        Text("${context.width}"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: context.margin,
                  child: const Placeholder(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: wideScreen
          ? null
          : CustomNavBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
            ),
    );
  }

  void onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
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
