import 'package:flutter/material.dart';
import 'package:tasks_cx/core/data/project_model.dart';
import 'package:tasks_cx/screens/tasks/all_tasks_screen.dart';

class ProjectTile extends StatelessWidget {
  final Project project;
  const ProjectTile({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        AllTasksScreen();
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      title: Text(
        project.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        project.summary,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: CircleAvatar(
        child: Text(project.creator.username[0]),
      ),
    );
  }
}
