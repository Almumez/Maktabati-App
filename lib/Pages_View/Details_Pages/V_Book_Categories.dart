import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

import '../../Models/M_View_Book.dart';
import '../../component/crud.dart';
import '../../const/CustomPageRoute.dart';
import '../../const/constance.dart';
import '../../const/linkapi.dart';
import '../../const/mnue.dart';
import 'Details_book.dart';


class V_Book_Categories extends StatefulWidget {
  final id;
  final name;
  const V_Book_Categories({Key? key ,required  this.id,required this.name} ) : super(key: key);

  @override
  State<V_Book_Categories> createState() => _V_Book_CategoriesState();
}

class _V_Book_CategoriesState extends State<V_Book_Categories> with Crud {
  @override


  GetBooks() async {
    var response = await postRequest(View_Book_Cat, {
      "id":widget.id
    });
    print(response);

    if (response['status'] == "success") {
      print("success");
    } else {
      print("error");
    }
    return response;
  }
  Widget build(BuildContext context) {
    return Scaffold(

        drawer: mnue(),
        appBar: AppBar(
          title: Text(widget.name),
          centerTitle: true,
          backgroundColor: primary_Color,
          shadowColor: Colors.white,
          actions: [],
        ),
        body: FutureBuilder(
          future: GetBooks(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data['data']?.length,
                padding: EdgeInsets.only(top: 50),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 2,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 0),
                itemBuilder: (context, index) {
                  return FocusedMenuHolder(
                    menuWidth: 60.5,


                    animateMenuItems: false,

                    menuItems: [

                      FocusedMenuItem(title: Text(""), onPressed: () {


                      }, trailingIcon: Icon(Icons.edit,
                        color: primary_Color,)),
                      FocusedMenuItem(title: Text(""), onPressed: () async{
                        var response = await postRequest(
                            delete_book, {
                          "id": "${M_View_Book.fromJson(snapshot.data['data'][index]).bookId}",
                          "imagename": "${M_View_Book.fromJson(snapshot.data['data'][index]).photo}"
                        });

                        if(response["status"]=="success")
                        {

                          AwesomeDialog(dialogType: DialogType.success,context: context,title: "مبروك",body: Text("تم الحذف بنجاح"))..show();


                        }
                        else{

                          AwesomeDialog(dialogType: DialogType.error,context: context,title: "تنبيه",body: Text("خطاء لم يتم الحذف "))..show();

                        }
                        print("************************");
                        print(response);
                        print("************************");

                      }, trailingIcon: Icon(Icons.delete,
                        color: Colors.red,))
                    ],
                    onPressed: (){},
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                            context,
                            new CustomPageRoute(child:  Detalis_book(
                              subtitle: "${M_View_Book.fromJson(snapshot.data['data'][index]).subtitle}",
                              id: "${M_View_Book.fromJson(snapshot.data['data'][index]).bookId}"
                              ,title: "${M_View_Book.fromJson(snapshot.data['data'][index]).title}"
                              ,auther_name: "${M_View_Book.fromJson(snapshot.data['data'][index]).authorName}"
                              ,copy_num: "${M_View_Book.fromJson(snapshot.data['data'][index]).num_of_copies}"
                              ,dascription: "${M_View_Book.fromJson(snapshot.data['data'][index]).description}",
                              Publisher: "${M_View_Book.fromJson(snapshot.data['data'][index]).pub_name}",
                              laung: "${M_View_Book.fromJson(snapshot.data['data'][index]).lang_name}",
                              Categories: "${M_View_Book.fromJson(snapshot.data['data'][index]).cat_name}",
                              date:"${M_View_Book.fromJson(snapshot.data['data'][index]).publicationDate}",
                              formate: "${M_View_Book.fromJson(snapshot.data['data'][index]).format}",
                              Image_url: link_Image +"books/"+ "${M_View_Book.fromJson(snapshot.data['data'][index]).photo}"
                              ,page_num: "${M_View_Book.fromJson(snapshot.data['data'][index]).pagesNo}"
                              ,price:"${M_View_Book.fromJson(snapshot.data['data'][index]).price}"
                              ,Reting: "${M_View_Book.fromJson(snapshot.data['data'][index]).rating}",
                              Size: "${M_View_Book.fromJson(snapshot.data['data'][index]).size}",)));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black54)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Image.network('$link_Image/books/${snapshot.data['data'][index]['photo']}'),
                                          height: 160,
                                        ),


                                        Expanded(
                                          flex: 1,
                                          child: Text("${M_View_Book.fromJson(snapshot.data['data'][index]).title}",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color.fromRGBO(32, 44, 83, 100),
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text("${M_View_Book.fromJson(snapshot.data['data'][index]).authorName}",style:TextStyle(
                                              color: Color.fromRGBO(32, 122, 122, 100)
                                          ) ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: RatingBarIndicator(itemSize: 20,itemCount: 5,rating:double?.parse("${M_View_Book.fromJson(snapshot.data['data'][index]).rating}") ,itemBuilder: (context, index) {
                                            return  Icon(Icons.star, color: Colors.amber,);
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                ))),
                      ),
                    ),
                  );
                },
              );
            }
            // if()
            //print("Hi "+snapshot.data['data'].length);
            if(snapshot.data['data'].length < 0){
              return Text("laoding.....");
            }
            return Text("laoding.....");
          },
        )



    );
  }
}
