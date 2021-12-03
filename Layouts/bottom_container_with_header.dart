 return Container(
      width: double.infinity,
      color: Color.fromRGBO(248, 248, 248, 1),
      child: Stack(
        children: [
          Column(
            children: [
              Container(),
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.width / 1.2) - 70.0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                boxShadow: [
                  BoxShadow(color: const Color(0x08000000), offset: Offset(0, -10), blurRadius: 10, spreadRadius: 0),
                ],
              ),
              child: Container(),
            ),
          ),
        ],
      ),
    );
