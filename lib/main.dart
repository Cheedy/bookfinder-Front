import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moteur/bookInfo.dart';
import 'package:moteur/model/BookWordModel.dart';
import 'package:moteur/model/BooksModel.dart';
import 'package:moteur/model/api.dart';
import 'package:moteur/widgets/Loading.dart';
import 'package:moteur/widgets/MainDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moteur de recherche',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool searchWord = false;
  bool searchCategory = true;
  bool loading = false;
  bool noResult = false;
  bool indexList = true;
  final List<BooksModel> items = [];
  final List<BookWordModel> itemsWords = [];
  final wordText = TextEditingController();

  getBooksByCategory(String word) async {
    loading = true;
    final http.Response response = await http.post(
      Uri.parse(Url.getBookByCategory),
      body: {
        "word": word,
      },
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    var result = responseData['data'];
    var lesLivres = result[3];
    print(result);
    if (lesLivres == null) {
      setState(() {
        noResult = true;
      });
    }
    //print(lesLivres);
    lesLivres?.forEach((livres) {
      final BooksModel livre = BooksModel(
        id: livres['id'],
        title: livres['title'],
        authorsName: livres['authors_name'],
        authorBirthYear: livres['authors_birth_year'],
        authorDeathYear: livres['authors_death_year'],
        subject0: livres['subjects0'],
        subject1: livres['subjects1'],
        subject2: livres['subjects2'],
        subject3: livres['subjects3'],
        subject4: livres['subjects4'],
        subject5: livres['subjects5'],
        subject6: livres['subjects6'],
        subject7: livres['subjects7'],
        subject8: livres['subjects8'],
        subject9: livres['subjects9'],
        subject10: livres['subjects10'],
        bookshelve0: livres['bookshelves0'],
        bookshelve1: livres['bookshelves1'],
        bookshelve2: livres['bookshelves2'],
        bookshelve3: livres['bookshelves3'],
        language: livres['languages'],
        copyright: livres['copyright'],
        mediaType: livres['media_type'],
        coverImage: livres['formatsimagejpeg'],
        textBook: livres['formatstexthtml'],
        downloadCount: livres['download_count'],
        translatorName: livres['translators_name'],
        translatorBirthYear: livres['translators_birth_year'],
        translatorDeathYear: livres['translators_death_year'],
      );
      setState(() {
        noResult = false;
        indexList = false;
        items.add(livre);
        loading = false;
      });
    });
  }

  getBooksByWord(String word) async {
    loading = true;
    final http.Response response = await http.post(
      Uri.parse(Url.getBookByWord),
      body: {
        "word": word,
      },
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    var result = responseData['data'];
    var lesLivresWord = result[3];
    if (result[2] == 0) {
      setState(() {
        noResult = true;
      });
    }
    //print(lesLivres);
    lesLivresWord?.forEach((livresWord) {
      final BookWordModel livre = BookWordModel(
        occurence: livresWord['occurence'].toString(),
        id: livresWord['id'],
        title: livresWord['title'],
        authorsName: livresWord['authors_name'],
        authorBirthYear: livresWord['authors_birth_year'],
        authorDeathYear: livresWord['authors_death_year'],
        subject0: livresWord['subjects0'],
        subject1: livresWord['subjects1'],
        subject2: livresWord['subjects2'],
        subject3: livresWord['subjects3'],
        subject4: livresWord['subjects4'],
        subject5: livresWord['subjects5'],
        subject6: livresWord['subjects6'],
        subject7: livresWord['subjects7'],
        subject8: livresWord['subjects8'],
        subject9: livresWord['subjects9'],
        subject10: livresWord['subjects10'],
        bookshelve0: livresWord['bookshelves0'],
        bookshelve1: livresWord['bookshelves1'],
        bookshelve2: livresWord['bookshelves2'],
        bookshelve3: livresWord['bookshelves3'],
        language: livresWord['languages'],
        copyright: livresWord['copyright'],
        mediaType: livresWord['media_type'],
        coverImage: livresWord['formatsimagejpeg'],
        textBook: livresWord['formatstexthtml'],
        downloadCount: livresWord['download_count'],
        translatorName: livresWord['translators_name'],
        translatorBirthYear: livresWord['translators_birth_year'],
        translatorDeathYear: livresWord['translators_death_year'],
      );
      setState(() {
        noResult = false;
        indexList = false;
        itemsWords.add(livre);
        loading = false;
      });
    });
  }

  getBookByLanguage(String word) async {
    loading = true;
    final http.Response response = await http.post(
      Uri.parse(Url.getBookByLanguage),
      body: {
        "word": word,
      },
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    var result = responseData['data'];
    var lesLivres = result[3];
    print(result);
    if (lesLivres == null) {
      setState(() {
        noResult = true;
      });
    }
    //print(lesLivres);
    lesLivres?.forEach((livres) {
      final BooksModel livre = BooksModel(
        id: livres['id'],
        title: livres['title'],
        authorsName: livres['authors_name'],
        authorBirthYear: livres['authors_birth_year'],
        authorDeathYear: livres['authors_death_year'],
        subject0: livres['subjects0'],
        subject1: livres['subjects1'],
        subject2: livres['subjects2'],
        subject3: livres['subjects3'],
        subject4: livres['subjects4'],
        subject5: livres['subjects5'],
        subject6: livres['subjects6'],
        subject7: livres['subjects7'],
        subject8: livres['subjects8'],
        subject9: livres['subjects9'],
        subject10: livres['subjects10'],
        bookshelve0: livres['bookshelves0'],
        bookshelve1: livres['bookshelves1'],
        bookshelve2: livres['bookshelves2'],
        bookshelve3: livres['bookshelves3'],
        language: livres['languages'],
        copyright: livres['copyright'],
        mediaType: livres['media_type'],
        coverImage: livres['formatsimagejpeg'],
        textBook: livres['formatstexthtml'],
        downloadCount: livres['download_count'],
        translatorName: livres['translators_name'],
        translatorBirthYear: livres['translators_birth_year'],
        translatorDeathYear: livres['translators_death_year'],
      );
      setState(() {
        noResult = false;
        indexList = false;
        items.add(livre);
        loading = false;
      });
    });
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var myBook = this.items[index];
    return loading
        ? Loading()
        : Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    print("g clicker");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookInfo(
                          id: myBook.id,
                          title: myBook.title,
                          coverImage: myBook.coverImage,
                          authorName: myBook.authorsName,
                          authorBirthDay: myBook.authorBirthYear,
                          authorDeathDay: myBook.authorDeathYear,
                          textBook: myBook.textBook,
                          language: myBook.language,
                          downloadCount: myBook.downloadCount,
                          subject0: myBook.subject0,
                          subject1: myBook.subject1,
                          subject2: myBook.subject2,
                          subject3: myBook.subject3,
                          subject4: myBook.subject4,
                          subject5: myBook.subject5,
                          subject6: myBook.subject6,
                          subject7: myBook.subject7,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Url.gris.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: myBook.coverImage,
                                  placeholder: (context, url) => Loading(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            top: 5,
                                          ),
                                          child: Text(
                                            myBook.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            myBook.authorsName == null
                                                ? ""
                                                : myBook.authorsName,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 10,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      myBook.downloadCount,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.download,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
  }

  Widget _listViewItemBuilderTwo(BuildContext context, int index) {
    var myBook = this.itemsWords[index];
    return loading
        ? Loading()
        : Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookInfo(
                          id: myBook.id,
                          title: myBook.title,
                          coverImage: myBook.coverImage,
                          authorName: myBook.authorsName,
                          authorBirthDay: myBook.authorBirthYear,
                          authorDeathDay: myBook.authorDeathYear,
                          textBook: myBook.textBook,
                          language: myBook.language,
                          downloadCount: myBook.downloadCount,
                          subject0: myBook.subject0,
                          subject1: myBook.subject1,
                          subject2: myBook.subject2,
                          subject3: myBook.subject3,
                          subject4: myBook.subject4,
                          subject5: myBook.subject5,
                          subject6: myBook.subject6,
                          subject7: myBook.subject7,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Url.gris.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: myBook.coverImage,
                                  placeholder: (context, url) => Loading(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 5),
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            top: 5,
                                          ),
                                          child: Text(
                                            myBook.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            myBook.authorsName == null
                                                ? ""
                                                : myBook.authorsName,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 10),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 10,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      myBook.downloadCount,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.download,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE6E9EE),
        title: Text(
          "BookFinder",
          style: GoogleFonts.lato(
            fontStyle: FontStyle.normal,
            color: Color(0xff233973),
            fontWeight: FontWeight.w700,
          ),
        ),
        bottomOpacity: 0.0,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xffE6E9EE),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: searchWord
                              ? MaterialStateProperty.all<Color>(
                                  Colors.black.withOpacity(0.8))
                              : MaterialStateProperty.all<Color>(
                                  Color(0xff231FC8)),
                        ),
                        onPressed: () {
                          setState(() {
                            searchWord = !searchWord;
                            searchCategory = !searchCategory;
                            print("word" + searchWord.toString());
                          });
                        },
                        child: Text("Rechercher un mot"),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: searchCategory
                              ? MaterialStateProperty.all<Color>(
                                  Colors.black.withOpacity(0.8))
                              : MaterialStateProperty.all<Color>(
                                  Color(0xff231FC8)),
                        ),
                        onPressed: () {
                          setState(() {
                            searchCategory = !searchCategory;
                            searchWord = !searchWord;
                            print("cat" + searchCategory.toString());
                          });
                        },
                        child: Text("Rechercher une catégorie"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Color(0xff1F4CAE),
                    ),
                    onPressed: () {
                      setState(() {
                        indexList = true;
                        noResult = false;
                        wordText.clear();
                        items.clear();
                      });
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: wordText,
                      decoration: InputDecoration(
                        hintText: 'Quel livre vous cherchez ?',
                        labelText: searchWord
                            ? "Vous cherchez un mot"
                            : "Vous cherchez une catégorie",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Color(0xff1F4CAE),
                    ),
                    onPressed: () {
                      if (searchCategory) {
                        setState(() {
                          items.clear();
                          indexList = false;
                          getBooksByCategory(wordText.text);
                        });
                      }
                      if (searchWord) {
                        setState(() {
                          itemsWords.clear();
                          indexList = false;
                          getBooksByWord(wordText.text);
                        });
                      }
                    },
                  )
                ],
              ),
              SizedBox(height: 30),
              indexList
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                "Selectionnez une langue",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    items.clear();
                                    indexList = false;
                                    getBookByLanguage("fr");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Url.gris.withOpacity(0.5),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://cdn.countryflags.com/thumbs/france/flag-800.png",
                                                fit: BoxFit.contain,
                                                width: 50,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              child: Text(
                                                "Français",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    items.clear();
                                    indexList = false;
                                    getBookByLanguage("de");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Url.gris.withOpacity(0.5),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://cdn.countryflags.com/thumbs/germany/flag-800.png",
                                                fit: BoxFit.contain,
                                                width: 50,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              child: Text(
                                                "Allemand",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    items.clear();
                                    indexList = false;
                                    getBookByLanguage("en");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Url.gris.withOpacity(0.5),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://cdn.countryflags.com/thumbs/united-kingdom/flag-800.png",
                                                fit: BoxFit.contain,
                                                width: 50,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              child: Text(
                                                "Anglais",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                "Selectionnez un genre",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    items.clear();
                                    indexList = false;
                                    getBooksByCategory("Romance");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Url.gris.withOpacity(0.5),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://cdn-icons.flaticon.com/png/512/677/premium/677684.png?token=exp=1645215952~hmac=d6f357d3144d15787d36fd649bc4b107",
                                                fit: BoxFit.contain,
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              child: Text(
                                                "Romance",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    items.clear();
                                    indexList = false;
                                    getBooksByCategory("Adventure");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Url.gris.withOpacity(0.5),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://cdn-icons.flaticon.com/png/512/3819/premium/3819743.png?token=exp=1645216326~hmac=2299bc9f4924048fa72be275a45856c2",
                                                fit: BoxFit.contain,
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              child: Text(
                                                "Adventure",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    items.clear();
                                    indexList = false;
                                    getBooksByCategory("Horror");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Url.gris.withOpacity(0.5),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https://cdn-icons.flaticon.com/png/512/2267/premium/2267712.png?token=exp=1645216545~hmac=c219ce29b0d25f286fb01df46fdcd012",
                                                fit: BoxFit.contain,
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              child: Text(
                                                "Horror",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : noResult
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 30),
                            Text("Aucun résultat pour votre recherche"),
                          ],
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          padding: EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            itemCount: searchCategory
                                ? this.items.length
                                : this.itemsWords.length,
                            itemBuilder: searchCategory
                                ? _listViewItemBuilder
                                : _listViewItemBuilderTwo,
                          ))
            ],
          ),
        ),
      ),
    );
  }
}
