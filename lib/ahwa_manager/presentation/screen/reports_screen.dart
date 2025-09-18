import 'package:ahwa_manger/ahwa_manager/data/models/order_model.dart';
import 'package:ahwa_manger/ahwa_manager/data/repo/orders_repo.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  final OrderManager orderManager;

  ReportsScreen({required this.orderManager});

  @override
  Widget build(BuildContext context) {
    final topDrinks = orderManager.getTopSellingDrinks();
    final totalOrders = orderManager.getTotalOrdersServed();
    final totalRevenue = orderManager.getTotalRevenue();
    final completedOrders = orderManager.getCompletedOrders();

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daily Reports',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 20),

          // Summary Cards Row
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  'Total Orders',
                  totalOrders.toString(),
                  Icons.receipt_long,
                  Colors.blue,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildSummaryCard(
                  'Revenue',
                  '${totalRevenue.toStringAsFixed(0)} LE',
                  Icons.monetization_on,
                  Colors.green,
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Sales Chart
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Selling Drinks',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 16),
                  if (topDrinks.isEmpty)
                    Container(
                      height: 200,
                      child: Center(child: Text('No completed orders yet')),
                    )
                  else
                    _buildBarChart(topDrinks, context),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Hourly Sales Trend
          if (completedOrders.isNotEmpty)
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Orders by Hour',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 16),
                    _buildHourlyChart(completedOrders, context),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(title, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart(Map<String, int> topDrinks, BuildContext context) {
    final maxValue = topDrinks.values.isEmpty
        ? 1
        : topDrinks.values.reduce((a, b) => a > b ? a : b);
    final chartData = topDrinks.entries.take(5).toList();

    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: chartData.map((entry) {
          final percentage = entry.value / maxValue;
          final barHeight = 150 * percentage;

          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                entry.value.toString(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Container(
                width: 40,
                height: barHeight,
                decoration: BoxDecoration(
                  color: Colors.brown[400],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 60,
                child: Text(
                  entry.key.split(' ')[0], // First word only
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPieChart(List<Order> orders, BuildContext context) {
    Map<String, int> categories = {};

    final total = orders.length;
    final colors = [Colors.brown[400]!, Colors.brown[600]!, Colors.brown[800]!];

    return SizedBox(
      height: 150,
      child: Row(
        children: [
          // Pie Chart
          Expanded(
            flex: 2,
            child: CustomPaint(
              size: Size(120, 120),
              painter: PieChartPainter(categories, colors),
            ),
          ),
          // Legend
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: categories.entries.map((entry) {
                final index = categories.keys.toList().indexOf(entry.key);
                final percentage = ((entry.value / total) * 100)
                    .toStringAsFixed(1);

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        color: colors[index % colors.length],
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(entry.key, style: TextStyle(fontSize: 12)),
                            Text(
                              '$percentage%',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyChart(List<Order> orders, BuildContext context) {
    Map<int, int> hourlyOrders = {};
    for (int hour = 6; hour <= 23; hour++) {
      hourlyOrders[hour] = 0;
    }

    for (Order order in orders) {
      int hour = order.orderTime.hour;
      if (hour >= 6 && hour <= 23) {
        hourlyOrders[hour] = hourlyOrders[hour]! + 1;
      }
    }

    final maxOrders = hourlyOrders.values.isEmpty
        ? 1
        : hourlyOrders.values.reduce((a, b) => a > b ? a : b);

    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: hourlyOrders.entries.map((entry) {
          final percentage = maxOrders == 0 ? 0.0 : entry.value / maxOrders;
          final barHeight = 80 * percentage;

          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (entry.value > 0)
                Text(entry.value.toString(), style: TextStyle(fontSize: 8)),
              SizedBox(height: 2),
              Container(
                width: 12,
                height: barHeight.isNaN ? 0 : barHeight,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 4),
              Text('${entry.key}h', style: TextStyle(fontSize: 8)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final Map<String, int> data;
  final List<Color> colors;

  PieChartPainter(this.data, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * 0.8;
    final total = data.values.fold(0, (sum, value) => sum + value);

    if (total == 0) return;

    double startAngle = -90 * (3.14159 / 180); // Start from top

    int colorIndex = 0;
    for (MapEntry<String, int> entry in data.entries) {
      final sweepAngle = (entry.value / total) * 2 * 3.14159;

      final paint = Paint()
        ..color = colors[colorIndex % colors.length]
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      startAngle += sweepAngle;
      colorIndex++;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
