import 'package:flutter/material.dart';

class CarInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String question;
  final VoidCallback? onTap;          // whole card tap (optional)
  final VoidCallback? onQuestionTap;  // question text tap
  final VoidCallback? onTitleTap;     // new callback for title/subtitle tap

  const CarInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.question,
    this.onTap,
    this.onQuestionTap,
    this.onTitleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        onTap: onTap, // Optional full card tap
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        child: Icon(Icons.directions_car, color: Colors.white),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.edit, size: 14, color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: onTitleTap,  // Make title/subtitle tappable here
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: onQuestionTap,
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
