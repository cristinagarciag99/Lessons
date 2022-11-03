# Lesson 4.2: Exploratory Data Analysis & Regular Expressions

### Lesson Duration: 3 hours

> Purpose: The purpose of this lesson is to dive deeper into the exploratory data analysis process for categorical variables, identify the data cleaning and data processing operations we would perform. We will also introduce some more advanced data cleaning operations including regular expressions.

### Setup

- All previous set up
- Use the same Jupyter notebook as used in 4.1

### Learning Objectives

After this lesson, students will be able to:

- Conduct exploratory data analysis to understand the nature of available data
- Identify data cleaning and data processing operations on **categorical** variables
- Bucket data, for example to convert a numerical column into a categorical one
- Explain how regular expressions work and what to use them for

---

### Lesson 1 key concepts

> :clock10: 20 min

Conduct exploratory data analysis (`EDA`) - 1

- Analyze categorical variables
- Identify the changes to be made

<details>
  <summary> Click for Code Sample:  </summary>

Note this is a way to check the categorical variables (`dtypes` as object). If we want to perform any filtering operation, we will take the complete dataset and not just the categorical columns.

```python
categoricals = data.select_dtypes(np.object)
categoricals.head()
```

```python
# Deleting columns with over 80% empty values

data['PVASTATE'].value_counts()
data['RECP3'].value_counts()
data['VETERANS'].value_counts()
data = data.drop(columns=['PVASTATE', 'RECP3', 'VETERANS'], axis=1)
```

```python
data['HOMEOWNR'].value_counts()
```

As you can see, there is a lot of `null` values in the column but it is still not as many that the column might be removed. And if we filter out those values we will lose a lot of data. Another way of replacing those empty values is by replacing them with the maximum represented category but this introduces a bias.
Another advanced methods include using machine learning to predict those values. Here in this case we will delete this column instead of inducing a bias.

```python
data = data.drop(columns=['HOMEOWNR'], axis=1)
```

</details>

---

:coffee: **BREAK**

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 1 </summary>

- Link to [activity 1](https://github.com/ironhack-edu/data_4.02_activities/blob/master/4.02_activity_1.md).

</details>

<details>
  <summary>Click for Solution: Activity 1 solutions</summary>

- Link to [activity 1 solution](https://gist.github.com/ironhack-edu/625193701e849f61cb0e4886bb7dbbd9).

</details>

---

:coffee: **BREAK**

---

### Lesson 2 key concepts

> :clock10: 20 min

Cleaning categorical variables

- Using the `map` function to work on categories of a column
- Comparing categorical features with `Y` using box plot
- Impute missing values

<details>
  <summary> Click for Code Sample:  </summary>

```python
# Cleaning column GENDER

data['GENDER'].value_counts()
def clean_gender_col(x):
    if x in ['',' ' ,'U', 'C', 'J', 'A']:
        return 'other'
    else:
        return x

data['GENDER'] = list(map(clean_gender_col, data['GENDER']))
```

```python
# Visually analyzing categorical data with Target variable
sns.boxplot(x="GENDER", y="AVGGIFT", data=data)
plt.show()

sns.barplot(x="GENDER", y="AVGGIFT", data=data)
plt.show()
```

- Looking at the box plot, we can see that there is not a lot of variation in Y with different categories, we can delete the column gender

```python
data = data.drop(columns=['GENDER'], axis=1)
```

</details>

---

#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 2 </summary>

- Link to [activity 2](https://github.com/ironhack-edu/data_4.02_activities/blob/master/4.02_activity_2.md).

</details>

<details>
  <summary>Click for Solution: Activity 2 solutions</summary>

- Link to [activity 2 solution](https://gist.github.com/ironhack-edu/6a1aaa084adfcf169beccdf32c36331c).

</details>

---

:coffee: **BREAK**

---

### Lesson 3 key concepts

> :clock10: 20 min

- Dealing with a large number of categories in a column
- Grouping data/bucketing data

<details>
<summary> Click for Code Sample: Dealing with a large number of categories </summary>

This code gives us the names of the states that should be put into category `Other`:

```python
vals = pd.DataFrame(data['STATE'].value_counts())
vals = vals.reset_index()
vals.columns = ['state', 'counts']
group_states_df = vals[vals['counts']<2500]
group_states = list(group_states_df['state'])
group_states
```

```python
def clean_state(x):
    if x in group_states:
        return 'other'
    else:
        return x

data['STATE'] = list(map(clean_state, data['STATE']))
```

</details>

<details>
<summary> Click for Code Sample: Grouping data/bucketing data  </summary>

```python
# Creating buckets/groups of data

ic2_labels = ['Low', 'Moderate', 'High', 'Very High']
data['ic2_'] = pd.cut(data['ic2'],4, labels=ic2_labels)
data # or: data['ic2_']
```

```python
# There is also pd.qcut which is based on quantiles.

pd.cut(data['ic2'],4)     # to check the bins
```

</details>

---

:coffee: **BREAK**

---

### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Activity 3 </summary>

- Link to [activity 3](https://github.com/ironhack-edu/data_4.02_activities/blob/master/4.02_activity_3.md).

</details>

<details>
  <summary>Click for Solution: Activity 3 solutions</summary>

- Link to [activity 3 solution](https://gist.github.com/ironhack-edu/6a191fc95a24f3c62302fe31f63f844d).

</details>

---

### Lesson 4 key concepts

> :clock10: 20 min

Introduction to regular expressions

<details>
  <summary> Click for Code Sample: Simple Regex  </summary>

```python
import re

text = "That person wears marvelous trousers."

pattern = '[A-z]'
pattern = 'That'
pattern = '[That]'
pattern = '[atsdhksdgs]'
re.findall(pattern, text)

text = "This is an A and B conversation, so C your way out of it."
pattern = '[^A-z]'
re.findall(pattern, text)
```

</details>

<details>
  <summary> Click for Code Sample: Quantifiers </summary>

- `*`: Matches previous character 0 or more times
- `+`: Matches previous character 1 or more times
- `?`: Matches previous character 0 or 1 times (optional)
- `{}`: Matches previous characters however many times specified within:
- `{n}`: Exactly n times
- `{n,}`: At least n times
- `{n,m}`: Between n and m times

```python
text = "The complicit caat interacted with the other cats exactly as we expected."
pattern = "c*t"
print(re.findall(pattern, text))

text = "The complicit caat interacted with the other cats exactly as we expected."

pattern = 'c*a*t'
print(re.findall(pattern, text))

text = "The complicit caaaat ct interacted with the other cats exactly as we expected."
pattern = "a+"
print(re.findall(pattern, text))
# Returns matches where the previous character appears 1 or more times

text = "Is the correct spelling color or colour?"
pattern = "colou?r"
print(re.findall(pattern, text))

text = "We can match the following: aaaawwww, aww, awww, awwww, awwwww"
pattern = "aw{3}"
print(re.findall(pattern, text))

pattern = "aw{1,}"
print(re.findall(pattern, text))text = "Let's see how we can match the following: aaw, aaww, aawww, awwww, awwwww"

pattern = "a{2,}w{2,}"
print(re.findall(pattern, text))
```

</details>
   
#### :pencil2: Check for Understanding - Class activity/quick quiz

> :clock10: 10 min (+ 10 min Review)

<details>
  <summary> Click for Instructions: Activity 4 </summary>
  
- Link to [activity 4](https://github.com/ironhack-edu/data_4.02_activities/blob/master/4.02_activity_4.md).

</details>

<details>
  <summary>Click for Solution: Activity 4 solutions</summary>

- Link to [activity 4 solution](https://gist.github.com/ironhack-edu/5909394f4e0290e1531cd815e837c968).

</details>

---

:coffee: **BREAK**

---

### :pencil2: Practice on key concepts - Lab

> :clock10: 30 min

<details>
  <summary> Click for Instructions: Lab </summary>

- Link to the lab: [https://github.com/ironhack-labs/lab-cleaning-categorical-data](https://github.com/ironhack-labs/lab-cleaning-categorical-data)

</details>

<details>
  <summary>Click for Solution: Lab solutions</summary>

- Link to the [lab solution - v2 (updated in June 2022)](https://gist.github.com/ironhack-edu/4468253094ddd07aafdf11af18ab2447)
- Link to the [lab solution - v1 (before June 2022)](https://gist.github.com/ironhack-edu/37dcd6a0d1f8d699af50f283ad59eaea).
  
</detais>

---

### Additional Resources
