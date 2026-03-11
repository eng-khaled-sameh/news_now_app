import 'package:flutter/material.dart';
import 'package:news_now/widget/author_information.dart';
import 'package:news_now/widget/title_app_bar.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleAppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/test.avif',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    "Live updates: Aaron Judge, Roman Anthony homers surge Team USA baseball into lead vs. Mexico in WBC 2026 - Times Union",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Serif',
                      height: 1.3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Divider(thickness: 1),
                  ),
                  AuthorInformation(),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Divider(thickness: 1),
                  ),

                  const Text(
                    "The United States national baseball team brings a 2-0 mark into tonight's game against Mexico.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 90, 89, 89),
                    ),
                  ),
                  SizedBox(height: 16),
                  const Text(
                    "Live updates: Team USA baseball vs. Mexico Below the photo gallery, the Times Union is providing updates before, during and after tonight's World Baseball Classic game. Aaron Judge #99 of Team United States reacts after hitting a home run against Mexico during the World Baseball Classic in 2026. The atmosphere is electric as both teams fight for dominance in this critical matchup. Roman Anthony followed Judge's lead with a powerful blast, cementing the lead early in the game.",
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.55,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
