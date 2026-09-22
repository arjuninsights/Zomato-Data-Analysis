# 🍽️ Zomato Data Analysis Using Python

## 📌 Project Overview

This project performs an **Exploratory Data Analysis (EDA)** on Zomato restaurant data using Python.

The objective is to analyze restaurant characteristics such as **ratings, cost, votes, restaurant types, online ordering, and table booking** to identify patterns and relationships within the dataset.

The analysis follows a structured data analytics workflow:

**Data Loading → Data Cleaning → Data Processing → Exploratory Data Analysis → Visualization → Comparative Analysis → Key Insights**

---

## 🎯 Project Objectives

The analysis focuses on answering questions such as:

* What is the distribution of restaurant ratings?
* What is the distribution of restaurant costs?
* How do restaurant ratings vary by restaurant type?
* How does restaurant cost vary by restaurant type?
* What proportion of restaurants provide online ordering?
* What proportion of restaurants provide table booking?
* Does online ordering relate to restaurant ratings or cost?
* Does table booking relate to restaurant ratings or cost?
* Is there a relationship between ratings, votes, and cost?
* Which restaurant types have higher average ratings?
* Which restaurant types have higher average costs?

---

## 🛠️ Tools & Technologies

* **Python**
* **Pandas** – Data manipulation and analysis
* **NumPy** – Numerical operations
* **Matplotlib** – Data visualization
* **Seaborn** – Statistical visualization
* **Jupyter Notebook** – Analysis environment

---

## 📂 Project Structure

```text
Zomato-Data-Analysis/
│
├── Zomato_Data_Analysis.ipynb
├── Zomato-data.csv
├── README.md
└── Images/
    └── analysis_visualizations.png
```

---

## 🔄 Data Analysis Workflow

### 1. Data Loading

The dataset is loaded using Pandas:

```python
df = pd.read_csv('Zomato-data.csv')
```

Initial inspection is performed using:

* `head()`
* `info()`
* `shape`

This helps understand the structure and contents of the dataset.

---

### 2. Data Cleaning & Processing

The following data-quality checks and transformations were performed:

#### Missing Value Check

```python
df.isnull().sum()
```

#### Duplicate Check

```python
df.duplicated().sum()
```

#### Rating Transformation

The original `rate` column contains rating values in text format. A numeric rating column was extracted using regular expressions.

```python
df['rating'] = df['rate'].str.extract(r"(\d+\.?\d*)").astype(float)
```

Missing ratings were handled using the median:

```python
df['rating'].fillna(df['rating'].median(), inplace=True)
```

#### Cost Column

The approximate cost for two people was assigned to a shorter column name for easier analysis:

```python
df['cost'] = df['approx_cost(for two people)']
```

---

# 📊 Exploratory Data Analysis

## 1. Restaurant Type Analysis

The distribution of restaurants across different restaurant types was analyzed using:

```python
df['listed_in(type)'].value_counts()
```

This helps identify the most common restaurant categories in the dataset.

---

## 2. Online Ordering Analysis

The availability of online ordering was analyzed to understand how many restaurants support online orders.

```python
df['online_order'].value_counts()
```

---

## 3. Table Booking Analysis

The availability of table booking was also analyzed:

```python
df['book_table'].value_counts()
```

---

# 📈 Data Visualizations

The project includes multiple visualizations to understand the data from different perspectives.

### Distribution Analysis

* Rating Distribution
* Cost Distribution
* Votes Distribution
* Online Order Availability
* Table Booking Availability
* Restaurant Type Distribution

### Relationship Analysis

* Rating vs Cost
* Votes vs Rating

### Comparative Analysis

* Average Rating by Online Order
* Average Cost by Online Order
* Average Rating by Table Booking
* Average Cost by Table Booking

### Restaurant Type Analysis

* Average Rating by Restaurant Type
* Average Cost by Restaurant Type

### Distribution Comparison

* Rating Distribution by Restaurant Type
* Cost Distribution by Restaurant Type

### Correlation Analysis

A correlation heatmap was created for:

* Rating
* Votes
* Cost

This helps examine the relationships between the numerical variables.

---

# 🔍 Key Analysis Areas

## ⭐ Rating Analysis

The project calculates the average restaurant rating and examines how ratings are distributed across restaurants and restaurant types.

## 💰 Cost Analysis

The analysis investigates the approximate cost for two people and compares cost across restaurant types and service options.

## 🛵 Online Ordering

Restaurants are compared based on whether they provide online ordering, including differences in average rating and average cost.

## 🪑 Table Booking

Restaurants with and without table-booking facilities are compared based on their average rating and cost.

## 🏪 Restaurant Type

Restaurant types are analyzed based on:

* Number of restaurants
* Average rating
* Average cost
* Rating distribution
* Cost distribution

## 📊 Correlation Analysis

The project uses a correlation matrix to examine relationships among:

**Rating ↔ Votes ↔ Cost**

---

# 💡 Key Insights

The notebook generates key statistics including:

* Average restaurant rating
* Average cost for two people
* Average votes
* Percentage of restaurants offering online ordering
* Percentage of restaurants offering table booking
* Most common restaurant type
* Average rating comparison between online-ordering restaurants
* Average rating comparison between table-booking restaurants

These metrics provide a quantitative overview of restaurant characteristics and customer engagement.

---

# 📌 Business Questions

This analysis can help answer practical business questions such as:

1. Which restaurant types are most common?
2. Which restaurant types have higher average ratings?
3. Which restaurant types have higher average costs?
4. How does online ordering availability differ across restaurants?
5. Do restaurants offering online ordering have different average ratings?
6. Do restaurants offering table booking have different average ratings?
7. Is higher restaurant cost associated with higher ratings?
8. Is the number of votes associated with restaurant ratings?
9. How does cost vary between restaurants with different service options?
10. Which restaurant characteristics show the strongest relationships with customer ratings?

---

# 📁 Files Included

| File                         | Description                                 |
| ---------------------------- | ------------------------------------------- |
| `Zomato_Data_Analysis.ipynb` | Complete Python analysis and visualizations |
| `Zomato-data.csv`            | Zomato restaurant dataset                   |
| `README.md`                  | Project documentation                       |

---

# 🚀 Skills Demonstrated

This project demonstrates practical skills in:

* Data Cleaning
* Data Validation
* Exploratory Data Analysis
* Data Transformation
* Statistical Analysis
* GroupBy Analysis
* Correlation Analysis
* Data Visualization
* Business Question Analysis
* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook

---

# 👨‍💻 Author

**Arjun Kumar**

Data Analyst | SQL | Python | Power BI | Excel

🔗 **GitHub:** [ArjunKumar95476](https://github.com/ArjunKumar95476)

---

## ⭐ Project Highlights

> **A Python-based exploratory data analysis project that transforms raw Zomato restaurant data into meaningful insights using data cleaning, statistical analysis, visualization, and comparative analysis.**
