# Step 1: Install Required R Packages
install.packages("arules")
install.packages("arulesViz")

# Step 2: Create the Transactions
library(arules)

# Define transactions
transactions <- list(
  c("K", "A", "D", "B"),
  c("D", "A", "C", "E", "B"),
  c("C", "A", "B", "E"),
  c("B", "A", "D")
)


trans <- as(transactions, "transactions")

# Summary output
summary(trans)
inspect(trans)

# Step 3: Plot Item Frequency
library(arulesViz)

itemFrequencyPlot(trans, topN = 10, type = "absolute", main = "Item Frequency")

# Step 4: Run Apriori Algorithm
rules <- apriori(trans, parameter = list(supp = 0.6, conf = 0.8))
inspect(rules)

# Step 5: What do customers likely buy before buying "A"

rules_before_A <- subset(rules, subset = rhs %in% "A")
rules_before_A <- sort(rules_before_A, by = "lift", decreasing = TRUE)
inspect(rules_before_A)

# Step 6: What do customers likely buy if they purchase "A"
rules_after_A <- subset(rules, subset = lhs %in% "A")
rules_after_A <- sort(rules_after_A, by = "lift", decreasing = TRUE)
inspect(rules_after_A)

