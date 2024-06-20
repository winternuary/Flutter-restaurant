import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/constants.dart';

class ShoppingCartHeader extends StatefulWidget {
  final ValueChanged<int> onSelectedIdChanged; // 콜백 추가

  const ShoppingCartHeader({Key? key, required this.onSelectedIdChanged}) : super(key: key);

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  int selectedId = 0;

  List<String> selectedPic = [
    "assets/p1.jpg",
    "assets/p2.jpg",
    "assets/p3.jpg",
    "assets/p4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector(),
      ],
    );
  }

  Widget _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildHeaderSelectorButton(0, Icons.fastfood), // 패스트푸드 아이콘
          _buildHeaderSelectorButton(1, Icons.local_dining), // 식사 아이콘
          _buildHeaderSelectorButton(2, Icons.restaurant), // 레스토랑 아이콘
          _buildHeaderSelectorButton(3, Icons.local_cafe), // 카페 아이콘
        ],
      ),
    );
  }

  Widget _buildHeaderSelectorButton(int id, IconData mIcon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black),
        onPressed: () {
          setState(() {
            selectedId = id;
          });
          widget.onSelectedIdChanged(id); // 콜백 호출
        },
      ),
    );
  }
}
