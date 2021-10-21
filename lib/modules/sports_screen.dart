import 'package:news_app/modules/modules.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return articleBuilder(items: cubit.sport, onRefresh: cubit.getSportNews, onTap: () {  });
      },
    );
  }
}
