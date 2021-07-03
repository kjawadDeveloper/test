import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natalia_task/data/jobs_list.dart';
import 'package:natalia_task/models/job_details.dart';

class JobsListHorizontal extends StatefulWidget {
  const JobsListHorizontal({Key? key}) : super(key: key);

  @override
  _JobsListHorizontalState createState() => _JobsListHorizontalState();
}

class _JobsListHorizontalState extends State<JobsListHorizontal> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200.h,
      child: ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        separatorBuilder: (_, __ )=> SizedBox(width: 2.w,),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: jobsList.length,
        itemBuilder: (BuildContext context, int index) => JobItemWidget(
          jobsDetails: jobsList[index],
        ),
      ),
    );
  }
}

class JobItemWidget extends StatelessWidget {
  JobsDetails jobsDetails;

  JobItemWidget({Key? key, required this.jobsDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Container(
      height: 200.h,
      width: 150.h,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Column(children: [
            Expanded(
              flex: 1,
              child: Container(
                  child: Image(
                image: NetworkImage(jobsDetails.image),
              )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding:   EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(jobsDetails.interestedFriend, maxLines: 1, style: const TextStyle(
                      color: Colors.grey
                    ),),
                    SizedBox(height: 5.h,),
                    Text(jobsDetails.jobTitle, style: TextStyle(fontWeight: FontWeight.bold,), maxLines: 1,),
                    Text(jobsDetails.locationOptions),
                    Container(
                      height: 20.h,
                      child: Row(
                        children: [
                          Text(jobsDetails.salary),
                          Text("*"),
                          Text(jobsDetails.ratings),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
