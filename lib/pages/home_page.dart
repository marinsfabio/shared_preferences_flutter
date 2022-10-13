import 'package:flutter/material.dart';
import 'package:shared_preferences_flutter/repositories/home_repository_imp.dart';
import 'package:shared_preferences_flutter/services/prefes_service.dart';

import '../controllers/home_controller.dart';
import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (_) => true);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              leading: Text(list[idx].id.toString()),
              trailing: Icon(Icons.arrow_forward),
              title: Text(
                list[idx].title,
              ),
              onTap: () => Navigator.of(context).pushNamed(
                '/subPage',
                arguments: list[idx],
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
          );
        },
      ),
    );
  }
}
