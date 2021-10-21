import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'NewsItem.dart';

Widget articleBuilder(
    {List<NewsModel>? items,
    Function? onRefresh,
    required void Function() onTap}) {
  return RefreshIndicator(
    onRefresh: () async => onRefresh!(),
    child: ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => NewsItem(
        item: items![index],
        onTap: onTap,
      ),
      separatorBuilder: (context, index) => Divider(
        height: 0.0,
      ),
      itemCount: items!.length,
    ),
  );
}

// Widget defaultTextField({
//   required void Function(String)? onChange,
//   required TextEditingController controller,
//   required String label,
//   required String? Function(String?)? validate,
// }) => TextFormField(
//   controller: controller,
//   onChanged: onChange,
//   validator: validate,
//   decoration: InputDecoration(
//     labelText: label,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10.0),
//       borderSide: BorderSide(color: Colors.green),
//     ),
//   ),

// );

Widget defaultTextField({
  @required TextEditingController? controller,
  TextInputType type = TextInputType.text,
  Function(String)? onChanged,
  Function(String)? onSubmit,
  void Function()? onTap,
  String? Function(String?)? validate,
  @required IconData? prefix,
  @required String? hint,
  bool isPassword = false,
  Widget? suffix,
  bool readOnly = false,
}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        onTap: onTap,
        readOnly: readOnly,
        validator: validate,
        decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          suffixIcon: suffix,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
