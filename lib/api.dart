import 'package:flutter/material.dart';
import 'package:zxcv/articles.dart';
import 'package:zxcv/articlesdata.dart';
import 'package:zxcv/details.dart';

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {
  //r ai place ta hocce function er bahire global place aita
  //aikhan a jaikono variable toiri korle sob jaygay use kora jay
  //bujte parsen ki
  // ok r kono prblm ase ki ?
  //wait amr baba call dise
  List<Articles> _articleslist = <Articles>[];
  articlesget() async {
    // aponi aikhan a list toiri korcilen aikhan a toiri korle list tow
    //function er bahire kaj korbe na
    ArticlesData articlesData = ArticlesData();
    await articlesData.getarticles();
    setState(() {
      _articleslist = articlesData.articleslist;
    });
  }

  @override
  void initState() {
    articlesget();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff120268),
        title: Center(child: Text("News")),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:100,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                            height: 100,
                            width: MediaQuery.of(context).size.width * .5,
                            child: Image.asset(
                              "Image/capa-artigo-api-.jpg",
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),

                  );

                  SizedBox(height: 7,);
                }),
          ),
          Container(

            height: MediaQuery.of(context).size.height * .72,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _articleslist.length,
                // is it ok ? ok take care vul ta hoicilo aponi listta
                // function er vitor toiri korcilen
                //list ta global toiri korte hoto class er opr por ai
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(

                      children: [

                        Text(_articleslist[index].author.toString(),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius:BorderRadius.circular(10),
                                  child: Image.network(
                                    _articleslist[index].urlToImage.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),

                              Container(
                                  margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                                  alignment: Alignment.topRight,
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    _articleslist[index].publishedAt.toString(),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                            ]
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _articleslist[index].title.toString(),
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _articleslist[index].description.toString(),
                            style: TextStyle(fontSize: 25, color: Colors.black26),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=>Deatils(
                            _articleslist[index].url.toString(),
                          )
                      )
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
