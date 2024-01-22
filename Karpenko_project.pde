import controlP5.*;

int backgroundColor = 100;
int year_vis;
ControlP5 cp5;
ArrayList<Expense> expenses;
VisualizationSketch visualization;
BarChart barchart;
boolean visualizationCreated = false;
boolean barCreated = false;

void setup() {
  size(600, 400);
  cp5 = new ControlP5(this);

  // input fields
  cp5.addTextfield("amount").setPosition(20, 20).setSize(100, 20).setLabel("Amount");
  cp5.addTextfield("year").setPosition(150, 20).setSize(100, 20).setLabel("Year");

  // dropdown menu for categories
  cp5.addDropdownList("category")
    .setPosition(280, 20)
    .setSize(100, 200)
    .setLabel("Category")
    .addItem("Food", 0)
    .addItem("Clothes", 1)
    .addItem("Rent", 2);

  // button for adding expense
  cp5.addButton("addExpense").setPosition(420, 20).setSize(80, 20).setLabel("Add Expense");
  cp5.addTextfield("year_vis").setPosition(100, height - 40).setSize(100, 20).setLabel("year for visualization");
  cp5.addButton("visualize")
    .setPosition(10, height - 40)
    .setSize(80, 20)
    .setLabel("Visualize");

  // Initialize expenses array
  expenses = new ArrayList<Expense>();
  // Default data
  expenses.add(new Expense(20, 2023, "Food"));
  expenses.add(new Expense(20, 2023, "Clothes"));
  expenses.add(new Expense(20, 2023, "Rent"));
   
}
 
void draw() {
  background(backgroundColor);
  
  // Display expenses on the top of the screen
  for (int i = 0; i < expenses.size(); i++) {
    Expense expense = expenses.get(i);
    fill(0);
    text(expense.toString(), 20, 80 + i * 20);
  }
  
  if (barchart != null){
    background(255);
    barchart.display();
    
  }
  
  if (visualization != null) {
    visualization.display();
  }
}

void controlEvent(ControlEvent event) {
  // Checks if the Add Expense button is pressed
  if (event.isController() && event.getController().getName().equals("addExpense")) {
    // Gets values from input fields and dropdown menu
    float amount = Float.parseFloat(cp5.get(Textfield.class, "amount").getText());
    int year = Integer.parseInt(cp5.get(Textfield.class, "year").getText());

    int categoryIndex = (int) cp5.get(DropdownList.class, "category").getValue();
    String[] categories = {"Food", "Clothes", "Rent"};
    String category = categories[categoryIndex];

    // Adds a new expense to the array
    Expense newExpense = new Expense(amount, year, category);
    expenses.add(0, newExpense); // Add to the top of the list

    // Clears input fields
    cp5.get(Textfield.class, "amount").clear();
    cp5.get(Textfield.class, "year").clear();
    cp5.get(DropdownList.class, "category").setValue(0); // Reset dropdown to the first option
  } else if (event.isController() && event.getController().getName().equals("visualize")) {
    drawVisualization();
  }
}

void drawVisualization() {
  println("Visualizing...");
  year_vis = Integer.parseInt(cp5.get(Textfield.class, "year_vis").getText());
  println("Visualizing for year: " + year_vis);

  // Create visualization if it hasn't been created yet
  if (!visualizationCreated) {
    visualization = new VisualizationSketch(expenses, year_vis);
    visualizationCreated = true;
  }

  // Create barchart if it hasn't been created yet
  if (!barCreated) {
    barchart = new BarChart(expenses, year_vis);
    barCreated = true;
  }

  // Set the visibility of input fields and buttons to false
  cp5.get(Textfield.class, "amount").setVisible(false);
  cp5.get(Textfield.class, "year").setVisible(false);
  cp5.get(DropdownList.class, "category").setVisible(false);
  cp5.get(Button.class, "addExpense").setVisible(false);
  cp5.get(Textfield.class, "year_vis").setVisible(false);
  cp5.get(Button.class, "visualize").setVisible(false);

  // Display both visualizations
  background(255);
  if (visualization != null) {
    visualization.display();
  }
  
  if (barchart != null) {
    barchart.display();
  }
}
