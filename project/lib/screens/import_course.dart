//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:ku_t/Dropdown/BasicsubjectModel.dart';
//import 'package:ku_t/Dropdown/CraditModel.dart';


//import '../Dropdown/TeachernameModel.dart';

class ImportPage extends StatefulWidget {
  // const ImportPage({Key? key}) : super(key: key); //คืออะไร
  
  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {

  // CollectionReference addsubject = FirebaseFirestore.instance.collection('subject'); //call subject tablename //แล้วถ้าต้องการระบุ document(ID) ทำยังไง .doc() แล้ว error ต้องอาศัย Future?
  // final _key = GlobalKey<FormState>();
  // String? selectedValue;
  // String? creditValue;
  // String? teachernameValue;
  // String? basicsubjectValue;
  // late TextEditingController controller;//มีไว้ทำอะไร?

  // TextEditingController coursecodeC = TextEditingController();
  // TextEditingController coursenameC = TextEditingController();

  // void adddata() async { //from ตกลง button
  //   await addsubject.add({
  //     "coursecode": coursecodeC.text.trim(), //couresecode is a field name amd trim() is a String Convert function for \t \n etc.
  //     "credit": creditValue.toString(),
  //     "coursename": coursenameC.text.trim(),
  //     "teachername": teachernameValue.toString(),
  //     "basicsubject": basicsubjectValue.toString()
  //   }).whenComplete(() => Navigator.pop(context)); //when all data is saved in database, close popup
  // }
  // @override
  // void initState() {
  //   super.initState();

  //   controller = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    //final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          'ระบบจัดตารางสอนอาจารย์ มหาวิทยาลัยเกษตรศาสตร์',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(0, 102, 94, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(195, 231, 196, 1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Form(
          //key: _key,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "การนำเข้าข้อมูลหลักสูตร",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              Divider(height: 30),
            ],
          ),
        ),
      ),
    );
  }


}
