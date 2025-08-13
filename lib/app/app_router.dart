import 'package:flutter/material.dart';
import 'package:flutter_ui/core/demo_registry.dart';
import 'package:go_router/go_router.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/demo/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final item = findDemoById(id);
          if (item == null) {
            return Scaffold(
              appBar: AppBar(title: const Text("Not found")),
              body: Center(child: Text("Demo $id not found")),
            );
          }
          return item.builder(context);
        },
      ),
    ],
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _query = "";
  @override
  Widget build(BuildContext context) {
    final filtered = allDemos.where((e) {
      final q = _query.toLowerCase();
      return e.title.toLowerCase().contains(q) ||
          e.tags.any((t) => t.toLowerCase().contains(q));
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureZ Flutter UI Galleries"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (v) => setState(() => _query = v),
              onTapOutside: (e) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (cxt, i) {
          final d = filtered[i];
          return ListTile(
            title: Text(d.title),
            subtitle: Text("${d.categoryTitle}  + ${d.difficulty.name}"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => GoRouter.of(context).push('/demo/${d.id}'),
          );
        },
        itemCount: filtered.length,
      ),
    );
  }
}
