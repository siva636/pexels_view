import 'package:flutter/material.dart';
import 'package:pexels_view/src/constants/constants.dart';
import 'package:pexels_view/src/master_view/master_view.dart';
import 'package:pexels_view/src/models/search_model.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(screenPadding),
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
