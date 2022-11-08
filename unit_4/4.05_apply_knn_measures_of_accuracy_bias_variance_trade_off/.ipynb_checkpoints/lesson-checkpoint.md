# Lesson 4.5: Data modeling for accuracy

### Lesson Duration: 3 hours

> Purpose: The purpose of this lesson is to apply different models on the same data and compare the accuracies to select the best performing model. We will also talk a bit more in detail about different measures of accuracies for regression models and check how they are implemented in Python.

<!-- 🚨🚨🚨 @himanshu: do we need both unit4.csv and lesson_4.05_data.csv? it is confusing that notebook is using unit4.csv and the code example in lesson.md is using the other file.  -->

### Setup

- All previous set up

### Learning Objectives

After this lesson, students will be able to:

- Implement `KNN` (_k nearest neighbor_ algorithm)
- Choose the best value of `k` for the `KNN`
- Understand different measures of accuracies for regression models
- Compare linear regression and `KNN` models and select better performing model

---

### Lesson 1 key concepts

> :clock10: 20 min

- Final preparation of data for fitting the model

      - Putting numerical and categorical encoded data together
      - Train test split

- Revisit `KNN`
- Implement `KNN`

<details>
  <summary> Click for Code Sample:  </summary>

```python
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import OneHotEncoder
from sklearn.model_selection import train_test_split

data = pd.read_csv('lesson_4.05_data.csv') # this file is in files_for_lesson_and_activities folder
transformer = StandardScaler().fit(numericals)
x_standardized = transformer.transform(numericals)
```

```python
encoder = OneHotEncoder(handle_unknown='error', drop='first').fit(categoricals)
encoded = encoder.transform(categoricals).toarray()
```

```python
X = np.concatenate((x_standardized, encoded), axis=1)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=100)
```

```python
from sklearn.neighbors import KNeighborsRegressor
model = KNeighborsRegressor(n_neighbors=4)
model.fit(X_train, y_train)
```

```python
predictions = model.predict(X_test)
score = model.score(X_test, y_test)
```

</details>

---

:coffee: **BREAK**

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 1 </summary>

- Link to [activity 1](https://github.com/ironhack-edu/data_4.05_activities/blob/master/4.05_activity_1.md).

</details>

<details>
  <summary>Click for Solution: Activity 1 solutions</summary>

- Link to [activity 1 solution](https://gist.github.com/ironhack-edu/ddab9254d9782baee064d801d2cd3b1d).

</details>

---

:coffee: **BREAK**

---

### Lesson 2 key concepts

> :clock10: 20 min

- Choosing the best value of `k` for the `KNN`

<details>
  <summary> Click for Code Sample:  </summary>

```python
from sklearn.neighbors import KNeighborsRegressor
scores = []
for i in range(2,10):
    model = KNeighborsRegressor(n_neighbors=i)
    model.fit(X_train, y_train)
    scores.append(model.score(X_test, y_test))
```

```python
plt.figure(figsize=(10,6))
plt.plot(range(2,10),scores,color = 'blue', linestyle='dashed',
         marker='o', markerfacecolor='red', markersize=10)
plt.title('accuracy scores vs. K Value')
plt.xlabel('K')
plt.ylabel('Accuracy')
```

</details>

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 2 </summary>

- Link to [activity 2](https://github.com/ironhack-edu/data_4.05_activities/blob/master/4.05_activity_2.md).

</details>

<details>
  <summary>Click for Solution: Activity 2 solutions</summary>

- Link to [activity 2 solution](https://gist.github.com/ironhack-edu/e9b0ec15c1b40177fb8b1ecc45175e98).

</details>

---

:coffee: **BREAK**

---

### Lesson 3 key concepts (ppt added)

> :clock10: 20 min

- [**SLIDES**](https://docs.google.com/presentation/d/1REBc9LkwY1lopuMeeG7nOgJh5yqTxWJh04rCov80qmM/edit?usp=sharing)

- Bias
- Variance
- Bias/Variance trade-off
- Over-fitting vs. under-fitting
- Discussion on Over-fitted models vs. under-fitted models

      - How they can impact the predictions

<details>
  <summary> Click for Description:  </summary>

- **Bias** - When we say that a measurement is unbiased, we mean that the average of a large set of observations will be close to the true value.

- **Variance** is a measurement of the spread between numbers in a data set.

:exclamation: Note to instructor: This is a more theoretical concept, so make sure to emphasize visuals from the slides.

</details>

---

:coffee: **BREAK**

---

### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Activity 3 </summary>

- Link to [activity 3](https://github.com/ironhack-edu/data_4.05_activities/blob/master/4.05_activity_3.md).

</details>

<details>
  <summary>Click for Solution: Activity 3 solutions</summary>

- Link to [activity 3 solution](https://gist.github.com/ironhack-edu/33f7f90cc5079d70497092ba029a12ce).

</details>

---

### Lesson 4 key concepts

> :clock10: 20 min

- Measures of accuracies for regression models

      - `MAE` (Mean Absolute Error)
      - `MSE` (Mean Square Errors) and `RMSE` (Root Mean Square Errors)
      - `R` square
      - Adjusted `R` square

:exclamation: Note to instructor: Explain the difference between _`r` square_ and _adjusted `r` square_ - how adding more features to the model might tend to increase the `r` square even if the features are not significant while the same doesn't happen with adjusted `r` square. Adding insignificant features to the model might also lead to over-fitting (we will talk about over-fitting and under-fitting in the next session).

<details>
  <summary> Click for Discussion </summary>

- In regression problems, we measure the accuracy of an algorithm based on how far away the values that the algorithm predicts are from the true values.

![Measure of Accuracy](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/4.5-measures_of_accuracies.png)

</details>

<details>
  <summary> Click for Code Sample: `MAE` </summary>

The **mean absolute error** is the average (_mean_) of the absolute value of the distance between predicted and actual values. It is a measure of absolute error: because of this, we do not know if the algorithm is overestimating or underestimating when it is incorrect. Also because of the absolute value, it is not very sensitive to outliers, comparatively to other metrics.

```python
from sklearn.metrics import mean_absolute_error
score = mean_absolute_error(actual_values, predictions)
```

</details>

<details>
  <summary> Click for Code Sample: `MSE` </summary>

The **`MSE`** takes the difference between the predicted value and the actual value, squares it, then takes the average (_mean_) of those values.

```python
from sklearn.metrics import mean_squared_error
score = mean_squared_error(actual_values, predictions)
```

</details>

<details>
  <summary> Click for Code Sample: RMSE </summary>

The **`RMSE`** is the square root of the _mean square error_.

```python
import math
from sklearn.metrics import mean_squared_error
mse = mean_squared_error(actual_values, predictions)
rmse = math.sqrt(mse)
```

</details>

<details>
  <summary> Click for Code Sample: `R` square </summary>

The **`R-squared`** is the proportion of the variance in the model predictions that is predictable based on the input values. Practically, it is a measure of how likely future samples are to be predicted accurately by the model.
Adding more independent variables to a regression model tends to increase the `R-squared` value, which might give us a false idea about the accuracy of the model. This would also lead to over-fitting and can return an unwarranted high `R-squared` value.

```python
from sklearn.metrics import r2_score
score = r2_score(actual_values, predictions)
```

<details>
  <summary> Click for Discussion: `Adjusted R square` </summary>

We use the **adjusted R-squared** to compare regression models that contain different numbers of independent variables. For example, there is a model with 10 variables and the other model has 20 variables. The model with 20 variables will give a larger R square but does that really mean that this model is better than the other model. We can't say it for sure. For this, we use adjusted the `r` square.

Adjusted `r` square adjusts for the number of terms in the model. Its value increases only when the new term improves the model fit while it decreases when the term doesn't improve the model fit by a sufficient amount.

![Adjusted R square](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/4.5-adjusted_r_square.gif)

</details>

<details>
  <summary> Click for Code Sample: Adjusted R square </summary>

```python
score = 1 - (1-r_squared)*(len(y_test)-1)/(len(y_test)-X_test.shape[1]-1)
```

</details>

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 4 </summary>

- Link to [activity 4](https://github.com/ironhack-edu/data_4.05_activities/blob/master/4.05_activity_4.md).

</details>

<details>
  <summary>Click for Solution: Activity 4 solutions</summary>

- Link to [activity 4 solution](https://gist.github.com/ironhack-edu/e9d795bf1fa6480195ff73898b6d05db).

</details>

---

:coffee: **BREAK**

---

### :pencil2: Practice on key concepts - Lab

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Lab </summary>

- Link to the lab: [https://github.com/ironhack-labs/lab-comparing-regression-models](https://github.com/ironhack-labs/lab-comparing-regression-models)

</details>

<details>
  <summary>Click for Solution: Lab solutions</summary>

- Link to the [lab solution](https://gist.github.com/ironhack-edu/f49e7ec6b5ac1b1aa4a9ddbce207edd0).

</details>

---

### Additional Resources

- [Choosing the correct regression analysis method](https://statisticsbyjim.com/regression/choosing-regression-analysis/)
- [Continuous, discrete and categorical variables](https://support.minitab.com/en-us/minitab-express/1/help-and-how-to/modeling-statistics/regression/supporting-topics/basics/what-are-categorical-discrete-and-continuous-variables/)
