// ignore_for_file: library_private_types_in_public_api

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../view/_product/store/connectivity_store.dart';
import '../../init/lang/locale_keys.g.dart';
import '../model/base_view_model.dart';

class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
  }) : super(key: key);
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final void Function(T model) onModelReady;
  final void Function(T model)? onDispose;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;

  final ConnectivityStore _connectivityStore = ConnectivityStore();

  late final ReactionDisposer _disposer;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();

    _disposer = reaction((_) => _connectivityStore.connectivityStream.value, (result) {
      if (result == ConnectivityResult.none) {
        networkPopUp;
      }
    });
  }

  Future get networkPopUp {
    var currentContext = (model as BaseViewModel).viewModelContext;
    return showDialog(
      context: (currentContext),
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(LocaleKeys.networkCheck_networkConnectionText),
          content: const Text(LocaleKeys.networkCheck_networkStatusClosedText),
          actions: [
            TextButton(
              child: const Text(LocaleKeys.networkCheck_networkActionText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _disposer();

    super.dispose();
    widget.onDispose?.call(model);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
