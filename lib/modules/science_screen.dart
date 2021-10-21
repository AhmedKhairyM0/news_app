import 'package:news_app/modules/modules.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return articleBuilder(
            items: cubit.science,
            onRefresh: cubit.getScienceNews,
            onTap: () {});
      },
    );
  }
}
