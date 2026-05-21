import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// this is stateprover riverpod exaple
final hello = StateProvider<String>((ref) {
  return 'hello';
});
final count = StateProvider<int>((ref) {
  return 0;
});

class RiverpodHomeScreen extends ConsumerWidget {
  const RiverpodHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('SatateProvider Rivrpod example'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 9, 43, 2),
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Count',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      print('consumer');
                      final counter = ref.watch(count);

                      return Text(
                        counter.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          ref.read(count.notifier).state++;
                        },
                        child: Text('+'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 4,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          ref.read(count.notifier).state--;
                        },
                        child: Text('-'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          elevation: 4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// this is a provider riverpod example
// final hello = Provider<String>((ref) {
//   return 'hello';
// });
// final age = Provider<int>((ref) {
//   return 19;
// });

// this is stateful riverpod example
// class RiverpodHomeScreen extends ConsumerStatefulWidget {
//   const RiverpodHomeScreen({super.key});
//
//   @override
//   ConsumerState<RiverpodHomeScreen> createState() => _RiverpodHomeScreenState();
// }
//
// class _RiverpodHomeScreenState extends ConsumerState<RiverpodHomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var helloword = ref.watch(hello);
//     var count = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "stateful Riverpod Provider state mangement",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//       body: Center(
//         child: Text('$helloword $count', style: TextStyle(fontSize: 30)),
//       ),
//     );
//   }
// }

// this is a stateless widget provider assign

// class RiverpodHomeScreen extends ConsumerWidget {
//   const RiverpodHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var helloword = ref.watch(hello);
//     var count = ref.watch(age);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Riverpod Provider state mangement",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//       body: Center(
//         child: Text('$helloword $count', style: TextStyle(fontSize: 30)),
//       ),
//     );
//   }
// }
