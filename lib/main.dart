import 'package:dragdropapp/results.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
      create: (context) => QuestionProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drag and Drop',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionIndex = 0;

  TextEditingController answerAccepterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final provider = Provider.of<QuestionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: const Text(
          'Drag and Drop App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.purple.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    children: <TextSpan>[
                  const TextSpan(text: 'Question '),
                  TextSpan(
                      text: '${questionIndex + 1}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20)),
                  TextSpan(text: '/${provider.questions.length}')
                ])),
            Text(
              provider.questions[questionIndex]['question']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            DragTarget<String>(
              builder: (BuildContext context, List<dynamic> accepted,
                  List<dynamic> rejected) {
                return Container(
                  clipBehavior: Clip.none,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Drag an option to the textfield';
                        }
                        return null;
                      },
                      showCursor: true,
                      readOnly: true,
                      controller: answerAccepterController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: 'Drag your answer here'),
                    ),
                  ),
                );
              },
              onAccept: (String data) {
                provider.questions[questionIndex]['selectedOption'] = data;
                answerAccepterController.text = data;
                provider.changeSelectedOption(data, questionIndex);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  if (questionIndex + 1 < provider.questions.length) {
                    setState(() {
                      if (provider.questions[questionIndex]['selectedOption'] ==
                          provider.questions[questionIndex]['correctOption']) {
                        provider.increaseScore();
                      }
                      questionIndex++;
                      answerAccepterController.clear();
                    });
                  } else {
                    setState(() {
                      if (provider.questions[questionIndex]['selectedOption'] ==
                          provider.questions[questionIndex]['correctOption']) {
                        provider.increaseScore();
                      }
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(
                                score: provider.score /
                                    provider.questions.length)));

                    questionIndex = 0;
                    answerAccepterController.clear();
                  }
                }
              },
              tileColor: Colors.purple.shade900,
              title: const Text(
                'Submit Answer',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      provider.questions[questionIndex]['optionA'] ==
                              provider.questions[questionIndex]
                                  ['selectedOption']
                          ? const Text('')
                          : Draggable(
                              data: provider.questions[questionIndex]
                                  ['optionA'],
                              childWhenDragging: Text(
                                  provider.questions[questionIndex]['optionA']!,
                                  style: const TextStyle(fontSize: 20)),
                              feedback: Text(
                                  provider.questions[questionIndex]['optionA']!,
                                  style: const TextStyle(fontSize: 20)),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3,
                                        color: Colors.purple.shade900)),
                                child: Text(
                                    provider.questions[questionIndex]
                                        ['optionA']!,
                                    style: const TextStyle(fontSize: 20)),
                              ),
                            ),
                      const SizedBox(width: 10),
                      provider.questions[questionIndex]['optionB'] ==
                              provider.questions[questionIndex]
                                  ['selectedOption']
                          ? const Text('')
                          : Draggable(
                              data: provider.questions[questionIndex]
                                  ['optionB'],
                              childWhenDragging: Text(
                                  provider.questions[questionIndex]['optionB']!,
                                  style: const TextStyle(fontSize: 20)),
                              feedback: Text(
                                  provider.questions[questionIndex]['optionB']!,
                                  style: const TextStyle(fontSize: 20)),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3,
                                        color: Colors.purple.shade900)),
                                child: Text(
                                    provider.questions[questionIndex]
                                        ['optionB']!,
                                    style: const TextStyle(fontSize: 20)),
                              ),
                            ),
                      const SizedBox(width: 10),
                      provider.questions[questionIndex]['optionC'] ==
                              provider.questions[questionIndex]
                                  ['selectedOption']
                          ? const Text('')
                          : Draggable(
                              data: provider.questions[questionIndex]
                                  ['optionC'],
                              childWhenDragging: Text(
                                  provider.questions[questionIndex]['optionC']!,
                                  style: const TextStyle(fontSize: 20)),
                              feedback: Text(
                                  provider.questions[questionIndex]['optionC']!,
                                  style: const TextStyle(fontSize: 20)),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3,
                                        color: Colors.purple.shade900)),
                                child: Text(
                                    provider.questions[questionIndex]
                                        ['optionC']!,
                                    style: const TextStyle(fontSize: 20)),
                              ),
                            ),
                      const SizedBox(width: 10),
                      provider.questions[questionIndex]['optionD'] ==
                              provider.questions[questionIndex]
                                  ['selectedOption']
                          ? const Text('')
                          : Draggable(
                              data: provider.questions[questionIndex]
                                  ['optionD'],
                              childWhenDragging: Text(
                                  provider.questions[questionIndex]['optionD']!,
                                  style: const TextStyle(fontSize: 20)),
                              feedback: Text(
                                  provider.questions[questionIndex]['optionD']!,
                                  style: const TextStyle(fontSize: 20)),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 3,
                                        color: Colors.purple.shade900)),
                                child: Text(
                                    provider.questions[questionIndex]
                                        ['optionD']!,
                                    style: const TextStyle(fontSize: 20)),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
