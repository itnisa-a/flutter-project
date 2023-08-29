import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ku_t/screens/dashboard_screen.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:unicons/unicons.dart';

//on test
import 'package:ku_t/screens/import_course.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAce3unDUcQ6AJZu3PtGIZFk-UNCIT5Ojw", 
      appId: "1:1054979711267:web:c0d9aa3ebe2e72043cec96", 
      messagingSenderId: "1054979711267", 
      projectId: "setable-e4c54")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
const primaryColor = Colors.white;
const canvasColor = Color.fromRGBO(0, 102, 94, 1);
const scaffoldBackgroundColor = Color.fromARGB(255, 255, 255, 255);

class _MyHomePageState extends State<MyHomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 500;
          return Scaffold(
            key: _key,
            // appBar: isSmallScreen ? AppBar(
            //   title: Text("ระบบจัดตารางสอนอาจารย์ มหาวิทยาลัยเกษตรศาสตร์"),
            //   elevation: 0,
            //   backgroundColor: Color.fromRGBO(195, 231, 196, 1),
            //   leading: IconButton(
            //     onPressed: (){
            //       _key.currentState?.openDrawer();
            //     },
            //     icon: Icon(Icons.menu),
            //   ),
            // ): null,
            drawer: SideBarXExample(controller: _controller,),
            body: Row(
              children: [
                if(!isSmallScreen) SideBarXExample(controller: _controller),
                Expanded(child: Center(child: Container(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context,child){
                      switch(_controller.selectedIndex){
                        case 0: _key.currentState?.closeDrawer();
                        //return ManagementPage();

                        //------------------------on test---------------------------------
                        return ImportPage();

                        //----------------------------------------------------------------
                        case 1: _key.currentState?.closeDrawer();
                        return Center(
                          child: Text('Search',style: TextStyle(color: Colors.white,fontSize: 40),),
                        );
                        case 2: _key.currentState?.closeDrawer();
                        return Center(
                          child: Text('Settings',style: TextStyle(color: Colors.white,fontSize: 40),),
                        );
                        case 3: _key.currentState?.closeDrawer();
                        return Center(
                          child: Text('Theme',style: TextStyle(color: Colors.white,fontSize: 40),),
                        );
                        default:
                          return Center(
                            child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 40),),
                          );
                      }
                    },
                  ),
                ),))
              ],
            )
          );
        }
      ),
    );
  }
}

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller}) : _controller = controller,super(key: key);
  final SidebarXController _controller;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      animationDuration: Duration(milliseconds: 300),
      theme:  const SidebarXTheme(
        itemMargin: EdgeInsets.symmetric(horizontal: 15, vertical:5),
        selectedItemMargin: EdgeInsets.symmetric(horizontal: 15, vertical:5),
        selectedItemDecoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
          )
          
        ),
        textStyle: TextStyle(
          color: Colors.white),
        decoration: BoxDecoration(
            color: canvasColor,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedIconTheme: IconThemeData(
          color: Color.fromRGBO(0, 102, 94, 1)
        ),
        selectedTextStyle: const TextStyle(color: Color.fromRGBO(0, 102, 94, 1)),
      ),
      extendedTheme: const SidebarXTheme(
          width: 250
      ),
      
      // footerDivider: Divider(color:  Color.fromARGB(255, 255, 0, 0).withOpacity(0.8), height: 1,),
      headerBuilder: (context,extended){
        return Container(
          padding: EdgeInsets.only(top: 30),
          child: const  SizedBox(
            height: 100,
            child: Text('KU',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white
            ),)
          ),
        );
      },

      items: const [
        SidebarXItem(icon: UniconsLine.table, label: '   การจัดการข้อมูลหลักสูตร',
        ),
        SidebarXItem(icon: UniconsLine.list_ul, label: '   การกำหนดเวลาสอน'),
        SidebarXItem(icon: UniconsLine.calendar_alt, label: '   ตารางสอน'),
      ],
    );
  }
}