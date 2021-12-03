ListView.separated(
  itemCount: 25,
  separatorBuilder: (BuildContext context, int index) {
    if (index % 5 == 0) { // Display `Widget` every 5 'separators'.
      return Container(
      child: Text('A widget.')
      );
    }
    return Divider();
  },
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: Text('item $index'),
    );
  },
)
