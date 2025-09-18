# Smart Ahwa Manager 🍵☕

A comprehensive Flutter application designed specifically for traditional Egyptian coffee houses (Ahwa) to streamline operations and enhance business management.
## 📱 Screenshots

| New Order | Orders Management | Reports & Analytics |
|-----------|------------------|-------------------|
| <img src="https://github.com/user-attachments/assets/ef65c8a0-c34f-4fee-9c9a-175334f71bff" alt="New Order Screen" width="200"> | <img src="https://github.com/user-attachments/assets/daccddc0-5e38-4ac8-b7ae-f9f0936166f8" alt="Orders Screen" width="200"> | <img src="https://github.com/user-attachments/assets/da7b57c9-c6f8-4418-92ad-e933b6e993ee" alt="Reports Screen" width="200"> |

## 🌟 Features

### 📝 Order Management
- **Add New Orders**: Create orders with customer name, drink selection, and special instructions
- **Real-time Tracking**: Monitor pending orders with timestamps
- **Order Completion**: Mark orders as completed with a single tap
- **Traditional Cairo Culture**: Supports local expressions like "extra mint, ya rais"

### 📊 Business Analytics
- **Visual Reports**: Interactive charts showing business performance
- **Top Selling Drinks**: Bar chart visualization of most popular items
- **Revenue Tracking**: Real-time revenue calculations in Egyptian Pounds (LE)
- **Hourly Trends**: Track order patterns throughout operating hours

### 🍵 Drink Menu
- **Drinks**: Shai (Tea), Turkish Coffee, Hibiscus Tea, Mint Tea, Cappuccino, Latte, Americano
- **Flexible Pricing**: Easy-to-manage pricing system

## 🏗️ Architecture & Design Principles

This application demonstrates professional software engineering practices:

### SOLID Principles Implementation
- **Single Responsibility Principle (SRP)**: Each class has a single, well-defined purpose
- **Open/Closed Principle (OCP)**: Extensible drink system without modifying existing code
- **Interface Segregation Principle (ISP)**: Separate interfaces for different responsibilities

### Object-Oriented Programming Features
- **Inheritance**: Hierarchical drink classification system
- **Polymorphism**: Uniform handling of different drink types
- **Encapsulation**: Protected internal state with controlled access
- **Abstraction**: Clean separation of concerns and interfaces

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK (3.0+)
- Android Studio / VS Code
- Android device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ahmedyaser12/Ahwa-Managet.git
   cd smart-ahwa-manager
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📱 Usage

### Adding a New Order
1. Navigate to the "New Order" tab
2. Enter customer name
3. Select drink from dropdown menu
4. Add special instructions (optional)
5. Tap "Add Order"

### Managing Orders
1. Go to "Orders" tab to view pending orders
2. See order details, special instructions, and price
3. Tap "Complete" to mark orders as finished

### Viewing Reports
1. Access "Reports" tab for business analytics
2. View total orders and revenue in summary cards
3. Analyze top-selling drinks with bar charts
4. Monitor hourly order patterns

## 🛠️ Technical Stack

- **Framework**: Flutter
- **Language**: Dart
- **Architecture**: SOLID Principles + OOP
- **State Management**: setState (can be extended to Provider/Bloc)
- **UI**: Material Design with custom components
- **Charts**: Custom painters for data visualization

## 📁 Project Structure

```
lib/
├── main.dart                          # Application entry point
├── ahwa_manager/                      # Core application module
│   ├── data/                         # Data layer
│   │   └── local_data/
│   │       └── local_data.dart       # Local storage management
│   ├── models/                       # Data models
│   │   ├── drink_model.dart         # Drink entity model
│   │   └── order_model.dart         # Order entity model
│   ├── repo/                        # Repository layer
│   │   └── orders_repo.dart         # Orders data repository
│   └── presentation/                # UI layer
│       └── screen/                  # Application screens
│           ├── add_order_screen.dart    # New order creation
│           ├── order_screen.dart        # Orders management
│           └── reports_screen.dart      # Analytics & reports
```

## 🎨 Design Philosophy

The app embraces Cairo's rich coffee culture while providing modern functionality:
- **Cultural Authenticity**: Supports Arabic expressions and local customs
- **User-Friendly**: Intuitive interface designed for busy ahwa owners
- **Performance**: Optimized for smooth operation on various devices
- **Scalability**: Architecture supports easy feature additions

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 👨‍💻 Author

**Ahmed Yaser**
- GitHub: [@ahmedyaser12](https://github.com/ahmedyaser12)
- Email: ahmedyaserramadan456@gmail.com

## 🙏 Acknowledgments

- Inspired by traditional Egyptian coffee house culture
- Built with love for the local business community in Cairo
- Special thanks to ahwa owners who inspired this project

---

**Made with ❤️ in Cairo for the Ahwa community**
