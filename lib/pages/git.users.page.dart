import 'package:blocp_rojet_git/bloc/users.bloc.dart';
import 'package:blocp_rojet_git/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class GitPage extends StatelessWidget {
  const GitPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is SearchUserSuccessState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Users"),
                  Text("${state.currentPage}/${state.totalePage}")
                ],
              );
            } else {
              return Text("Users Page");
            }
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      String kw = textEditingController.text;
                      context.read<UsersBloc>().add(SearcheUsersEvent(
                            keyword: kw,
                            page: 0,
                            pageSize: 20,
                          ));
                    },
                    icon: Icon(Icons.search)),
              ],
            ),
          ),
          BlocBuilder<UsersBloc, UsersState>(builder: (context, state) {
            if (state is SearchLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SearcheUsersErrorState) {
              return Column(
                children: [
                  Text(
                    state.messageErr,
                    style: CutemTheme.errText,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      UsersBloc usersBloc = context.read<UsersBloc>();
                      usersBloc.add(usersBloc.currentEvent);
                    },
                    child: Text("Retry"),
                  )
                ],
              );
            } else if (state is SearchUserSuccessState) {
              return Expanded(
                child: LazyLoadScrollView(
                  onEndOfPage: () {
                    context.read<UsersBloc>().add(NextPageEvent(
                        keyword: state.kw,
                        page: state.currentPage + 1,
                        pageSize: state.pageSize));
                  },
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        state.users![index]?.avatarurl ?? ''),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    state.users![index]?.login ?? '',
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                  child: Text("${state.users![index]?.score}")),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 2,
                        );
                      },
                      itemCount: state.users!.length),
                ),
              );
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
