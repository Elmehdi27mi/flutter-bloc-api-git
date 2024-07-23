import 'package:bloc/bloc.dart';
import 'package:blocp_rojet_git/repository/users.repository.dart';

import '../model/users.model.dart';

abstract class UsersEvent {}

class SearcheUsersEvent extends UsersEvent {
  final String keyword;
  int page;
  int pageSize;
  SearcheUsersEvent(
      {required this.keyword, required this.page, required this.pageSize});
}

class NextPageEvent extends SearcheUsersEvent {
  NextPageEvent(
      {required super.keyword, required super.page, required super.pageSize});
}

class UsersState {
  final List<User?>? users;
  final int currentPage;
  final int totalePage;
  final int pageSize;
  final String kw;
  UsersState(
      {required this.currentPage,
      required this.totalePage,
      required this.pageSize,
      required this.kw,
      required this.users});
}

class SearchUserSuccessState extends UsersState {
  SearchUserSuccessState(
      {required super.currentPage,
      required super.totalePage,
      required super.pageSize,
      required super.kw,
      required super.users});
}

class SearchLoadingState extends UsersState {
  SearchLoadingState(
      {required super.currentPage,
      required super.totalePage,
      required super.pageSize,
      required super.kw,
      required super.users});
}

class SearcheUsersErrorState extends UsersState {
  final String messageErr;

  SearcheUsersErrorState(
      {required super.currentPage,
      required super.totalePage,
      required super.pageSize,
      required super.kw,
      required super.users,
      required this.messageErr});
}

class InintialUsersState extends UsersState {
  InintialUsersState()
      : super(users: [], currentPage: 0, totalePage: 0, pageSize: 20, kw: "");
}

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  late UsersEvent currentEvent;
  UsersRepository usersRepository = UsersRepository();
  UsersBloc() : super(InintialUsersState()) {
    on(
      (SearcheUsersEvent event, emit) async {
        currentEvent = event;
        emit(SearchLoadingState(
            kw: state.kw,
            pageSize: state.pageSize,
            totalePage: state.totalePage,
            currentPage: state.currentPage,
            users: state.users));
        try {
          ListUsers listUsers = await usersRepository.searcheUsers(
              event.keyword, event.page, event.pageSize);
          int totalPges = (listUsers.totalcount! / event.pageSize).floor();
          if (listUsers.totalcount! % event.pageSize != 0) {
            ++totalPges;
          }
          emit(SearchUserSuccessState(
              users: listUsers.items,
              currentPage: event.page,
              pageSize: event.pageSize,
              totalePage: totalPges,
              kw: event.keyword));
        } catch (e) {
          print(e);
          emit(SearcheUsersErrorState(
              messageErr: e.toString(),
              kw: state.kw,
              pageSize: state.pageSize,
              totalePage: state.totalePage,
              currentPage: state.currentPage,
              users: state.users));
        }
      },
    );
    on(
      (NextPageEvent event, emit) async {
        currentEvent = event;
        try {
          ListUsers listUsers = await usersRepository.searcheUsers(
              event.keyword, event.page, event.pageSize);
          int totalPges = (listUsers.totalcount! / event.pageSize).floor();
          if (listUsers.totalcount! % event.pageSize != 0) {
            ++totalPges;
          }
          List<User> currentList = (state!.users ?? [])
              .where((user) => user != null)
              .cast<User>()
              .toList();
          currentList.addAll(listUsers.items as Iterable<User>);
          emit(SearchUserSuccessState(
              users: currentList,
              currentPage: event.page,
              pageSize: event.pageSize,
              totalePage: totalPges,
              kw: event.keyword));
        } catch (e) {
          print(e);
          emit(SearcheUsersErrorState(
              messageErr: e.toString(),
              kw: state.kw,
              pageSize: state.pageSize,
              totalePage: state.totalePage,
              currentPage: state.currentPage,
              users: state.users));
        }
      },
    );
  }
}
