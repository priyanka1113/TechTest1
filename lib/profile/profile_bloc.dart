import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproj/data_repository.dart';
import 'package:myproj/profile/profile_event.dart';
import 'package:myproj/profile/profile_state.dart';
import 'package:myproj/storage_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DataRepository dataRepo;
  final StorageRepository storageRepo;
  final _picker = ImagePicker();

  ProfileBloc({
    @required this.dataRepo,
    @required this.storageRepo,
  }) : super(ProfileState()) {
   /* storageRepo
        .getUrlForFile(user.avatarKey)
        .then((url) => add(ProvideImagePath(avatarPath: url)));*/
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ChangeAvatarRequest) {
      yield state.copyWith(imageSourceActionSheetIsVisible: true);
    } else if (event is OpenImagePicker) {
      yield state.copyWith(imageSourceActionSheetIsVisible: false);
      final pickedImage = await _picker.getImage(source: event.imageSource);
      if (pickedImage == null) return;

      final imageKey = await storageRepo.uploadFile(File(pickedImage.path));

      final results = await Future.wait([
        storageRepo.getUrlForFile(imageKey),
      ]);

      yield state.copyWith(avatarPath: results.last);
    } else if (event is ProvideImagePath) {
      yield state.copyWith(avatarPath: event.avatarPath);
    }  else if (event is SaveProfileChanges) {
      // handle save changes
    }
  }
}
