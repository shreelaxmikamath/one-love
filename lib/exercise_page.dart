import 'package:flutter/material.dart';
import 'video_list_page.dart';

class ExercisePage extends StatelessWidget {
  final String userId;

  ExercisePage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildExerciseButton(
              context: context,
              label: 'Prenatal Yoga',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoListPage(
                      title: 'Prenatal Yoga Videos',
                      videos: _getPrenatalYogaVideos(),
                    ),
                  ),
                );
              },
            ),
            _buildExerciseButton(
              context: context,
              label: 'Strength Training',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoListPage(
                      title: 'Strength Training Videos',
                      videos: _getStrengthTrainingVideos(),
                    ),
                  ),
                );
              },
            ),
            _buildExerciseButton(
              context: context,
              label: 'Low-Impact Aerobics',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoListPage(
                      title: 'Low-Impact Aerobics Videos',
                      videos: _getLowImpactAerobicsVideos(),
                    ),
                  ),
                );
              },
            ),
            _buildExerciseButton(
              context: context,
              label: 'Stretching',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoListPage(
                      title: 'Stretching Videos',
                      videos: _getStretchingVideos(),
                    ),
                  ),
                );
              },
            ),
            _buildExerciseButton(
              context: context,
              label: 'Pilates',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoListPage(
                      title: 'Pilates Videos',
                      videos: _getPilatesVideos(),
                    ),
                  ),
                );
              },
            ),
            _buildExerciseButton(
              context: context,
              label: 'Pelvic Floor Exercises (Kegels)',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoListPage(
                      title: 'Kegels Videos',
                      videos: _getKegelsVideos(),
                    ),
                  ),
                );
              },
            ),
            _buildExerciseButton(
              context: context,
              label: 'Dance',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoListPage(
                      title: 'Dance Videos',
                      videos: _getDanceVideos(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent, // Background color
          foregroundColor: Colors.white, // Text color
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  List<Map<String, String>> _getPrenatalYogaVideos() {
    return [
      {'title': 'Prenatal Yoga Session 1', 'url': 'https://www.youtube.com/watch?v=v2pQKI9qlXU'},
      {'title': 'Prenatal Yoga Session 2', 'url': 'https://www.youtube.com/watch?v=qCNiZ4QHvn4'},
      {'title': 'Prenatal Yoga Session 3', 'url': 'https://www.youtube.com/watch?v=_6GI1JSgGAk'},
      {'title': 'Prenatal Yoga Session 4', 'url': 'https://www.youtube.com/watch?v=4pB9QJkMrn4'},
      {'title': 'Prenatal Yoga Session 5', 'url': 'https://www.youtube.com/watch?v=7Kp5mLCrTjU'},
    ];
  }

  List<Map<String, String>> _getStrengthTrainingVideos() {
    return [
      {'title': 'Strength Training video 1', 'url': 'https://www.youtube.com/watch?v=TZ9LrhALhWo'},
      {'title': 'Strength Training video 2', 'url': 'https://www.youtube.com/watch?v=1bnlPbJ_RFY'},
      {'title': 'Strength Training video 3', 'url': 'https://www.youtube.com/watch?v=J2KkP4UwmGQ'},
      {'title': 'Strength Training video 4', 'url': 'https://www.youtube.com/watch?v=8XvrVJNvVzE'},
      {'title': 'Strength Training video 5', 'url': 'https://www.youtube.com/watch?v=4i9Tm_NTEbM'},
    ];
  }

  List<Map<String, String>> _getLowImpactAerobicsVideos() {
    return [
      {'title': 'Low-Impact Aerobics video 1', 'url': 'https://www.youtube.com/watch?v=LVlRbcWi4sY'},
      {'title': 'Low-Impact Aerobics video 2', 'url': 'https://www.youtube.com/watch?v=3jI_d3_y4Mw'},
      {'title': 'Low-Impact Aerobics video 3', 'url': 'https://www.youtube.com/watch?v=IJsBsANzELo'},
      {'title': 'Low-Impact Aerobics video 4', 'url': 'https://www.youtube.com/watch?v=kaLhXn5MeZU'},
      {'title': 'Low-Impact Aerobics video 5', 'url': 'https://www.youtube.com/watch?v=5xR8kpp8FxU'},
    ];
  }

  List<Map<String, String>> _getStretchingVideos() {
    return [
      {'title': 'Stretching video 1', 'url': 'https://www.youtube.com/watch?v=-IbDD07uGn8'},
      {'title': 'Stretching video 2', 'url': 'https://www.youtube.com/watch?v=DiWzpDb38I8'},
      {'title': 'Stretching video 3', 'url': 'https://www.youtube.com/watch?v=YENWz88H-JM'},
      {'title': 'Stretching video 4', 'url': 'https://www.youtube.com/watch?v=ZzRLNUX8gF4'},
      {'title': 'Stretching video 5', 'url': 'https://www.youtube.com/watch?v=IR1T7AOnG58'},
    ];
  }

  List<Map<String, String>> _getPilatesVideos() {
    return [
      {'title': 'Pilates video 1', 'url': 'https://www.youtube.com/watch?v=NYIT64LnZCg'},
      {'title': 'Pilates video 2', 'url': 'https://www.youtube.com/watch?v=esdDmb7X9XI'},
      {'title': 'Pilates video 3', 'url': 'https://www.youtube.com/watch?v=ZrAuXRdj7gQ'},
      {'title': 'Pilates video 4', 'url': 'https://www.youtube.com/watch?v=BDQ8rI9gSUA'},
      {'title': 'Pilates video 5', 'url': 'https://www.youtube.com/watch?v=aT7thle5w_A'},
    ];
  }

  List<Map<String, String>> _getKegelsVideos() {
    return [
      {'title': 'Kegels video 1', 'url': 'https://www.youtube.com/watch?v=TUOkQQ6KCi0'},
      {'title': 'Kegels video 2', 'url': 'https://www.youtube.com/watch?v=3yQ-XFxSbck'},
      {'title': 'Kegels video 3', 'url': 'https://www.youtube.com/watch?v=v9-9rGKHuQI'},
      {'title': 'Kegels video 4', 'url': 'https://www.youtube.com/watch?v=7Fzhs3XhWEk'},
      {'title': 'Kegels video 5', 'url': 'https://www.youtube.com/watch?v=tpzC0ogS3Og'},
    ];
  }

  List<Map<String, String>> _getDanceVideos() {
    return [
      {'title': 'Dance for Pregnancy 1', 'url': 'https://www.youtube.com/watch?v=XYvHnQIG3Qs'},
      // Add more dance videos as needed
    ];
  }
}
