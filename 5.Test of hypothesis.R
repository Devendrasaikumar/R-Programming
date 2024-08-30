# Test of Hypothesis

# Z- Test 

#-------------------------------------------------------------------------#

# One Sample Z-test

# Set the null and alternative hypotheses
null_hypothesis = 175
alternative_hypothesis = "not equal to"

# Set the sample mean, standard deviation, and sample size
sample_mean = 172
sample_sd = 5
sample_size = 50

# Calculate the Z-statistic
z_statistic = (sample_mean - null_hypothesis) / (sample_sd / sqrt(sample_size))

# Calculate the p-value
p_value = pnorm(z_statistic)

# Print the results
cat("Z-statistic:", z_statistic, "\np-value:", p_value)

# Make a decision based on the p-value
if (p_value < 0.05) {
  cat("Reject the null hypothesis. The average height is likely not 175 cm.")
} else {
  cat("Fail to reject the null hypothesis. The average height is likely 175 cm.")
}


#---------------------------------------------------------------------------#

# Two sample Z-Test

# Set the null and alternative hypotheses
null_hypothesis = 0  # H0: μ1 - μ2 = 0 (no difference in means)
alternative_hypothesis = "not equal to"

# Set the sample means, standard deviations, and sample sizes
sample1_mean = 172
sample1_sd = 5
sample1_size = 50

sample2_mean = 168
sample2_sd = 4
sample2_size = 60

# Calculate the pooled standard deviation
pooled_sd = sqrt(((sample1_size - 1) * sample1_sd^2 + (sample2_size - 1) * sample2_sd^2) / (sample1_size + sample2_size - 2))

# Calculate the Z-statistic
z_statistic = (sample1_mean - sample2_mean) / (pooled_sd * sqrt(1/sample1_size + 1/sample2_size))

# Calculate the p-value
p_value = pnorm(z_statistic)

# Print the results
cat("Z-statistic:", z_statistic, "\np-value:", p_value)

# Make a decision based on the p-value
if (p_value < 0.05) {
  cat("Reject the null hypothesis. The average heights are likely different.")
} else {
  cat("Fail to reject the null hypothesis. The average heights are likely the same.")
}


#---------------------------------------------------------------------------#

# Proportion Test

#---------------------------------------------------------------------------#

# One proportion test

# Set the null and alternative hypotheses
null_hypothesis = 0.3  # H0: p = 0.3
alternative = "two.sided"

# Set the sample proportion and sample size
sample_proportion = 35/100
sample_size = 100

# Perform the One Proportion Test
test_result = prop.test(x = 35, n = 100, p = 0.3, alternative = alternative)

# Print the results
print(test_result)


#---------------------------------------------------------------------------#

# Two proportion test

# Set the null and alternative hypotheses
null_hypothesis = "equal"  # H0: p1 = p2
alternative_hypothesis = "not equal to"

# Set the sample proportions and sample sizes
sample1_proportion = 35/100
sample1_size = 100

sample2_proportion = 20/80
sample2_size = 80

# Perform the Two Proportion Test
test_result = prop.test(x = c(35, 20), n = c(100, 80), alternative = alternative )

# Print the results
print(test_result)

#--------------------------------------------------------------------------#

# Chi-Square

# Chi-Square test of Independence.

# Create a contingency table
table = matrix(c(50, 30, 40, 80), nrow = 2, dimnames = list(c("Male", "Female"), c("Democrat", "Republican")))

# Perform the Chi-Square test
chi_square_test = chisq.test(table)

# Print the results
print(chi_square_test)


#-------------------------------------------------------------------------#

# Chi-Square test of Goodness fit.

# Create a vector of observed frequencies
observed = c(10, 20, 30, 40)

# Create a vector of expected frequencies under the null hypothesis (normal distribution)
expected = c(12.5, 25, 37.5, 50)

# Normalize the expected frequencies
expected = expected / sum(expected)

# Perform the Chi-Square Goodness of Fit test
goodness_of_fit_test = chisq.test(observed, p = expected)

# Print the results
print(goodness_of_fit_test)


#--------------------------------------------------------------------------#


# Anova Test

# One way anova

# Create a data frame
df = data.frame(Group = c("A", "A", "A", "B", "B", "B", "C", "C", "C"), Value = c(10, 12, 15, 8, 10, 12, 12, 15, 18))

# Perform one-way ANOVA
anova_result = aov(Value ~ Group, data = df)

# Print the summary of the ANOVA result
summary(anova_result)

#-------------------------------------------------------------------------#

# Two way Anova

# Create a data frame
df = data.frame(Group = c("A", "A", "A", "A", "B", "B", "B", "B", "C", "C", "C", "C"), 
                 Treatment = c("T1", "T1", "T2", "T2", "T1", "T1", "T2", "T2", "T1", "T1", "T2", "T2"), 
                 Value = c(10, 12, 15, 18, 8, 10, 12, 15, 12, 15, 18, 20))

# Perform two-way ANOVA
anova_result = aov(Value ~ Group * Treatment, data = df)

# Print the summary of the ANOVA result
summary(anova_result)


#-------------------------------------------------------------------------#



# END