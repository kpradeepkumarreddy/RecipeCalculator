import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.recipe.label)),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(widget.recipe.imageUrl),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.recipe.label,
                  style: const TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(7.0),
                    itemCount: widget.recipe.ingredients.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ingredient = widget.recipe.ingredients[index];
                      return Text(
                          "${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}");
                    },
                  ),
                ),
                Slider(
                  // 10
                  min: 1,
                  max: 10,
                  divisions: 9,
                  // 11
                  label: '${_sliderVal * widget.recipe.servings} servings',
                  // 12
                  value: _sliderVal.toDouble(),
                  // 13
                  onChanged: (newValue) {
                    setState(() {
                      _sliderVal = newValue.round();
                    });
                  },
                  // 14
                  activeColor: Colors.green,
                  inactiveColor: Colors.black,
                ),
              ],
            ),
          ),
        ));
  }
}
