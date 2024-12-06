import 'package:flutter/material.dart';
import 'package:my_app/model/logged_in_user.dart';
import 'package:my_app/widget/heading_widget.dart';

class RememberUser extends StatefulWidget {
  final ValueChanged<LoggedInUser> onTap;

  RememberUser({super.key, required this.onTap});

  @override
  State<StatefulWidget> createState() {
    return _RememberUser();
  }
}

class _RememberUser extends State<RememberUser> {
  List<LoggedInUser> users = [];

  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    List<LoggedInUser> _users = await LoggedInUser.getLoggedInUserList();
    setState(() {
      users = _users;
    });
  }

  void onRemoveTap(LoggedInUser user) {
    final list = users.where((item) => item.id != user.id).toList();
    LoggedInUser.setUserList(list);
    setState(() {
      users = list;
    });
    if(list.isEmpty){
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    double mheight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: users.length > 5 ? mheight * .5 : mheight * .4,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            HeadingWidget(
              title: "Continue login with",
              fontSize: 14,
            ),
            const SizedBox(
              height: 20,
            ),
            ...users.map((item) {
              return UserDetail(
                user: item,
                onRemoveTap: () {
                  onRemoveTap(item);
                },
                onTap: (){
                  widget.onTap(item);
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class UserDetail extends StatelessWidget {
  final LoggedInUser user;
  final VoidCallback? onRemoveTap;
  final VoidCallback? onTap;

  UserDetail({super.key, required this.user, this.onRemoveTap, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.account_circle)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        HeadingWidget(
                          title: user.email ?? "",
                          fontSize: 12,
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: onRemoveTap,
                            child: const Icon(
                              Icons.delete,
                              size: 15,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
