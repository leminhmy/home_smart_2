class EnergyChart{
  double price;
  String month;
  int valueKWH;

  EnergyChart({
    required this.month,
    required this.price,
    required this.valueKWH,
    });
}

List<EnergyChart> demoEnergyChart= [
  EnergyChart(month: "01", price: 12, valueKWH: 04),
  EnergyChart(month: "02", price: 68.0, valueKWH: 66),
  EnergyChart(month: "03", price: 77, valueKWH: 11),
  EnergyChart(month: "04", price: 0.3, valueKWH: 42),
  EnergyChart(month: "05", price: 10, valueKWH: 21),
  EnergyChart(month: "06", price: 33, valueKWH: 224),
  EnergyChart(month: "07", price: 69, valueKWH: 55),
  EnergyChart(month: "08", price: 18, valueKWH: 02),
  EnergyChart(month: "09", price: 85, valueKWH: 51),
  EnergyChart(month: "10", price: 52.3, valueKWH: 762),
  EnergyChart(month: "11", price: 65, valueKWH: 66),
  EnergyChart(month: "12", price: 95.2, valueKWH: 200),
];