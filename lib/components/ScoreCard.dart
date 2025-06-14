
import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  final int hole;
  final Function(int) onScoreSubmitted;

  const ScoreCard({Key? key, required this.hole, required this.onScoreSubmitted}) : super(key: key);

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    final strokes = int.tryParse(_controller.text);
    if (strokes != null) {
      widget.onScoreSubmitted(strokes);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Hole \${widget.hole}", style: const TextStyle(fontSize: 18)),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Strokes"),
            ),
            ElevatedButton(onPressed: _submit, child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
