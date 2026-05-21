import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/error_toast.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/fire_main_screen.dart';
import 'package:random_widget_learn/FIREBASE_LEARN/firebase_ui/login_screen.dart';
import 'package:random_widget_learn/RESTApi/mainScreen.dart';
import 'package:random_widget_learn/RESTApi/second_main_screen_with_custom_model.dart';
import 'package:random_widget_learn/SQLITE_DATABASE/main_screen.dart';
import 'package:random_widget_learn/Scrollbar_widget.dart';
import 'package:random_widget_learn/Shared_Preference_learn.dart';
import 'package:random_widget_learn/animationcontainer_widget.dart';
import 'package:random_widget_learn/backdropFilter.dart';
import 'package:random_widget_learn/camera_use_take_photo.dart';
import 'package:random_widget_learn/dismissible_widgets.dart';
import 'package:random_widget_learn/draggable_widget.dart';
import 'package:random_widget_learn/fie_system_access_learn.dart';
import 'package:random_widget_learn/firebase.dart';
import 'package:random_widget_learn/firebase_database.dart';
import 'package:random_widget_learn/flutter_all_widget.dart';
import 'package:random_widget_learn/flutter_secure_storage.dart';
import 'package:random_widget_learn/getx_statemanagement.dart';
import 'package:random_widget_learn/gex_change_language.dart';
import 'package:random_widget_learn/hero_widgets.dart';
import 'package:random_widget_learn/howdatabase__create/howdatabase_create.dart';
import 'package:random_widget_learn/howdatabase__create/provider.dart';
import 'package:random_widget_learn/howdatabase__create/providermodel.dart';
import 'package:random_widget_learn/http_learn/second_main_screen.dart';
import 'package:random_widget_learn/inkresponse_widget.dart';
import 'package:random_widget_learn/learn_dart.dart';
import 'package:random_widget_learn/learn_dio/mian_dio.dart';
import 'package:random_widget_learn/navigationbar_widget.dart';
import 'package:random_widget_learn/navigationdrawer_widget.dart';
import 'package:random_widget_learn/path_provider_Learn.dart';
import 'package:random_widget_learn/phoneauth.dart';
import 'package:random_widget_learn/riverpod_widget.dart';
import 'package:random_widget_learn/snackbar_widget.dart';
import 'package:random_widget_learn/stepper_widgets.dart';
import 'package:random_widget_learn/tabbar_widgets.dart';
import 'package:random_widget_learn/tabselectorviews.dart';
import 'DESIGN_APPS_UI/cheas_screen_ui.dart';
import 'DESIGN_APPS_UI/movies_scree_ui.dart';
import 'FIREBASE_LEARN/firebase_ui/splash_screen.dart';
import 'Navigationbar.dart';
import 'bottomnavigationbar.dart';
import 'dialog_widget.dart';
import 'expanded_appbar_widget.dart';
import 'firebase_options.dart';
import 'firebase_show_data_screen.dart';

// provider_examle
// void main() async {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => providerexplain(),
//       child: MyApp(),
//     ),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(
    // Riverpod scope must be at the top
    ProviderScope(
      child: ChangeNotifierProvider(
        create: (context) => providerexplain(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class AllWidgetsCover extends StatefulWidget {
  const AllWidgetsCover({super.key});

  @override
  State<AllWidgetsCover> createState() => _AllWidgetsCoverState();
}

class _AllWidgetsCoverState extends State<AllWidgetsCover> {
  List topic = [
    'Stepper Widgets',
    'TabBar Widgets',
    'Expanded Appbar Widgets',
    'Navigationbar',
    'Camera Use Take Photo',
    'Tapselectorview'
        'Api Integration',
    'Learn dart',
    'Firebase learn',
    'How DataBase Create',
    'FLUTTER ALL WIDGETS',
    'BottomNavigationBar',
    'NAVIGATIONBAR WIDGET',
    'NavigationDrawer',
    'SnackBar Widget',
    'Diaglog Show',
    'inkResponse',
    'Scrollbar',
    'Hero Animation',
    'animation container widget',
    'Dismissible Widget',
    'Draggable Widget',
    'Backdropfilter',
    'Provider State Management',
    'Riverpod State management',
    'Getx State Management',
    'Http Api Handling Learn',
    'Learn RESTApi in flutter',
    'Rest Api with custom model',
    'Lear_dio_for_api_handling',
    'Learn Shared Preference',
    'Learn path provider',
    'File System Access Learn',
    'Flutter secure storage Learn',
    'SQLite Database Learn',
    'Firebase Project',
    'Firebase Database Learn',
    'Cheas Screen Ui Design',
    'Movies App Ui Design',
  ];
  List<Widget> widgets = [
    StepperWidgets(),
    TabbarWidgets(),
    ExpandedAppbarWidget(),
    Navigationbars(),
    CameraUseTakePhoto(),
    tabviewtoselectiontime(),
    LearnDart(),
    FirebaseProject(),
    HowdatabaseCreate(),
    FlutterAllWidget(),
    Bottomnavigationbar(),
    NavigationbarWidget(),
    NavigationdrawerWidget(),
    SnackbarWidget(),
    DialogWidget(),
    ALL_SMALL_WIDGET(),
    ScrollbarWidget(),
    HeroWidgets(),
    AnimationcontainerWidget(),
    DismissibleWidgets(),
    DraggableWidget(),
    BackdropfilterWidgets(),
    Provider_statemenagement(),
    RiverpodHomeScreen(),
    GetxHomeScreen(),
    HomeContainer(),
    Mainscreen(),
    SecondMainScreenWithCustomModel(),
    Main_dio_Learn(),
    SharedPreferenceLearn(),
    PathProviderLearn(),
    FileSystemAccessLearn(),
    FlutterSecureStorageLearn(),
    MainScreen(),
    FireMainScreen(),
    FirebaseShowDataScreen(),
    CheasScreenUi(),
    MoviesScreeUi(),
  ];
  List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.lightBlueAccent,
    Colors.cyanAccent,
    Colors.tealAccent,
    Colors.greenAccent,
    Colors.lightGreenAccent,
    Colors.limeAccent,
    Colors.yellowAccent,
    Colors.amberAccent,
    Colors.orangeAccent,
    Colors.deepOrangeAccent,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.lightBlueAccent,
    Colors.cyanAccent,
    Colors.tealAccent,
    Colors.greenAccent,
    Colors.lightGreenAccent,
    Colors.limeAccent,
    Colors.yellowAccent,
    Colors.amberAccent,
    Colors.orangeAccent,
    Colors.deepOrangeAccent,
  ];
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  auth
                      .signOut()
                      .then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      })
                      .onError((error, stackTrace) {
                        ErrorToast().errorhandle(error.toString(), context);
                      });
                },
                icon: Icon(Icons.logout, color: Colors.white),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            centerTitle: true,
            elevation: 10,
            title: Text(
              'Flutter All widgets',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: ListView.builder(
            itemCount: topic.length,
            itemBuilder: (context, index) {
              if (colors.length < index) {
                colors[index] = colors[0];
              }
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widgets[index]),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(21)),
                  ),
                  margin: EdgeInsets.all(4.0),
                  elevation: 10,
                  color: colors[index],
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      topic[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
