import 'package:excelerate_learning_app/app/utils/app_colors.dart';
import 'package:excelerate_learning_app/app/utils/app_text_styles.dart';
import 'package:excelerate_learning_app/app/widgets/hover_card.dart';
import 'package:excelerate_learning_app/features/home/model/program_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProgramCard extends StatelessWidget {
  final Program program;
  const ProgramCard({Key? key, required this.program}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () => Get.toNamed('/program/${program.id}'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              SizedBox(
                height: 180,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    program.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
          
              //Category & Difficulty
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(program.category, style: AppTextStyles.smallpurple),
                  Text(program.difficulty, style: AppTextStyles.smallblue),
                ],
              ),
              const SizedBox(height: 35),
          
              //Title
              Text(
                program.title,
                style: AppTextStyles.cardTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 7),
          
              //Description
              Text(
                program.description,
                style: AppTextStyles.cardSubtitle,
                maxLines: 4,
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: 25),
          
              //Duration & Lessons Count
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: AppColors.purple),
                  const SizedBox(width: 4),
                  Text(program.duration, style: AppTextStyles.smallGrey),
                  const SizedBox(width: 12),
                  const Icon(Icons.menu_book, size: 16, color: AppColors.lightBlue),
                  const SizedBox(width: 4),
                  Text('${program.lessonsCount} lessons', style: AppTextStyles.smallGrey),
                ],
              ),
              const SizedBox(height: 8),
          
              // Rating & Enrolled
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: AppColors.yellow),
                      const SizedBox(width: 4),
                      Text('${program.rating}', style: AppTextStyles.smallblack),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.people, size: 16, color: AppColors.cian),
                      const SizedBox(width: 4),
                      Text('${program.enrolledCount} enrolled', style: AppTextStyles.smallGrey),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
