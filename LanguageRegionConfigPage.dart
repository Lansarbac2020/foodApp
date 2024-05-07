import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LanguageRegionConfigPage(),
  ));
}

class LanguageRegionConfigPage extends StatefulWidget {
  @override
  _LanguageRegionConfigPageState createState() =>
      _LanguageRegionConfigPageState();
}

class _LanguageRegionConfigPageState extends State<LanguageRegionConfigPage> {
  String selectedLanguage = 'English';
  String selectedCountry = 'Turkey';
  String selectedCity = 'Ankara';

  List<String> languages = ['English', 'Français', 'Turkish'];
  List<String> countries = ['Mali', 'Turkey', 'France', 'Guinee', 'USA'];
  List<String> cities = ['Bamako', 'Ankara' 'Paris', 'Rome', 'Madrid'];

  Map<String, List<String>> citiesByCountry = {
    'Mali': [
      'Bamako',
      'Sikasso',
      'Ségou',
      'Mopti',
      'Koutiala',
      'Kayes',
      'Sénou',
      'Gao',
      'Timbuktu',
      'Bougouni',
      'Kolokani',
      'San',
      'Kidal',
      'Markala',
      'Nioro du Sahel',
      'Yorosso',
      'Barouéli',
      'Kati',
      'Bafoulabé',
      'Niono',
      'Banamba',
      'Koulikoro',
      'Kangaba',
      'Ténenkou',
      'Tombouctou',
      'Ménaka',
      'Bandiagara',
      'Yélimané',
      'Douentza',
      'Kita',
      'Tessalit',
      'Taoudénit',
      'Kéniéba',
      'Bafoulabé',
      'Kolondiéba',
      'Nara',
      'Niafunké',
      'Goundam',
      'Ménaka',
      'Douentza',
      'Gourma-Rharous',
      'Bourem',
      'Ansongo',
      'Ténenkou',
      'Araouane',
      'Bélédougou',
      'Bla',
      'Diéma',
      'Yanfolila',
      'Tominian',
      'Mopti',
      'Banamba',
      'Sikasso',
      'Koutiala',
      'Kati',
      'Mopti',
      'Ségou',
      'Gao',
      'Koulikoro',
      'Niono',
      'Koutiala'
    ],
    'Turkey': [
      'Ankara',
      'Istanbul',
      'Izmir',
      'Istanbul',
      'Bursa',
      'Antalya',
      'Adana',
      'Konya',
      'Gaziantep',
      'Eskisehir',
      'Diyarbakir',
      'Mersin',
      'Kayseri',
      'Antakya',
      'Trabzon',
      'Samsun',
      'Van',
      'Erzurum',
      'Denizli',
      'Kocaeli',
      'Manisa',
      'Sakarya',
      'Malatya',
      'Sivas',
      'Batman',
      'Ordu',
      'Balikesir',
      'Kahramanmaras',
      'Aydin',
      'Usak',
      'Aksaray',
      'Isparta',
      'Corum',
      'Sanliurfa',
      'Afyonkarahisar',
      'Edirne',
      'Bolu',
      'Kastamonu',
      'Karaman',
      'Nevsehir',
      'Tekirdag',
      'Bilecik',
      'Bolu',
      'Yozgat',
      'Kars',
      'Canakkale',
      'Sinop',
      'Mardin',
      'Rize',
      'Tokat',
      'Agri',
      'Siirt',
      'Aydin',
      'Osmaniye'
    ],
    'France': [
      'Avignon',
      'Biarritz',
      'Cannes',
      'Chamonix',
      'Grenoble',
      'La Rochelle',
      'Lille',
      'Lourdes',
      'Lyon',
      'Marseille',
      'Montpellier',
      'Nantes',
      'Nice',
      'Nîmes',
      'Orléans',
      'Paris',
      'Rennes',
      'Strasbourg',
      'Toulouse',
      'Tours',
      'Versailles'
    ],
    'Guinee': [
      'Conakry',
      'Nzérékoré',
      'Kindia',
      'Kankan',
      'Labé',
      'Boke',
      'Mamou',
      'Faranah',
      'Siguiri',
      'Macenta',
      'Kamsar',
      'Kissidougou',
      'Gueckedou',
      'Coyah',
      'Pita',
      'Telimele',
      'Dinguiraye',
      'Koubia',
      'Dalaba',
      'Yomou',
      'Dubreka',
      'Forécariah',
      'Lola',
      'Kérouané',
      'Beyla',
      'Télimélé',
      'Tougué',
      'Mandiana',
      'Gaoual',
      'Télimélé'
    ],
    'USA': [
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'Florida',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
      'Kentucky',
      'Louisiana',
      'Maine',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire',
      'New Jersey',
      'New Mexico',
      'New York',
      'North Carolina',
      'North Dakota',
      'Ohio',
      'Oklahoma',
      'Oregon',
      'Pennsylvania',
      'Rhode Island',
      'South Carolina',
      'South Dakota',
      'Tennessee',
      'Texas',
      'Utah',
      'Vermont',
      'Virginia',
      'Washington',
      'West Virginia',
      'Wisconsin',
      'Wyoming'
    ],
  };

  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = citiesByCountry[selectedCountry]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Language & Region Configuration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Language:'),
            for (var language in languages)
              RadioListTile(
                title: Text(language),
                value: language,
                groupValue: selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value.toString();
                  });
                },
              ),
            SizedBox(height: 20),
            Text('Select Country:'),
            DropdownButton<String>(
              value: selectedCountry,
              onChanged: (newValue) {
                setState(() {
                  selectedCountry = newValue!;
                  selectedCity = citiesByCountry[selectedCountry]![0];
                  filteredCities = citiesByCountry[selectedCountry]!;
                });
              },
              items: countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text('Select City:'),
            DropdownButton<String>(
              value: selectedCity,
              onChanged: (newValue) {
                setState(() {
                  selectedCity = newValue!;
                });
              },
              items: filteredCities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the selected configuration
                // You can use a state management solution to store this information globally
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Text('Save Configuration'),
            ),
          ],
        ),
      ),
    );
  }
}
