import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filter-screen";

  final Function saveFilters;
  final Map<String, bool> parsedFilters;
  FiltersScreen(this.parsedFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  initState() {
    _glutenFree = widget.parsedFilters["gluten"];
    _vegan = widget.parsedFilters["vegan"];
    _vegetarian = widget.parsedFilters["vegetarian"];
    _lactoseFree = widget.parsedFilters["lactose"];
    super.initState();
  }

  Widget _switchTileBuilder(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "gluten": _glutenFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian,
                "lactose": _lactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
        title: Text(
          "Settings",
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Adjust your Meals selection",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _switchTileBuilder(
                  "Gluten Free Meals",
                  "Only include gluten free meals",
                  _glutenFree,
                  (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                ),
                _switchTileBuilder(
                  "Vegan Meals",
                  "Only include vegan meals",
                  _vegan,
                  (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
                _switchTileBuilder(
                  "Vegetarian Meals",
                  "Only include vegetarian meals",
                  _vegetarian,
                  (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  },
                ),
                _switchTileBuilder(
                  "Lactose Free Meals",
                  "Only include lactose free meals",
                  _lactoseFree,
                  (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
