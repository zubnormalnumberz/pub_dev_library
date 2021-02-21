import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class DataScreen extends StatefulWidget {
  final String title;

  DataScreen({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Screen"),
      ),
      body: Center(
        child: _AnimatedLiquidLinearProgressIndicator(),
      ),
    );
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  CurvedAnimation _animation;

  bool _visibleText = false;
  bool _visibleProgressBar = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.forward();
    _animation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _visibleText = true;
          _visibleProgressBar = false;
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: _visibleProgressBar,
          child: SizedBox(
            width: 150.0,
            height: 150.0,
            child: LiquidCircularProgressIndicator(
              value: _animationController.value,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Colors.red),
              center: Text(
                "${percentage.toStringAsFixed(0)}%",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: _visibleText,
          child: Column(
            children: [
              Text(
                "¿Mereció la pena?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 30,
                color: Colors.white,
              ),
              Text("Que si mereció la pena, me preguntas,"),
              Text("Y yo no sé que responder porque"),
              Text("no estoy penando."),
              Text("Pena grande es vivir sometido a la ley"),
              Text("del salario."),
              Text("Pero cuando descubrí la ley de la esperanza"),
              Text("y decidí romper con las cadenas, créeme amigo,"),
              Text("se me fueron todas las penas."),
              Text("Desde entonces, siempre me sentí contento"),
              Text("con lo que hice,"),
              Text("con los cómo y con los cuándo,"),
              Text("pues conocía los por qué."),
              Text("y en este momento me estoy contentando"),
              Text("con lo que hago y con lo que pienso"),
              Text("que mañana podré hacer."),
              Text("Es un anticipo de contentamiento"),
              Text("lo que ahora siento."),
              Divider(
                height: 30,
                color: Colors.white,
              ),
              Text(
                "Manuel Perez Martinez",
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
      ],
    );
  }
}
