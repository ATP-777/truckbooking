import 'package:flutter/material.dart';
import 'package:tcms_light_app/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MaterialTheme().light(),
      darkTheme: MaterialTheme().dark(),
      themeMode: ThemeMode.system,
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Your Truck', style: TextStyle(color: colorScheme.onPrimary)),
        backgroundColor: colorScheme.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('+ Add New Address'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.secondary,
                foregroundColor: colorScheme.onSecondary,
              ),
            ),
            SizedBox(height: 16.0),
            buildTextField('Customer Name', colorScheme),
            buildTextField('From', colorScheme),
            buildTextField('To', colorScheme, icon: Icons.gps_fixed),
            buildTextField('Pickup At', colorScheme, isDate: true),
            buildTextField('Deliver At', colorScheme, isDate: true),
            buildTextField('Qty', colorScheme),
            buildTextField('Price', colorScheme),
            buildTextField('Truck Tonnage', colorScheme),
            buildTextField('Type', colorScheme),
            buildTextField('Vehicle', colorScheme),
            buildTextField('Driver', colorScheme),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
                Text('Send Notification', style: TextStyle(color: colorScheme.onSurface)),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.calculate, color: colorScheme.onPrimary),
              label: Text('Calculate'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              color: colorScheme.surface,
              child: Text('Distance (Click on the Calculate button to view the Distance)', style: TextStyle(color: colorScheme.onSurface)),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              color: colorScheme.surface,
              child: Text('Total Price (Click on the Calculate button to view the Price)', style: TextStyle(color: colorScheme.onSurface)),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.local_shipping, color: colorScheme.onPrimary),
              label: Text('Book Truck'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.dashboard, color: colorScheme.onPrimary),
              label: Text('Dashboard'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
                Expanded(child: buildTextField('Shipping/DO Ref No', colorScheme)),
                Expanded(child: buildTextField('Status', colorScheme)),
                Expanded(child: buildTextField('Remark', colorScheme)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Upload File'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Upload POD File'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // You can use a static image or map widget here.
            Container(
              height: 200,
              color: Colors.grey.shade300,
              child: Center(child: Text('Map Placeholder', style: TextStyle(color: colorScheme.onSurface))),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, ColorScheme colorScheme, {IconData? icon, bool isDate = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: icon != null ? Icon(icon, color: colorScheme.onSurface) : (isDate ? Icon(Icons.calendar_today, color: colorScheme.onSurface) : null),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintStyle: TextStyle(color: colorScheme.onSurface),
        ),
        style: TextStyle(color: colorScheme.onSurface),
      ),
    );
  }
}
