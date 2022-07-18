class Pizza {
  
  String image = "assets/images/pizza.jpg";
  String? title;
  String? amount;

  Pizza({
    this.title,
    this.amount,
    image = "assets/images/pizza.jpg",
  });
}
