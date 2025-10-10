import 'package:aaliyahs_collection_estore/bottom_nav.dart';
import 'package:aaliyahs_collection_estore/provider/cart_provider.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Personal Information
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  
  // Delivery Information
  String? _selectedProvince;
  TimeOfDay? _selectedTime;
  
  // Checkbox
  bool _cashOnDelivery = true;

  // Sri Lanka Provinces
  final List<String> _provinces = [
    'Western Province',
    'Central Province',
    'Southern Province',
    'Northern Province',
    'Eastern Province',
    'North Western Province',
    'North Central Province',
    'Uva Province',
    'Sabaragamuwa Province'
  ];

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final cartProvider = Provider.of<CartProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? AaliyahLightColor : AaliyahDarkColor,
          ),
        ),
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDarkMode ? AaliyahLightColor : AaliyahDarkColor,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(isDesktop ? 32 : 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Summary Section
              _buildOrderSummary(context, cartProvider, isDarkMode),
              const SizedBox(height: 24),

              // Checkout Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Personal Information
                    _buildSectionTitle("Personal Information", isDarkMode),
                    const SizedBox(height: 16),
                    
                    _buildPersonalInfo(isDarkMode, isDesktop),
                    
                    const SizedBox(height: 24),

                    // Address Information
                    _buildSectionTitle("Address Information", isDarkMode),
                    const SizedBox(height: 16),
                    
                    _buildAddressInfo(isDarkMode, isDesktop),
                    
                    const SizedBox(height: 24),

                    // Delivery Preferences
                    _buildSectionTitle("Delivery Preferences", isDarkMode),
                    const SizedBox(height: 16),
                    
                    _buildDeliveryPreferences(isDarkMode),
                    
                    const SizedBox(height: 24),

                    // Payment Method
                    _buildSectionTitle("Payment Method", isDarkMode),
                    const SizedBox(height: 16),
                    
                    _buildPaymentMethod(isDarkMode),
                    
                    const SizedBox(height: 40),

                    // Place Order Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _placeOrder(context, cartProvider);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "PLACE ORDER - Rs. ${cartProvider.totalPrice()}",
                          style: TextStyle(
                            fontSize: isDesktop ? 18 : 16,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context, CartProvider cartProvider, bool isDarkMode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? AaliyahPrimaryColor : AaliyahSecondaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Summary",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
            ),
          ),
          const SizedBox(height: 12),
          
          Column(
            children: cartProvider.cart.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${item.name} (x${item.quantity})",
                      style: TextStyle(
                        color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "Rs. ${item.price * item.quantity}",
                    style: TextStyle(
                      color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
          
          const Divider(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Amount",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
                ),
              ),
              Text(
                "Rs. ${cartProvider.totalPrice()}",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDarkMode) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: isDarkMode ? AaliyahLightColor : AaliyahDarkColor, // Black in dark, White in light
      ),
    );
  }

  Widget _buildPersonalInfo(bool isDarkMode, bool isDesktop) {
    if (isDesktop) {
      return Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _firstNameController,
              style: TextStyle(
                color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
              ),
              decoration: _buildInputDecoration(
                "First Name",
                Icons.person_outline,
                isDarkMode,
              ),
              validator: AaliyahValidator.validateFirstName,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              controller: _lastNameController,
              style: TextStyle(
                color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
              ),
              decoration: _buildInputDecoration(
                "Last Name",
                Icons.person_outline,
                isDarkMode,
              ),
              validator: AaliyahValidator.validateLastName,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            style: TextStyle(
              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
            ),
            decoration: _buildInputDecoration(
              "First Name",
              Icons.person_outline,
              isDarkMode,
            ),
            validator: AaliyahValidator.validateFirstName,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _lastNameController,
            style: TextStyle(
              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
            ),
            decoration: _buildInputDecoration(
              "Last Name",
              Icons.person_outline,
              isDarkMode,
            ),
            validator: AaliyahValidator.validateLastName,
          ),
        ],
      );
    }
  }

  Widget _buildAddressInfo(bool isDarkMode, bool isDesktop) {
    return Column(
      children: [
        // Address Field
        TextFormField(
          controller: _addressController,
          maxLines: 2,
          style: TextStyle(
            color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
          ),
          decoration: _buildInputDecoration(
            "Street Address",
            Icons.home_outlined,
            isDarkMode,
          ),
          validator: AaliyahValidator.validateRequiredField,
        ),
        const SizedBox(height: 12),

        if (isDesktop)
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _cityController,
                  style: TextStyle(
                    color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
                  ),
                  decoration: _buildInputDecoration(
                    "City",
                    Icons.location_city_outlined,
                    isDarkMode,
                  ),
                  validator: AaliyahValidator.validateRequiredField,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _postalCodeController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
                  ),
                  decoration: _buildInputDecoration(
                    "Postal Code",
                    Icons.numbers_outlined,
                    isDarkMode,
                  ),
                  validator: AaliyahValidator.validatePostalCode,
                ),
              ),
            ],
          )
        else
          Column(
            children: [
              TextFormField(
                controller: _cityController,
                style: TextStyle(
                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
                ),
                decoration: _buildInputDecoration(
                  "City",
                  Icons.location_city_outlined,
                  isDarkMode,
                ),
                validator: AaliyahValidator.validateRequiredField,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _postalCodeController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light (normal)
                ),
                decoration: _buildInputDecoration(
                  "Postal Code",
                  Icons.numbers_outlined,
                  isDarkMode,
                ),
                validator: AaliyahValidator.validatePostalCode,
              ),
            ],
          ),
        const SizedBox(height: 12),

        // Province Dropdown
        DropdownButtonFormField<String>(
          value: _selectedProvince,
          style: TextStyle(
            color: AaliyahDarkColor, // Always black text
          ),
          decoration: InputDecoration(
            labelText: "Select Province",
            labelStyle: TextStyle(
              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
            ),
            prefixIcon: Icon(
              Icons.map_outlined,
              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AaliyahLightColor, // Always white background
          ),
          dropdownColor: AaliyahLightColor, // Always white background
          items: _provinces.map((String province) {
            return DropdownMenuItem<String>(
              value: province,
              child: Text(
                province,
                style: TextStyle(
                  color: AaliyahDarkColor, // Always black text
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedProvince = newValue;
            });
          },
          validator: (value) => value == null ? 'Please select a province' : null,
        ),
      ],
    );
  }

  Widget _buildDeliveryPreferences(bool isDarkMode) {
    return Column(
      children: [
        // Time Selection Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _selectTime(context),
            icon: Icon(
              Icons.access_time,
              color: isDarkMode ? AaliyahLightColor : AaliyahDarkColor, // White in dark, Black in light
            ),
            label: Text(
              _selectedTime != null 
                  ? "Delivery Time: ${_selectedTime!.format(context)}"
                  : "Select Delivery Time",
              style: TextStyle(
                color: isDarkMode ? AaliyahLightColor : AaliyahDarkColor, // White in dark, Black in light
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        
        // Selected time display
        if (_selectedTime != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Delivery time set to ${_selectedTime!.format(context)}",
                  style: TextStyle(
                    color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildPaymentMethod(bool isDarkMode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Checkbox
          Checkbox(
            value: _cashOnDelivery,
            onChanged: (bool? value) {
              setState(() {
                _cashOnDelivery = value ?? true;
              });
            },
            activeColor: Colors.green,
            checkColor: Colors.white,
          ),
          
          const SizedBox(width: 12),
          
          // Payment Info
          Icon(
            Icons.money_outlined,
            color: Colors.green,
            size: 24,
          ),
          const SizedBox(width: 12),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cash on Delivery",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
                  ),
                ),
                Text(
                  "Pay when you receive your order",
                  style: TextStyle(
                    color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon, bool isDarkMode) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light for label
      ),
      prefixIcon: Icon(
        icon, 
        color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor, // Black in dark, White in light for icon
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
          width: 2,
        ),
      ),
      filled: true,
      fillColor: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
      // Text color changes when focused
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        final brightness = MediaQuery.of(context).platformBrightness;
        final isDarkMode = brightness == Brightness.dark;
        
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: isDarkMode ? AaliyahSecondaryColor : AaliyahDarkColor,
              onPrimary: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _placeOrder(BuildContext context, CartProvider cartProvider) {
    final snackBar = SnackBar(
      content: Text(
        "Order Placed Successfully! You will pay Rs. ${cartProvider.totalPrice()} on delivery.",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
    cartProvider.clearCart();
    
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavBar()),
        (route) => false,
      );
    });
  }
}