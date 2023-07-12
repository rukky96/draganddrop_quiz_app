import 'package:dragdropapp/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Review'),
        backgroundColor: Colors.purple.shade900,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
          children: List.generate(provider.questions.length, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: ListTile(
            tileColor: Colors.purple.shade50,
            title: Text(
                '${index + 1}. ${provider.questions[index]['question']!}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Selected Answer: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: provider.questions[index]['selectedOption'],
                      style: TextStyle(
                          color: provider.questions[index]['selectedOption'] ==
                                  provider.questions[index]['correctOption']
                              ? Colors.green.shade900
                              : Colors.red.shade900,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic))
                ])),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Correct Answer: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: provider.questions[index]['correctOption'],
                      style: TextStyle(
                          color: Colors.purple.shade900,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic))
                ]))
              ],
            ),
          ),
        );
      })),
    );
  }
}
