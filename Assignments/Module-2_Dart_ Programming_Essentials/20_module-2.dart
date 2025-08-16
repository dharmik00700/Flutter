class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class Cart {
  List<Product> items = [];

  void addProduct(Product product) {
    items.add(product);
    print('Added ${product.name} to cart.');
  }

  void viewCart() {
    if (items.isEmpty) {
      print('Your cart is empty.');
      return;
    }
    print('\nCart Contents:');
    for (var item in items) {
      print('- ${item.name}: ₹${item.price.toStringAsFixed(2)}');
    }
  }
}

class Order {
  Cart cart;

  Order(this.cart);

  double calculateTotal() {
    double total = 0;
    for (var item in cart.items) {
      total += item.price;
    }
    return total;
  }

  void checkout() {
    double total = calculateTotal();
    print('\nTotal Price: ₹${total.toStringAsFixed(2)}');
    print('Order placed successfully!');
  }
}

void main() {
  Cart cart = Cart();

  // Sample products
  Product p1 = Product('Laptop', 75000);
  Product p2 = Product('Mouse', 1200);
  Product p3 = Product('Keyboard', 2500);

  // Simulate adding products
  cart.addProduct(p1);
  cart.addProduct(p2);
  cart.addProduct(p3);

  // View cart
  cart.viewCart();

  // Place order
  Order order = Order(cart);
  order.checkout();
}
/*
Added Laptop to cart.
Added Mouse to cart.
Added Keyboard to cart.

Cart Contents:
- Laptop: ₹75000.00
- Mouse: ₹1200.00
- Keyboard: ₹2500.00

Total Price: ₹78700.00
Order placed successfully!
 */