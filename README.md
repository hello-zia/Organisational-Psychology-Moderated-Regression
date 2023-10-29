# Organisational-Psychology-Moderated-Regression

# --------Note
The sample is derived from actual data, although it has been modified, augmented and anonymized to ensure data protection and privacy.
The code for moderated regression requires PROCESS macro for R, which can be downloaded at https://haskayne.ucalgary.ca/CCRAM/resource-hub

# --------Dataset Overview

# Size: The dataset consists of 900 observations (rows) and 49 variables (columns).

# Variables:
Age: Age of the individuals.
Gender: Gender of the individuals.
Ethnicity: Ethnicity of the individuals.
EmploymentLevel: Employment level of the individuals.
WorkingHours: Number of working hours.
OrganisationalTenure: Tenure within the organization.
IndustryExperience: Industry experience of the individuals.
SelfEfficacy_1-6: Self-efficacy scores for six different aspects. (5 Points Likert scale)
Optimism_1-8: Optimism scores for eight different aspects. (5 Points Likert scale)
Hope_1-8: Hope scores for eight different aspects. (5 Points Likert scale)
Resilience_1-6: Resilience scores for six different aspects. (5 Points Likert scale)
OccupationalStress_1-4: Occupational stress scores for four different aspects. (5 Points Likert scale)
Burnout_1-10: Burnout scores for ten different aspects. (5 Points Likert scale)

# Reverse coded items
"Optimism_2", "Optimism_5", "Optimism_7", "Hope_6", "Hope_7", "Resilience_2", "Resilience_6", "OccupationalStress_1", "OccupationalStress_4"

# Data Distribution:

The dataset contains both numerical (e.g., Age, WorkingHours) and categorical variables (e.g., Gender, Ethnicity).
The dataset seems to include self-assessment scores for various psychological and work-related factors (Self Efficacy, Optimism, Hope, Resilience, Occupational Stress, Burnout).

# --------Correlation Matrix Output
             selfefficacy   optimism       hope resilience     stress    burnout
selfefficacy    1.0000000  0.5795095  0.2750758  0.5018137  0.4116290 -0.3810067
optimism        0.5795095  1.0000000  0.5234099  0.6454498  0.5626803 -0.5182054
hope            0.2750758  0.5234099  1.0000000  0.3075419  0.5044431 -0.5748524
resilience      0.5018137  0.6454498  0.3075419  1.0000000  0.5073103 -0.4679297
stress          0.4116290  0.5626803  0.5044431  0.5073103  1.0000000 -0.6139971
burnout        -0.3810067 -0.5182054 -0.5748524 -0.4679297 -0.6139971  1.0000000

# --------Moderated Regression with PROCESS
Note: Conditional Effects will only show when moderating effects are present.

# Model 1. Predictor(x): Stress, Outcome(y): Burnout, Moderator(w): Psycap (Self-efficacy + Optimism + Hope + Resilience)

Model Summary:
R-squared (Coefficient of Determination): 0.4836 (explains 48.36% of the variance in Burnout)
Mean Squared Error (MSE): 0.3028
p-value: > 0.001 (statistically significant)

Moderation Effect: YES 
The presence of an interaction term (Int_1) in the model suggests that Psycap moderates the relationship between Stress (X) and Burnout (Y). This means that the effect of Stress on Burnout varies depending on different levels of Psycap.

Conditional Effects:
It shows how the effect of Stress on Burnout changes at different values (low, moderate, and high) of Psycap:
When Psycap is -0.7422, the effect of Stress on Burnout is -0.4435.
When Psycap is -0.0000, the effect of Stress on Burnout is -0.3421.
When Psycap is 0.7422, the effect of Stress on Burnout is -0.2407.

# Model 2. Predictor(x): Stress, Outcome(y): Burnout, Moderator(w): Self-efficacy

Model Summary:
R-squared (Coefficient of Determination): 0.3996 (explains 39.96% of the variance in Burnout)
The Mean Squared Error (MSE): 0.3520
p-value: > 0.001 (statistically significant)

Moderation Effect: YES

Conditional Effects
When Self-efficacy is -1.2649, the effect of Stress on Burnout is -0.5848.
When Self-efficacy is 0.0000, the effect of Stress on Burnout is -0.5191.
When Self-efficacy is 1.2649, the effect of Stress on Burnout is -0.4535.

# Model 3. Predictor(x): Stress, Outcome(y): Burnout, Moderator(w): Optimism

Model Summary:
R-squared (Coefficient of Determination): 0.4387 (explains 43.87% of the variance in Burnout)
The Mean Squared Error (MSE): 0.3291
p-value: > 0.001 (statistically significant)

Moderation Effect: YES

Conditional Effects:
When Optimism is -0.9111, the effect of stress is -0.5536 (p < 0.0000).
When Optimism is 0.0000, the effect of stress is -0.4415 (p < 0.0000).
When Optimism is 0.9111, the effect of stress is -0.3295 (p < 0.0000).

# Model 4. Predictor(x): Stress, Outcome(y): Burnout, Moderator(w): Hope

Model Summary:
R-squared (Coefficient of Determination): 0.4960 (explains 49.60% of the variance in Burnout)
Mean Squared Error (MSE): 0.2955
p-value: > 0.001 (statistically significant)

Moderation Effect: YES

Conditional Effects:
When Hope is -0.9310, the effect of stress is -0.5190.
When Hope is 0.0000, the effect of stress is -0.3848.
When Hope is 0.9310, the effect of stress is -0.2506.

# Model 5. Predictor(x): Stress, Outcome(y): Burnout, Moderator(w): Resilience

Model Summary:
R-squared (Coefficient of Determination): 0.4240 (explains 42.40% of the variance in Burnout)
Mean Squared Error (MSE): 0.3377
p-value: > 0.001 (statistically significant)

Moderation Effect: YES

Conditional Effects:
When Resilience is -0.7287, the effect of stress is -0.5786.
When Resilience is 0.0000, the effect of stress is -0.4758.
When Resilience is 0.7287, the effect of stress is -0.3731.

# Conclusion
Taken together, all four psycap analyses (Self-efficacy, Optimism, Hope, and Resilience) indicate that individual differences in psychological traits play a significant role in moderating the relationship between Occupational Stress and Burnout. The analysis reveals that these traits can act as moderators, effectively shielding employees from Burnout, both when considered collectively (as in model 1) and when examined individually (as evident in models 2, 3, 4, and 5). 

Notably, among the individual traits analyzed, Hope emerged with the highest R-squared value (0.4960), signifying the extent to which it explains the variance in burnout outcomes. In essence, a higher R-squared value indicates that Hope has a stronger influence in moderating the relationship between stress and burnout compared to the other traits, emphasizing its pivotal role in this context. These findings underscore the importance of considering individual variability in psychological factors when assessing, predicting, and addressing Burnout in different individuals. Interventions for Burnout should be personalized to account for these varying levels of psychological traits to be more effective.

Additionally, these analyses highlight the importance of mental health support and stress management strategies. Organisations and healthcare providers should be aware of the moderating effects of these traits to provide more effective assistance in preventing and mitigating burnout among their populations.

It's essential to recognize that the relationship between Occupational Stress and Burnout is not uniform across all individuals, and these moderating traits are key factors in understanding and addressing this complex issue.
