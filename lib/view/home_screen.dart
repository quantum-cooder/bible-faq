import 'package:bible_app/constants/app_colors.dart';
import 'package:bible_app/utils/local_storage_util.dart';
import 'package:bible_app/view/dialogs/download_dialog.dart';
import 'package:bible_app/view/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _checkAndShowDownloadDialog();
  }

  Future<void> _checkAndShowDownloadDialog() async {
    bool hasPromptDate = await LocalStorageUtil.hasLastPromptDate();
    DateTime? lastPromptDate = await LocalStorageUtil.getLastPromptDate();
    DateTime currentDate = DateTime.now();

    if (!hasPromptDate ||
        currentDate.difference(lastPromptDate!).inDays >= 10) {
      _showDownloadDialog();
      await LocalStorageUtil.saveLastPromptDate(currentDate);
    }
  }

  void _showDownloadDialog() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Download New Questions'),
          content: const Text('Would you like to download new questions?'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () async {
                Navigator.of(context).pop();
                DownloadDialog.show();
                await LocalStorageUtil.saveLastPromptDate(DateTime.now());
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldColor = Theme.of(context).brightness == Brightness.light
        ? AppColors.scaffoldLightColor
        : AppColors.scaffoldDarkColor;

    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(50),
              SearchAndSettingsRow(),
              const Gap(12),
              AllBilbeQuestionAndAnswerCard(),
              const Gap(12),
              const ExploreResourcesSection(),
              const Gap(12),
              const LatestQuestionSection(),
              const Gap(15),
              BibleTopicsSectionForHome(),
            ],
          ),
        ),
      ),
    );
  }
}
