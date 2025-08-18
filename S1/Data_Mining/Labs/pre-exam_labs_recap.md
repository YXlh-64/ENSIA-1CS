# Lab 1 :
Introduction to pandas and numpy

# Lab 2 : Data Preprocessing and Cleaning

## Data Quality Issues

### Missing data :
 One attribute value or more missing for an instence,  
 **<font color="red">How to deal with it:</font>** replace by the median value, discard the data point ...

### Outliers : 
 An instence of the data with clearly different attribute values from the other data instences  
 **<font color="blue">How to identify them:</font>** Using Boxplot(numerical data)  
 **<font color="red">How to deal with it:</font>** Discard according to abnormal Z-score values  
 In some cases we are looking for outliers in our data (anomaly detection) So discarding the outliers will fail our model  

### Duplicate Date :
 Same instence of data duplicate many times in the dataset, or instences having a lot of common attribute values

## Aggregation
Data aggregation is a preprocessing task where the values of two or more objects are combined into a single object in order to :  
* reduce the data size   
* change the granularity of analysis (from fine-scale to coarser-scale)  
* improve the stability of the data  
**<font color="yellow">granularity of analysis:</font>** the level of detail or resolution at which data is analyzed  
**<font color="yellow">fine-scale:</font>** analyzing data at a very detailed level  
**<font color="yellow">coarser-scale:</font>** aggregates data into broader categories (منظور سطحي اكثر)  
**<font color="yellow">stability of the data:</font>** consistency and reliability of data patterns over time

## Sampling
* Sampling with replacement : each selected instance is removed from the dataset  
* Sampling without replacement : allows instences to be selected more than once in the sample  

## Discretization
Transform a continuous-valued attribute to a categorical attribute


# Lab 4 & 5 : Dimensionality Reduction and Feature Selection

## PCA (Principal component analysis) 

PCA is a fast and flexible unsupervised demontionality reduction technique that can capture linear correlations between the features.  
**<font color="yellow">Other uses of PCA :</font>** visualization, noise filtering, feature extraction, engineering,...etc  
**<font color="green">Steps of PCA :</font>**  

<font color="orange">1.Standardize the data</font>  
Subtracting the mean and scaling to unit variance: \( Z = \frac{X - \mu}{\sigma} \)  
This step makes the data centered around the zero (the mean of each feature after this step is 0 and \(sigma \) equal to 1) and this  
confirms that all the features will contribute equally in the analysis.  

<font color="orange">2.Find the covariance matrix</font>  
This matrix captures the relationships between the features by showing how changes in one feature are associated with changes in another:

$$ \text{Cov}(X) = \frac{X^\top X}{n} $$
   
<font color="orange">3.Find the eigenvectors and eigenvalues of the covariance matrix</font>  
The eigenvectors represent the directions of maximum variance, while the eigenvalues indicate the magnitude of this variance along each eigenvector  

<font color="orange">4.Rearrange the eigenvectors and eigenvalues</font>  
Sort the eigenvalues in descending order to prioritize the components that explain the most variance in the data. Correspondingly, we rearrange the  
eigenvectors to match the sorted eigenvalues. This allows us to identify the principal components that will be used for dimensionality reduction.  

<font color="orange">5.Choose principal components</font>  
We select the first k eigenvectors, where k represents the desired number of dimensions for the new feature subspace. We focus on the directions that  
capture the most variance in the data, effectively reducing its dimensionality while retaining essential information.

**How to select k ?** 
A vital part of using PCA in practice is the ability to estimate how many components are needed to describe the data. This can be determined by  
looking at the cumulative explained variance ratio as a function of the number of components, and accordingly we select the number k where k keeps a  
high variance (75% ~ 90%) and also reduce the number of components as much as possible

<font color="orange">6.Project the data</font>  
In the final step, we transform the original data matrix X using the projection matrix W, which consists of the selected k eigenvectors. This operation projects the data into a k-dimensional feature subspace, effectively reducing its dimensionality while preserving the most significant patterns and relationships within the data:  

$$ X_{\text{proj}} = X_{\text{std}} \cdot W^\top $$  


## Entropy and Information Gain

## Forward Selection and Backward elimination
**Forward Selection:** A feature selection method that starts with no features and iteratively adds the feature that improves the model the most until a stopping criterion is met.  
**Backward Elimination:** A feature selection method that starts with all features and iteratively removes the least significant feature until a stopping criterion is met.

### Maximum Number of Models Trained:
Both forward selection and backward elimination train \( \text{Total Models} = \frac{N \times (N + 1)}{2} \) models for 𝑁 features.  

### Computational Demands:
**Forward Selection:** The computational complexity for forward selection is: \(O(M \times N)\) where \( M \) is the number of selected  
features. This method scales better when \( M \ll N \).  
**Backward Elimination:** The computational complexity for backward elimination is: \(O(N^2)\) this is more computationally expensive  
for high \( N \) when selecting a small subset.  

### Feature Interactions:
**Backward Elimination** is better at identifying feature interactions because it starts with all features.  
**Forward Selection** may miss interactions since it only adds features incrementally.  

### Hybrid Approach (Stepwise Selection):
* Combines forward selection and backward elimination.
* Adds features like forward selection and removes irrelevant ones at each step like backward elimination.
* Balances computational efficiency and interaction detection.  

# Lab 6 : Feature Selection and Classification

### Gini Index
The **Gini index** measures the probability of a randomly chosen element being misclassified if it were randomly labeled according to the distribution.

**Formula**:
$$
Gini = 1 - \sum_{i=1}^k p_i^2
$$
Where:
* \(p_i\) is the proportion of instances belonging to class \(i\).
* \(k\) is the total number of classes.

For a weighted Gini index (e.g., for child nodes), the formula is:
$$
Gini_{weighted} = \frac{N_{C1}}{N_P} \cdot Gini_{C1} + \frac{N_{C2}}{N_P} \cdot Gini_{C2}
$$
Where:
* \(N_{C1}\), \(N_{C2}\), and \(N_P\) are the number of instances in child nodes \(C1\), \(C2\), and the parent node \(P\), respectively.


### Entropy
**Entropy** quantifies the uncertainty or impurity in a set of labels.

**Formula**:
$$
Entropy = - \sum_{i=1}^k p_i \log_2(p_i)
$$
Where:
* \(p_i\) is the proportion of instances belonging to class \(i\).


### Information Gain
The **Information Gain** is the reduction in entropy after a split and is used to decide the best split in decision trees.

**Formula**:
$$
Information\ Gain = Entropy_{parent} - \left( \frac{N_{C1}}{N_P} \cdot Entropy_{C1} + \frac{N_{C2}}{N_P} \cdot Entropy_{C2} \right)
$$


### Misclassification Error Rate
The **Misclassification Error Rate** measures the fraction of instances misclassified by the majority class.

**Formula**:
$$
Misclassification\ Error = 1 - \max(p_1, p_2, \dots, p_k)
$$

For weighted misclassification error:
$$
Misclassification_{weighted} = \frac{N_{C1}}{N_P} \cdot Misclassification_{C1} + \frac{N_{C2}}{N_P} \cdot Misclassification_{C2}
$$

### Application
**Parent Node**: Compute Gini index and misclassification error rate to evaluate impurity.  
**Child Nodes**: Compute weighted Gini index and misclassification error after the split.  
**Decision**: Evaluate whether the attribute test condition reduces impurity significantly, indicating a good split.  

### Some points :

* The Gini index and misclassification error measure impurity in different ways.  
* A lower weighted impurity value after the split indicates a better split.  
* Choosing the right impurity measure affects the decision-making process in constructing a decision tree.  


# Lab 7 : Classification 

## Leave-One-Out Cross-Validation (LOOCV)
LOOCV is a type of cross-validation where the model is trained on all but one data instance and tested on the single left-out instance.  
This process is repeated such that each data instance serves as the test set exactly once.  
**Advantages**:
  * Uses almost all data for training, leading to low bias.
  * Provides a nearly unbiased estimate of the generalization error.
**Disadvantages**:
  * Computationally expensive for large datasets as it requires training the model `n` times (where `n` is the number of instances).

## 2-Fold Stratified Cross-Validation
In 2-fold stratified cross-validation, the dataset is randomly split into two equal-sized folds, ensuring the class distribution is maintained (stratified).  
The model is trained on one fold and tested on the other, and this process is repeated by swapping the roles of the folds.  
The final accuracy is the average of the two test results.  
**Advantages**:
  * Efficient and less computationally expensive compared to LOOCV.
  * Preserves the class balance in both folds.
**Disadvantages**:
  * With only two folds, it might provide a less reliable estimate compared to methods with more folds.

## Which Method Provides a More Reliable Evaluation of the Classifier’s Generalization Error Rate?
**LOOCV** generally provides a more reliable evaluation of the generalization error because:
  * It uses almost all data for training in each iteration, reducing the bias in error estimation.
  * However, it can have higher variance due to reliance on small test sets (one instance at a time).  
**2-Fold Stratified Cross-Validation**, while less computationally intensive, may not provide as robust an estimate as LOOCV because it uses larger test sets and fewer iterations.  
For practical purposes, neither method is optimal for large datasets; methods like **k-fold cross-validation** with `k` > 2 often strike a better balance between bias, variance, and computational efficiency.   


## decision tree notebook: 
A decision tree is a white box lowchart-like tree structure where an internal node represents a feature(or attribute), the branch represents a decision rule, and each leaf node   represents the outcome.  
the **Gini** ratio is the decision rule that splits the data in the node level, it measeres the impurity of the data in a given node.  
a pure node is a node with all its data belonging to the same class, and it will be a leaf node since it wont be splitten.  
A decision tree can be dramatically huge which makes it confusing and hard to understand, and sometimes it causes overfitting, thats why we use **prunning**, we can pre-prune the  tree by predefining the maximum depth of the tree, or we can post-prune it by removing branches that do not provide significant improvement in classification accuracy after the   tree has been fully grown.  
Pruning helps reduce overfitting, improves generalization, and creates a simpler, more interpretable model.  

## Hyperparameter Tuning and Evaluation in Decision Trees notebook: 

### Hyperparameter Tuning in Machine Learning
Hyperparameter tuning refers to the process of finding the best set of hyperparameters to improve the performance of machine learning models. Hyperparameters are external configurations of a model that are set prior to training (e.g., learning rate, max depth of a tree).  
- Ensures the algorithm is tailored to the specific data mining task.
- Improves the accuracy and generalization of models for large datasets.



### Grid Search Methodology
Grid search is a systematic method for hyperparameter tuning, exploring all possible combinations of hyperparameter values within a predefined grid. It evaluates each combination to identify the optimal configuration.

#### Steps:
1. Define a set of hyperparameters and their possible values (e.g., learning rate = {0.01, 0.1}, max depth = {3, 5, 7}).
2. Train the model for every combination of these hyperparameters.
3. Evaluate performance using metrics (e.g., accuracy, precision, recall, or F1-score).
4. Select the combination that maximizes the desired metric.

#### Significance:
- Ensures optimal model performance for specific datasets.
- Useful for high-dimensional or imbalanced data typically encountered in data mining tasks.


### Significance in Model Optimization
Model optimization refers to improving a model's ability to extract meaningful patterns or predictions from data. Hyperparameter tuning and methods like grid search are critical for this process.  
**Accuracy**: Optimized models reduce errors and improve pattern detection.  
**Efficiency**: Well-tuned models are computationally efficient, essential for large-scale datasets.  
**Feature Selection**: Some algorithms (e.g., Random Forest, SVM) benefit from hyperparameter tuning to identify relevant features.  

Model optimization ensures the reliability of the data mining process and the quality of actionable insights.


# Lab 8 & 9 : Clustering

## K-means Clustering :
K-Means is a very popular clustering technique. The K-means clustering is another class of unsupervised learning algorithms used to find out the clusters of data in a given dataset.
In this lab, we will implement the K-Means clustering algorithm from scratch.  
The 5 Steps in K-means Clustering Algorithm:

Step 1. Randomly pick k data points as our initial Centroids.

Step 2. Find the distance (Euclidean distance for our purpose) between each data points in our training set with the k centroids.

Step 3. Now assign each data point to the closest centroid according to the distance found.

Step 4. Update centroid location by taking the average of the points in each cluster group.

Step 5. Repeat the Steps 2 to 4 till our centroids don’t change.  


## Hierarchical Clustering :
Hierarchical clustering is a method of cluster analysis that builds a hierarchy of clusters, it is often visualized using a dendrogram, a tree-like  
diagram that shows the merging or splitting of clusters at various levels of granularity  
**Key Characteristics**:  
* Does not require the number of clusters to be specified beforehand  
* Works well for both small datasets and exploratory data analysis  

#### Single link (Min)
**Definition**: A hierarchical clustering method that merges clusters based on the minimum distance between any two points in the clusters  
**Use**: Captures chaining effects, making it suitable for clusters of arbitrary shapes (عشوائية)  
**Steps**:  
* Calculate the distance between all pairs of points  
* Merge the two clusters with the smallest minimum distance  
* Repeat until only one cluster remains or a stopping condition is met  

#### Complete link (Max)
**Definition**: A hierarchical clustering method that merges clusters based on the maximum distance between any two points in the clusters   
**Use**: Results in compact and spherical clusters but may fail for elongated clusters  
**Steps**:  
* Calculate the maximum distance between points of all cluster pairs  
* Merge the clusters with the smallest maximum distance  
* Repeat until a single cluster is formed or a threshold is reached  

#### Group average
**Definition**: A hierarchical clustering method that merges clusters based on the average distance between all pairs of points in the clusters  
**Use**: Balances the chaining effect of single-link and the compactness of complete-link methods  
**Steps**:  
* Compute the average pairwise distances between all points in two clusters  
* Merge the clusters with the smallest average distance  
* Continue until a single cluster or desired number of clusters is formed  

#### Centroid-based
**Definition**: A clustering method where clusters are represented by their centroid (mean of all points in the cluster)  
**Use**: Works well for spherical and equally sized clusters  
**Steps**:  
* Choose initial centroids randomly  
* Assign each point to the nearest centroid  
* Recompute centroids as the mean of the assigned points  
* Repeat assignment and centroid update until convergence  

#### Ward's method
**Definition**: A hierarchical clustering method that minimizes the total within-cluster variance (or error sum of squares)  
**Use**: Produces compact and spherical clusters, ideal for minimizing variance  
**Steps**:  
* Compute the total within-cluster variance for all pairs of clusters  
* Merge the clusters that result in the smallest increase in total variance  
* Repeat until the desired number of clusters is achieved or a single cluster forms  



# Lab 10 & 11 : Association Rules

Association Rules are a data mining technique used to identify relationships or patterns between variables in large datasets.  
They are typically used to discover frequent itemsets and generate if-then rules.

### Evaluation Matrics 
The association rules are evaluated if they are frequent or not based on the following matrics :   

**<font color = "blue"> Support :</font>**
$$\text{support}(A\rightarrow C) = \text{support}(A \cup C), \;\;\; \text{range: } [0, 1]$$

* **Definition**: Support measures the proportion of transactions in the dataset that contain both 𝐴 and 𝐶. It indicates how frequently the rule  
𝐴→𝐶 appears in the dataset.
* **Importance**: High support indicates the rule applies to a significant portion of the dataset.
* **Range**: [0,1]

**<font color = "blue"> Confidence :</font>**
$$\text{confidence}(A\rightarrow C) = \frac{\text{support}(A\rightarrow C)}{\text{support}(A)}, \;\;\; \text{range: } [0, 1]$$

* **Definition**: Confidence measures the likelihood that 𝐶 occurs in a transaction, given that 𝐴 is present.
* **Importance**: High confidence indicates that 𝐶 is very likely to occur whenever 𝐴 is observed.
* **Range**: [0,1]

**<font color = "blue"> lift :</font>**
$$\text{lift}(A\rightarrow C) = \frac{\text{confidence}(A\rightarrow C)}{\text{support}(C)}, \;\;\; \text{range: } [0, \infty]$$

* **Definition**: Lift measures the strength of association between 𝐴 and 𝐶 compared to their individual occurrences. It indicates how much more likely 𝐶  
is to occur given 𝐴, compared to 𝐶's probability of occurrence in the dataset.
* **Range**: [0,+∞[

**<font color = "blue"> leverage :</font>**
$$\text{levarage}(A\rightarrow C) = \text{support}(A\rightarrow C) - \text{support}(A) \times \text{support}(C), \;\;\; \text{range: } [-1, 1]$$

* **Definition**: Leverage measures the difference between the observed co-occurrence of 𝐴 and 𝐶 and the expected co-occurrence if 𝐴 and 𝐶 were independent.
* **Importance**: Indicates the magnitude of dependence between 𝐴 and 𝐶.
* **Range**: [−1,1]

**<font color = "blue"> conviction :</font>**
$$\text{conviction}(A\rightarrow C) = \frac{1 - \text{support}(C)}{1 - \text{confidence}(A\rightarrow C)}, \;\;\; \text{range: } [0, \infty]$$

* **Definition**: Conviction measures how much the presence of 𝐴 affects the likelihood of 𝐶 not occurring.
* **Importance**:
  * Conviction > 1: Strong dependency between 𝐴 and 𝐶.
  * Conviction approaches infinity if 𝐴→𝐶 is a perfect rule.
* **Range**: [0,+∞[

**<font color = "blue"> zhangs_metric :</font>**
$$\text{zhangs metric}(A\rightarrow C) = \frac{\text{confidence}(A\rightarrow C) - \text{confidence}(A'\rightarrow C)}{Max[ \text{confidence}(A\rightarrow C) , \text{confidence}(A'\rightarrow C)]}, \;\;\; \text{range: } [-1, 1]$$

* **Definition**: Zhang's metric evaluates the difference in confidence between 𝐴→𝐶 and 𝐴′→𝐶 (where 𝐴′ is the complement of 𝐴), normalized by the maximum confidence of these two rules.
* **Importance**:
  - Values closer to 1 indicate strong positive association.
  - Values closer to -1 indicate strong negative association.
* **Range**: [−1,1]

### Algorithms 

#### Apriori

#### FP Growth

<hr>

# Copyright Note:
This work was prepared by Hachem Safi Din Sekhsoukh, based on the lab content, as a pre-exam recap of all the lab sessions.