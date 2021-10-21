import 'package:news_app/modules/modules.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();
  var searchTyping = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: defaultTextField(
                  controller: searchController,
                  hint: 'Search',
                  validate: (value) {
                    if (value!.isEmpty) return 'Search must not be empty';
                    return null;
                  },
                  onChanged: (value) {
                    cubit.getSearch(value);
                  },
                  prefix: null,
                ),
              ),
              Expanded(
                  child: articleBuilder(items: cubit.search, onTap: () {})),
            ],
          ),
        );
      },
    );
  }
}
