import 'package:flutter/material.dart';
import 'package:myproj/auth/form_submission_status.dart';

class ProfileState {
  final String avatarPath;
  final FormSubmissionStatus formStatus;
  bool imageSourceActionSheetIsVisible;

  ProfileState({
    String avatarPath,
    this.formStatus = const InitialFormStatus(),
    imageSourceActionSheetIsVisible = false,
  })  :this.avatarPath = avatarPath,
        this.imageSourceActionSheetIsVisible = imageSourceActionSheetIsVisible;

  ProfileState copyWith({
    String avatarPath,
    FormSubmissionStatus formStatus,
    bool imageSourceActionSheetIsVisible,
  }) {
    return ProfileState(
      avatarPath: avatarPath ?? this.avatarPath,
      formStatus: formStatus ?? this.formStatus,
      imageSourceActionSheetIsVisible: imageSourceActionSheetIsVisible ??
          this.imageSourceActionSheetIsVisible,
    );
  }
}
