import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String courseTitle;
  final String courseDescription;
  final String courseImage;
  final double rating;
  final int reviewCount;

  const CourseDetailScreen({
    super.key,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Kursus
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  courseImage,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),

              // Judul Kursus
              Text(
                courseTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),

              // Rating dan Ulasan
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700], size: 24),
                  const SizedBox(width: 4),
                  Text(
                    '$rating ($reviewCount reviews)',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      // Aksi untuk menambah ke favorit
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Deskripsi Kursus
              Text(
                courseDescription,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              // Tombol Enroll
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Logika enroll
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Enroll Now',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Daftar Pelajaran
              const Text(
                'Course Lessons',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5, // jumlah pelajaran
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Lesson ${index + 1}'),
                    subtitle: Text('Subtitle for Lesson ${index + 1}'),
                    trailing: const Icon(Icons.play_arrow),
                    onTap: () {
                      // Aksi ketika pelajaran diklik
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
