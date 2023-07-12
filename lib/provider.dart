import 'package:flutter/material.dart';

class QuestionProvider extends ChangeNotifier {
  List<Map<String, String>> questions = [
    {
      'question':
          'Which state in Nigeria has the slogan "Center of Excellence"?',
      'optionA': 'Delta',
      'optionB': 'Kano',
      'optionC': 'Jigawa',
      'optionD': 'Lagos',
      'selectedOption': '',
      'correctOption': 'Lagos'
    },
    {
      'question': 'Which of these nation is in the continent of North America?',
      'optionA': 'Canada',
      'optionB': 'Uruguay',
      'optionC': 'Brazil',
      'optionD': 'Russia',
      'selectedOption': '',
      'correctOption': 'Canada'
    },
    {
      'question': 'Which is the largest organ in the human body?',
      'optionA': 'Brain',
      'optionB': 'Liver',
      'optionC': 'Skin',
      'optionD': 'Kidney',
      'selectedOption': '',
      'correctOption': 'Skin'
    },
    {
      'question': 'The capital of the United States of America is ____',
      'optionA': 'Texas',
      'optionB': 'California',
      'optionC': 'Pennsylvania',
      'optionD': 'Washington',
      'selectedOption': '',
      'correctOption': 'Washington'
    },
    {
      'question':
          'Babajide Sanwo Olu is the executive governor of _______ state',
      'optionA': 'Rivers',
      'optionB': 'Sokoto',
      'optionC': 'Lagos',
      'optionD': 'Ogun',
      'selectedOption': '',
      'correctOption': 'Lagos'
    },
    {
      'question': 'Nigeria gained independence in the year ______',
      'optionA': '1960',
      'optionB': '1963',
      'optionC': '1965',
      'optionD': '1975',
      'selectedOption': '',
      'correctOption': '1960'
    },
    {
      'question': 'An African country that was not colonized is',
      'optionA': 'Gabon',
      'optionB': 'South Africa',
      'optionC': 'Ethiopia',
      'optionD': 'Ghana',
      'selectedOption': '',
      'correctOption': 'Ethiopia'
    },
    {
      'question': 'Which of the following body parts is not a pair?',
      'optionA': 'Eye',
      'optionB': 'Testis',
      'optionC': 'Tongue',
      'optionD': 'Ear',
      'selectedOption': '',
      'correctOption': 'Tongue'
    },
    {
      'question':
          '"Food Basket of the Nation" is the slogan of which Nigerian State?',
      'optionA': 'Benue',
      'optionB': 'Taraba',
      'optionC': 'Kwara',
      'optionD': 'Kaduna',
      'selectedOption': '',
      'correctOption': 'Benue'
    },
    {
      'question': 'Which of these years was a leap year?',
      'optionA': '2018',
      'optionB': '2019',
      'optionC': '2020',
      'optionD': '2021',
      'selectedOption': '',
      'correctOption': '2020'
    }
  ];

  int score = 0;
  int get getScore => score;

  increaseScore() {
    score++;
    notifyListeners();
  }

  resetScore() {
    score = 0;
    notifyListeners();
  }

  List<Map<String, String>> get getQuestions => questions;
  changeSelectedOption(String data, int questionIndex) {
    questions[questionIndex]['selectedOption'] = data;
    notifyListeners();
  }

  resetQuestions() {
    for (Map element in questions) {
      element['selectedOption'] = '';
    }
    notifyListeners();
  }
}
