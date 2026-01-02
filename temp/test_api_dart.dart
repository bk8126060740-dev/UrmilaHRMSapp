import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PostService {
  static const String baseUrl = 'http://localhost:8000/api/posts';

  static Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    try {
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final List posts = decoded['data'];

        return posts.map((e) => PostModel.fromJson(e)).toList();
      } else {
        log("api failed with stats code ${response.statusCode}");
        return [];
      }
    } catch (e) {
      log("api failed with exception $e");
      throw Exception(e);
    }
  }
}

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late Future<List<PostModel>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = PostService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Posts')),
      body: FutureBuilder<List<PostModel>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final posts = snapshot.data!;

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(
                    post.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(post.content),
                      const SizedBox(height: 8),
                      Text(
                        'By ${post.user.name}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        post.createdAt.toLocal().toString(),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostListScreen(),
    );
  }
}

class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['_id'], name: json['name'], email: json['email']);
  }
}

class PostModel {
  final String id;
  final String title;
  final String content;
  final UserModel user;
  final DateTime createdAt;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.user,
    required this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      user: UserModel.fromJson(json['user']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
