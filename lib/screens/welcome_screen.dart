import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;


  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
        vsync: this,
      //upperbound means that by this much the ticker value will be increased
    );

    animation = ColorTween(begin: Color(0xffd0e8ef), end: Colors.white).animate(controller);
    //This is going to proceed our animation forwards
    controller.forward();
    //In order to see what our controller is doing we can add a listener
    //If we want our animation to go backwards then wee will use controller.reverse()
    //syntax- controller.reverse(from: 1.0)
    controller.addListener(() {
      //setstate id called so that after every tick the UI is updated
      setState(() {

      });
      print(animation.value);
    });


  }
  //This animation will go on forever and will consume a lot of resources, so tap into the dispose method to ensure that when the screen is destroyed our controller is destroyed too.
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Flash Chat'),],
                    totalRepeatCount: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    LoginScreen.id);
              }
            ),
            RoundedButton(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: (){
                  Navigator.pushNamed(
                      context,
                      RegistrationScreen.id);
                })
          ],
        ),
      ),
    );
  }
}


