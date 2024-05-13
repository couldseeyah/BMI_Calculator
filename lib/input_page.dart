import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'gender_cards_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'result.dart';
import 'round_icon_button.dart';
import 'calculate_button.dart';
import 'bmi_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  onTapFunction: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: (selectedGender == Gender.male)
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  childWidget: CardContent(
                      iconColor: (selectedGender == Gender.male)
                          ? kActivatedIcon
                          : kUnactivatedIcon,
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE'),
                ),
                ReusableCard(
                  onTapFunction: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: (selectedGender == Gender.female)
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  childWidget: CardContent(
                    iconColor: (selectedGender == Gender.female)
                        ? kActivatedIcon
                        : kUnactivatedIcon,
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            onTapFunction: () {},
            colour: kActiveCardColour,
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    const Text(
                      'cm',
                      style: kTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 1,
                    thumbColor: kCalculateColour,
                    overlayColor: kCalculateColour.withAlpha(0x29),
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 15,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 30,
                    ),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: kInactiveCardColour,
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newVal) {
                      setState(() {
                        height = newVal.toInt();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  onTapFunction: () {},
                  colour: kActiveCardColour,
                  childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            const Text(
                              'kg',
                              style: kTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                if (weight > 1) {
                                  setState(() {
                                    weight--;
                                  });
                                }
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ]),
                ),
                ReusableCard(
                  onTapFunction: () {},
                  colour: kActiveCardColour,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              if (age > 2) {
                                setState(() {
                                  age--;
                                });
                              }
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            label: 'CALCULATE',
            onTapFunction: () {
              String gender = selectedGender == Gender.male ? 'male' : 'female';
              BmiBrain bmiBrain = BmiBrain(
                  age: age, gender: gender, height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmi: bmiBrain.calculateBMI(),
                    bmiCategory:
                        bmiBrain.getBmiCategory(bmiBrain.calculateBMI()),
                    bmiInfo: bmiBrain.bmiInfo(
                        bmiBrain.getBmiCategory(bmiBrain.calculateBMI())),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
