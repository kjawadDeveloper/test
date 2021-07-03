
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natalia_task/data/carousl_data.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({Key? key}) : super(key: key);

  @override
  _CarouselSectionState createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  @override
  Widget build(BuildContext context) {



    return Container(
      height: 200.h,
      child: CarouselSlider(

        options: CarouselOptions(viewportFraction: 1),
        items: imgList
            .map((item) => Container(
          padding:  EdgeInsets.all(5.r),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image(

                      image: NetworkImage(item, ),
                      fit: BoxFit.fill,
                    ),
                  ),


                  Positioned(
                    bottom: 10.w,
                    right: 10.w,
                    child: Text("Black Lives Matter", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
            ),
          ),
        ))
            .toList(),
      ),
    );
  }
}
