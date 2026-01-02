import 'package:flutter/material.dart';

void main() {
  runApp(const HRMSApp());
}

class HRMSApp extends StatelessWidget {
  const HRMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}

/// =====================
/// MODELS
/// =====================

class Shift {
  final String name;
  final String time;

  Shift(this.name, this.time);
}

class Assignment {
  final String level;
  final String target;
  final Shift shift;

  Assignment(this.level, this.target, this.shift);
}

/// =====================
/// DATA STORE (LOCAL)
/// =====================

class LocalDB {
  static List<String> companies = ["ABC Corp"];

  static List<String> clients = ["US Client", "India Client"];

  static List<String> projects = ["Mobile App", "Web App"];

  static List<String> departments = ["Support", "HR"];

  static List<String> employees = ["Rahul", "Sneha"];

  static List<Shift> shifts = [
    Shift("General Shift", "9:00 AM - 6:00 PM"),
    Shift("Night Shift", "9:00 PM - 6:00 AM"),
    Shift("Evening Shift", "1:00 PM - 10:00 PM"),
  ];

  static List<Assignment> assignments = [];
}

/// =====================
/// DASHBOARD
/// =====================

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HRMS Admin Dashboard")),
      body: ListView(
        children: [
          _tile(context, "Create Masters", const MasterScreen()),
          _tile(context, "Create Shifts", const ShiftScreen()),
          _tile(context, "Assign Shifts", const AssignShiftScreen()),
          _tile(context, "View Assignments", const AssignmentListScreen()),
          _tile(context, "Employee Shift View", const EmployeeViewScreen()),
        ],
      ),
    );
  }

  Widget _tile(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
    );
  }
}

/// =====================
/// MASTER SCREEN
/// =====================

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Masters")),
      body: ListView(
        children: [
          _section("Company", LocalDB.companies),
          _section("Client", LocalDB.clients),
          _section("Project", LocalDB.projects),
          _section("Department", LocalDB.departments),
          _section("Employee", LocalDB.employees),
        ],
      ),
    );
  }

  Widget _section(String title, List<String> items) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        children: items.map((e) => ListTile(title: Text(e))).toList(),
      ),
    );
  }
}

/// =====================
/// SHIFT CREATION
/// =====================

class ShiftScreen extends StatelessWidget {
  const ShiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shift Master")),
      body: ListView(
        children: LocalDB.shifts
            .map((s) => ListTile(title: Text(s.name), subtitle: Text(s.time)))
            .toList(),
      ),
    );
  }
}

/// =====================
/// ASSIGN SHIFT
/// =====================

class AssignShiftScreen extends StatefulWidget {
  const AssignShiftScreen({super.key});

  @override
  State<AssignShiftScreen> createState() => _AssignShiftScreenState();
}

class _AssignShiftScreenState extends State<AssignShiftScreen> {
  String level = "Company";
  String target = "ABC Corp";
  Shift shift = LocalDB.shifts.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assign Shift")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField(
              initialValue: level,
              items: [
                "Company",
                "Client",
                "Project",
                "Department",
                "Employee",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => level = v!),
              decoration: const InputDecoration(labelText: "Level"),
            ),
            DropdownButtonFormField(
              initialValue: target,
              items: _targets()
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => setState(() => target = v!),
              decoration: const InputDecoration(labelText: "Target"),
            ),
            DropdownButtonFormField(
              initialValue: shift,
              items: LocalDB.shifts
                  .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                  .toList(),
              onChanged: (v) => setState(() => shift = v!),
              decoration: const InputDecoration(labelText: "Shift"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                LocalDB.assignments.add(Assignment(level, target, shift));
                Navigator.pop(context);
              },
              child: const Text("Assign"),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _targets() {
    switch (level) {
      case "Client":
        return LocalDB.clients;
      case "Project":
        return LocalDB.projects;
      case "Department":
        return LocalDB.departments;
      case "Employee":
        return LocalDB.employees;
      default:
        return LocalDB.companies;
    }
  }
}

/// =====================
/// ASSIGNMENT LIST
/// =====================

class AssignmentListScreen extends StatelessWidget {
  const AssignmentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shift Assignments")),
      body: ListView(
        children: LocalDB.assignments
            .map(
              (a) => ListTile(
                title: Text("${a.level} → ${a.target}"),
                subtitle: Text("${a.shift.name} | ${a.shift.time}"),
              ),
            )
            .toList(),
      ),
    );
  }
}

/// =====================
/// EMPLOYEE FINAL VIEW
/// =====================

class EmployeeViewScreen extends StatefulWidget {
  const EmployeeViewScreen({super.key});

  @override
  State<EmployeeViewScreen> createState() => _EmployeeViewScreenState();
}

class _EmployeeViewScreenState extends State<EmployeeViewScreen> {
  String employee = "Rahul";

  @override
  Widget build(BuildContext context) {
    final applied = _resolveShift();

    return Scaffold(
      appBar: AppBar(title: const Text("Employee Shift View")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField(
              initialValue: employee,
              items: LocalDB.employees
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => setState(() => employee = v!),
              decoration: const InputDecoration(labelText: "Employee"),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.green.shade50,
              child: ListTile(
                title: const Text("Final Applied Shift"),
                subtitle: Text("${applied.shift.name} | ${applied.shift.time}"),
                trailing: Text(applied.level),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Assignment _resolveShift() {
    const priority = ["Employee", "Department", "Project", "Client", "Company"];
    for (var p in priority) {
      final match = LocalDB.assignments
          .where((a) => a.level == p && a.target == employee)
          .toList();
      if (match.isNotEmpty) return match.first;
    }
    return Assignment("Company", "ABC Corp", LocalDB.shifts.first);
  }
}
