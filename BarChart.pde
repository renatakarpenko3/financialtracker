// Define the BarChart class
class BarChart extends Visualization {
  BarChart(ArrayList<Expense> expenses, int year) {
    super(expenses, year);
  }

  void displayBarChart() {
    // Update category percentages
    countCategoryPercentage();

    float barWidth = 80;
    float xPos = 300;

    // Bar for Rent
    fill(0, 255, 0);
    rect(xPos, height - 260, barWidth, getRentPercentage());

    // Bar for Clothes
    fill(255, 255, 0);
    rect(xPos + barWidth + 20, height - 260, barWidth, getClothesPercentage());

    // Bar for Food
    fill(255, 0, 0);
    rect(xPos + (barWidth + 20) *2, height - 260, barWidth, getFoodPercentage());

    // Add labels
    fill(0);
    textAlign(CENTER);
    text("Rent", xPos + barWidth / 2, height - 30);
    text("Clothes", xPos + barWidth + 20 + barWidth / 2, height - 30);
    text("Food", xPos + 2 * (barWidth + 20) + barWidth / 2, height - 30);
  }

  void display() {
    // Draw the bar chart
    displayBarChart();

    // Draw additional information
    textAlign(LEFT);
    fill(0);
    for (int i = 0; i < expenses.size(); i++) {
      Expense expense = expenses.get(i);
      if (expense.getYear() == year) {
        text(expense.toString(), 20, 20 + i * 20);
      }
    }
  }
}
