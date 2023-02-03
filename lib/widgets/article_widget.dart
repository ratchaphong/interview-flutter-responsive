import 'package:flutter/material.dart';
import 'package:flutter_responsive/widgets/resume_info.dart';

import 'certificate_widget.dart';

class ArticleWidget extends StatefulWidget {
  final bool isShowArticle;

  const ArticleWidget({super.key, required this.isShowArticle});

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.isShowArticle
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ResumeInfo(
                    title: "Objective",
                    subtitle:
                        "Fugiat tempor non pariatur quis occaecat. Velit officia minim tempor cupidatat. Sint magna aliqua sint nulla incididunt velit dolore mollit ea. Irure adipisicing fugiat duis nulla. Esse velit incididunt non sit ad fugiat incididunt. Consequat sint nisi voluptate enim magna nostrud proident irure minim exercitation. Adipisicing ad nisi proident nulla eu aliquip ad aliqua. Reprehenderit irure excepteur incididunt ad amet fugiat in eiusmod. Eu non Lorem ea do. Consectetur adipisicing exercitation anim reprehenderit nostrud occaecat magna eiusmod laboris officia veniam.",
                  ),
                  ResumeInfo(
                    title: "Expertise",
                    subtitle:
                        "Tempor sit enim qui minim velit irure pariatur magna ut enim Lorem aliquip magna culpa.",
                  ),
                  CertificateWidget(),
                ],
              )
            : null);
  }
}
