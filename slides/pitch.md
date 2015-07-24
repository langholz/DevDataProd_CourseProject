Concrete compressive strength
========================================================
<br><br><br><br>
![](http://www.brickandtile.org/wp-content/uploads/2013/05/P1000444.jpg)
***
<br><br><br><br><br><br><br><br>
author: Elmar Langholz<br>
date: July 22, 2015

What is concrete compressive strength?
========================================================

- **[Concrete](https://en.wikipedia.org/wiki/Concrete):** A **composite material** made of aggregate bonded together with a fluid cement which hardens over time **used in construction**.

![](https://upload.wikimedia.org/wikipedia/commons/d/d0/Pantheon_dome.jpg)

***

- **[Compressive strength](https://en.wikipedia.org/wiki/Compressive_strength):** The **capacity** of a material or structure **to withstand** loads tending to reduce size.

![](http://www.masterbond.com/sites/default/files/lpimages/physical-strength_properties-compressive.png)


Problems
========================================================

- Concrete depends on a mixture of multiple materials which in incorrect quantities reduce the compressive strength.
- The interaction between the quantity of the materials that make up the mixture, as well as the time since its been made, are of a high complexity (nonlinear).
- If the compressive strength is not up to construction regulation, projects are cancelled and money is lost.
- If not discovered, buildings can collapse and lives could be lost.

Solution
========================================================

-  Leverage existing data for concrete mixture quantities of ingredients and performed compressive tests to:
  -  Build a machine learning model (using a neural network) to predict the compressive strength based on the quantity (kg / $m^3$) of the ingredients and age (days).
  -  Allow undestanding on how each ingredient affects the compressive strength while keeping other quantities fixed. Engineers can try out the interactions of increasing or reducing ingredient quantities.
  -  This allows experimenting with no ingredients while **reducing cost, time and lives lost**.

Conclusion
========================================================


-  Online Web Application: https://langholz.shinyapps.io/DevDataProd_CourseProject
-  Current model metrics: 
   - RMSE: 5.3351995
  -  RSquared: 0.8975612
-  Future work:
  -  Gather more data.
  -  Reduce RMSE and increase RSquared.
  -  Build a deeper neural network using more hidden layers.
  -  Experiment with parsimonious machine learning models (trees, random forest, ...) to explain relationships formally.
