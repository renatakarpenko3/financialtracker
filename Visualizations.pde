class Visualization {
  float totalFood;
  float totalRent;
  float totalClothes;
  ArrayList<Expense> expenses;
  int year;
  float foodPercentage, clothesPercentage, rentPercentage;

  // Constructor to receive data from the main sketch
  Visualization(ArrayList<Expense> expenses, int year) {
    this.expenses = expenses;
    this.year = year;
    // Initialize totals to zero here
    totalFood = 0;
    totalRent = 0;
    totalClothes = 0;
  }

  // Function to count the percentage of each category in the dataset for the selected year
  void countCategoryPercentage() {
    // Call collectAmountAndCategory to update the totals
    collectAmountAndCategory();

    float totalExpenses = 0;

    for (Expense expense : expenses) {
      if (expense.getYear() == year) {
        totalExpenses += expense.getAmount();
      }
    }

    // Update class variable
    foodPercentage = (totalExpenses > 0) ? (totalFood / totalExpenses) * 100 : 0;
    rentPercentage = (totalExpenses > 0) ? (totalRent / totalExpenses) * 100 : 0;
    clothesPercentage = (totalExpenses > 0) ? (totalClothes / totalExpenses) * 100 : 0;

    // print percentage values
    println("Food Percentage: " + foodPercentage + "%");
    println("Rent Percentage: " + rentPercentage + "%");
    println("Clothes Percentage: " + clothesPercentage + "%");
  }

  // Function to collect amounts for each category in the dataset for the selected year
  void collectAmountAndCategory() {
    totalFood = 0;
    totalRent = 0;
    totalClothes = 0;

    for (Expense expense : expenses) {
      if (expense.getYear() == year) {
        if (expense.getCategory().equals("Food")) {
          totalFood += expense.getAmount();
        } else if (expense.getCategory().equals("Rent")) {
          totalRent += expense.getAmount();
        } else if (expense.getCategory().equals("Clothes")) {
          totalClothes += expense.getAmount();
        }
      }
    }

    // print total expenses
    println("Total Food Expenses: " + totalFood);
    println("Total Rent Expenses: " + totalRent);
    println("Total Clothes Expenses: " + totalClothes);
  }

  // Getter methods for percentage values
  float getRentPercentage() {
    return rentPercentage;
  }

  float getClothesPercentage() {
    return clothesPercentage;
  }

  float getFoodPercentage() {
    return foodPercentage;
  }
}
