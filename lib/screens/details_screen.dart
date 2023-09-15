import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/colors.dart';
import 'package:netflix/constants.dart';

import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
          leading: Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(top: 16,left: 16),
            decoration: BoxDecoration(color: Colours.scaffoldBgColor ,borderRadius: BorderRadius.circular(8)),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
            ),
          ),
          backgroundColor: Colours.scaffoldBgColor,
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(movie.title, style: GoogleFonts.belleza(fontSize: 17 , fontWeight: FontWeight.w600),
            ),
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network('${Constants.imagePath}${movie.poster_path}',
              filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                  Text('Overview', style: GoogleFonts.openSans(fontSize:30 , fontWeight: FontWeight.w800)
                  ),
                SizedBox(height: 16),
                Text(movie.overview ,  style: GoogleFonts.roboto(fontSize: 25 , fontWeight: FontWeight.w400 ),
                textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),

                SizedBox(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Text('Releasing Date : ' , style: GoogleFonts.openSans(fontSize:15 , fontWeight: FontWeight.bold),
                          ),
                          Text(movie.release_date , style: GoogleFonts.roboto(fontSize:17 , fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),

                    Container(padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)
                    ),
                      child: Row(
                        children: [
                          Text('Rating:', style:GoogleFonts.openSans(fontSize:12 , fontWeight: FontWeight.bold) ,),
                          Icon(Icons.star,color: Colors.yellow,),
                          Text('${movie.vote_average.toStringAsFixed(1)}/10'),
                        ],
                      ),
                    ),

                  ],
                ))

              ],
            ),
          ),
        )
      ],)
    );
  }
}
