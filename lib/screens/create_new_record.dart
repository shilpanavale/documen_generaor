import 'dart:developer';

import 'package:document_generator/model/documen_model.dart';
import 'package:document_generator/utils/app_colors.dart';
import 'package:document_generator/widget/dialog.dart';
import 'package:document_generator/widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/database_helper.dart';
import '../utils/text_styles.dart';
import '../widget/button.dart';
import 'first_page.dart';

class CreateNewRecord extends StatefulWidget{
  const CreateNewRecord({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateNewRecordState();
  }

}
class CreateNewRecordState extends State<CreateNewRecord>{
  final DatabaseHelper dbManager =  DatabaseHelper();
  TextEditingController applicationNoTxt=TextEditingController();
  TextEditingController outWardNoTxt=TextEditingController();
  TextEditingController outWardDateTxt=TextEditingController();
  TextEditingController applicationNameTxt=TextEditingController();
  TextEditingController applicationAddressTxt=TextEditingController();
  TextEditingController opponentNameTxt=TextEditingController();
  TextEditingController opponentAddressTxt=TextEditingController();
  TextEditingController hearingDateTxt=TextEditingController();
  TextEditingController hearingTimeTxt=TextEditingController();
  TextEditingController areaTxt=TextEditingController();
  TextEditingController ctsTxt=TextEditingController();
  TextEditingController propertyAddressTxt=TextEditingController();
  TextEditingController publicDateTxt=TextEditingController();
  TextEditingController publicTimeTxt=TextEditingController();
  static List opponentList = [];


 // List<ServiceCard> multiStopList=[];
  List<Widget> multiStopList=[];
  List<TextEditingController> controllersN=<TextEditingController>[];
  List<TextEditingController> controllersA=<TextEditingController>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    super.initState();
    controllersN.add(TextEditingController());
    controllersN.add(TextEditingController());
    controllersN.add(TextEditingController());
    controllersN.add(TextEditingController());
    controllersN.add(TextEditingController());

    controllersA.add(TextEditingController());
    controllersA.add(TextEditingController());
    controllersA.add(TextEditingController());
    controllersA.add(TextEditingController());
    controllersA.add(TextEditingController());
    outWardDateTxt.text=DateFormat('dd-MM-yyyy').format(DateTime.now());
    hearingDateTxt.text=DateFormat('dd-MM-yyyy').format(DateTime.now());
    publicDateTxt.text=DateFormat('dd-MM-yyyy').format(DateTime.now());

  }
  @override
  void dispose() {
    controllersN.clear();
    controllersA.clear();
    super.dispose();
  }
  void removeServiceCard(index) {
    setState(() {
      multiStopList.remove(index);

    });
  }
  void addServiceCard() {

    setState(() {


        // multiStopList.add(ServiceCard(
        //   removeServiceCard,
        //   index: multiStopList.length,
        //   controllersN: controllersN,
        //   controllersA: controllersA,
        //  ));
        multiStopList.add(buildField(

           multiStopList.length,
           controllersN,
           controllersA,
         ));



    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     backgroundColor: Colors.grey.shade300,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextField(
                controller: applicationNoTxt,
                hintText: 'Application No',
                labelText: 'Application No',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15,),
              CustomTextField(
                controller: outWardNoTxt,
                hintText: 'Outward No',
                labelText: 'Outward No',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15,),
              InkWell(
                onTap: () async {
                  var date = await  selectDate(context);

                  outWardDateTxt.text = DateFormat('dd-MM-yyyy').format(date!);
                  outWardDateTxt.text=date.toString();
                  setState(() {

                  });
                },
                child: DisableTextField(
                  controller: outWardDateTxt,
                  hintText: 'Outward Date',
                  labelText: 'Outward Date',
                ),
              ),
              const SizedBox(height:15,),
              CustomTextField(
                controller: applicationNameTxt,
                hintText: 'Application Name',
                labelText: 'Application Name',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height:15,),
              CustomTextField(
                controller: applicationAddressTxt,
                hintText: 'Application Address',
                labelText: 'Application Address',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 5,),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                   // height: 200,
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:  ColorsForApp.grayLight, width: 1),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child:Column(
                      children: [
                        ...multiStopList
                      ],
                    )
                  ),
                  Positioned(
                    left: 50,
                    top: 0,

                    child: Container(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add Opponent",style: TextHelper.size18,),
                            IconButton(onPressed: (){
                              addServiceCard();
                            }, icon: const Icon(Icons.add_circle_outline,color: Colors.orange,))

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),





              const SizedBox(height:15,),
              InkWell(
                onTap: () async {
                  var date = await  selectDate(context);

                  hearingDateTxt.text = DateFormat('dd-MM-yyyy').format(date!);
                  hearingDateTxt.text=date.toString();
                  setState(() {

                  });
                },
                child: DisableTextField(
                  controller: hearingDateTxt,
                  hintText: 'Hearing Date',
                  labelText: 'Hearing Date',
                ),
              ),const SizedBox(height:15,),
              InkWell(
                onTap: () async {
                  TimeOfDay? time = await pickTime();
                  hearingTimeTxt.text="${time?.hour}:${time?.minute} ${time?.period.toString().split('.')[1]}";
                  setState(() {

                  });
                },
                child: DisableTextField(
                  controller: hearingTimeTxt,
                  hintText: 'Hearing Time',
                  labelText: 'Hearing Time',
                ),
              ),
              const SizedBox(height:15,),
              CustomTextField(
                controller: areaTxt,
                hintText: 'Area (in Sq. Mtrs.)',
                labelText: 'Area (in Sq. Mtrs.)',
                keyboardType: TextInputType.number,
              ),const SizedBox(height:15,),
              CustomTextField(
                controller: ctsTxt,
                hintText: 'CTS/7 - 12 No',
                labelText: 'CTS/7 - 12 No',
                keyboardType: TextInputType.number,
              ),const SizedBox(height:15,),
              CustomTextField(
                controller: propertyAddressTxt,
                hintText: 'Address of the property',
                labelText: 'Address of the property',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height:15,),
              InkWell(
                onTap: () async {

                    var date = await  selectDate(context);

                    publicDateTxt.text = DateFormat('dd-MM-yyyy').format(date!);
                    publicDateTxt.text=date.toString();
                    setState(() {

                    });

                },
                child: DisableTextField(
                  controller: publicDateTxt,
                  hintText: 'Public Notice Date',
                  labelText: 'Public Notice Date',
                ),
              ),const SizedBox(height:15,),
              InkWell(
                onTap: () async {
                  TimeOfDay? time = await pickTime();
                  publicTimeTxt.text="${time?.hour}:${time?.minute} ${time?.period.toString().split('.')[1]}";
                  setState(() {

                  });
                },
                child: DisableTextField(
                  controller: publicTimeTxt,
                  hintText: 'Public Notice Time',
                  labelText: 'Public Notice Time',
                ),
              ),
              const SizedBox(height: 20,),
              CommonButton(onPressed: () {
              if(applicationNoTxt.text.isEmpty){
                const snackBar = SnackBar(
                  content: Text('Please enter application number'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }else{
                insertRecordIntoDB();
              }
              },
              width: MediaQuery.of(context).size.width,label: 'Save',bg: ColorsForApp.blackColor,)
            ],
          ),
        ),
      ),
    );
  }


  Widget buildField(int index,
      List<TextEditingController> controllersN,List<TextEditingController> controllersA ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          CustomTextField(
            controller: controllersN[index],
            hintText: 'Opponent Name',
            labelText: 'Opponent Name',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 15,),
          CustomTextField(
            controller: controllersA[index],
            hintText: 'Opponent Address',
            labelText: 'Opponent Address',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 10,),
          CommonButton(
            onPressed: () {
             // opponentList.clear();
            var map={
              "opponentName":controllersN[index].text,
              "opponentAddress":controllersA[index].text
            };
            opponentList.add(map);
          },
            width: 80,label: 'Save',bg: ColorsForApp.blackColor,)
        ],
      ),
    );
  }
  insertRecordIntoDB() async {
    DialogBuilder(context).showLoadingIndicator('');
    var record = DocumentModel(
        applicationNo:int.parse(applicationNoTxt.text),
        outwardNo:outWardNoTxt.text ,
        outwardDate:outWardDateTxt.text.toString(),
        applicationName:applicationNameTxt.text.toString(),
      applicationAddress: applicationAddressTxt.text.toString(),
      opponents: opponentList.toString(),
     // opponentAddress: opponentAddressTxt.text.toString(),
      hearingDate: hearingDateTxt.text.toString(),
      hearingTime: hearingTimeTxt.text.toString(),
      area: areaTxt.text.toString(),
      cts: ctsTxt.text.toString(),
      propertyAddress: propertyAddressTxt.text.toString(),
      publicDate: publicDateTxt.text.toString(),
      publicNoticeTime: publicTimeTxt.text.toString()

    );
   var isInsert= await dbManager.insertDocument(record);
   log("isInsert-->4$isInsert");
    DialogBuilder(context).hideOpenDialog();


  }
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child:  const Icon(
          Icons.keyboard_arrow_left,
          color: Colors.black,
        ),
      ),
      title:  Text(FirstPage.appTitle,style: TextHelper.h14,),
    );
  }
  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {

      return  picked;

    }else{
      return DateTime.now();
    }

  }
  Future<TimeOfDay?> pickTime()=>showTimePicker(
      context: context, initialTime: TimeOfDay(hour:DateTime.now().hour, minute: DateTime.now().minute));
}
class ServiceCard extends StatefulWidget {
  final int index;
  final List<TextEditingController> controllersN;
  final List<TextEditingController> controllersA;
  final Function(ServiceCard) removeServiceCard;

  const ServiceCard(this.removeServiceCard, { Key? key, required this.index,required this.controllersN,
    required this.controllersA})
      : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          CustomTextField(
            controller: widget.controllersN[widget.index],
            hintText: 'Opponent Name',
            labelText: 'Opponent Name',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 15,),
          CustomTextField(
            controller: widget.controllersA[widget.index],
            hintText: 'Opponent Address',
            labelText: 'Opponent Address',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 10,),
          CommonButton(onPressed: () {

          },
            width: 80,label: 'Save',bg: ColorsForApp.blackColor,)
        ],
      ),
    );
  }
}

