
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/pizza.dart';
import '../../theme/color.dart';
import '../bloc/home_page_bloc.dart';

class NewPizza extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewPizza({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            backgroundColor: const Color(0xffFFFFFF),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left,
              ),
            ),
            flexibleSpace: const Image(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fitWidth,
            ),
            title: Text(
              'Add Pizza',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            actions: const [Text('data')],
          ),
          body: Container(
            decoration: background(),
            child: BlocListener<HomePageBloc, HomePageState>(
              listener: (context, state) {
                if (state is HomePageLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Pizza is added!'),
                  ));
                }
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    shadowColor:
                        const Color.fromRGBO(90, 108, 234, 0.08).withOpacity(0.15),
                    elevation: 20,
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                child: Image.asset(
                                  "assets/images/pizza.jpg",
                                  width: 64,
                                  height: 64,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TxField(
                                name: 'Name',
                                controller: titleController,
                              ),
                              TxField(
                                name: 'Price',
                                controller: amountController,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ),
          bottomNavigationBar: Container(
            decoration: button(),
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                var pizza = Pizza(
                    amount: amountController.value.text,
                    title: titleController.value.text,
                    image: '');
                context.read<HomePageBloc>().add(
                      AddHomePage(pizza: pizza),
                    );
                Navigator.pop(context);
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}

// ignore: must_be_immutable
class TxField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var controller;
  String name;

  TxField({Key? key, required this.controller, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16),
        ),
        SizedBox(
          width: 128,
          height: 32,
          child: TextFormField(
         textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 10),
            decoration: InputDecoration(
              
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide:
                      BorderSide(color: Colors.black, width: 1.0)),
              suffixIcon: IconButton(
                splashRadius: 10,
                  iconSize: 25,
                  onPressed: controller.clear,
                  icon: const Icon(
                    Icons.clear,
                   
                  ),
                ),
             
            ),
            controller: controller,
          ),
        ),
      ],
    );
  }
}
