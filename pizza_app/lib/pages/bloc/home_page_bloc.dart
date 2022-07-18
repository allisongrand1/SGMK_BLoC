import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../models/pizza.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageLoading()) {
    on<LoadHomePage>(_onLoadHomePage);
    on<AddHomePage>(_onAddHomePage);
  }

  void _onLoadHomePage(LoadHomePage event, Emitter<HomePageState> emit){
    emit (
      HomePageLoaded(pizzas: event.pizzas),
    );
  }

  void _onAddHomePage(AddHomePage event, Emitter<HomePageState> emit){
  final state = this.state;

  if (state is HomePageLoaded){
    emit(HomePageLoaded(
      pizzas: List.from(state.pizzas)..add(event.pizza),
    ));
  }

  }
}
