import "package:flutter/material.dart";

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frequently Asked Questions"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ExpansionTile(
            title: Text("How do I place an order?"),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "To place an order, browse the menus, add items to your cart, and proceed to checkout. You will then be prompted to enter your delivery details and payment information.",
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("How can I track my order?"),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "You can track your order in real-time on the 'Order Tracking' screen, which becomes available once your order is confirmed.",
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("What payment methods are accepted?"),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "We accept various payment methods, including credit/debit cards and mobile money options. Specific options will be displayed at checkout.",
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Can I cancel my order?"),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Order cancellation policies vary by restaurant and order status. Please contact customer support immediately if you need to cancel an order.",
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("How do I contact customer support?"),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "You can contact customer support via the in-app live chat feature or by calling our support hotline.",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


