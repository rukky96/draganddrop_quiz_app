import 'package:dragdropapp/provider.dart';
import 'package:dragdropapp/review.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ResultPage extends StatefulWidget {
  final double score;
  const ResultPage({super.key, required this.score});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String setRemark() {
    String remark = '';
    if (widget.score * 100 < 40) {
      remark = 'Poor Performance!';
    } else if (widget.score * 100 >= 40 && widget.score * 100 < 70) {
      remark = 'Good Performance!';
    } else {
      remark = 'Excellent Performance!';
    }

    return remark;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Score'),
        backgroundColor: Colors.purple.shade900,
        leading: IconButton(
          onPressed: () {
            provider.resetScore();
            Navigator.pop(context);
            provider.resetQuestions();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            setRemark(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 20),
          SimpleCircularProgressBar(
            mergeMode: true,
            progressColors: [Colors.purple.shade900],
            maxValue: 100,
            size: 100,
            valueNotifier: ValueNotifier(widget.score * 100),
            onGetText: (double p0) => Text(
              '${(widget.score * 100).toInt()}%',
              style: TextStyle(
                  color: Colors.purple.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                provider.resetScore();
                provider.resetQuestions();
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.purple.shade900,
                  minimumSize: const Size(150, 50)),
              child: const Text(
                'Try Again',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReviewPage()));
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.purple.shade900,
                  minimumSize: const Size(150, 50)),
              child: const Text(
                'Review Answers',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ))
        ],
      )),
    );
  }
}
