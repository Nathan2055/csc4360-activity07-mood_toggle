import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => MoodModel(), child: MyApp()),
  );
}

// Mood Model - The "Brain" of our app
class MoodModel with ChangeNotifier {
  String _currentMood = 'Happy';
  String _currentMoodImage = 'images/emoji_happy.png';

  //String _happyMood = 'Happy';
  //String _happyMoodImage = 'images/emoji_happy.png';

  //String _happyMood = 'Happy';
  //String _happyMoodImage = 'images/emoji_happy.png';

  String get currentMood => _currentMood;
  String get currentMoodImage => _currentMoodImage;

  void setHappy() {
    _currentMood = 'Happy';
    _currentMoodImage = 'images/emoji_happy.png';
    notifyListeners();
  }

  void setSad() {
    _currentMood = 'Sad';
    _currentMoodImage = 'images/emoji_sad.png';
    notifyListeners();
  }

  void setExcited() {
    _currentMood = 'Excited';
    _currentMoodImage = 'images/emoji_excited.png';
    notifyListeners();
  }
}

// Main App Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Toggle Challenge',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Toggle Challenge')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('How are you feeling?', style: TextStyle(fontSize: 24)),
            SizedBox(height: 30),
            MoodDisplay(),
            SizedBox(height: 30),
            MoodButtons(),
          ],
        ),
      ),
    );
  }
}

// Widget that displays the current mood
class MoodDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoodModel>(
      builder: (context, moodModel, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(moodModel.currentMood, style: TextStyle(fontSize: 100)),
            Image.asset(moodModel.currentMoodImage, width: 128, height: 128),
          ],
        );
      },
    );
  }
}

// Widget with buttons to change the mood
class MoodButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Provider.of<MoodModel>(context, listen: false).setHappy();
          },
          child: Consumer<MoodModel>(
            builder: (context, moodModel, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(moodModel.currentMood),
                  Text('  '),
                  Image.asset(
                    moodModel.currentMoodImage,
                    width: 32,
                    height: 32,
                  ),
                ],
              );
            },
          ),
          //child: Text('Happy 😊 use your own img here '),
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<MoodModel>(context, listen: false).setSad();
          },
          child: Text('Sad 😢 use your own img here '),
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<MoodModel>(context, listen: false).setExcited();
          },
          child: Text('Excited 🎉 use your own img here '),
        ),
      ],
    );
  }
}
