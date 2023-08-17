enum TaskStatus {
  pending('pending'),
  inProgress('inProgress'),
  completed('completed'),
  archived('archived');

  final String name;
  const TaskStatus(this.name);

  static TaskStatus fromString(String name) {
    return TaskStatus.values.firstWhere((e) => e.name == name);
  }
}
