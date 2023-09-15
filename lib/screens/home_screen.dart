
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/widgets/movies_slider.dart';
import 'package:netflix/widgets/trending_slider.dart';

import '../api/api.dart';
import '../models/movie.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState(){
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       title: Image.asset('assets/netflix.png' , fit: BoxFit.cover ,height: 40,filterQuality: FilterQuality.high,),
       centerTitle: true,
         automaticallyImplyLeading: false
     ),
     body: SingleChildScrollView(
       physics: BouncingScrollPhysics(),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Trending Movies',style: GoogleFonts.aBeeZee(fontSize: 25),),
             SizedBox(height:32),
             SizedBox(
               child: FutureBuilder(
                 future: trendingMovies,
                 builder: (context , snapshot){
                   if(snapshot.hasError){
                     return Center(child: Text(snapshot.error.toString()),);
                   }
                   else if(snapshot.hasData){

                     return TrendingSlider(snapshot: snapshot);
                   }
                   else{
                     return Center(child: CircularProgressIndicator());
                   }
                 },
               ),
             ),
             SizedBox(height: 32),
             Text('Top Rated Movies' , style: GoogleFonts.aBeeZee(fontSize: 25),),
             SizedBox(height:32),

             SizedBox(
               child: FutureBuilder(
                 future: topRatedMovies,
                 builder: (context , snapshot){
                   if(snapshot.hasError){
                     return Center(child: Text(snapshot.error.toString()),);
                   }
                   else if(snapshot.hasData){

                     return MoviesSlider(snapshot: snapshot);
                   }
                   else{
                     return Center(child: CircularProgressIndicator());
                   }
                 },
               ),
             ),

             SizedBox(height: 32),
             Text('Upcoming Movies' , style: GoogleFonts.aBeeZee(fontSize: 25),),
             SizedBox(height:32),
             SizedBox(
               child: FutureBuilder(
                 future: upcomingMovies,
                 builder: (context , snapshot){
                   if(snapshot.hasError){
                     return Center(child: Text(snapshot.error.toString()),);
                   }
                   else if(snapshot.hasData){

                     return MoviesSlider(snapshot: snapshot);
                   }
                   else{
                     return Center(child: CircularProgressIndicator());
                   }
                 },
               ),
             ),


           ],
         ),
       ),
     ),
   );
  }
}



