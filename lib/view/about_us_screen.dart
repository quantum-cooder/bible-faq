import 'package:bible_app/components/componets.dart';
import 'package:bible_app/constants/constants.dart';
import 'package:bible_app/utils/utils.dart';
import 'package:bible_app/view/about_us_screen/info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.getScaffoldBgColor(),
          appBar: CustomAppBar(title: "About Us"),
          body: const BodyContainerComponent(child: AboutPage()),
        ));
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Who are we section
                  InfoCard(
                    title: 'Who are we?',
                    description:
                        'The Bible answers are written by many Christian elders and well studied Christians and that are associated with Bible Students.',
                    contentWidget: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5, // Line height for better readability
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        children: const [
                          TextSpan(
                            text:
                                'The Bible answers are written by many Christian elders and well studied Christians and that are associated with Bible Students.\n\n',
                          ),
                          TextSpan(
                            text:
                                'The Bible Students are an autonomous, non-denominational Christian fellowship, we are not associated with Jehovah witnesses.\n\n',
                          ),
                          TextSpan(
                            text:
                                'This fellowship has no central head, office or central publishing house. It maintains an association through conventions and enjoys a fellowship that is worldwide. Our ministers are not paid. We never pass a collection plate.\n\n',
                          ),
                          TextSpan(
                            text:
                                'We base all our teachings on the Bible as it is written and trying to harmonize all scriptures, not following instituted traditions or teachings that are not scriptural.\n\n',
                          ),
                          TextSpan(
                            text:
                                'We welcome all to share with us in the study of God\'s Word. There is no organization to join and creed to affirm. We encourage and would like to help each other to a personal relationship with God, the Creator of the Universe, who is calling a "people for his name" (Acts 15:14). Our services are as simple as those of the early church. Our congregation benefits from the prayer support of one another and our fellowship is warm and friendly.',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Our Beliefs section
                  InfoCard(
                    title: 'Our Beliefs',
                    description:
                        'We accept Christ as our personal Savior, and that he died not only for the Christians, but for all of the world. We accept the Bible as the inspired Word of God, and study it in its entirety – both the Old and New Testaments – seeking the harmony of the complete Scriptural testimony.',
                    contentWidget: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5, // Line height for better readability
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        children: [
                          const TextSpan(
                            text: 'We accept ',
                          ),
                          const TextSpan(
                            text: 'Christ as our personal Savior',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: ', and that he died ',
                          ),
                          const TextSpan(
                            text:
                                'not only for the Christians, but for all of the world',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text:
                                '. We accept the Bible as the inspired Word of God, and study it in its entirety – both the Old and New Testaments – seeking the harmony of the complete Scriptural testimony.\n\n',
                          ),
                          const TextSpan(
                            text:
                                'We believe that each individual is responsible to ',
                          ),
                          const TextSpan(
                            text: 'personally study',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text:
                                ' and prove the interpretation of the Bible for themselves. (',
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment
                                .middle, // Better alignment with surrounding text
                            child: GestureDetector(
                              onTap: () => launchURL(
                                  'https://biblia.com/bible/niv/2-timothy/2/15'),
                              child: const Text(
                                '2 Timothy 2:15',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const TextSpan(
                            text: ') We strongly recommend ',
                          ),
                          const TextSpan(
                            text: 'topical Bible Study',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text:
                                ' as the best means of arriving at God\'s meaning on each subject, and we provide study aids to that end. We support continual Bible reading on a personal basis.',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Free Bible Resources section
                  InfoCard(
                    title: 'Free Bible Resources',
                    description:
                        'All Resources in this app are free, with no ads and we other free literature for personal Bible Study.',
                    contentWidget: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5, // Line height for better readability
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        children: const [
                          TextSpan(
                            text:
                                'All Resources in this app are free, with no ads and other free literature for personal Bible Study.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
