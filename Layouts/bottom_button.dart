class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('header'),
                          Expanded(
                            child: Container(
                              color: Colors.green,
                              child: Text('body'),
                            ),
                          ),
                          Text('footer'),
                        ]
                    ),
                  )
              )
          );
        })
    );
  }
}
