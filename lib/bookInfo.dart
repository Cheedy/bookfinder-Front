import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moteur/model/BookWordModel.dart';
import 'package:moteur/model/BooksModel.dart';
import 'package:moteur/widgets/buttonCharte.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io' show Platform;

class BookInfo extends StatefulWidget {
  String id;
  String title;
  String coverImage;
  String language;
  String textBook;
  String authorName;
  String authorBirthDay;
  String authorDeathDay;
  String subject0;
  String subject1;
  String subject2;
  String subject3;
  String subject4;
  String subject5;
  String subject6;
  String subject7;
  String downloadCount;

  BookInfo({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.language,
    required this.textBook,
    required this.authorName,
    required this.authorBirthDay,
    required this.authorDeathDay,
    required this.subject0,
    required this.subject1,
    required this.subject2,
    required this.subject3,
    required this.subject4,
    required this.subject5,
    required this.subject6,
    required this.subject7,
    required this.downloadCount,
  });
  @override
  _BookInfoState createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> {
  @override
  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      print("error");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff233973)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xffE6E9EE),
        title: Text(
          widget.title,
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
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Book n° ",
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.id,
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            CachedNetworkImage(
              imageUrl: widget.coverImage,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.35,
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Text(
                  "Author : " + widget.authorName,
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "[" +
                      widget.authorBirthDay +
                      "] - [" +
                      widget.authorDeathDay +
                      "]",
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.normal,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.downloadCount,
                                style: GoogleFonts.lato(
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xff233973),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                "Downloads",
                                style: GoogleFonts.lato(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            thickness: 3,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CachedNetworkImage(
                                width: 30,
                                imageUrl: widget.language == "fr"
                                    ? "https://cdn.countryflags.com/thumbs/france/flag-800.png"
                                    : widget.language == "en"
                                        ? "https://cdn.countryflags.com/thumbs/united-kingdom/flag-800.png"
                                        : widget.language == "de"
                                            ? "https://cdn.countryflags.com/thumbs/germany/flag-800.png"
                                            : "https://cdn.countryflags.com/thumbs/united-kingdom/flag-800.png",
                              ),
                              SizedBox(width: 3),
                              Text(
                                "Languages",
                                style: GoogleFonts.lato(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "Bookshelves",
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          color: Color(0xff233973),
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        widget.subject0 != null
                            ? Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Flexible(child: Text(widget.subject0)),
                                ],
                              )
                            : SizedBox(height: 0),
                        widget.subject1 != null
                            ? Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Flexible(child: Text(widget.subject1)),
                                ],
                              )
                            : SizedBox(height: 0),
                        widget.subject2 != null
                            ? Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Flexible(child: Text(widget.subject2)),
                                ],
                              )
                            : SizedBox(height: 0),
                        widget.subject3 != null
                            ? Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Flexible(child: Text(widget.subject3)),
                                ],
                              )
                            : SizedBox(height: 0),
                        widget.subject4 != null
                            ? Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Flexible(child: Text(widget.subject4)),
                                ],
                              )
                            : SizedBox(height: 0),
                        widget.subject5 != null
                            ? Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Flexible(child: Text(widget.subject5)),
                                ],
                              )
                            : SizedBox(height: 0),
                        widget.subject6 != null
                            ? Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Flexible(child: Text(widget.subject6)),
                                ],
                              )
                            : SizedBox(height: 0),
                        widget.subject7 != null
                            ? Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Flexible(child: Text(widget.subject7)),
                                ],
                              )
                            : SizedBox(height: 0),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ButtonCharte(
                    child: Text(
                      "Read the Book",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xff233973),
                        Colors.blue,
                      ],
                    ),
                    onPressed: () {
                      _launchInWebViewOrVC(widget.textBook);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
