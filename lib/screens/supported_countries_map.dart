import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';

import 'country_page.dart';

class SupportedCountriesMap extends StatefulWidget {
  const SupportedCountriesMap({super.key});

  @override
  SupportedCountriesMapState createState() => SupportedCountriesMapState();
}

class SupportedCountriesMapState extends State<SupportedCountriesMap> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: InteractiveViewer(
            maxScale: 75.0,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  // Actual widget from the Countries_world_map package.
                  child: SimpleMap(
                    instructions: SMapWorld.instructions,

                    // If the color of a country is not specified it will take in a default color.
                    defaultColor: Colors.grey,
                    // CountryColors takes in 250 different colors that will color each country the color you want. In this example it generates a random color each time SetState({}) is called.
                    callback: (id, name, tapdetails) {
                      goToCountry(id);
                    },
                    countryBorder: const CountryBorder(color: Colors.white),
                    colors: SMapWorldColors(
                      eT: Colors.green,
                      aR: Colors.green,
                      aT: Colors.green,
                      aZ: Colors.green,
                      cL: Colors.green,
                      cD: Colors.green,
                      cG: Colors.green,
                      hK: Colors.green,
                      iN: Colors.green,
                      iD: Colors.green,
                      iL: Colors.green,
                      iT: Colors.green,
                      cI: Colors.green,
                      mY: Colors.green,
                      mT: Colors.green,
                      mZ: Colors.green,
                      nA: Colors.green,
                      pS: Colors.green,
                      pE: Colors.green,
                      pH: Colors.green,
                      pR: Colors.green,
                      sL: Colors.green,
                      zA: Colors.green,
                      sD: Colors.green,
                      eS: Colors.green,
                      cH: Colors.green,
                      gB: Colors.green,
                      vE: Colors.green,
                      vN: Colors.green,
                      zM: Colors.green,
                      zW: Colors.green,
                      uS: Colors.green,
                      aD: Colors.green,
                      aO: Colors.green,
                      aM: Colors.green,
                      aU: Colors.green,
                      bS: Colors.green,
                      bH: Colors.green,
                      bD: Colors.green,
                      bY: Colors.green,
                      bE: Colors.green,
                      bT: Colors.green,
                      bO: Colors.green,
                      bW: Colors.green,
                      bR: Colors.green,
                      bN: Colors.green,
                      bG: Colors.green,
                      bF: Colors.green,
                      bI: Colors.green,
                      cV: Colors.green,
                      cM: Colors.green,
                      cA: Colors.green,
                      cF: Colors.green,
                      tD: Colors.green,
                      cN: Colors.green,
                      cO: Colors.green,
                      cR: Colors.green,
                      hR: Colors.green,
                      cU: Colors.green,
                      cY: Colors.green,
                      cZ: Colors.green,
                      dK: Colors.green,
                      dJ: Colors.green,
                      dO: Colors.green,
                      eC: Colors.green,
                      eG: Colors.green,
                      sV: Colors.green,
                      eE: Colors.green,
                      fO: Colors.green,
                      fI: Colors.green,
                      fR: Colors.green,
                      gE: Colors.green,
                      dE: Colors.green,
                      gR: Colors.green,
                      gT: Colors.green,
                      gN: Colors.green,
                      hT: Colors.green,
                      hN: Colors.green,
                      hU: Colors.green,
                      iR: Colors.green,
                      iQ: Colors.green,
                      iE: Colors.green,
                      jM: Colors.green,
                      jP: Colors.green,
                      kZ: Colors.green,
                      kE: Colors.green,
                      xK: Colors.green,
                      kG: Colors.green,
                      lA: Colors.green,
                      lV: Colors.green,
                      lI: Colors.green,
                      lT: Colors.green,
                      lU: Colors.green,
                      mK: Colors.green,
                      mL: Colors.green,
                      mX: Colors.green,
                      mD: Colors.green,
                      mE: Colors.green,
                      mA: Colors.green,
                      mM: Colors.green,
                      nP: Colors.green,
                      nL: Colors.green,
                      nZ: Colors.green,
                      nI: Colors.green,
                      nG: Colors.green,
                      nO: Colors.green,
                      oM: Colors.green,
                      pK: Colors.green,
                      pA: Colors.green,
                      pY: Colors.green,
                      pL: Colors.green,
                      pT: Colors.green,
                      qA: Colors.green,
                      rO: Colors.green,
                      rU: Colors.green,
                      rW: Colors.green,
                      sM: Colors.green,
                      sA: Colors.green,
                      rS: Colors.green,
                      sG: Colors.green,
                      sK: Colors.green,
                      sI: Colors.green,
                      kR: Colors.green,
                      lK: Colors.green,
                      sE: Colors.green,
                      sY: Colors.green,
                      tW: Colors.green,
                      tJ: Colors.green,
                      tH: Colors.green,
                      tR: Colors.green,
                      uG: Colors.green,
                      uA: Colors.green,
                      aE: Colors.green,
                      uY: Colors.green,
                      uZ: Colors.green,
                      yE: Colors.green,
                    ).toMap(),
                  ),
                ),
                // Creates 8% from right side so the map looks more centered.
                Container(width: MediaQuery.of(context).size.width * 0.08),
              ],
            ),
          ),
        ),
        const Positioned(
            bottom: 36,
            left: 0,
            right: 0,
            child: Text('Tap / click a country to see its map',
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center)),
      ],
    );
  }

  void goToCountry(String country) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountryPage(country: country),
      ),
    );
  }
}
