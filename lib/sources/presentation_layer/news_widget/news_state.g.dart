// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsStore on _NewsStore, Store {
  final _$postsAtom = Atom(name: '_NewsStore.posts');

  @override
  List<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$_NewsStoreActionController = ActionController(name: '_NewsStore');

  @override
  void getNews() {
    final _$actionInfo =
        _$_NewsStoreActionController.startAction(name: '_NewsStore.getNews');
    try {
      return super.getNews();
    } finally {
      _$_NewsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
