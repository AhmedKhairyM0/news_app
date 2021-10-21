import 'package:news_app/modules/modules.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return articleBuilder(items: cubit.business, onRefresh: cubit.getBusinessNews, onTap: (){});
      },
    );
  }
}
