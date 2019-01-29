import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState()=> _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin{
  ParticleOptions particleOptions = ParticleOptions(
    baseColor: Colors.deepOrangeAccent,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.2,
    maxOpacity: 0.4,
    spawnMinSpeed: 30.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 15.0,
    particleCount: 45,
  );

  var particlePaint = Paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;

  int _behaviourIndex = 0;
  Behaviour _behaviour;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();



  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    print("User Name : ${user.displayName}");
    return user;
  }

  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: AnimatedBackground(
            behaviour: _behaviour = _buildBehaviour(),
            vsync: this,
            child: Center(
              child: Container(
                  width: uni_width/1.5,
                  height: uni_height/12.8,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 30.0,
                    onPressed:(){
                      _signIn()
                          .then((FirebaseUser user) => print(user))
                          .catchError((e) => print(e));
                      Navigator.of(context).pushNamedAndRemoveUntil('/LandPage', (Route<dynamic> route) => false);
                    },

                    color: Colors.pinkAccent,
                    child: Row(
                      children: <Widget>[
                        Padding(padding:EdgeInsets.fromLTRB(uni_width/20,0,0,0)),
                        Image(
                            image: AssetImage('assets/google-logo-filled.png'),
                            height: uni_height / 32,
                            width: uni_width / 19),
                        Padding(padding: EdgeInsets.fromLTRB(uni_width /30,0,0,0)),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: uni_width / 20,
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          )
      ),
    );
  }

  Behaviour _buildBehaviour() {
    return RandomParticleBehaviour(
      options: particleOptions,
      paint: particlePaint,
    );
  }
  }
