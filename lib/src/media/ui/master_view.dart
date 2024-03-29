import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_view/src/media/bloc/media_bloc.dart';
import 'package:pexels_view/src/media/model/photo.dart';
import 'package:pexels_view/src/media/ui/empty.dart';
import 'package:pexels_view/src/media/ui/single_view.dart';
import 'package:pexels_view/src/utility/constant/constant.dart';
import 'package:pexels_view/src/utility/enum/view_state.dart';
import 'package:pexels_view/src/ux/loading/loading.dart';
import 'package:pexels_view/src/ux/error/error.dart';

class MasterView extends StatefulWidget {
  const MasterView({Key? key}) : super(key: key);

  @override
  State<MasterView> createState() => _MasterViewState();
}

class _MasterViewState extends State<MasterView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int columns = getBreakpointEntry(context).columns;

    return BlocBuilder<MediaBloc, MediaState>(
        builder: (context, MediaState ms) {
      if (ms.viewState == ViewState.busy) {
        return const Loading();
      }
      if (ms.viewState == ViewState.error) {
        return const Error();
      }

      if (ms.viewState == ViewState.idle && ms.pages.isEmpty) {
        return const Empty();
      }

      return Scaffold(
        appBar: AppBar(),
        body: GridView.builder(
            itemCount: ms.itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns ~/ 2),
            itemBuilder: (context, index) {
              MediaBloc mb = context.watch<MediaBloc>();
              var item = mb.state.getByIndex(index);
              if (item == null) {
                mb.add(FetchPage(index: index, query: mb.state.query!));
              }
              return PhotoDisplay(
                photo: item,
                index: index,
              );
            }),
      );
    });
  }
}

// display for Photo
class PhotoDisplay extends StatelessWidget {
  final Photo? photo;
  final int index;
  const PhotoDisplay({Key? key, this.photo, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (photo != null) {
      return Padding(
        padding: const EdgeInsets.all(imagePadding),
        child: InkWell(
          onTap: () {
            MediaBloc mb = context.read<MediaBloc>();
            mb.add(FetchItem(id: photo!.id));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SingleView(photo!),
            ));
          },
          child: Hero(
              tag: photo!.id,
              child: Image.network(
                photo!.mediumUrl,
              )),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(imagePlaceHolderPadding),
        child: Image.asset(
          imagePlaceholderUrlUrl,
        ),
      );
    }
  }
}
