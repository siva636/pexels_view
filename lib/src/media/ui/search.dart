import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_view/src/media/bloc/media_bloc.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:pexels_view/src/media/ui/master_view.dart';

import '../../utility/constant/constant.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
                    suffixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.search),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      context.read<MediaBloc>().add(
                            FetchPage(index: 0, query: controller.text),
                          );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MasterView(),
                        ),
                      );
                    },
                    child: const Text('Search'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
