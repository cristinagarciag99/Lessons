# Lesson 4.4: Feature Selection, Data Processing & KNN Algorithm

### Lesson Duration: 3 hours

> Purpose: The purpose of this lesson is to manage multiple categorical variables with _feature selection techniques_ and to go in detail on data preprocessing techniques for numerical variables. Students will learn about another regression algorithm - the `KNN` (_k nearest neighbor_).

---

### Setup

- All previous set up
- Please use the same Jupyter as used in the previous lesson

### Learning Objectives

After this lesson, students will be able to:

- Perform feature selection for categorical variables
- Implement different scaling techniques for numerical variables
- Describe how KNN algorithm works

---

### Lesson 1 key concepts

> :clock10: 20 min

Revisiting feature selection techniques looked at earlier

- Chi-square tests for independence of categorical variables

<details>
  <summary> Click for Description: Chi-square Test for Independence of Categorical variables  </summary>

- Categorical variables: _nominal_ vs. _ordinal_ (a quick overview)
- _Chi-square test_ is used to determine if there is a significant relationship between two nominal (categorical) variables. It works with nominal categorical variables well and not well ordinal categorical variables as the test is based on a contingency table (as we would see later) and the order in which frequencies are put in the table, does not change the result of the chi-square test.

In the contingency table, the frequency of each category for one nominal variable is compared across the frequencies of categories of the second nominal variable. Here is the code to show how to check the contingency table in Python:

```python
# contingency table
data_crosstab = pd.crosstab(data['DOMAIN'], data['RFA_2'], margins = False)
data_crosstab
```

- Based on the data in the contingency table we calculate the expected value of the nominal variables. Based on the expected values, the _chi-square test_ statistic is calculated which helps us decide on whether the variables are independent or not. Technically, though the value of the test statistic we are trying to prove or disprove some hypotheses on the independence of categorical variables.

- `H0` (_Null Hypothesis_) - assumes that there is no association between the two variables.
- `Ha` (_Alternate Hypothesis_) - assumes that there is an association between the two variables.
</details>

---

:coffee: **BREAK**

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 1 </summary>

- Link to [activity 1](https://github.com/ironhack-edu/data_4.04_activities/blob/master/4.04_activity_1.md).

</details>

<details>
  <summary>Click for Solution: Activity 1 solutions</summary>

- Link to [activity 1 solution](https://gist.github.com/ironhack-edu/dbfac550f0ad749afbc729e5446d55cb).

</details>

---

:coffee: **BREAK**

---

### Lesson 2 key concepts

> :clock10: 20 min

- Working with the established hypothesis

<details>
  <summary> Click for Description: Working with hypothesis testing and stat </summary>

- If the observed chi-square test statistic is greater than the critical value (this value is known already based on certain parameters) in the data, the null hypothesis can be rejected.
- If the observed chi-square test statistic is lower than the critical value (this value is known already based on certain parameters) in the data, the null hypothesis is accepted (also put as we fail to reject the null hypothesis) ie. based on the statistics we either reject `H0` or we fail to reject `H0`. You can also use the `p` value directly as we will see later in the lesson.

:exclamation: Note to instructor: This is only a very brief introduction to the concept of hypothesis testing. We will talk about it in the next couple of weeks.

- Three important values that we measure in order to calculate the Chi-square test statistic are:

      - Degrees of freedom `(r-1)\*(c-1)` where `r` is the number of rows and `c` is the number of columns
      - Actual frequencies
      - Expected frequencies

- Based on these values we calculate the test statistic that helps us determine if we reject or fail to reject the null hypothesis.

</details>

<details>
  <summary> Click for Code Sample  </summary>

```python
from scipy.stats import chi2_contingency
chi2_contingency(data_crosstab, correction=False)
```

This returns 4 results in this order (_chi-square_ statistic, _p_ value, degrees of freedom, expected frequencies matrix). Looking at the _p_ value, it is usually compared against 0.05. We will talk about _p_ value later but now we will just use this to decide on the variables directly.

Since in this case, the _p_ value is less than 0.05 we can reject the null hypothesis (that there is no relationship between the two categorical variables); ie. there is a correlation between the two variables. Hence we can drop one of the two columns. In this case, we are going to drop the column `RFA_2`.

</details>

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 2 </summary>

- Link to [activity 2](https://github.com/ironhack-edu/data_4.04_activities/blob/master/4.04_activity_2.md).

</details>

<details>
  <summary>Click for Solution: Activity 2 solutions</summary>

- Link to [activity 2 solution](https://gist.github.com/ironhack-edu/f4fd6f0ade5e65e7cc13b3866fbbf07a).

</details>

---

:coffee: **BREAK**

---

### Lesson 3 key concepts

> :clock10: 20 min

- Data Preprocessing for numerical variables
- Difference between standardization, normalization and min-max scaling

<details>
  <summary>Click for Description</summary>

- _Standard scaler_: Removes the mean and scales the data to unit variance. For each column, each value in the column is subtracted by the mean of the column and then divided by the standard deviation.
- _Min-max scaler_: It scales the data in the range of `[0,1]`. For each column, each value in the column is subtracted by the max of the column and then divided by the difference of max and min of the column. It is very sensitive to the presence of outliers.
- _Normalize_: It rescales the vector to have a unit norm. This means that, for each column, each value is divided by the magnitude of the column. The magnitude is calculated as the euclidean distance.

:exclamation: Note to instructor: [Additional reading](https://stackoverflow.com/questions/39120942/difference-between-standardscaler-and-normalizer-in-sklearn-preprocessing)

</details>

<details>
  <summary> Click for Code Sample:  </summary>

```python
# We will use the data we got after using VIF step for feature selection
# we will use it for numerical variables

data_corr.head()
numerical = data_corr.drop(['AVGGIFT'], axis=1)
```

```python
# Standardization/Standard Scaler

from sklearn.preprocessing import StandardScaler
transformer = StandardScaler().fit(X_num)
x_standardized = transformer.transform(X_num)
x_standardized
```

```python
# Min-max scaler

from sklearn.preprocessing import MinMaxScaler
transformer = MinMaxScaler().fit(numerical)
x_min_max = transformer.transform(numerical)
x_min_max
```

```python
# Normalization

from sklearn.preprocessing import Normalizer
transformer = Normalizer().fit(numerical)
x_normalized = transformer.transform(numerical)
x_normalized
```

</details>

---

:coffee: **BREAK**

---

### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Activity 3 </summary>

- Link to [activity 3](https://github.com/ironhack-edu/data_4.04_activities/blob/master/4.04_activity_3.md).

</details>

<details>
  <summary>Click for Solution: Activity 3 solutions</summary>

- Link to [activity 3 solution](https://gist.github.com/ironhack-edu/8d138c99417eccf499d8b35826e50a3b).

</details>

---

### Lesson 4 key concepts

> :clock10: 20 min

- Processing categorical column `DOMAIN`
- Encoding categorical column `DOMAIN` variables
- Introduce the `KNN` algorithm

<details>
  <summary> Click for Code Sample  </summary>

Keep using the same dataset we use in class.

```python
# Cleaning categorical column DOMAIN

vals_domain = pd.DataFrame(data['DOMAIN'].value_counts())
vals_domain = vals_domain.reset_index()
vals_domain.columns = ['domain', 'counts']
group_vals_domain_df = vals_domain[vals_domain['counts']<5000]
group_vals_domain = list(group_vals_domain_df['domain'])
group_vals_domain
```

```python
def clean_vals_domain(x):
    if x in group_vals_domain:
        return 'other'
    else:
        return x

data['DOMAIN'] = list(map(clean_vals_domain, data['DOMAIN']))
```

</details>

<details>
  <summary> Click for Code Sample: Encoding </summary>

```python
from sklearn.preprocessing import OneHotEncoder
encoder = OneHotEncoder(handle_unknown='error', drop='first').fit(data[['DOMAIN']])
encoded = encoder.transform(data[['DOMAIN']]).toarray()
encoded
```

</details>

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 4 </summary>

- Link to [activity 4](https://github.com/ironhack-edu/data_4.04_activities/blob/master/4.04_activity_4.md).

</details>

<details>
  <summary>Click for Solution: Activity 4 solutions</summary>

- Link to [activity 4 solution](https://gist.github.com/ironhack-edu/cae6af61e4e200c6a3b2871026f3a95a).

</details>

---

:coffee: **BREAK**

---

### :pencil2: Practice on key concepts - Lab: Normalization and encoding

> :clock10: 30 min

<details>
  <summary>Click for Instructions: Lab</summary>

- Link to the lab: [https://github.com/ironhack-labs/lab-data-cleaning-and-wrangling](https://github.com/ironhack-labs/lab-data-cleaning-and-wrangling)

</details>

<details>
  <summary>Click for Solution: Lab solutions</summary>

- Link to the [lab solution](https://gist.github.com/ironhack-edu/87ccb92a6dea0ad256e8d07fbb8fa4ed).

</details>

---

### Additional Resources

- [Difference between `standardscaler` and Normalizer in `sklearn.preprocessing`](https://stackoverflow.com/questions/39120942/difference-between-standardscaler-and-normalizer-in-sklearn-preprocessing)
