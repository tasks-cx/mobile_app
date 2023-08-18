import 'package:flutter/material.dart';
import 'package:tasks_cx/core/components/project_tile.dart';
import 'package:tasks_cx/core/data/member.dart';
import 'package:tasks_cx/screens/projects/add_project_screen.dart';
import 'package:uuid/uuid.dart';

import '../../core/data/project_model.dart';

class AllProjectsScreen extends StatelessWidget {
  const AllProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: FutureBuilder(
        future: Future<List<Project>?>.delayed(const Duration(seconds: 2))
            .then((value) => List<Project>.generate(
                10,
                (index) => Project(
                    projId: "$index",
                    parentId: const Uuid().v4(),
                    title: "Proj $index",
                    summary: "chghbfherfghbrhghghr ghbrgrghrghrghbrgsdfjbbhh",
                    links: [],
                    domain: "domain",
                    creator: dMember,
                    owners: List.generate(
                      3,
                      (index) => dMember.copyWith(username: "username $index"),
                    ),
                    members: List.generate(
                      3,
                      (index) => dMember.copyWith(username: "username $index"),
                    )))),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: Text("No Connection"));
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(child: Text("Error: fmdf"));
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ProjectTile(
                    
                    project: snapshot.data![index],
                  );
                },
                itemCount: snapshot.data!.length,
              );
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(70, 50)),
        ),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddProjectScreen(),
        )),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// TODO: REMOVE DUMMY CODE

final dMember =
    Member(username: "username", domain: "domain", publicKey: "publicKey");
