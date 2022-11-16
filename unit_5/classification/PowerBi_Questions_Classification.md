# PowerBi - Classification

In this part of the project, you will work with the data set `creditcardmarketing.xlsx` and use PowerBi to answer the questions below. Make a separate sheet for every question: 

**PowerBi Questions**:

1. Convert the necessary data types where necessary (hint: convert variables that are categorical in nature but stored as numerical). 
2. Check the imbalance in the dataset by looking at the number of customers who accepted the offer vs. customers who did not accept the offer. Add the counts as labels to a plot to show this imbalance. 

3. Create a plot to check the percentage of total customers who accepted versus those who did not accept.

4. Now, we will try to analyze certain characteristics / the differences between the people who accepted the offer vs. people who did not accept the offer. Use the same sheet for the plots below.
    * Plot average Q1 balance vs. Offer Accepted. Provide the values of averages as data labels.
    * Plot average Q2 balance vs. Offer Accepted. Provide the values of averages as data labels.
    * Plot average Q3 balance vs. Offer Accepted. Provide the values of averages as data labels.
    * Plot average Q4 balance vs. Offer Accepted. Provide the values of averages as data labels.

5. We saw all the four plots together on the same sheet. The plots should have the same format for numbers (number of decimal places here). Do you observe any trend here? Add a caption to provide the explanation
    * Now for all the plots, change the style of the plot from a bar chart to a line chart. This could be used for a visual trend (**Hint: For this task, you will have to connect to the data source again and unpivot the columns Q1 to Q4 as a transform step while importing your data**)

6. Consider a similar analysis for Household Size vs average balances for each quarter. You would observe a huge jump in average balance from Q1 to Q2 for households with size 8. 
    * Try and explain that jump. Hint: Check the number of records we have for such customers. Do you see any anomaly?

7. Now we want to see how some of the other features in the data might have affected responses from the customers. For these we will first start by creating a cross tab. A cross tab is simply a table built between two categorical features on rows and columns with some metric of importance filling up the table. Find the right chart type for this and create the report. 
    * Create a cross tab (Matrix) between Offer Accepted and Overdraft Protection and fill the table with number of records. Do you observe any trend here?
    * Create a cross tab (Matrix) between Offer Accepted and Mailer Type and fill the table with number of records. Do you observe any trend here?
    * Create a cross tab (Matrix) between Offer Accepted and Credit Rating and fill the table with number of records. Rearrange the column credit rating from low to high. Do you observe any trend here?

**🚨 Not yet edited 🚨** 

8. Based on the average balance for each customer, create four buckets or groups: Category A, Category B, Category C and Category D. Category A is from min value to 700, 701 to 1400, 1400 to 1900, and 1900 to 3366. Check the number of observations for each of these categories.

9. Create a visually appealing report to represent the information discovered in this analysis along with any other insights you want to highlight. 

<br><br>

**Some points to keep in mind while working on the PowerBi questions:**

  a) The plots should be well labeled briefly describing the purpose of the plot <br>
  b) Select the chart type that produces an effective outcome for a given scenario <br>
  c) Focus audience attention on the most important data <br>
  d) Use space, color and fonts appropriately <br>
  e) Use the correct title for the plots <br>
  f) Utilize formatted tooltips and descriptive titles <br>
  g) Format the axes wherever necessary <br>
  h) Use the caption to add details wherever necessary <br>
  i) Use appropriate drill-down level of details with labels and color coding etc. <br>
  j) For the dashboard, make sure that the information represented is clear and easy to understand. The user of the dashboard should be able to understand the purpose of the dashboard and should be able to make decisions looking at the plots presented <br>
  k) You can also use filters wherever appropriate to give the user the flexibility to view different information easily <br>
