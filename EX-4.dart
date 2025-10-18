enum Delivery {online, pickup}

class Shop {
  String shopName;
  Map<Product, int> products = {};

  Shop(this.shopName);

  void addProducts(Product product, int quantity) {
    products[product] = quantity;    
  }

}

class Product {
  String productName;
  double productPrice;

  Product(this.productName, this.productPrice);
}

class Customer {
  String customerName;
  List<Order> orders = [];
  Address? address;

  Customer(this.customerName, [this.address]);

  Order buyProducts(Shop shop, List<Product> products, Delivery delivery, [Address? address]){
    Order newOrder;
    if(delivery == Delivery.online){
      newOrder = Order(shop, products, delivery, address);
    } else {
      newOrder = Order(shop, products, delivery);
    }
    orders.add(newOrder);
    return newOrder;
  }
}

class Address {
  String _city;
  String _street;
  String _house;

  Address(this._city, this._street, this._house);
}

class Order {
  Shop shop;
  List<Product> products;
  Delivery delivery;
  Address? address;

  Order(this.shop, this.products, this.delivery, [this.address]);

  double getTotal() {
    double total = 0;
    for (var product in products) {
      if (shop.products.containsKey(product) && shop.products[product]! > 0) {
        shop.products[product] = shop.products[product]! - 1;
        total += product.productPrice;
      } else {
        print("${product.productName} is out of stock.");
      }    }
    return total;
  }

  @override
  String toString() {
    return "Order (${delivery.name}) - ${products.length} products - Total: \$${getTotal().toStringAsFixed(2)}";
  }

}
void main()  {
  Shop s1 = Shop("azazon");

  Product p1 = Product("book", 10);
  Product p2 = Product("car", 9999);

  s1.addProducts(p1, 5);
  s1.addProducts(p2, 1);

  // Customer c1 = Customer("JiminFromBTS");
  Address a1 = Address("pyongyang", "st999", "nk45");
  Customer c1 = Customer("JiminFromBTS", a1);

  Order o1 = c1.buyProducts(s1, [p1, p2], Delivery.pickup);
  print(o1);
  Order o2 = c1.buyProducts(s1, [p1, p2], Delivery.online);
  print(o2);




}