final List<Map> myItems =
    List.generate(100000, (index) => {"id": index, "name": "Product $index"})
        .toList();
