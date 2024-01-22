class VisualizationSketch extends Visualization {

  // Arrays to store PVector objects for circles
  PVector[] foodCircles;
  PVector[] rentCircles;
  PVector[] clothesCircles;

  // Constructor to initialize VisualizationSketch with expenses and year
  VisualizationSketch(ArrayList<Expense> expenses, int year) {
    super(expenses, year);
  }

  // Method to display the visualization
  void display() {
    // Set custom font for text display
    PFont customFont = createFont("Times New Roman", 14);
    textFont(customFont);

    // Call the countCategoryPercentage method from the parent class
    super.countCategoryPercentage();

    // Display colored circles
    displayColoredCircles();

    // Display expense details on the left side of the screen
    textAlign(LEFT);
    fill(0);
    for (int i = 0; i < expenses.size(); i++) {
      Expense expense = expenses.get(i);
      if (expense.getYear() == year) {
        text(expense.toString(), 20, 20 + i * 20);
      }
    }

    // Display legend for circle colors
    text("Clothes", 50, 380);
    fill(255, 255, 0);
    rect(20, 370, 10, 10);
    fill(0);
    text("Food", 150, 380);
    fill(255, 0, 0);
    rect(120, 370, 10, 10);
    fill(0);
    text("Rent", 250, 380);
    fill(0, 255, 0);
    rect(220, 370, 10, 10);
  }

  // Flag to check if circles are initialized
  boolean circlesInitialized = false;

  // Method to display colored circles based on category percentages
  void displayColoredCircles() {
    // Initialize circles if not done already
    if (!circlesInitialized) {
      initializeCircles();
      circlesInitialized = true;
    }

    // Draw a background rectangle for the circles
    fill(0);
    stroke(0);
    rect(40, 140, 200, 200);

    // Draw red circles for Food expenses
    fill(255, 0, 0);
    for (PVector circle : foodCircles) {
      ellipse(circle.x, circle.y, 10, 10);
    }

    // Draw green circles for Rent expenses
    fill(0, 255, 0);
    for (PVector circle : rentCircles) {
      ellipse(circle.x, circle.y, 10, 10);
    }

    // Draw yellow circles for Clothes expenses
    fill(255, 255, 0);
    for (PVector circle : clothesCircles) {
      ellipse(circle.x, circle.y, 10, 10);
    }
  }

  // Method to initialize circles based on category percentages
  void initializeCircles() {
    float radius = 5;
    int totalCircles = 100;

    // Calculate the number of circles for each category
    int foodCircleCount = (int(totalCircles * getFoodPercentage() / 100));
    int rentCircleCount = (int(totalCircles * getRentPercentage() / 100));
    int clothesCircleCount = totalCircles - foodCircleCount - rentCircleCount;

    // Initialize Food circles at random positions within specified range
    foodCircles = new PVector[foodCircleCount];
    for (int i = 0; i < foodCircleCount; i++) {
      foodCircles[i] = new PVector(random(50, 230), random(150, 330));
    }

    // Initialize Rent circles at random positions within specified range
    rentCircles = new PVector[rentCircleCount];
    for (int i = 0; i < rentCircleCount; i++) {
      rentCircles[i] = new PVector(random(50, 230), random(150, 330));
    }

    // Initialize Clothes circles at random positions within specified range
    clothesCircles = new PVector[clothesCircleCount];
    for (int i = 0; i < clothesCircleCount; i++) {
      clothesCircles[i] = new PVector(random(50, 230), random(150, 330));
    }

    // Draw a background rectangle for the circles
    fill(0);
    stroke(0);
    rect(40, 140, 200, 200);
  }
}
