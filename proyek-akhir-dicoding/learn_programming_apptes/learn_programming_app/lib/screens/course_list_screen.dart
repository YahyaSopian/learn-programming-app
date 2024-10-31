import 'package:flutter/material.dart';
import 'course_detail_screen.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Flutter Basics',
      'description': 'Learn the basics of Flutter and build your first app.',
      'duration': 10,
      'image': 'assets/flutter.png',
      'rating': 4.5,
      'reviewCount': 120,
      'isFavorite': false,
    },
    {
      'title': 'Advanced Dart',
      'description': 'Master Dart and dive into advanced topics.',
      'duration': 12,
      'image': 'assets/dart.png',
      'rating': 4.7,
      'reviewCount': 85,
      'isFavorite': false,
    },
    {
      'title': 'Web Development',
      'description': 'Learn the foundations of web development.',
      'duration': 15,
      'image': 'assets/web.png',
      'rating': 4.2,
      'reviewCount': 95,
      'isFavorite': false,
    },
    {
      'title': 'React.js for Beginners',
      'description':
          'Get started with React.js and build dynamic web applications.',
      'duration': 8,
      'image': 'assets/react.png',
      'rating': 4.8,
      'reviewCount': 105,
      'isFavorite': false,
    },
    {
      'title': 'Python for Data Science',
      'description':
          'Analyze data and build machine learning models using Python.',
      'duration': 20,
      'image': 'assets/python.png',
      'rating': 4.9,
      'reviewCount': 150,
      'isFavorite': false,
    },
    {
      'title': 'Node.js Backend Development',
      'description': 'Create robust backend systems with Node.js.',
      'duration': 14,
      'image': 'assets/nodejs.jpg',
      'rating': 4.6,
      'reviewCount': 90,
      'isFavorite': false,
    },
    {
      'title': 'UI/UX Design Principles',
      'description':
          'Design user-friendly interfaces and enhance user experience.',
      'duration': 7,
      'image': 'assets/uiux.png',
      'rating': 4.3,
      'reviewCount': 70,
      'isFavorite': false,
    },
    {
      'title': 'Machine Learning Basics',
      'description': 'Get started with machine learning algorithms and models.',
      'duration': 18,
      'image': 'assets/ml.png',
      'rating': 4.5,
      'reviewCount': 125,
      'isFavorite': false,
    },
    {
      'title': 'Kotlin for Android',
      'description': 'Build Android apps using Kotlin.',
      'duration': 16,
      'image': 'assets/kotlin.png',
      'rating': 4.4,
      'reviewCount': 110,
      'isFavorite': false,
    },
    {
      'title': 'Angular Framework',
      'description':
          'Learn Angular and build dynamic single-page applications.',
      'duration': 11,
      'image': 'assets/angularjs.png',
      'rating': 4.6,
      'reviewCount': 85,
      'isFavorite': false,
    },
    {
      'title': 'SQL for Databases',
      'description': 'Master SQL to work with relational databases.',
      'duration': 9,
      'image': 'assets/sql.png',
      'rating': 4.3,
      'reviewCount': 75,
      'isFavorite': false,
    },
    {
      'title': 'Cloud Computing with AWS',
      'description': 'Learn cloud computing and deploy applications with AWS.',
      'duration': 13,
      'image': 'assets/aws.png',
      'rating': 4.7,
      'reviewCount': 100,
      'isFavorite': false,
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Mengatur jumlah kolom sesuai dengan lebar layar
    int crossAxisCount;
    if (screenWidth < 475) {
      crossAxisCount = 2;
    } else if (screenWidth < 630) {
      crossAxisCount = 3;
    } else if (screenWidth < 900) {
      crossAxisCount = 4;
    } else if (screenWidth < 1200) {
      crossAxisCount = 5;
    } else {
      crossAxisCount = 6;
    }

    final filteredCourses = courses.where((course) {
      return course['title'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Aksi ketika tombol pencarian ditekan
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search Courses',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Jumlah kolom dinamis
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Menambah tinggi pada item grid
                ),
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = filteredCourses[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke CourseDetailScreen dengan argumen yang benar
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetailScreen(
                            courseTitle: course['title'],
                            courseDescription: course['description'],
                            courseImage: course['image'],
                            rating: course['rating'],
                            reviewCount: course['reviewCount'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                course['image'],
                                fit: BoxFit
                                    .contain, // Menyediakan ruang gambar yang lebih baik
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              course['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rating: ${course['rating']}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    course['isFavorite']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: course['isFavorite']
                                        ? Colors.red
                                        : null,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      course['isFavorite'] =
                                          !course['isFavorite'];
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
