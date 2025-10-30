import 'package:flutter/material.dart';

class NightStayScreen extends StatefulWidget {
  const NightStayScreen({super.key});

  @override
  State<NightStayScreen> createState() => _NightStayScreenState();
}

class _NightStayScreenState extends State<NightStayScreen> {
  int _selectedIndex = 1;
  final List<String> _tabs = ["PawPrints", "Night Stay", "Customers"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset('assets/pet_header.jpg', fit: BoxFit.cover),
          ),

          Column(
            children: [
              const SizedBox(height: 45),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _topIcon(
                      Icons.arrow_back_ios_new_rounded,
                      () => Navigator.pop(context),
                    ),
                    _topIcon(Icons.edit_rounded, () {}, isEdit: true),
                  ],
                ),
              ),

              const SizedBox(height: 100),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: _bodySection(),
                ),
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF004AAD),
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_rounded),
            label: "Sitter",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Agenda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: "Earning",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: "Chats",
          ),
        ],
      ),
    );
  }

  // Top Rounded Icon
  Widget _topIcon(IconData icon, VoidCallback onTap, {bool isEdit = false}) {
    return Container(
      height: 40,
      width: 44,
      decoration: BoxDecoration(
        color: isEdit ? Colors.yellow : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 20,
          color: isEdit ? Colors.black : Colors.black87,
        ),
        onPressed: onTap,
      ),
    );
  }

  Widget _bodySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_tabRow(), const SizedBox(height: 18), _cardContent()],
      ),
    );
  }

  Widget _tabRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, 
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(_tabs.length, (i) {
          bool selected = i == 1;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? Colors.yellow : Colors.transparent,
                  borderRadius: BorderRadius.circular(26),
                ),
                alignment: Alignment.center,
                child: Text(
                  _tabs[i],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: selected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _cardContent() {
    return Container(
      height: 500,
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.pets, color: Colors.black, size: 24),
              ),
              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Day Care",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Offer daytime care services for pets",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.check_circle, color: Colors.green, size: 26),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            "What's included in your price?",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 12,
            children:
                [
                  "Give Medicines",
                  "Feeding",
                  "Bath & Dry",
                  "Out Door Walks",
                  "Massage",
                  "Massage",
                  "Bath",
                  "Massage",
                  "Massage",
                ].map(_chip).toList(),
          ),

          const SizedBox(height: 22),

          const Text(
            "What is your price per night?",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 12),

          _priceRow("Price Per Night *", "14", "CHF", bold: true),
          const SizedBox(height: 10),
          _priceRow("Pawfront Fees & Taxes", "2", "CHF"),
          const SizedBox(height: 10),
          _priceRow("You will receive", "12", "CHF", greyBackground: true),
        ],
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _priceRow(
    String label,
    String price,
    String cur, {
    bool bold = false,
    bool greyBackground = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),

        Container(
          width: 120,
          height: 44,
          decoration: BoxDecoration(
            color: greyBackground ? Colors.grey.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                cur,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
