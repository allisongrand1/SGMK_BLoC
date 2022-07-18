part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable{
  const HomePageEvent();

   @override
  List<Object> get props => [];
}

class LoadHomePage extends HomePageEvent {

  final List<Pizza> pizzas;

  const LoadHomePage({this.pizzas = const <Pizza>[]});

   @override
  List<Object> get props => [pizzas];
}

class AddHomePage extends HomePageEvent {

  final Pizza pizza;

  const AddHomePage({required this.pizza});

   @override
  List<Object> get props => [pizza];
}
