import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  List<String> states = ['Kerala', 'Tamilnadu', 'Karnataka'];
  List<String> selectedCrops = [];
  Map<String, CropDetails> cropDetailsMap = {};

  TextEditingController newCropController = TextEditingController();
  TextEditingController landOwnController = TextEditingController(text: "0");
  TextEditingController landLeasedController = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Enter Your Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.green.withOpacity(.5), Colors.white])),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Name of Farmer",
                    labelText: "Name of Farmer",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Mobile Number",
                    labelText: "Mobile Number",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "District",
                    labelText: "District",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Block",
                    labelText: "Block",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Name of Krishibhavan",
                    labelText: "Krishibhavan",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Adhar Number",
                    labelText: "Adhar Number",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Ward/House Number",
                    labelText: "Ward/House Number",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Address",
                    labelText: "Address",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Land Area in Cents (Own)",
                    labelText: "Land Area in Cents (Own)",
                    border: OutlineInputBorder()),
                controller: landOwnController,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Land Area in Cents (Leased)",
                    labelText: "Land Area in Cents (Leased)",
                    border: OutlineInputBorder()),
                controller: landLeasedController,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    hintText: "Experience in farming in years",
                    labelText: "Experience in farming in years",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                  value: states.first,
                  onChanged: (newValue) {
                    // Handle state change
                  },
                  items: states.map((state) {
                    return DropdownMenuItem(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      hintText: "Select State",
                      labelText: 'Select State',
                      border: OutlineInputBorder())),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _addCrops();
                },
                child: Text("Add Crops/cattle"),
              ),
              SizedBox(height: 16),
              _buildCropDetailsFields(),
              SizedBox(height: 16),
              SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      onPressed: () {},
                      child: Text("Create")))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCropDetailsFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: selectedCrops.map((crop) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Crop: $crop",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: "Area in cents",
                  labelText: "Area in cents",
                  border: OutlineInputBorder()),
              onChanged: (value) {
                cropDetailsMap[crop]!.areaInCents = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: "Quantity in kg",
                  labelText: "Quantity in kg",
                  border: OutlineInputBorder()),
              onChanged: (value) {
                cropDetailsMap[crop]!.quantityInKg = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: "Type of Crop",
                  labelText: "Type of Crop",
                  border: OutlineInputBorder()),
              onChanged: (value) {
                cropDetailsMap[crop]!.typeOfCrop = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: "Annual Income",
                  labelText: "Annual Income",
                  border: OutlineInputBorder()),
              onChanged: (value) {
                cropDetailsMap[crop]!.annualIncome = value;
              },
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  hintText: "Cost of Production",
                  labelText: "Cost of Production",
                  border: OutlineInputBorder()),
              onChanged: (value) {
                cropDetailsMap[crop]!.costOfProduction = value;
              },
            ),
          ],
        );
      }).toList(),
    );
  }

  void _addCrops() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Crop/cattle Name"),
          content: TextField(
            controller: newCropController,
            decoration: InputDecoration(
              hintText: "Enter Name",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                String newCropName = newCropController.text.trim();
                if (newCropName.isNotEmpty) {
                  setState(() {
                    selectedCrops.add(newCropName);
                    cropDetailsMap[newCropName] = CropDetails();
                    newCropController.clear();
                    Navigator.pop(context);
                  });
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}

class CropDetails {
  String areaInCents = "";
  String quantityInKg = "";
  String typeOfCrop = "";
  String annualIncome = "";
  String costOfProduction = "";
}

