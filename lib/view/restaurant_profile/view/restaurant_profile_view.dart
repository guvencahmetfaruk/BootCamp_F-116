import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:oua/core/base/view/base_view.dart';
import 'package:oua/core/init/theme/app_theme_light.dart';
import 'package:oua/view/restaurant_profile/view_model/restaurant_profile_view_model.dart';

class RestaurantProfileView extends StatelessWidget {
  const RestaurantProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: RestaurantProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, value) => Observer(builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Column(children: [
              _header(context),
              _ucButton(),
              const Divider(thickness: 3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.black,
                      width: context.width * 0.2,
                      height: context.height * 0.1,
                    );
                  },
                ),
              )
            ]),
          ),
        );
      }),
    );
  }

  SizedBox _header(BuildContext context) {
    return SizedBox(
      height: context.height * 0.28,
      child: Row(
        children: [
          SizedBox(
            width: context.width * 0.7,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        minRadius: context.width * 0.1,
                        child: const Icon(Icons.person),
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          "İşletme İsmi",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("Puanı: 10/10"),
                        Text("Değerlindirme Sayısı:2222"),
                        Text("Yorum Sayısı: 1111 ")
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text("Restoran Hakkında"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: context.width * 0.3,
            child: Column(children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Icon(
                  Icons.directions,
                  color: AppThemeLight.instance.appColorScheme.surface,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Icon(
                  Icons.book,
                  color: AppThemeLight.instance.appColorScheme.surface,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Icon(
                  Icons.comment_bank_outlined,
                  color: AppThemeLight.instance.appColorScheme.surface,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Icon(
                  Icons.add_business_outlined,
                  color: AppThemeLight.instance.appColorScheme.surface,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget _ucButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              "Kullanıcı Paylaşımları",
              style: TextStyle(color: AppThemeLight.instance.appColorScheme.surface),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              "Ürünler",
              style: TextStyle(color: AppThemeLight.instance.appColorScheme.surface),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              "Yorumlar",
              style: TextStyle(color: AppThemeLight.instance.appColorScheme.surface),
            ),
          ),
        ],
      ),
    );
  }
}
