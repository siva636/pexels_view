import 'package:flutter/material.dart';
import 'package:pexels_view/src/master_view/master_view.dart';
import 'package:pexels_view/src/models/search_model.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late SearchModel searchModel;
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    searchModel = context.read<SearchModel>();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double gutter = getBreakpointEntry(context).gutter;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(gutter),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a value';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fillColor: Colors.black.withOpacity(0.3),
                    filled: true,
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    searchModel.searchResults = [];
                    searchModel.fetchPhotos(controller.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MasterView(),
                      ),
                    );
                  },
                  child: const Text('Search'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
