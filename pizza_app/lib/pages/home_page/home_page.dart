import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/color.dart';
import '../../widgets/pizza_list.dart';
import '../bloc/home_page_bloc.dart';
import '../new-pizza_page/new-pizza_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xffFFFFFF),
        flexibleSpace: const Image(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Pizza Market",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: 28,
              child: FittedBox(
                  child: FloatingActionButton(
                child: Container(
                    width: 60,
                    height: 60,
                    child: const Icon(
                      Icons.add,
                      size: 28,
                    ),
                    decoration: button()),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewPizza()));
                },
              )),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: background(),
        child:
            BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
          if (state is HomePageLoading) {
            return const CircularProgressIndicator();
          }
          if (state is HomePageLoaded) {
            return Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                    itemCount: state.pizzas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PizzaList(context, state.pizzas[index]);
                    }));
          } else {
            return const Text("Ошибка");
          }
        }),
      ),
    );
  }
}
