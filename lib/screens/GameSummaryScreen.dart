
import 'package:flutter/material.dart';
import '../models/score_model.dart';

class GameSummaryScreen extends StatelessWidget {
  final List<ScoreModel> scores;

  const GameSummaryScreen({Key? key, required this.scores}) : super(key: key);

  int getTotalStrokes() {
    return scores.fold(0, (sum, item) => sum + item.strokes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Game Summary")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Total Strokes: \${getTotalStrokes()}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: scores.length,
                itemBuilder: (context, index) {
                  final score = scores[index];
                  return ListTile(
                    title: Text("Hole \${score.hole}"),
                    trailing: Text("\${score.strokes} strokes"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
