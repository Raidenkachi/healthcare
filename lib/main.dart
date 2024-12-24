import 'package:flutter/material.dart';

void main() {
  runApp(FirstAidApp());
}

class FirstAidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Aid Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          background: Color(0xFF243447),
        ),
        fontFamily: 'Roboto',
      ),
      home: FirstAidHomePage(),
    );
  }
}

class FirstAidHomePage extends StatelessWidget {
  final List<Map<String, String>> firstAidSteps = [
    {
      'title': 'CPR',
      'description': '1. Call for help.\n2. Push hard and fast in the center of the chest.\n3. Provide rescue breaths if trained.',
      'image': 'assets/cpr.png',
    },
    {
      'title': 'Bleeding',
      'description': '1. Apply direct pressure on the wound.\n2. Use a clean cloth or bandage.\n3. Seek medical attention if severe.',
      'image': 'assets/bleeding.png',
    },
    {
      'title': 'Burns',
      'description': '1. Cool the burn under running water.\n2. Cover with a sterile dressing.\n3. Do not burst blisters.',
      'image': 'assets/burns.png',
    },
    {
      'title': 'Choking',
      'description': '1. Encourage the person to cough.\n2. Perform abdominal thrusts if necessary.\n3. Call emergency services if needed.',
      'image': 'assets/choking.png',
    },
    {
      'title': 'Fainting',
      'description': '1. Lay the person flat.\n2. Loosen tight clothing.\n3. Elevate their legs if possible.',
      'image': 'assets/fainting.png',
    },
    {
      'title': 'Fractures',
      'description': '1. Immobilize the affected area.\n2. Apply a cold pack to reduce swelling.\n3. Seek medical help.',
      'image': 'assets/fractures.png',
    },
    {
      'title': 'Poisoning',
      'description': '1. Identify the poison and its amount.\n2. Do not induce vomiting unless directed.\n3. Call poison control or seek emergency assistance.',
      'image': 'assets/poisoning.png',
    },
    {
      'title': 'Heat Stroke',
      'description': '1. Move the person to a cool place.\n2. Apply cold compresses or wet cloths.\n3. Give cool water if conscious.',
      'image': 'assets/heat_stroke.png',
    },
    {
      'title': 'Hypothermia',
      'description': '1. Move to a warm, dry place.\n2. Remove wet clothing.\n3. Wrap in blankets and provide warm drinks if conscious.',
      'image': 'assets/hypothermia.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC51F5D),
        title: Text(
          'First Aid Guide',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFFE2E2D2)),
        ),
      ),
      body: Container(
        color: Color(0xFF243447),
        child: ListView.builder(
          itemCount: firstAidSteps.length,
          itemBuilder: (context, index) {
            return Card(
              color: Color(0xFF141D26),
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              elevation: 4.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xFFC51F5D),
                  backgroundImage: AssetImage(firstAidSteps[index]['image']!),
                ),
                title: Text(
                  firstAidSteps[index]['title']!,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Color(0xFFE2E2D2)),
                ),
                subtitle: Text(
                  'Tap to see details',
                  style: TextStyle(color: Color(0xFFE2E2D2)),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFFC51F5D)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        title: firstAidSteps[index]['title']!,
                        description: firstAidSteps[index]['description']!,
                        image: firstAidSteps[index]['image']!,
                        problemImage: firstAidSteps[index]['image']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String problemImage;

  DetailPage({required this.title, required this.description, required this.image, required this.problemImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC51F5D),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFE2E2D2)),
        ),
      ),
      body: Container(
        color: Color(0xFF243447),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(problemImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF141D26),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 18.0, height: 1.5, color: Color(0xFFE2E2D2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
