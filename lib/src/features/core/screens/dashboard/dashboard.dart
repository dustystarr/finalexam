import 'package:flutter/material.dart';
import 'package:login_flutter_app/src/constants/image_strings.dart';
import 'package:login_flutter_app/src/constants/sizes.dart';
import 'package:login_flutter_app/src/constants/text_strings.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:login_flutter_app/src/features/core/screens/dashboard/widgets/top_courses.dart';
import 'package:login_flutter_app/src/features/core/screens/google.dart';
import 'package:login_flutter_app/src/features/core/screens/qrscan.dart';
import 'package:login_flutter_app/src/features/core/screens/lottie.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark; 

    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(isDark: isDark),
        
        drawer: Drawer(
          child: ListView(
            children:  [
              UserAccountsDrawerHeader(
                currentAccountPicture: Image(image: AssetImage(tLogoImage)),
                currentAccountPictureSize: Size(100, 100),
                accountName: Text('Макдон'),
                accountEmail: Text('sessia@uib.kz'),
              ),
              ListTile(
                leading: Icon(Icons.qr_code_scanner),
                title: Text('Сканнер'),
                onTap: () {
                  // Навигация на страницу QRScanPage при нажатии на "Домой"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScanPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Карта'),
                onTap: () {
                  // Навигация на страницу MapPage при нажатии на "Профиль"
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Лайк'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LottiePage()),
                  );
                  // Обработка нажатия на "Избранные"
                  // Например, навигация на страницу с избранным контентом
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(tDashboardTitle, style: txtTheme.bodyMedium),
                Text(tDashboardHeading, style: txtTheme.displayMedium),
                const SizedBox(height: tDashboardPadding),

                
                DashboardSearchBox(txtTheme: txtTheme),
                const SizedBox(height: tDashboardPadding),

                
                DashboardCategories(txtTheme: txtTheme),
                const SizedBox(height: tDashboardPadding),

                
                DashboardBanners(txtTheme: txtTheme, isDark: isDark),
                const SizedBox(height: tDashboardPadding),

                
                Text(tDashboardTopCourses, style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2)),
                DashboardTopCourses(txtTheme: txtTheme, isDark: isDark)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
