## Why?

  Concrete [compressive strength](https://en.wikipedia.org/wiki/Compressive_strength) is an important value in civil engineering and construction because there are regulations around the needed for specific thresholds in values for houses or buildings. Whether the concrete is strong enough or not to withstand standards depends on the quanitty of mixture of the elements used to create it. Through this application we construct a neural network regression model that has the intent of approximating the concrete compressive strength based on the mixture quantities (e.g. cement, superplasticizer, ...). As a point in hand it also allows for visualization of interactions between the material(s) given a defined range of values.
  
## How?

### Predicting the concrete compressive strength

  In the **Calculate tab**, anyone can provide the corresponding quantities for the mixture and the concrete compressive strength is predicted after pressing the **Calculate button**.

### Mixture quantity effect on concrete compressive strength

  In the **Interactions tab**, one must select a mixture element that we wish to see its effect on the compressive strength. One can select a **quantity range** for the material and a **Point count** (which indicates how many items points the grpah will include). To update the graph, press the **Calculate button**.
  
## Where can I look at the code?

*  [Github](https://github.com/langholz/DevDataProd_CourseProject)

## References:

*  https://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength
*  http://www.nrmca.org/aboutconcrete/cips/35p.pdf
*  https://courses.washington.edu/cm425/strength.pdf
*  I-Cheng Yeh, "Modeling of strength of high performance concrete using artificial neural networks," Cement and Concrete Research, Vol. 28, No. 12, pp. 1797-1808 (1998)

