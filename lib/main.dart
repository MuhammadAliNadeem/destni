
// ignore_for_file: library_private_types_in_public_api

import 'package:destni/storybrain.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}


class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storybrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
          image:DecorationImage(
          image: AssetImage('image/background.png'),
          fit: BoxFit.fill
          ),
          ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Expanded(
                flex: 12,
                child: Center(child: storybrain.getStoryText().text.xl.make())
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      storybrain.nextStory(1);
                    });
                  },
                   style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.red)),
                  child: storybrain.getChoice1().text.base.make()
                   
                    
                ).px(10),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
            
                child: Visibility (
                 visible: storybrain.buttonInvisibilty(),
                  child: ElevatedButton(
                    onPressed: () {
                     
                      setState(() {
                         storybrain.nextStory(2);
                      });
                    },
                   style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.blue)),
                    child:storybrain.getChoice2().text.base.make()
                    ).px(10),
                ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}