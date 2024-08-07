import 'package:e_school/chatgpt/chat.dart';
import 'package:e_school/language/language.dart';
import 'package:e_school/language/language_constants.dart';
import 'package:e_school/layout/home_layout/home_layout.dart';
import 'package:e_school/main.dart';
import 'package:e_school/modules/about_us/about_screen.dart';
import 'package:e_school/modules/posts/posts_screen.dart';
import 'package:e_school/modules/profile/profile_screen.dart';
import 'package:e_school/modules/school_login/login_screen.dart';
import 'package:e_school/modules/settings/settings_screen.dart';
import 'package:e_school/shared/components/components.dart';
import 'package:e_school/shared/network/local/cache_helper.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class TheMenu extends StatelessWidget {
  String? name;
  String? email;
  String? image;
  TheMenu(this.name,this.email,this.image);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${name}',),
            accountEmail:Text('${email}'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('${image}'),
              ),
            ),
            decoration: BoxDecoration(
              color: kDarkBlue2Color,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(translation(context).home),
              onTap: (){
                navigateTo(context, HomeLayout());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.mark_unread_chat_alt_outlined),
              title: Text('Chat Bot'),
              onTap: (){
                navigateTo(context, ChatPage());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.newspaper
              ),
              title: Text(translation(context).news),
              onTap: (){
                navigateTo(context, PostsScreen());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(translation(context).profile),
              onTap: (){
                navigateTo(context, ProfileStudent());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text(translation(context).about),
              onTap: (){
                navigateTo(context, AboutScreen());
              },
            ),
          ),
          Card(
              child: ListTile(
                leading: Icon(Icons.language),
                title: DropdownButton<Language>(
                  underline: const SizedBox(),
                  hint: Text(translation(context).language),
                  onChanged: (Language? language) async {
                    if (language != null) {
                      Locale _locale = await setLocale(language.languageCode);
                      MyApp.setLocale(context, _locale);
                    }
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
              )
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(translation(context).settings),
              onTap: (){
                navigateTo(context, SettingsScreen());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: (){
                CacheHelper.removeData(key: 'token').then((value) {
                  if(value!){
                    navigateAndFinish(context, SchoolLoginScreen());
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
