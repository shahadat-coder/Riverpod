import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedButton extends StatelessWidget {
  const SelectedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
      ),
      body: const ButtonSelected(),
    );
  }
}

final isRedProvider = Provider<bool>((ref){
final color = ref.watch(selectedButtonProvider);
return color == 'red';
});
final selectedButtonProvider = StateProvider<String>((ref)=> '');

class ButtonSelected extends ConsumerWidget {
  const ButtonSelected({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRed = ref.watch(isRedProvider);
    final selectedButton = ref.watch(selectedButtonProvider);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(selectedButton),
          ElevatedButton(
            onPressed: ()=> ref.read(selectedButtonProvider.notifier).state = 'red',
            child: const Text('Red'),
          ),

          ElevatedButton(
            onPressed: ()=> ref.read(selectedButtonProvider.notifier).state = 'blue',
            child: const Text('Blue'),
          ),
          isRed ? const Text('Color is red') : const Text('Color is blue'),
        ],
      ),
    );
  }
}
