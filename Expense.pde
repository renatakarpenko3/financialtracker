class Expense {
  float amount;
  int year;
  String category;

  Expense(float amount, int year, String category) {
    this.amount = amount;
    this.year = year;
    this.category = category;
  }

  // Custom toString method for displaying expense details
  String toString() {
    return "Amount: " + amount + " | Year: " + year + " | Category: " + category;
  }

  float getAmount() {
    return amount;
  }

  String getCategory() {
    return category;
  }

  int getYear() {
    return year;
  }
}
