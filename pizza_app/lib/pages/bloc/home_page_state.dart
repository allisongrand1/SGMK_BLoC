part of 'home_page_bloc.dart';


@immutable
abstract class HomePageState {
  const HomePageState();

  List<Object> get props => [];
}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<Pizza> pizzas;

  const HomePageLoaded({this.pizzas = const <Pizza>[]});

   @override
  List<Object> get props => [pizzas];
}


