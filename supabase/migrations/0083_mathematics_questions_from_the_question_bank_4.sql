-- ============================================================================
--  0083 — College Board's Mathematics questions
--
--  400 questions from College Board's SAT Suite Question Bank, into the
--  Mathematics practice pool. Part 4 of 5.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

select seed_pool_question($qb$CB-c3d65f93$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Five Eretmochelys imbricata, a type of sea turtle, each have a nest. The table shows an original data set of the number of eggs that each turtle
laid in its nest.
Nest Number of eggs
A 149
B 144
????? ||||| |||||
C 148
D 136
E 139
A sixth nest with 121 eggs is added to create a new data set. Which of the following correctly compares the means of the two data sets?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c3d65f93.png$qb$, $qb$[{"label": "A", "body": "The mean of the original data set is greater than the mean of the new data set."}, {"label": "B", "body": "The mean of the original data set is less than the mean of the new data set."}, {"label": "C", "body": "The means of both data sets are equal."}, {"label": "D", "body": "There is not enough information to compare the means."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the table shows an original data set of 5 values. It's also given that a sixth value is added to create a new data
set. The new data set consists of the 5 values in the original data set and one additional value, 121 . Since the additional value, 121, is less than
any value in the original data set, the mean of the original data set is greater than the mean of the new data set.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b4f5a7ca$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A survey was conducted using a sample of history professors selected at random from the California State Universities. The professors surveyed
were asked to name the publishers of their current texts. What is the largest population to which the results of the survey can be generalized?$qb$, null, $qb$[{"label": "A", "body": "All professors in the United States"}, {"label": "B", "body": "All history professors in the United States"}, {"label": "C", "body": "All history professors at all California State Universities"}, {"label": "D", "body": "All professors at all California State Universities"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Selecting a sample at random when conducting a survey allows the results to be generalized to the population from which
the sample was selected, but not beyond this population. In this situation, the population that the sample was selected from is history professors
from the California State Universities. Therefore, the largest population to which the results of the survey can be generalized is all history
professors at all California State Universities.
Choices A, B, and D are incorrect. Since the sample was selected at random from history professors from the California State Universities, the
results of the survey can’t be generalized to all professors in the United States, all history professors in the United States, or all professors at all
California State Universities. All three of these populations may use different texts and therefore may name different publishers.$qb$);
select seed_pool_question($qb$CB-d73a67d7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following lists represents a data set with the smallest standard deviation?$qb$, null, $qb$[{"label": "A", "body": "51, 5254, , 56, 57"}, {"label": "B", "body": "52, 5254, , 56, 56"}, {"label": "C", "body": "52, 5354, , 55, 56"}, {"label": "D", "body": "53, 5454, , 54, 55"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Standard deviation is a measure of the spread of the values in a data set from the mean of the data set, and the smaller the
spread, the smaller the standard deviation. Each of the four choices represents a data set that is symmetric with respect to the value 54.
Therefore, 54 is the mean of each of these data sets. All the values in the data set in choice D differ from 54 by either 0 or 1. In each of the other
three data sets, the values in the data set, other than the value of 54, differ from 54 by at least 1. Therefore, the data set in choice D has the
smallest spread and thus the smallest standard deviation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-93724cc6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$21 is 21% of what number?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "42"}, {"label": "D", "body": "100"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Let x represent the number that 21 is 21% of. It follows that 21/x = 21/10o . Multiplying each side of this equation by x yields
. Multiplying each side of this equation by 100 yields 2,100 = 21x. Dividing each side of this equation by 21 yields 100 = x.
21 = 21x/1o0 21
Therefore,  is 21% of 100.
Choice A is incorrect. 21% of 0 is 0, not 21.
Choice B is incorrect. 21% of 1 is 0·21, not 21.
Choice C is incorrect. 21% of 42 is 8·82, not 21.$qb$);
select seed_pool_question($qb$CB-d6af3572$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The scatterplot above shows the federal-mandated minimum wage every 10 years between 1940 and 2010. A line of best fit is shown, and its
equation is . What does the line of best fit predict about the increase in the minimum wage over the 70-year period?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d6af3572.png$qb$, $qb$[{"label": "A", "body": "Each year between 1940 and 2010, the average increase in minimum wage was 0.096 dollars."}, {"label": "B", "body": "Each year between 1940 and 2010, the average increase in minimum wage was 0.49 dollars."}, {"label": "C", "body": "Every 10 years between 1940 and 2010, the average increase in minimum wage was 0.096 dollars."}, {"label": "D", "body": "Every 10 years between 1940 and 2010, the average increase in minimum wage was 0.488 dollars."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given equation is in slope-intercept form, or , where m is the value of the slope of the line of best fit.
Therefore, the slope of the line of best fit is 0.096. From the definition of slope, it follows that an increase of 1 in the x-value corresponds to an
increase of 0.096 in the y-value. Therefore, the line of best fit predicts that for each year between 1940 and 2010, the minimum wage will
increase by 0.096 dollar per hour.
Choice B is incorrect and may result from using the y-coordinate of the y-intercept as the average increase, instead of the slope. Choice C is
incorrect and may result from using the 10-year increments given on the x-axis to incorrectly interpret the slope of the line of best fit. Choice D is
incorrect and may result from using the y-coordinate of the y-intercept as the average increase, instead of the slope, and from using the 10-year
increments given on the x-axis to incorrectly interpret the slope of the line of best fit.$qb$);
select seed_pool_question($qb$CB-2d16d62c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A special camera is used for underwater ocean research. When the camera is at a depth of 58 fathoms, what is the camera's depth in feet?-
(1fath0m = 6feet)$qb$, null, null, null, array[$qb$348$qb$]::text[], $qb$The correct answer is 348. It's given that 1 fathom is equivalent to 6 feet. Therefore, 58 fathoms is equivalent to (58 fathomS) ( 6fcet/1fathom ) , or
348 feet. Thus, when the camera is at a depth of 58 fathoms, the camera's depth, in feet, is 348.$qb$);
select seed_pool_question($qb$CB-89ff6a0a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For 100 buttons, the table summarizes the distribution by group and diameter.
Diameter (millimeters)
Less than Greater
20 to 30
Group 20 than 30
|| ||||-/|-/(||)|| -/(||)|
Group 1 12 8 3
Group 2 0 17 18
Group 3 10 32 0
One of these buttons will be selected at random. What is the probability of selecting a button with a diameter that is less than or equal to 30
millimeters, given that it is not in group 2? (Express your answer as a decimal or fraction, not as a percent.)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-89ff6a0a.png$qb$, null, null, array[$qb$.9538$qb$, $qb$62/65$qb$]::text[], $qb$The correct answer is 62/65 . It’s given that one button will be selected at random out of a total of 100 buttons and that the table shows the
distribution of buttons by group and diameter. The probability of selecting a button with a diameter less than or equal to 30 millimeters, given
that it is not in group 2, is the number of buttons with a diameter less than or equal to 30 millimeters that are not in group 2 divided by the total
number of buttons not in group 2. Based on the table, the buttons not in group 2 are those in group 1 and group 3. In group 1, there are 12
buttons with a diameter less than 20 millimeters and 8 buttons with a diameter from 20 to 30 millimeters, which yields 12 + 8, or 20, buttons
with a diameter less than or equal to 30 millimeters. In group 3, there are 10 buttons with a diameter less than 20 millimeters and 32 buttons
with a diameter from 20 to 30 millimeters, which yields 10 + 32, or 42, buttons with a diameter less than or equal to 30 millimeters. Therefore,
the total number of buttons with a diameter less than or equal to 30 millimeters that are not in group 2 is 20 + 42, or 62. The total number of
buttons that are not in group 2 is the sum of all buttons in group 1 and group 3. There are 12 + 8 + 3, or 23, buttons in group 1 and 10 + 32
+ 0, or 42, buttons in group 3. Therefore, the total number of buttons in groups 1 and 3 is 23 + 42, or 65. It follows that the probability of
selecting a button with a diameter less than or equal to 30 millimeters, given that it is not in group 2, is 62/65 . Note that 62/65 or .9538 are
examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-69f6717f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A sample of oak has a density of 807 kilograms per cubic meter. The sample is in the shape of a cube, where each edge has a length of
0·90 meters. To the nearest whole number, what is the mass, in kilograms, of this sample?$qb$, null, $qb$[{"label": "A", "body": "588"}, {"label": "B", "body": "726"}, {"label": "C", "body": "897"}, {"label": "D", "body": "1,107"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the sample is in the shape of a cube with edge lengths of 0·9 meters. Therefore, the volume of the sample is
0·90^(3), or 0·729, cubic meters. It’s also given that the sample has a density of 807 kilograms per 1 cubic meter. Therefore, the mass of this
sample is 0· 729 cubic meterS ( 807ki19gram8/(1 cubic mcter) ) , or 588·303 kilograms. Rounding this mass to the nearest whole number gives 588 kilograms.
Therefore, to the nearest whole number, the mass, in kilograms, of this sample is 588.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-35bec412$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$73, 74, 7577, , 7982, , 84, 8591,
What is the median of the data shown?$qb$, null, null, null, array[$qb$79$qb$]::text[], $qb$The correct answer is 79. The median of a data set with an odd number of values is the middle value of the set when the values are ordered from
least to greatest. Because the given data set consists of nine values that are ordered from least to greatest, the median is the fifth value in the
data set. Therefore, the median of the data shown is 79.$qb$);
select seed_pool_question($qb$CB-74dee52b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The line graph shows the number of graduates from the classes of 2001 through 2007 at a certain school who enrolled in college within 24
months of graduation. Of the following, which class had the fewest graduates who enrolled in college within 24 months of graduation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-74dee52b.png$qb$, $qb$[{"label": "A", "body": "2002"}, {"label": "B", "body": "2004"}, {"label": "C", "body": "2005"}, {"label": "D", "body": "2007"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The year with the fewest graduates who enrolled in college within 24 months of graduation is the point with the lowest value
on the vertical axis. This occurs at 2002.
Choice B, C, and D are incorrect. The years 2004, 2005, and 2007 each had a greater number of graduates who enrolled in college within 24
months of graduation than did the year 2002.$qb$);
select seed_pool_question($qb$CB-c3d78831$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$At a particular track meet, the ratio of coaches to athletes is 1 to 26. If there are x coaches at the track meet, which of the following expressions
represents the number of athletes at the track meet?$qb$, null, $qb$[{"label": "A", "body": "x/26"}, {"label": "B", "body": "26x"}, {"label": "C", "body": "x + 26"}, {"label": "D", "body": "26/x"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that at a particular track meet, the ratio of coaches to athletes is 1 to 26. If one number in a ratio is multiplied by a
value, the other number must be multiplied by the same value in order to maintain the same ratio. If there are x coaches at the track meet,
multiplying both numbers in the ratio by x yields 1(x) to 26(x) , or x to 26x. Therefore, the expression 26x represents the number of athletes at
the track meet.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8bb94668$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The speeds of objects A, B, and C are a meters per second, b meters per second, and c meters per second, respectively. If the speed of object A
is 5,900% of the speed of object C and the speed of object C is 0·008% of the speed of object B, which expression represents the value of
a + b in terms of c?$qb$, null, $qb$[{"label": "A", "body": "1,840c"}, {"label": "B", "body": "5,908c"}, {"label": "C", "body": "6,025c"}, {"label": "D", "body": "12,559c"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the speeds of objects A, B, and C are a meters per second, b meters per second, and c meters per second,
respectively. If the speed of object A is 5,900% of the speed of object C, this means that a = (5,900)/100 c, or a = 59c. If the speed of object C is
0·008% of the speed of object B, this means that c = (0·o08)/10o b, or c = 0·00008b. Dividing both sides of this equation by 0·00008 yields 1/(o·0o0o8) c
= b, or 12,500c = b. Since a = 59c and b = 12,500c, it follows that a + b = 59c + 12,500c, or a + b = 12,559c. Therefore, the expression
12,559c represents the value of a + b in terms of c.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b5bc47d5$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In a scale model of an office building, a length of 1 inch is equivalent to a length of 17/3 feet in the actual office building. If a length in the actual
office building measures x feet, which expression represents the corresponding length, in inches, in the model in terms of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b5bc47d5.png$qb$, $qb$[{"label": "A", "body": "3x/((17)(12))"}, {"label": "B", "body": "17x/((12)(3))"}, {"label": "C", "body": "3x/17"}, {"label": "D", "body": "17x/3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that in a scale model, a length of 1 inch is equivalent to a length of 17/3 feet in the actual office building. This means
that the ratio of a length, in feet, in the actual office building to the corresponding length, in inches, in the model is  to 1. Therefore, the length,
17/317/3
in inches, in the model corresponding to a length in the actual office building of x feet can be found by dividing x by . Dividing by 17/3 is
equivalent to multiplying by 3/17 , so the corresponding length, in inches, in the model in terms of x can be represented by the expression 3x/17 .
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect. This expression represents the corresponding length, in inches, in the model in terms of x for a model where 1 inch in the
model is equivalent to a length of 3/17 , not 17/3 , feet in the actual building.$qb$);
select seed_pool_question($qb$CB-aeeaec96$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How many yards are equivalent to - 612 inches? (1yard = 36incheS)$qb$, null, $qb$[{"label": "A", "body": "0·059"}, {"label": "B", "body": "17"}, {"label": "C", "body": "576"}, {"label": "D", "body": "22,032"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that 1yard = 36incheS. Therefore, 612 inches is equivalent to 612 incheS ( 1yard/36inchc8 ) , which can be rewritten
as 612yard8/36 , or 17 yards.
Choice A is incorrect. This is the number of yards that are equivalent to 2·124 inches.
Choice C is incorrect. This is the number of yards that are equivalent to 20,736 inches.
Choice D is incorrect. This is the number of yards that are equivalent to 793,152 inches.$qb$);
select seed_pool_question($qb$CB-6c9444cd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?IaSS ? |-?| |
?IaSS ? -| ?| |
-| | | | | | | | | | | | |
0 2 4 6 8 10 I2
Number0? b0o?S
The two box plots show the distribution of number of books read over the summer by the students in two different English classes. What is the
positive difference between the ranges of number of books read over the summer for the two classes?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6c9444cd.png$qb$, null, null, array[$qb$4$qb$]::text[], $qb$The correct answer is 4. It's given that the two boxplots show the distribution of number of books read over the summer by the students in two
different English classes. In a boxplot, the first vertical line represents the minimum value of the data set and the last vertical line represents the
maximum value of the data set. The range of a data set is the difference between its maximum value and its minimum value. In class A, the
maximum number of books read is 5 and the minimum number of books read is 0. The difference between those values is 5 - 0, or 5. Therefore,
the range of the number of books read in class A is 5. In class B, the maximum number of books read is 10 and the minimum number of books
read is 1. The difference between those values is 10 - 1, or 9. Therefore, the range of the number of books read in class B is 9. To find the
positive difference between the ranges of the number of books read for the two classes, the smaller range must be subtracted from the larger
range. Therefore, the positive difference between the ranges of number of books read over the summer for the two classes is 9 - 5, or 4.$qb$);
select seed_pool_question($qb$CB-9d88a3e3$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Theresa ran on a treadmill for thirty minutes, and her time and speed are shown on the graph above. According to the graph, which of the
following statements is NOT true concerning Theresa’s run?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9d88a3e3.png$qb$, $qb$[{"label": "A", "body": "Theresa ran at a constant speed for five minutes."}, {"label": "B", "body": "Theresa’s speed was increasing for a longer period of time than it was decreasing."}, {"label": "C", "body": "Theresa’s speed decreased at a constant rate during the last five minutes."}, {"label": "D", "body": "Theresa’s speed reached its maximum during the last ten minutes."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Theresa’s speed was increasing from 0 to 5 minutes and from 20 to 25 minutes, which is a total of 10 minutes. Theresa’s
speed was decreasing from 10 minutes to 20 minutes and from 25 to 30 minutes, which is a total of 15 minutes. Therefore, Theresa’s speed was
NOT increasing for a longer period of time than it was decreasing.
Choice A is incorrect. Theresa ran at a constant speed for the 5-minute period from 5 to 10 minutes. Choice C is incorrect. Theresa’s speed
decreased at a constant rate during the last 5 minutes, which can be seen since the graph is linear during that time. Choice D is incorrect.
Theresa’s speed reached its maximum at 25 minutes, which is within the last 10 minutes.$qb$);
select seed_pool_question($qb$CB-e03f3477$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A sample consisting of 720 adults who own televisions was selected at random for a study. Based on the sample, it is estimated that 32% of all
adults who own televisions use their televisions to watch nature shows, with an associated margin of error of 3·41%. Which of the following is
the most plausible conclusion about all adults who own televisions?$qb$, null, $qb$[{"label": "A", "body": "More than 35·41% of all adults who own televisions use their televisions to watch nature shows."}, {"label": "B", "body": "Between 28·59% and 35·41% of all adults who own televisions use their televisions to watch nature shows."}, {"label": "C", "body": "Since the sample included adults who own televisions and not just those who use their televisions to watch nature shows, no conclusion can be made."}, {"label": "D", "body": "Since the sample did not include all the people who watch nature shows, no conclusion can be made."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that based on a sample selected at random, it's estimated that 32% of all adults who own televisions use their
televisions to watch nature shows, with an associated margin of error of 3·41%. Subtracting the margin of error from the estimate and adding
the margin of error to the estimate gives an interval of plausible values for the true percentage of adults who own televisions who use their
televisions to watch nature shows. This means it's plausible that between 32% - 3·41%, or 28·59%, and 32% + 3·41%, or 35·41%, of all
adults who own televisions use their televisions to watch nature shows. Therefore, of the given choices, the most plausible conclusion is that
between 28·59% and 35·41% of all adults who own televisions use their televisions to watch nature shows.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect. To make a plausible conclusion about all adults who own televisions, the sample must be selected at random from all
adults who own televisions, not just those who use their televisions to watch nature shows.
Choice D is incorrect. Since the sample was selected at random from all adults who own televisions, a plausible conclusion can be made about
all adults who own televisions.$qb$);
select seed_pool_question($qb$CB-dbd89c59$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between the number of swans, y, in a certain population and the number of years since 1970x, , where 0
≤ x ≤ 50.
y
300
270
240
210
180
150|| | | | | | ?
120
90
60
30
x
O 10 20 30 40 50
Which of the following equations is the most appropriate exponential model for the data shown in the scatterplot?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dbd89c59.png$qb$, $qb$[{"label": "A", "body": "y = 43(1·04)-^(x)"}, {"label": "B", "body": "y = 43(1·04)^(x)"}, {"label": "C", "body": "y = 288(1·04)-^(x)"}, {"label": "D", "body": "y = 288(1·04)^(x)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the scatterplot shows the relationship between the number of swans, y, and the number of years since 1970,
x, where 0 ≤ x ≤ 50. According to the scatterplot, the number of swans increases as the number of years since 1970 increases, and the data
shows an exponential growth pattern rather than a linear pattern. When a > 0 and b > 1 , an exponential model of the form y = a(b)^(x)
represents exponential growth and a model of the form represents exponential decay. The models in all four choices show a > 0
yy==aa(b()bx)-^(x)
and b > 1 . Choices B and D show models of the form  and thus represent exponential growth. The initial value a should approximate
the y-value when x = 0, which is a little more than 40, so a = 43 is reasonable and consistent with the graph. Therefore, the equation y
= 43(1·04)^(x) is the most appropriate exponential model for the data.
Choice A is incorrect. The model y = 43(1·04)-^(x) represents exponential decay, rather than exponential growth, which doesn't match the pattern
in the scatterplot.
Choice C is incorrect. The model y = 288(1·04)-^(x) represents exponential decay rather than exponential growth, which doesn't match the
pattern in the scatterplot.
Choice D is incorrect. The model y = 288(1·04)^(x) has an initial value of 288 when x = 0, so the initial value doesn't match the scatterplot.$qb$);
select seed_pool_question($qb$CB-d693f563$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Last year, Cedric had 35 plants in his garden. This year, the number of plants in Cedric’s garden is 60% greater than the number of plants in his
garden last year. How many plants does Cedric have in his garden this year?$qb$, null, null, null, array[$qb$56$qb$]::text[], $qb$The correct answer is 56. It’s given that Cedric had 35 plants in his garden last year and that the number of plants in Cedric's garden this year is
60% greater than the number of plants in his garden last year. It follows that the number of plants in Cedric’s garden this year is 35 plus 60% of
35, which is equal to 35 + 35(6o/100) , or 35 + 35(0·6) . This expression is equivalent to 35 + 21, or 56. Therefore, Cedric has 56 plants in his
garden this year.$qb$);
select seed_pool_question($qb$CB-f46139df$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit for the data is also shown.
110046228 -/(-? ?)|| || ?|| || ?|| || ?|| ?|| ?|| ?|| ?|| ?|| ?|| || || ?x
At x = 25·5, which of the following is closest to the y-value predicted by the line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f46139df.png$qb$, $qb$[{"label": "A", "body": "6·2"}, {"label": "B", "body": "7·3"}, {"label": "C", "body": "8·2"}, {"label": "D", "body": "9·1"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. On the line of best fit, an x-value of 25·5 corresponds to a y-value between 8 and 8·5. Therefore, at x = 25·5, 8·2 is closest
to the y-value predicted by the line of best fit.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-e5b5fbdd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Of the 8 planets in our solar system, 4 are considered rocky. If a student randomly selects 1 of those 8 planets as a topic for a report, what is the
probability that the selected planet will be rocky?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e5b5fbdd.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": "2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If one of these planets is selected at random, the probability that the selected planet will be rocky is calculated by dividing
the number of planets that are considered rocky by the total number of planets. It’s given that 4 of the 8 total planets are considered rocky.
Therefore, the probability that the selected planet will be rocky is , which is equivalent to .
Choices A and B are incorrect. These represent the probability if 1 of the 8 planets was considered rocky (choice A) and if 2 of the 8 planets were
considered rocky (choice B). Choice D is incorrect and may result from dividing the total number of planets by the number of planets that are
considered rocky.$qb$);
select seed_pool_question($qb$CB-d65b9a87$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The dot plots represent the distributions of values in data sets A and B.
?ata ?et ? ?ata ?et ?
? ? ? ?
? ? ? ? ?
? ? ? ? ? ? ? ? ? ? ?
? ? ? ? ? ? ? ? ? ? ? ? ? ?
-| | | | | | | -| | | | | | |
10 11 12 13 I4 I5 I6 10 11 12 13 14 15 16
VaIue VaIue
Which of the following statements must be true?
I. The median of data set A is equal to the median of data set B.
II. The standard deviation of data set A is equal to the standard deviation of data set B.$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d65b9a87.png$qb$, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The median of a data set with an odd number of values that are in ascending or descending order is the middle value of the
data set. Since the distribution of the values of both data set A and data set B form symmetric dot plots, and each data set has an odd number of
values, it follows that the median is given by the middle value in each of the dot plots. Thus, the median of data set A is 13, and the median of
data set B is 13. Therefore, statement I is true. Data set A and data set B have the same frequency for each of the values 11, 12, 14, and 15. Data
set A has a frequency of 1 for values 10 and 16, whereas data set B has a frequency of 2 for values 10 and 16. Standard deviation is a measure
of the spread of a data set; it is larger when there are more values further from the mean, and smaller when there are more values closer to the
mean. Since both distributions are symmetric with an odd number of values, the mean of each data set is equal to its median. Thus, each data
set has a mean of 13. Since more of the values in data set A are closer to 13 than data set B, it follows that data set A has a smaller standard
deviation than data set B. Thus, statement II is false. Therefore, only statement I must be true.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1fc4f47b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$At a movie theater, there are a total of 350 customers. Each customer is located in either theater A, theater B, or theater C. If one of these
customers is selected at random, the probability of selecting a customer who is located in theater A is 0·48, and the probability of selecting a
customer who is located in theater B is 0·24. How many customers are located in theater C?$qb$, null, $qb$[{"label": "A", "body": "28"}, {"label": "B", "body": "40"}, {"label": "C", "body": "84"}, {"label": "D", "body": "98"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that at a movie theater, there are a total of 350 customers and that each customer is located in either theater A,
theater B, or theater C. If the probability of selecting a customer in theater A is 0·48, then (0·48)(350) , or 168, customers are located in theater
A. If the probability of selecting a customer in theater B is 0·24, then (0·24)(350) , or 84, customers are located in theater B. It follows that there
are 168 + 84, or 252, customers in theater A and theater B. Therefore, there are 350 - 252, or 98, customers in theater C.
Choice A is incorrect. This is the percent, not the number, of the customers that are located in theater C.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the number of customers that are located in theater B, not theater C.$qb$);
select seed_pool_question($qb$CB-e7133228$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The speed of a vehicle is increasing at a rate of 7·3 meters per second squared. What is this rate, in miles per minute squared, rounded to the
nearest tenth? (?Se 1 miIe = 1 ,609 meterS· )$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e7133228.png$qb$, $qb$[{"label": "A", "body": "0·3"}, {"label": "B", "body": "16·3"}, {"label": "C", "body": "195·8"}, {"label": "D", "body": "220·4"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the speed of a vehicle is increasing at a rate of 7·3 meters per second squared. It's given to use 1miIe
= 1 ,609 meterS. There are 60 seconds in 1 minute; therefore, 60^(2) or  seconds squared is equal to 1 minute squared. It follows that the
rate of 7·3 meters per second squared is equivalent to in mi1e(S(7·3 metcrS 3)/1P8eccronmdiSnquuatrecdS),q6(u(00 1miIc)/(1a,r60e9dmctcr8) ) ( (3,6o0 8ec9ud8 8quared)/(1 minutc Squarcd) ) , or approximately
16·33 miIe8 Per minute Squared. The rate, , rounded to the nearest tenth is 16·3.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2905ded0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Live east of the Live west of the
river river Total
Less than 40
17 11 28
??? ||| ||| ??? |||years old
At least 40 years
18 89 107
old
Total 35 100 135
The table summarizes members of a local organization by age and whether they live east or west of the river. If a member of the organization is
selected at random, what is the probability that the selected member is at least 40 years old?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2905ded0.png$qb$, $qb$[{"label": "A", "body": "28/135"}, {"label": "B", "body": "35/135"}, {"label": "C", "body": "1o0/135"}, {"label": "D", "body": "107/135"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. If a member of the organization is selected at random, the probability that the selected member is at least 40 years old is
equal to the number of members who are at least 40 years old divided by the total number of members. According to the table, there are a total
of 135 members of the organization, and 107 of these members are at least 40 years old. Therefore, the probability that the selected member is
at least 40 years old is 1o7/135 .
Choice A is incorrect. This is the probability that the selected member is less than 40 years old.
Choice B is incorrect. This is the probability that the selected member lives east of the river.
Choice C is incorrect. This is the probability that the selected member lives west of the river.$qb$);
select seed_pool_question($qb$CB-bb7c8186$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is 23% of 100?$qb$, null, $qb$[{"label": "A", "body": "23"}, {"label": "B", "body": "46"}, {"label": "C", "body": "77"}, {"label": "D", "body": "123"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. 23% of 100 can be calculated by multiplying 23/10o by 100, which yields (23/10o) 100, or 23.
Choice B is incorrect. This is 46%, not 23%, of 100.
Choice C is incorrect. This is 23% less than 100, not 23% of 100.
Choice D is incorrect. This is 23% greater than 100, not 23% of 100.$qb$);
select seed_pool_question($qb$CB-d230e963$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit is also shown.
10121416IIII111124680044446666222288?(?? ? ?? ?? ?? ? ?)/(1II 222 333 444 555 666 777 888)| || || || || || || || || |x
Which of the following equations best represents the line of best fit shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d230e963.png$qb$, $qb$[{"label": "A", "body": "y = 2·8 + 1·7x"}, {"label": "B", "body": "y = 2·8 - 1·7x"}, {"label": "C", "body": "y = -2·8 + 1·7x"}, {"label": "D", "body": "y = -2·8 - 1·7x"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The line of best fit shown intersects the y-axis at a positive y-value and has a positive slope. The graph of an equation of the
form y = a + bx, where a and b are constants, intersects the y-axis at a y-value of a and has a slope of b. Of the given choices, only choice A
represents a line that intersects the y-axis at a positive y-value, 2·8, and has a positive slope, 1·7.
Choice B is incorrect. This equation represents a line that has a negative slope, not a positive slope.
Choice C is incorrect. This equation represents a line that intersects the y-axis at a negative y-value, not a positive y-value.
Choice D is incorrect. This equation represents a line that intersects the y-axis at a negative y-value, not a positive y-value, and has a negative
slope, not a positive slope.$qb$);
select seed_pool_question($qb$CB-181cc4d6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Rectangle A has length 15 and width w. Rectangle B has length 20 and the same length-to-width ratio as rectangle A. What is the width of
rectangle B in terms of w ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-181cc4d6.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that rectangle A has length 15 and width w. Therefore, the length-to-width ratio of rectangle A is 15 to w. It’s also
given that rectangle B has length 20 and the same length-to-width ratio as rectangle A. Let x represent the width of rectangle B. The proportion
can be used to solve for x in terms of w. Multiplying both sides of this equation by x yields , and then multiplying both
sides of this equation by w yields . Dividing both sides of this equation by 15 yields . Simplifying this fraction yields
.
Choices B and D are incorrect and may result from interpreting the difference in the lengths of rectangle A and rectangle B as equivalent to the
difference in the widths of rectangle A and rectangle B. Choice C is incorrect and may result from using a length-to-width ratio of w to 15, instead
of 15 to w.$qb$);
select seed_pool_question($qb$CB-241f1db7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Weight
Frequency
(pounds)
(-/13? |)/41/117/189/(?-20 |)??????? |||||||5/79/103/(-7 |)|||||||71
The frequency table summarizes a data set of the weights, rounded to the nearest pound, of  tortoises. A weight of 39 pounds is added to the
original data set, creating a new data set of the weights, rounded to the nearest pound, of 72 tortoises. Which statement best compares the
mean and median of the new data set to the mean and median of the original data set?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-241f1db7.png$qb$, $qb$[{"label": "A", "body": "The mean of the new data set is greater than the mean of the original data set, and the median of the new data set is greater than the median of the original data set."}, {"label": "B", "body": "The mean of the new data set is greater than the mean of the original data set, and the medians of the two data sets are equal."}, {"label": "C", "body": "The mean of the new data set is less than the mean of the original data set, and the median of the new data set is less than the median of the original data set."}, {"label": "D", "body": "The mean of the new data set is less than the mean of the original data set, and the medians of the two data sets are equal."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The mean of a data set is the sum of the values in the data set divided by the number of values in the data set. The new data
set consists of the weights of the 71 tortoises in the original data set and one additional weight, 39. Since the additional weight, 39, is greater
than any of the values in the original data set, the mean of the new data set is greater than the mean of the original data set. If a data set
contains an odd number of data values, the median is represented by the middle data value in the list when the data values are listed in
ascending or descending order. Since the original data set consists of the weights of 71 tortoises and is in ascending order, the median of the
original data set is represented by the middle value, or the 36th value. Based on the frequencies shown in the table, the 36th value in this data
set is 17. If a data set contains an even number of data values, the median is between the two middle data values when the values are listed in
ascending or descending order. Since the new data set consists of the weights of 72 tortoises, the median of the new data set is between the
36th and 37th data values when the values are arranged in ascending order. To keep the data in ascending order, the additional value of 39
would be placed at the bottom of the frequency table with a frequency of 1. Therefore, based on the frequencies in the table, the 36th and 37th
values in the new data set are both 17. It follows that the median of the new data set is 17, which is the same as the median of the original data
set. Therefore, the mean of the new data set is greater than the mean of the original data set, and the medians of the two data sets are equal.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-578e26ae$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?ata ?et ?
?
? ?
? ? ?
? ? ? ?
? ? ? ? ?
-| | | | |
22 23 24 25 26
Data set A has 15 values and is represented by the dot plot shown. Data set B is created by adding 46 to each of the values in data set A. Which
of the following correctly compares the medians and the ranges of data sets A and B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-578e26ae.png$qb$, $qb$[{"label": "A", "body": "The median of data set B is greater than the median of data set A, and the range of data set B is equal to the range of data set A."}, {"label": "B", "body": "The median of data set B is greater than the median of data set A, and the range of data set B is greater than the range of data set A."}, {"label": "C", "body": "The median of data set B is equal to the median of data set A, and the range of data set B is greater than the range of data set A."}, {"label": "D", "body": "The median of data set B is equal to the median of data set A, and the range of data set B is equal to the range of data set A."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The median is the middle value in a data set when the data are arranged in order from least to greatest. Since there are 15
values in data set A, the median is the 8th value. The 8th value is 23, so the median of data set A is 23. The range is found by subtracting the
minimum value in a data set from the maximum value. The minimum value in data set A is 22 and the maximum value is 26. Therefore, the range
of data set A is 26 - 22, or 4. It’s given that data set B is created by adding 46 to each of the values in data set A. Therefore, the 8th value in
data set B is 23 + 46, or 69, so the median of data set B is 69. The minimum value in data set B is 22 + 46, or 68, and the maximum value is 26
+ 46, or 72. Therefore, the range of data set B is 72 - 68, or 4. Since the median of data set A is 23, and the median of data set B is 69, the
median of data set B is greater than the median of data set A. Since the ranges of data sets A and B are both 4, the range of data set B is equal
to the range of data set A.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e9841407$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Shaquan has 7 red cards and 28 blue cards. What is the ratio of red cards to blue cards that Shaquan has?$qb$, null, $qb$[{"label": "A", "body": "1 to 4"}, {"label": "B", "body": "4 to 1"}, {"label": "C", "body": "1 to 7"}, {"label": "D", "body": "7 to 1"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that Shaquan has 7 red cards and 28 blue cards. Therefore, the ratio of red cards to blue cards that Shaquan has is
7 to 28. This ratio can be reduced by dividing both parts of the ratio by 7, which yields the ratio 1 to 4.
Choice B is incorrect. This is the ratio of blue cards to red cards that Shaquan has. Choice C is incorrect and may result from a calculation error
when reducing the ratio. Choice D is incorrect. This may result from finding the ratio of blue cards to red cards, or 28 to 7, and then making a
calculation error when reducing the ratio.$qb$);
select seed_pool_question($qb$CB-7fd284ac$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot above shows data for ten charities along with the line of best fit. For the charity with the greatest percent of total expenses spent
on programs, which of the following is closest to the difference of the actual percent and the percent predicted by the line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7fd284ac.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The charity with the greatest percent of total expenses spent on programs is represented by the highest point on the
scatterplot; this is the point that has a vertical coordinate slightly less than halfway between 90 and 95 and a horizontal coordinate slightly less
than halfway between 3,000 and 4,000. Thus, the charity represented by this point has a total income of about $3,400 million and spends about
92% of its total expenses on programs. The percent predicted by the line of best fit is the vertical coordinate of the point on the line of best fit
with horizontal coordinate $3,400 million; this vertical coordinate is very slightly more than 85. Thus, the line of best fit predicts that the charity
with the greatest percent of total expenses spent on programs will spend slightly more than 85% on programs. Therefore, the difference between
the actual percent (92%) and the prediction (slightly more than 85%) is slightly less than 7%.
Choice A is incorrect. There is no charity represented in the scatterplot for which the difference between the actual percent of total expenses
spent on programs and the percent predicted by the line of best fit is as much as 10%. Choices C and D are incorrect. These choices may result
from misidentifying in the scatterplot the point that represents the charity with the greatest percent of total expenses spent on programs.$qb$);
select seed_pool_question($qb$CB-0d125b35$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$There is a proportional relationship between p and t. If p = 5,130 when t = 6,840, then what is the value of p when t = 5,472?$qb$, null, $qb$[{"label": "A", "body": "7,296"}, {"label": "B", "body": "7,182"}, {"label": "C", "body": "4,104"}, {"label": "D", "body": "3,762"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that there is a proportional relationship between p and t. This relationship can be written as p/t . If p = 5,130 when
t = 6,840, the value of  when t = 5,472 can be calculated by solving the equation . Multiplying each side of this equation by
(5,472) (5,1p30)/(6,840) = p/(5,472) (5,472) t = 5,4 (5,130)/(762,840) = p/(5,472)
5,472 yields , or p = 4,104. Therefore, when , the value of p is 4,104.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1fbd3b67$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number a is 190% greater than the number b. The number b is 80% less than 24. What is the value of a?$qb$, null, $qb$[{"label": "A", "body": "9·12"}, {"label": "B", "body": "13·92"}, {"label": "C", "body": "26·40"}, {"label": "D", "body": "36·48"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the number b is 80% less than 24. It follows that b is equal to 24 minus 80% of 24, which can be written as b
= 24 - (8o/100)24. This is equivalent to b = 24 - 0·8(24) , or b = 4·8. It's also given that the number a is 190% greater than the number b. It
follows that a is equal to b plus 190% of b. Since b = 4·8, this can be written as a = 4·8 + ( 190/1o0 ) 4·8. This is equivalent to a = 4·8
+ 1·9(4·8) , or a = 13·92.
Choice A is incorrect. This would be the value of a if a were 190% of b, not 190% greater than b.
Choice C is incorrect. This is (190 - 80)% of 24.
Choice D is incorrect. This would be the value of a if b were 80% of 24, not 80% less than 24, and a were 190% of b, not 190% greater than b.$qb$);
select seed_pool_question($qb$CB-1b403590$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An object has a mass of 168 grams and a volume of 24 cubic centimeters. What is the density, in grams per cubic centimeter, of the object?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "144"}, {"label": "C", "body": "192"}, {"label": "D", "body": "4,032"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the object has a mass of 168 grams and a volume of 24 cubic centimeters. Dividing the mass, in grams, of the
object by the volume, in cubic centimeters, of the object gives the density, in grams per cubic centimeter, of the object. It follows that the density
of the object is 168gram8/(24 cubic ceutimctcr8) , which is equivalent to 168/24 grams per cubic centimeter, or 7 grams per cubic centimeter.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c81499e1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A giant armadillo has a mass of 39 kilograms. What is the giant armadillo's mass in grams? (1kiI0gram = 1,000gramS)$qb$, null, null, null, array[$qb$39000$qb$]::text[], $qb$The correct answer is 39,000. It’s given that the giant armadillo has a mass of 39 kilograms. Since 1 kilogram is equal to 1,000 grams, 39
kilograms is equal to 39kiIogramS ( (1,00ogram8)/1ki19gram ) , or 39,000 grams. Therefore, the giant armadillo’s mass, in grams, is 39,000.$qb$);
select seed_pool_question($qb$CB-a2162ea1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A company fills boxes with approximately 23 pounds of oranges. To test the accuracy of the filling process, 344 boxes of oranges were selected
at random and weighed. Based on the sample, it is estimated that the average weight of all boxes of oranges filled by the company in an 8-hour
period is 23·1 pounds, with an associated margin of error of 0·19 pounds. Which of the following is the best interpretation of this estimate?$qb$, null, $qb$[{"label": "A", "body": "Plausible values for the average weight of all boxes of oranges filled by the company are between 22·91 pounds and 23·29 pounds."}, {"label": "B", "body": "Plausible values for the average weight of all boxes of oranges filled by the company are less than 22·91 pounds or greater than 23·29 pounds."}, {"label": "C", "body": "The average weight of all boxes of oranges filled by the company is less than 23·01 pounds."}, {"label": "D", "body": "The average weight of all boxes of oranges filled by the company is greater than 23·01 pounds."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the estimate for the average weight of all boxes of oranges filled by the company in an 8-hour period is 23·1
pounds, with an associated margin of error of 0·19 pounds. It follows that plausible values for this average weight are between 23·1 - 0·19
pounds and 23·1 + 0·19 pounds. Therefore, plausible values for the average weight of all boxes of oranges filled by the company are between
22·91 pounds and 23·29 pounds.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ecbdbe84$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The table shown summarizes the number of employees at each of the  restaurants in a town.
Number of
Number of employees
restaurants
2 to 7 2
|||| |||| ||||8 to 13 4
14 to 19 2
20 to 25 7
26 to 31 2
Which of the following could be the median number of employees for the restaurants in this town?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ecbdbe84.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "9"}, {"label": "C", "body": "15"}, {"label": "D", "body": "21"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. If a data set contains an odd number of data values, the median is represented by the middle data value in the list when the
data values are listed in ascending or descending order. Since the numbers of employees are given as ranges of values rather than specific
values, it's only possible to determine the range in which the median falls, rather than the exact median. Since there are 17 restaurants included
in the data set and the numbers of employees are listed in ascending order, it follows that the median number of employees will be represented
by the ninth restaurant in the list. Since the first 2 restaurants each have 2 to 7 employees, numbers of employees in the 2 to 7 range would be
represented by the first and second restaurants in the list. The next 4 restaurants each have 8 to 13 employees. Therefore, numbers of
employees in the 8 to 13 range will be represented by the third through sixth restaurants in the list. The next 2 restaurants each have 14 to 19
employees. Therefore, numbers of employees in the 14 to 19 range will be represented by the seventh and eighth restaurants in the list. Since the
next 7 restaurants each have 20 to 25 employees, numbers of employees in the 20 to 25 range will be represented by the ninth through fifteenth
restaurants in the list. This means that the ninth restaurant in the list, which has the median number of employees for the restaurants in this
town, has a number of employees in the 20 to 25 range. Of the given choices, the only number of employees in the 20 to 25 range is 21.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the position of the median in the list, not the value of the median.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f8a322d9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?ata ?et ? ?ata ?et ?
?C??nee?? 1I0046228 || ?| |?|?|?| ?C??nee?? II0046228 ?|| |?|?|?| |
Integer Integer
Two data sets of 23 integers each are summarized in the histograms shown. For each of the histograms, the first interval represents the
frequency of integers greater than or equal to 10, but less than 20. The second interval represents the frequency of integers greater than or equal
to 20, but less than 30, and so on. What is the smallest possible difference between the mean of data set A and the mean of data set B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f8a322d9.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "10"}, {"label": "D", "body": "23"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The histograms shown have the same shape, but data set A contains values between 20 and 60 and data set B contains
values between 10 and 50. Thus, the mean of data set A is greater than the mean of data set B. Therefore, the smallest possible difference
between the mean of data set A and the mean of data set B is the difference between the smallest possible mean of data set A and the greatest
possible mean of data set B. In data set A, since there are 3 integers in the interval greater than or equal to 20 but less than 304,  integers greater
than or equal to 30 but less than 40, 7 integers greater than or equal to 40 but less than 50, and 9 integers greater than or equal to 50 but less
than 60, the smallest possible mean for data set A is ((3·2o)+(4·30)+(7·40)+(9·5o))/23 . In data set B, since there are 3 integers greater than or equal to
10 but less than 204,  integers greater than or equal to 20 but less than 30, 7 integers greater than or equal to 30 but less than 40, and 9 integers
greater than or equal to 40 but less than 50, the largest possible mean for data set B is . Therefore, the smallest
possible difference between the mean of data set A and the mean of data set B is ((3·20)+(4·3o)+(7·40)+(9·5o))/23((3·19)+(4·29)+(7·39)+(9·49))/(23 ()(3(20-1-9)+(3·19)+(4·29)+(7·39)+(9·49))/(4(30-29)+7(4230-39)+9(50-4) 9))/23, which is
equivalent to ((3·20)-(3·19)+(4·3o)-(4·29)+(7·4o)-(7·39)+(9·50)-(9·49))/23 . This expression can be rewritten as , or
23/23 , which is equal to 1. Therefore, the smallest possible difference between the mean of data set A and the mean of data set B is 1.
Choice A is incorrect. This is the smallest possible difference between the ranges, not the means, of the data sets.
Choice C is incorrect. This is the difference between the greatest possible mean, not the smallest possible mean, of data set A and the greatest
possible mean of data set B.
Choice D is incorrect. This is the smallest possible difference between the sum of the values in data set A and the sum of the values in data set
B, not the smallest possible difference between the means.$qb$);
select seed_pool_question($qb$CB-e7d9649f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A random sample of 50 people from a town with a population of 14,878 were asked to name their favorite flavor of ice cream. If 7 people in the
sample named chocolate as their favorite ice‑cream flavor, about how many people in the town would be expected to name chocolate?$qb$, null, $qb$[{"label": "A", "body": "350"}, {"label": "B", "body": "2,100"}, {"label": "C", "body": "7,500"}, {"label": "D", "body": "10,500"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Let x be the number of people in the entire town that would be expected to name chocolate. Since the sample of 50 people
was selected at random, it is reasonable to expect that the proportion of people who named chocolate as their favorite ice-cream flavor would be
the same for both the sample and the town population. Symbolically, this can be expressed as . Using cross multiplication,
; solving for x yields 2,083. The choice closest to the value of 2,083 is choice B, 2,100.
Choices A, C, and D are incorrect and may be the result of errors when setting up the proportion, solving for the unknown, or incorrectly
comparing the choices to the number of people expected to name chocolate, 2,083.$qb$);
select seed_pool_question($qb$CB-2df8f293$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Each vertex of a 14-sided polygon is labeled with one of the 14 letters A through N, with a different letter at each vertex. If one vertex is
selected at random, what is the probability that the letter D will be at the selected vertex? (Express your answer as a decimal or fraction, not as a
percent.)$qb$, null, null, null, array[$qb$.0714$qb$, $qb$1/14$qb$]::text[], $qb$The correct answer is 1/14 . If one vertex of the polygon is selected at random, the probability that the letter D will be at the selected vertex is
equal to the number of vertices labeled with the letter D divided by the total number of vertices. It's given that each vertex is labeled with one of
the 14 letters A through N, with a different letter at each vertex. It follows that there is 1 vertex labeled with the letter D. It's also given that the
polygon is 14-sided. It follows that there are a total of 14 vertices. Thus, the probability that the letter D will be at the selected vertex is 1/14. Note
that 1/14, .0714, and 0.071 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-7cab9fe1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression represents the result of increasing a positive quantity w by 43%?$qb$, null, $qb$[{"label": "A", "body": "1·43w"}, {"label": "B", "body": "0·57w"}, {"label": "C", "body": "43w"}, {"label": "D", "body": "0·43w"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The result of increasing a positive quantity w by x% can be represented by the expression . Therefore, the
result of increasing a positive quantity w by 43% can be found by substituting 43 for x in the expression (1 + ((1x)/14o03+)%x/w100)w, which gives
( 1 + 43/100 ) w, or 1·43w. Thus, the expression 1·43w represents the result of increasing a positive quantity w by .
Choice B is incorrect. This is the result of decreasing a positive quantity w by 43%.
Choice C is incorrect. This is the result of increasing a positive quantity w by 4,200%.
Choice D is incorrect. This is the result of decreasing a positive quantity w by 57%.$qb$);
select seed_pool_question($qb$CB-ec7b0eb8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Texting Talks on cell Does not talk on
behavior phone daily cell phone daily Total
Light 110 146 256
||| ||| ||| ||| |||
Medium 139 164 303
Heavy 166 74 240
Total 415 384 799
In a study of cell phone use, 799 randomly selected US teens were asked how often they talked on a cell phone and about their texting behavior.
The data are summarized in the table above. If one of the 799 teens surveyed is selected at random, what is the probability that the teen talks on
a cell phone daily?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ec7b0eb8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If one of the teens surveyed is selected at random, the probability that the teen talks on a cell phone daily is equal to the
quotient of the total number of teens who reported that they talk on a cell phone daily, 415, and the total number of teens surveyed, 799.
Therefore, this probability is equal to .
Choice A is incorrect. This fraction represents the probability of selecting at random any one of the 799 teens surveyed. Choice C is incorrect and
may result from conceptual errors. Choice D is incorrect. This fraction represents the probability of selecting at random one of the 799 teens
surveyed who doesn’t talk on a cell phone daily.$qb$);
select seed_pool_question($qb$CB-0700a2d5$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How many yards are equivalent to - 77 rods? (5·5yardS = 1rod)$qb$, null, null, null, array[$qb$423.5$qb$, $qb$847/2$qb$]::text[], $qb$The correct answer is 423·5. It's given that 5·5 yardS = 1 rod. Therefore, 77 rods is equivalent to (77 r0dS) ( (5·5yard8)/1r0d ) , or 423·5 yards. Note
that 423.5 and 847/2 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-e17babed$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit for the data is also shown.
1011123456789004477669922883355II?((- ?)/?-/?-/??? ? ? ?)/(1II 222 333 444 555 666 777 888 999 10II00)| || || || || || || || || || || |x
For how many of the 10 data points is the actual y-value greater than the y-value predicted by the line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e17babed.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "4"}, {"label": "C", "body": "6"}, {"label": "D", "body": "7"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Any data point that's located above the line of best fit has a y-value that's greater than the y-value predicted by the line of
best fit. For the scatterplot shown, 6 of the data points are above the line of best fit. Therefore, 6 of the data points have an actual y-value that's
greater than the y-value predicted by the line of best fit.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the number of data points that have an actual y-value that's less than the y-value predicted by the line of best fit.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-12dae628$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$29, , 1423, , 32
What is the mean of the data shown?$qb$, null, $qb$[{"label": "A", "body": "14"}, {"label": "B", "body": "16"}, {"label": "C", "body": "17"}, {"label": "D", "body": "32"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The mean of a set of data values is the sum of all the data values divided by the number of data values in the set. The sum of
the data values shown is 2 + 9 + 14 + 23 + 32, or 80. Since there are 5 data values in the set, the mean of the data shown is 80/5 , or 16.
Choice A is incorrect. This is the median, not the mean, of the data shown.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the maximum, not the mean, of the data shown.$qb$);
select seed_pool_question($qb$CB-1142af44$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Value Frequency
1 a
2 2a
||||| ||||| |||||
3 3a
4 2a
5 a
The frequency distribution above summarizes a set of data, where a is a positive integer. How much greater is the mean of the set of data than
the median?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1142af44.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "2"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since the frequencies of values less than the middle value, 3, are the same as the frequencies of the values greater than 3,
the set of data has a symmetric distribution. When a set of data has a symmetric distribution, the mean and median values are equal. Therefore,
the mean is 0 greater than the median.
Choices B, C, and D are incorrect and may result from misinterpreting the set of data.$qb$);
select seed_pool_question($qb$CB-79201024$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A band with 45 members has 11 members who play saxophone. If one band member is selected at random, what is the probability of selecting a
band member who plays saxophone?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-79201024.png$qb$, $qb$[{"label": "A", "body": "1/45"}, {"label": "B", "body": "11/45"}, {"label": "C", "body": "34/45"}, {"label": "D", "body": "45/45"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The probability of an event occurring is the ratio of the number of favorable outcomes to the total number of possible
outcomes. It’s given that there are 45 band members, which is the total number of possible outcomes. It's also given that there are 11 band
members who play saxophone. Therefore, the number of favorable outcomes is 11. Thus, the probability of selecting a band member who plays
saxophone is 11/45.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the probability of selecting a band member who does not play saxophone.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-445dd032$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Tanya earns $13.50 per hour at her part-time job. When she works z hours, she earns  dollars. Which of the following expressions gives
the amount, in dollars, Tanya will earn if she works  hours?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-445dd032.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that when Tanya works z hours, she earns  dollars. Since her hourly rate is constant, if she works 3 times
as many hours, or  hours, she will earn 3 times as many dollars, or .
Choice B is incorrect. This expression represents adding 3 dollars to the  dollars Tanya will earn. Choice C is incorrect. This expression
can be rewritten as , which implies that Tanya earns $16.50 per hour, not $13.50. Choice D is incorrect. This expression adds 3 to the
number of hours Tanya works, rather than multiplying the hours she works by 3.$qb$);
select seed_pool_question($qb$CB-121dc44f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The population of City A increased by 7% from 2015 to 2016. If the 2016 population is k times the 2015 population, what is the value of k?$qb$, null, $qb$[{"label": "A", "body": "0·07"}, {"label": "B", "body": "0·7"}, {"label": "C", "body": "1·07"}, {"label": "D", "body": "1·7"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the population of City A increased by 7% from 2015 to 2016. Therefore, the population of City A in 2016
includes 100% of the population of City A in 2015 plus an additional 7% of the population of City A in 2015. This means that the population of
City A in 2016 is 107% of the population in 2015. Thus, the population of City A in 2016 is 107/100, or 1·07, times the 2015 population. Therefore,
the value of k is 1·07.
Choice A is incorrect. This would be the value of k if the population in 2016 was 7% of the population in 2015.
Choice B is incorrect. This would be the value of k if the population in 2016 was 70% of the population in 2015.
Choice D is incorrect. This would be the value of k if the population increased by 70%, not 7%, from 2015 to 2016.$qb$);
select seed_pool_question($qb$CB-1e8ccffd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The mean score of 8 players in a basketball game was 14.5 points. If the highest individual score is removed, the mean score of the remaining 7
players becomes 12 points. What was the highest score?$qb$, null, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "24"}, {"label": "C", "body": "32"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If the mean score of 8 players is 14.5, then the total of all 8 scores is . If the mean of 7 scores is 12, then
the total of all 7 scores is . Since the set of 7 scores was made by removing the highest score of the set of 8 scores, then the
difference between the total of all 8 scores and the total of all 7 scores is equal to the removed score: .
Choice A is incorrect because if 20 is removed from the group of 8 scores, then the mean score of the remaining 7 players is
is approximately 13.71, not 12. Choice B is incorrect because if 24 is removed from the group of 8 scores, then the mean
score of the remaining 7 players is  is approximately 13.14, not 12. Choice D is incorrect because if 36 is removed from the
group of 8 scores, then the mean score of the remaining 7 players is  or approximately 11.43, not 12.$qb$);
select seed_pool_question($qb$CB-a29e89fc$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The list gives the mass, in grams, of 5 alpine marmots.
4,0104,0103,0304,0503,050; ; ; ;
What is the mean mass, in grams, of these 5 alpine marmots?$qb$, null, null, null, array[$qb$3630$qb$]::text[], $qb$The correct answer is 3,630. The mean of a data set is the sum of the values in the data set divided by the number of values in the data set. The
sum of the masses, in grams, of these alpine marmots is , or 18,150 grams. The number of alpine
4,010 + 4,010 + 3,030 + 4,050 + 3(1^(,)08,51500)/5
marmots in the data set is 5. Therefore, the mean mass, in grams, of these 5 alpine marmots is , or 3,630.$qb$);
select seed_pool_question($qb$CB-9bedc4a0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A company that produces socks wants to estimate the percent of the socks produced in a typical week that are defective. A random sample of
310 socks produced in a certain week were inspected. Based on the sample, it is estimated that 12% of all socks produced by the company in
this week are defective, with an associated margin of error of 3·62%. Based on the estimate and associated margin of error, which of the
following is the most appropriate conclusion about all socks produced by the company during this week?$qb$, null, $qb$[{"label": "A", "body": "3·62% of the socks are defective."}, {"label": "B", "body": "It is plausible that between 8·38% and 15·62% of the socks are defective."}, {"label": "C", "body": "12% of the socks are defective."}, {"label": "D", "body": "It is plausible that more than 15·62% of the socks are defective."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that, based on the sample, an estimate of 12% of all socks produced by the company in a certain week are
defective, with an associated margin of error of 3·62%. This estimate, plus or minus the margin of error, gives an interval of plausible values for
the actual percent of all socks produced by the company that week that are defective. Subtracting 3·62% from 12% yields 8·38%. Adding
3·62% to 12% yields 15·62%. Therefore, it is plausible that between 8·38% and 15·62% of all socks produced by the company are defective.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect. 12% is the estimated percent of defective socks based on the sample. However, since the margin of error for this estimate
is known, the most appropriate conclusion is not that the percent of defective socks is exactly 12% but instead that it lies in an interval of
plausible percents.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-1e1027a7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The scatterplot above shows a company’s ice cream sales d, in dollars, and the high temperature t, in degrees Celsius (°C), on 12 different days.
A line of best fit for the data is also shown. Which of the following could be an equation of the line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1e1027a7.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. On the line of best fit, d increases from approximately 480 to 880 between  and . The slope of the line of best
fit is the difference in d-values divided by the difference in t-values, which gives , or approximately 33. Writing the
equation of the line of best fit in slope-intercept form gives , where b is the y-coordinate of the y-intercept. This equation is
satisfied by all points on the line, so  when . Thus, , which is equivalent to . Subtracting
396 from both sides of this equation gives . Therefore, an equation for the line of best fit could be .
Choice A is incorrect and may result from an error in calculating the slope and misidentifying the y-coordinate of the y-intercept of the graph as
the value of d at  rather than the value of d at . Choice B is incorrect and may result from using the smallest value of t on the graph
as the slope and misidentifying the y-coordinate of the y-intercept of the graph as the value of d at  rather than the value of d at .
Choice C is incorrect and may result from misidentifying the y-coordinate of the y-intercept as the smallest value of d on the graph.$qb$);
select seed_pool_question($qb$CB-fe1ec415$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A cherry pitting machine pits 12 pounds of cherries in 3 minutes. At this rate, how many minutes does it take the machine to pit 96 pounds of
cherries?$qb$, null, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "15"}, {"label": "C", "body": "24"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the cherry pitting machine pits 12 pounds of cherries in 3 minutes. This rate can be written as
(12 PoundS 9fchcrric8)/(3 miuute8) . If the number of minutes it takes the machine to pit  pounds of cherries is represented by x, the value of x can be
calculated by solving the equation 4x(12 P9und8 0fcherricS)/(= 936minutc8) = (96 P0uud8 0fcher9ri6eS)/(x minute8) , which can be rewritten as 12/3 = 96/x , or 4 = 96/x . Multiplying each
side of this equation by x yields . Dividing each side of this equation by 4 yields x = 24. Therefore, it takes the machine 24 minutes to
pit 96 pounds of cherries.
Choice A is incorrect. This is the number of minutes it takes the machine to pit 32, not 96, pounds of cherries.
Choice B is incorrect. This is the number of minutes it takes the machine to pit 60, not 96, pounds of cherries.
Choice D is incorrect. This is the number of minutes it takes the machine to pit 144, not 96, pounds of cherries.$qb$);
select seed_pool_question($qb$CB-f85bbf7a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A middle school faculty surveyed students to determine interest in an after-school chess club. Of the 100 students who were selected at random
from all students in the school, 32% expressed interest in the club. Based on the sample mean and the margin of error, the faculty expects that
between 24% and 40% of all students in the school would express interest in the club. What is the margin of error?$qb$, null, $qb$[{"label": "A", "body": "0%"}, {"label": "B", "body": "8%"}, {"label": "C", "body": "16%"}, {"label": "D", "body": "32%"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that of the 100 students who were selected at random from all students in the school, 32% expressed interest in
the club. It's also given that based on the sample mean and the margin of error, the faculty expects that between 24% and 40% of all students in
the school would express interest in the club. These values are calculated by subtracting the margin of error from 32% to get the lower bound,
24%, and by adding the margin of error to 32% to get the upper bound, 40%. It follows that the margin of error can be calculated as the
difference between 32% and 24% or between 40% and 32%. The difference between 32% and 24% is (32 - 24)%, or 8%.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the difference between 40% and 24%, not the difference between 32% and 24% or between 40% and 32%.
Choice D is incorrect. This is the percentage of the students selected at random who expressed interest in the club, not the margin of error.$qb$);
select seed_pool_question($qb$CB-ba62b0b0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A kangaroo has a mass of 28 kilograms. What is the kangaroo's mass, in grams?- (1kiI0gram = 1,000gramS)$qb$, null, $qb$[{"label": "A", "body": "28,000"}, {"label": "B", "body": "1,028"}, {"label": "C", "body": "972"}, {"label": "D", "body": "784"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a kangaroo has a mass of 28 kilograms and that 1 kilogram is equal to 1,000 grams. Therefore, the kangaroo's
mass, in grams, is 28 kiIogramS ( (1,000gramS)/1ki1ogram ) , which is equivalent to 28,000 grams.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-939c46d1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The glass pictured above can hold a maximum volume of 473 cubic centimeters, which is approximately 16 fluid ounces. Jenny has a pitcher
that contains 1 gallon of water. How many times could Jenny completely fill the glass with 1 gallon of water?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-939c46d1.png$qb$, $qb$[{"label": "A", "body": "16"}, {"label": "B", "body": "8"}, {"label": "C", "body": "4"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It is given that the volume of the glass is approximately 16 fluid ounces. If Jenny has 1 gallon of water, which is 128 fluid
ounces, she could fill the glass  times.
Choice A is incorrect because Jenny would need  fluid ounces = 256 fluid ounces, or 2 gallons, of water to fill the glass 16 times.
Choice C is incorrect because Jenny would need only  fluid ounces = 64 fluid ounces of water to fill the glass 4 times. Choice D is
incorrect because Jenny would need only  fluid ounces = 48 fluid ounces to fill the glass 3 times.$qb$);
select seed_pool_question($qb$CB-29c177e6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is 10% of 470?$qb$, null, $qb$[{"label": "A", "body": "37"}, {"label": "B", "body": "47"}, {"label": "C", "body": "423"}, {"label": "D", "body": "460"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. 10% of a quantity means  times the quantity. Therefore, 10% of 470 can be represented as 1o/1o0 (470) , which is
10 10/(%1o0)
equivalent to 0·10(470) , or 47. Therefore, of 470 is 47.
Choice A is incorrect. This is 10% of 370, not 10% of 470.
Choice C is incorrect. This is 90% of 470, not 10% of 470.
Choice D is incorrect. This is 470 - 10, not 10% of 470.$qb$);
select seed_pool_question($qb$CB-13f67ddc$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$100
90
80
70
60
Probability of snow (%) 50 | ?|???|?|||??|
40
30
20
10
0
Tuesday Friday
Wednesday Thursday
Day of the week
The line graph shows the probability of snow, as a percent, at a certain location for each day during a four-day period. According to the line graph,
for which day during this four-day period is the probability of snow 30%?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-13f67ddc.png$qb$, $qb$[{"label": "A", "body": "Tuesday"}, {"label": "B", "body": "Wednesday"}, {"label": "C", "body": "Thursday"}, {"label": "D", "body": "Friday"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For the line graph shown, the probability of snow, as a percent, is represented on the vertical axis. According to the line
graph, during this four-day period, the probability of snow is 30% for Thursday.
Choice A is incorrect. The probability of snow on Tuesday is 60%.
Choice B is incorrect. The probability of snow on Wednesday is 90%.
Choice D is incorrect. The probability of snow on Friday is 70%.$qb$);
select seed_pool_question($qb$CB-ea95087d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Average number of
Type of store
employees
Warehouse store 365
|| ||| |||
Department store 213
Supermarket 130
For a certain region, the table shows the average number of store employees in  by type of store. Based on the table, how much greater was
the average number of store employees in warehouse stores than in supermarkets?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ea95087d.png$qb$, $qb$[{"label": "A", "body": "83"}, {"label": "B", "body": "152"}, {"label": "C", "body": "235"}, {"label": "D", "body": "495"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The table shows that for a certain region in 2016, the average number of store employees in warehouse stores was 365 and
the average number of store employees in supermarkets was 130. Subtracting 130 from 365 yields 365 - 130, or 235. Therefore, the average
number of store employees was 235 greater in warehouse stores than in supermarkets.
Choice A is incorrect. For this region in 2016, this is how much greater the average number of store employees was in department stores than in
supermarkets.
Choice B is incorrect. For this region in 2016, this is how much greater the average number of store employees was in warehouse stores than in
department stores.
Choice D is incorrect. For this region in 2016, this is the sum of the average number of store employees in warehouse stores and in
supermarkets.$qb$);
select seed_pool_question($qb$CB-fc46af57$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A bag containing 10,000 beads of assorted colors is purchased from a craft store. To estimate the percent of red beads in the bag, a sample of
beads is selected at random. The percent of red beads in the bag was estimated to be 15%, with an associated margin of error of 2%. If r is the
actual number of red beads in the bag, which of the following is most plausible?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fc46af57.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It was estimated that 15% of the beads in the bag are red. Since the bag contains 10,000 beads, it follows that there are an
estimated  red beads. It’s given that the margin of error is 2%, or  beads. If the estimate is
too high, there could plausibly be  red beads. If the estimate is too low, there could plausibly be
red beads. Therefore, the most plausible statement of the actual number of red beads in the bag is
.
Choices A and D are incorrect and may result from misinterpreting the margin of error. It’s unlikely that more than 1,700 beads or fewer than
1,300 beads in the bag are red. Choice C is incorrect because 200 is the margin of error for the number of red beads, not the lower bound of the
range of red beads.$qb$);
select seed_pool_question($qb$CB-e7d48c8a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?
? ?
? ?
? ? ?
? ? ? ? ?
-| | | | |
1 2 3 4 5
Numbero? burStS
The dot plot represents a data set of the number of bursts for 13 eruptions of a steam vent. If an additional eruption with 11 bursts is added to
this data set to create a new data set of 14 eruptions, which of the following measures will be greater for the new data set than for the original
data set?
I. The median number of bursts
II. The mean number of bursts$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e7d48c8a.png$qb$, $qb$[{"label": "A", "body": "I and II"}, {"label": "B", "body": "I only"}, {"label": "C", "body": "II only"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the dot plot represents a data set of the number of bursts for 13 eruptions of a steam vent. The median of a
data set with an odd number of elements is the middle element when the elements are in numerical order. For 13 elements in numerical order,
this is the 7th element. For this data set, the first 4 elements have a value of 1, and the next 5 elements have a value of 2. Thus, the 7th element
in the ordered data set is 2 and the median number of bursts for the original data set is 2. If an additional eruption with 11 bursts is added to this
data set to create a new data set of 14 eruptions, the median of the new data set will be between the 7th and 8th elements in the ordered set,
which will also be 2. Therefore, the median number of bursts for the new data set will be the same as the median number of bursts for the
original data set. The mean number of bursts for the original data set is found by adding the values of all 13 elements and dividing that sum by
the number of elements, 13. Since the data is shown in a dot plot, the sum of the values of the elements can be found by multiplying each
element's value by its frequency: 1(4) + 2(5) + 3(2) + 4(1) + 5(1), or 29. Therefore, the mean number of bursts for the original data set is
29/13 . If an additional eruption with 11 bursts is added to this data set to create a new data set of 14 bursts, the mean number of bursts for the
new data set is (29+11)/14 , or 4o/14 . Since 40/14 > 29/13 , the mean number of bursts for the new data set is greater than the mean number of bursts for the
original data set. Therefore, of the median number of bursts and the mean number of bursts, only the mean number of bursts is greater for the
new data set than for the original data set.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7b65bb28$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Station 1 Station 2 Station 3 Station 4 Station 5
-/(?-?)? ?-/(-?)?-/(-?)?-/(-|)|-/(-|)|
$3.699 $3.609 $3.729 $3.679 $3.729
In the table above, Melissa recorded the price of one gallon of regular gas from five different local gas stations on the same day. What is the
median of the gas prices Melissa recorded?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7b65bb28.png$qb$, $qb$[{"label": "A", "body": "$3.679"}, {"label": "B", "body": "$3.689"}, {"label": "C", "body": "$3.699"}, {"label": "D", "body": "$3.729"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The median of a data set is the middle value when the data is in ascending or descending order. In ascending order, the gas
prices are $3.609, $3.679, $3.699, $3.729, and $3.729. The middle number of this list is 3.699, so it follows that $3.699 is the median gas price.
Choice A is incorrect. When the gas prices are listed in ascending order, this value isn’t the middle number. Choice B is incorrect. This value
represents the mean gas price. Choice D is incorrect. This value represents both the mode and the maximum gas price.$qb$);
select seed_pool_question($qb$CB-8a714fa1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following represents the result of increasing the quantity x by 9%, where  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8a714fa1.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Increasing the positive quantity x by 9% is the result of adding 9% of x to x. 9% of x can be represented algebraically as
, or . Adding this expression to x yields , or .
Choice B is incorrect. This represents 9% of x. Choice C is incorrect. This represents increasing x by 9, not by 9%. Choice D is incorrect. This
represents increasing x by 0.09, not by 9%.$qb$);
select seed_pool_question($qb$CB-7cd1c6db$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An object travels at a constant speed of 12 centimeters per second. At this speed, what is the time, in seconds, that it would take for the object
to travel 108 centimeters?$qb$, null, $qb$[{"label": "A", "body": "9"}, {"label": "B", "body": "96"}, {"label": "C", "body": "120"}, {"label": "D", "body": "972"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. If the object travels 108 centimeters at a speed of 12 centimeters per second, the time of travel can be determined by
dividing the total distance by the speed. This results in (108 ccntimctcr8)/(12 ccntimetcrS?8ccond) , which is 9 seconds.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8784bc84$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is 20% of 440?$qb$, null, $qb$[{"label": "A", "body": "44"}, {"label": "B", "body": "88"}, {"label": "C", "body": "880"}, {"label": "D", "body": "1,760"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. 20% of 440 can be calculated as (20/1o0) (440), which is equivalent to (8,8o0)/100, or 88.
Choice A is incorrect. This is 10%, not 20%, of 440.
Choice C is incorrect. This is 200%, not 20%, of 440.
Choice D is incorrect. This is 400%, not 20%, of 440.$qb$);
select seed_pool_question($qb$CB-8637294f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If 4a/b = 6·7 and a/bn = 26·8, what is the value of n?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8637294f.png$qb$, null, null, array[$qb$.0625$qb$, $qb$1/16$qb$]::text[], $qb$The correct answer is ·0625. It's given that  and . The equation 4a/b = 6·7 can be rewritten as (4) (a/b) = 6·7. Dividing both
a/bna/bn==262·68·8
sides of this equation by (1·675) (1/n) = 2a/(6b·) 8= 1·674a/5b = 6·74 yields . The equation  can be rewritten as (a/b) (1/n) = 26·8. Substituting 1·675 for a/b in this
equation yields , or (1·675)/n = 26·8. Multiplying both sides of this equation by n yields 1·675 = 26·8n. Dividing both sides of
this equation by 26·8 yields n = 0·0625. Therefore, the value of n is 0·0625. Note that .0625, 0.062, 0.063, and 1/16 are examples of ways to
enter a correct answer.$qb$);
select seed_pool_question($qb$CB-8e2e424e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The number k is 36% greater than 50. If k is the product of 50 and r, what is the value of r ?$qb$, null, $qb$[{"label": "A", "body": "36"}, {"label": "B", "body": "3.6"}, {"label": "C", "body": "1.36"}, {"label": "D", "body": "0.36"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the number k is 36% greater than 50. Therefore, the value of k is the number 50 plus 36% of 50. This can be
rewritten as . Multiplying the terms  yields 18, so , or . It’s also given that k is the
product of 50 and r, which can be rewritten as . Substituting 68 for k yields . Dividing both sides of this equation by 50 yields
.
Choice A is incorrect. This is the percentage that k is greater than 50. Choice B is incorrect and may result from a calculation error. Choice D is
incorrect. This would be the value of r if k were 36% of 50, instead of 36% greater than 50.$qb$);
select seed_pool_question($qb$CB-24ad9dcb$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The weight of an object on Venus is approximately  of its weight on Earth. The weight of an object on Jupiter is approximately  of its
weight on Earth. If an object weighs 100 pounds on Earth, approximately how many more pounds does it weigh on Jupiter than it weighs on
Venus?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-24ad9dcb.png$qb$, $qb$[{"label": "A", "body": "90"}, {"label": "B", "body": "111"}, {"label": "C", "body": "140"}, {"label": "D", "body": "230"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The weight of an object on Venus is approximately  of its weight on Earth. If an object weighs 100 pounds on Earth,
then the object’s weight on Venus is approximately  pounds. The same object’s weight on Jupiter is approximately  of its
weight on Earth; therefore, the object weighs approximately  pounds on Jupiter. The difference between the object’s weight
on Jupiter and the object’s weight on Venus is approximately  pounds. Therefore, an object that weighs 100 pounds on Earth
weighs 140 more pounds on Jupiter than it weighs on Venus.
Choice A is incorrect because it is the weight, in pounds, of the object on Venus. Choice B is incorrect because it is the weight, in pounds, of an
object on Earth if it weighs 100 pounds on Venus. Choice D is incorrect because it is the weight, in pounds, of the object on Jupiter.$qb$);
select seed_pool_question($qb$CB-be00d896$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For which of the following data sets is the mean greater than the median?$qb$, null, $qb$[{"label": "A", "body": "5, 5, 5, 5, 5, 5, 5, 5, 5"}, {"label": "B", "body": "0, 10, 20, 30, 40, 50, 60, 70, 80"}, {"label": "C", "body": "2, 4, 8, 16, 32, 64, 128, 256, 512"}, {"label": "D", "body": "7, 107, 107, 207, 207, 207, 307, 307, 307"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If the values in a data set are ordered from least to greatest, the median of the data set will be the middle value. Since each
data set in the choices is ordered and contains exactly 9 data values, the 5th value in each is the median. It follows that the median of the data
set in choice C is 32. The sum of the positive differences between 32 and each of the values that are less than 32 is significantly smaller than the
sum of the positive differences between 32 and each of the values that are greater than 32. If 32 were the mean, these sums would have been
equal to each other. Therefore, the mean of this data set must be greater than 32. This can also be confirmed by calculating the mean as the sum
of the values divided by the number of values in the data set: .
Choices A and B are incorrect. Each of the data sets in these choices is symmetric with respect to its median, so the mean and the median for
each of these choices are equivalent. Choice D is incorrect. The median of this data set is 207. Since the sum of the positive differences between
207 and each of the values less than 207 is greater than the sum of the positive differences between 207 and each value greater than 207 in this
data set, the mean must be less than the median.$qb$);
select seed_pool_question($qb$CB-3d985614$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Each dot in the scatterplot above represents the height x, in feet, in the high jump, and the distance y, in feet, in the long jump, made by each
student in a group of twenty students. The graph of which of the following equations is a line that most closely fits the data?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3d985614.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A line that most closely fits the data is a line with an approximately balanced number of data points above and below the
line. Fitting a line to the data shown results in a line with an approximate slope of 3 and a y-intercept near the point . An equation for the
line can be written in slope-intercept form, , where m is the slope and b is the y-coordinate of the y-intercept. The equation
in choice C fits the data most closely.
Choices A and B are incorrect because the slope of the lines of these equations is 0.82, which is a value that is too small to be the slope of the
line that fits the data shown. Choice D is incorrect. The graph of this equation has a y-intercept at , not . This line would lie
below all of the data points, and therefore would not closely fit the data.$qb$);
select seed_pool_question($qb$CB-b3547a10$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A group of 10 botanists recorded data on the germination rates of a certain type of seed for one growing season. The scatterplot shows the
relationship between the number of seeds planted, x, and the number of seeds that germinated, y, for each of the botanists. A line of best fit is
also shown.
y
500
400
300
|| | | | | | ?
200
100
x
O 100 200 300 400 500
Which of the following is the best interpretation of the slope of the line of best fit in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b3547a10.png$qb$, $qb$[{"label": "A", "body": "The number of seeds planted is predicted to increase by 60 seeds every 100 days."}, {"label": "B", "body": "The number of seeds planted is predicted to increase by 300 seeds every 100 days."}, {"label": "C", "body": "The number of seeds that germinate is predicted to increase by 60 seeds for every additional 100 seeds that are planted."}, {"label": "D", "body": "The number of seeds that germinate is predicted to increase by 300 seeds for every additional 100 seeds that are planted."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the scatterplot shows the relationship between the number of seeds planted, x, and the number of seeds that
germinated, y. The slope of a line of best fit represents the change in the y-value for a given change in the x-value. According to the graph, the y-
value of the line of best fit increases by about 60 when the x-value increases by about 100, which represents an increase of about 60 germinated
seeds for every additional 100 seeds planted. Therefore, the best interpretation of the slope of the line of best fit is that the number of seeds that
germinate is predicted to increase by 60 seeds for every additional 100 seeds that are planted.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-560fab82$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table shows the frequency of values in a data set.
Value Frequency
19/213/(|-^(2)5 |)|||| ||||-/77/(-4 |)||||
What is the minimum value of the data set?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-560fab82.png$qb$, null, null, array[$qb$19$qb$]::text[], $qb$The correct answer is 19. The minimum value of a data set is the least value in the data set. The frequency refers to the number of times a value
occurs. The given table shows that for this data set, the value 19 occurs 7 times, the value 21 occurs 1 time, the value 23 occurs 7 times, and
the value 25 occurs 4 times. Therefore, of the values 19, 21, 23, and 25 given in the data set, the minimum value of the data set is 19.$qb$);
select seed_pool_question($qb$CB-308084c5$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Sample Percent in favor Margin of error
|| ?? ?? ||A 52% 4.2%
B 48% 1.6%
The results of two random samples of votes for a proposition are shown above. The samples were selected from the same population, and the
margins of error were calculated using the same method. Which of the following is the most appropriate reason that the margin of error for
sample A is greater than the margin of error for sample B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-308084c5.png$qb$, $qb$[{"label": "A", "body": "Sample A had a smaller number of votes that could not be recorded."}, {"label": "B", "body": "Sample A had a higher percent of favorable responses."}, {"label": "C", "body": "Sample A had a larger sample size."}, {"label": "D", "body": "Sample A had a smaller sample size."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Sample size is an appropriate reason for the margin of error to change. In general, a smaller sample size increases the
margin of error because the sample may be less representative of the whole population.
Choice A is incorrect. The margin of error will depend on the size of the sample of recorded votes, not the number of votes that could not be
recorded. In any case, the smaller number of votes that could not be recorded for sample A would tend to decrease, not increase, the
comparative size of the margin of error. Choice B is incorrect. Since the percent in favor for sample A is the same distance from 50% as the
percent in favor for sample B, the percent of favorable responses doesn’t affect the comparative size of the margin of error for the two samples.
Choice C is incorrect. If sample A had a larger margin of error than sample B, then sample A would tend to be less representative of the
population. Therefore, sample A is not likely to have a larger sample size.$qb$);
select seed_pool_question($qb$CB-d94018fd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?IaSS ? ?IaSS ?
? ?
? ? ? ?
? ? ? ? ? ?
? ? ? ? ? ? ? ?
? ? ? ? ? ? ? ? ? ?
? ? ? ? ? ? ? ? ? ?
? ? ? ? ? ? ? ? ? ? ? ? ? ?
-| | | | | | | -| | | | | | |
I 2 3 4 5 6 7 14 15 16 17 18 19 20
Each of the dot plots shown represents the number of glue sticks brought in by each student for two classes, class A and class B. Which
statement best compares the standard deviations of the numbers of glue sticks brought in by each student for these two classes?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d94018fd.png$qb$, $qb$[{"label": "A", "body": "The standard deviation of the number of glue sticks brought in by each student for class A is less than the standard deviation of the number of glue sticks brought in by each student for class B."}, {"label": "B", "body": "The standard deviation of the number of glue sticks brought in by each student for class A is equal to the standard deviation of the number of glue sticks brought in by each student for class B."}, {"label": "C", "body": "The standard deviation of the number of glue sticks brought in by each student for class A is greater than the standard deviation of the number of glue sticks brought in by each student for class B."}, {"label": "D", "body": "There is not enough information to compare these standard deviations."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Standard deviation is a measure of the spread of a data set from its mean. The dot plot for class A and the dot plot for class
B have the same shape. Thus, the frequency distributions for both class A and class B are the same. Since both class A and class B have the
same frequency distribution of glue sticks brought in by each student, it follows that both class A and class B have the same spread of the
number of glue sticks brought in by each student from their respective means. Therefore, the standard deviation of the number of glue sticks
brought in by each student for class A is equal to the standard deviation of the number of glue sticks brought in by each student for class B.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e635aede$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In 2008, Zinah earned 14% more than in 2007, and in 2009 Zinah earned 4% more than in 2008. If Zinah earned y times as much in 2009 as in
2007, what is the value of y?$qb$, null, $qb$[{"label": "A", "body": "0·5600"}, {"label": "B", "body": "1·0056"}, {"label": "C", "body": "1·1800"}, {"label": "D", "body": "1·1856"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that in 2008 Zinah earned 14% more than in 2007. Let h represent the amount Zinah earned in 2007 and let j
represent the amount that Zinah earned in 2008. This situation can be represented by the equation , or j = 1·14h. It’s also
j2=00(91 + 14/100)h
given that in 2009 Zinah earned 4% more than in 2008. Let k represent the amount Zinah earned in . This situation can be represented by
the equation k = (1 + 4/1o0)j, or k = 1·04j. Substituting 1·14h for j in the equation k = 1·04j yields k = (1·04)(1·14h), or k = 1·1856h. If
Zinah earned y times as much in 2009 as in 2007, then the value of y is 1·1856.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1f4c57d7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For the last three years, a pig at a farm gave birth to one litter per year. The table shows the number of piglets in each of these three litters.
Number of
Litter number
piglets
(-/1| |)/2|| ||7/(-9 |)||
What is the mean number of piglets per litter for these three litters?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1f4c57d7.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "7"}, {"label": "C", "body": "8"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the numbers of piglets in litters 1, 2, and 3 are 8, 7, and 9, respectively. The mean number of piglets per litter
for these three litters is (8+7+9)/3 , which is equivalent to 24/3 , or 8.
Choice A is incorrect. This is the range of the number of piglets per litter for these three litters.
Choice B is incorrect. This is the minimum number of piglets per litter for these three litters.
Choice D is incorrect. This is the maximum number of piglets per litter for these three litters.$qb$);
select seed_pool_question($qb$CB-e21d10a7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$One of a planet's moons orbits the planet every 252 days. A second moon orbits the planet every 287 days. How many more days does it take
the second moon to orbit the planet 29 times than it takes the first moon to orbit the planet 29 times?$qb$, null, null, null, array[$qb$1015$qb$]::text[], $qb$The correct answer is 1,015. It’s given that the first moon orbits the planet every 252 days. Therefore, it takes the first moon 252(29), or
7,308, days to orbit the planet 29 times. It’s also given that the second moon orbits the planet every 287 days. Therefore, it takes the second
moon 287(29), or 8,323, days to orbit the planet 29 times. Since it takes the first moon 7,308 days and the second moon 8,323 days, it takes
the second moon 8,323 - 7,308, or 1,015, more days than it takes the first moon to orbit the planet 29 times.$qb$);
select seed_pool_question($qb$CB-7d721177$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The density of a certain type of wood is 353 kilograms per cubic meter. A sample of this type of wood is in the shape of a cube and has a mass
of 345 kilograms. To the nearest hundredth of a meter, what is the length of one edge of this sample?-$qb$, null, $qb$[{"label": "A", "body": "0·98"}, {"label": "B", "body": "0·99"}, {"label": "C", "body": "1·01"}, {"label": "D", "body": "1·02"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the density of a certain type of wood is 353 kilograms per cubic meter (kg?m^(3)) , and a sample of this type of
wood has a mass of 345kg. Let x represent the volume, in m3 , of the sample. It follows that the relationship between the density, mass, and
volume of this sample can be written
as , or 353 = 345/x . Multiplying both sides of this equation by x yields 353x = 345. Dividing both sides of this equation by 353
(353k?)/1mx3==345/353(345k?)/(x m3)
yields . Therefore, the volume of this sample is 345/353 m3 . Since it’s given that the sample of this type of wood is a cube, it follows that
the length of one edge of this sample can be found using the volume formula for a cube, V = s3 , where V represents the volume, in m3, and s
represents the length, in m, of one edge of the cube. Substituting 345/353 for V in this formula yields 345/353 = s3. Taking the cube root of both sides of
this equation yields √3 (-345)/353 = s, or s ? 0·99. Therefore, the length of one edge of this sample to the nearest hundredth of a meter is 0·99.
Choices A, C, and D are incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d0d9ede4$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How many feet are equivalent to 34 yards? (1yard = 3feet)$qb$, null, null, null, array[$qb$102$qb$]::text[], $qb$The correct answer is 102. It’s given that 1 yard is equivalent to 3 feet. Therefore, 34 yards is equivalent to (34 yardS) ( (3 ?ect)/1yard ) , or 102 feet.$qb$);
select seed_pool_question($qb$CB-1d945139$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The total mass, in kilograms, of r identical objects is t. Which expression represents the total mass, in kilograms, of 146r of these objects?$qb$, null, $qb$[{"label": "A", "body": "146 - t"}, {"label": "B", "body": "146 + t"}, {"label": "C", "body": "t/146"}, {"label": "D", "body": "146t"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the total mass, in kilograms, of r identical objects is t. To obtain the expression 146rr, is multiplied by 146.
Therefore, to find the total mass, in kilograms, of 146r of these objects, t must also be multiplied by 146. The result of multiplying t by 146 is the
expression 146t. Therefore, the total mass, in kilograms, of 146r of these objects, is 146t.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-4b09f783$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A list of 10 data values is shown.
6, 8, 16, 4, 1726, , 85, , 55,
What is the mean of these data?$qb$, null, null, null, array[$qb$10$qb$]::text[], $qb$The correct answer is 10. The mean of a data set is calculated by dividing the sum of the data values by the number of data values in the data
set. For this data set, the mean can be calculated as (6+8+16+4+17+26+8+5+5+5)/1o , which is equivalent to 1o0/10 , or 10.$qb$);
select seed_pool_question($qb$CB-67c0200a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number a is 70% less than the positive number b. The number c is 80% greater than a. The number c is how many times b?$qb$, null, null, null, array[$qb$.54$qb$, $qb$27/50$qb$]::text[], $qb$The correct answer is ·54. It's given that the number a is 70% less than the positive number b. Therefore, , which is equivalent
to a = (1 - 0·70)b, or a = 0·30b. It's also given that the number c is 80% greater than a. Therefore, c =a(c=1=+( 1(8-0)/(11·o800)7o/()1(oa00·)3)0bb), which is equivalent to c
= (1 + 0·80)a, or c = 1 ·80a. Since a = 0·30b, substituting 0·30b for a in the equation c = 1 ·80a yields , or c = 0·54b.
Thus, c is 0·54 times b. Note that .54 and 27/50 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-f04d40b2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$From a population of 50,000 people, 1,000 were chosen at random and surveyed about a proposed piece of legislation. Based on the survey, it
is estimated that 35% of people in the population support the legislation, with an associated margin of error of 3%. Based on these results,
which of the following is a plausible value for the total number of people in the population who support the proposed legislation?$qb$, null, $qb$[{"label": "A", "body": "350"}, {"label": "B", "body": "650"}, {"label": "C", "body": "16,750"}, {"label": "D", "body": "31,750"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that an estimated 35% of people in the population support the legislation, with an associated margin of error of
3%. Subtracting and adding the margin of error from the estimate gives an interval of plausible values for the true percentage of people in the
population who support the legislation. Therefore, it’s plausible that between 32% and 38% of people in this population support the legislation.
The corresponding numbers of people represented by these percentages in the population can be calculated by multiplying the total population,
50,000, by 0·32 and by 0·38, which gives 50,000(0·32) = 16,000 and 50,000(0·38) = 19,000, respectively. It follows that any value in the
interval 16,000 to 19,000 is a plausible value for the total number of people in the population who support the proposed legislation. Of the
choices given, only 16,750 is in this interval.
Choice A is incorrect. This is the number of people in the sample, rather than in the population, who support the legislation.
Choice B is incorrect. This is the number of people in the sample who do not support the legislation.
Choice D is incorrect. This is a plausible value for the total number of people in the population who do not support the proposed legislation.$qb$);
select seed_pool_question($qb$CB-3aa0642c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Number of
Shape
cards
Square 5
||| ||| |||
Circle 9
Triangle 14
Star 12
The table summarizes the distribution of shape printed on one side for cards in a deck of cards. How many cards in the deck have a triangle
printed on one side?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3aa0642c.png$qb$, null, null, array[$qb$14$qb$]::text[], $qb$The correct answer is 14. The table summarizes the distribution of shape printed on one side for cards in a deck of cards. The table shows that
the number of cards when the shape is a triangle is 14. Therefore, there are 14 cards in the deck that have a triangle printed on one side.$qb$);
select seed_pool_question($qb$CB-bfa8a85c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$66, , 88, , 8, 10, 21
Which of the following lists represents a data set that has the same median as the data set shown?$qb$, null, $qb$[{"label": "A", "body": "46, , 66, , 88,"}, {"label": "B", "body": "66, , 88, , 10, 10"}, {"label": "C", "body": "68, , 10, 1010, , 12"}, {"label": "D", "body": "88, , 10, 1021, , 21"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If a data set contains an odd number of data values, the median is represented by the middle data value in the list when the
data values are listed in ascending or descending order. Since the data set shown has 7 data values and is in ascending order, it follows that the
median is the fourth data value in the list, or 8. If a data set contains an even number of data values, the median is between the two middle data
values when the values are listed in ascending or descending order. Since each of the choices consists of a data set with 6 data values in
ascending order, it follows that the median is between the third and fourth data value. The third and fourth data values in choice B are 8 and 8.
Thus, choice B represents a data set with a median of 8. Since the median of the data set shown is 8 and choice B represents a data set with a
median of 8, it follows that choice B represents a data set that has the same median as the data set shown.
Choice A is incorrect. This list represents a data set with a median of 6, not 8.
Choice C is incorrect. This list represents a data set with a median of 10, not 8.
Choice D is incorrect. This list represents a data set with a median of 10, not 8.$qb$);
select seed_pool_question($qb$CB-c9dd92b1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The densities of different concentrations of grape juice are shown in the scatterplot above. According to the trend shown by the data, which of
the following is closest to the predicted density, in kilograms per cubic meter (kg/m3), for grape juice with a concentration of 60%?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c9dd92b1.png$qb$, $qb$[{"label": "A", "body": "1,200"}, {"label": "B", "body": "1,250"}, {"label": "C", "body": "1,300"}, {"label": "D", "body": "1,350"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The data in the scatterplot show an increasing linear trend. The density when the juice concentration is 60% will be between
the densities shown at about 53% and 67% concentration, or between about 1,255 and 1,340 kg/m3. Of the choices given, only 1,300 falls within
this range.
Choices A, B, and D are incorrect. These are the approximate densities of grape juice with a concentration of 45%, 55%, and 70%, respectively.$qb$);
select seed_pool_question($qb$CB-9bf4c545$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The members of a city council wanted to assess the opinions of all city residents about converting an open field into a dog park. The council
surveyed a sample of 500 city residents who own dogs. The survey showed that the majority of those sampled were in favor of the dog park.
Which of the following is true about the city council’s survey?$qb$, null, $qb$[{"label": "A", "body": "It shows that the majority of city residents are in favor of the dog park."}, {"label": "B", "body": "The survey sample should have included more residents who are dog owners."}, {"label": "C", "body": "The survey sample should have consisted entirely of residents who do not own dogs."}, {"label": "D", "body": "The survey sample is biased because it is not representative of all city residents."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The members of the city council wanted to assess opinions of all city residents. To gather an unbiased sample, the council
should have used a random sampling design to select subjects from all city residents. The given survey introduced a sampling bias because the
500 city residents surveyed were all dog owners. This sample is not representative of all city residents because not all city residents are dog
owners.
Choice A is incorrect because when the sampling method isn’t random, there is no guarantee that the survey results will be reliable; hence, they
cannot be generalized to the entire population. Choice B is incorrect because a larger sample of residents who are dog owners would not correct
the sampling bias. Choice C is incorrect because a survey sample of entirely non–dog owners would likely have a biased opinion, just as a
sample of dog owners would likely have a biased opinion.$qb$);
select seed_pool_question($qb$CB-fa7a0164$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The table below shows the high and low temperatures in Houston, Texas, during a five-day period.
What was the mean low temperature, in degrees Fahrenheit, during the five-day period?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fa7a0164.png$qb$, $qb$[{"label": "A", "body": "48.8"}, {"label": "B", "body": "49"}, {"label": "C", "body": "59"}, {"label": "D", "body": "59.1"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The mean low temperature can be calculated by finding the sum of the low temperatures for all the days shown in the table,
49 + 37 + 41 + 54 + 63 = 244, and then dividing the sum by the number of days the temperature was recorded, .
Choice B is incorrect. This may be the result of choosing the median rather than calculating the mean. Choices C and D are incorrect and may be
the result of calculation errors.$qb$);
select seed_pool_question($qb$CB-40e7a1a9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$210 is p% greater than 30. What is the value of p?$qb$, null, null, null, array[$qb$600$qb$]::text[], $qb$The correct answer is 600. It’s given that 210 is p% greater than 30. It follows that 210 = (1 + p/1o0) (30). Dividing both sides of this equation
by 30 yields 7 = 1 + p/1o0 . Subtracting 1 from both sides of this equation yields 6 = p/10o . Multiplying both sides of this equation by 100 yields
p = 600. Therefore, the value of p is 600.$qb$);
select seed_pool_question($qb$CB-708590d7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following statements correctly compares the means of data set A and data set B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-708590d7.png$qb$, $qb$[{"label": "A", "body": "The mean of each data set is 2."}, {"label": "B", "body": "The mean of each data set is 4."}, {"label": "C", "body": "The mean of data set A is less than the mean of data set B."}, {"label": "D", "body": "The mean of data set A is greater than the mean of data set B."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The mean of a data set is found by dividing the sum of the values in the data set by the number of values in the data set.
Therefore, the mean of data set A is , or 4. The mean of data set B is
, or approximately 2.2857. Therefore, the mean of data set A is greater than the mean of data set B.
Alternate approach: Data set A and data set B are both ordered from least to greatest value. Besides the first value in each data set, which is 1,
each value in ordered data set B is less than the respective value in ordered data set A. Therefore, conceptually, the mean of data set A must be
greater than the mean of data set B.
Choices A, B, and C are incorrect and may result from various misconceptions or miscalculations.$qb$);
select seed_pool_question($qb$CB-bf47ad54$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Each of the following frequency tables represents a data set. Which data set has the greatest mean?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bf47ad54.png$qb$, $qb$[{"label": "A", "body": "Value Frequency 90/(|-100 ?)|||| ????-/46/(-7 |)||||"}, {"label": "B", "body": "Value Frequency -/7090/(|-100 ?)|||| ????-/66/(-^(6) |)||||"}, {"label": "C", "body": "Value Frequency 90/(|-100 ?)|||| ????6/(-7 |)||||"}, {"label": "D", "body": "Value Frequency 90/(|-100 ?)|||| ????5/(-^(8) |)||||"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The tables in choices B, C, and D each represent a data set where the values 80 and 90 have the same frequency and the
values 70 and 100 have the same frequency. It follows that each of these data sets is symmetric around the value halfway between 80 and 90,
or 85. When a data set is symmetric around a value, that value is the mean of the data set. Therefore, the data sets represented by the tables in
choices B, C, and D each have a mean of 85. The table in choice A represents a data set where the value 90 has a greater frequency than the
value 80 and the value 100 has a greater frequency than the value 70. It follows that this data set has a mean greater than 85. Therefore, of the
given choices, choice A represents the data set with the greatest mean.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a6b2fcce$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$According to the line graph above, between which two consecutive years was there the greatest change in the number of 3‑D movies released?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a6b2fcce.png$qb$, $qb$[{"label": "A", "body": "2003–2004"}, {"label": "B", "body": "2008–2009"}, {"label": "C", "body": "2009–2010"}, {"label": "D", "body": "2010–2011"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The change in the number of 3-D movies released between any two consecutive years can be found by first estimating the
number of 3-D movies released for each of the two years and then finding the positive difference between these two estimates. Between 2003
and 2004, this change is approximately  movies; between 2008 and 2009, this change is approximately  movies;
between 2009 and 2010, this change is approximately  movies; and between 2010 and 2011, this change is approximately
movies. Therefore, of the pairs of consecutive years in the choices, the greatest increase in the number of 3-D movies released
occurred during the time period between 2010 and 2011.
Choices A, B, and C are incorrect. Between 2010 and 2011, approximately 20 more 3-D movies were released. The change in the number of 3-D
movies released between any of the other pairs of consecutive years is significantly smaller than 20.$qb$);
select seed_pool_question($qb$CB-699af7b3$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The weight of sample A is 468% of the weight of sample B, and the weight of sample A is 0·780% of the weight of sample C. If the weight of
sample C is p% of the weight of sample B, what is the value of p?$qb$, null, null, null, array[$qb$60000$qb$]::text[], $qb$The correct answer is 60,000. It’s given that the weight of sample A is 468% of the weight of sample B and 0·780% of the weight of sample C.
Let the weight of sample B be b and the weight of sample C be c. Then, the weight of sample A is equivalent to 468b/1o0, or 4·68b, and also
equivalent to (o·780c)/100 , or 0·00780c. Setting these expressions equal to each other yields 4·68b = 0·00780c. Dividing both sides of this equation
by 0·00780 yields (4·68b)/(0·0078o) = c, or c = 600b. If the weight of sample C is p% of the weight of sample B, then . Since c = 600b and c
60c,0=00p/(1=o0)pb
, it follows that 600b = p/1o0b, or 600 = p/100. Multiplying both sides of this equation by 100 yields . Therefore, the value of p
=6p/(10o,00)b00
is .$qb$);
select seed_pool_question($qb$CB-f52123e0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$23, 27273235, , , , 36, 52
What is the range of the 7 scores shown?$qb$, null, null, null, array[$qb$29$qb$]::text[], $qb$The correct answer is 29. The range of a data set is the difference between its maximum value and its minimum value. For the data set shown,
the maximum score is 52 and the minimum score is 23. The difference between those scores is 52 - 23, or 29. Therefore, the range of the 7
scores shown is 29.$qb$);
select seed_pool_question($qb$CB-06a152cd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$To make a bakery’s signature chocolate muffins, a baker needs 2.5 ounces of chocolate for each muffin. How many pounds of chocolate are-
needed to make 48 signature chocolate muffins? (1 pound = 16 ounces)$qb$, null, $qb$[{"label": "A", "body": "7.5"}, {"label": "B", "body": "10"}, {"label": "C", "body": "50.5"}, {"label": "D", "body": "120"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. If 2.5 ounces of chocolate are needed for each muffin, then the number of ounces of chocolate needed to make 48 muffins
is  ounces. Since 1 pound = 16 ounces, the number of pounds that is equivalent to 120 ounces is pounds.
Therefore, 7.5 pounds of chocolate are needed to make the 48 muffins.
Choice B is incorrect. If 10 pounds of chocolate were needed to make 48 muffins, then the total number of ounces of chocolate needed would be
ounces. The number of ounces of chocolate per muffin would then be ounces per muffin, not 2.5 ounces per
muffin. Choices C and D are also incorrect. Following the same procedures as used to test choice B gives 16.8 ounces per muffin for choice C
and 40 ounces per muffin for choice D, not 2.5 ounces per muffin. Therefore, 50.5 and 120 pounds cannot be the number of pounds needed to
make 48 signature chocolate muffins.$qb$);
select seed_pool_question($qb$CB-7d68096f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A trivia tournament organizer wanted to study the relationship between the number of points a team scores in a trivia round and the number of
hours that a team practices each week. For the study, the organizer selected 55 teams at random from all trivia teams in a certain tournament.
The table displays the information for the  teams in the sample that practiced for at least  hours per week.
Number of points per round
Hours
practiced 14 or more
6 to 13 points Total
points
(|-)/(||--||)|| |||-/|-/(--||)(-3)/(||)| -/(||)|
3 to 5 hours 6 4 10
More than 5
4 26 30
hours
Total 10 30 40
Which of the following is the largest population to which the results of the study can be generalized?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7d68096f.png$qb$, $qb$[{"label": "A", "body": "All trivia teams in the tournament that scored 14 or more points in the round"}, {"label": "B", "body": "The 55 trivia teams in the sample"}, {"label": "C", "body": "The 40 trivia teams in the sample that practiced for at least 3 hours per week"}, {"label": "D", "body": "All trivia teams in the tournament"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the organizer selected 55 teams at random from all trivia teams in the tournament. A table is also given
displaying the information for the 40 teams in the sample that practiced for at least 3 hours per week. Selecting a sample of a reasonable size at
random to use for a survey allows the results from that survey to be applied to the population from which the sample was selected, but not
beyond this population. Thus, only the sampling method information is necessary to determine the largest population to which the results of the
study can be generalized. Since the organizer selected the sample at random from all trivia teams in the tournament, the largest population to
which the results of the study can be generalized is all trivia teams in the tournament.
Choice A is incorrect. The sample was selected at random from all trivia teams in the tournament, not just from the teams that scored an
average of 14 or more points per round.
Choice B is incorrect. If a study uses a sample selected at random from a population, the results of the study can be generalized to the
population, not just the sample.
Choice C is incorrect. If a study uses a sample selected at random from a population, the results of the study can be generalized to the
population, not just a subset of the sample.$qb$);
select seed_pool_question($qb$CB-7760c516$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Each value in the data set shown represents the height, in centimeters, of a plant.
6, 1013, , 2, 1522, , 10444, , ,
What is the mean height, in centimeters, of these plants?$qb$, null, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. The mean of a data set is the sum of the values in the data set divided by the number of values in the data set. It follows
that the mean height, in centimeters, of these plants is the sum of the heights, in centimeters, of each plant,
6 + 10 + 13 + 2 + 15 (+902)/10 2 + 10
+ 4 + 4 + 4, or 90, divided by the number of plants in the data set, 10. Therefore, the mean height, in centimeters, of these plants is , or 9.$qb$);
select seed_pool_question($qb$CB-8917ce38$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following speeds is equivalent to 90 kilometers per hour? (1 kilometer = 1,000 meters)$qb$, null, $qb$[{"label": "A", "body": "25 meters per second"}, {"label": "B", "body": "32 meters per second"}, {"label": "C", "body": "250 meters per second"}, {"label": "D", "body": "324 meters per second"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since 1 kilometer is equal to 1,000 meters, it follows that 90 kilometers is equal to  meters. Since 1
hour is equal to 60 minutes and 1 minute is equal to 60 seconds, it follows that 1 hour is equal to  seconds. Now
is equal to , which reduces to  or 25 meters per second.
Choices B, C, and D are incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f4b3672a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A certain forest is 253 acres. To estimate the number of trees in the forest, a ranger randomly selects 5 different 1-acre parcels in the forest and
determines the number of trees in each parcel. The numbers of trees in the sample acres are 51, 59, 45, 52, and 73. Based on the mean of the
sample, which of the following ranges contains the best estimate for the number of trees in the entire forest?$qb$, null, $qb$[{"label": "A", "body": "11,000 to 12,000"}, {"label": "B", "body": "12,500 to 13,500"}, {"label": "C", "body": "13,500 to 14,500"}, {"label": "D", "body": "18,000 to 19,000"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The mean of the 5 samples is  trees per acre. The best estimate for the total number of
trees in the forest is the product of the mean number of trees per acre in the sample and the total number of acres in the forest. This is (56)(253)
= 14,168, which is between 13,500 and 14,500.
Choice A is incorrect and may result from multiplying the minimum number of trees per acre in the sample, 45, by the number of acres, 253.
Choice B is incorrect and may result from multiplying the median number of trees per acre in the sample, 52, by the number of acres, 253. Choice
D is incorrect and may result from multiplying the maximum number of trees per acre in the sample, 73, by the number of acres, 253.$qb$);
select seed_pool_question($qb$CB-40f0ee70$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Time
Task
(minutes)
I 5
II 2
-/(|-)||| |||| ????
III 15
IV 9
V 9
The table shows the amount of time it took Robert to complete each of the  tasks in a project. What was the mean time, in minutes, for Robert
to complete a task for this project?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-40f0ee70.png$qb$, null, null, array[$qb$8$qb$]::text[], $qb$The correct answer is 8. The mean of a data set is the sum of the values in the data set divided by the number of values in the data set. It's given
in the table that the times, in minutes, it took Robert to complete each of the tasks are 52, , 15, 9, and 9. The sum of these times is 5 + 2 + 15
+ 9 + 9, or 40, minutes. There are 5 tasks in the project. Therefore, the mean time, in minutes, for Robert to complete a task for this project is
40 ? 5, or 8.$qb$);
select seed_pool_question($qb$CB-374b18f9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The number of acres of useful timberland in 13 counties in California is summarized in the box plot above. Which of the following is closest to
the median number of acres?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-374b18f9.png$qb$, $qb$[{"label": "A", "body": "4,399"}, {"label": "B", "body": "7,067"}, {"label": "C", "body": "8,831"}, {"label": "D", "body": "10,595"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The median of the data summarized by a box plot is the value associated with the vertical line segment within the box.
According to the box plot shown, this value is slightly greater than 7,000. Therefore, the closest value for the median number of acres is 7,067.
Choice A is incorrect. This is the value associated with the vertical line segment forming the left-hand side of the box. Choice C is incorrect. This
value is greater than the value associated with the vertical line segment within the box. Choice D is incorrect. This is the value associated with
the vertical line segment forming the right-hand side of the box.$qb$);
select seed_pool_question($qb$CB-4ff597db$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The mean amount of time that the 20 employees of a construction company have worked for the company is 6.7 years. After one of the
employees leaves the company, the mean amount of time that the remaining employees have worked for the company is reduced to 6.25 years.
How many years did the employee who left the company work for the company?$qb$, null, $qb$[{"label": "A", "body": "0.45"}, {"label": "B", "body": "2.30"}, {"label": "C", "body": "9.00"}, {"label": "D", "body": "15.25"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The mean amount of time that the 20 employees worked for the company is 6.7 years. This means that the total number of
years all 20 employees worked for the company is (6.7)(20) = 134 years. After the employee left, the mean amount of time that the remaining 19
employees worked for the company is 6.25 years. Therefore, the total number of years all 19 employees worked for the company is (6.25)(19) =
118.75 years. It follows that the number of years that the employee who left had worked for the company is 134 – 118.75 = 15.25 years.
Choice A is incorrect; this is the change in the mean, which isn’t the same as the amount of time worked by the employee who left. Choice B is
incorrect and likely results from making the assumption that there were still 20 employees, rather than 19, at the company after the employee left
and then subtracting the original mean of 6.7 from that result. Choice C is incorrect and likely results from making the assumption that there
were still 20 employees, rather than 19, at the company after the employee left.$qb$);
select seed_pool_question($qb$CB-ec787383$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A distance of 61 furlongs is equivalent to how many feet? (1furI0ng = 220yardSand1yard = 3feet)$qb$, null, null, null, array[$qb$40260$qb$]::text[], $qb$The correct answer is 40,260. It's given that 1furIong = 220yardS and 1yard = 3feet. It follows that a distance of 61 furlongs is
equivalent to (61 furIongS) ( 22oyard8/1fur10ng ) ( 3fcet/1yard ) , or 40,260 feet.$qb$);
select seed_pool_question($qb$CB-7e6c745f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Food Protein Cost
?? || ?? ||1 large egg 6 grams $0.36
1 cup of milk 8 grams $0.24
The table above shows the amount of protein in two foods and the cost of each food. Based on the table, what is the ratio of the cost per gram
of protein in a large egg to the cost per gram of protein in a cup of milk?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7e6c745f.png$qb$, $qb$[{"label": "A", "body": "1 : 2"}, {"label": "B", "body": "2 : 3"}, {"label": "C", "body": "3 : 4"}, {"label": "D", "body": "2 : 1"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The cost per gram of protein in 1 large egg is $0.36 ÷ 6 = $0.06. The cost per gram of protein in 1 cup of milk is $0.24 ÷ 8 =
$0.03. It follows that the ratio of the cost per gram of protein in a large egg to the cost per gram of protein in a cup of milk is 0.06:0.03, which can
be rewritten as 2:1.
Choice A is incorrect and may result from finding the ratio of the cost per gram of protein in a cup of milk to the cost per gram of protein in a
large egg (the reciprocal of the ratio specified in the question). Choices B and C are incorrect and may result from incorrectly calculating the unit
rates or from errors made when simplifying the ratio.$qb$);
select seed_pool_question($qb$CB-7b52985c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between the length of time y, in hours, a certain bird spent in flight and the number of days after January
11, x.
??
?^(?)?O?S?
f?tmOe 10121416II11II1124680044446666222288?(?? ?? ?? ?? ?? ?? ??)/(222 444 666 888 10II00)| || || || || || |x
??tne?
?a?Sa?ter ?anuar? 1I
What is the average rate of change, in hours per day, of the length of time the bird spent in flight on January 13 to the length of time the bird
spent in flight on January 15?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7b52985c.png$qb$, null, null, array[$qb$4.5$qb$, $qb$9/2$qb$]::text[], $qb$The correct answer is 9/2 . It's given that the scatterplot shows the relationship between the length of time y, in hours, a certain bird spent in flight
and the number of days after January 11, x. Since January 13 is 2 days after January 11, it follows that January 13 corresponds to an x-value of
2 in the scatterplot. In the scatterplot, when x = 2, the corresponding value of y is 6. In other words, on January 13, the bird spent 6 hours in
flight. Since January 15 is 4 days after January 11 , it follows that January 15 corresponds to an x-value of 4 in the scatterplot. In the scatterplot,
when x = 4, the corresponding value of y is 15. In other words, on January 15, the bird spent 15 hours in flight. Therefore, the average rate of
change, in hours per day, of the length of time the bird spent in flight on January 13 to the length of time the bird spent in flight on January 15 is
the difference in the length of time, in hours, the bird spent in flight divided by the difference in the number of days after January 11 , or (15-6)/(4-2) ,
which is equivalent to 9/2 . Note that 9/2 and 4.5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-7ce2830a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A psychologist designed and conducted a study to determine whether playing a certain educational game increases middle school students’
accuracy in adding fractions. For the study, the psychologist chose a random sample of 35 students from all of the students at one of the middle
schools in a large city. The psychologist found that students who played the game showed significant improvement in accuracy when adding
fractions. What is the largest group to which the results of the study can be generalized?$qb$, null, $qb$[{"label": "A", "body": "The 35 students in the sample"}, {"label": "B", "body": "All students at the school"}, {"label": "C", "body": "All middle school students in the city"}, {"label": "D", "body": "All students in the city"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The largest group to which the results of a study can be generalized is the population from which the random sample was
chosen. In this case, the psychologist chose a random sample from all students at one particular middle school. Therefore, the largest group to
which the results can be generalized is all the students at the school.
Choice A is incorrect because this isn’t the largest group the results can be generalized to. Choices C and D are incorrect because these groups
are larger than the population from which the random sample was chosen. Therefore, the sample isn’t representative of these groups.$qb$);
select seed_pool_question($qb$CB-12dbe3de$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A store received a shipment of 1,000 MP3 players, 4 of which were defective. If an MP3 player is randomly selected from this shipment, what is
the probability that it is defective?$qb$, null, $qb$[{"label": "A", "body": "0.004"}, {"label": "B", "body": "0.04"}, {"label": "C", "body": "0.4"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The probability of randomly selecting a defective MP3 player from the shipment is equal to the number of defective MP3
players divided by the total number of MP3 players in the shipment. Therefore, the probability is , which is equivalent to 0.004.
Choice B is incorrect because 0.04 represents 4 defective MP3 players out of 100 rather than out of 1,000. Choice C is incorrect because 0.4
represents 4 defective MP3 players out of 10 rather than out of 1,000. Choice D is incorrect. This is the number of defective MP3 players in the
shipment.$qb$);
select seed_pool_question($qb$CB-709e04de$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The value of z is 1·13 times 100. The value of z is what percent greater than 100?$qb$, null, $qb$[{"label": "A", "body": "11·3"}, {"label": "B", "body": "13"}, {"label": "C", "body": "130"}, {"label": "D", "body": "213"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the value of z is 1·13 times 100. This can be written as , which is equivalent to z
z = (1·1133%)(100)
= (1 + 0·13)(100) , or z = (1 + 13/100) (100) . It follows that the value of z is 100% of 100 plus  of 100. Therefore, the value of z is 13%
greater than 100.
Choice A is incorrect. This gives a value of z that is 1·113, not 1·13, times 100.
Choice C is incorrect. This gives a value of z that is 2·30, not 1·13, times 100.
Choice D is incorrect. This gives a value of z that is 3·13, not 1·13, times 100.$qb$);
select seed_pool_question($qb$CB-642519d7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A polling agency recently surveyed 1,000 adults who were selected at random from a large city and asked each of the adults, “Are you satisfied
with the quality of air in the city?” Of those surveyed, 78 percent responded that they were satisfied with the quality of air in the city. Based on the
results of the survey, which of the following statements must be true?
1. Of all adults in the city, 78 percent are satisfied with the quality of air in the city.
2. If another 1,000 adults selected at random from the city were surveyed, 78 percent of them would report they are satisfied with the
quality of air in the city.
3. If 1,000 adults selected at random from a different city were surveyed, 78 percent of them would report they are satisfied with the quality
of air in the city.$qb$, null, $qb$[{"label": "A", "body": "None"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II only"}, {"label": "D", "body": "I and III only"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Statement I need not be true. The fact that 78% of the 1,000 adults who were surveyed responded that they were satisfied
with the air quality in the city does not mean that the exact same percentage of all adults in the city will be satisfied with the air quality in the city.
Statement II need not be true because random samples, even when they are of the same size, are not necessarily identical with regard to
percentages of people in them who have a certain opinion. Statement III need not be true for the same reason that statement II need not be true:
results from different samples can vary. The variation may be even bigger for this sample since it would be selected from a different city.
Therefore, none of the statements must be true.
Choices B, C, and D are incorrect because none of the statements must be true.$qb$);
select seed_pool_question($qb$CB-0108ac2d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$At a large high school, 300 students were selected at random and were asked in a survey about a menu change in the school cafeteria. All 300
students completed the survey. It was estimated that 38% of the students were in support of a menu change, with a margin of error of 5.5%.
Which of the following is the best interpretation of the survey results?$qb$, null, $qb$[{"label": "A", "body": "The percent of the students at the school who support a menu change is 38%."}, {"label": "B", "body": "The percent of the students at the school who support a menu change is greater than 38%."}, {"label": "C", "body": "Plausible values of the percent of the students at the school who support a menu change are between 32.5% and 43.5%."}, {"label": "D", "body": "Plausible values of the number of the students at the school who support a menu change are between 295 and 305."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that an estimated 38% of sampled students at the school were in support of a menu change, with a margin of error
of 5.5%. It follows that the percent of the students at the school who support a menu change is 38% plus or minus 5.5%. The lower bound of this
estimation is , or 32.5%. The upper bound of this estimation is , or 43.5%. Therefore, plausible values of the percent of the
students at the school who support a menu change are between 32.5% and 43.5%.
Choice A is incorrect. This is the percent of the sampled students at the school who support a menu change. Choices B and D are incorrect and
may result from misinterpreting the margin of error.$qb$);
select seed_pool_question($qb$CB-949cd96b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The length of the base of a certain parallelogram is 89% of the height of the parallelogram. Which expression represents the length of the base
of the parallelogram, where h is the height of the parallelogram?$qb$, null, $qb$[{"label": "A", "body": "89h"}, {"label": "B", "body": "0·089h"}, {"label": "C", "body": "8·9h"}, {"label": "D", "body": "0·89h"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the length of the base of the parallelogram is 89% of the height of the parallelogram. Since h is the height of
the parallelogram, it follows that the length of the base of the parallelogram can be represented by the expression 89/1o0 h, or 0·89h.
Choice A is incorrect. This expression represents 8,900%, not 89%, of the height of the parallelogram.
Choice B is incorrect. This expression represents 8·9%, not 89%, of the height of the parallelogram.
Choice C is incorrect. This expression represents 890%, not 89%, of the height of the parallelogram.$qb$);
select seed_pool_question($qb$CB-28c6bd8c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The table above shows a summary of 1,200 responses to a survey question. Based on the table, how many of those surveyed get most of their
medical information from either a doctor or the Internet?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-28c6bd8c.png$qb$, $qb$[{"label": "A", "body": "865"}, {"label": "B", "body": "887"}, {"label": "C", "body": "912"}, {"label": "D", "body": "926"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. According to the table, 63% of survey respondents get most of their medical information from a doctor and 13% get most of
their medical information from the Internet. Therefore, 76% of the 1,200 survey respondents get their information from either a doctor or the
Internet, and 76% of 1,200 is 912.
Choices A, B, and D are incorrect. According to the table, 76% of survey respondents get their information from either a doctor or the Internet.
Choice A is incorrect because 865 is about 72% (the percent of survey respondents who get most of their medical information from a doctor or
from magazines/brochures), not 76%, of 1,200. Choice B is incorrect because 887 is about 74%, not 76%, of 1,200. Choice D is incorrect because
926 is about 77%, not 76%, of 1,200.$qb$);
select seed_pool_question($qb$CB-912cd125$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For a science project, Anka recorded whether it rained each weekday and weekend day for 12 weeks. Her results are summarized in the table
below.
Weekday and Weekend Day Rain for 12 Weeks
Rain No rain Total
Number of weekdays 12 48 60
||| ||| ||| ||| ???
Number of weekend days 8 16 24
Total 20 64 84
If one of the days on which there was no rain is selected at random, what is the probability the day was a weekend day?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-912cd125.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. There were 64 days with no rain. It was a weekend day for 16 of those 64 days. So 16 out of 64 of the days with no rain were
weekend days. Because the day is selected at random, each day has an equal chance of being selected, so the probability is .
Choice A is incorrect. It is the probability that a day selected at random from any one of the days during the 12 weeks is a weekend day with no
rain. Choice C is incorrect. It is the probability that a day selected at random from the weekend days has no rain. Choice D is incorrect. It is the
probability that a day selected at random from the days with no rain is a weekday.$qb$);
select seed_pool_question($qb$CB-3a6ed720$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Of 900,000 beads, 828,000 are silver. What percentage of the beads are silver?$qb$, null, $qb$[{"label": "A", "body": "8%"}, {"label": "B", "body": "36%"}, {"label": "C", "body": "72%"}, {"label": "D", "body": "92%"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The proportion of the beads that are silver can be written as (828,o00)/(9o0,o00) , or 0·92. Therefore, the percentage of the beads that are
silver is 0·92(100) , or 92%.
Choice A is incorrect. This is the percentage of the beads that are not silver.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ad7dbb22$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$101124680044662288?-/(-| 222| | 444| | 666| | 888| | 10II00|)(- ?)/?-/?(- ?)/?| ??| ? | | || | | | | | | |x
The scatterplot shows the relationship between two variables, x and y. A line of best fit is also shown. For how many of the 11 data points does
the line of best fit predict a greater y-value than the actual y-value?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ad7dbb22.png$qb$, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. The line of best fit predicts a greater y-value than the actual y-value for any data point that's located below the line of
best fit. For the scatterplot shown, 6 of the data points are below the line of best fit. Therefore, the line of best fit predicts a greater y-value than
the actual y-value for 6 of the data points.$qb$);
select seed_pool_question($qb$CB-85b33aa8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A fish swam a distance of 5,104 yards. How far did the fish swim, in miles?- (1miIe = 1,760yardS)$qb$, null, $qb$[{"label": "A", "body": "0·3"}, {"label": "B", "body": "2·9"}, {"label": "C", "body": "3,344"}, {"label": "D", "body": "6,864"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the fish swam  yards and that 1 mile is equal to 1,760 yards. Therefore, the fish swam
5,(15,01044)/(1,76o) mi1eS
5, 104 yardS ( 1miIc/(1,76oyardS) ) , which is equivalent to , or 2·9 miles.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-284303f1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are 250 trees in a park. Of these trees, 6% are birch trees. How many birch trees are in the park?$qb$, null, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "15"}, {"label": "C", "body": "75"}, {"label": "D", "body": "244"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that there are 250 trees in a park and of these trees, 6% are birch trees. The number of birch trees in the park can
be calculated by multiplying the number of trees in the park by 6/100 . Therefore, the number of birch trees in the park is 250(6/1o0) , or 15.
Choice A is incorrect. This is the percentage of trees in the park that are birch trees, not the number of birch trees in the park.
Choice C is incorrect. This is 30%, not 6%, of 250.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ba61d95f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The population of Greenville increased by 7% from 2015 to 2016. If the 2016 population is k times the 2015 population, what is the value of k?$qb$, null, $qb$[{"label": "A", "body": "0·07"}, {"label": "B", "body": "0·7"}, {"label": "C", "body": "1·07"}, {"label": "D", "body": "1·7"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Let x be the 2015 population of Greenville. It's given that the population increased by 7% from 2015 to 2016. The increase in
population can be written as (0·07)x. The 2016 population of Greenville is given as the sum of the 2015 population of Greenville and the
increase in population from 2015 to 2016. This can be rewritten as x + (0·07)x, or 1·07x. Therefore, the value of k is 1·07.
Choice A is incorrect. This is the percent, represented as a decimal, that the population increased from 2015 to 2016, not the value of k.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of k if the population increased by 70%, not 7%, from 2015 to 2016.$qb$);
select seed_pool_question($qb$CB-873d2838$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The population density of Cedar County is 230 people per square mile. The county has a population of 85,100 people. What is the area, in
square miles, of Cedar County?$qb$, null, null, null, array[$qb$370$qb$]::text[], $qb$The correct answer is 370. It’s given that the population density of Cedar County is 230 people per square mile and the county has a population
of 85,100 people. Based on the population density, it follows that the area of Cedar County is (85, 100 Pe0PIe) ( (1 8quare mi1e)/23oPc0PIc ) , or 370 square
miles.$qb$);
select seed_pool_question($qb$CB-16988f9c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y.
101124680044662288?-/(-| 222| | 444| | 666| | 888| | 10II00|)| ??| | ??| | ??| | ??| | ??| | |x
Which equation is the most appropriate linear model for this relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-16988f9c.png$qb$, $qb$[{"label": "A", "body": "y = -0·9x - 2·2"}, {"label": "B", "body": "y = -0·9x + 2·2"}, {"label": "C", "body": "y = -0·9x"}, {"label": "D", "body": "y = 0·9x + 2·2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A linear model can be written in the form y = mx + b, where m is the slope of the graph of the model in the xy-plane and
(0, b) is the y-intercept. The graph of an appropriate linear model for this relationship passes near the points  and  in the xy-plane.
m( 1 ,=3) (y2-yI()/(x2 -x1)9, 10)
Two points on a line,  and , can be used to find the slope of the line using the slope formula, . Substituting the points
(x(x11, y, y1 )1 ) (x(x22, y, y22) )
(1, 3) and (9, 10) for  and , respectively, in the slope formula yields , or m = 0·875. Therefore, the value of m for an
y = mxm+=b(1o-3)/(9-1)
appropriate linear model is approximately 0·875. Substituting 0·875 for m in  yields y = 0·875x + b. Since an appropriate linear
model passes near the point , the approximate value of b can be found by substituting 1 for x and 3 for y in the equation y = 0·875x + b,
3 = (0·875)(1)(+1^(,) 3b)
which yields , or 3 = 0·875 + b. Subtracting 0·875 from both sides of this equation yields 2·125 = b. Therefore, the value
of b for an appropriate linear model is approximately 2·125. Thus, of the given choices, y = 0·9x + 2·2 is the most appropriate linear model for
this relationship.
Alternate approach: A linear model can be written in the form y = mx + b, where m is the slope of the graph of the model in the xy-plane and
(0, b) is the y-intercept. The scatterplot shows that as the x-values of the data points increase, the y-values of the data points increase, which
means the graph of an appropriate linear model has a positive slope. Of the given choices, y = 0·9x + 2·2 is the only linear model whose graph
has a positive slope.
Choice A is incorrect. The graph of this model has a negative slope, not a positive slope.
Choice B is incorrect. The graph of this model has a negative slope, not a positive slope.
Choice C is incorrect. The graph of this model has a negative slope, not a positive slope.$qb$);
select seed_pool_question($qb$CB-2cdefcb1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What length, in centimeters, is equivalent to a length of - 51 meters? ( 1 meter = 100 centimeterS)$qb$, null, $qb$[{"label": "A", "body": "0·051"}, {"label": "B", "body": "0·51"}, {"label": "C", "body": "5,100"}, {"label": "D", "body": "51,000"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since 1 meter is equal to 100 centimeters, 51 meters is equal to 5 1 meterS ( (1o0 centimctcr8)/(1 metcr) ) , or 5,100 centimeters.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from dividing, rather than multiplying, 51 by 100.
Choice D is incorrect. This is the length, in millimeters rather than centimeters, that is equivalent to a length of 51 meters.$qb$);
select seed_pool_question($qb$CB-6a715bed$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The table summarizes the distribution of age and assigned group for 90 participants in a study.
0–9 10– 19 20+
Total
years years years
Group A 7 14 9 30
||| ||| ||| ??? ||| ???
Group B 6 4 20 30
Group C 17 12 1 30
Total 30 30 30 90
One of these participants will be selected at random. What is the probability of selecting a participant from group A, given that the participant is
at least 10 years of age? (Express your answer as a decimal or fraction, not as a percent.)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6a715bed.png$qb$, null, null, array[$qb$.3833$qb$, $qb$23/60$qb$]::text[], $qb$The correct answer is 23/60 . It's given that one of the participants will be selected at random. The probability of selecting a participant from group
A given that the participant is at least 10 years of age is the number of participants in group A who are at least 10 years of age divided by the
total number of participants who are at least 10 years of age. The table shows that in group A, there are 14 participants who are 10– 19 years of
age and 9 participants who are 20+ years of age. Therefore, there are 14 + 9, or 23, participants in group A who are at least 10 years of age.
The table also shows that there are a total of 30 participants who are 10–19 years of age and 30 participants who are 20+ years of age.
Therefore, there are a total of 30 + 30, or 60, participants who are at least 10 years of age. It follows that the probability of selecting a
participant from group A given that the participant is at least 10 years of age is 23/60. Note that 23/60, .3833, and 0.383 are examples of ways to
enter a correct answer.$qb$);
select seed_pool_question($qb$CB-8cbf1415$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In a group, 40% of the items are red. Of all the red items in the group, 30% also have stripes. What percentage of the items in the group are red
with stripes?$qb$, null, $qb$[{"label": "A", "body": "10%"}, {"label": "B", "body": "12%"}, {"label": "C", "body": "70%"}, {"label": "D", "body": "75%"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that in a group, 40% of the items are red. It follows that the number of red items in the group can be represented
by 0·4x, where x represents the total number of items in the group. It’s also given that of all the red items in the group, 30% also have stripes. It
follows that the number of items in the group that are red and have stripes can be represented by 0·3(0·4x) , or 0·12x. The expression 0·12x
represents 12% of x. Since x represents the total number of items in the group, it follows that 12% of the items in the group are red and have
stripes.
Choice A is incorrect and may result from subtracting 30% from 40% rather than calculating 30% of 40%.
Choice C is incorrect and may result from adding 30% and 40% rather than calculating 30% of 40%.
Choice D is incorrect and may result from calculating the percentage that 30% is of 40% rather than calculating 30% of 40%.$qb$);
select seed_pool_question($qb$CB-58ba7239$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number a is 55% less than the number b. The number b is 320% greater than 160. What is the value of a?$qb$, null, null, null, array[$qb$1512/5$qb$, $qb$302.4$qb$]::text[], $qb$The correct answer is 302·4. It’s given that the number b is 320% greater than 160. It follows that b is equal to 160 plus 320% of 160, which
can be written as b = 160 + 3·2(160), or b = 672. It’s also given that the number a is 55% less than the number b. It follows that a is equal to
b minus 55% of b, which can be written as a = b - 0·55b, or a = 0·45b. Substituting 672 for b in this equation yields a = 0·45(672), or a
= 302·4.$qb$);
select seed_pool_question($qb$CB-c7c6445f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A certain town has an area of 4·36 square miles. What is the area, in square yards, of this town? - (1miIe = 1,760yardS)$qb$, null, $qb$[{"label": "A", "body": "404"}, {"label": "B", "body": "7,674"}, {"label": "C", "body": "710,459"}, {"label": "D", "body": "13,505,536"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the number of yards in 1 mile is 1,760, the number of square yards in 1 square mile is (1,760)(1,760) = 3,097,600.
Therefore, if the area of the town is 4·36 square miles, it is 4·36(3,097,600) = 13,505,536, in square yards.
Choice A is incorrect and may result from dividing the number of yards in a mile by the square mileage of the town.
Choice B is incorrect and may result from multiplying the number of yards in a mile by the square mileage of the town.
Choice C is incorrect and may result from dividing the number of square yards in a square mile by the square mileage of the town.$qb$);
select seed_pool_question($qb$CB-c54b92a2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A study was conducted on the production rates for a company that produces tractor wheels. The table below shows the number of wheels made
during 11 consecutive one-hour production periods.
Number
One- of
hour wheels
period made
A 24
B 24
C 21
D 21
|||||||||| ?????????? ||||||||||
E 21
F 19
G 24
H 24
I 19
J 22
K 23
What is the range of the number of wheels made for the 11 one-hour periods?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c54b92a2.png$qb$, $qb$[{"label": "A", "body": "5.5"}, {"label": "B", "body": "5.0"}, {"label": "C", "body": "4.5"}, {"label": "D", "body": "4.0"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Range is defined as the difference between the greatest and least values from a set of data. The greatest number of wheels
made during a one-hour period was 24 wheels. The least number of wheels was 19. Hence, the range is , or 5.0.
Choices A, C, and D are incorrect and may be the result of arithmetic errors or incorrectly identifying the greatest or least number of wheels made
during a one-hour period.$qb$);
select seed_pool_question($qb$CB-3c5b19ef$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot above shows the number of visitors to a railroad museum in Pennsylvania each year from 1968 to 1980, where t is the number of
years since 1968 and n is the number of visitors. A line of best fit is also shown. Which of the following could be an equation of the line of best fit
shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3c5b19ef.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. An equation of a line of best fit can be written in the form , where a is the y-intercept of the line and b is the
slope. In the scatterplot shown, the line of best fit intersects the y-axis just over halfway between 10,000 and 20,000, or approximately 16,000.
The line of best fit also intersects the graph at . Using the slope formula  and two points that lie on the graph such
as  and , the slope can be approximated as , or 4,800. Only choice A has a y-intercept near the
estimate of 16,000 and a slope near the estimate of 4,800. Therefore, an equation of the line of best fit could be .
Choice B is incorrect because the values for the slope and the y-coordinate of the y-intercept are switched. Choice C is incorrect because the
value for the slope is approximately double the actual slope. Choice D is incorrect because the values for the slope and the y-intercept are
switched and because the slope is approximately double the actual slope.$qb$);
select seed_pool_question($qb$CB-73ddfdac$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A distance of 112 furlongs is equivalent to how many feet? (1furIong = 220yardSand1yard = 3feet)$qb$, null, null, null, array[$qb$73920$qb$]::text[], $qb$The correct answer is 73,920. It's given that 1furIong = 220yardS and 1yard = 3feet. It follows that a distance of 112 furlongs is
equivalent to ( 1 12 furIongS) ( 22oyard8/1fur10ng ) ( 3fcct/1yard ) , or 73,920 feet.$qb$);
select seed_pool_question($qb$CB-96a45430$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A number n is increased 6%. If the result is 318, what is the value of n ?$qb$, null, $qb$[{"label": "A", "body": "199"}, {"label": "B", "body": "299"}, {"label": "C", "body": "300"}, {"label": "D", "body": "337"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The decimal equivalent of 6% is 0.06. Since increasing the number n by 6% yields the number 318, this situation can be
represented by the equation , or . Dividing both sides of this equation by 1.06 yields .
Choice A is incorrect. This is the result when n is increased by 60%, not by 6%. Choice B is incorrect. This is the approximate result of decreasing
318 by 6%. Choice D is incorrect. This is the approximate result of increasing 318 by 6%.$qb$);
select seed_pool_question($qb$CB-589cd7a6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A box holds 104 tokens, of which 13 are brown. If a token is selected at random from the box, what is the probability of selecting a token that is
brown?$qb$, null, $qb$[{"label": "A", "body": "1/13"}, {"label": "B", "body": "1/1o"}, {"label": "C", "body": "1/8"}, {"label": "D", "body": "1/4"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If a token is selected at random from the box, the probability of selecting a token that is brown is equal to the number of
tokens that are brown divided by the total number of tokens in the box. Since there are 13 brown tokens and 104 total tokens in the box, the
probability of selecting a token that is brown is 13/104 , or 1/8 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5267c3c7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The result of increasing the quantity x by 400% is 60. What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "12"}, {"label": "B", "body": "15"}, {"label": "C", "body": "240"}, {"label": "D", "body": "340"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the result of increasing the quantity x by 400% is 60. This can be written as x + ( 4o0/1o0 ) x = 60, which is
equivalent to x + 4x = 60, or 5x = 60. Dividing each side of this equation by 5 yields x = 12. Therefore, the value of x is 12.
Choice B is incorrect. The result of increasing the quantity 15 by 400% is 75, not 60.
Choice C is incorrect. The result of increasing the quantity 240 by 400% is 1,200, not 60.
Choice D is incorrect. The result of increasing the quantity 340 by 400% is 1,700, not 60.$qb$);
select seed_pool_question($qb$CB-ae32cc3c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$10121416?20221111IIIIII246800004444666622228888?((- ?)/(? ?)-/(? ?)(- ?)/??| | ? ?)/(200660000 II,,200220000 II,,200880000)| || || || || || || |x
Twelve data points are shown in the scatterplot. A line of best fit for the data is also shown. At x = 1,200, which of the following is closest to
the y-value predicted by the line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ae32cc3c.png$qb$, $qb$[{"label": "A", "body": "16"}, {"label": "B", "body": "14"}, {"label": "C", "body": "11"}, {"label": "D", "body": "6"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. On the line of best fit, an x-value of 1,200 corresponds to a y-value between 10 and 12. Therefore, of the given choices, 11 is
closest to the y-value predicted by the line of best fit at x = 1,200.
Choice A is incorrect. This is the integer value closest to the y-value predicted by the line of best fit at x = 1,800.
Choice B is incorrect. This is the integer value closest to the y-value predicted by the line of best fit at x = 1,500.
Choice D is incorrect. This is the integer value closest to the y-value predicted by the line of best fit at x = 600.$qb$);
select seed_pool_question($qb$CB-82dfb646$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A market researcher selected 200 people at random from a group of people who indicated that they liked a certain book. The 200 people were
shown a movie based on the book and then asked whether they liked or disliked the movie. Of those surveyed, 95% said they disliked the movie.
Which of the following inferences can appropriately be drawn from this survey result?$qb$, null, $qb$[{"label": "A", "body": "At least 95% of people who go see movies will dislike this movie."}, {"label": "B", "body": "At least 95% of people who read books will dislike this movie."}, {"label": "C", "body": "Most people who dislike this book will like this movie."}, {"label": "D", "body": "Most people who like this book will dislike this movie."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The sample was selected from a group of people who indicated that they liked the book. It is inappropriate to generalize the
result of the survey beyond the population from which the participants were selected. Choice D is the most appropriate inference from the survey
results because it describes a conclusion about people who liked the book, and the results of the survey indicate that most people who like the
book disliked the movie.
Choices A, B, and C are incorrect because none of these inferences can be drawn from the survey results. Choices A and B need not be true. The
people surveyed all liked the book on which the movie was based, which is not necessarily true of all people who go see movies or all people who
read books. Thus, the people surveyed are not representative of all people who go see movies or all people who read books. Therefore, the
results of this survey cannot appropriately be extended to at least 95% of people who go see movies or to at least 95% of people who read
books. Choice C need not be true because the sample includes only people who liked the book, and so the results do not extend to people who
dislike the book.$qb$);
select seed_pool_question($qb$CB-5c3c2e3c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The weights, in pounds, for 15 horses in a stable were reported, and the mean, median, range, and standard deviation for the data were found.
The horse with the lowest reported weight was found to actually weigh 10 pounds less than its reported weight. What value remains unchanged
if the four values are reported using the corrected weight?$qb$, null, $qb$[{"label": "A", "body": "Mean"}, {"label": "B", "body": "Median"}, {"label": "C", "body": "Range"}, {"label": "D", "body": "Standard deviation"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The median weight is found by ordering the horses’ weights from least to greatest and then determining the middle value
from this list of weights. Decreasing the value for the horse with the lowest weight doesn’t affect the median since it’s still the lowest value.
Choice A is incorrect. The mean is calculated by finding the sum of all the weights of the horses and then dividing by the number of horses.
Decreasing one of the weights would decrease the sum and therefore decrease the mean. Choice C is incorrect. Range is the difference between
the highest and lowest weights, so decreasing the lowest weight would increase the range. Choice D is incorrect. Standard deviation is
calculated based on the mean weight of the horses. Decreasing one of the weights decreases the mean and therefore would affect the standard
deviation.$qb$);
select seed_pool_question($qb$CB-ed6b7e5f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The table gives the distribution of topping and type of crust for customer orders at a pizza place.
Type of crust
Topping Thin Thick
Extra
(|-)/(| |)-/(|-|)|| |||-/(-|)-/((--^(|)|)/(-|)|)|| |60 30
cheese
Pepperoni 20 30
Tomato 80 20
If one of these customer orders is selected at random, what is the probability of selecting an order with thin crust, given the topping is pepperoni?
(Express your answer as a decimal or fraction, not as a percent.)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ed6b7e5f.png$qb$, null, null, array[$qb$0.4$qb$, $qb$2/5$qb$]::text[], $qb$The correct answer is 2/5 . Since the order will be selected at random, the probability of selecting an order with thin crust, given the topping is
pepperoni, is equal to the number of orders with thin crust where the topping is pepperoni divided by the total number of orders where the
topping is pepperoni. According to the table, there are 20 orders with thin crust where the topping is pepperoni. According to the table, there are
30 orders with thick crust where the topping is pepperoni. Therefore, there are a total of , or 50, orders where the topping is pepperoni.
20 (+20)/5030
Thus, the probability of selecting an order with thin crust, given the topping is pepperoni, is , or 2/5 . Note that 2/5 and .4 are examples of ways
to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-c5ee6ac0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit is also shown.
10121416?2022II11IIII11246800004444666622228888?-/(-222| 444| 666| 888| 10II00| 12II22| 14II44|)-/?-/||?| ?| ?| | | | ?| |x
Which of the following equations best represents the line of best fit shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c5ee6ac0.png$qb$, $qb$[{"label": "A", "body": "y = x + 3·4"}, {"label": "B", "body": "y = x - 3·4"}, {"label": "C", "body": "y = -x + 3·4"}, {"label": "D", "body": "y = -x - 3·4"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The line of best fit shown has a positive slope and intersects the y-axis at a positive y-value. The graph of an equation of the
form y = mx + b, where m and b are constants, has a slope of m and intersects the y-axis at a y-value of b. Of the given choices, only
y = x + 3·4 represents a line that has a positive slope, 1 , and intersects the y-axis at a positive y-value, 3·4.
Choice B is incorrect. This equation represents a line that intersects the y-axis at a negative y-value, not a positive y-value.
Choice C is incorrect. This equation represents a line that has a negative slope, not a positive slope.
Choice D is incorrect. This equation represents a line that has a negative slope, not a positive slope, and intersects the y-axis at a negative y-
value, not a positive y-value.$qb$);
select seed_pool_question($qb$CB-9ce8cbbe$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Set K consists of all the positive integers that are less than or equal to 160, where none of the integers are repeated. If a number is selected at
random from set K, what is the probability of selecting a number that is even and less than or equal to 50?$qb$, null, $qb$[{"label": "A", "body": "5/32"}, {"label": "B", "body": "3/16"}, {"label": "C", "body": "5/21"}, {"label": "D", "body": "5/16"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that set K consists of all the positive integers that are less than or equal to 160, where none of the integers are
repeated. Therefore, set K consists of the integers 1 through 160, which is 160 numbers. Of these, the integers 1 through 50 are less than or
equal to 50. Therefore, there are 50 numbers that belong to set K that are less than or equal to 50. Of these, half are even. Therefore, 50/2 , or 25,
numbers that belong to set K are even and less than or equal to 50. The probability of selecting at random a number from set K that is even and
less than or equal to 50 is equal to the number of numbers that belong to set K that are even and less than or equal to 50, which is 25, divided by
the total number of numbers that belong to set K, which is 160. It follows that the probability of selecting at random from set K a number that is
even and less than or equal to 50 is 25/16o , or 5/32 .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the probability of selecting at random a number from set K that is less than or equal to 50, not a number that is even
and less than or equal to 50.$qb$);
select seed_pool_question($qb$CB-61b87506$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the values j and k, the ratio of j to k is 11 to 12. If j is multiplied by 17, what is k multiplied by in order to maintain the same ratio?$qb$, null, null, null, array[$qb$17$qb$]::text[], $qb$The correct answer is 17. If one value is multiplied by a number, then the other value must be multiplied by the same number in order to maintain
the same ratio. It’s given that j is multiplied by 17. Therefore, in order to maintain the same ratio, k must also be multiplied by 17.$qb$);
select seed_pool_question($qb$CB-30db8f77$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$At a conference, there are a total of 275 attendees. Each attendee is assigned to either group A, group B, or group C. If one of these attendees is
selected at random, the probability of selecting an attendee who is assigned to group A is 0·44 and the probability of selecting an attendee who
is assigned to group B is 0·24. How many attendees are assigned to group C?$qb$, null, null, null, array[$qb$88$qb$]::text[], $qb$The correct answer is 88. It's given that there are a total of 275 attendees and each attendee is assigned to either group A, group B, or group C.
It's also given that if one of these attendees is selected at random, the probability of selecting an attendee who is assigned to group A is 0·44
and the probability of selecting an attendee who is assigned to group B is 0·24. It follows that there are 0·44(275) , or 121, attendees who are
assigned to group A and 0·24(275) , or 66, attendees who are assigned to group B. The number of attendees who are assigned to group C is the
number of attendees who are not assigned to group A or group B. In other words, the number of attendees who are assigned to group C is the
total number of attendees minus the number of attendees who are assigned to group A and group B. Therefore, the number of attendees who are
assigned to group C is 275 - 121 - 66, or 88.$qb$);
select seed_pool_question($qb$CB-4c5ea142$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$On average, a certain plant grows 87 millimeters every m months. At this rate, which expression represents the number of millimeters, on
average, the plant grows every k years?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4c5ea142.png$qb$, $qb$[{"label": "A", "body": "29m/4k"}, {"label": "B", "body": "29k/4m"}, {"label": "C", "body": "(1,044m)/k"}, {"label": "D", "body": "(1,044k)/m"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that on average, a certain plant grows 87 millimeters every m months. This average rate can be written as 87/m
millimeters per month. Since there are 12 months in 1 year, it follows that there are 12k months in k years. Therefore, the number of millimeters,
on average, the plant grows every k years can be calculated by multiplying the rate 87/m millimeters per month by 12k months, which yields
(87/m) (12k) , or (1,044k)/m .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-43744269$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An airplane descends from an altitude of 9,500 feet to 5,000 feet at a constant rate of 400 feet per minute. What type of function best models
the relationship between the descending airplane's altitude and time?$qb$, null, $qb$[{"label": "A", "body": "Decreasing exponential"}, {"label": "B", "body": "Decreasing linear"}, {"label": "C", "body": "Increasing exponential"}, {"label": "D", "body": "Increasing linear"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It′s given that the airplane descends at a constant rate of 400feetPerminute. Since the altitude decreases by a constant
amount during each fixed time period, the relationship between the airplane′s altitude and time is linear. Since the airplane descends from an
altitude of 9,500feet to 5,000feet, the airplane′s altitude is decreasing with time. Thus, the relationship is best modeled by a decreasing linear
function.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3ac09984$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Marta has 7,500 pesos she will convert to US dollars using a currency exchange service. At this time, the currency exchange rate is 1 peso =
0.075 US dollars. The exchange service will charge Marta a 2% fee on the converted US dollar amount. How many US dollars will Marta receive
from the currency exchange after the 2% fee is applied?$qb$, null, $qb$[{"label": "A", "body": "$551.25"}, {"label": "B", "body": "$562.50"}, {"label": "C", "body": "$5,625.00"}, {"label": "D", "body": "$98,000.00"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. At the exchange rate of 1 peso = 0.075 US dollars, 7,500 pesos would be converted to 7,500 × 0.075 = $562.50. However,
since Maria pays a 2% fee on the converted US dollar amount, she receives only (100 – 2)%, or 98%, of the converted US dollars, and 562.50 ×
0.98 = $551.25.
Choice B is incorrect. This is the number of US dollars Maria would receive if the exchange service did not charge a 2% fee. Choice C is incorrect
and may result from a decimal point error made when calculating the conversion to US dollars and from not assessing the 2% fee. Choice D is
incorrect and may result from reversing the units of the exchange rate.$qb$);
select seed_pool_question($qb$CB-66f03086$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$71 , 72, 7376, , 7779, , 83, 8793,
What is the median of the data shown?$qb$, null, $qb$[{"label": "A", "body": "71"}, {"label": "B", "body": "77"}, {"label": "C", "body": "78"}, {"label": "D", "body": "79"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The median of a data set with an odd number of data values is defined as the middle value of the ordered list of values. The
data set shown has nine values, so the median is the fifth value in the ordered list, which is 77.
Choice A is incorrect. This is the minimum value of the data set, not the median.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the mean of the data set, not the median.$qb$);
select seed_pool_question($qb$CB-61f61789$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To study the moisture content in a group of trees, samples from the trunk of each tree were taken from 25 trees and cut in the shape of a cube.
The length of the edge of one of these cubes is 2·00 centimeters. If this cube has a mass of 2·56 grams, what is the density of this cube, in
grams per cubic centimeter?$qb$, null, null, null, array[$qb$0.32$qb$, $qb$8/25$qb$]::text[], $qb$The correct answer is ·32. The volume of a cube is given by the formula V = s3 , where s is the length of an edge of the cube. It’s given that each
edge of the cube has a length of 2·00 centimeters. Substituting 2·00 centimeters for s in the formula V = s3 yields V
= (2·00 centimeterS) 3, or V = 8·00 cubic centimeters. It’s given that the cube has a mass of 2·56 grams. Dividing the mass, in grams, of the
cube by the volume, in cubic centimeters, of the cube gives its density, in grams per cubic centimeters. Therefore, the density of the cube is
(2·56 gram8)/(8·0o cubic ccntimcter8) , or ·32 grams per cubic centimeter. Note that .32 and 8/25 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-9110c120$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following statements about the means and medians of data set A and data set B is true?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9110c120.png$qb$, $qb$[{"label": "A", "body": "Only the means are different."}, {"label": "B", "body": "Only the medians are different."}, {"label": "C", "body": "Both the means and the medians are different."}, {"label": "D", "body": "Neither the means nor the medians are different."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The mean of a data set is the sum of the values divided by the number of values. The mean of data set A is , or 5. The
mean of data set B is , or 14.5. Thus, the means are different. The median of a data set is the middle value when the values are ordered
from least to greatest. The medians of data sets A and B are both 5. Therefore, the medians are the same, so only the means are different.
Choices B, C, and D are incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c74df824$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$An area of 46·00 square nautical miles is equivalent to k square kilometers. To the nearest tenth, what is the value of k?
(1nauticaImiIe = 1·852kiI0meterS)$qb$, null, null, null, array[$qb$157.8$qb$, $qb$789/5$qb$]::text[], $qb$The correct answer is 157·8. It’s given that an area of 46·00 square nautical miles is equivalent to k square kilometers. Since 1 nautical mile is
equal to 1·852 kilometers, it follows that an area of 1 square nautical mile is equivalent to (1·852)^(2) , or 3·429904, square kilometers. Multiplying
46·00 by 3·429904 yields 157·775584 square kilometers. Rounding this value to the nearest tenth yields 157·8. Therefore, the value of k is
157·8.$qb$);
select seed_pool_question($qb$CB-1b96c116$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A rectangle has an area of 3,168 square inches. What is the area, in square feet, of this rectangle? (1foot = 12incheS)$qb$, null, $qb$[{"label": "A", "body": "22"}, {"label": "B", "body": "56·3"}, {"label": "C", "body": "264"}, {"label": "D", "body": "675·4"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that 1f00t = 12incheS. It follows that , or 1 Square fo0t
1 2 Square foot = 122( Sq1u8aqruearcinfoc0hteS/(144 Square inche8) )
= 144 Square incheS. Thus, 3,168 square inches is equivalent to (3, 168 Square incheS) , or 22 square feet.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of (3,168)/12 , not (3,168)/144 .
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9296553d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following could be an equation for a line of best fit for the data in the scatterplot?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9296553d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A line of best fit for the data in a scatterplot is a line that follows the trend of the data with approximately half the data points
above and half the data points below the line. Based on the given data, a line of best fit will have a positive y-intercept on or near the point
and a negative slope. All of the choices are in slope-intercept form , where m is the slope and b is the y-coordinate of the y-
intercept. Only choice A is an equation of a line with a positive y-intercept at  and a negative slope, .
Choice B is incorrect. This equation is for a line that has a negative y-intercept, not a positive y-intercept. Choices C and D are incorrect and may
result from one or more sign errors and from switching the values of the y-intercept and the slope in the equation.$qb$);
select seed_pool_question($qb$CB-d1db8def$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Response Frequency
Once a week or
3
more
Two or three times
16
a month
About once a
200-/(||-||)|||| ||||-/(-||)||||26
month
A few times a year 73
Almost never 53
Never 29
Total 200
The table gives the results of a survey of  people who were asked how often they see a movie in a theater. How many people responded
either “never” or “almost never”?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d1db8def.png$qb$, $qb$[{"label": "A", "body": "24"}, {"label": "B", "body": "53"}, {"label": "C", "body": "82"}, {"label": "D", "body": "118"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The table gives the results of 200 people who were asked how often they see a movie in a theater. The table shows that 29
people responded “never” and 53 people responded “almost never.” Therefore, 29 + 53, or 82, people responded either “never” or “almost never.”
Choice A is incorrect. This is the difference between the number of people who responded “almost never” and the number of people who
responded “never.”
Choice B is incorrect. This is the number of people who responded “almost never” but doesn't include those who responded “never.”
Choice D is incorrect. This is the number of people who responded something other than “never” or “almost never,” rather than the number of
people who responded either “never” or “almost never.”$qb$);
select seed_pool_question($qb$CB-b2f6f17d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A customer’s monthly water bill was $75.74. Due to a rate increase, her monthly bill is now $79.86. To the nearest tenth of a percent, by what
percent did the amount of the customer’s water bill increase?$qb$, null, $qb$[{"label": "A", "body": "4.1%"}, {"label": "B", "body": "5.1%"}, {"label": "C", "body": "5.2%"}, {"label": "D", "body": "5.4%"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. To find the percent increase of the customer’s water bill, the absolute increase of the bill, in dollars, is divided by the original
amount of the bill, and the result is multiplied by 100%, as follows: ; .
Choice A is incorrect. This choice is the difference  rounded to the nearest tenth, which is the (absolute) increase of the bill’s
amount, not its percent increase. Choice B is incorrect and may be the result of some calculation errors. Choice C is incorrect and is the result of
dividing the difference between the two bill amounts by the new bill amount instead of the original bill amount.$qb$);
select seed_pool_question($qb$CB-4626102e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?ata ?et ?
?
? ?
? ? ?
? ? ? ?
? ? ? ? ?
-| | | | |
22 23 24 25 26
The dot plot represents the 15 values in data set A. Data set B is created by adding 56 to each of the values in data set A. Which of the following
correctly compares the medians and the ranges of data sets A and B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4626102e.png$qb$, $qb$[{"label": "A", "body": "The median of data set B is equal to the median of data set A, and the range of data set B is equal to the range of data set A."}, {"label": "B", "body": "The median of data set B is equal to the median of data set A, and the range of data set B is greater than the range of data set A."}, {"label": "C", "body": "The median of data set B is greater than the median of data set A, and the range of data set B is equal to the range of data set A."}, {"label": "D", "body": "The median of data set B is greater than the median of data set A, and the range of data set B is greater than the range of data set A."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The median of a data set with an odd number of values, in ascending or descending order, is the middle value of the data set,
and the range of a data set is the positive difference between the maximum and minimum values in the data set. Since the dot plot shown gives
the values in data set A in ascending order and there are 15 values in the data set, the eighth value in data set A, 23, is the median. The
maximum value in data set A is 26 and the minimum value is 22, so the range of data set A is 26 - 22, or 4. It’s given that data set B is created
by adding 56 to each of the values in data set A. Increasing each of the 15 values in data set A by 56 will also increase its median value by 56
making the median of data set B 79. Increasing each value of data set A by 56 does not change the range, since the maximum value of data set
B is 26 + 56, or 82, and the minimum value is 22 + 56, or 78, making the range of data set B 82 - 78, or 4. Therefore, the median of data set B
is greater than the median of data set A, and the range of data set B is equal to the range of data set A.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d6121490$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The graph above shows the relationship between the speed of a particular car, in miles per hour, and its corresponding braking distance, in feet.
Approximately how many feet greater will the car’s braking distance be when the car is traveling at 50 miles per hour than when the car is
traveling at 30 miles per hour?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d6121490.png$qb$, $qb$[{"label": "A", "body": "75"}, {"label": "B", "body": "125"}, {"label": "C", "body": "175"}, {"label": "D", "body": "250"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. According to the graph, when the car is traveling at 50 miles per hour, the braking distance is approximately 225 feet, and
when the car is traveling at 30 miles per hour, the braking distance is approximately 100 feet. The difference between these braking distances is
, or 125 feet.
Choice A is incorrect and may result from finding the braking distance for 20 miles per hour, the difference between the given speeds. Choice C
is incorrect and may result from subtracting the speed from the braking distance at 50 miles per hour. Choice D is incorrect and may result from
finding the difference in the braking distances at 60 and 20 miles per hour.$qb$);
select seed_pool_question($qb$CB-55cfaf22$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Data set X: 5, 99, , 13
Data set Y: 5, 99, , 13, 27
The lists give the values in data sets X and Y. Which statement correctly compares the mean of data set X and the mean of data set Y?$qb$, null, $qb$[{"label": "A", "body": "The mean of data set X is greater than the mean of data set Y."}, {"label": "B", "body": "The mean of data set X is less than the mean of data set Y."}, {"label": "C", "body": "The means of data set X and data set Y are equal."}, {"label": "D", "body": "There is not enough information to compare the means."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. ​The mean of a data set is the sum of the values in the data set divided by the number of values in the data set. It follows that
the mean of data set X is (5+9+9+13)/4 , or 9, and the mean of data set Y is (5+9+9+13+27)/5 , or 12·6. Since 9 is less than 12·6, the mean of data set X
is less than the mean of data set Y.
Alternate approach: Data set Y consists of the 4 values in data set X and one additional value, 27. Since the additional value, 27, is larger than
any value in data set X, the mean of data set X is less than the mean of data set Y.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b58dbf88$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An orchard owner recorded the weight, in pounds, of all nectarines that grew on a dwarf nectarine tree during each growing season after the
tree's transplantation. The scatterplot shows this weight, in pounds, for each growing season after the tree's transplantation.
?^(?)dnO^(S)p?
441020504050602080?77669922883355II000000000000000000?-/(-1^(??)II| 222| 333| 444| 555| 666| ?77| 888| 999| 101100|)-/(??)(- ??)/(??)| | ??| ??| ??| | ??| | | | | |x
f????ttnnO?SeeCae?
?r0WingSeaS0na?tertranSPIantati0n
What was the weight, to the nearest pound, of all nectarines that grew on the tree during the 4th growing season after the tree's transplantation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b58dbf88.png$qb$, null, null, array[$qb$40$qb$]::text[], $qb$The correct answer is 40. For each data point on the scatterplot, the x-value represents the growing season after transplantation and the y-value
represents the weight, in pounds, of all nectarines that grew on the tree during the season. The scatterplot shows a data point at (4, 40) . It
follows that during the 4th growing season after the tree’s transplantation, 40 pounds of nectarines grew on the tree.$qb$);
select seed_pool_question($qb$CB-5154615f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To study fluctuations in composition, samples of pumice were taken from 29 locations and cut in the shape of a cube. The length of the edge of
one of these cubes is 3·000 centimeters. This cube has a density of 0·230 grams per cubic centimeter. What is the mass of this cube, in grams?$qb$, null, null, null, array[$qb$6.21$qb$]::text[], $qb$The correct answer is 6·21 . It’s given that the samples of pumice were cut in the shape of a cube. It's also given that the length of the edge of
one of these cubes is 3·000 centimeters. Therefore, the volume of this cube is , or 27 cubic centimeters. Since the
(3·000 centimet(e(rS)o3·230 ?ram8)/(1 cubic ccutimcter) ) (27 cubic centimeterS)
density of this cube is 0·230 grams per cubic centimeter, it follows that the mass of this cube is ,
or 6·21 grams.$qb$);
select seed_pool_question($qb$CB-ab7740a8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In which of the following tables is the relationship between the values of x and their corresponding y-values nonlinear?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ab7740a8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The relationship between the values of x and their corresponding y-values is nonlinear if the rate of change between these
pairs of values isn’t constant. The table for choice D gives four pairs of values: ,, , and . Finding the rate of change,
or slope, between  and  by using the slope formula, , yields , or 6. Finding the rate of change between
and  yields , or 12. Finding the rate of change between  and  yields , or 24. Since the rate of change
isn’t constant for these pairs of values, this table shows a nonlinear relationship.
Choices A, B, and C are incorrect. The rate of change between the values of x and their corresponding y-values in each of these tables is
constant, being 3, 4, and 5, respectively. Therefore, each of these tables shows a linear relationship.$qb$);
select seed_pool_question($qb$CB-2a08d878$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are n nonfiction books and 12 fiction books on a bookshelf. If one of these books is selected at random, what is the probability of
selecting a nonfiction book, in terms of n ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2a08d878.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since there are n nonfiction and 12 fiction books on the bookshelf,  represents the total number of books. If one of
these books is selected at random, the probability of selecting a nonfiction book is equivalent to the number of nonfiction books divided by the
total number of books. Therefore, the probability of selecting a nonfiction book, in terms of n, is .
Choice A is incorrect. This expression represents the number of nonfiction books divided by the number of fiction books. Choice C is incorrect.
This expression represents the number of fiction books divided by the number of nonfiction books. Choice D is incorrect. This expression
represents the probability of selecting a fiction book.$qb$);
select seed_pool_question($qb$CB-820d7a73$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$fb?C?nmaO^(S)e? 476235100000000 | ? ? ? ? ? ? ? ? ? ?
I 2 3 4 5 6 7 8 9 10
?r0uP
The bar graph shows the distribution of 419 cans collected by 10 different groups for a food drive. How many cans were collected by group 6?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-820d7a73.png$qb$, null, null, array[$qb$40$qb$]::text[], $qb$The correct answer is 40. The height of each bar in the bar graph shown represents the number of cans collected by the group specified at the
bottom of the bar. The bar for group 6 reaches a height of 40. Therefore, group 6 collected 40 cans.$qb$);
select seed_pool_question($qb$CB-38a9ac45$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 1,200 customers register for new accounts at a social media website every day, what fraction of the first 60,000 new accounts are registered in
the first 5 days?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-38a9ac45.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If 1,200 customers register for new accounts every day, then (1,200)(5) = 6,000 customers registered for new accounts in the
first 5 days. Therefore, of the first 60,000 new accounts that were registered, , or , were registered in the first 5 days.
Choice A is incorrect. The fraction  represents the fraction of accounts registered in 1 of the first 5 days. Choice C is incorrect and may result
from conceptual or computation errors. Choice D is incorrect. The fraction  represents the fraction of the first 60,000 accounts that were
registered in 1 day.$qb$);
select seed_pool_question($qb$CB-9c44f828$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are a total of 840 seats in a school auditorium. During an assembly, students occupied 50% of the seats in the auditorium. How many
seats did the students occupy during this assembly?$qb$, null, $qb$[{"label": "A", "body": "25"}, {"label": "B", "body": "50"}, {"label": "C", "body": "420"}, {"label": "D", "body": "790"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that during an assembly, students occupied 50% of the 840 seats in the school auditorium. Therefore, the number
of seats that the students occupied during this assembly can be calculated by multiplying the number of seats in the school auditorium by 5o/1o0 .
Thus, the students occupied 840(5o/1o0) , or 420, seats during this assembly.
Choice A is incorrect. This is approximately 3%, not 50%, of 840.
Choice B is incorrect. This is approximately 6%, not 50%, of 840.
Choice D is incorrect. This is approximately 94%, not 50%, of 840.$qb$);
select seed_pool_question($qb$CB-b695711c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A statistician conducted a study to investigate the relationship between the average number of minutes piano students practiced each week and
the percentage of correct notes the students played during a recital. For the study, the statistician selected a sample of 85 piano students at
random from all the piano students in a certain region who were in their second year with their conservatory. The table shows the information for
75 piano students in this sample who practiced at least 50 minutes on average each week.
Percentage of correct notes the students played during a recital
Average number of
minutes practiced each Less than 50% 50% to 80% Greater than 80% Total
(-/(|-50 |)| |)/151|| || || ?? || ||week
to 150 7 28 5 40
or more 3 11 21 35
Total 10 39 26 75
Which of the following is the largest population to which the results of the study can be generalized?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b695711c.png$qb$, $qb$[{"label": "A", "body": "All piano students who were in their second year with their conservatory"}, {"label": "B", "body": "All piano students in the region"}, {"label": "C", "body": "All piano students in the region who were in their second year with their conservatory"}, {"label": "D", "body": "The 75 piano students in the sample who practiced at least 50 minutes on average each week"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the statistician selected a sample of 85 piano students at random from all piano students in a certain region
who were in their second year with their conservatory. It's also given that the table shows the information for 75 piano students in the sample
who practiced at least 50 minutes on average each week. Selecting a sample at random from a population allows the results of the study to be
generalized to that population, but not beyond it. Therefore, the largest population to which the results of the study can be generalized is the
population of all piano students in the region who were in their second year with their conservatory.
Choice A is incorrect. The results can't be generalized to all piano students who were in their second year with their conservatory since only
students in a certain region were sampled.
Choice B is incorrect. The results can't be generalized to all piano students in the region since only students in their second year with their
conservatory were sampled.
Choice D is incorrect. The results of the study can be generalized beyond the sample itself to the population from which it was drawn.$qb$);
select seed_pool_question($qb$CB-eb672707$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$How many tablespoons are equivalent to - 14 teaspoons? (3 teaSP00nS = 1 tabIeSP00n)$qb$, null, null, null, array[$qb$14/3$qb$, $qb$4.666$qb$, $qb$4.667$qb$]::text[], $qb$The correct answer is . It's given that 3 teaspoons is equivalent to 1 tablespoon. Therefore, 14 teaspoons is equivalent to
( 14 teaSP0ouS) ( (1 ta14/b31c8P09n)/(3 tea8P09u8) )
, or 14/3 tablespoons. Note that 14/3, 4.666, and 4.667 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-7270d642$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A certain bird species can fly at an average speed of 16 meters per second when in continuous flight. At this rate, how many meters would this
bird species fly in 4 seconds?$qb$, null, $qb$[{"label": "A", "body": "64"}, {"label": "B", "body": "20"}, {"label": "C", "body": "16"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a certain bird species can fly at an average speed of 16 meters per second when in continuous flight. At this
rate, in 4 seconds this bird species would fly ( (16 mctcr8)/8cc0nd ) (4 SecondS) , or 64 meters.
Choice B is incorrect. This is the value of 16 + 4, not 16(4) .
Choice C is incorrect. This is the distance the bird would fly in 1 second, not 4 seconds.
Choice D is incorrect. This is the value of 16 - 4, not 16(4).$qb$);
select seed_pool_question($qb$CB-6e3ab4bf$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$20
18
16
14
12
Number of volunteers 10 |????
8
6
4
2
0
A B C D
Gift
In April, there were 43 volunteers in a cleanup project. Each volunteer was asked to choose a small gift labeled A, B, C, or D. The bar graph shows
the number of volunteers who chose each gift. How many volunteers chose gift C?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6e3ab4bf.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "8"}, {"label": "C", "body": "14"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The height of each bar in the graph shown represents the number of volunteers who chose the gift labeled with the letter
specified at the bottom of the bar. The bar for gift C has a height of 18. Therefore, 18 volunteers chose gift C.
Choice A is incorrect. This is the number of volunteers who chose gift D, not gift C.
Choice B is incorrect. This is the number of volunteers who chose gift B, not gift C.
Choice C is incorrect. This is the number of volunteers who chose gift A, not gift C.$qb$);
select seed_pool_question($qb$CB-c256b723$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The amount of Hanna's bill for a food order was $50. Hanna gave a tip of 20% of the amount of the bill. What is the amount, in dollars, of the tip
Hanna gave?$qb$, null, null, null, array[$qb$10$qb$]::text[], $qb$The correct answer is 10. It’s given that the amount of Hanna's food order was $50 and that Hanna gave a tip of 20% of the amount of the bill.
20% of 50 can be calculated as (2o/1o0) (50), which yields 1o00/10o , or 10. Therefore, the amount, in dollars, of the tip Hanna gave is 10.$qb$);
select seed_pool_question($qb$CB-90ba8f98$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the given scatterplot, a line of best fit for the data is shown.
101214IIIIII246800444466222288?(?? ? ?? ?? ?? ? ?)/(1II 222 ?33 444 555 666 ?77)| || || || || || || || |x
Which of the following is closest to the slope of the line of best fit shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-90ba8f98.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1/2"}, {"label": "C", "body": "1"}, {"label": "D", "body": "2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A line in the xy-plane that passes through the points (x1 , y1 ) and (x2 , y2 ) has a slope of (y2-y1)/(x2 -x1) . The line of best fit shown
passes approximately through the points (1, 3·3) and (7, 14·5) . It follows that the slope of this best fit line is approximately (14·5-3·3)/(7-1) , which is
equivalent to (11·2)/6 , or approximately 1·87. Therefore, of the given choices, 2 is closest to the slope of the line of best fit shown.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-273b7f37$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Isabel grows potatoes in her garden. This year, she harvested 760 potatoes and saved 10% of them to plant next year. How many of the
harvested potatoes did Isabel save to plant next year?$qb$, null, $qb$[{"label": "A", "body": "66"}, {"label": "B", "body": "76"}, {"label": "C", "body": "84"}, {"label": "D", "body": "86"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The number of harvested potatoes Isabel saved to plant next year can be calculated by multiplying the total number of
potatoes Isabel harvested, 760, by the proportion of potatoes she saved. Since she saved 10% of the potatoes she harvested, the proportion of
potatoes she saved is 10/10o , or 0·1 . Multiplying 760 by this proportion gives 760(0·1) , or 76, potatoes that she saved to plant next year.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2e511919$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The line graph shows the estimated number of chipmunks in a state park on April 1 of each year from 1989 to 1999.
db??tt?nmamSee? f???CnmOp^(S)?
2110055?00000??-/(-?|????|????|????|????|????|????|????|????|????|????|)??| | | | | | | | | |
?ear
Based on the line graph, in which year was the estimated number of chipmunks in the state park the greatest?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2e511919.png$qb$, $qb$[{"label": "A", "body": "1989"}, {"label": "B", "body": "1994"}, {"label": "C", "body": "1995"}, {"label": "D", "body": "1998"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For the given line graph, the estimated number of chipmunks is represented on the vertical axis. The greatest estimated
number of chipmunks in the state park is indicated by the greatest height in the line graph. This height is achieved when the year is 1994.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-7ed0d098$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Lani spent 15% of her 8-hour workday in meetings. How many minutes of her workday did she spend in meetings?-$qb$, null, $qb$[{"label": "A", "body": "1.2"}, {"label": "B", "body": "15"}, {"label": "C", "body": "48"}, {"label": "D", "body": "72"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. There are 60 minutes in one hour, so an 8-hour workday has  minutes. To calculate 15% of 480, multiply
0.15 by 480: . Therefore, Lani spent 72 minutes of her workday in meetings.
Choice A is incorrect because 1.2 is 15% of 8, which gives the time Lani spent of her workday in meetings in hours, not minutes. Choices B and C
are incorrect and may be the result of computation errors.$qb$);
select seed_pool_question($qb$CB-38525983$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between x and y. A line of best fit is also shown.
101124680044662288?-/(-| 222| | 444| | 666| | 888| | 10II00|)|??| | ?| | ?| | ?| | ?| | |x
Which of the following is closest to the slope of this line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-38525983.png$qb$, $qb$[{"label": "A", "body": "0·60"}, {"label": "B", "body": "2·50"}, {"label": "C", "body": "7·80"}, {"label": "D", "body": "8·00"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A line in the xy-plane that passes through the points (x1 , y1 ) and (x2 , y2 ) has a slope of (y2-y1)/(x2 -x1) . The line of best fit shown
passes through the points with approximate coordinates (0, 3·2) and (2, 4·4) . It follows that the slope of the line of best fit is approximately
(4·4-3·2)/(2-0) , which is equivalent to (1·2)/2 , or 0·6. Therefore, of the given choices, 0·6 is closest to the slope of the line of best fit shown.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c141366d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The graph of function f is shown, where y= f(x) .
- 10II24680044662288/(?10II-/--/--/--/--/-00 -888 -?66 -444 --???÷÷÷÷101186420044662288? 222 444 ?66 888 10II00)||?|| || || || || || || || || | || || || || || || || || || || | x
Which of the following describes function f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c141366d.png$qb$, $qb$[{"label": "A", "body": "Increasing linear"}, {"label": "B", "body": "Decreasing linear"}, {"label": "C", "body": "Increasing exponential"}, {"label": "D", "body": "Decreasing exponential"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The graph of function f shows that as x increases, f(x) also increases, which means f(x) is an increasing function. The
graph of f is a line, which indicates a constant rate of change. A function that has a constant rate of change is a linear function. Therefore,
function f can be described as increasing linear.
Choice B is incorrect. For a decreasing function, as x increases, f(x) decreases, rather than increases.
Choice C is incorrect. The graph of an exponential function isn't a line.
Choice D is incorrect. For a decreasing function, as x increases, f(x) decreases, rather than increases, and the graph of an exponential function
isn't a line.$qb$);
select seed_pool_question($qb$CB-20845d36$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number a is 70% less than the positive number b. The number c is 60% greater than a. The number c is how many times b?$qb$, null, null, null, array[$qb$.48$qb$, $qb$12/25$qb$]::text[], $qb$The correct answer is ·48. It's given that the number a is 70% less than the positive number b. Therefore, , which is equivalent
to a = (1 - 0·70)b, or a = 0·30b. It's also given that the number c is 60% greater than a. Therefore, c =a(c=1=+( 1(6-0)/(11·o600)7o/()1(oa00·)3)0bb), which is equivalent to c
= (1 + 0·60)a, or c = 1 ·60a. Since a = 0·30b, substituting 0·30b for a in the equation c = 1 ·60a yields , or c = 0·48b.
Thus, c is 0·48 times b. Note that .48 and 12/25 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-2bab1399$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A researcher is designing a study to investigate the average number of hours participants in a training course spend on a particular activity per
day. The researcher will report an estimated average number of hours participants in the training course spend on this activity per day with an
associated margin of error. The researcher is considering using a random sample of either 115 or 230 participants from the training course.
Which of the following would be the most likely effect of using the larger random sample compared to the smaller random sample?$qb$, null, $qb$[{"label": "A", "body": "The reported margin of error would be lower."}, {"label": "B", "body": "The reported margin of error would be higher."}, {"label": "C", "body": "The reported average number of hours would be lower."}, {"label": "D", "body": "The reported average number of hours would be higher."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. When using a random sample to report an estimated average, a larger sample size, such as 230 participants instead of 115
participants, generally leads to a smaller margin of error. Therefore, the most likely effect of using the larger random sample compared to the
smaller random sample is that the reported margin of error would be lower.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-8bf3f67a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A special camera is used for underwater ocean research. The camera is at a depth of 39 fathoms. What is the camera's depth in feet?-
(1fath0m = 6feet)$qb$, null, $qb$[{"label": "A", "body": "234"}, {"label": "B", "body": "117"}, {"label": "C", "body": "45"}, {"label": "D", "body": "7"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that a special camera is used for underwater ocean research, and this camera is at a depth of 39 fathoms. It's also
given that 1 fathom is equal to 6 feet. Thus, 39 fathoms is equivalent to (39 fathomS) ( 6fcet/(1 ?athom) ) , or 234 feet. Therefore, the camera's depth, in
feet, is 234.
Choice B is incorrect. This is the camera's depth, in feet, if the camera is at a depth of 19·5 fathoms.
Choice C is incorrect. This is the camera's depth, in feet, if the camera is at a depth of 7·5 fathoms.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a478f9f5$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Each of 157 gemstones can be classified as one of three classifications, as shown in the frequency table.
Classification Frequency
color X 119
||| ||| |||
color Y 3
color Z 35
If one of the gemstones is selected at random, what is the probability of selecting a gemstone of color Y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a478f9f5.png$qb$, $qb$[{"label": "A", "body": "3/157"}, {"label": "B", "body": "35/157"}, {"label": "C", "body": "119/157"}, {"label": "D", "body": "154/157"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. If one of the gemstones is selected at random, the probability of selecting a gemstone of color Y is equal to the number of
gemstones of color Y divided by the total number of gemstones. According to the table, there are 3 gemstones of color Y, and it's given that the
total number of gemstones is 157. Therefore, if one of the gemstones is selected at random, the probability of selecting a gemstone of color Y is
3/157 .
Choice B is incorrect. This is the probability of selecting a gemstone of color Z.
Choice C is incorrect. This is the probability of selecting a gemstone of color X.
Choice D is incorrect. This is the probability of selecting a gemstone that's not of color Y.$qb$);
select seed_pool_question($qb$CB-dae79de4$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$2 or more
1 visit visits Total
Less than
15 15 30
||| ||| ||| ??? ||| years old
At least 40
20 85 105
years old
Total 35 100 135
The table summarizes customers who visited a car dealership in the last month by age and number of visits they made to the dealership. If a
customer from the last month is selected at random, what is the probability that the selected customer is at least 40 years old?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dae79de4.png$qb$, $qb$[{"label": "A", "body": "3o/135"}, {"label": "B", "body": "35/135"}, {"label": "C", "body": "1o0/135"}, {"label": "D", "body": "105/135"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Based on the table, there are a total of 135 customers who visited the car dealership in the last month, and 105 of these
customers are at least 40 years old. If a customer from the last month is selected at random, the probability that the selected customer is at
least 40 years old is equal to the number of customers who are at least 40 years old divided by the total number of customers. Therefore, the
probability that the selected customer is at least 40 years old is 1o5/135 .
Choice A is incorrect. This is the probability that the selected customer is less than 40 years old.
Choice B is incorrect. This is the probability that the selected customer visited the dealership 1 time in the last month.
Choice C is incorrect. This is the probability that the selected customer visited the dealership 2 or more times in the last month.$qb$);
select seed_pool_question($qb$CB-4bb25495$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Five Smallest Countries in 2016
Land area
Country
(square kilometers)
Monaco 2.0
|||| |||| ????Nauru 21
San Marino 61
Tuvalu 26
Vatican City 0.44
The table above shows the land area, in square kilometers, of the five smallest countries of the world in 2016. Based on the table, what is the
mean land area of the 5 smallest countries in 2016, to the nearest square kilometer?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4bb25495.png$qb$, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "22"}, {"label": "C", "body": "61"}, {"label": "D", "body": "110"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The mean land area of these 5 countries is equal to the sum of the land areas of these countries, or
, divided by the number of countries in the table, 5, or . Combining like terms in
the numerator yields , which simplifies to 22.088 square kilometers. This value, when rounded to the nearest square kilometer, is 22.
Choice A is incorrect and may result from a calculation error. Choice C is incorrect. This is the greatest land area of the 5 countries in the table.
Choice D is incorrect. This is the sum of the land areas of the 5 countries in the table, rounded to the nearest square kilometer.$qb$);
select seed_pool_question($qb$CB-aa43b41f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Near the end of a US cable news show, the host invited viewers to respond to a poll on the show’s website that asked, “Do you support the new
federal policy discussed during the show?” At the end of the show, the host reported that 28% responded “Yes,” and 70% responded “No.” Which
of the following best explains why the results are unlikely to represent the sentiments of the population of the United States?$qb$, null, $qb$[{"label": "A", "body": "The percentages do not add up to 100%, so any possible conclusions from the poll are invalid."}, {"label": "B", "body": "Those who responded to the poll were not a random sample of the population of the United States."}, {"label": "C", "body": "There were not 50% “Yes” responses and 50% “No” responses."}, {"label": "D", "body": "The show did not allow viewers enough time to respond to the poll."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In order for the poll results from a sample of a population to represent the entire population, the sample must be
representative of the population. A sample that is randomly selected from a population is more likely than a sample of the type described to
represent the population. In this case, the people who responded were people with access to cable television and websites, which aren’t
accessible to the entire population. Moreover, the people who responded also chose to watch the show and respond to the poll. The people who
made these choices aren’t representative of the entire population of the United States because they were not a random sample of the population
of the United States.
Choices A, C, and D are incorrect because they present reasons unrelated to whether the sample is representative of the population of the United
States.$qb$);
select seed_pool_question($qb$CB-cb4894f9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A triathlon is a multisport race consisting of three different legs. A triathlon participant completed the cycling leg with an average speed of
19·700 miles per hour. What was the average speed, in yards per hour, of the participant- during the cycling leg? (1mi1e = 1,760yardS)$qb$, null, null, null, array[$qb$34672$qb$]::text[], $qb$The correct answer is . It's given that 1miIe = 1,760yardS. It follows that an average speed of 19·700 miles per hour is equivalent to
( (19·70omiIc8)/(1 h0ur) ) ( (1,760ya3r4d8^(,))/1miIc6)72
, or 34,672 yards per hour.$qb$);
select seed_pool_question($qb$CB-b6569d0e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$United States
Presidents
from 1789 to
2015
Ages Number
40–44 2
45–49 7
|||||| |||||| ??????50–54 13
55–59 11
60–64 7
65–69 3
The table above gives the number of United States presidents from 1789 to 2015 whose age at the time they first took office is within the interval
listed. Of those presidents who were at least 50 years old when they first took office, what fraction were at least 60 years old?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b6569d0e.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The sample space is restricted to the presidents who were at least 50 years old when they first took office. Therefore, the
sum of the values in the final four rows of the table, , is the total number of presidents in the sample space. The number
of presidents who were at least 60 years old is the sum of the values in the final two rows of the table: . Thus, the fraction of the 34
presidents who were at least 50 years old when they first took office who were at least 60 years old is .
Choice A is incorrect. This is the fraction of all presidents in the table who were at least 60 years old when they first took office. Choice C is
incorrect and may result from treating the number of presidents who were between 50 and 59 years old when they first took office, instead of the
number of presidents who were at least 50 years old, as the sample space. Choice D is incorrect and may result from a calculation error.$qb$);
select seed_pool_question($qb$CB-50b99b2d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Objects R and S each travel at a constant speed. The speed of object R is half the speed of object S. Object R travels a distance of 4x inches in y
seconds. Which expression represents the time, in seconds, it takes object S to travel a distance of 24x inches?$qb$, null, $qb$[{"label": "A", "body": "12y"}, {"label": "B", "body": "3y"}, {"label": "C", "body": "16y"}, {"label": "D", "body": "6y"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that object R travels a distance of 4x inches in y seconds. This speed can be written as . It's given that the
(4x incheS)/(y8ec92nd(8)(4x inchc8)/y8cc9nd8 )
speed of object R is half the speed of object S. It follows that the speed of object S is twice the speed of object R, which is , or
(8x inchc8)/y8ec0nd8 . Let n represent the time, in seconds, it takes object S to travel a distance of 24x inches. The value of n can be found by solving the
equation , which can be written as 8x/y = 24x/n . Multiplying each side of this equation by ny yields 8xn = 24xy. Dividing
(8x inchcS)/y8cc0nd8 = (24x inchcS)/(n 8cc0nd88x)
each side of this equation by  yields n = 3y. Therefore, the expression 3y represents the time, in seconds, it takes object S to travel a
distance of 24x inches.
Choice A is incorrect. This expression represents the time, in seconds, it would take object S to travel a distance of 24x inches if the speed of
object R were twice, not half, the speed of object S.
Choice C is incorrect. This expression represents the time, in seconds, it takes object S to travel a distance of 128x inches, not 24x inches.
Choice D is incorrect. This expression represents the time, in seconds, it takes object R, not object S, to travel a distance of 24x inches.$qb$);
select seed_pool_question($qb$CB-5dc386fb$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The table below shows the distribution of US states according to whether they have a state-level sales tax and a state-level income tax.
2013 State-Level Taxes
State sales tax No state sales tax
|| || || ||State income tax 39 4
No state income tax 6 1
To the nearest tenth of a percent, what percent of states with a state-level sales tax do not have a state-level income tax?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5dc386fb.png$qb$, $qb$[{"label": "A", "body": "6.0%"}, {"label": "B", "body": "12.0%"}, {"label": "C", "body": "13.3%"}, {"label": "D", "body": "14.0%"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The sum of the number of states with a state-level sales tax is . Of these states, 6 don’t have a state-level
income tax. Therefore, , or about 13.3%, of states with a state-level sales tax don’t have a state-level income tax.
Choice A is incorrect. This is the number of states that have a state-level sales tax and no state-level income tax. Choice B is incorrect. This is the
percent of states that have a state-level sales tax and no state-level income tax. Choice D is incorrect. This is the percent of states that have no
state-level income tax.$qb$);
select seed_pool_question($qb$CB-c47256ca$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An object's speed is 64yardS per second. What is the object's speed, in feet per second? - (1yard = 3feet)$qb$, null, $qb$[{"label": "A", "body": "61"}, {"label": "B", "body": "67"}, {"label": "C", "body": "94"}, {"label": "D", "body": "192"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since 1 yard is equal to 3 feet, 64 yards is equal to 64 yardS ( 3fcct/1yard ) , or 192 feet. It follows that 64 yards per second is
equivalent to 192 feet per second. Therefore, the object's speed is 192 feet per second.
Choice A is incorrect. A speed of 61 feet per second is equivalent to 61/3 , not 64, yards per second.
Choice B is incorrect. A speed of 67 feet per second is equivalent to 67/3 , not 64, yards per second.
Choice C is incorrect. A speed of 94 feet per second is equivalent to 94/3 , not 64, yards per second.$qb$);
select seed_pool_question($qb$CB-86684ce9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The result of increasing the quantity x by 1,800% is 684. What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "12,996"}, {"label": "B", "body": "12,312"}, {"label": "C", "body": "38"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the result of increasing the quantity x by 1,800% is 684. It follows that x + ( (1,8o0)/100 ) x = 684, which is
equivalent to x + 18x = 684, or 19x = 684. Dividing each side of this equation by 19 yields x = 36. Therefore, the value of x is 36.
Choice A is incorrect. The result of increasing the quantity 12,996 by 1,800% is 246,924, not 684.
Choice B is incorrect. The result of increasing the quantity 12,312 by 1,800% is 233,928, not 684.
Choice C is incorrect. The result of increasing the quantity 38 by 1,800% is 722, not 684.$qb$);
select seed_pool_question($qb$CB-551c52b9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Tilly earns p dollars for every w hours of work. Which expression represents the amount of money, in dollars, Tilly earns for 39w hours of work?$qb$, null, $qb$[{"label": "A", "body": "39p"}, {"label": "B", "body": "p/39"}, {"label": "C", "body": "p + 39"}, {"label": "D", "body": "p - 39"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that Tilly earns p dollars for every w hours of work. This can be represented by the proportion . The amount of
3p/(9^(w)p) w = xw
money, x, Tilly earns for 39w hours of work can be found by setting up the proportion p/w = x/39w . This can be rewritten as . Dividing
both sides by w results in x = 39p.
Choice B is incorrect. This is the amount of money Tilly earns in dollars per hour, not the amount of money Tilly earns for 39w hours of work.
Choice C is incorrect. This is the amount of money Tilly earns for w hours of work plus 39, not the amount of money Tilly earns for 39w hours of
work.
Choice D is incorrect. This is the amount of money Tilly earns for w hours of work minus 39, not the amount of money Tilly earns for 39w hours
of work.$qb$);
select seed_pool_question($qb$CB-e97fd3f8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The owner of a restaurant supply store selects 10 cutting boards to put on sale. The graph shows the width x, in centimeters, of each cutting
board and its corresponding sale price y, in dollars, where each value of y is an integer.
y
90
80
70
60
50
|| | | | | | | ?
40
30
20
10
x
O 12 24 36 48 60 72
According to the graph, which statement is true?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e97fd3f8.png$qb$, $qb$[{"label": "A", "body": "Cutting boards that have a width greater than 48 centimeters have an average sale price of $59·00."}, {"label": "B", "body": "Cutting boards that have a width greater than 48 centimeters have an average sale price of $40·00."}, {"label": "C", "body": "Cutting boards that have a width between 18 and 48 centimeters have an average sale price of $31·20."}, {"label": "D", "body": "Cutting boards that have a width between 18 and 48 centimeters have an average sale price of $23·00."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Each point (x, y) on the scatterplot gives the width x, in centimeters, and the sale price y, in dollars, of one of the 10 cutting
boards put on sale at this store. According to the graph, 5 cutting boards have widths that are between 18 and 48 centimeters. These widths, in
centimeters, are 2424, , 30, 36, and 42. The sale prices, in dollars, corresponding to these widths are 10, 1520, , 30, and 40, respectively. The
average of these sale prices, in dollars, is (10+15+20+30+40)/5 , or , which is equivalent to 23. Therefore, cutting boards that have a width
115/($2^(5)3)·00
between 18 and 48 centimeters have an average sale price of .
Choice A is incorrect. Cutting boards that have a width greater than 48 centimeters have an average sale price of $63·75, not $59·00.
Choice B is incorrect. Cutting boards that have a width greater than 48 centimeters have an average sale price of $63·75, not $40·00.
Choice C is incorrect. Cutting boards that have a width between 18 and 48 centimeters have an average sale price of $23·00, not $31·20.$qb$);
select seed_pool_question($qb$CB-014c47ab$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Site A Site B Total
Tulip 35 15 50
||| ||| ??? ||| |||
Daffodil 31 21 52
Total 66 36 102
The table shows the distribution of two types of flowers at two different sites. If a flower represented in the table is selected at random, what is
the probability of selecting a flower from site A, given that the flower is a tulip? (Express your answer as a decimal or fraction, not as a percent.)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-014c47ab.png$qb$, null, null, array[$qb$0.7$qb$, $qb$7/10$qb$]::text[], $qb$The correct answer is 35/50 . Based on the table, there are a total of 50 tulips, and 35 of these tulips are from site A. The probability of selecting at
random a flower from site A, given that the flower is a tulip, is equal to the number of tulips from site A divided by the total number of tulips,
which can be written as 35/50 , or 7/10 . Note that 35/50, 7/10, and .7 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-1180401d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The total area of a coastal city is 92.1 square miles, of which 11.3 square miles is water. If the city had a population of 621,000 people in the year
2010, which of the following is closest to the population density, in people per square mile of land area, of the city at that time?$qb$, null, $qb$[{"label": "A", "body": "6,740"}, {"label": "B", "body": "7,690"}, {"label": "C", "body": "55,000"}, {"label": "D", "body": "76,000"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The land area of the coastal city can be found by subtracting the area of the water from the total area of the coastal city; that
is,  square miles. The population density is the population divided by the land area, or , which is
closest to 7,690 people per square mile.
Choice A is incorrect and may be the result of dividing the population by the total area, instead of the land area. Choice C is incorrect and may be
the result of dividing the population by the area of water. Choice D is incorrect and may be the result of making a computational error with the
decimal place.$qb$);
select seed_pool_question($qb$CB-57481175$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The bar graph shows the number of each type of monkey in a sanctuary.
12
11
10
9
8
7
Number of monkeys 6 |?????
5
4
3
2
1
0
mandrill baboon vervet
pygmy marmosetbonnet macaque
Type of monkey
How many more vervets are in this sanctuary than mandrills?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-57481175.png$qb$, $qb$[{"label": "A", "body": "11"}, {"label": "B", "body": "6"}, {"label": "C", "body": "5"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the bar graph shows the number of each type of monkey in a sanctuary. The bar representing the number of
mandrills has a height of 5; therefore, there are 5 mandrills in the sanctuary. The bar representing vervets has a height of 11; therefore, there are
11 vervets in the sanctuary. Therefore, there are 11 - 5, or 6, more vervets in this sanctuary than mandrills.
Choice A is incorrect. This is the number of vervets in the sanctuary.
Choice C is incorrect. This is the number of mandrills in the sanctuary.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1b8e412e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-11 -9, , 26
A data set of three numbers is shown. If a number from this data set is selected at random, what is the probability of selecting a positive
number?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1/3"}, {"label": "C", "body": "2/3"}, {"label": "D", "body": "1"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The probability of selecting a positive number is the number of positive numbers in the data set divided by the total number
of numbers in the data set. There is 1 positive number in this data set. There are 3 total numbers in this data set. Thus, if a number from this data
set is selected at random, the probability of selecting a positive number is 1/3 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the probability of selecting a negative number from this data set.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f6cbb04a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The equation above can be used to calculate the distance d, in miles, traveled by a car moving at a speed of 55 miles per hour over a period of t
hours. For any positive constant k, the distance the car would have traveled after  hours is how many times the distance the car would have
traveled after hours?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f6cbb04a.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "6"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since the distance is equal to the amount of time multiplied by a constant, the given equation  represents a
proportional relationship between distance and time in this situation. Since , the time when  hours is 3 times the time when
hours. Therefore, the distance traveled after  hours is 3 times the distance after  hours.
Choices B and D are incorrect and may result from interpreting the proportional relationship between time and distance as additive rather than
multiplicative. Choice C is incorrect and may result from an arithmetic error.$qb$);
select seed_pool_question($qb$CB-568bc2a4$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A distance of 354 furlongs is equivalent to how many feet? - (1furIong = 220yardSand1yard = 3feet)$qb$, null, $qb$[{"label": "A", "body": "306"}, {"label": "B", "body": "402"}, {"label": "C", "body": "25,960"}, {"label": "D", "body": "233,640"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that 1furIong = 220yardS and 1yard = 3feet. It follows that a distance of 354 furlongs is equivalent to
(354 furIongS) ( 220yard8/1fur10ng ) ( 3fcet/1yard ) , or 233,640 feet.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-96c3e32d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$One side of a flat board has an area of 874 square inches. If a pressure of 19 pounds per square inch of area is exerted on this side of the board,
what is the total force, in pounds, exerted on this side of the board?$qb$, null, null, null, array[$qb$16606$qb$]::text[], $qb$The correct answer is 16,606. It's given that one side of a flat board has an area of 874 square inches. If a pressure of 19 pounds per square
inch of area is exerted on this side of the board, the total force exerted on this side of the board is (874 Square incheS) ( 19Pound8/(1 Squarc inch) ) , or
16,606 pounds.$qb$);
select seed_pool_question($qb$CB-98958ae8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Data set A consists of the heights of 75 objects and has a mean of 25 meters. Data set B consists of the heights of 50 objects and has a mean
of 65 meters. Data set C consists of the heights of the 125 objects from data sets A and B. What is the mean, in meters, of data set C?$qb$, null, null, null, array[$qb$41$qb$]::text[], $qb$The correct answer is 41 . The mean of a data set is computed by dividing the sum of the values in the data set by the number of values in the
data set. It’s given that data set A consists of the heights of 75 objects and has a mean of 25 meters. This can be represented by the equation
x/75 = 25, where x represents the sum of the heights of the objects, in meters, in data set A. Multiplying both sides of this equation by 75 yields
x = 75(25), or x = 1,875 meters. Therefore, the sum of the heights of the objects in data set A is 1,875 meters. It’s also given that data set B
consists of the heights of 50 objects and has a mean of 65 meters. This can be represented by the equation y/50 = 65, where y represents the
sum of the heights of the objects, in meters, in data set B. Multiplying both sides of this equation by 50 yields y = 50(65) , or y = 3,250 meters.
Therefore, the sum of the heights of the objects in data set B is 3,250 meters. Since it’s given that data set C consists of the heights of the 125
objects from data sets A and B, it follows that the mean of data set C is the sum of the heights of the objects, in meters, in data sets A and B
divided by the number of objects represented in data sets A and B, or (1,875+3,250)/125 , which is equivalent to 41 meters. Therefore, the mean, in
meters, of data set C is 41.$qb$);
select seed_pool_question($qb$CB-391ae4b2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Data set F consists of 55 integers between 170 and 290. Data set G consists of all the integers in data set F as well as the integer 10. Which of
the following must be less for data set F than for data set G?
I. The mean
II. The median$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that data set F consists of 55 integers between 170 and 290 and data set G consists of all the integers in data set
F as well as the integer 10. Since the integer 10 is less than all the integers in data set F, the mean of data set G must be less than the mean of
data set F. Thus, the mean of data set F isn't less than the mean of data set G. When a data set is in ascending order, the median is between the
two middle values when there is an even number of values and the median is the middle value when there is an odd number of values. It follows
that the median of data set F is either greater than or equal to the median of data set G. Therefore, the median of data set F isn't less than the
median of data set G. Thus, neither the mean nor the median must be less for data set F than for data set G.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4096a482$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Based on a random sample from a population, a researcher estimated that the mean value of a certain variable for the population is 20·5, with
an associated margin of error of 1. Which of the following is the most appropriate conclusion?$qb$, null, $qb$[{"label": "A", "body": "It is plausible that the actual mean value of the variable for the population is between 19·5 and 21·5."}, {"label": "B", "body": "It is not possible that the mean value of the variable for the population is less than 19·5 or greater than 21·5."}, {"label": "C", "body": "Every value of the variable in the population is between 19·5 and 21·5."}, {"label": "D", "body": "The mean value of the variable for the population is 20·5."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that based on a random sample from a population, the estimated mean value for a certain variable for the
population is 20·5, with an associated margin of error of 1. This means that it is plausible that the actual mean value of the variable for the
population is between 20·5 - 1 and 20·5 + 1. Therefore, the most appropriate conclusion is that it is plausible that the actual mean value of the
variable for the population is between 19·5 and 21·5.
Choice B is incorrect. The estimated mean value and associated margin of error describe only plausible values, not all the possible values, for the
actual mean value of the variable, so this is not an appropriate conclusion.
Choice C is incorrect. The estimated mean value and associated margin of error describe only plausible values for the actual mean value of the
variable, not all the possible values of the variable, so this is not an appropriate conclusion.
Choice D is incorrect. Since 20·5 is the estimated mean value of the variable based on a random sample, the actual mean value of the variable
may not be exactly 20·5. Therefore, this is not an appropriate conclusion.$qb$);
select seed_pool_question($qb$CB-57f45509$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-| ?| |
|-| | | | | |
2 3 4 5 6 7 8
The box plot summarizes 15 data values. What is the median of this data set?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-57f45509.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "3"}, {"label": "C", "body": "5"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The median of a data set represented in a box plot is given by the vertical line within the box. In the given box plot, the
vertical line within the box occurs at 5. Therefore, the median of this data set is 5.
Choice A is incorrect. This is the minimum value of the data set.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect. This is the maximum value of the data set.$qb$);
select seed_pool_question($qb$CB-2a59eb45$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Data set A consists of the heights of 75 buildings and has a mean of 32 meters. Data set B consists of the heights of 50 buildings and has a
mean of 62 meters. Data set C consists of the heights of the 125 buildings from data sets A and B. What is the mean, in meters, of data set C?$qb$, null, null, null, array[$qb$44$qb$]::text[], $qb$The correct answer is 44. The mean of a data set is computed by dividing the sum of the values in the data set by the number of values in the
data set. It's given that data set A consists of the heights of 75 buildings and has a mean of 32 meters. This can be represented by the equation
x/75 = 32, where x represents the sum of the heights of the buildings, in meters, in data set A. Multiplying both sides of this equation by 75 yields
x = 75(32), or x = 2,400 meters. Therefore, the sum of the heights of the buildings in data set A is 2,400 meters. It's also given that data set
B consists of the heights of 50 buildings and has a mean of 62 meters. This can be represented by the equation y/50 = 62, where y represents
the sum of the heights of the buildings, in meters, in data set B. Multiplying both sides of this equation by 50 yields y = 50(62) , or y = 3,100
meters. Therefore, the sum of the heights of the buildings in data set B is 3,100 meters. Since it's given that data set C consists of the heights of
the 125 buildings from data sets A and B, it follows that the mean of data set C is the sum of the heights of the buildings, in meters, in data sets
A and B divided by the number of buildings represented in data sets A and B, or (2,4o0+3,100)/125 , which is equivalent to 44 meters. Therefore, the
mean, in meters, of data set C is 44.$qb$);
select seed_pool_question($qb$CB-623dbebb$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A reseller buys certain books for a purchase price of 5·00 dollars each and then marks them each for sale at a consumer price that is 270% of
the purchase price. After 4 months, any remaining books not yet sold are marked at a discounted price that is 70% off the consumer price. What
is the discounted price of each of the remaining books, in dollars?$qb$, null, null, null, array[$qb$4.05$qb$, $qb$81/20$qb$]::text[], $qb$The correct answer is 4·05. It's given that the purchase price for certain books is 5·00 dollars each. It's also given that each book is marked for
sale at a consumer price that is 270% of the purchase price. Since the consumer price is 270% of the purchase price of 5·00 dollars, it follows
that the consumer price is (2·7)(5·00), or 13·50, dollars. It's given that after 4 months, any remaining books are discounted at 70% off the
consumer price. Thus, the discount amount is (0·7)(13·50) , or 9·45, dollars. Subtracting the discount amount from the consumer price gives
the discounted price of each of the remaining books: 13·50 - 9·45 = 4·05. Note that 4.05 and 81/20 are examples of ways to enter a correct
answer.$qb$);
select seed_pool_question($qb$CB-2afd3cec$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$After 20% of the original number of marbles in a group were removed from the group, 360 marbles remained in the group. How many marbles
were removed from the group?$qb$, null, $qb$[{"label": "A", "body": "72"}, {"label": "B", "body": "90"}, {"label": "C", "body": "450"}, {"label": "D", "body": "1,800"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that 20% of the original number of marbles were removed from the group. Let x represent the original number of
marbles in the group. It follows that 20/10o x, or 0·20x, marbles were removed from the group. Therefore, x - 0·20x marbles remained in the
group. It's also given that 360 marbles remained in the group. Thus, x - 0·20x = 360, or 0·80x = 360. Dividing both sides of this equation by
0·80 yields x = 450. Substituting 450 for x in the expression 0·20x yields 0·20(450), or 90. Therefore, 90 marbles were removed from the
group.
Choice A is incorrect. This is 20% of the remaining number of marbles.
Choice C is incorrect. This is the original number of marbles, not the number of marbles that were removed.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2e92cc21$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number a is 110% greater than the number b. The number b is 90% less than 47. What is the value of a?$qb$, null, null, null, array[$qb$9.87$qb$, $qb$987/100$qb$]::text[], $qb$The correct answer is 9·87. It’s given that the number a is 110% greater than the number b. It follows that , or a = 2·1b. It’s
a = ( 1 +b 110/(=1004) )·b7
also given that the number b is 90% less than 47. It follows that , or b = 0·1(47) , which yields . Substituting 4·7 for
b = (1a-=9o/(190·08))7(47)
b in the equation a = 2·1b yields a = 2·1(4·7), which is equivalent to . Therefore, the value of a is 9·87.$qb$);
select seed_pool_question($qb$CB-7f84b136$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table summarizes the number of objects in each group.
Number of
Group
objects
A 375
|||| |||| ????B 54
C 690
D 81
Total
The number of objects in group C is p% of the number of objects in group A. What is the value of p?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7f84b136.png$qb$, null, null, array[$qb$184$qb$]::text[], $qb$The correct answer is 184. It's given in the table that there are 375 objects in group A and 690 objects in group C. It’s also given that the number
of objects in group C is p% of the number of objects in group A. Therefore, 690 is p% of 375, which can be represented by 690 = (p/10o) (375) ,
or 690 = 3·75p. Dividing both sides of this equation by 3·75 yields 184 = p. Therefore, the value of p is 184.$qb$);
select seed_pool_question($qb$CB-77cf4fa6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are 170 blocks in a container. Of these blocks, 10% are green. How many blocks in the container are green?$qb$, null, null, null, array[$qb$17$qb$]::text[], $qb$The correct answer is 17. It's given that there are 170 blocks in a container, and of these blocks, 10% are green. Since 10% can be rewritten as
1o/100 , or 0·1, the number of green blocks in the container is 0·1 (170) , or 17.$qb$);
select seed_pool_question($qb$CB-2d31caae$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Call Ratings
1 Star 2 Stars 3 Stars 4 Stars Total
Employee A 16 49 72 8 145
Employee B 4 10 22 34 70
||||| ||||| ||||| ||||| ????? ????? |||||
Employee C 8 56 45 16 125
Employee D 22 42 84 12 160
Total 50 157 223 70 500
A supervisor at a call center reviewed 500 calls taken by four employees and rated the employees’ performance on each call on a scale from 1
star to 4 stars. The ratings for each employee are shown in the table above. According to the table, to the nearest whole percent, what percent of
Employee A’s calls received a rating of 1 star?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2d31caae.png$qb$, $qb$[{"label": "A", "body": "3%"}, {"label": "B", "body": "11%"}, {"label": "C", "body": "16%"}, {"label": "D", "body": "32%"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The percent of Employee A’s calls that received a rating of 1 star is the number of Employee A’s 1-star calls divided by the
total number of Employee A’s calls. This quotient, , is approximately equal to , or . To the nearest whole percent, this is
11%.
Choice A is incorrect. This is the percent of all calls taken by Employee A that received a rating of 1 star. Choice C is incorrect and may result
from a conceptual error. For example, 16 is the number, not the percent, of calls taken by Employee A that received a rating of 1 star. Choice D is
incorrect. This is the percent of all calls that received a rating of 1 star that were taken by Employee A.$qb$);
select seed_pool_question($qb$CB-4a422e3e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To determine the mean number of children per household in a community, Tabitha surveyed 20 families at a playground. For the 20 families
surveyed, the mean number of children per household was 2.4. Which of the following statements must be true?$qb$, null, $qb$[{"label": "A", "body": "The mean number of children per household in the community is 2.4."}, {"label": "B", "body": "A determination about the mean number of children per household in the community should not be made because the sample size is too small."}, {"label": "C", "body": "The sampling method is flawed and may produce a biased estimate of the mean number of children per household in the community."}, {"label": "D", "body": "The sampling method is not flawed and is likely to produce an unbiased estimate of the mean number of children per household in the community."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. In order to use a sample mean to estimate the mean for a population, the sample must be representative of the population
(for example, a simple random sample). In this case, Tabitha surveyed 20 families in a playground. Families in the playground are more likely to
have children than other households in the community. Therefore, the sample isn’t representative of the population. Hence, the sampling method
is flawed and may produce a biased estimate.
Choices A and D are incorrect because they incorrectly assume the sampling method is unbiased. Choice B is incorrect because a sample of size
20 could be large enough to make an estimate if the sample had been representative of all the families in the community.$qb$);
select seed_pool_question($qb$CB-f496d2c0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The table shows the distribution of rooms in a certain facility by seating capacity.
Seating
Proportion
capacity
Less than 18
26%
seats
(|| ||)/41|| ||(---21% ??)/(29%)??
–40 seats
–65 seats
Greater than 65
24%
seats
If a room in this facility is selected at random, which of the following is closest to the probability of selecting a room that has a seating capacity
greater than 65 seats, given that the room has a seating capacity of at least 18 seats?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f496d2c0.png$qb$, $qb$[{"label": "A", "body": "0·24"}, {"label": "B", "body": "0·32"}, {"label": "C", "body": "0·50"}, {"label": "D", "body": "0·92"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the proportion of rooms with less than 18 seats is 26%, which is equivalent to 0·26. It’s also given that the
proportion of rooms with 18–40 seats is 21%, or 0·21 ; that the proportion of rooms with 41 –65 seats is 29%, or 0·29; and that the proportion
of rooms with greater than 65 seats is 24%, or 0·24. The probability of selecting a room that has a seating capacity greater than 65 seats given
that the room has a seating capacity of at least 18 seats is equal to the proportion of rooms that have a seating capacity of greater than 65
seats divided by the proportion of rooms that have a seating capacity of at least 18 seats. Rooms with a seating capacity of at least 18 seats
include the categories 18–40 seats, 41 –65 seats, and greater than 65 seats, so the total proportion for this condition can be written as 0·21
+ 0·29 + 0·24, or 0·74. Therefore, the probability of selecting a room that has a seating capacity greater than 65 seats given that it has a
seating capacity of at least 18 seats is (0·24)/(0·74) , or approximately 0·324. Of the given choices, 0·32 is closest to 0·324.
Choice A is incorrect. This is the probability of selecting a room that has a seating capacity greater than 65 seats from all rooms in the facility,
not just rooms that meet the condition of having a seating capacity of at least 18 seats.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-94660ba8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A participant in a bicycle race completes the race with an average speed of 24,816 yards per hour. What is this average speed, in miles per-
hour? (1miIe = 1,760yardS)$qb$, null, null, null, array[$qb$14.1$qb$]::text[], $qb$The correct answer is 14·1 . It’s given that a participant completes the bicycle race with an average speed of  yards per hour and 1miIe
2(414^(,)·811m6i1c8)/(1 h9ur)
= 1,760yardS. It follows that this average speed is equivalent to ( (24,816yard8)/(1 h0ur) ) ( 1miIc/(1,76oyardS) ) , which yields , or 14·1 miles per hour.$qb$);
select seed_pool_question($qb$CB-ba0e23b0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$140 is p% greater than 10. What is the value of p?$qb$, null, $qb$[{"label": "A", "body": "1,400"}, {"label": "B", "body": "1,300"}, {"label": "C", "body": "140"}, {"label": "D", "body": "130"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that 140 is p% greater than 10. It follows that 140 = 10 + (p/10o) 10, which is equivalent to , or
140 = 10 + 10/(11,o300)p0
140 = 10 + 0·1p. Subtracting 10 from each side of this equation yields 130 = 0·1p. Dividing each side of this equation by 0·1 yields
= p, or p = 1,300.
Choice A is incorrect. This would be the value of p if 140 were p% of 10, not p% greater than 10.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c2e7fa6d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For an electric field passing through a flat surface perpendicular to it, the electric flux of the electric field through the surface is the product of
the electric field’s strength and the area of the surface. A certain flat surface consists of two adjacent squares, where the side length, in meters,
of the larger square is 3 times the side length, in meters, of the smaller square. An electric field with strength 29·00 volts per meter passes
uniformly through this surface, which is perpendicular to the electric field. If the total electric flux of the electric field through this surface is
4,640 V0ItS · meterS, what is the electric flux, in V0ItS · meterS, of the electric field through the larger square?$qb$, null, null, null, array[$qb$4176$qb$]::text[], $qb$The correct answer is 4,176. It’s given that the side length of the larger square is 3 times the side length of the smaller square. This means that
the area of the larger square is 3^(2), or 9, times the area of the smaller square. If the area of the smaller square is represented by x, then the area
of the larger square can be represented by 9x. Therefore, the flat surface of the two adjacent squares has a total area of x + 9x, or 10x. It’s
given that an electric field with strength 29·00 volts per meter passes uniformly through this surface and the total electric flux of the electric field
through this surface is 4,640 V0ItS · meterS. Since it's given that the electric flux is the product of the electric field’s strength and the area of
the surface, the equation 29·00(10x) = 4,640, or 290x = 4,640, can be used to represent this situation. Dividing each side of this equation by
290 yields x = 16. Substituting 16 for x in the expression for the area of the larger square, 9x, yields 9(16), or 144, square meters. Since the
area of the larger square is 144 square meters, the electric flux, in V01tS · meterS, of the electric field through the larger square can be
determined by multiplying the area of the larger square by the strength of the electric field. Thus, the electric flux is
( 144 Square meterS) ( (29·0oV0It8)/mctcr ) , or 4, 176 VoItS · meterS.$qb$);
select seed_pool_question($qb$CB-9b9da812$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y
6
5
4
?|| | | | | | | ?
3
2
1
x
O 1 2 3 4 5 6
Which of the following equations is the most appropriate linear model for the data shown in the scatterplot?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9b9da812.png$qb$, $qb$[{"label": "A", "body": "y = -0·606x"}, {"label": "B", "body": "y = 0·606 - 1·001x"}, {"label": "C", "body": "y = 0·606x"}, {"label": "D", "body": "y = 0·606 + 1·001x"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A linear model can be written in the form y = mx + b, where m is the slope of the graph of the model in the xy-plane and
(0, b) is the y-intercept. The graph of an appropriate linear model for the data shown in the scatterplot passes near the points  and (4, 2·4)
in the xy-plane. Two points on a line, (x1 , y1 ) and (x2 , y2 ), can be used to find the slope of the line using the slope formula, mm(0==, 0()y2-y1)/(0x· 26-0x1) .
Substituting the points (0, 0) and (4, 2·4) for (x1,y1 ) and (x2 , y2 ) , respectively, in the slope formula yields , or .
ym= =m(2·4-0)/(x4+-ob)
Therefore, the value of m for an appropriate linear model is approximately 0·60. Substituting 0·60 for m in  yields y = 0·60x + b.
Since an appropriate linear model passes near the point (0, 0), it follows that b is approximately 0 and an appropriate linear model for the data is
y = 0·60x + 0. Thus, of the given choices, y = 0·606x is the most appropriate linear model for these data.
Alternate approach: A linear model can be written in the form y = mx + b, where m is the slope of the graph of the model in the xy-plane and
(0, b) is the y-intercept. The scatterplot shows that as the x-values of the data points increase, the y-values of the data points increase, which
means the graph of an appropriate linear model has a positive slope. The scatterplot also shows that an appropriate linear model would pass
close to the point (0, 0) . Of the given choices, y = 0·606x is the only linear model whose graph has a positive slope and a y-intercept of (0, 0).
Choice A is incorrect. The graph of this model has a negative slope, not a positive slope.
Choice B is incorrect. The graph of this model has a negative slope, not a positive slope, and a y-intercept that is not (0, 0).
Choice D is incorrect. The graph of this model has a slope that is too steep to fit the data, and a y-intercept that is not (0, 0) .$qb$);
select seed_pool_question($qb$CB-e821a26d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The scatterplot below shows the amount of electric energy generated, in millions of megawatt-hours, by nuclear sources over a 10‑year period.
Of the following equations, which best models the data in the scatterplot?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e821a26d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The data in the scatterplot roughly fall in the shape of a downward-opening parabola; therefore, the coefficient for the
term must be negative. Based on the location of the data points, the y-intercept of the parabola should be somewhere between 740 and 760.
Therefore, of the equations given, the best model is .
Choices A and C are incorrect. The positive coefficient of the  term means that these equations each define upward-opening parabolas,
whereas a parabola that fits the data in the scatterplot must open downward. Choice B is incorrect because it defines a parabola with a y-
intercept that has a negative y-coordinate, whereas a parabola that fits the data in the scatterplot must have a y-intercept with a positive y-
coordinate.$qb$);
select seed_pool_question($qb$CB-21e539a0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A landscaper uses a hose that puts 88x ounces of water in a bucket in 5y minutes. Which expression represents the number of ounces of water
the hose puts in the bucket in 9y minutes at this rate?$qb$, null, $qb$[{"label": "A", "body": "9x/440"}, {"label": "B", "body": "440x/9"}, {"label": "C", "body": "5x/792"}, {"label": "D", "body": "792x/5"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that a hose puts 88x ounces of water in a bucket in 5y minutes. Therefore, the rate at which the hose puts water in
the bucket, in ounces per minute, can be represented by the expression 88x/5y . Let w represent the number of ounces of water the hose puts in the
bucket in 9y minutes at this rate. It follows that the rate at which the hose puts water in the bucket, in ounces per minute, can be represented by
the expression . The expressions 88x/5y and w/9y represent the same rate, so it follows that 88x/5y = w/9y. Multiplying both sides of this equation by
792xy/5yw/(9=y) w
9y yields , or 792x/5 = w. Therefore, the number of ounces of water the hose puts in the bucket in 9y minutes can be represented by
the expression 792x/5 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9eb896c5$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following could be the equation for a line of best fit for the data shown in the scatterplot above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9eb896c5.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The data show a strong linear relationship between x and y. The line of best fit for a set of data is a linear equation that
minimizes the distances from the data points to the line. An equation for the line of best fit can be written in slope-intercept form,
, where m is the slope of the graph of the line and b is the y-coordinate of the y-intercept of the graph. Since, for the data shown,
the y-values increase as the x-values increase, the slope of a line of best fit must be positive. The data shown lie almost in a line, so the slope can
be roughly estimated using the formula for slope, . The leftmost and rightmost data points have coordinates of about
and , so the slope is approximately , which is a little greater than 3. Extension of the line to the left would intersect the
y-axis at about . Only choice A represents a line with a slope close to 3 and a y-intercept close to .
Choice B is incorrect and may result from switching the slope and y-intercept. The line with a y-intercept of  and a slope of 0.8 is farther
from the data points than the line with a slope of 3 and a y-intercept of . Choices C and D are incorrect. They represent lines with
negative slopes, not positive slopes.$qb$);
select seed_pool_question($qb$CB-194ae3b1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There were approximately 113,000 occupational therapy jobs in the United States in 2012. The Bureau of Labor Statistics has projected that this
number will increase by 29% from 2012 to 2022. Of the following, which is closest to the number of occupational therapy jobs the bureau has
projected for the United States in 2022?$qb$, null, $qb$[{"label": "A", "body": "115,900"}, {"label": "B", "body": "116,300"}, {"label": "C", "body": "142,000"}, {"label": "D", "body": "145,800"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The decimal equivalent of 29% is 0.29. It’s given that the 113,000 occupational therapy jobs in the United States in 2012 are
projected to increase by 29% by 2022. Increasing 113,000 by 29% can be expressed as , or .
Evaluating this expression yields 145,770. The closest number is 145,800 in choice D.
Choice A is incorrect and may result from increasing 113,000 by 2,900 instead of by 29%. Choice B is incorrect and may result from increasing
113,000 by 2.9% instead of by 29%. Choice C is incorrect and may result from increasing 113,000 by 29,000 instead of by 29%.$qb$);
select seed_pool_question($qb$CB-79340403$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$fbb??m?OOO^(S)e? 476235100000000 | ? ? ? ? ? ? ? ? ? ?
I 2 3 4 5 6 7 8 9 I0
?r0uP
The bar graph shows the distribution of 414 books collected by 10 different groups for a book drive. How many books were collected by group
1?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-79340403.png$qb$, null, null, array[$qb$30$qb$]::text[], $qb$The correct answer is 30. The height of each bar in the bar graph shown represents the number of books collected by the group specified at the
bottom of the bar. The bar for group 1 reaches a height of 30. Therefore, group 1 collected 30 books.$qb$);
select seed_pool_question($qb$CB-a8fabad0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A waiter receives tips from each customer. On average, the tip is 15% of the customer’s bill. At this rate, which of the following is closest to the
tip the waiter can expect when a customer has a bill that is $78.20?$qb$, null, $qb$[{"label": "A", "body": "$8.00"}, {"label": "B", "body": "$10.00"}, {"label": "C", "body": "$12.00"}, {"label": "D", "body": "$14.00"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If the bill is $78.20, 15% of the bill can be found by multiplying 78.20 by the decimal conversion of 15%, 78.20 × 0.15 =
$11.73. The exact amount $11.73 is closest in value to $12.00.
Choices A, B, and D are incorrect and may be the result of errors when calculating 15% of the total $78.20.$qb$);
select seed_pool_question($qb$CB-4837406c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An object travels at a constant speed of 6 centimeters per second. At this speed, what is the time, in seconds, that it would take for the object to
travel 24 centimeters?$qb$, null, null, null, array[$qb$4$qb$]::text[], $qb$The correct answer is 4. It’s given that the object travels at a constant speed of 6 centimeters per second. The speed of the object can be written
as (6 ccutimcter8)/(1 Sec9nd) . Let x represent the time, in seconds, it would take for the object to travel 24 centimeters. The value of x can be calculated by
solving the equation (6 ccntimcter8)/(1 8ec9ud) = (24 ccntimeter8)/(x Second8) , which can be written as 6/1 = 24/x , or 6 = 24/x . Multiplying each side of this equation by x
yields 6x = 24. Dividing each side of this equation by 6 yields x = 4. Therefore, it would take the object 4 seconds to travel 24 centimeters.$qb$);
select seed_pool_question($qb$CB-d112bc9d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the temperature y, in ^(°)F, recorded by a meteorologist at various times x, in days since June 1.
????
441020504050602080776622883355II0000000000000000?-/(-1II| 222| ?33| 444| 555| 666| 777| 888|)(- ?)/(? ? ?)| | ?| | | | | | | |x
?tm??epeae?
?ime (da?SSinCe ?une 1)
During which of the following time periods did the greatest increase in recorded temperature take place?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d112bc9d.png$qb$, $qb$[{"label": "A", "body": "From x = 6 to x = 7"}, {"label": "B", "body": "From x = 5 to x = 6"}, {"label": "C", "body": "From x = 2 to x = 3"}, {"label": "D", "body": "From x = 1 to x = 2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The scatterplot shows that there was an increase in recorded temperature from x = 2 to x = 3 and from x = 6 to x = 7.
When x = 2, the recorded temperature was approximately 60^(°)F and when x = 3, the recorded temperature was greater than 70^(°)F. This means
that the increase in recorded temperature from x = 2 to x = 3 was greater than (70 - 60)^(?)F, or 10^(?)F. When x = 6, the recorded temperature
was greater than 60^(°)F and when x = 7, the recorded temperature was less than 70^(°)F. This means that the increase in recorded temperature
from x = 6 to x = 7 was less than (70 - 60)^(°)F, or 10^(?)F. It follows that the greatest increase in recorded temperature took place from x = 2
to x = 3.
Choice A is incorrect. The increase in recorded temperature from x = 6 to x = 7 was less than the increase in recorded temperature from x
= 2 to x = 3.
Choice B is incorrect. From x = 5 to x = 6, a decrease, not an increase, in recorded temperature took place.
Choice D is incorrect. From x = 1 to x = 2, a decrease, not an increase, in recorded temperature took place.$qb$);
select seed_pool_question($qb$CB-99550621$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Makayla is planning an event in a 5,400-square-foot room. If there should be at least 8 square feet per person, what is the maximum number of
people that could attend this event?$qb$, null, $qb$[{"label": "A", "body": "588"}, {"label": "B", "body": "675"}, {"label": "C", "body": "15,274"}, {"label": "D", "body": "43,200"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the event will be in a 5,400-square-foot room and that there should be at least 8 square feet per person. The
maximum number of people that could attend the event can be found by dividing the total square feet in the room by the minimum number of
square feet needed per person, which gives .
Choices A and C are incorrect and may result from conceptual or computational errors. Choice D is incorrect and may result from multiplying,
rather than dividing, 5,400 by 8.$qb$);
select seed_pool_question($qb$CB-3318d37b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A product costs 11·00 dollars per pound. What is the cost, in dollars, for 6 pounds of the product?$qb$, null, null, null, array[$qb$66$qb$]::text[], $qb$The correct answer is 66. It’s given that a product costs 11·00 dollars per pound. Therefore, the cost for 6 pounds of the product is
( (11·00d011ar8)/1P0und ) (6 P0undS) , which is equivalent to 66·00, or 66, dollars.$qb$);
select seed_pool_question($qb$CB-93779b53$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$fbd?t^(t)?nmO^(S)See?? 4422335II00000055555 | ? ? ? ? ?
1 2 3 4 5
?CtiVit?
A group of students voted on five after-school activities. The bar graph shows the number of students who voted for each of the five activities.
How many students chose activity 3?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-93779b53.png$qb$, $qb$[{"label": "A", "body": "25"}, {"label": "B", "body": "39"}, {"label": "C", "body": "48"}, {"label": "D", "body": "50"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The height of each bar in the bar graph given represents the number of students that voted for the activity specified at the
bottom of the bar. The bar for activity 3 has a height that is between 35 and 40. In other words, the number of students that chose activity 3 is
between 35 students and 40 students. Of the given choices, 39 is the only value between 35 and 40. Therefore, 39 students chose activity 3.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect. This is the number of students that chose activity 5, not activity 3.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-9d935bd8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A survey was given to residents of all 50 states asking if they had earned a bachelor’s degree or higher. The results from 7 of the states are given
in the table above. The median percent of residents who earned a bachelor’s degree or higher for all 50 states was 26.95%. What is the difference
between the median percent of residents who earned a bachelor’s degree or higher for these 7 states and the median for all 50 states?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9d935bd8.png$qb$, $qb$[{"label": "A", "body": "0.05%"}, {"label": "B", "body": "0.95%"}, {"label": "C", "body": "1.22%"}, {"label": "D", "body": "7.45%"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The median of a set of numbers is the middle value of the set values when ordered from least to greatest. If the percents in
the table are ordered from least to greatest, the middle value is 27.9%. The difference between 27.9% and 26.95% is 0.95%.
Choice A is incorrect and may be the result of calculation errors or not finding the median of the data in the table correctly. Choice C is incorrect
and may be the result of finding the mean instead of the median. Choice D is incorrect and may be the result of using the middle value of the
unordered list.$qb$);
select seed_pool_question($qb$CB-8c5dbd3e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number w is 110% greater than the number z. The number z is 55% less than 50. What is the value of w?$qb$, null, null, null, array[$qb$189/4$qb$, $qb$47.25$qb$]::text[], $qb$The correct answer is 47·25. It’s given that the number w is 110% greater than the number z. It follows that , or w = 2 · 1z. It’s
w = ( 1 +z 110/(=1020)2)·z5
also given that the number z is 55% less than 50. It follows that z = (1 - 55/1o0) (50), or z = 0·45(50) , which yields . Substituting
22·5 for z in the equation w = 2 · 1z yields w = 2·1(22·5) , which is equivalent to w = 47·25. Therefore, the value of w is 47·25. Note that
47.25 and 189/4 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-da978ee6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A researcher surveyed a random sample of 1,020 people from a certain city to estimate the percentage of people who support a recently
announced proposal. From the survey, the researcher estimated that 86% of people from the city support this proposal, with an associated
margin of error of 2·13%. The researcher repeated the survey with a random sample of people from the city that was double the original sample
size. Assuming the margins of error were calculated in the same way, which of the following is true about the margin of error associated with the
estimate from the larger sample?$qb$, null, $qb$[{"label": "A", "body": "The margin of error is between 2·13% and 3·13%."}, {"label": "B", "body": "The margin of error is between 4·13% and 5·13%."}, {"label": "C", "body": "The margin of error is greater than 5·13%."}, {"label": "D", "body": "The margin of error is less than 2·13%."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that from the initial survey, the margin of error associated with the estimate was 2·13%. A larger sample size
generally leads to a smaller margin of error. Therefore, assuming the margins of error were calculated in the same way, the margin of error
associated with the estimate from the larger sample is less than 2·13%.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-a067c926$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The bar graph shows the distribution of the number of students from one school who were born in one of four months.
70
60
50
40
Number of students |????
30
20
10
0
July
August October
September
Month
How many more students were born in August than were born in July?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a067c926.png$qb$, $qb$[{"label": "A", "body": "90"}, {"label": "B", "body": "50"}, {"label": "C", "body": "40"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the bar graph shows the number of students from one school who were born in either July, August, September,
or October. The bar representing the number of students born in August has a height of 50; therefore, 50 students were born in August. The bar
representing the number of students born in July has a height of 40; therefore, 40 students were born in July. Thus, there were 50 - 40, or 10
more students born in August than in July.
Choice A is incorrect. This is the total number of students born in July and August.
Choice B is incorrect. This is the number of students born in August.
Choice C is incorrect. This is the number of students born in July.$qb$);
select seed_pool_question($qb$CB-94c65646$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$432 is 96% of what number?$qb$, null, null, null, array[$qb$450$qb$]::text[], $qb$The correct answer is 450. Let x represent the number that 432 is 96% of. This can be written as ( 96/10o ) x = 432, or 0·96x = 432. Dividing
both sides of this equation by 0·96 yields x = 450. Therefore, 432 is 96% of 450.$qb$);
select seed_pool_question($qb$CB-5c24c861$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A study was done to determine a new car’s stopping distance when it was traveling at different speeds. The study was done on a dry road with
good surface conditions. The results are shown below, along with the graph of a quadratic function that models the data.
According to the model, which of the following is the best estimate for the stopping distance, in feet, if the vehicle was traveling 55 miles per
hour?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5c24c861.png$qb$, $qb$[{"label": "A", "body": "25"}, {"label": "B", "body": "30"}, {"label": "C", "body": "210"}, {"label": "D", "body": "250"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Correct Answer Rationale
Choice C is correct. According to the model, the stopping distance, in feet, of a vehicle traveling 55 miles per hour is about 200 feet. Of the
choices given, the best estimate of the stopping distance for a car traveling 55 miles per hour is 210 feet.
Incorrect Answer Rationale
Choices A, B, and D are incorrect and may be the result of incorrectly reading the given quadratic model. The corresponding x-values to the y-
values of 25 and 30 are not part of the model. The corresponding x-value to a y-value of 250 is approximately 60 mph, not 55 mph.$qb$);
select seed_pool_question($qb$CB-5f3ee607$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$10II123456?89004477669922883355II?(-/(||)-/(||)-/(??)-/(??)-/(??)-/(??)(y-|)/(??)?? ||)/(1II 222 333 444 555 666 777 888 999 10II00)| || || || || || || || || || || |x
??
Which of the following equations is the most appropriate linear model for the data shown in the scatterplot?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5f3ee607.png$qb$, $qb$[{"label": "A", "body": "y = -1·9x - 10·1"}, {"label": "B", "body": "y = -1·9x + 10·1"}, {"label": "C", "body": "y = 1·9x - 10·1"}, {"label": "D", "body": "y = 1·9x + 10·1"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The equation representing a linear model can be written in the form y = a + bx, or y = bx + a, where b is the slope of the
graph of the model and (0, a) is the y-intercept of the graph of the model. The scatterplot shows that as the x-values of the data points increase,
the y-values of the data points decrease, which means the graph of an appropriate linear model has a negative slope. Therefore, b < 0. The
scatterplot also shows that the data points are close to the y-axis at a positive value of y. Therefore, the y-intercept of the graph of an appropriate
linear model has a positive y-coordinate, which means a > 0. Of the given choices, only choice B, y = -1·9x + 10·1 , has a negative value for b,
the slope, and a positive value for a, the y-coordinate of the y-intercept.
Choice A is incorrect. The graph of this model has a y-intercept with a negative y-coordinate, not a positive y-coordinate.
Choice C is incorrect. The graph of this model has a positive slope, not a negative slope, and a y-intercept with a negative y-coordinate, not a
positive y-coordinate.
Choice D is incorrect. The graph of this model has a positive slope, not a negative slope.$qb$);
select seed_pool_question($qb$CB-9e2bf782$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A fish hatchery has three tanks for holding fish before they are introduced into the wild. Ten fish weighing less than 5 ounces are placed in tank
A. Eleven fish weighing at least 5 ounces but no more than 13 ounces are placed in tank B. Twelve fish weighing more than 13 ounces are placed
in tank C. Which of the following could be the median of the weights, in ounces, of these 33 fish?$qb$, null, $qb$[{"label": "A", "body": "4.5"}, {"label": "B", "body": "8"}, {"label": "C", "body": "13.5"}, {"label": "D", "body": "15"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The median of a set of numbers is the middle number when the values in the set are ordered from least to greatest. There
are 33 fish, so in an ordered list of the weights, the 17th value would be the median weight. The 10 fish in tank A weigh the least, and these 10
weights would be the first 10 values on the ordered list. The 11 fish in tank B have the next set of higher weights, and so would be the 11th
through 21st weights in the ordered list, which includes the median weight as the 17th value. The fish in tank B weigh at least 5 ounces but no
more than 13 ounces; of the given choices, only 8 ounces falls within this range of values.
Choice A is incorrect. It’s given that tank A has ten fish weighing less than 5 ounces. Since there are more than ten fish in tanks B and C
combined, the median weight cannot be less than 5 ounces. Choice C and D are incorrect. It’s given that tank C has twelve fish weighing more
than 13 ounces. There are more than twelve fish in tanks A and B combined, so the median weight can’t be more than 13 ounces.$qb$);
select seed_pool_question($qb$CB-9ba3e283$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In State X, Mr. Camp’s eighth-grade class consisting of 26 students was surveyed and 34.6 percent of the students reported that they had at least
two siblings. The average eighth‑grade class size in the state is 26. If the students in Mr. Camp’s class are representative of students in the
state’s eighth-grade classes and there are 1,800 eighth-grade classes in the state, which of the following best estimates the number of
eighth‑grade students in the state who have fewer than two siblings?$qb$, null, $qb$[{"label": "A", "body": "16,200"}, {"label": "B", "body": "23,400"}, {"label": "C", "body": "30,600"}, {"label": "D", "body": "46,800"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It is given that 34.6% of 26 students in Mr. Camp’s class reported that they had at least two siblings. Since 34.6% of 26 is
8.996, there must have been 9 students in the class who reported having at least two siblings and 17 students who reported that they had fewer
than two siblings. It is also given that the average eighth-grade class size in the state is 26 and that Mr. Camp’s class is representative of all
eighth-grade classes in the state. This means that in each eighth-grade class in the state there are about 17 students who have fewer than two
siblings. Therefore, the best estimate of the number of eighth-grade students in the state who have fewer than two siblings is 17 × (number of
eighth-grade classes in the state), or .
Choice A is incorrect because 16,200 is the best estimate for the number of eighth-grade students in the state who have at least, not fewer than,
two siblings. Choice B is incorrect because 23,400 is half of the estimated total number of eighth-grade students in the state; however, since the
students in Mr. Camp’s class are representative of students in the eighth-grade classes in the state and more than half of the students in Mr.
Camp’s class have fewer than two siblings, more than half of the students in each eighth-grade class in the state have fewer than two siblings,
too. Choice D is incorrect because 46,800 is the estimated total number of eighth-grade students in the state.$qb$);
select seed_pool_question($qb$CB-4cc05491$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the given scatterplot, a line of best fit for the data is shown.
10?11II5005555?(?| ? ? |)/(555 10II00)| || || || || || || || || || || |x
Which of the following is closest to the slope of the line of best fit shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4cc05491.png$qb$, $qb$[{"label": "A", "body": "0·2"}, {"label": "B", "body": "0·7"}, {"label": "C", "body": "1·8"}, {"label": "D", "body": "2·6"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A line in the xy-plane that passes through points (x1 , y1 ) and (x2 , y2 ) has a slope of (y2-y1)/(x2 -x1) . The line of best fit shown
passes approximately through the points (0, 0·2) and (5, 9·3) . It follows that the slope of this line is approximately (9·3-0·2)/(5-0) , which is equivalent
to (9·1)/5, or 1·82. Therefore, of the given choices, 1·8 is closest to the slope of the line of best fit shown.
Choice A is incorrect. This value is closest to the y-coordinate of the y-intercept of the line of best fit shown.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-54cb53cf$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number of zebras in a population in 2018 was 1·27 times the number of zebras in this population in 2014. If the number of zebras in this
population in 2014 is p% of the number of zebras in this population in 2018, what is the value of p, to the nearest whole number?$qb$, null, null, null, array[$qb$79$qb$]::text[], $qb$The correct answer is 79. Let x represent the number of zebras in the population in 2014 and let y represent the number of zebras in the
population in 2018. It’s given that the number of zebras in this population in 2018 was 1·27 times the number of zebras in this population in
2014. It follows that the equation y = 1·27x represents this situation. Dividing both sides of this equation by 1·27 yields y/(1·27) = x, or ( 1/(1·27) ) y
= x. Therefore, the number of zebras in this population in 2014 is 1/(1·27) times the number of zebras in this population in 2018. If the number of
zebras in this population in 2014 is p% of the number of zebras in this population in 2018, then x = p/10o y. It follows that 1/(1·27) = p/100 , or 10o/(1·27)
= p, which means p is approximately equal to 78·74. Therefore, the value of p, to the nearest whole number, is 79.$qb$);
select seed_pool_question($qb$CB-a9647302$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For quality control, a company that manufactures lightbulbs conducted five different trials. In each trial, 500 different lightbulbs were tested. The
bar graph above shows the number of defective lightbulbs found in each trial. What is the mean number of defective lightbulbs for the five trials?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a9647302.png$qb$, $qb$[{"label": "A", "body": "4.0"}, {"label": "B", "body": "4.2"}, {"label": "C", "body": "4.6"}, {"label": "D", "body": "5.0"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The numbers of defective lightbulbs found for the five trials are 4, 7, 1, 3, and 6, respectively. The mean is therefore
.
Choice A is incorrect. This is the median number of defective lightbulbs for the five trials. Choice C is incorrect and may result from an arithmetic
error. Choice D is incorrect and may result from mistaking the number of trials for the number of defective lightbulbs.$qb$);
select seed_pool_question($qb$CB-7b731fc3$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What number is 40% greater than 115?$qb$, null, null, null, array[$qb$161$qb$]::text[], $qb$The correct answer is 161 . For a number to be 40% greater than 115, it follows that the number is (100% 0f115) + (40% of115) , which can
be written as 10o/10o (115) + 40/100 (115) . This expression is equivalent to 1(115) + 0·4(115) , or 1·4(115) , which is equal to 161 . Therefore, 161 is
40% greater than 115.$qb$);
select seed_pool_question($qb$CB-e9f4521a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$13 is p% of 25. What is the value of p?$qb$, null, null, null, array[$qb$52$qb$]::text[], $qb$The correct answer is 52. It's given that 13 is p% of 25. It follows that 13/25 = p/100 . Multiplying both sides of this equation by 100 gives 52 = p.
Therefore, the value of p is 52.$qb$);
select seed_pool_question($qb$CB-1c2f50a6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$During a sale, the original prices of all the items in a clothing store have been reduced by 20%. What is the sale price of a jacket with an original
price of $50 ?$qb$, null, $qb$[{"label": "A", "body": "$12"}, {"label": "B", "body": "$30"}, {"label": "C", "body": "$36"}, {"label": "D", "body": "$40"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the original price of the jacket has been reduced by 20%. Multiplying the original price, $50, by 20% gives the
amount, in dollars, that the price of the jacket is reduced by: . Subtracting this value from the original price results in the sale
price of the jacket: , or $40.
Choices A, B, and C are incorrect and may result from a conceptual or calculation error.$qb$);
select seed_pool_question($qb$CB-89c39d77$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A competition consisted of four different events. One participant completed the first event with an average speed of 20·300 miles per hour. What
was this average speed, in yards per hour? - (1miIe = 1,760yardS)$qb$, null, null, null, array[$qb$35728$qb$]::text[], $qb$The correct answer is . It's given that 1miIe = 1,760yardS. It follows that an average speed of 20·300 miles per hour is equivalent to
( (20·30omiIc8)/(1 h0ur) ) ( (1,760ya3r5d8^(,))/1miIc7)28
, or 35,728 yards per hour.$qb$);
select seed_pool_question($qb$CB-dccdb20c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$There are 450 tiles in a box. Of these tiles, 6% are black. How many black tiles are in the box?$qb$, null, null, null, array[$qb$27$qb$]::text[], $qb$The correct answer is 27. It’s given that 6% of the 450 tiles in a box are black. Therefore, the number of black tiles in the box can be calculated
by multiplying the number of tiles in the box by 6/10o, which is equivalent to 450(6/1o0) , or 27.$qb$);
select seed_pool_question($qb$CB-6feae9c3$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$At a recreation center, visitors used the exercise room for a total of t hours in July. At the same recreation center, visitors used the exercise room
for 3·49t hours in August. What is the percent increase in the number of hours visitors used the exercise room from July to August?$qb$, null, $qb$[{"label": "A", "body": "2·49%"}, {"label": "B", "body": "3·49%"}, {"label": "C", "body": "249%"}, {"label": "D", "body": "349%"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the total number of hours visitors used the exercise room increased from t hours in July to 3·49t hours in
August. It follows that the number of hours increased by 3·49t - t, or 2·49t. Let p% represent the percent increase in the exercise room use
from July to August, or the percentage that 2·49t is of t. The value of p can be found using the proportion (2·49t)/t = p/10o , or 2·49 = p/100 .
Multiplying both sides of this equation by 100 yields p = 249. Therefore, the percent increase in the number of hours visitors used the exercise
room from July to August is 249%.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. The exercise room use in August is 349% of the exercise room use in July, but this doesn't represent the percent increase
from July to August.$qb$);
select seed_pool_question($qb$CB-661dfddd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot above shows the high temperature on a certain day and the elevation of 8 different locations in the Lake Tahoe Basin. A line of
best fit for the data is also shown. Which of the following statements best describes the association between the elevation and the temperature
of locations in the Lake Tahoe Basin?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-661dfddd.png$qb$, $qb$[{"label": "A", "body": "As the elevation increases, the temperature tends to increase."}, {"label": "B", "body": "As the elevation increases, the temperature tends to decrease."}, {"label": "C", "body": "As the elevation decreases, the temperature tends to decrease."}, {"label": "D", "body": "There is no association between the elevation and the temperature."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The association between the elevation and the temperature of locations in the Lake Tahoe Basin can be described by looking
at the direction of the line of best fit. The line of best fit slopes downward, which corresponds to the temperature decreasing as the elevation
increases.
Choices A and C are incorrect. Both of these choices would be represented by a line of best fit that slopes from the lower left to the upper right of
the graph, which isn’t what’s shown on the graph. Choice D is incorrect. This choice would be represented by a line of best fit that is horizontal or
has a slope very close to 0. This is not what’s shown on the graph.$qb$);
select seed_pool_question($qb$CB-73362607$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Amara grows cherry tomatoes in her backyard. This year, she harvested 750 cherry tomatoes and gave 10% of them to her neighbor. How many
of the harvested cherry tomatoes did Amara give to her neighbor?$qb$, null, null, null, array[$qb$75$qb$]::text[], $qb$The correct answer is 75. It’s given that Amara harvested 750 cherry tomatoes and gave 10% of them to her neighbor. 10% can be written as
10/100 , or 0·1. Therefore, the number of cherry tomatoes that Amara gave to her neighbor can be calculated by multiplying the total number of
cherry tomatoes by 0·1 , which gives (0·1)(750) , or 75.$qb$);
select seed_pool_question($qb$CB-89f20d9e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The table summarizes the distribution of age and assigned group for 90 participants in a study.
0–9 10– 19 20+
Total
years years years
Group A 5 17 8 30
||| ||| ||| ??? ||| ???
Group B 6 8 16 30
Group C 19 5 6 30
Total 30 30 30 90
One of these participants will be selected at random. What is the probability of selecting a participant from group A, given that the participant is
at least 10 years of age?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-89f20d9e.png$qb$, $qb$[{"label": "A", "body": "5/18"}, {"label": "B", "body": "5/12"}, {"label": "C", "body": "17/3o"}, {"label": "D", "body": "5/6"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since the participant will be selected at random, the probability of selecting a participant from group A, given that the
participant is at least 10 years of age, is equal to the number of participants from group A who are at least 10 years of age divided by the total
number of participants who are at least 10 years of age. Based on the table, in group A, there are 17 participants who are 10–19 years of age
and 8 participants who are 20+ years of age. Therefore, there are a total of 17 + 8, or 25, participants in group A who are at least 10 years of
age. Based on the table, of the total number of participants, there are 30 participants who are 10– 19 years of age and 30 participants who are
20+ years of age. Therefore, a total of 30 + 30, or 60, of the participants are at least 10 years of age. Thus, the probability of selecting a
participant from group A, given that the participant is at least 10 years of age, is 25/6o , or 5/12 .
Choice A is incorrect. This is the number of participants from group A who are at least 10 years of age divided by the total number of
participants, rather than divided by the number of participants who are at least 10 years of age.
Choice C is incorrect. This is the probability of randomly selecting a participant from group A, given that the participant is 10– 19 years of age,
rather than given that the participant is at least 10 years of age.
Choice D is incorrect. This is the probability of randomly selecting a participant who is at least 10 years of age, given that the participant is in
group A.$qb$);
select seed_pool_question($qb$CB-a03b7e02$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The table shows selected values from function f.
x
-/11/(?-2 |)???? ||||(-f(x))/1617/18||||
Which of the following is the best description of function f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a03b7e02.png$qb$, $qb$[{"label": "A", "body": "Decreasing linear"}, {"label": "B", "body": "Increasing linear"}, {"label": "C", "body": "Decreasing exponential"}, {"label": "D", "body": "Increasing exponential"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given values show that as x increases, f(x) also increases, which means that f is an increasing function. Furthermore,
f(x) increases at a constant rate of 1 for each increase of x by 1 . A function with a constant rate of change is linear. Thus, the function f can be
described as an increasing linear function.
Choice A is incorrect. For a decreasing linear function, as x increases, f(x) decreases rather than increases.
Choice C is incorrect. For a decreasing exponential function, for each increase of x by 1 , f(x) decreases by a fixed percentage rather than
increases at a constant rate.
Choice D is incorrect. For an increasing exponential function, for each increase of x by 1, f(x) increases by a fixed percentage rather than at a
constant rate.$qb$);
select seed_pool_question($qb$CB-97631565$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Scott selected 20 employees at random from all 400 employees at a company. He found that 16 of the employees in this sample are enrolled in
exactly three professional development courses this year. Based on Scott’s findings, which of the following is the best estimate of the number of
employees at the company who are enrolled in exactly three professional development courses this year?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "320"}, {"label": "C", "body": "380"}, {"label": "D", "body": "384"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that from the sample of 20 employees at the company, 16 of the employees are enrolled in exactly three
professional development courses this year. Since ( 16/2o ) is equal to 0·80, or 80/10o , it follows that 80% of the employees in the sample are enrolled
in exactly three professional development courses this year. Therefore, the best estimate for the percentage of employees at the company who
are enrolled in exactly three professional development courses this year is 80%. It’s given that there are a total of 400 employees at the
company. Therefore, the best estimate of the number of employees at the company who are enrolled in exactly three professional development
courses this year is (80/1o0) (400), or 320.
Choice A is incorrect. This is the number of employees from the sample who aren't enrolled in exactly three professional development courses
this year.
Choice C is incorrect. This is the number of employees who weren't selected for the sample.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3d73a58b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A gift shop buys souvenirs at a wholesale price of 7·00 dollars each and resells them each at a retail price that is 290% of the wholesale price.
At the end of the season, any remaining souvenirs are marked at a discounted price that is 80% off the retail price. What is the discounted price
of each remaining souvenir, in dollars?$qb$, null, null, null, array[$qb$203/50$qb$, $qb$4.06$qb$]::text[], $qb$The correct answer is 4·06. It's given that the retail price is 290% of the wholesale price of $7·00. Thus, the retail price is $7·00 ( 290/1o0 ) , which is
equivalent to $7·00(2·9) , or $20·30. It's also given that the discounted price is 80% off the retail price. Thus, the discounted price is
$20·30(1 - 8o/1o0) , which is equivalent to $20·30(0·20) , or $4·06.$qb$);
select seed_pool_question($qb$CB-7b1a3200$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$To study the characteristics of sea stars in a group of tide pools, researchers measured the diameter of the sea stars within the tide pools. The
dot plot gives the diameter, to the nearest inch, of each of the sea stars in these tide pools.
?
?
? ?
? ? ?
? ? ? ?
| | | | |
16 17 18 19 20
Diameter (inches)
Based on the dot plot, how many sea stars had a diameter, to the nearest inch, of 16 inches?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7b1a3200.png$qb$, $qb$[{"label": "A", "body": "16"}, {"label": "B", "body": "6"}, {"label": "C", "body": "4"}, {"label": "D", "body": "1"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The dot plot gives the diameter, to the nearest inch, of each sea star in a group of tide pools. The number of dots above a
given diameter represents the number of sea stars with that diameter, to the nearest inch. There are 6 dots above 16 inches. Therefore, 6 sea
stars had a diameter, to the nearest inch, of 16 inches.
Choice A is incorrect and may result from calculation or conceptual errors.
Choice C is incorrect. This is the number of sea stars with a diameter, to the nearest inch, of 17 inches, not 16 inches.
Choice D is incorrect. This is the number of sea stars with a diameter, to the nearest inch, of 18 inches, not 16 inches.$qb$);
select seed_pool_question($qb$CB-79137c1b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The scatterplot above shows the size x and the sale price y of 25 houses for sale in Town H. Which of the following could be an equation for a
line of best fit for the data?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-79137c1b.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. From the shape of the cluster of points, the line of best fit should pass roughly through the points  and .
Therefore, these two points can be used to find an approximate equation for the line of best fit. The slope of this line of best fit is therefore
, or 100. The equation for the line of best fit, in slope-intercept form, is  for some value of b. Using
the point , 1 can be substituted for x and 200 can be substituted for y: , or . Substituting this value into
the slope-intercept form of the equation gives .
Choice A is incorrect. The line defined by  passes through the points  and , both of which are well above
the cluster of points, so it cannot be a line of best fit. Choice C is incorrect. The line defined by  passes through the points
and , both of which lie at the bottom of the cluster of points, so it cannot be a line of best fit. Choice D is incorrect and may
result from correctly calculating the slope of a line of best fit but incorrectly assuming the y-intercept is at .$qb$);
select seed_pool_question($qb$CB-b8150b17$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a particular machine that produces beads, 29 out of every 100 beads it produces have a defect. A bead produced by the machine will be
selected at random. What is the probability of selecting a bead that has a defect?$qb$, null, $qb$[{"label": "A", "body": "1/(2,900)"}, {"label": "B", "body": "1/29"}, {"label": "C", "body": "29/1o0"}, {"label": "D", "body": "29/10"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that 29 out of every 100 beads that the machine produces have a defect. It follows that if the machine produces k
beads, then the number of beads that have a defect is 29/100 k, for some constant k. If a bead produced by the machine will be selected at random,
the probability of selecting a bead that has a defect is given by the number of beads with a defect, , divided by the number of beads
(29/10o k)/?29/1o0 k
produced by the machine, k. Therefore, the probability of selecting a bead that has a defect is , or 29/100 .
Choice A is incorrect and may result from conceptual or computational errors.
Choice B is incorrect and may result from conceptual or computational errors.
Choice D is incorrect and may result from conceptual or computational errors.$qb$);
select seed_pool_question($qb$CB-7d093333$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The area of a rectangular region is increasing at a rate of 250 square feet per hour. Which of the following is closest to this rate in square meters-
per minute? - (?Se 1 meter = 3·28 feet · )$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7d093333.png$qb$, $qb$[{"label": "A", "body": "0·39"}, {"label": "B", "body": "1·27"}, {"label": "C", "body": "13·67"}, {"label": "D", "body": "23·24"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that 1 meter = 3·28 feet. It follows that 12 Square meter = 3·282 Square feet, or 1 Square meter
. Since 1 h0ur = 60 minuteS, it follows that 250 square feet per hour is equivalent to
=( (251008·q7u5a8re4fcSeqt)/(1h00ur·39) u) a( re1fSeqeutarcmcter/(10·75848q0ua·3rc8f7cc3t) ) ( (1 h9ur)/(6o miuute8) ) , or (250 8quarc mcter8)/(645·504miuute8) , which is approximately 0·3873 square meters per minute. Of the given
choices,  is closest to .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fdfc90e4$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit for the data is also shown.
110046228 -/(-? ?)|| || ?|| || ?|| || ?|| ?|| ?|| ?|| ?|| ?|| ?|| || || ?x
At x = 32, which of the following is closest to the y-value predicted by the line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fdfc90e4.png$qb$, $qb$[{"label": "A", "body": "0·4"}, {"label": "B", "body": "1·5"}, {"label": "C", "body": "2·4"}, {"label": "D", "body": "3·3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. At x = 32, the line of best fit has a y-value between 2 and 3. The only choice with a value between 2 and 3 is choice C.
Choice A is incorrect. This is the difference between the y-value predicted by the line of best fit and the actual y-value at x = 32 rather than the y-
value predicted by the line of best fit at x = 32.
Choice B is incorrect. This is the y-value predicted by the line of best fit at x = 31 rather than at x = 32.
Choice D is incorrect. This is the y-value predicted by the line of best fit at x = 33 rather than at x = 32.$qb$);
select seed_pool_question($qb$CB-a51e6f93$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$0·1152 is 0·08% of the number b. The number b is 25% of the number c. What is the value of c?$qb$, null, null, null, array[$qb$576$qb$]::text[], $qb$The correct answer is 576. It’s given that 0·1152 is 0·08% of the number b. It follows that 0· 1 152 = (0·08)/100 b, or 0·1152 = 0·0008b. Dividing both
sides of this equation by 0·0008 yields 144 = b. It’s also given that the number b is 25% of the number c. It follows that b = 25/10o c, or b
= 0·25c. Substituting 144 for b in this equation yields 144 = 0·25c. Dividing both sides of this equation by 0·25 yields 576 = c. Therefore, the
value of c is 576.$qb$);
select seed_pool_question($qb$CB-674a4084$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An insect moves at a speed of 3/20 feet per second. What is this speed, in yards per second?- (3feet = 1yard)$qb$, null, $qb$[{"label": "A", "body": "1/2o"}, {"label": "B", "body": "9/2o"}, {"label": "C", "body": "6"}, {"label": "D", "body": "20"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that 3feet = 1yard. It follows that a speed of 3/2o feet per second is equivalent to ( (3/29 fcct)/(1 8ccond) ) ( 1yard/(3 ?ect) ) , which is
equivalent to ( 3/20 ) ( 1/3 ) , or 1/20, yards per second.
Choice B is incorrect. This is the speed, in feet per second, that's equivalent to 3/2o yards per second.
Choice C is incorrect. This is the speed, in yards per second, that's equivalent to 18, not 3/20 , feet per second.
Choice D is incorrect. This is the speed, in yards per second, that's equivalent to 60, not 3/20 , feet per second.$qb$);
select seed_pool_question($qb$CB-a0b165f8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A scientist studying the life cycle of dragonflies counted the number of dragonflies in a certain habitat each day for 46 days. On February 15,
there were 99 dragonflies in the habitat. The percent increase in the number of dragonflies in the habitat from January 1 to February 15 was
12·50%. How many dragonflies were in the habitat on January 1 ?$qb$, null, $qb$[{"label": "A", "body": "88"}, {"label": "B", "body": "87"}, {"label": "C", "body": "12"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that a scientist studying the life cycle of dragonflies counted the number of dragonflies in a certain habitat each day
for 46 days. It’s also given that on February 15, there were 99 dragonflies in the habitat and that the percent increase in the number of
dragonflies in the habitat from January 1 to February 15 was 12·50%. This can be represented by the equation
99 = ( 1 + (12·5o)/1o0 ) x, where x represents the number of dragonflies in the habitat on January 1 . This equation can be rewritten as 99 = 1·125x.
Dividing both sides of this equation by 1·125 yields 88 = x. Therefore, there were 88 dragonflies in the habitat on January 1 .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-34e18ce4$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are 350 objects in a box. Of these objects, 4% are balls. How many balls are in the box?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "14"}, {"label": "C", "body": "70"}, {"label": "D", "body": "346"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that 4% of the 350 objects in the box are balls. Therefore, the number of balls in the box can be found by
calculating 4% of 350, which is equal to 350(4/1o0) , or 14.
Choice A is incorrect. This is the percentage of objects in the box that are balls, not the number of balls in the box.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c943acba$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$On a street with 7 houses, 2 houses are blue. If a house from this street is selected at random, what is the probability of selecting a house that is
blue?$qb$, null, $qb$[{"label": "A", "body": "1/7"}, {"label": "B", "body": "2/7"}, {"label": "C", "body": "5/7"}, {"label": "D", "body": "7/7"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If a house from the street is selected at random, the probability of selecting a house that is blue is equal to the number of
houses on the street that are blue divided by the total number of houses on the street. Since there are 2 blue houses on a street with 7 total
houses, the probability of selecting a house that is blue from this street is 2/7 .
Choice A is incorrect. This is the probability of selecting a house that is blue from a street on which 1 of the 7 houses is blue.
Choice C is incorrect. This is the probability of selecting a house that is not blue from this street.
Choice D is incorrect. This is the probability of selecting a house that is blue from a street on which all the houses are blue.$qb$);
select seed_pool_question($qb$CB-1e562f24$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$To estimate the proportion of a population that has a certain characteristic, a random sample was selected from the population. Based on the
sample, it is estimated that the proportion of the population that has the characteristic is 0·49, with an associated margin of error of 0·04. Based
on this estimate and margin of error, which of the following is the most appropriate conclusion about the proportion of the population that has
the characteristic?$qb$, null, $qb$[{"label": "A", "body": "It is plausible that the proportion is between 0·45 and 0·53."}, {"label": "B", "body": "It is plausible that the proportion is less than 0·45."}, {"label": "C", "body": "The proportion is exactly 0·49."}, {"label": "D", "body": "It is plausible that the proportion is greater than 0·53."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the estimate for the proportion of the population that has the characteristic is 0·49 with an associated margin
of error of 0·04. Subtracting the margin of error from the estimate and adding the margin of error to the estimate gives an interval of plausible
values for the true proportion of the population that has the characteristic. Therefore, it’s plausible that the proportion of the population that has
this characteristic is between 0·45 and 0·53.
Choice B is incorrect. A value less than 0·45 is outside the interval of plausible values for the proportion of the population that has the
characteristic.
Choice C is incorrect. The value 0·49 is an estimate for the proportion based on this sample. However, since the margin of error for this estimate
is known, the most appropriate conclusion is not that the proportion is exactly one value but instead lies in an interval of plausible values.
Choice D is incorrect. A value greater than 0·53 is outside the interval of plausible values for the proportion of the population that has the
characteristic.$qb$);
select seed_pool_question($qb$CB-89f8d08a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A store manager reviewed the receipts from 80 customers who were selected at random from all the customers who made purchases last
Thursday. Of those selected, 20 receipts showed that the customer had purchased fruit. If 1,500 customers made purchases last Thursday,
which of the following is the most appropriate conclusion?$qb$, null, $qb$[{"label": "A", "body": "Exactly 75 customers must have purchased fruit last Thursday."}, {"label": "B", "body": "Exactly 375 customers must have purchased fruit last Thursday."}, {"label": "C", "body": "The best estimate for the number of customers who purchased fruit last Thursday is 75."}, {"label": "D", "body": "The best estimate for the number of customers who purchased fruit last Thursday is 375."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the manager took a random selection of the receipts of 80 customers from a total of 1,500. It’s also given that
of those 80 receipts, 20 showed that the customer had purchased fruit. This means that an appropriate estimate of the fraction of customers
who purchased fruit is , or . Multiplying this fraction by the total number of customers yields . Therefore, the
best estimate for the number of customers who purchased fruit is 375.
Choices A and B are incorrect because an exact number of customers can’t be known from taking a random selection. Additionally, choice A may
also be the result of a calculation error. Choice C is incorrect and may result from a calculation error.$qb$);
select seed_pool_question($qb$CB-6a305cd0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In a study, the data from a random sample of a population had a mean of 37, with an associated margin of error of 3. Which of the following is
the most appropriate conclusion that can be made about the population mean?$qb$, null, $qb$[{"label": "A", "body": "It is less than 37."}, {"label": "B", "body": "It is greater than 37."}, {"label": "C", "body": "It is between 34 and 40."}, {"label": "D", "body": "It is less than 34 or greater than 40."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the mean of the data from a random sample of a population is 37, with an associated margin of error of 3. The
most appropriate conclusion that can be made is that the mean of the entire population will fall between 37, plus or minus 3. Therefore, the
population mean is between  and .
Choice A is incorrect. While it’s an appropriate conclusion that the population mean is as low as , or 34, it isn’t appropriate to conclude
that the population mean is less than 34. Choice B is incorrect. While it’s an appropriate conclusion that the population mean is as high as
, or 40, it isn’t appropriate to conclude that the population mean is greater than 40. Choice D is incorrect. It isn’t an appropriate conclusion
that the population mean is less than 34 or greater than 40.$qb$);
select seed_pool_question($qb$CB-048811bd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is 10% of 370?$qb$, null, $qb$[{"label": "A", "body": "27"}, {"label": "B", "body": "37"}, {"label": "C", "body": "333"}, {"label": "D", "body": "360"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. 10% of a quantity means  times the quantity. Therefore, 10% of 370 can be represented as 1o/1o0 (370) , which is
10 10/(%1o0)
equivalent to 0·10 (370) , or 37. Therefore,  of 370 is 37.
Choice A is incorrect. This is 10% of 270, not 10% of 370.
Choice C is incorrect. This is 90% of 370, not 10% of 370.
Choice D is incorrect. This is 370 - 10, not 10% of 370.$qb$);
select seed_pool_question($qb$CB-e9129a5c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the given scatterplot, a line of best fit for the data is shown.
101124680044662288?-/(-| 222| | 444| | 666| | 888| | 10II00|)(- |)/?(- ?)/(| ?)-/?|?|| | | | | | | | | | |x
Which of the following is closest to the slope of the line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e9129a5c.png$qb$, $qb$[{"label": "A", "body": "-2·45"}, {"label": "B", "body": "-0·22"}, {"label": "C", "body": "0·22"}, {"label": "D", "body": "2·45"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A line in the xy-plane that passes through the points  and (x2 , y2 ) has a slope of (y2-y1)/(x2 -x1) . The line of best fit shown
(10(^(x), 4^(1,)·7y)^(1))
passes through the points with approximate coordinates (0, 2·5) and . It follows that the slope of the line of best fit is approximately
(4·7-2·5)/(10-0) , which is equivalent to (2·2)/1o , or 0·22. Therefore, of the given choices, 0·22 is closest to the slope of the line of best fit.
Choice A is incorrect. This is closest to the negative y-coordinate of the y-intercept, not to the slope, of the line of best fit.
Choice B is incorrect. This is closest to the negative slope, not to the slope, of the line of best fit.
Choice D is incorrect. This is closest to the y-coordinate of the y-intercept, not to the slope, of the line of best fit.$qb$);
select seed_pool_question($qb$CB-869a32f1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The high temperature, in degrees Fahrenheit (°F), in a certain city was recorded for each of 5 days. The data are shown below.
Day 1 2 3 4 5
-/(?-|)? |-/(-|)|-/(-|)|-/(-|)|-/(-|)|-/(-|)|
High temperature (°F) 81 80 81 81 82
Over this 5-day period, which of the following is NOT equal to 81°F?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-869a32f1.png$qb$, $qb$[{"label": "A", "body": "Median of the high temperatures"}, {"label": "B", "body": "Mean of the high temperatures"}, {"label": "C", "body": "Mode of the high temperatures"}, {"label": "D", "body": "Range of the high temperatures"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The range of a data set is the difference between the maximum and the minimum values in the set. The maximum value
among the high temperatures in the table is 82°F and the minimum value is 80°F. Therefore, the range is 82°F – 80°F = 2°F.
Choice A is incorrect. The median of a data set is the middle value when the values in the set are ordered from least to greatest. Ordering the
high temperatures this way gives the list 80, 81, 81, 81, 82. Therefore, the median high temperature is 81°F. Choice B is incorrect. The mean high
temperature is . Choice C is incorrect. The mode is the value that occurs the greatest number of
times. For the set of high temperatures shown, 81 is the value that occurs 3 times, and therefore, 81°F is the mode of the high temperatures.$qb$);
select seed_pool_question($qb$CB-916ffe9b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Poll Results
Angel Cruz 483
|| ??-/(-|)|
Terry Smith 320
The table shows the results of a poll. A total of  voters selected at random were asked which candidate they would vote for in the upcoming
election. According to the poll, if 6,424 people vote in the election, by how many votes would Angel Cruz be expected to win?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-916ffe9b.png$qb$, $qb$[{"label": "A", "body": "163"}, {"label": "B", "body": "1,304"}, {"label": "C", "body": "3,864"}, {"label": "D", "body": "5,621"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that 483 out of 803 voters responded that they would vote for Angel Cruz. Therefore, the proportion of voters from
the poll who responded they would vote for Angel Cruz is 483/8o3 . It’s also given that there are a total of 6,424 voters in the election. Therefore, the
total number of people who would be expected to vote for Angel Cruz is 6,424 ( 483/803 ) , or 3,864. Since 3,864 of the 6,424 total voters would be
expected to vote for Angel Cruz, it follows that 6,424 - 3,864, or 2,560 voters would be expected not to vote for Angel Cruz. The difference in
the number of votes for and against Angel Cruz is 3,864 - 2,560, or 1,304 votes. Therefore, if 6,424 people vote in the election, Angel Cruz
would be expected to win by 1,304 votes.
Choice A is incorrect. This is the difference in the number of voters from the poll who responded that they would vote for and against Angel Cruz.
Choice C is incorrect. This is the total number of people who would be expected to vote for Angel Cruz.
Choice D is incorrect. This is the difference between the total number of people who vote in the election and the number of voters from the poll.$qb$);
select seed_pool_question($qb$CB-8173f32b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An analyst collected data on the price of a carton of grape tomatoes at 30 locations selected at random in Utah. The mean price of a carton of
grape tomatoes in Utah was estimated to be $4·23, with an associated margin of error of $0·08. Which of the following is a plausible statement
about the mean price of a carton of grape tomatoes for all locations that sell this product in Utah?$qb$, null, $qb$[{"label": "A", "body": "It is between $4·15 and $4·31."}, {"label": "B", "body": "It is either less than $4·15 or greater than $4·31."}, {"label": "C", "body": "It is less than $4·15."}, {"label": "D", "body": "It is greater than $4·31."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the mean price of a carton of grape tomatoes in Utah was estimated to be $4·23, with an associated margin of
error of $0·08. It follows that plausible values for this mean price are between $4·23 - $0·08 and $4·23 + $0·08. Therefore, it's plausible that
the mean price of a carton of grape tomatoes for all locations that sell this product in Utah is between $4·15 and $4·31.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-559476f4$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The bar graph shows the frequency of each data value in a data set.
10
9
8
7
6
Frequency 5 |??????
4
3
2
1
0
1 2 3 4 5 6
Data value
What is the frequency of data value 2 in this data set?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-559476f4.png$qb$, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. It’s given that the bar graph shows the frequency of each data value in a data set. The bar corresponding to the data
value 2 has a height of 6. Therefore, the frequency of the data value 2 in this data set is 6.$qb$);
select seed_pool_question($qb$CB-a3384df0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Penguin Exhibit
Type of penguin Male Female Total
Chinstrap 41 59 100
-/(????? ||||| ????? ????? |||||)| | Emperor 8 27 35
Gentoo 49 54 103
Macaroni 42 40 82
Total 140 180 320
The number of penguins in a zoo exhibit, sorted by gender and type of penguin, is shown in the table above. Which type of penguin has a female
population that is the closest to being  of the total female penguin population in the exhibit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a3384df0.png$qb$, $qb$[{"label": "A", "body": "Chinstrap"}, {"label": "B", "body": "Emperor"}, {"label": "C", "body": "Gentoo"}, {"label": "D", "body": "Macaroni"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It is given that there are 180 female penguins in the exhibit. Therefore, of the female penguins is
penguins. According to the table, there are 59 female chinstrap penguins, 27 female emperor penguins, 54 female gentoo penguins, and 40
female macaroni penguins. So the female chinstrap penguin population is the closest to 60, or  of the total female population in the exhibit.
Choices B, C, and D are incorrect and may result from reading data from the table incorrectly. Since the total female penguin population is 180,
of the total female penguin population is 60. The numbers of female emperor (27), female gentoo (54), and female macaroni (40) penguins
are not as close to 60 as the number of female chinstrap penguins (59).$qb$);
select seed_pool_question($qb$CB-6670e407$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Number of High School Students Who
Completed Summer Internships
High Year
school 2008 2009 2010 2011 2012
||| ???? -/(||)||| -/(||)-/(??)-/(||)|Foothill 87 80 75 76 70
Valley 44 54 65 76 82
Total 131 134 140 152 152
The table above shows the number of students from two different high schools who completed summer internships in each of five years. No
student attended both schools. Which of the following statements are true about the number of students who completed summer internships for
the 5 years shown?
1. The mean number from Foothill High School is greater than the mean number from Valley High School.
2. The median number from Foothill High School is greater than the median number from Valley High School.$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6670e407.png$qb$, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The mean of a data set is found by dividing the sum of the values by the number of values. Therefore, the mean number of
students who completed summer internships from Foothill High School is , or 77.6. Similarly, the mean
number from Valley High School is , or 64.2. Thus, the mean number from Foothill High School is greater
than the mean number from Valley High School. When a data set has an odd number of elements, the median can be found by ordering the
values from least to greatest and determining the value in the middle. Since there are five values in each data set, the third value in each ordered
list is the median. Therefore, the median number from Foothill High School is 76 and the median number from Valley High School is 65. Thus, the
median number from Foothill High School is greater than the median number from Valley High School.
Choices A, B, and D are incorrect and may result from various misconceptions or miscalculations.$qb$);
select seed_pool_question($qb$CB-0a99e5bb$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-13423, ,
A data set of three numbers is shown. If a number from this data set is selected at random, what is the probability of selecting a negative
number?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1/3"}, {"label": "C", "body": "2/3"}, {"label": "D", "body": "1"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If a number from the data set is selected at random, the probability of selecting a negative number is the count of negative
numbers in the data set divided by the total count of numbers in the data set. It's given that a data set of three numbers is shown. It follows that
the total count of numbers in the data set is 3. In the data set shown, -13 is the only negative number. It follows that the count of negative
numbers in the data set is 1. Therefore, if a number from the data set is selected at random, the probability of selecting a negative number is 1/3 .
Choice A is incorrect. This is the probability of selecting a negative number from a data set that doesn’t contain any negative numbers.
Choice C is incorrect. This is the probability of selecting a positive number, not a negative number, from the data set.
Choice D is incorrect. This is the probability of selecting a negative number from a data set that contains only negative numbers.$qb$);
select seed_pool_question($qb$CB-9b5b23fc$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For x > 0, the function f is defined as follows:
f(x) equals 201% of x
Which of the following could describe this function?$qb$, null, $qb$[{"label": "A", "body": "Decreasing exponential"}, {"label": "B", "body": "Decreasing linear"}, {"label": "C", "body": "Increasing exponential"}, {"label": "D", "body": "Increasing linear"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that for x > 0, f(x) is equal to 201% of x. This is equivalent to f(x) = 201/10o x, or , for x > 0. This
f(xf) (=x)2·01x
function indicates that as x increases, f(x) also increases, which means f is an increasing function. Furthermore, increases at a constant
rate of 2·01 for each increase of x by 1 . A function with a constant rate of change is linear. Thus, the function f can be described as an
increasing linear function.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect. This could describe the function f(x) = (2·01)^(x), where f(x) is equal to 201% of f(x - 1) , not x, for x > 0.$qb$);
select seed_pool_question($qb$CB-4e527894$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are 20 buttons in a bag: 8 white buttons, 2 orange buttons, and 10 brown buttons. If one of these buttons is selected at random, what is
the probability of selecting a white button?$qb$, null, $qb$[{"label": "A", "body": "2/20"}, {"label": "B", "body": "8/2o"}, {"label": "C", "body": "10/20"}, {"label": "D", "body": "12/2o"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that there are 20 buttons in a bag and 8 of the buttons are white. If one button from the bag is selected at random,
the probability of selecting a white button is the number of white buttons in the bag divided by the total number of buttons in the bag. Therefore,
if one button from the bag is selected at random, the probability of selecting a white button is 8/2o .
Choice A is incorrect. This is the probability of selecting an orange button from the bag.
Choice C is incorrect. This is the probability of selecting a brown button from the bag.
Choice D is incorrect. This is the probability of selecting a button that isn't white from the bag.$qb$);
select seed_pool_question($qb$CB-808f7d6c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If , which of the following is equivalent to ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-808f7d6c.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that . Multiplying both sides of this equation by 2 yields , or .
Choice B is incorrect and may result from dividing, instead of multiplying, the right-hand side of the equation by 2. Choices C and D are incorrect
and may result from calculation errors.$qb$);
select seed_pool_question($qb$CB-af142f8d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Amount invested Balance increase
?? ?? || ||Account A $500 6% annual interest
Account B $1,000 $25 per year
Two investments were made as shown in the table above. The interest in Account A is compounded once per year. Which of the following is true
about the investments?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-af142f8d.png$qb$, $qb$[{"label": "A", "body": "Account A always earns more money per year than Account B."}, {"label": "B", "body": "Account A always earns less money per year than Account B."}, {"label": "C", "body": "Account A earns more money per year than Account B at first but eventually earns less money per year."}, {"label": "D", "body": "Account A earns less money per year than Account B at first but eventually earns more money per year."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Account A starts with $500 and earns interest at 6% per year, so in the first year Account A earns (500)(0.06) = $30, which is
greater than the $25 that Account B earns that year. Compounding interest can be modeled by an increasing exponential function, so each year
Account A will earn more money than it did the previous year. Therefore, each year Account A earns at least $30 in interest. Since Account B
always earns $25 each year, Account A always earns more money per year than Account B.
Choices B and D are incorrect. Account A earns $30 in the first year, which is greater than the $25 Account B earns in the first year. Therefore,
neither the statement that Account A always earns less money per year than Account B nor the statement that Account A earns less money than
Account B at first can be true. Choice C is incorrect. Since compounding interest can be modeled by an increasing exponential function, each
year Account A will earn more money than it did the previous year. Therefore, Account A always earns at least $30 per year, which is more than
the $25 per year that Account B earns.$qb$);
select seed_pool_question($qb$CB-c78bb2b8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A scientist measured the lengths of 240 gray seals from Muskeget Island and 120 gray seals from Sable Island. The scientist determined that
the mean length of the 240 gray seals from Muskeget Island was 88 inches and the mean length of the 120 gray seals from Sable Island was 94
inches. What was the mean length of all 360 gray seals the scientist measured for this study?$qb$, null, $qb$[{"label": "A", "body": "89"}, {"label": "B", "body": "90"}, {"label": "C", "body": "91"}, {"label": "D", "body": "92"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The mean of a data set is calculated by dividing the sum of the values in the data set by the number of values in the data set.
It’s given that the mean length of the 240 gray seals from Muskeget Island was 88 inches. This can be represented by the equation x/24o = 88,
where x represents the sum of the lengths, in inches, of the 240 gray seals from Muskeget Island. Multiplying both sides of this equation by 240
yields x = (240)(88) , or x = 21,120 inches. It’s also given that the mean length of the 120 gray seals from Sable Island was 94 inches. This
can be represented by the equation y/12o = 94, where y represents the sum of the lengths, in inches, of the 120 gray seals from Sable Island.
Multiplying both sides of this equation by 120 yields y = (120)(94), or  inches. Therefore, the sum of the lengths, in inches, of all
y = 1 1 (^(,)3228,40o0)/36o
360 gray seals is 21,120 + 11,280, or 32,400. Dividing this sum by 360 yields , or 90 inches. Therefore, the mean length of all 360 gray
seals the scientist measured for this study is 90 inches.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the mean length of 88 inches and 94 inches, not the mean length of all 360 gray seals the scientist measured for
this study.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6e4a60dd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Rita’s total bill at a restaurant was $25.00, including tax. If she left a tip of 20% of the total bill, what was the amount of the tip?$qb$, null, $qb$[{"label": "A", "body": "$3.50"}, {"label": "B", "body": "$4.00"}, {"label": "C", "body": "$4.50"}, {"label": "D", "body": "$5.00"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The total bill was $25.00. The percentage 20% is equivalent to the decimal 0.2. The tip is the product of the percentage and
the total bill; therefore, , so the tip was $5.00.
Choices A, B, and C are incorrect and may be the result of incorrectly converting the given percentage or a calculation error.$qb$);
select seed_pool_question($qb$CB-ad1d6adb$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The number of coins in a collection increased from 9 to 90. What was the percent increase in the number of coins in this collection?$qb$, null, $qb$[{"label": "A", "body": "10%"}, {"label": "B", "body": "81%"}, {"label": "C", "body": "90%"}, {"label": "D", "body": "900%"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the number of coins in the collection increased from 9 to 90. It follows that the number of coins in the
collection increased by 90 - 9, or 81. Let x% represent the percentage that 81 is of 9. The value of x can be found using the proportion 81/9
, or 9 = x/100 . Multiplying both sides of this equation by 100 yields 900 = x. Thus, when the number of coins in the collection increased
= x/1o90
from  to 90, the percent increase was 900%.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-040f2a84$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The regular price of a shirt at a store is $11·70. The sale price of the shirt is 80% less than the regular price, and the sale price is 30% greater
than the store's cost for the shirt. What was the store’s cost, in dollars, for the shirt? (Disregard the $ sign when entering your answer. For
example, if your answer is $4·97, enter 4·97)$qb$, null, null, null, array[$qb$1.8$qb$, $qb$9/5$qb$]::text[], $qb$The correct answer is 1·8. It’s given that the regular price of a shirt at a store is $11·70, and the sale price of the shirt is 80% less than the
regular price. It follows that the sale price of the shirt is $11·70(1 - 80/100) , or $11·70(1 - 0·8), which is equivalent to $2·34. It’s also given that
the sale price of the shirt is 30% greater than the store’s cost for the shirt. Let x represent the store’s cost for the shirt. It follows that 2·34
, or 2·34 = 1·3x. Dividing both sides of this equation by 1·3 yields x = 1·80. Therefore, the store’s cost, in dollars, for the shirt is
=1 ·8(01 + 30/100 ) x
. Note that 1.8 and 9/5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-b73025e2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How many cups are equivalent to - 83 quarts? (4cuPS = 1quart)$qb$, null, $qb$[{"label": "A", "body": "21"}, {"label": "B", "body": "79"}, {"label": "C", "body": "87"}, {"label": "D", "body": "332"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that 4 cups is equal to 1 quart. Multiplying (4 cuP8)/1quart by 83 quarts yields 4 · 83 cups, or 332 cups.
Choice A is incorrect. This is the number of quarts in 83 cups, rounded to the nearest whole number.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-41b71b4e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What number is 20% greater than 60 ?$qb$, null, $qb$[{"label": "A", "body": "50"}, {"label": "B", "body": "72"}, {"label": "C", "body": "75"}, {"label": "D", "body": "132"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The decimal equivalent of 20% is 0.2. The number that is 20% greater than 60 is also 120% of 60. The decimal equivalent of
120% is 1.2, and .
Alternate approach: 10% of 60 is 6, and 20% of 60 is double that amount, or 12. It follows that the number that is 20% greater than 60 is 12 more
than 60, or .
Choice A is incorrect and may result from dividing, instead of multiplying, 60 by 1.2. Choice C is incorrect because it’s 25% greater than 60, rather
than 20% greater than 60. Choice D is incorrect and may result from multiplying 60 by 2.2 instead of 1.2.$qb$);
select seed_pool_question($qb$CB-eaab8bc1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Out of 300 seeds that were planted, 80% sprouted. How many of these seeds sprouted?$qb$, null, null, null, array[$qb$240$qb$]::text[], $qb$The correct answer is 240. It’s given that 80% of the 300 seeds sprouted. Therefore, the number of seeds that sprouted can be calculated by
multiplying the number of seeds that were planted by 80/10o , which gives 300(8o/10o) , or 240.$qb$);
select seed_pool_question($qb$CB-70a2776f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$As part of a study of lake conditions, the water temperature was recorded at different depths below the surface of a certain lake. The data shown
in the scatterplot give the recorded temperature, in degrees Celsius, for 7 depths, in meters, below the surface of the lake.
y
25
?
20
Temperature 15
|| | | | | | | | | ?
(degrees
Celsius) 10
5
x
O 10 20 30 40 50 60 70 80
Depth
(meters)
Which of the following is closest to the slope of a line of best fit for the data shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-70a2776f.png$qb$, $qb$[{"label": "A", "body": "-0·17"}, {"label": "B", "body": "-2·17"}, {"label": "C", "body": "-6·02"}, {"label": "D", "body": "-8·02"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the data shown in the scatterplot give the recorded temperature, in degrees Celsius, for 7 depths, in meters,
below the surface of a lake. The graph of an appropriate line of best fit for the data shown passes approximately through the points (15, 21·8)
and (70, 12·7). The slope of a line in the xy-plane that passes through the points (x1 , y1 ) and  can be calculated as .
(x(y22,-yy21))/(x2 -x1) (-9·1)/55(y2-y1)/(x2 -x1)
Substituting (15, 21·8) and (70, 12·7) for (x1 , y1 ) and (x2 , y2 ), respectively, in the expression  yields (12·7-21·8)/(70-15) , or , which is
approximately -0·165. Therefore, of the given choices, -0·17 is closest to the slope of a line of best fit for the data shown.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-46b2e169$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A box contains 13 red pens and 37 blue pens. If one of these pens is selected at random, what is the probability of selecting a red pen? (Express
your answer as a decimal or fraction, not as a percent.)$qb$, null, null, null, array[$qb$.26$qb$, $qb$13/50$qb$]::text[], $qb$The correct answer is 13/50 . It's given that a box contains 13 red pens and 37 blue pens. If one of these pens is selected at random, the probability
of selecting a red pen is the number of red pens in the box divided by the number of red and blue pens in the box. The number of red and blue
pens in the box is 13 + 37, or 50. Since there are 13 red pens in the box, it follows that the probability of selecting a red pen is 13/50 . Note that
13/50 and .26 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-8213b1b3$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$According to a set of standards, a certain type of substance can contain a maximum of 0·001% phosphorus by mass. If a sample of this
substance has a mass of 140 grams, what is the maximum mass, in grams, of phosphorus the sample can contain to meet these standards?$qb$, null, null, null, array[$qb$.0014$qb$]::text[], $qb$The correct answer is ·0014. It's given that a certain type of substance can contain a maximum of 0·001% phosphorus by mass to meet a set of
standards. If a sample of the substance has a mass of 140 grams, it follows that the maximum mass, in grams, of phosphorus the sample can
contain to meet the standards is 0·001% of 140, or (o·0o1)/100 ( 140), which is equivalent to (0·00001)(140) , or 0·0014. Note that .0014 and 0.001
are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-ecf8d15f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A total of 50 children attended a summer camp and were offered 4 types of sandwiches. The table shows the number of children who chose
each type of sandwich.
Number of
Type of sandwich
children
Turkey 15
???? |||| ||||Chicken 23
Ham 3
Vegetarian 9
Total 50
If one of these children is selected at random, what is the probability of selecting a child who chose a vegetarian sandwich?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ecf8d15f.png$qb$, $qb$[{"label": "A", "body": "9/1o0"}, {"label": "B", "body": "9/50"}, {"label": "C", "body": "1/4"}, {"label": "D", "body": "9/10"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If one of these children is selected at random, the probability of selecting a child who chose a vegetarian sandwich is equal
to the number of children who chose a vegetarian sandwich divided by the total number of children. According to the table, there are a total of 50
children, and 9 of these children chose a vegetarian sandwich. Therefore, the probability of selecting a child who chose a vegetarian sandwich is
9/50 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f8696cd8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Human Resources Accounting
?? || ?? ||Bachelor’s degree 4 3
Master’s degree 2 6
The table above shows the number of people who work in the Human Resources and Accounting departments of a company and the highest
level of education they have completed. A person from one of these departments is to be chosen at random. If the person chosen works in the
Human Resources department, what is the probability that the highest level of education the person completed is a master’s degree?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f8696cd8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In total, there are 6 people in the Human Resources department. Of those 6, 2 have a master’s degree as their highest level of
education. Therefore, the probability of an employee selected at random from the Human Resources department having a master’s degree is
, which simplifies to .
Choice A is incorrect; it is the probability that an employee selected at random from either department will be in the Human Resources
department and have a master’s degree. Choice C is incorrect; it is the probability that an employee with a master’s degree selected at random
will be in the Human Resources department. Choice D is incorrect; it is the probability that an employee selected at random from either
department will have a master’s degree.$qb$);
select seed_pool_question($qb$CB-bc59c2d9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the temperature, in degreeS Fahrenheit (°F), and the distance above sea level, in feet, measured at 6 locations on
Mount Jefferson. A line of best fit is also shown.
y
80
70
60
50
Temperature 40|| | | | | ?
(°F)
30
20
10
x
O 2,000 4,000 6,000 8,000
Distance above sea level (feet)
At a distance of 4,000 feet above sea level, what is the temperature, in^(?)F, predicted by the line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bc59c2d9.png$qb$, $qb$[{"label": "A", "body": "47"}, {"label": "B", "body": "35"}, {"label": "C", "body": "25"}, {"label": "D", "body": "0"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In the given scatterplot, the x-values represent the distance above sea level, in feet, and the y-values represent the
temperature, in ^(°)F. The point on the line of best fit with an x-value of 4,000 has a corresponding y-value of 35. Therefore, at a distance of 4,000
feet above sea level, the temperature predicted by the line of best fit is 35^(°)F.
Choice A is incorrect. This is the temperature, in ^(°)F, predicted by the line of best fit at a distance of 0 feet above sea level.
Choice C is incorrect. This is the measured temperature, in ^(°)F, at a distance of 6,000 feet above sea level.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-50b2807e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y.
1011123456789004477669922883355II?-/(-1II| 222| 333| 444| 555| 666| 777| 888| 999| 10II00|)??| |?? | ?? ??| | ?? | ?? | ?? |?? | ?? | ?? | |x
Which of the following equations is the most appropriate linear model for the data shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-50b2807e.png$qb$, $qb$[{"label": "A", "body": "y = 0·9 + 9·4x"}, {"label": "B", "body": "y = 0·9 - 9·4x"}, {"label": "C", "body": "y = 9·4 + 0·9x"}, {"label": "D", "body": "y = 9·4 - 0·9x"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The data points suggest that as the variable x increases, the variable y decreases, which implies that an appropriate linear
model for the data has a negative slope. The data points also show that when x is close to 0, y is greater than 9. Therefore, the y-intercept of the
graph of an appropriate linear model has a y-coordinate greater than 9. The graph of an equation of the form y = a + bx, where a and b are
constants, has a y-intercept with a y-coordinate of a and has a slope of b. Of the given choices, only choice D represents a graph that has a
negative slope, -0·9, and a y-intercept with a y-coordinate greater than 9, 9·4.
Choice A is incorrect. The graph of this equation has a positive slope, not a negative slope, and a y-intercept with a y-coordinate less than 1, not
greater than 9.
Choice B is incorrect. The graph of this equation has a y-intercept with a y-coordinate less than 1, not greater than 9.
Choice C is incorrect. The graph of this equation has a positive slope, not a negative slope.$qb$);
select seed_pool_question($qb$CB-34f8cd89$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$37% of the items in a box are green. Of those, 37% are also rectangular. Of the green rectangular items, 42% are also metal. Which of the
following is closest to the percentage of the items in the box that are not rectangular green metal items?-$qb$, null, $qb$[{"label": "A", "body": "1·16%"}, {"label": "B", "body": "57·50%"}, {"label": "C", "body": "94·25%"}, {"label": "D", "body": "98·84%"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that 37% of the items in a box are green. Let x represent the total number of items in the box. It follows that 37/10o x,
or 0·37x, items in the box are green. It's also given that of those, 37% are also rectangular. Therefore, , or 0·1369x, items in the box
37/100 (0·3(74x2 ))/10o (0· 1369x)
are green rectangular items. It's also given that of the green rectangular items, 42% are also metal. Therefore, , or 0·057498x,
items in the box are rectangular green metal items. The number of the items in the box that are not rectangular green metal items is the total
number of items in the box minus the number of rectangular green metal items in the box. Therefore, the number of items in the box that are not
rectangular green metal items is x - 0·057498x, or 0·942502x. The percentage of items in the box that are not rectangular green metal items
is the percentage that 0·942502x is of x. If p% represents this percentage, the value of p is 100 ( (0·942502x)/x ) , or 94·2502. Of the given choices,
94·25% is closest to the percentage of items in the box that are not rectangular green metal items.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6fca0144$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For a baobab tree habitat in South Africa, a scientist randomly selected 50 baobab trees that were 17 years old and randomly assigned them to
two groups. Each group was subjected to a different watering pattern for 2 consecutive years to observe whether the watering pattern affects
the trees’ growth rate. Based on the design of the study, what is the largest group to which these results can be applied?$qb$, null, $qb$[{"label": "A", "body": "All the 50 baobab trees that were selected in this habitat"}, {"label": "B", "body": "All the baobab trees that were 19 years old in this habitat"}, {"label": "C", "body": "All the baobab trees that were 17 years old in South Africa"}, {"label": "D", "body": "All the baobab trees that were 17 years old in this habitat"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. When a study uses a randomly selected sample, the largest group to which the results of the study can be applied is the
population from which the sample was selected. It's given that the scientist randomly selected the trees from the baobab trees in a certain
habitat that were 17 years old. Therefore, the largest group to which the results of this study can be applied is all the baobab trees that were 17
years old in this habitat.
Choice A is incorrect. Since the sample was randomly selected from a population, the results can be applied to a larger group than the sample.
Choice B is incorrect. The sample was selected from a population of baobab trees that were 17 years old, not 19 years old.
Choice C is incorrect. The sample was selected from a certain tree habitat in South Africa, not from all the baobab trees that were 17 years old in
South Africa.$qb$);
select seed_pool_question($qb$CB-20b69297$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Anita created a batch of green paint by mixing 2 ounces of blue paint with 3 ounces of yellow paint. She must mix a second batch using the
same ratio of blue and yellow paint as the first batch. If she uses 5 ounces of blue paint for the second batch, how much yellow paint should
Anita use?$qb$, null, $qb$[{"label": "A", "body": "Exactly 5 ounces"}, {"label": "B", "body": "3 ounces more than the amount of yellow paint used in the first batch"}, {"label": "C", "body": "1.5 times the amount of yellow paint used in the first batch"}, {"label": "D", "body": "1.5 times the amount of blue paint used in the second batch"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that Anita used a ratio of 2 ounces of blue paint to 3 ounces of yellow paint for the first batch. For any batch of
paint that uses the same ratio, the amount of yellow paint used will be , or 1.5, times the amount of blue paint used in the batch. Therefore,
the amount of yellow paint Anita will use in the second batch will be 1.5 times the amount of blue paint used in the second batch.
Alternate approach: It’s given that Anita used a ratio of 2 ounces of blue paint to 3 ounces of yellow paint for the first batch and that she will use
5 ounces of blue paint for the second batch. A proportion can be set up to solve for x, the amount of yellow paint she will use for the second
batch: . Multiplying both sides of this equation by 3 yields , and multiplying both sides of this equation by x yields .
Dividing both sides of this equation by 2 yields . Since Anita will use 7.5 ounces of yellow paint for the second batch, this is
times the amount of blue paint (5 ounces) used in the second batch.
Choices A, B, and C are incorrect and may result from incorrectly interpreting the ratio of blue paint to yellow paint used.$qb$);
select seed_pool_question($qb$CB-24a1e6a7$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit is also shown.
10121416IIII111124680044446666222288?-/(-222| 444| 666| 888| 10II00| 12II22| 14II44| 16II66|)|?| ? | | | | | | | |x
Which of the following is closest to the slope of this line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-24a1e6a7.png$qb$, $qb$[{"label": "A", "body": "-3·3"}, {"label": "B", "body": "-1·1"}, {"label": "C", "body": "1·1"}, {"label": "D", "body": "3·3"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A line in the xy-plane that passes through points (x1 , y1 ) and (x2 , y2 ) has a slope of (y2-y1)/(x2 -x1) . The line of best fit shown
passes approximately through the points  and (13, 0) . It follows that the slope of this line of best fit is approximately (o-14)/(13-0) , or - 14/13 . Of
-(14()/130, 14)
the given choices, -1·1 is closest to .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9d95e7ad$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The scatterplot above shows the numbers of grams of both total protein and total fat for eight sandwiches on a restaurant menu. The line of best
fit for the data is also shown. According to the line of best fit, which of the following is closest to the predicted increase in total fat, in grams, for
every increase of 1 gram in total protein?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9d95e7ad.png$qb$, $qb$[{"label": "A", "body": "2.5"}, {"label": "B", "body": "2.0"}, {"label": "C", "body": "1.5"}, {"label": "D", "body": "1.0"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The predicted increase in total fat, in grams, for every increase of 1 gram in total protein is represented by the slope of the
line of best fit. Any two points on the line can be used to calculate the slope of the line as the change in total fat over the change in total protein.
For instance, it can be estimated that the points  and  are on the line of best fit, and the slope of the line that passes through
them is , or 1.4. Of the choices given, 1.5 is the closest to the slope of the line of best fit.
Choices A, B, and D are incorrect and may be the result of incorrectly finding ordered pairs that lie on the line of best fit or of incorrectly
calculating the slope.$qb$);
select seed_pool_question($qb$CB-81d0f1e6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The ratio a to b is equivalent to the ratio 63 to 17. What is the value of a when b = 153?$qb$, null, null, null, array[$qb$567$qb$]::text[], $qb$The correct answer is 567. It's given that the ratio a to b is equivalent to the ratio 63 to 17, or a/b = 63/17 . When b = 153, the value of a can be
calculated by substituting 153 for b in the equation , which yields a/153 = 63/17 . Multiplying both sides of this equation by 153 yields
56 a/(7^(b)) = 63/17
a = 567. Thus, when b = 153, the value of a is .$qb$);
select seed_pool_question($qb$CB-11b06e35$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The density of a certain solid substance is 813 kilograms per cubic meter. A sample of this substance is in the shape of a cube, where each edge
has a length of 0·60 meters. To the nearest whole number, what is the mass, in kilograms, of this sample?$qb$, null, $qb$[{"label": "A", "body": "176"}, {"label": "B", "body": "488"}, {"label": "C", "body": "1,355"}, {"label": "D", "body": "3,764"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the sample is in the shape of a cube with edge lengths of 0·60 meters. Therefore, the volume of the sample is
0·60^(3), or 0·216, cubic meters. It's also given that the sample has a density of 813 kilograms per 1 cubic meter. Therefore, the mass of this
sample is (0·2 16 cubic meterS) ( (813ki10?ramS)/(1 cubic mcter) ) , or 175·608 kilograms. Rounding this mass to the nearest whole number gives 176 kilograms.
Therefore, to the nearest whole number, the mass, in kilograms, of this sample is 176.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cf2be18d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$a26, , 29, b31, , 47c,
For the given data set, the data values are listed in ascending order, where ab, , and c are constants. For this data set, the mean is 36, the median
is 29, and the range is 72. What is the value of c?$qb$, null, $qb$[{"label": "A", "body": "54"}, {"label": "B", "body": "72"}, {"label": "C", "body": "81"}, {"label": "D", "body": "98"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the data set containing a26, , 29, b31, , 47, and c is listed in ascending order and has a mean of 36, a median
of 29, and a range of 72. Since there are 7 values in the given data set, it follows that the median is the value in the fourth position. It's given that
b is in the fourth position in the given data set, so it follows that b = 29. Since the mean of the data set is 36, it follows that
. Multiplying both sides of this equation by 7 yields a + 26 + 29 + 29 + 31 + 47 + c = 252, which is equivalent
(a+26+29+29+31+47+c)/(a + c +7162 = 252) = 36
to . Subtracting 162 from both sides of this equation yields a + c = 90. The range is the difference between the greatest
and least values in a data set. Since c is the greatest value and a is the least value in the given data set, it follows that c - a = 72, or -a + c
= 72. Adding the equations a + c = 90 and -a + c = 72 yields 2c = 162. Dividing both sides of this equation by 2 yields c = 81.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-39aa146d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between x and y. A line of best fit is also shown.
1234544223355II?((- ?)/|??)/(1II 222 333 444 555)?| || || || || || |x
Which of the following is closest to the slope of the line of best fit shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-39aa146d.png$qb$, $qb$[{"label": "A", "body": "-2·27"}, {"label": "B", "body": "-0·44"}, {"label": "C", "body": "0·44"}, {"label": "D", "body": "2·27"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the scatterplot shows the relationship between two variables, x and y, and a line of best fit is shown. For the
line of best fit shown, for each increase in the value of x by 1, the corresponding value of y increases by a constant rate. It follows that the
relationship between the variables x and y has a positive linear trend. A line in the xy-plane that passes through the points (a, b) and (c, d) has a
slope of (d-b)/(c-a) . The line of best fit shown passes approximately through the points (0, 0·25) and (4, 2). It follows that the slope of this line is
approximately (2-0·25)/(4-o) , which is equivalent to 0·4375. Therefore, of the given choices, 0·44 is closest to the slope of the line of best fit shown.
Choice A is incorrect. This is the slope of a line of best fit for a relationship between x and y that has a negative, rather than a positive, linear
trend.
Choice B is incorrect. This is the slope of a line of best fit for a relationship between x and y that has a negative, rather than a positive, linear
trend.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-58171b5e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Each year, the value of an investment increases by 0·49% of its value the previous year. Which of the following functions best models how the
value of the investment changes over time?$qb$, null, $qb$[{"label": "A", "body": "Decreasing exponential"}, {"label": "B", "body": "Decreasing linear"}, {"label": "C", "body": "Increasing exponential"}, {"label": "D", "body": "Increasing linear"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Because the value of the investment increases each year, the function that best models how the value of the investment
changes over time is an increasing function. It′s given that each year, the value of the investment increases by 0·49% of its value the previous
year. Since the value of the investment changes by a fixed percentage each year, the function that best models how the value of the investment
changes over time is an exponential function. Therefore, the function that best models how the value of the investment changes over time is an
increasing exponential function.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-d7a3179d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How many yards are equivalent to - 1,116 inches? (1yard = 36incheS)$qb$, null, null, null, array[$qb$31$qb$]::text[], $qb$The correct answer is 31 . It's given that 1 yard is equal to 36 inches. Therefore, 1,116 inches is equivalent to ( 1 , 1 16 incheS) ( 1yard/36inchc8 ) , or 31
yards.$qb$);
select seed_pool_question($qb$CB-d6456c7a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A certain park has an area of 11,863,808 square yards. What is the area, in square miles, of this park? - (1miIe = 1,760yardS)$qb$, null, $qb$[{"label": "A", "body": "1·96"}, {"label": "B", "body": "3·83"}, {"label": "C", "body": "3,444·39"}, {"label": "D", "body": "6,740·8"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since 1 mile is equal to 1,760 yards, 1 square mile is equal to 1,760^(2), or 3,097,600, square yards. It’s given that the park
has an area of 11,863,808 square yards. Therefore, the park has an area of ( 1 1 ,863,808 Square yardS) ( (1 8quarc miIc)/(3,097,6o08quarcyardS) ) , or (11,863,808)/(3,097,60o)
square miles. Thus, the area, in square miles, of the park is 3·83.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the square root of the area of the park in square yards, not the area of the park in square miles.
Choice D is incorrect and may result from converting 11,863,808 yards to miles, rather than converting 11,863,808 square yards to square
miles.$qb$);
select seed_pool_question($qb$CB-4347a032$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How many teaspoons are equivalent to - 44 tablespoons? (3 teaSP00nS = 1 tabIeSP00n)$qb$, null, $qb$[{"label": "A", "body": "47"}, {"label": "B", "body": "88"}, {"label": "C", "body": "132"}, {"label": "D", "body": "176"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that  teaspoons is equivalent to 1 tablespoon. Therefore, 44 tablespoons is equivalent to
(44 tabIeSPo0nS) ( (3 tea8P09nS)/(1 tabIc8P0on) )3
, or 132 teaspoons.
Choice A is incorrect. This is equivalent to approximately 15·66 tablespoons, not 44 tablespoons.
Choice B is incorrect. This is equivalent to approximately 29·33 tablespoons, not 44 tablespoons.
Choice D is incorrect. This is equivalent to approximately 58·66 tablespoons, not 44 tablespoons.$qb$);
select seed_pool_question($qb$CB-de799680$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A cluster fly is traveling at a velocity of 76 centimeters per second. What is this velocity, in millimeters per second?
( 1 centimeter = 10 mi1IimeterS)$qb$, null, $qb$[{"label": "A", "body": "7,600"}, {"label": "B", "body": "836"}, {"label": "C", "body": "760"}, {"label": "D", "body": "86"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that 1 centimetcr = 10 miIIimeterS. It follows that a velocity of 76 centimeters per second is equivalent to
( (76 ccntimcterS)/(1 Sccond) ) ( 10mi11imcter8/(1 centimetcr) ) , which is equivalent to (76) (10) , or 760, millimeters per second.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-51c9d65f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For a certain rectangular region, the ratio of its length to its width is 35 to 10. If the width of the rectangular region increases by 7 units, how
must the length change to maintain this ratio?$qb$, null, $qb$[{"label": "A", "body": "It must decrease by 24·5 units."}, {"label": "B", "body": "It must increase by 24·5 units."}, {"label": "C", "body": "It must decrease by 7 units."}, {"label": "D", "body": "It must increase by 7 units."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the ratio of the rectangular region’s length to its width is 35 to 10. This can be written as a proportion: (Ien?th)/(?idth)
= 35/10 , or ℓ/w = 35/1o . This proportion can be rewritten as 10ℓ = 35w, or ℓ = 3·5w. If the width of the rectangular region increases by 7, then the
length will increase by some number x in order to maintain this ratio. The value of x can be found by replacing ℓ with ℓ + x and w with w + 7 in
the equation, which gives ℓ + x = 3·5(w + 7). This equation can be rewritten using the distributive property as ℓ + x = 3·5w + 24·5. Since
ℓ = 3·5w, the right-hand side of this equation can be rewritten by substituting ℓ for 3·5w, which gives ℓ + x = ℓ + 24·5, or x = 24·5.
Therefore, if the width of the rectangular region increases by 7 units, the length must increase by 24·5 units in order to maintain the given ratio.
Choice A is incorrect. If the width of the rectangular region increases, the length must also increase, not decrease.
Choice C is incorrect. If the width of the rectangular region increases, the length must also increase, not decrease.
Choice D is incorrect. Since the ratio of the length to the width of the rectangular region is 35 to 10, if the width of the rectangular region
increases by 7 units, the length would have to increase by a proportional amount, which would have to be greater than 7 units.$qb$);
select seed_pool_question($qb$CB-763e6769$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The ratio x to y is equivalent to the ratio 12 to t. When x = 156, what is the value of y in terms of t?$qb$, null, $qb$[{"label": "A", "body": "13t"}, {"label": "B", "body": "12t"}, {"label": "C", "body": "144t"}, {"label": "D", "body": "168t"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the ratio x to y is equivalent to the ratio 12 to t. This can be represented by . Substituting 156 for x in
1x/(^(y)2) = 12/t
this equation yields 156/y = 12/t . This can be rewritten as 12y = 156t. Dividing both sides of this equation by  yields y = 13t. Therefore, when
x = 156, the value of y in terms of t is 13t.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-25faa756$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number a is 60% greater than the positive number b. The number c is 45% less than a. The number c is how many times b?$qb$, null, null, null, array[$qb$.88$qb$, $qb$22/25$qb$]::text[], $qb$The correct answer is ·88. It’s given that the number a is 60% greater than the positive number b. Therefore, , which is
equivalent to , or a = 1·60b. It’s also given that the number c is 45% less than a. Therefore, c =a0c=·5=5(a1( 1+-60/1o0(45))/100b) a, which is
^(a)c == ((11 -+ 00··4650))ab
equivalent to , or c = 0· 55a. Since a = 1·60b, substituting 1·60b for a in the equation  yields c = 0·55(1·60b) , or
c = 0·88b. Thus, the number c is 0·88 times the number b. Note that .88 and 22/25 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-ad911622$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The value of a collectible comic book increased by 167% from the end of 2011 to the end of 2012 and then decreased by 16% from the end of
2012 to the end of 2013. What was the net percentage increase in the value of the collectible comic book from the end of 2011 to the end of
2013?$qb$, null, $qb$[{"label": "A", "body": "124·28%"}, {"label": "B", "body": "140·28%"}, {"label": "C", "body": "151·00%"}, {"label": "D", "body": "209·72%"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the value of the comic book increased by 167% from the end of 2011 to the end of 2012. Therefore, if the
value of the comic book at the end of 2011 was x dollars, then the value, in dollars, of the comic book at the end of 2012 was ,
x + ( 167/(2^(1)0o01) 2) x
which can be rewritten as 1x + 1·67x, or 2·67x. It’s also given that the value of the comic book decreased by 16% from the end of  to the
end of 2013. Therefore, the value, in dollars, of the comic book at the end of 2013 was 2·67x - 2·67x ( 16/1o0 ) , which can be rewritten as 2·67x
- (2·67x)(0·16) , or 2·2428x. Thus, if the value of the comic book at the end of 2011 was x dollars, and the value of the comic book at the end
of 2013 was 2·2428x dollars, then from the end of 2011 to the end of 2013, the value of the comic book increased by 2·2428x - 1x, or
1·2428x, dollars. Therefore, the increase in the value of the comic book from the end of 2011 to the end of 2013 is equal to 1·2428 times the
value of the comic book at the end of 2011. It follows that from the end of 2011 to the end of 2013, the net percentage increase in the value of
the comic book was (1·2428)(100)%, or 124·28%.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the difference between the net percentage increase in the value of the comic book from the end of 2011 to the end
of 2012 and the net percentage decrease in the value of the comic book from the end of 2012 to the end of 2013, not the net percentage
increase in the value of the comic book from the end of 2011 to the end of 2013.
Choice D is incorrect. This is the net percentage increase in the value of the comic book from the end of 2011 to the end of 2013, if the value of
the comic book increased by 167% from the end of 2011 to the end of 2012 and then increased, not decreased, by 16% from the end of
2012 to the end of 2013.$qb$);
select seed_pool_question($qb$CB-98818acf$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The number of audiobooks in a library increased by 131% from last year to this year. The number of audiobooks in the library last year was n,
and the number of audiobooks in the library this year is bn, where b and n are constants. What is the value of b?$qb$, null, null, null, array[$qb$2.31$qb$]::text[], $qb$The correct answer is 2·31 . It’s given that the number of audiobooks in the library increased by 131% from last year to this year. Converting
131% to a decimal yields 1·31 . It’s also given that the number of audiobooks in the library last year was n, where n is a constant. It follows that
the number of audiobooks in the library this year can be represented by n plus 131% of n, or n + 1·31n. Combining like terms in this
expression yields 2·31n. Since the number of audiobooks in the library this year is represented as bn, where b is a constant, it follows that the
value of b is 2·31 .$qb$);
select seed_pool_question($qb$CB-8d63b6f1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between the weight, in pounds, of each of 9 female gray wolves on April 30 and the number of offspring
each gray wolf produced.
ff??nOOS?p?
1234567844776622883355II?-/(-10II00| 202200| 503300| 444000| 505500| 606600| 207700|)| | | | ??| ?? ????| ???? ??| ???? | |x
b?m^(?)e?
?eight (PoundS)
How many offspring did the 50-pound gray wolf produce?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8d63b6f1.png$qb$, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "7"}, {"label": "C", "body": "6"}, {"label": "D", "body": "5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For each point on the scatterplot shown, the x-value represents the weight, in pounds, of a female gray wolf and the y-value
represents the number of offspring that wolf produced. The point on the graph with an x-value of 50 has a y-value of 6. Therefore, the 50-pound
gray wolf produced 6 offspring.
Choice A is incorrect. One of the wolves produced 8 offspring, but its weight was greater than 50 pounds.
Choice B is incorrect. Three of the wolves produced 7 offspring each, but their weights were each greater than 50 pounds.
Choice D is incorrect. Two of the wolves produced 5 offspring each, but their weights were each less than 50 pounds.$qb$);
select seed_pool_question($qb$CB-25fc031a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?0mPan? ?
FrequenC?
?5??1000000 || | ?| ?| ?| | | |
Num?er0? unitSS0I? (inth0uSan?S)
?0mPan? ?
FrequenC?
?5??1000000 ||??| ?| ?| ?| ?| ?| |
Num?er0? unitSS0I? (inth0uSan?S)
The histograms summarize the distributions of number of units sold, in thousands, for company A and company B. Which statement best
compares the standard deviations of number of units sold for these companies?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-25fc031a.png$qb$, $qb$[{"label": "A", "body": "The standard deviation of number of units sold for company A is less than the standard deviation of number of units sold for company B."}, {"label": "B", "body": "The standard deviation of number of units sold for company A is greater than the standard deviation of number of units sold for company B."}, {"label": "C", "body": "The standard deviation of number of units sold for company A is equal to the standard deviation of number of units sold for company B."}, {"label": "D", "body": "There is not enough information to compare the standard deviations."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Standard deviation measures the spread of a given data set from its mean. In a data set with a smaller standard deviation,
there are more values close to the mean. In a data set with a greater standard deviation, there are more values farther from the mean. The two
histograms shown have the same scale on the horizontal axis. Therefore, their standard deviations can be compared by visually comparing the
spreads of their histograms. The distribution summarized by each histogram is symmetric. Therefore, the mean of the data set for each
histogram is a value in the middle bar of that histogram. The middle bar of each histogram has a value of at least 30 thousand units sold but less
than 35 thousand units sold. Therefore, the mean of the data set for each histogram is at least 30 thousand and less than 35 thousand. The
histogram for company A shows all the values in that data set are close to the mean. For company B, the histogram shows there are fewer values
close to the mean and more values farther from the mean. Therefore, the standard deviation of number of units sold for company A is less than
the standard deviation of number of units sold for company B.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d72a2b4d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In March, the price of a collectible card was $15·50. In April, the price of the collectible card was $17·36. The price of the collectible card in April
was p% of the price of the collectible card in March. What is the value of p?$qb$, null, $qb$[{"label": "A", "body": "12"}, {"label": "B", "body": "88"}, {"label": "C", "body": "112"}, {"label": "D", "body": "188"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the price of the collectible card was $15·50 in March and $17·36 in April. It's also given that the price of the
collectible card in April was p% of the price in March. It follows that $17·36 is p% of $15·50. Therefore, the value of p can be calculated by
solving the equation , or 17·36 = (15·50p)/10o . Multiplying each side of this equation by 100 yields 1,736 = 15·50p. Dividing
17·36 =15(p/(·15o00)) (15·50)
each side of this equation by yields 112 = p. Therefore, the value of p is 112.
Choice A is incorrect. 12% is the percent increase in the price of the collectible card from March to April.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cf0ae57a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot above shows the densities of 7 planetoids, in grams per cubic centimeter, with respect to their average distances from the Sun in
astronomical units (AU). The line of best fit is also shown. An astronomer has discovered a new planetoid about 1.2 AU from the Sun. According
to the line of best fit, which of the following best approximates the density of the planetoid, in grams per cubic centimeter?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cf0ae57a.png$qb$, $qb$[{"label": "A", "body": "3.6"}, {"label": "B", "body": "4.1"}, {"label": "C", "body": "4.6"}, {"label": "D", "body": "5.5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. According to the line of best fit, a planetoid with a distance from the Sun of 1.2 AU has a predicted density between
and . The only choice in this range is 4.6.
Choices A, B, and D are incorrect and may result from misreading the information in the scatterplot.$qb$);
select seed_pool_question($qb$CB-4e375d1f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How many meters are equivalent to - 2,300 centimeters? ( 100 centimeterS = 1 meter)$qb$, null, $qb$[{"label": "A", "body": "0·043"}, {"label": "B", "body": "23"}, {"label": "C", "body": "2,400"}, {"label": "D", "body": "230,000"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that 100 centimeters is equal to 1 meter. Therefore, 2,300 centimeters is equivalent to
(2,300 centimcterS) ( (1 mcter)/(1oo ccntimetcr8) ) , or 23 meters.
Choice A is incorrect. 0·043 meters is equivalent to 4·3, not 2,300, centimeters.
Choice C is incorrect. 2,400 meters is equivalent to 240,000, not 2,300, centimeters.
Choice D is incorrect. 230,000 meters is equivalent to 23,000,000, not 2,300, centimeters.$qb$);
select seed_pool_question($qb$CB-771ee744$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are 320 marbles in a container. Of these marbles, 10% are red. How many marbles in the container are red?$qb$, null, $qb$[{"label": "A", "body": "32"}, {"label": "B", "body": "288"}, {"label": "C", "body": "320"}, {"label": "D", "body": "352"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that 10% of the 320 marbles in a container are red. Therefore, the number of red marbles can be calculated by
multiplying the number of marbles in the container by 10/10o , which gives 320(10/100) , or 32.
Choice B is incorrect. This is the number of marbles in the container that aren't red.
Choice C is incorrect. This is the total number of marbles in the container.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e9ed719f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table summarizes the distribution of color and shape for 100 tiles of equal area.
Red Blue Yellow Total
Square 10 20 25 55
??? ||| ??? ||| ||| |||
Pentagon 20 10 15 45
Total 30 30 40 100
If one of these tiles is selected at random, what is the probability of selecting a red tile? (Express your answer as a decimal or fraction, not as a
percent.)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e9ed719f.png$qb$, null, null, array[$qb$0.3$qb$, $qb$3/10$qb$]::text[], $qb$The correct answer is 3/10 . It’s given that there are a total of 100 tiles of equal area, which is the total number of possible outcomes. According to
the table, there are a total of 30 red tiles. The probability of an event occurring is the ratio of the number of favorable outcomes to the total
number of possible outcomes. By definition, the probability of selecting a red tile is given by 30/100, or 3/10 . Note that 3/10 and .3 are examples of
ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-6d99b141$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?C?x° B
? ? A
N0te: Figuren0tdraWnt0SCaIe·
In the figure, AC = CD. The measure of angle EBC is 45^(°), and the measure of angle ACD is 104^(°). What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6d99b141.png$qb$, null, null, array[$qb$83$qb$]::text[], $qb$The correct answer is 83. It's given that in the figure, AC = CD. Thus, triangle ACD is an isosceles triangle and the measure of angle CDA
is equal to the measure of angle CAD. The sum of the measures of the interior angles of a triangle is 180^(°). Thus, the sum of the measures of
the interior angles of triangle ACD is 180^(°). It's given that the measure of angle ACD is 104^(°). It follows that the sum of the measures of
angles CDA and CAD is (180 - 104)^(°), or 76^(°). Since the measure of angle CDA is equal to the measure of angle CAD, the measure of
angle CDA is half of 76^(°), or 38^(°). The sum of the measures of the interior angles of triangle BDE is 180^(?). It's given that the measure of angle
EBC is 45^(°). Since the measure of angle BDE, which is the same angle as angle CDA, is 38^(°), it follows that the measure of angle DEB is
(180 - 45 - 38)^(°), or 97^(°). Since angle DEB and angle AEB form a straight line, the sum of the measures of these angles is 180^(°). It's given
in the figure that the measure of angle AEB is x^(?). It follows that 97 + x = 180. Subtracting 97 from both sides of this equation yields x = 83.$qb$);
select seed_pool_question($qb$CB-2c3aefc9$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?
?????
N0te: Figuren0t ?ra?nt0SCaIe·
In rectangle PQRS, the length of line segment QS is √-2,344 and the length of side PS is 8 more than the length of side RS. What is the
length of side QR?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2c3aefc9.png$qb$, null, null, array[$qb$38$qb$]::text[], $qb$The correct answer is 38. It’s given that in rectangle PQRS, the length of side PS is 8 more than the length of side RS. In a rectangle, opposite
sides are congruent. Since side QR is opposite side PS, it follows that side QR is congruent to side PS. Thus, the length of side QR is 8 more
than the length of side RS. Let x represent the length of side RS. It follows that the length of side QR is represented by the expression x + 8.
Since all angles in a rectangle are right angles, angle R is a right angle. It follows that side QR, side RS, and line segment QS form a right
triangle, where line segment QS is the hypotenuse and sides QR and RS are the legs. It’s given that the length of line segment QS is √-2,344.
By the Pythagorean theorem, if a right triangle has a hypotenuse with length c and legs with lengths a and b, then a2 + b2 = c2. Substituting x
for ax + 8,  for b, and √-2,344 for c in this equation yields , or x^(2) + (x + 8)^(2) = 2,344. Expanding the left-hand
^(x2)2+x(^(2x)++168x)^(2)+=6(4√=-22^(,)3,34444)^(2)
side of this equation yields x^(2) + x^(2) + 16x + 64 = 2,344, or . Dividing both sides of this equation by 2 yields x2
+ 8x + 32 = 1,172. To complete the square, subtracting 16 from both sides of this equation yields . Since the left-
x^(2) + 8x +(x1+64=)21=,1516,156
hand side of this equation is a perfect square trinomial, it follows that x^(2) + 8x + 16 = 1,156 is equivalent to . Taking the
positive square root of both sides of this equation yields x + 4 = 34. Subtracting 4 from both sides of this equation yields x = 30. Since the
length of side QR is represented by the expression x + 8, it follows that the length of side QR is 30 + 8, or 38.$qb$);
select seed_pool_question($qb$CB-9912e19f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Triangles EFG and JKL are congruent, where EF, , and G correspond to JK, , and L, respectively. The measure of angle E is 45^(?) and the
measure of angle F is 20^(°). What is the measure of angle J?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9912e19f.png$qb$, $qb$[{"label": "A", "body": "20^(°)"}, {"label": "B", "body": "45^(°)"}, {"label": "C", "body": "135^(?)"}, {"label": "D", "body": "160^(°)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that triangles EFG and JKL are congruent such that angle E corresponds to angle J. Corresponding angles of
congruent triangles are congruent, so angle E and angle J must be congruent. Therefore, if the measure of angle E is 45^(?), then the measure of
angle J is also 45^(°).
Choice A is incorrect. This is the measure of angle K, not angle J.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4b7bb316$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The length of each edge of a box is 29 inches. Each side of the box is in the shape of a square. The box does not have a lid. What is the exterior
surface area, in square inches, of this box without a lid?$qb$, null, null, null, array[$qb$4205$qb$]::text[], $qb$The correct answer is 4,205. The exterior surface area of a figure is the sum of the areas of all its faces. It's given that the box does not have a
lid and that each side of the box is in the shape of a square. Therefore, the box consists of 5 congruent square faces. It's also given that the
length of each edge is 29 inches. Let s represent the length of an edge of a square. It follows that the area of a square is equal to s2. Therefore,
the area of each of the 5 square faces is equal to 29^(2) , or 841 , square inches. Since the box consists of 5 congruent square faces, it follows that
the sum of the areas of all its faces, or the exterior surface area of this box without a lid, is 5(841) , or 4,205, square inches.$qb$);
select seed_pool_question($qb$CB-e10d8313$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$P ? ? ? V
?/(??X ? ?)
N0te: Figuren0tdraWntoSCaIe·
In the figure shown, points Q, RS, , and T lie on line segment PV, and line segment RU intersects line segment SX at point W. The measure
of ∠SQX is 48^(°), the measure of ∠SXQ is 86^(°), the measure of ∠SWU is 85^(°), and the measure of ∠VTU is 162^(?). What is the measure, in
degrees, of ∠TUR?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e10d8313.png$qb$, null, null, array[$qb$123$qb$]::text[], $qb$The correct answer is 123. The triangle angle sum theorem states that the sum of the measures of the interior angles of a triangle is
180 degrees. It's given that the measure of ∠SQX is 48^(°) and the measure of ∠SXQ is 86^(°). Since points SQ, , and X form a triangle, it
follows from the triangle angle sum theorem that the measure, in degrees, of ∠QSX is 180 - 48 - 86, or 46. It's also given that the measure
of ∠SWU is 85^(°). Since ∠SWU and ∠SWR are supplementary angles, the sum of their measures is 180 degrees. It follows that the
measure, in degrees, of ∠SWR is 180 - 85, or 95. Since points RS, , and W form a triangle, and ∠RSW is the same angle as ∠QSX, it
follows from the triangle angle sum theorem that the measure, in degrees, of ∠WRS is 180 - 46 - 95, or 39. It's given that the measure of
∠VTU is 162^(?). Since ∠V?U and ∠S?U are supplementary angles, the sum of their measures is 180 degrees. It follows that the measure, in
degrees, of ∠STU is 180 - 162, or 18. Since points RT, , and U form a triangle, and ∠URT is the same angle as ∠WRS, it follows from the
triangle angle sum theorem that the measure, in degrees, of ∠TUR is 180 - 39 - 18, or 123.$qb$);
select seed_pool_question($qb$CB-bcb66188$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Triangle FGH is similar to triangle JKL, where angle F corresponds to angle J and angles G and K are right angles. If Sin(F) = 308/317 , what
is the value of Sin(J) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bcb66188.png$qb$, $qb$[{"label": "A", "body": "75/317"}, {"label": "B", "body": "3o8/317"}, {"label": "C", "body": "317/3o8"}, {"label": "D", "body": "317/75"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If two triangles are similar, then their corresponding angles are congruent. It's given that right triangle FGH is similar to
right triangle JKL and angle F corresponds to angle J. It follows that angle F is congruent to angle J and, therefore, the measure of angle F
is equal to the measure of angle J. The sine ratios of angles of equal measure are equal. Since the measure of angle F is equal to the measure
of angle JSin(F) = Sin(J), . It's given that Sin(F) = 308/317. Therefore, Sin(J) is 3o8/317 .
Choice A is incorrect. This is the value of c0S(J) , not the value of Sin(J) .
Choice C is incorrect. This is the reciprocal of the value of Sin(J), not the value of Sin(J) .
Choice D is incorrect. This is the reciprocal of the value of c0S(J), not the value of Sin(J).$qb$);
select seed_pool_question($qb$CB-3e4e2ab0$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A
B??? CX° Z? D
?
N0te: Figurenot ?ra?nt0SCa1e·
In the figure,--AE intersects--DB at point C and--AB is parallel to--DE, creating triangles ABC and CDE. If x = 63 and y = 2x - 47, what is
the value of z?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3e4e2ab0.png$qb$, $qb$[{"label": "A", "body": "38"}, {"label": "B", "body": "47"}, {"label": "C", "body": "63"}, {"label": "D", "body": "79"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that -AE intersects -DB at point C and that -AB is parallel to -DE, creating triangles ABC and CDE. Since -AB
is parallel to -DE, angles BAC and DEC are opposite interior angles and are congruent. It follows that the measure of angle DEC is y?. This
means the three interior angles of triangle CDE have measures of x^(?) z^(°), , and y°, respectively. It’s given that x = 63 and y = 2x - 47.
Substituting 63 for x in the equation y = 2x - 47 yields y = 2(63) - 47, or y = 79. Therefore, the three interior angles of triangle CDE have
measures 63^(°), z^(°), and 79^(°), respectively. The sum of the interior angles of a triangle is 180^(?). Therefore, 63 + z + 79 = 180, or z + 142 = 180.
Subtracting 142 from both sides of this equation yields z = 38. Therefore, the value of z is 38.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of x, not z.
Choice D is incorrect. This is the value of y, not z.$qb$);
select seed_pool_question($qb$CB-e89f63bf$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The sum of the measures of two angles in a triangle is 64^(°). What is the measure of the third angle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e89f63bf.png$qb$, $qb$[{"label": "A", "body": "26^(°)"}, {"label": "B", "body": "52^(°)"}, {"label": "C", "body": "116^(°)"}, {"label": "D", "body": "128^(?)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the sum of the measures of two angles in a triangle is 64^(°). The sum of the measures of all three angles in a
triangle is 180^(°). It follows that the measure of the third angle is the difference between 180^(°) and 64^(°), or 180 - 64, which is 116^(?). Therefore, the
measure of the third angle is 116^(?).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5207e508$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
?
--?170^(?) ?°
?
N0te: Figuren0tdraWnt0SCaIe·
In the figure, line m is parallel to line n. What is the value of w?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5207e508.png$qb$, $qb$[{"label": "A", "body": "17"}, {"label": "B", "body": "30"}, {"label": "C", "body": "70"}, {"label": "D", "body": "170"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that lines m and n are parallel. Since line t intersects both lines m and n, it's a transversal. The angles in the figure
marked as 170^(?) and w^(°) are on the same side of the transversal, where one is an interior angle with line m as a side, and the other is an exterior
angle with line n as a side. Thus, the marked angles are corresponding angles. When two parallel lines are intersected by a transversal,
corresponding angles are congruent and, therefore, have equal measure. It follows that w^(°)= 170^(°). Therefore, the value of w is 170.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f67e4efc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A right circular cylinder has a volume of . If the height of the cylinder is 5, what is the radius of the cylinder?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f67e4efc.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "4.5"}, {"label": "C", "body": "9"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The volume of a right circular cylinder with a radius of r is the product of the area of the base, , and the height, h. The
volume of the right circular cylinder described is  and its height is 5. If the radius is r, it follows that . Dividing both sides
of this equation by  yields . Taking the square root of both sides yields  or . Since r represents the radius, the value
must be positive. Therefore, the radius is 3.
Choice B is incorrect and may result from finding that the square of the radius is 9, but then from dividing 9 by 2, rather than taking the square
root of 9. Choice C is incorrect. This represents the square of the radius. Choice D is incorrect and may result from solving the equation
for , not r, by dividing by  on both sides and then by subtracting, not dividing, 5 from both sides.$qb$);
select seed_pool_question($qb$CB-ecc98c87$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$? ?
?
?| X?O^(°) | ??°°
Note: Figuren0tdraWnt0SCa1e·
In the figure shown, line k intersects lines r and s. If w = 147, which additional piece of information is sufficient to prove that lines r and s are
parallel?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ecc98c87.png$qb$, $qb$[{"label": "A", "body": "x = 33"}, {"label": "B", "body": "y = 147"}, {"label": "C", "body": "w + y = 180"}, {"label": "D", "body": "y + z = 180"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The figure shows transversal k intersecting lines r and s, where the angles labeled w^(°) and y° are two corresponding angles
and the angles labeled x^(°) and z^(°) are two corresponding angles. When a transversal intersects two lines, the lines are parallel if and only if two
corresponding angles are congruent. It’s given that w = 147. If y = 147, then the two corresponding angles labeled w^(°) and y? are congruent,
which is sufficient to prove that lines r and s are parallel.
Choice A is incorrect. The angle labeled x^(°) forms a linear pair with the angle labeled w^(°), so x = 180 - 147, or x = 33, regardless of whether
lines r and s are parallel.
Choice C is incorrect. Substituting 147 for w in this equation yields 147 + y = 180, or y = 33. Since the angle labeled w^(?) and the angle labeled
y° are corresponding angles, if w and y aren’t equal, then lines r and s can’t be parallel.
Choice D is incorrect. The relationship y + z = 180 describes a linear pair at line s, which is true regardless of whether lines r and s are parallel.$qb$);
select seed_pool_question($qb$CB-e5c57163$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Square A has side lengths that are 166 times the side lengths of square B. The area of square A is k times the area of square B. What is the
value of k?$qb$, null, null, null, array[$qb$27556$qb$]::text[], $qb$The correct answer is 27,556. The area of a square is s2 , where s is the side length of the square. Let x represent the length of each side of
square B. Substituting x for s in s2 yields x2 . It follows that the area of square B is x2. It’s given that square A has side lengths that are 166
times the side lengths of square B. Since x represents the length of each side of square B, the length of each side of square A can be
represented by the expression 166x. It follows that the area of square A is (166x)^(2), or 27,556x^(2). It’s given that the area of square A is k times
the area of square B. Since the area of square A is equal to 27,556x^(2) , and the area of square B is equal to x2, an equation representing the given
statement is 27,556x^(2) = kx^(2) . Since x represents the length of each side of square B, the value of x must be positive. Therefore, the value of
x2 is also positive, so it does not equal 0. Dividing by x2 on both sides of the equation 27,556x^(2) = kx^(2) yields 27,556 = k. Therefore, the value
of k is 27,556.$qb$);
select seed_pool_question($qb$CB-33e29881$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In right triangle RST, the sum of the measures of angle R and angle S is 90 degrees. The value of Sin(R) is (√-15)/4 . What is the value of coS(S)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-33e29881.png$qb$, $qb$[{"label": "A", "body": "(√-15)/15"}, {"label": "B", "body": "(√-15)/4"}, {"label": "C", "body": "(4√-15)/15"}, {"label": "D", "body": "√-15"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The sine of any acute angle is equal to the cosine of its complement. It’s given that in right triangle RS?, the sum of the
measures of angle R and angle S is 90 degrees. Therefore, angle R and angle S are complementary, and the value of SinR is equal to the value
of c0SS. It's given that the value of SinR is (√-15)/4 , so the value of c0SS is also (√-15)/4 .
Choice A is incorrect. This is the value of tanS.
Choice C is incorrect. This is the value of 1/c08S .
Choice D is incorrect. This is the value of 1/tanS .$qb$);
select seed_pool_question($qb$CB-93f48423$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the area, in square inches, of a rectangle with a length of 7 inches and a width of 6 inches?$qb$, null, $qb$[{"label": "A", "body": "13"}, {"label": "B", "body": "20"}, {"label": "C", "body": "42"}, {"label": "D", "body": "84"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The area, A, of a rectangle is given by the formula A = ℓw, where ℓ represents the length of the rectangle and w represents
its width. It’s given that the rectangle has a length of 7 inches and a width of 6 inches. Substituting 7 for ℓ and 6 for w in the formula A = ℓw
yields A = (7)(6), or A = 42. Thus, the area, in square inches, of the rectangle is 42.
Choice A is incorrect. This is the sum, not the product, of the length and width of the rectangle.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is twice the area, in square inches, of the rectangle.$qb$);
select seed_pool_question($qb$CB-5252e606$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The side length of a square is 55 centimeterS (cm) . What is the area, in cm2, of the square?$qb$, null, $qb$[{"label": "A", "body": "110"}, {"label": "B", "body": "220"}, {"label": "C", "body": "3,025"}, {"label": "D", "body": "12,100"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The area A, iu Square centimeterS , of a square with side length s, in cm, is given by the formula A = s2. It’s
(^(cm)5^(2)5)
given that the square has a side length of 55cm. Substituting  for s in the formula A = s2 yields A = 55^(2), or A = 3,025. Therefore, the
area, in cm2, of the square is 3,025.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the perimeter, in cm, of the square, not its area, in cm2.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-bb560789$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Triangle R has an area of 80 Square ceutimeterS (cm2 ) . Square S has side lengths of 4 cm. What is the total area of triangle R and square S,
in cm2?$qb$, null, $qb$[{"label": "A", "body": "42"}, {"label": "B", "body": "44"}, {"label": "C", "body": "84"}, {"label": "D", "body": "96"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that triangle R has an area of 80cm2. The area of a square is ℓ^(2), where ℓ is the side length of the square. It's given
that square S has side lengths of 4cm. It follows that the area, in cm2 , of square S is 4^(2), or 16. Therefore, the total area, in cm2, of triangle R
and square S is 80 + 16, or 96.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9342ca50$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?AB???? X° CD ?
Note: Figuren0t ?ra?nt0SCaIe·
In the figure shown, --BC is parallel to --ADand x = 22. Line t passes through points A and C. What is the value of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9342ca50.png$qb$, $qb$[{"label": "A", "body": "22"}, {"label": "B", "body": "44"}, {"label": "C", "body": "68"}, {"label": "D", "body": "158"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that -BC is parallel to -AD. Since line t intersects --BC and --AD, it's a transversal. The angles in the figure marked
as x° and y° are on opposite sides of the transversal and lie between the parallel segments, so they are alternate interior angles. When two
parallel segments are intersected by a transversal, alternate interior angles have equal measure. It's also given that x = 22. Therefore, the value
of y is 22.
Choice B is incorrect. This is the value of 2x, not the value of y.
Choice C is incorrect. This is the complement of 22, not the value of y.
Choice D is incorrect. This is the supplement of 22 , not the value of y.$qb$);
select seed_pool_question($qb$CB-5afbdc8e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the length of one side of a square that has the same area as a circle with radius 2 ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5afbdc8e.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The area A of a circle with radius r is given by the formula . Thus, a circle with radius 2 has area , which can
be rewritten as . The area of a square with side length s is given by the formula . Thus, if a square has the same area as a circle with
radius 2, then . Since the side length of a square must be a positive number, taking the square root of both sides of  gives
. Using the properties of square roots,  can be rewritten as , which is equivalent to . Therefore,
.
Choice A is incorrect. The side length of the square isn’t equal to the radius of the circle. Choices B and D are incorrect and may result from
incorrectly simplifying the expression .$qb$);
select seed_pool_question($qb$CB-983412ea$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right square prism has a height of 14 units. The volume of the prism is 2,016 cubic units. What is the length, in units, of an edge of the base?$qb$, null, null, null, array[$qb$12$qb$]::text[], $qb$The correct answer is 12. The volume, V, of a right square prism can be calculated using the formula V = s2h, where s represents the length of
an edge of the base and h represents the height of the prism. It’s given that the volume of the prism is 2,016 cubic units and the height is 14
units. Substituting 2,016 for V and 14 for h in the formula V = s2h yields . Dividing both sides of this equation by 14 yields
2,016 = -(s1^(2)2) (=14s)
144 = s^(2). Taking the square root of both sides of this equation yields two solutions:  and 12 = s. The length can't be negative, so
12 = s. Therefore, the length, in units, of an edge of the base is 12.$qb$);
select seed_pool_question($qb$CB-d12bca0a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$(?? ?(?, ?) (8, 0))/O?| ? ?X
N0te: Figuren0t ?ra?nt0SCa1e·
The circle shown has its center at (0, 0) . What is the value of k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d12bca0a.png$qb$, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "7"}, {"label": "C", "body": "8"}, {"label": "D", "body": "√-60"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the circle shown has its center at (0, 0). The equation of a circle in the xy-plane with its center at  can be
expressed as x2 + y2 = r2, where r is the radius of the circle. It’s shown that (8, 0) lies on the circle. Since the circle has its center at x^(2) +(0y^(,2)0(=)0^(,) 604)
and (8, 0) lies on the circle, it follows that the radius of the circle is 8. Substituting 8 for r in the equation x2 + y2 = r2 yields .
It's also shown that (2, k) lies on the circle. Substituting 2 for x and k for y in this equation yields 2^(2) + k^(2) = 64, or 4 + k^(2) = 64. Subtracting 4
from both sides of this equation yields k^(2) = 60. Taking the square root of both sides of this equation yields k = ?√-60. Since (2, k) lies above
the x-axis, k must be positive. Therefore k = √-60.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the x-coordinate of one of the circle’s x-intercepts, not the value of k.$qb$);
select seed_pool_question($qb$CB-a4c0547f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle XYZ, angle Z is a right angle and the length of --YZ is 24 units. If tan X = 12/35 , what is the perimeter, in units, of triangle XYZ?$qb$, null, $qb$[{"label": "A", "body": "188"}, {"label": "B", "body": "168"}, {"label": "C", "body": "84"}, {"label": "D", "body": "71"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that angle Z in triangle XYZ is a right angle. Thus, side YZ is the leg opposite angle X and side XZ is the leg
adjacent to angle X. The tangent of an acute angle in a right triangle is the ratio of the length of the leg opposite the angle to the length of the
leg adjacent to the angle. It follows that . It's given that tan X = 12/35 and the length of side YZ is 24 units. Substituting  for
tatnanXX==YZ/XZYZ/XZ 12(X12/3Z5)
tauX and 24 for YZ in the equation  yields . Multiplying both sides of this equation by 35(XZ) yields
12/35 = 24/XZ 12
= 24(35) , or 12(XZ) = 840. Dividing both sides of this equation by  yields XZ = 70. The length XY can be calculated using the
Pythagorean theorem, which states that if a right triangle has legs with lengths of a and b and a hypotenuse with length c, then a2 + b2 = c2.
Substituting 70 for a and 24 for b in this equation yields 70^(2) + 24^(2) = c^(2) , or 5,476 = c^(2). Taking the square root of both sides of this equation
yields ±74 = c. Since the length of the hypotenuse must be positive, 74 = c. Therefore, the length of XY is 74 units. The perimeter of a
triangle is the sum of the lengths of all sides. Thus, (74 + 70 + 24) units, or 168 units, is the perimeter of triangle XYZ.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This would be the perimeter, in units, for a right triangle where the length of side YZ is 12 units, not 24 units.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-659cb706$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$2? XZ ??Y
?5
N0te: FigurenotdraWnt0SCaIe·
Triangle XYZ shown is a right triangle. Which of the following has the same value as SinX?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-659cb706.png$qb$, $qb$[{"label": "A", "body": "tanX"}, {"label": "B", "body": "tanY"}, {"label": "C", "body": "c0SX"}, {"label": "D", "body": "coSY"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The sine of an angle is equal to the cosine of its complementary angle. In the triangle shown, angle Z is a right angle; thus,
angles X and Y are complementary angles. Therefore, c0SY has the same value as SinX.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-c8d60e48$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the given triangle,  and  has a measure of . What is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c8d60e48.png$qb$, $qb$[{"label": "A", "body": "36"}, {"label": "B", "body": "46"}, {"label": "C", "body": "58"}, {"label": "D", "body": "70"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since , the measures of their corresponding angles,  and , are equal. Since  has a
measure of , the measure of  is also . Since the sum of the measures of the interior angles in a triangle is , it follows
that , or . Subtracting by 134 on both sides of this equation yields .
Choices A, C, and D are incorrect and may result from calculation errors.$qb$);
select seed_pool_question($qb$CB-1f0b582e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Square X has a side length of 12 centimeters. The perimeter of square Y is 2 times the perimeter of square X. What is the length, in centimeters,
of one side of square Y?$qb$, null, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "10"}, {"label": "C", "body": "14"}, {"label": "D", "body": "24"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The perimeter, P, of a square can be found using the formula P = 4s, where s is the length of each side of the square. It's
given that square X has a side length of 12 centimeters. Substituting 12 for s in the formula for the perimeter of a square yields P = 4(12), or
P = 48. Therefore, the perimeter of square X is 48 centimeters. It’s also given that the perimeter of square Y is 2 times the perimeter of square
X. Therefore, the perimeter of square Y is 2(48) , or 96, centimeters. Substituting 96 for P in the formula P = 4s gives 96 = 4s. Dividing both
sides of this equation by 4 gives 24 = s. Therefore, the length of one side of square Y is 24 centimeters.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-deff8a2f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The circumference of the base of a right circular cylinder is 20π meters, and the height of the cylinder is 6 meters. What is the volume, in cubic
meters, of the cylinder?$qb$, null, $qb$[{"label": "A", "body": "60π"}, {"label": "B", "body": "120π"}, {"label": "C", "body": "600π"}, {"label": "D", "body": "2,400π"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The volume, V, of a right circular cylinder is given by the formula V = πr2h, where r is the radius of the base of the cylinder
and h is the height of the cylinder. It’s given that a right circular cylinder has a height of 6 meters. Therefore, h = 6. It's also given that the right
circular cylinder has a base with a circumference of 20π meters. The circumference, C, of a circle is given by C = 2πr, where r is the radius of
the circle. Substituting 20π for C in the formula C = 2πr yields 20π = 2πr. Dividing each side of this equation by 2π yields 10 = r.
Substituting 10 for r and 6 for h in the formula V = πr2h yields V = π(10)^(2)(6), or V = 600π. Therefore, the volume, in cubic meters, of the
cylinder is 600π.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the lateral surface area, not the volume, of the cylinder.
Choice D is incorrect. This is the result of using the diameter, not the radius, for the value of r in the formula V = πr2h.$qb$);
select seed_pool_question($qb$CB-1fe41c6b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The table gives the areas and perimeters of two similar rectangles, where n is a constant.
Area (square Perimeter
inches) (inches)
(|--?)/(|-?)| ?(--|)/(-2,520 |)|(--|)/(-|)|
Rectangle A 630 210
Rectangle B n
What is the value of n?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1fe41c6b.png$qb$, $qb$[{"label": "A", "body": "2,100"}, {"label": "B", "body": "1,680"}, {"label": "C", "body": "840"}, {"label": "D", "body": "420"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that rectangle A and rectangle B are similar. Therefore, there is a positive constant k such that the length of each
side of rectangle B is k times the length of the corresponding side of rectangle A and the area of rectangle B is k^(2) times the area of rectangle A.
It’s also given that the area of rectangle A is 630 square inches and that the area of rectangle B is 2,520 square inches. It follows that 2,520
= 630k^(2). Dividing both sides of this equation by 630 yields 4 = k^(2) , or k^(2) = 4. Taking the positive square root of each side of this equation
yields k = 2. Therefore, the length of each side of rectangle B is 2 times the length of the corresponding side of rectangle A. It follows that the
perimeter of rectangle B is 2 times the perimeter of rectangle A. Since the perimeter of rectangle A is 210 inches, the perimeter of rectangle B is
2(210) , or 420, inches. Therefore, n = 420.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from using the area scale factor instead of the side length scale factor.$qb$);
select seed_pool_question($qb$CB-d5f349b7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$P ????
? ?? T?
Note: FigureSnotdraWnt0SCaIe·
Right triangles PQR and STU are similar, where P corresponds to S. If the measure of angle Q is 18^(°), what is the measure of angle S?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d5f349b7.png$qb$, $qb$[{"label": "A", "body": "18^(°)"}, {"label": "B", "body": "72^(°)"}, {"label": "C", "body": "82^(°)"}, {"label": "D", "body": "162^(°)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In similar triangles, corresponding angles are congruent. It’s given that right triangles PQR and STU are similar, where
angle P corresponds to angle S. It follows that angle P is congruent to angle S. In the triangles shown, angle R and angle U are both marked
as right angles, so angle R and angle U are corresponding angles. It follows that angle Q and angle T are corresponding angles, and thus, angle
Q is congruent to angle T. It’s given that the measure of angle Q is 18^(°), so the measure of angle T is also 18^(°). Angle U is a right angle, so the
measure of angle U is 90^(°). The sum of the measures of the interior angles of a triangle is 180^(°). Thus, the sum of the measures of the interior
angles of triangle STU is 180 degrees. Let s represent the measure, in degrees, of angle S. It follows that s + 18 + 90 = 180, or
s + 108 = 180. Subtracting 108 from both sides of this equation yields s = 72. Therefore, if the measure of angle Q is 18 degrees, then the
measure of angle S is 72 degrees.
Choice A is incorrect. This is the measure of angle T.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the sum of the measures of angle S and angle U.$qb$);
select seed_pool_question($qb$CB-babd7461$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$? ????
????L
Note: Figuren0tdraWnt0SCaIe·
In the figure shown, triangle JKL is similar to triangle RST, where J corresponds to R and K corresponds to S. The length of--JK is 15, and
the perimeter of triangle JKL is 36. The length of--RS is 135. What is the perimeter of triangle RST?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-babd7461.png$qb$, $qb$[{"label": "A", "body": "324"}, {"label": "B", "body": "540"}, {"label": "C", "body": "2,916"}, {"label": "D", "body": "8,100"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that triangle JKL is similar to triangle RST, where J corresponds to R and K corresponds to S. It follows that
--JK corresponds to --RS. If two triangles are similar, then the scale factor between their perimeters is equal to the scale factor between the
lengths of their corresponding sides. It's given that the length of --JK is 15 and the length of --RS is 135. Therefore, the scale factor from the
length of --JK to the length of --RS is 135/15 , or 9. It’s given that the perimeter of triangle JKL is 36. Let p represent the perimeter of triangle RST.
It follows that p/36 = 9. Multiplying each side of this equation by 36 yields p = 324. Therefore, the perimeter of triangle RST is 324.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-686b5212$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?
q
--??° 58^(°)
?
N0te: Figuren0tdraWntoSCaIe·
In the figure, line q is parallel to line r, and both lines are intersected by line s. If y = 2x + 8, what is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-686b5212.png$qb$, null, null, array[$qb$57$qb$]::text[], $qb$The correct answer is 57. Based on the figure, the angle with measure y? and the angle vertical to the angle with measure 58^(°) are same side
interior angles. Since vertical angles are congruent, the angle vertical to the angle with measure 58^(°) also has measure 58^(°). It’s given that lines q
and r are parallel. Therefore, same side interior angles between lines q and r are supplementary. It follows that y + 58 = 180. If y = 2x + 8,
then the value of x can be found by substituting 2x + 8 for y in the equation y + 58 = 180, which yields (2x + 8) + 58 = 180, or 2x + 66
= 180. Subtracting 66 from both sides of this equation yields 2x = 114. Dividing both sides of this equation by 2 yields x = 57. Thus, if
y = 2x + 8, the value of x is 57.$qb$);
select seed_pool_question($qb$CB-a6dbad6b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the figure above, lines  and m are parallel, , and . What is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a6dbad6b.png$qb$, $qb$[{"label": "A", "body": "120"}, {"label": "B", "body": "100"}, {"label": "C", "body": "90"}, {"label": "D", "body": "80"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Let the measure of the third angle in the smaller triangle be . Since lines  and m are parallel and cut by transversals, it
follows that the corresponding angles formed are congruent. So . The sum of the measures of the interior angles of a triangle
is , which for the interior angles in the smaller triangle yields . Given that  and , it follows that
. Solving for x gives , or .
Choice A is incorrect and may result from incorrectly assuming that angles . Choice C is incorrect and may result from incorrectly
assuming that the smaller triangle is a right triangle, with x as the right angle. Choice D is incorrect and may result from a misunderstanding of
the exterior angle theorem and incorrectly assuming that .$qb$);
select seed_pool_question($qb$CB-27d075d8$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For two acute angles, ∠Q and ∠RcoS (Q) = Sin (R), . The measures, in degrees, of ∠Q and ∠R are x + 52 and 4x + 13, respectively. What
is the value of x?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "13"}, {"label": "C", "body": "23"}, {"label": "D", "body": "38"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that for two acute angles, ∠Q and ∠Rc0S(Q) = Sin(R), . For two acute angles, if the sine of one angle is equal
to the cosine of the other, the angles are complementary. Therefore, the sum of the measures, in degrees, of ∠Q and ∠R is 90. It’s given that
the measures, in degrees, of ∠Q and ∠R are x + 52 and 4x + 13, respectively. Therefore, (x + 52) + (4x + 13) = 90. Combining like
terms in this equation yields 5x + 65 = 90. Subtracting 65 from each side of this equation results in 5x = 25. Dividing each side of this
equation by 5 yields x = 5.
Choice B is incorrect. This would be the value of x if ∠Q and ∠R were congruent rather than complementary.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-81b664bc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the figure above, , , and  are parallel. Points B and E lie on  and , respectively. If , and
, what is the length of , to the nearest tenth?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-81b664bc.png$qb$, $qb$[{"label": "A", "body": "16.8"}, {"label": "B", "body": "17.5"}, {"label": "C", "body": "18.4"}, {"label": "D", "body": "19.6"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since , , and  are parallel, quadrilaterals  and  are similar. Let x represent the length of .
With similar figures, the ratios of the lengths of corresponding sides are equal. It follows that . Multiplying both sides of this
equation by 18.5 and by x yields , or . Dividing both sides of this equation by 9 yields , which to
the nearest tenth is 17.5.
Choices A, C, and D are incorrect and may result from errors made when setting up the proportion.$qb$);
select seed_pool_question($qb$CB-59cb654c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The area of a square is 64 square inches. What is the side length, in inches, of this square?$qb$, null, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "16"}, {"label": "C", "body": "64"}, {"label": "D", "body": "128"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the area of a square is 64 square inches. The area A, in square inches, of a square is given by the formula A
= s2, where s is the side length, in inches, of the square. Substituting 64 for A in this formula yields 64 = s2 . Taking the positive square root of
both sides of this equation yields 8 = s. Thus, the side length, in inches, of this square is 8.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the area, in square inches, of the square, not the side length, in inches, of the square.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-902dc959$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the figure above, what is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-902dc959.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Angle A is an acute angle in a right triangle, so the value of tan(A) is equivalent to the ratio of the length of the side
opposite angle A, 20, to the length of the nonhypotenuse side adjacent to angle A, 21. Therefore, .
Choice A is incorrect. This is the value of sin(A). Choice B is incorrect. This is the value of cos(A). Choice D is incorrect. This is the value of
tan(B).$qb$);
select seed_pool_question($qb$CB-e86f0651$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A circle has a radius of 43 meters. What is the area, in square meters, of the circle?$qb$, null, $qb$[{"label": "A", "body": "43π/2"}, {"label": "B", "body": "43π"}, {"label": "C", "body": "86π"}, {"label": "D", "body": "1,849π"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area, A, of a circle is given by the formula A = πr2 , where r is the radius of the circle. It’s given that the circle has a
radius of 43 meters. Substituting 43 for r in the formula A = πr2 yields A = π(43)^(2) , or A = 1,849π. Therefore, the area, in square meters, of
the circle is 1,849π.
Choice A is incorrect. This is the area, in square meters, of a circle with a radius of √(-43)/2 meters.
Choice B is incorrect. This is the area, in square meters, of a circle with a radius of √-43 meters.
Choice C is incorrect. This is the circumference, in meters, of the circle.$qb$);
select seed_pool_question($qb$CB-96467fea$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Circle N has a radius of 7 millimeters (mm). Circle M has an area of 64π mm2 . What is the total area, in mm2, of circles N and M?$qb$, null, $qb$[{"label": "A", "body": "113π"}, {"label": "B", "body": "92π"}, {"label": "C", "body": "78π"}, {"label": "D", "body": "15π"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that circle N has a radius of 7mm. The area of a circle is given by the expression πr2, where r is the radius of the
circle. Substituting 7 for r in the expression yields π(7)^(2), or 49π, for the area, in mm2 , of circle N. It’s also given that the area of circle M is 64π
mm2. Adding the two areas yields 49π + 64π, or 113π mm2, . Therefore, the total area, in mm2, of circles N and M is 113π.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-858fd1cf$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle in the xy-plane has its center at (-1, 1). Line t is tangent to this circle at the point (5, -4). Which of the following points also lies on line
t?$qb$, null, $qb$[{"label": "A", "body": "(0, 6/5)"}, {"label": "B", "body": "(4, 7)"}, {"label": "C", "body": "(10, 2)"}, {"label": "D", "body": "(11, 1)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the circle has its center at (-1, 1) and that line t is tangent to this circle at the point (5, -4). Therefore, the
points and are the endpoints of the radius of the circle at the point of tangency. The slope of a line or line segment that contains
(5(,c-, d4))
the points (-1(,a-1,()b5)/6) and can be calculated as . Substituting (-1, 1) for (a, b) and (5, -4) for (c, d) in the expression (d-b)/(c-a) yields
(d-b)/(-c-(5^(a))/6)
(-4-1)/(5-(-1)) , or . Thus, the slope of this radius is . A line that’s tangent to a circle is perpendicular to the radius of the circle at the point of
tangency. It follows that line t is perpendicular to the radius at the point , so the slope of line t is the negative reciprocal of the slope of
(5, -4)6/5
this radius. The negative reciprocal of - 5/6 is 6/5. Therefore, the slope of line t is . Since the slope of line t is the same between any two points
on line t, a point lies on line t if the slope of the line segment connecting the point and  is 6/5. Substituting choice C, (10, 2), for (a, b)
(1(50^(,), -2)4)
and (5, -4) for (c, d) in the expression (?-b)/(c-a) yields (-4-2)/(5-10) , or 6/5. Therefore, the point  lies on line t.
Choice A is incorrect. The slope of the line segment connecting (0, 6/5) and (5, -4) is (-4- 6/?)/(5-0) , or - 26/25 , not 6/5.
Choice B is incorrect. The slope of the line segment connecting (4, 7) and (5, -4) is (-4-7)/(5-4) , or -11, not 6/5 .
Choice D is incorrect. The slope of the line segment connecting (11, 1) and (5, -4) is (-4-1)/(5-11) , or 5/6 , not 6/5 .$qb$);
select seed_pool_question($qb$CB-9adb86ed$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Points Q and R lie on a circle with center P. The radius of this circle is 9 inches. Triangle PQR has a perimeter of 31 inches. What is the length,
in inches, of--QR?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9adb86ed.png$qb$, $qb$[{"label": "A", "body": "13√-2"}, {"label": "B", "body": "13"}, {"label": "C", "body": "9√-2"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since it's given that P is the center of a circle with a radius of 9 inches, and that points Q and R lie on that circle, it follows
that --PQ and --RP of triangle PQR each have a length of 9 inches. Let the length of --QR be x inches. It follows that the perimeter of triangle
PQR is 9 + 9 + x inches. Since it's given that the perimeter of triangle PQR is 31 inches, it follows that 9 + 9 + x = 31, or 18 + x = 31 .
Subtracting 18 from both sides of this equation gives x = 13. Therefore, the length, in inches, of --QR is 13.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1dc7e423$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle ABC, the measure of angle A is 52^(?) and AC = 30. In triangle PQR, the measure of angle P is 52^(°) and PR = 120. Which
additional piece of information is sufficient to prove that triangle ABC is similar to triangle PQR?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1dc7e423.png$qb$, $qb$[{"label": "A", "body": "AB = 50 and PQ = 50."}, {"label": "B", "body": "AB = 50 and QR = 200."}, {"label": "C", "body": "The measures of angle B and angle R are 32^(°) and 96^(°), respectively."}, {"label": "D", "body": "The measures of angle B and angle Q are 52^(°) and 32^(°), respectively."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the measure of angle A is 52^(°) and the measure of angle P is 52^(?). Therefore, angle A is congruent to angle P.
Choice C states that the measures of angle B and angle R are 32^(°) and 96^(°), respectively. The triangle sum theorem states that the measures of
the angles in a triangle sum to 180^(°). In triangle ABC, if the measure of angle B is 32^(°), it follows that the measure of angle C is
(180 - (52 + 96))(^(°)180 - (52
+ 32))^(°), or 96^(?). In triangle PQR, if the measure of angle R is 96^(°), it follows that the measure of angle Q is , or 32^(°).
Therefore, in triangles ABC and PQR, angle B is congruent to angle Q, and angle C is congruent to angle R. If two triangles have three pairs
of congruent angles, then the triangles are similar. Therefore, the additional piece of information that is sufficient to prove that triangle ABC is
similar to triangle PQR is that the measures of angle B and angle R are 32^(°) and 96^(°), respectively.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. If the measure of angle B is 52^(?), it follows that the measure of angle C is (180 - (52 + 52))^(°), or 76^(?). If the measure of
angle Q is 32^(°), which isn’t equal to any angle measure in triangle ABC, the triangles can’t be similar.$qb$);
select seed_pool_question($qb$CB-096c7ef5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$101214IIII11246800444466222288?(? ??)/(222 444 666 888 10II00 12II22 141144)| || || || || || || || || || || || || || || || |x
The three points shown define a circle. The circumference of this circle is kπ, where k is a constant. What is the value of k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-096c7ef5.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "6"}, {"label": "C", "body": "7"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the three points shown define a circle, so the center of that circle is an equal distance from each of the three
points. The point (7, 8) is halfway between the points (7, 5) and and is a distance of 3 units from each of those two points. The point
((77,,181))
(7, 8) is also a distance of 3 units from (4, 8) . Because the point  is the same distance from all three given points, it must be the center of
the circle. The radius of a circle is the distance from the center to any point on the circle. Since that distance is 3, it follows that the radius of the
circle is 3. The circumference of a circle with radius r is equal to 2πr. It follows that the circumference of the circle is 2(π)(3) , or 6π. It's given
that the circumference of the circle is kπ. Therefore, the value of k is 6.
Choice A is incorrect. This is the radius of the circle, not the value of k in the expression kπ.
Choice C is incorrect. This is the x-coordinate of the center of the circle, not the value of k in the expression kπ.
Choice D is incorrect. This is the value of k for which kπ represents the area of the circle, in square units, not the circumference of the circle, in
units.$qb$);
select seed_pool_question($qb$CB-9966235e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A cube has an edge length of 68 inches. A solid sphere with a radius of 34 inches is inside the cube, such that the sphere touches the center of
each face of the cube. To the nearest cubic inch, what is the volume of the space in the cube not taken up by the sphere?-$qb$, null, $qb$[{"label": "A", "body": "149,796"}, {"label": "B", "body": "164,500"}, {"label": "C", "body": "190,955"}, {"label": "D", "body": "310,800"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The volume of a cube can be found by using the formula V = s3, where V is the volume and s is the edge length of the
cube. Therefore, the volume of the given cube is V = 68^(3), or 314,432 cubic inches. The volume of a sphere can be found by using the formula
V = 4/3 πr3 , where V is the volume and r is the radius of the sphere. Therefore, the volume of the given sphere is V = 4/3π(34)3 , or
approximately 164,636 cubic inches. The volume of the space in the cube not taken up by the sphere is the difference between the volume of
the cube and volume of the sphere. Subtracting the approximate volume of the sphere from the volume of the cube gives 314,432 - 164,636
= 149,796 cubic inches.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2b41a4c4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A right rectangular prism has a length of 11 meters, a width of 8 meters, and a height of 10 meters. What is the volume, in cubic meters, of the
prism?$qb$, null, null, null, array[$qb$880$qb$]::text[], $qb$The correct answer is 880. The volume, V, of a right rectangular prism is given by the formula V = ℓwh, where ℓ is the length, w is the width,
and h is the height of the prism. It’s given that a right rectangular prism has a length of 11 meters, a width of 8 meters, and a height of 10
meters. Substituting 11 for ℓ8,  for w, and 10 for h in the formula V = ℓwh yields V = (11)(8)(10) , or V = 880. Therefore, the volume, in
cubic meters, of the prism is 880.$qb$);
select seed_pool_question($qb$CB-a0369739$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle ABC, the measure of angle B is 90^(?) and -BD is an altitude of the triangle. The length of -AB is 15 and the length of -AC is 23
greater than the length of -AB. What is the value of BC/BD ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a0369739.png$qb$, $qb$[{"label": "A", "body": "15/38"}, {"label": "B", "body": "15/23"}, {"label": "C", "body": "23/15"}, {"label": "D", "body": "38/15"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that in triangle ABC, the measure of angle B is 90^(?) and -BD is an altitude of the triangle. Therefore, the measure
of angle BDC is 90^(°). It follows that angle B is congruent to angle D and angle C is congruent to angle C. By the angle-angle similarity
postulate, triangle ABC is similar to triangle BDC. Since triangles ABC and BDC are similar, it follows that . It's also given that
AC/A1B5 += 2BC/(?3D)
the length of--AB is 15 and the length of--AC is 23 greater than the length of --AB. Therefore, the length of--AC is , or 38. Substituting 15
for AB and 38 for AC in the equation AC/AB = BC/BD yields 38/15 = BC/BD . Therefore, the value of BC/BD is 38/15 .
Choice A is incorrect. This is the value of BD/BC .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a07ed090$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$????? ?
The figure shown is a right circular cylinder with a radius of r and height of h. A second right circular cylinder (not shown) has a volume that is
392 times as large as the volume of the cylinder shown. Which of the following could represent the radius R, in terms of r, and the height H, in
terms of h, of the second cylinder?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a07ed090.png$qb$, $qb$[{"label": "A", "body": "R = 8r and H = 7h"}, {"label": "B", "body": "R = 8r and H = 49h"}, {"label": "C", "body": "R = 7r and H = 8h"}, {"label": "D", "body": "R = 49r and H = 8h"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The volume of a right circular cylinder is equal to πa2b, where a is the radius of a base of the cylinder and b is the height of
the cylinder. It’s given that the cylinder shown has a radius of r and a height of h. It follows that the volume of the cylinder shown is equal to
πr2h. It’s given that the second right circular cylinder has a radius of R and a height of H. It follows that the volume of the second cylinder is
equal to πR^(2)H. Choice C gives R = 7r and H = 8h. Substituting 7r for R and 8h for H in the expression that represents the volume of the
second cylinder yields π(7r)^(2)(8h) , or , which is equivalent to π(392r^(2)h) , or . This expression is equal to 392 times
πr2hπ(49r^(2)) (8h) 392(πr^(2)hR)
the volume of the cylinder shown, . Therefore, R = 7r and H = 8h could represent the radius , in terms of r, and the height H, in terms
of h, of the second cylinder.
Choice A is incorrect. Substituting 8r for R and 7h for H in the expression that represents the volume of the second cylinder yields π(8r)^(2)(7h) ,
or π(64r^(2)) (7h), which is equivalent to π(448r^(2)h) , or 448(πr^(2)h) . This expression is equal to 448, not 392, times the volume of the cylinder
shown.
Choice B is incorrect. Substituting 8r for R and 49h for H in the expression that represents the volume of the second cylinder yields
π(8r)^(2)(49h) , or π(64r^(2)) (49h) , which is equivalent to π(3,136r^(2)h) , or 3,136(πr^(2)h) . This expression is equal to 3,136, not 392, times the
volume of the cylinder shown.
Choice D is incorrect. Substituting 49r for R and 8h for H in the expression that represents the volume of the second cylinder yields
π(49r)^(2)(8h) , or π(2,401r^(2)) (8h) , which is equivalent to π(19,208r^(2)h) , or 19,208(πr^(2)h) . This expression is equal to 19,208, not 392, times
the volume of the cylinder shown.$qb$);
select seed_pool_question($qb$CB-cbe8ca31$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In △XYZ, the measure of ∠X is 24^(?) and the measure of ∠Y is 98^(?). What is the measure of ∠Z?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cbe8ca31.png$qb$, $qb$[{"label": "A", "body": "58^(°)"}, {"label": "B", "body": "74^(°)"}, {"label": "C", "body": "122^(°)"}, {"label": "D", "body": "212^(?)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The triangle angle sum theorem states that the sum of the measures of the interior angles of a triangle is 180^(°). It's given that
in △XYZ, the measure of ∠X is 24^(?) and the measure of ∠Y is 98^(?). It follows that the measure of ∠Z is (180 - 24 - 98)^(°), or 58^(°).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the sum of the measures of ∠X and ∠Y, not the measure of ∠Z.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3b931fb0$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A right circular cylinder has a volume of 377 cubic centimeters. The area of the base of the cylinder is 13 square centimeters. What is the height,
in centimeters, of the cylinder?$qb$, null, null, null, array[$qb$29$qb$]::text[], $qb$The correct answer is 29. The volume, V, of a right circular cylinder is given by the formula V = πr2h, where r is the radius of the base of the
cylinder and h is the height of the cylinder. Since the base of the cylinder is a circle with radius r, the area of the base of the cylinder is πr2. It's
given that a right circular cylinder has a volume of 377 cubic centimeters; therefore, V = 377. It's also given that the area of the base of the
cylinder is 13 square centimeters; therefore, πr2 = 13. Substituting 377 for V and 13 for πr2 in the formula V = πr2h yields 377 = 13h.
Dividing both sides of this equation by 13 yields 29 = h. Therefore, the height of the cylinder, in centimeters, is 29.$qb$);
select seed_pool_question($qb$CB-94364a79$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Two nearby trees are perpendicular to the ground, which is flat. One of these trees is 10 feet tall and has a shadow that is 5 feet long. At the
same time, the shadow of the other tree is 2 feet long. How tall, in feet, is the other tree?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "4"}, {"label": "C", "body": "8"}, {"label": "D", "body": "27"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Each tree and its shadow can be modeled using a right triangle, where the height of the tree and the length of its shadow are
the legs of the triangle. At a given point in time, the right triangles formed by two nearby trees and their respective shadows will be similar.
Therefore, if the height of the other tree is x, in feet, the value of x can be calculated by solving the proportional relationship 10fectta11/5fcet1ong
. This equation is equivalent to 10/5 = x/2 , or 2 = x/2 . Multiplying each side of the equation 2 = x/2 by 2 yields 4 = x. Therefore, the
= xfectta1I/(2 ?cct10n?)4 feet
other tree is tall.
Choice A is incorrect and may result from calculating the difference between the lengths of the shadows, rather than the height of the other tree.
Choice C is incorrect and may result from calculating the difference between the height of the 10-foot-tall tree and the length of the shadow of
the other tree, rather than calculating the height of the other tree.
Choice D is incorrect and may result from a conceptual or calculation error.$qb$);
select seed_pool_question($qb$CB-51f26ce8$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?
P???^(x°) ??^(x°) ?T
N0te: Figuren0tdraWnt0SCaIe·
△QPR is similar to △STR. The lengths represented by--ST--QP--PR, , , and--QR in the figure are 1415, , 20, and 25, respectively. What is the
length of --SR?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-51f26ce8.png$qb$, $qb$[{"label": "A", "body": "350/15"}, {"label": "B", "body": "350/2o"}, {"label": "C", "body": "210/2o"}, {"label": "D", "body": "210/25"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The figure shows that angle P in △QPR and angle T in △STR are right angles. It follows that angle P is congruent to
angle ?. The figure also shows that the measures of angle QRP and angle SR? are both x^(°). Therefore, angle QRP is congruent to angle
SRT. It’s given that △QPR is similar to △STR. Since angle P is congruent to angle T, and angle QRP is congruent to angle SRT, it
follows that --QR corresponds to --SR, and  corresponds to --ST. Since corresponding sides of similar triangles are proportional, it follows that
--Q P/ST---QP
. It’s also given that the lengths of , , and --QR are 14, 15, and 25, respectively. Substituting 14 for ST, 15 for , and 25 for
SR/QQRR = (S?)/QP SR =Q P350/15
in the equation SR/QR = (S?)/QP yields SR/25 = 14/15 . Multiplying each side of this equation by 25 yields SR = (14/15) (25) , or . Thus, the
length of--SR is 350/15 .
Choice B is incorrect. This is the result of solving the equation SR/25 = 14/20 , not SR/25 = 14/15 .
Choice C is incorrect. This is the result of solving the equation SR/14 = 15/20 , not SR/25 = 14/15.
Choice D is incorrect. This is the result of solving the equation SR/14 = 15/25 , not SR/25 = 14/15.$qb$);
select seed_pool_question($qb$CB-408b39ea$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$(x - 3)^(2) + (y + 16)^(2) = 289
The graph of the given equation is a circle in the xy-plane. The point (q, s) lies on the circle. Which of the following is NOT a possible value of q?$qb$, null, $qb$[{"label": "A", "body": "-17"}, {"label": "B", "body": "-3"}, {"label": "C", "body": "3"}, {"label": "D", "body": "17"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the graph of the equation is a circle in the xy-plane. For a circle in the form
(x - 3)^(2) + (y + 16)r^(2)2==228899
(x - h)^(2) + (y - k)^(2) = r^(2) , its center is (h, k) and its radius is r. It follows that . Taking the positive square root of both sides of this
equation yields r = 17. Therefore, the center of this circle is (3, -16) and the radius is 17. It follows that the x-coordinates of the points that lie
on the circle must be within 17 units of the x-coordinate of the center of the circle. Therefore, the least possible x-coordinate of a point that lies
on the circle is 3 - 17, or -14, and the greatest possible x-coordinate of a point that lies on the circle is 3 + 17, or 20. So for any point (q, s) to
lie on the circle, it must be true that -14 ≤ q ≤ 20. Since -17 does not satisfy this inequality, it is NOT a possible value of q.
Choice B is incorrect. Since -3 satisfies the inequality -14 ≤ q ≤ 20, it is a possible value of q.
Choice C is incorrect. Since 3 satisfies the inequality -14 ≤ q ≤ 20, it is a possible value of q.
Choice D is incorrect. Since 17 satisfies the inequality -14 ≤ q ≤ 20, it is a possible value of q.$qb$);
select seed_pool_question($qb$CB-124bc42b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$1(?086??(-?)/?/(-A D)| ? | ? | | |)/(O ? ? 6 8 10)| || || || || || ?X
Rectangle ABCD shown has a length of 7 units and a width of 2 units. What is the area, in square units, of rectangle ABCD?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-124bc42b.png$qb$, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "9"}, {"label": "C", "body": "14"}, {"label": "D", "body": "28"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The area, A, of a rectangle is given by the formula A = ℓw, where ℓ is the length and w is the width of the rectangle. It's
given that rectangle ABCD shown has a length of 7 units and a width of 2 units. Substituting 7 for ℓ and 2 for w in the formula A = ℓw yields
A = (7)(2) , or A = 14. Therefore, the area, in square units, of rectangle ABCD is 14.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c24e1bda$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
?
--?134^(?) ?°
?
N0te: Figuren0tdraWnt0SCaIe·
In the figure, line m is parallel to line n. What is the value of w?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c24e1bda.png$qb$, $qb$[{"label": "A", "body": "13"}, {"label": "B", "body": "34"}, {"label": "C", "body": "66"}, {"label": "D", "body": "134"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that lines m and n are parallel. Since line t intersects both lines m and n, it's a transversal. The angles in the figure
marked as 134^(?) and w^(°) are on the same side of the transversal, where one is an interior angle with line m as a side, and the other is an exterior
angle with line n as a side. Thus, the marked angles are corresponding angles. When two parallel lines are intersected by a transversal,
corresponding angles are congruent and, therefore, have equal measure. It follows that w^(°)= 134^(°). Therefore, the value of w is 134.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-055aafe7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Triangle ABC is similar to triangle XYZ, where AB, , and C correspond to XY, , and Z, respectively. In triangle ABC, the length of --AB is
170 and the length of --BC is 850. In triangle XYZ, the length of --YZ is 60. What is the length of --XY?$qb$, null, $qb$[{"label": "A", "body": "204"}, {"label": "B", "body": "182"}, {"label": "C", "body": "60"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that triangle ABC is similar to triangle XYZ, where AB, , and C correspond to XY, , and Z, respectively. It
follows that side AB corresponds to side XY and side BC corresponds to side YZ. Since the lengths of corresponding sides in similar
triangles are proportional, it follows that . Substituting 170 for AB60,  for YZ, and 850 for BC in this equation yields XY/17o = 60/850 .
XY/1A7B0 = YZ/BCXY = 12
Multiplying each side of this equation by  yields . Therefore, the length of--XY is 12.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the length of --YZ, not --XY.$qb$);
select seed_pool_question($qb$CB-2d2cb85e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?Tx?? ?
? V ?
N0te: FigurenotdraWnt0SCa1e·
In the figure, RT = TU, the measure of angle VST is 29^(°), and the measure of angle RVS is 41^(°). What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2d2cb85e.png$qb$, null, null, array[$qb$156$qb$]::text[], $qb$The correct answer is 156. In the figure shown, the sum of the measures of angle UVS and angle RVS is 180^(°). It’s given that the measure of
angle RVS is 41^(?). Therefore, the measure of angle UVS is (180 - 41)^(°), or 139^(°). The sum of the measures of the interior angles of a triangle
is 180^(°). In triangle UVS, the measure of angle UVS is 139^(?) and it's given that the measure of angle VST is 29^(?). Thus, the measure of angle
VUS is (180 - 139 - 29)^(?), or 12^(?). It’s given that R? = ?U. Therefore, triangle TUR is an isosceles triangle and the measure of VUS is
equal to the measure of angle TRU. In triangle TUR, the measure of angle VUS is 12^(°) and the measure of angle TRU is 12^(°). Thus, the
measure of angle UTR is (180 - 12 - 12)^(°), or 156^(?). The figure shows that the measure of angle UTR is x^(?), so the value of x is 156.$qb$);
select seed_pool_question($qb$CB-30aa51b7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y
8
6
4
2
?|| |?|| |??|| | ?|| ????|???? || | ?|| | ??|| | ?|| ?| ?|| ? x
 8  6  4  2 O 2 4 6 8
 2
 4
 6
 8
A rectangle is formed by the four points shown. What is the area, in square units, of the rectangle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-30aa51b7.png$qb$, null, null, array[$qb$50$qb$]::text[], $qb$The correct answer is 50. The area of a rectangle is Math output error, where Math output error and w are the lengths of two adjacent sides of
the rectangle. It's given that the points (-4, -1), (4-, 5) (7, 1) (-1, -5-) (4, 5), , and form a rectangle. The points (-4, -1) and (4, 5) form a side of
the rectangle that is adjacent to the side of the rectangle formed by the points  and (7, 1). In the xy-plane, the distance between two points,
(x1 , y1 ) and (x2 , y2 ) , can be found as . Thus, the length, in units, of the side formed by the points (-4, -1) and
(4, 5) can be found as √(√-(x2 - x1 ) 2 +)/((4 - (-4))2 +√( 2)(5 - (-1)) (y^(2) - y)/((7 - 4)^(2) + (1 - 5)^(2)) 1)2, which can be simplified to √-100, or 10. The length, in units, of the side formed by the
points (4, 5) and (7, 1) can be found as , which can be simplified to √-25, or 5. Therefore, the area, in square units, of
the rectangle formed by the four points shown is (10)(5) , or 50.$qb$);
select seed_pool_question($qb$CB-345cc36a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Y
???° ? ?° Z
X
N0te: Figuren0tdraWnt0SCaIe·
In the figure shown,--WZ and--XY intersect at point Q. YQ = 63, WQ = 70, WX = 60, and XQ = 120. What is the length of--YZ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-345cc36a.png$qb$, null, null, array[$qb$54$qb$]::text[], $qb$The correct answer is 54. The figure shown includes two triangles, triangle WQX and triangle YQZ, such that angle WQX and angle YQZ
are vertical angles. It follows that angle WQX is congruent to angle YQZ. It’s also given in the figure that the measures of angle W and angle
Y are a^(°). Therefore angle W is congruent to angle Y. Since triangle WQX and triangle YQZ have two pairs of congruent angles, triangle
WQX is similar to triangle YQZ by the angle-angle similarity postulate, where --YZ corresponds to --WX, and --YQ corresponds to --WQ. Since
the lengths of corresponding sides in similar triangles are proportional, it follows that . It’s given that YQ = 63WQ = 70, , and
WX = 60. Substituting 63 for ,  for WQ, and 60 for WX in the equation-YZ/WXYZ/(W=X)(Y=Q)/WQYQ/WQyields YZ/60 = 63/70 . Multiplying each side of this
YZ = (6Y3/70)Q(6700)
equation by 60 yields , or YZ = 54. Therefore, the length of  is 54.$qb$);
select seed_pool_question($qb$CB-8493fd10$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x2 + x√-t + y2 - y - 65 = 0
The given equation, where t is a constant, defines a circle in the xy-plane. The radius of this circle is √-83. What is the value of t?$qb$, null, $qb$[{"label": "A", "body": "73"}, {"label": "B", "body": "71"}, {"label": "C", "body": "37"}, {"label": "D", "body": "35"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the equation x2 + x√-t + y2 - y - 65 = 0, where t is a constant, defines a circle in the xy-plane. The
equation of a circle in the xy-plane can be written in the form , where (h, k) is the center and r is the radius of the
circle. Adding 65 to both sides of the given equation yields (y2 - y + (-1/2) 2) = 65x2+(x+(-(x√(√^(h))/t)/2 )/()t)22+++y(2(y---1y/2k)=)22 6=5 r2. By completing the square, this equation can be rewritten
as (x2 + x√-t + ((√-t)/2) 2) + . This equation can be rewritten as (x2 + x√-t + t/4)
+ , or (x + (√-t)/2 ) 2 + (y - 1/2 ) 2 = 261/4 + t/4 . Therefore, r2 = 261/4 + t/4 . It's given that the radius of this circle
(y2 - y + 1/4) r==65√+/83t/4 + 1/4
is √-83; therefore, . Squaring both sides of this equation yields r2 = 83. Since r2 = 261/4 + t/4 and r2 = 83, it follows that
t =261/(^(4)71) + t/4
= 83. Multiplying both sides of this equation by 4 yields 261 + t = 332. Subtracting 261 from both sides of this equation yields .
Therefore, the value of t is 71.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c8345903$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The circle above has center O, the length of arc  is , and . What is the length of arc  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c8345903.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The ratio of the lengths of two arcs of a circle is equal to the ratio of the measures of the central angles that subtend the
arcs. It’s given that arc  is subtended by a central angle with measure 100°. Since the sum of the measures of the angles about a point is
360°, it follows that arc  is subtended by a central angle with measure . If s is the length of arc , then s
must satisfy the ratio . Reducing the fraction  to its simplest form gives . Therefore, . Multiplying both
sides of  by  yields .
Choice A is incorrect. This is the length of an arc consisting of exactly half of the circle, but arc  is greater than half of the circle. Choice C
is incorrect. This is the total circumference of the circle. Choice D is incorrect. This is half the length of arc , not its full length.$qb$);
select seed_pool_question($qb$CB-901c3215$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangles ABC and DEF, angles B and E each have measure 27^(?) and angles C and F each have measure 41^(?). Which additional piece of
information is sufficient to determine whether triangle ABC is congruent to triangle DEF?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-901c3215.png$qb$, $qb$[{"label": "A", "body": "The measure of angle A"}, {"label": "B", "body": "The length of side AB"}, {"label": "C", "body": "The lengths of sides BC and EF"}, {"label": "D", "body": "No additional information is necessary."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since angles B and E each have the same measure and angles C and F each have the same measure, triangles ABC and
DEF are similar, where side BC corresponds to side EF. To determine whether two similar triangles are congruent, it is sufficient to
determine whether one pair of corresponding sides are congruent. Therefore, to determine whether triangles ABC and DEF are congruent, it
is sufficient to determine whether sides BC and EF have equal length. Thus, the lengths of BC and EF are sufficient to determine whether
triangle ABC is congruent to triangle DEF.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect. The given information is sufficient to determine that triangles ABC and DEF are similar, but not whether they are
congruent.$qb$);
select seed_pool_question($qb$CB-2bddbc1b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?N0tc: Figur4e2n?ot1draWnt0SCaIe· ??B
A
What is the value of c0SA in the triangle shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2bddbc1b.png$qb$, $qb$[{"label": "A", "body": "42/41"}, {"label": "B", "body": "41/42"}, {"label": "C", "body": "1/42"}, {"label": "D", "body": "1/41"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The cosine of an acute angle in a right triangle is defined as the ratio of the length of the leg adjacent to the angle to the
length of the hypotenuse. In the triangle shown, the length of the leg adjacent to angle A is 41, and the length of the hypotenuse is 42. Therefore,
c0S A = 41/42 .
Choice A is incorrect. This is the value of 1/c08A .
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-85f1892d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle XYZ, angle Y is a right angle, the measure of angle Z is 33^(?), and the length of --YZ is 26 units. If the area, in square units, of triangle
XYZ can be represented by the expression ktan33^(?), where k is a constant, what is the value of k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-85f1892d.png$qb$, null, null, array[$qb$338$qb$]::text[], $qb$The correct answer is 338. The tangent of an acute angle in a right triangle is the ratio of the length of the leg opposite the angle to the length of
the leg adjacent to the angle. In triangle XYZ, it's given that angle Y is a right angle. Thus, --XY is the leg opposite of angle Z and --YZ is the leg
adjacent to angle Z. It follows that tan Z = XY/YZ . It's also given that the measure of angle Z is 33^(°) and the length of --YZ is 26 units.
Substituting 33^(?) for Z and 26 for YZ in the equation tan Z = XY/YZ yields tau 33° = XY/26 . Multiplying each side of this equation by 26 yields
26tan33^(°)= XY. Therefore, the length of --XY is 26tan33^(°). The area of a triangle is half the product of the lengths of its legs. Since the
length of --YZ is 26 and the length of --XY is 26tan33^(°), it follows that the area of triangle XYZ is 1/2 (26)(26 tan 33°) square units, or
338tan33^(°) square units. It's given that the area, in square units, of triangle XYZ can be represented by the expression ktan33^(°), where k is a
constant. Therefore, 338 is the value of k.$qb$);
select seed_pool_question($qb$CB-f7dbde16$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangles LMN and RST, angles L and R each have measure 60^(?), LN = 10, and RT = 30. Which additional piece of information is
sufficient to prove that triangle LMN is similar to triangle RST?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f7dbde16.png$qb$, $qb$[{"label": "A", "body": "MN = 7 and ST = 7"}, {"label": "B", "body": "MN = 7 and ST = 21"}, {"label": "C", "body": "The measures of angles M and S are 70^(°) and 60^(°), respectively."}, {"label": "D", "body": "The measures of angles M and T are 70^(°) and 50^(°), respectively."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Two triangles are similar if they have three pairs of congruent corresponding angles. It’s given that angles L and R each
measure 60^(°), and so these corresponding angles are congruent. If angle M is 70^(°), then angle N must be 50^(°) so that the sum of the angles in
triangle LMN is 180^(?). If angle T is 50^(°), then angle S must be 70^(°) so that the sum of the angles in triangle RST is 180^(°). Therefore, if the
measures of angles M and T are 70^(°) and 50^(°), respectively, then corresponding angles M and S are both 70^(°), and corresponding angles N and
T are both 50^(°). It follows that triangles LMN and RST have three pairs of congruent corresponding angles, and so the triangles are similar.
Therefore, the additional piece of information that is sufficient to prove that triangle LMN is similar to triangle RST is that the measures of
angles M and ? are 70^(°) and 50^(°), respectively.
Choice A is incorrect. If the measures of two sides in one triangle are proportional to the corresponding sides in another triangle and the included
angles are congruent, then the triangles are similar. However, the two sides given are not proportional and the angle given is not included by the
given sides.
Choice B is incorrect. If the measures of two sides in one triangle are proportional to the corresponding sides in another triangle and the included
angles are congruent, then the triangles are similar. However, the angle given is not included between the proportional sides.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a4ed5285$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$? ??
5
N0te: FigurenotdraWnt0SCaIe·
The figure shows the lengths, in inches, of two sides of a right triangle. What is the area of the triangle, in square inches?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a4ed5285.png$qb$, null, null, array[$qb$7.5$qb$, $qb$15/2$qb$]::text[], $qb$The correct answer is 15/2 . The area, A, of a triangle is given by the formula A = 1/2bh, where b is the length of the base of the triangle and h is
the height of the triangle. In the right triangle shown, the length of the base of the triangle is 5 inches, and the height is 3 inches. It follows that
b = 5 and h = 3. Substituting 5 for b and 3 for h in the formula A = 1/2bh yields A = 1/2 (5)(3) , which is equivalent to A = 1/2 (15), or
A = 15/2 . Therefore, the area of the triangle, in square inches, is 15/2 . Note that 15/2 and 7.5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-87a9a2d4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?5 ^(B)C??1?1 A
N0te: FigurenotdraWnt0SCaIe·
In the right triangle shown, what is the value of SinA?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-87a9a2d4.png$qb$, $qb$[{"label": "A", "body": "1/171"}, {"label": "B", "body": "35/171"}, {"label": "C", "body": "171/35"}, {"label": "D", "body": "171"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The sine of an acute angle in a right triangle is the ratio of the length of the side opposite that angle to the length of the
hypotenuse. The hypotenuse of a right triangle is the side opposite the right angle. In right triangle ABC, side BC is the side opposite angle A
and side AB is the hypotenuse. It's given that the length of side BC is 35 units and the length of side AB is 171 units. Therefore, the value of
SinA is 35/171 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the ratio of the length of the hypotenuse to the length of the side opposite angle A rather than the ratio of the length
of the side opposite angle A to the length of the hypotenuse.
Choice D is incorrect. This is the length of the hypotenuse rather than SinA.$qb$);
select seed_pool_question($qb$CB-e6f2ace7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$easy$qb$::difficulty_level, null, $qb$? ??
?
N0te: FigurenotdraWnt0SCaIe·
The lengths of the legs of a right triangle are shown. Which of the following is closest to the length of the triangle's hypotenuse?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e6f2ace7.png$qb$, $qb$[{"label": "A", "body": "3·2"}, {"label": "B", "body": "5"}, {"label": "C", "body": "7·6"}, {"label": "D", "body": "20"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The Pythagorean theorem states that for a right triangle, a2 + b2 = c2, where a and b represent the lengths of the legs of
the triangle and c represents the length of its hypotenuse. In the triangle shown, the legs have lengths of 3 and 7. Substituting 3 for a and 7 for b
in the equation a2 + b2 = c2 yields 32 + 72 = c2, which is equivalent to 9 + 49 = c^(2) , or 58 = c2 . Taking the positive square root of both sides
of this equation yields √-58 = c. Thus, the value of c is approximately 7·6. Therefore, of the given choices, 7·6 is the closest to the length of the
triangle's hypotenuse.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b0c5ece5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?N0tc: FigurIe ?nobtdraWnt0SCaIe· ? 4
Which equation shows the relationship between the side lengths of the given triangle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b0c5ece5.png$qb$, $qb$[{"label": "A", "body": "4b = 19"}, {"label": "B", "body": "4 + b = 19"}, {"label": "C", "body": "4^(2) + b^(2) = 19^(2)"}, {"label": "D", "body": "4^(2) - b^(2) = 19^(2)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The Pythagorean theorem states that in a right triangle, the sum of the squares of the lengths of the two legs is equal to the
square of the length of the hypotenuse. Therefore, a2 + b2 = c2 , where a and b are the lengths of the legs and c is the length of the hypotenuse.
For the given right triangle, the lengths of the legs are 4 and b, and the length of the hypotenuse is 19. Substituting 4 for a and 19 for c in the
equation a2 + b2 = c2 yields 4^(2) + b^(2) = 19^(2). Thus, the relationship between the side lengths of the given triangle is 4^(2) + b^(2) = 19^(2) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-76c73dbf$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The graph of x2 + x + y2 + y = 199/2 in the xy-plane is a circle. What is the length of the circle’s radius?$qb$, null, null, null, array[$qb$10$qb$]::text[], $qb$The correct answer is 10. It's given that the graph of x2 + x + y2 + y = 199/2 in the xy-plane is a circle. The equation of a circle in the xy-plane
can be written in the form , where the coordinates of the center of the circle are (h, k) and the length of the radius of
(x(-x -h)h2)^(2) + (y - k)^(2) = r^(2)
the circle is r. The term  in this equation can be obtained by adding the square of half the coefficient of x to both sides of the given
equation to complete the square. The coefficient of x is 1. Half the coefficient of x is . The square of half the coefficient of x is . Adding 1/4
(x2 + x + 1/4 ) + (y2 + y) = (1 1/929)/2 + 1/4
to each side of  yields , or . Similarly,
(y - k()x22 + x) + (y2 + y) = 199/2 (x + 1/2 ) 2 + (y2(x++y ()1)/2=) 2 199/(+^(2) ()(x+y1/(+^(4))1/(+^(4))1/21/2))22
the term  can be obtained by adding the square of half the coefficient of y to both sides of this equation, which yields
, or . This equation is equivalent to
+ (y2 + y(+x 1/(+^(4)) ()1)/2=) 2 199/(+^(2) () y++1/4(1+)/2 ) 1/24= 10(x2 + 1/2 ) 2 + (y + 1/2 ) 2 = 199/2 + 1/4 + 1/4
= 100, or . Therefore, the length of the circle's radius is 10.$qb$);
select seed_pool_question($qb$CB-58c26db8$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The perimeter of an isosceles right triangle is 18 + 18√-2 inches. What is the length, in inches, of the hypotenuse of this triangle?$qb$, null, $qb$[{"label": "A", "body": "9"}, {"label": "B", "body": "9√-2"}, {"label": "C", "body": "18"}, {"label": "D", "body": "18√-2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The perimeter of a triangle is the sum of the lengths of its sides. Since the given triangle is an isosceles right triangle, the
length of each leg is the same and the length of the hypotenuse is equal to √-2 times the length of a leg. Let x represent the length, in inches, of
a leg of this isosceles right triangle. Therefore, the perimeter, in inches, of the triangle is , or 2x + x√-2, which is equivalent to
x (2 + √-2) . It's given that the perimeter of this triangle is 18 + 18√-2 inches. Thus, x (x2++ (x√2-+/(2√))-2x)/(2-√-2) √-2= 18 + 18√-2. Dividing both sides of this
equation by 2 + √-2 yields x = (18+18√-2)/(2+√-2) . Multiplying the right-hand side of this equation by yields x = (36+36√-2-18√-2-36)/2 , or x = 9√-2.
It follows that the length, in inches, of a leg of this isosceles right triangle is 9√-2. Therefore, the length, in inches, of the hypotenuse of this
isosceles right triangle is (9√-2) (√-2) , or 18.
Choice A is incorrect. If this were the length of the hypotenuse, the perimeter would be 9 + 9√-2 inches.
Choice B is incorrect. This is the length, in inches, of a leg of this triangle, not the hypotenuse.
Choice D is incorrect. If this were the length of the hypotenuse, the perimeter would be 36 + 18√-2 inches.$qb$);
select seed_pool_question($qb$CB-e336a1d2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A cube has an edge length of 41 inches. What is the volume, in cubic inches, of the cube?$qb$, null, $qb$[{"label": "A", "body": "164"}, {"label": "B", "body": "1,681"}, {"label": "C", "body": "10,086"}, {"label": "D", "body": "68,921"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The volume, V, of a cube can be found using the formula V = s3 , where s is the edge length of the cube. It's given that a
cube has an edge length of 41 inches. Substituting 41 inches for s in this equation yields V = 413 cubic inches, or V = 68,921 cubic inches.
Therefore, the volume of the cube is 68,921 cubic inches.
Choice A is incorrect. This is the perimeter, in inches, of the cube.
Choice B is incorrect. This is the area, in square inches, of a face of the cube.
Choice C is incorrect. This is the surface area, in square inches, of the cube.$qb$);
select seed_pool_question($qb$CB-e4b4e9ea$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The length of the edge of the base of a right square prism is 6 units. The volume of the prism is 2,880 cubic units. What is the height, in units, of
the prism?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e4b4e9ea.png$qb$, $qb$[{"label": "A", "body": "4√-30"}, {"label": "B", "body": "36"}, {"label": "C", "body": "24√-5"}, {"label": "D", "body": "80"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The volume, V, of a right square prism is given by the formula V = s2h, where s represents the length of the edge of the
base and h represents the height of the prism. It’s given that the volume of a right square prism is  cubic units and the length of the edge
V = s2h 2,880 =2^(,)(868^(2)0)h
of the base is 6 units. Substituting 2,880 for V and 6 for s in the formula yields , or 2,880 = 36h. Dividing both sides
of this equation by 36 yields 80 = h. Therefore, the height, in units, of the prism is 80.
Choice A is incorrect. This is the height, in units, of a right square prism where the length of the edge of the base is 6 units and the volume of the
prism is 144√-30, not 2,880, units.
Choice B is incorrect. This is the area, in square units, of the base, not the height, in units, of the prism.
Choice C is incorrect. This is the height, in units, of a right square prism where the length of the edge of the base is 6 units and the volume of the
prism is 864√-5, not 2,880, units.$qb$);
select seed_pool_question($qb$CB-c0586eb5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A cylinder has a diameter of 8 inches and a height of 12 inches. What is the volume, in cubic inches, of the cylinder?$qb$, null, $qb$[{"label": "A", "body": "16π"}, {"label": "B", "body": "96π"}, {"label": "C", "body": "192π"}, {"label": "D", "body": "768π"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The base of a cylinder is a circle with a diameter equal to the diameter of the cylinder. The volume, V, of a cylinder can be
found by multiplying the area of the circular base, A, by the height of the cylinder, h, or V = Ah. The area of a circle can be found using the
formula A = πr2, where r is the radius of the circle. It’s given that the diameter of the cylinder is 8 inches. Thus, the radius of this circle is 4
inches. Therefore, the area of the circular base of the cylinder is A = π(4)^(2) , or 16π square inches. It’s given that the height h of the cylinder is
12 inches. Substituting 16π for A and 12 for h in the formula V = Ah gives V = 16π(12), or 192π cubic inches.
Choice A is incorrect. This is the area of the circular base of the cylinder.
Choice B is incorrect and may result from using 8, instead of 16, as the value of r2 in the formula for the area of a circle.
Choice D is incorrect and may result from using 8, instead of 4, for the radius of the circular base.$qb$);
select seed_pool_question($qb$CB-2a549721$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Rectangle ABCD has an area of 280 square centimeters. The length of the rectangle is 10 centimeters. What is the width, in centimeters, of
the rectangle?$qb$, null, $qb$[{"label": "A", "body": "10"}, {"label": "B", "body": "28"}, {"label": "C", "body": "76"}, {"label": "D", "body": "140"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The area A of a rectangle is the product of its length Math output error- and its width w. It follows that -Math output error. It’s
given that rectangle ABCD has an area of 280 square centimeters and the length of the rectangle is 10 centimeters. Substituting 280 for A
and 10 for -Math output error in the equation -Math output error yields 280 = 10w. Dividing both sides of this equation by 10 yields 28 = w.
Therefore, the width, in centimeters, of the rectangle is 28.
Choice A is incorrect. This is the length, in centimeters, not the width, in centimeters, of the rectangle.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is half the area, in square centimeters, not the width, in centimeters, of the rectangle.$qb$);
select seed_pool_question($qb$CB-52f7b898$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$AC??54 ?0^(°) B
N0te: FigurenotdraWnt0SCaIe·
Right triangle ABC is shown. What is the value of tanA?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-52f7b898.png$qb$, $qb$[{"label": "A", "body": "(√-3)/54"}, {"label": "B", "body": "1/(√-3)"}, {"label": "C", "body": "√-3"}, {"label": "D", "body": "27√-3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. In the triangle shown, the measure of angle B is 30^(°) and angle C is a right angle, which means that it has a measure of 90^(°).
Since the sum of the angles in a triangle is equal to 180^(°), the measure of angle A is equal to , or 60^(°). In a right triangle whose
180°-(30 + x90√)°/3
acute angles have measures 30^(°) and 60^(°), the lengths of the legs can be represented by the expressions x, , and 2x, where x is the length
of the leg opposite the angle with measure 30^(°), x√-3 is the length of the leg opposite the angle with measure 60^(?), and 2x is the length of the
hypotenuse. In the triangle shown, the hypotenuse has a length of 54. It follows that 2x = 54, or x = 27. Therefore, the length of the leg
opposite angle B is 27 and the length of the leg opposite angle A is 27√-3. The tangent of an acute angle in a right triangle is defined as the
ratio of the length of the leg opposite the angle to the length of the leg adjacent to the angle. The length of the leg opposite angle A is 27√-3 and
the length of the leg adjacent to angle A is 27. Therefore, the value of tanA is (27?-3)/27, or √-3.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of 1/tanA , not the value of tanA.
Choice D is incorrect. This is the length of the leg opposite angle A, not the value of tanA.$qb$);
select seed_pool_question($qb$CB-03c6994f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Square A has side lengths that are 246 times the side lengths of square B. The area of square A is k times the area of square B. What is the
value of k?$qb$, null, $qb$[{"label": "A", "body": "60,516"}, {"label": "B", "body": "492"}, {"label": "C", "body": "246"}, {"label": "D", "body": "123"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The area of a square is s2 , where s is the side length of the square. Therefore, the area of square B is b^(2), where b is the side
length of square B. It’s given that square A has side lengths that are 246 times the side lengths of square B. Therefore, the side length of square
A can be represented by the expression 246b. It follows that the area of square A is (246b)^(2), or 60,516b^(2). It’s given that the area of square A is
k times the area of square B, so 60,516b^(2) = kb^(2) . Therefore, the value of k is 60,516.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-151eda3c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A manufacturing company produces two sizes of cylindrical containers that each have a height of 50 centimeters. The radius of container A is 16
centimeters, and the radius of container B is 25% longer than the radius of container A. What is the volume, in cubic centimeters, of container B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-151eda3c.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If the radius of container A is 16 centimeters and the radius of container B is 25% longer than the radius of container A, then
the radius of container B is  centimeters. The volume of a cylinder is , where r is the radius of the cylinder and h
is its height. Substituting  and  into  yields that the volume of cylinder B is  cubic
centimeters.
Choice A is incorrect and may result from multiplying the radius of cylinder B by the radius of cylinder A rather than squaring the radius of
cylinder B. Choice C is incorrect and may result from multiplying the radius of cylinder B by 25 rather than squaring it. Choice D is incorrect and
may result from taking the radius of cylinder B to be 25 centimeters rather than 20 centimeters.$qb$);
select seed_pool_question($qb$CB-35d37640$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Point F lies on a unit circle in the xy-plane and has coordinates (1, 0). Point G is the center of the circle and has coordinates (0, 0). Point H
also lies on the circle and has coordinates (-1, y), where y is a constant. Which of the following could be the positive measure of angle FGH,
in radians?$qb$, null, $qb$[{"label": "A", "body": "27π/2"}, {"label": "B", "body": "29π/2"}, {"label": "C", "body": "24π"}, {"label": "D", "body": "25π"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the circle is a unit circle, which means the circle has a radius of 1. It's also given that point G is the center of
the circle and has coordinates (0, 0) and that point H lies on the circle and has coordinates (-1, y) . Since the radius of the circle is 1, the value
of y must be 0, as all other points with an x-coordinate of -1 are a distance greater than 1 away from point G. Since F and H are points on the
unit circle centered at G, let side FG be the starting side of the angle and side GH be the terminal side of the angle. Since side FG is on the
positive x-axis and side GH is on the negative x-axis, side FG is half of a rotation around the unit circle, or π radians, away from side GH.
Therefore, the positive measure of angle FGH, in radians, is equal to π plus an integer multiple of 2π. In other words, the positive measure of
angle FGH, in radians, is an odd integer multiple of π. Of the given choices, only 25π is an odd integer multiple of π.
Choice A is incorrect. This could be the positive measure of an angle where the starting side is FG and the terminal side contains the point (0,
-1) , not (-1, 0) .
Choice B is incorrect. This could be the positive measure of an angle where the starting side is FG and the terminal side contains the point
(0, 1) , not (-1, 0) .
Choice C is incorrect. This could be the positive measure of an angle where the starting side is FG and the terminal side contains the point
(1, 0) , not (-1, 0) .$qb$);
select seed_pool_question($qb$CB-e50afdd3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$(x + 4)^(2) + (y - 19)^(2) = 121
The graph of the given equation is a circle in the xy-plane. The point (a, b) lies on the circle. Which of the following is a possible value for a?$qb$, null, $qb$[{"label": "A", "body": "-16"}, {"label": "B", "body": "-14"}, {"label": "C", "body": "11"}, {"label": "D", "body": "19"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. An equation of the form (x - h)^(2) + (y - k)^(2) = r^(2) , where hk, , and r are constants, represents a circle in the xy-plane with
center (h, k) and radius r. Therefore, the circle represented by the given equation has center (-4, 19) and radius 11 . Since the center of the
circle has an x-coordinate of -4 and the radius of the circle is 11 , the least possible x-coordinate for any point on the circle is -4 - 11, or -15.
Similarly, the greatest possible x-coordinate for any point on the circle is -4 + 11 , or 7. Therefore, if the point (a, b) lies on the circle, it must be
true that -15 ≤ a ≤ 7. Of the given choices, only -14 satisfies this inequality.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-167aff9e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Right rectangular prism X is similar to right rectangular prism Y. The surface area of right rectangular prism X is
58 Squarc centimetcrS , and the surface area of right rectangular prism Y is 1,450cm^(2) . The volume of right rectangular prism Y is
(c(mcm2)3)
1 ,250 cubic centimeter8 . What is the sum of the volumes, in cm3 , of right rectangular prism X and right rectangular prism Y?$qb$, null, null, null, array[$qb$1260$qb$]::text[], $qb$The correct answer is 1,260. Since it's given that prisms X and Y are similar, all the linear measurements of prism Y are k times the respective
linear measurements of prism X, where k is a positive constant. Therefore, the surface area of prism Y is k^(2) times the surface area of prism X
and the volume of prism Y is k^(3) times the volume of prism X. It's given that the surface area of prism Y is cm2 , and the surface area of
cm2 (1,145^(,)40)/585=0 k2 k^(2) = 25
prism X is 58 , which implies that 1,450 = 58k^(2). Dividing both sides of this equation by 58 yields , or . Since k is a
positive constant, k = 5. It's given that the volume of prism Y is 1,250 cm3. Therefore, the volume of prism X is equal to (1,250)/(k^(3)) cm3, which is
equivalent to (1,250)/(5^(3)) cm3 , or 10 cm3. Thus, the sum of the volumes, in cm3 , of the two prisms is 1,250 + 10, or 1,260.$qb$);
select seed_pool_question($qb$CB-2266984b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation above defines a circle in the xy-plane. What are the coordinates of the center of the circle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2266984b.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The standard equation of a circle in the xy-plane is of the form , where are the coordinates
of the center of the circle and r is the radius. The given equation can be rewritten in standard form by completing the squares. So the sum of the
first two terms, , needs a 100 to complete the square, and the sum of the second two terms, , needs a 64 to complete the
square. Adding 100 and 64 to both sides of the given equation yields , which is
equivalent to . Therefore, the coordinates of the center of the circle are .
Choices A, C, and D are incorrect and may result from computational errors made when attempting to complete the squares or when identifying
the coordinates of the center.$qb$);
select seed_pool_question($qb$CB-d0b6d927$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A rectangle has an area of 63 square meters and a length of 9 meters. What is the width, in meters, of the rectangle?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "54"}, {"label": "C", "body": "81"}, {"label": "D", "body": "567"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The area A, in square meters, of a rectangle is the product of its length ℓ, in meters, and its width w, in meters; thus, A
= ℓw. It's given that a rectangle has an area of 63 square meters and a length of 9 meters. Substituting 63 for A and 9 for ℓ in the equation A
= ℓw yields 63 = 9w. Dividing both sides of this equation by 9 yields 7 = w. Therefore, the width, in meters, of the rectangle is 7.
Choice B is incorrect. This is the difference between the area, in square meters, and the length, in meters, of the rectangle, not the width, in
meters, of the rectangle.
Choice C is incorrect. This is the square of the length, in meters, not the width, in meters, of the rectangle.
Choice D is incorrect. This is the product of the area, in square meters, and the length, in meters, of the rectangle, not the width, in meters, of the
rectangle.$qb$);
select seed_pool_question($qb$CB-d621cffb$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A sphere has a radius of 17/5 feet. What is the volume, in cubic feet, of the sphere?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d621cffb.png$qb$, $qb$[{"label": "A", "body": "5π/17"}, {"label": "B", "body": "68π/15"}, {"label": "C", "body": "32π/5"}, {"label": "D", "body": "(19,652π)/375"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The volume, V, of a sphere can be found using the formula V = 4/3 πr3, where r is the radius of the sphere. It’s given that the
sphere has a radius of 17/5 feet. Substituting 17/5 for r in the formula  yields V = 4/3 π( 17/5 ) 3, which is equivalent to V = 4/3 π ( (4,913)/125 ) ,
V(1=9,6 4/532ππ)/375 r3
or V = (19,652π)/375 . Therefore, the volume, in cubic feet, of the sphere is .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the volume, in cubic feet, of a sphere with a radius of √3 (-17)/5 feet.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1429dcdf$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$??^(X°) 2?
I?
N0te: FigurenotdraWnt0SCaIe·
In the triangle shown, what is the value of Siux^(°)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1429dcdf.png$qb$, null, null, array[$qb$.6956$qb$, $qb$.6957$qb$, $qb$16/23$qb$]::text[], $qb$The correct answer is 16/23 . In a right triangle, the sine of an acute angle is defined as the ratio of the length of the side opposite the angle to the
length of the hypotenuse. In the triangle shown, the length of the side opposite the angle with measure x^(°) is 16 units and the length of the
hypotenuse is 23 units. Therefore, the value of Sinx^(°) is 16/23 . Note that 16/23, .6956, .6957, 0.695, and 0.696 are examples of ways to enter a
correct answer.$qb$);
select seed_pool_question($qb$CB-69b0d79d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Point O is the center of the circle above, and the measure of  is . If the length of  is 18, what is the length of arc ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-69b0d79d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Because segments OA and OB are radii of the circle centered at point O, these segments have equal lengths. Therefore,
triangle AOB is an isosceles triangle, where angles OAB and OBA are congruent base angles of the triangle. It’s given that angle OAB measures
. Therefore, angle OBA also measures . Let  represent the measure of angle AOB. Since the sum of the measures of the three
angles of any triangle is , it follows that , or . Subtracting  from both sides of this
equation yields , or  radians. Therefore, the measure of angle AOB, and thus the measure of arc , is  radians. Since
is a radius of the given circle and its length is 18, the length of the radius of the circle is 18. Therefore, the length of arc  can be
calculated as , or .
Choices A, C, and D are incorrect and may result from conceptual or computational errors.$qb$);
select seed_pool_question($qb$CB-5a7e3b46$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In △ABC ∠B, is a right angle and the length of--BC is 136 millimeters. If coS A = 3/5 , what is the length, in millimeters, of --AB?$qb$, null, $qb$[{"label": "A", "body": "34"}, {"label": "B", "body": "102"}, {"label": "C", "body": "136"}, {"label": "D", "body": "170"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that in △ABC ∠B, is a right angle. Therefore, △ABC is a right triangle, and--AC is the hypotenuse of the
triangle. It's also given that coS A = 3/5 . Since the cosine of an acute angle in a right triangle is defined as the ratio of the length of the side
adjacent to the angle to the length of the hypotenuse, the ratio of the length of --AB to the length of --AC is 3 to 5. It follows that the length of --AB
can be represented as 3a and the length of --AC can be represented as 5a, where a is a constant. The Pythagorean theorem states that the sum
of the squares of the length of the legs of a right triangle is equal to the square of the length of its hypotenuse, so it follows that AB^(2) + BC^(2)
= AC^(2). Substituting 3a for AB and 5a for AC in this equation yields (3a)^(2) + BC^(2) = (5a)^(2) , or 9a^(2) + BC^(2) = 25a^(2). Subtracting 9a2 from
both sides of this equation yields BC^(2) = 16a^(2) , or BC = 4a. It follows that the ratio of the length of --AB to the length of --BC is 3 to 4. Let x
represent the length, in millimeters, of --AB. It's given that the length of --BC is 136 millimeters. Since the ratio of the length of --AB to the length
of --BC is 3 to 4, x/136 = 3/4 . Multiplying both sides of this equation by 136 yields x = (3(136))/4 , or x = 102. Therefore, the length of--AB is 102
millimeters.
Choice A is incorrect. This is the scale factor by which the 3 to 4 to 5 ratio is multiplied that results in the side lengths of △ABC.
Choice C is incorrect. This is the length of --BC, not the length of --AB.
Choice D is incorrect. This is the length of --AC, not the length of --AB.$qb$);
select seed_pool_question($qb$CB-ebbf23ae$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle in the xy-plane has a diameter with endpoints (2, 4) and (2, 14). An equation of this circle is (x - 2)^(2) + (y - 9)^(2) = r^(2), where r is a
positive constant. What is the value of r?$qb$, null, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. The standard form of an equation of a circle in the xy-plane is (x - h)^(2) + (y - k)^(2) = r^(2) , where hk, , and r are
constants, the coordinates of the center of the circle are (h, k), and the length of the radius of the circle is r. It′s given that an equation of the
circle is . Therefore, the center of this circle is (2, 9) . It’s given that the endpoints of a diameter of the circle are
(^(x)(-2,21)4^(2))+ (y - 9)^(2) =^(r2)
(2, 4) and . The length of the radius is the distance from the center of the circle to an endpoint of a diameter of the circle, which can be
found using the distance formula, . Substituting the center of the circle (2, 9) and one endpoint of the diameter
√(x1 5√-(-x2)2 + (y1 - y2)2)/((2 - 2)^(2) + (9 - 4)^(2))
(2, 4) in this formula gives a distance of , or √-0^(2) + 5^(2), which is equivalent to 5. Since the distance from the center of
the circle to an endpoint of a diameter is , the value of r is 5.$qb$);
select seed_pool_question($qb$CB-d7a8aa9c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Each side of equilateral triangle S is multiplied by a scale factor of k to create equilateral triangle T. The length of each side of triangle T is
greater than the length of each side of triangle S. Which of the following could be the value of ??$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d7a8aa9c.png$qb$, $qb$[{"label": "A", "body": "29/28"}, {"label": "B", "body": "1"}, {"label": "C", "body": "28/29"}, {"label": "D", "body": "0"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that each side of equilateral triangle S is multiplied by a scale factor of k to create equilateral triangle T. Since the
length of each side of triangle T is greater than the length of each side of triangle S, the scale factor of k must be greater than 1. Of the given
choices, only 29/28 is greater than 1.
Choice B is incorrect. If each side of equilateral triangle S is multiplied by a scale factor of 1 , the length of each side of triangle T would be equal
to the length of each side of triangle S.
Choice C is incorrect. If each side of equilateral triangle S is multiplied by a scale factor of 28/29 , the length of each side of triangle T would be less
than the length of each side of triangle S.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a2659088$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A right circular cylinder has a height of 8 meterS (m) and a base with a radius of 12m. What is the volume, inm3, of the cylinder?$qb$, null, $qb$[{"label": "A", "body": "8π"}, {"label": "B", "body": "20π"}, {"label": "C", "body": "768π"}, {"label": "D", "body": "1,152π"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The volume, V, of a right circular cylinder is given by V = πr2h, where r is the radius of the circular base and h is the height
of the cylinder. It’s given that the cylinder has a height of 8 meters and a base with a radius of 12 meters. Substituting 12 for r and 8 for h in V
= πr2h yields V = π(12)^(2) (8) , or V = 1,152π. Therefore, the volume, in m3 , of the cylinder is 1,152π.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the volume, in m3, of a cylinder with a radius of 8 meters and a height of 12 meters.$qb$);
select seed_pool_question($qb$CB-32f99025$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The length of the base of a triangle is 8 inches, and the height of the triangle is 12 inches. What is the area, in square inches, of the triangle?$qb$, null, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "48"}, {"label": "C", "body": "60"}, {"label": "D", "body": "96"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The formula for the area, A, of a triangle is A = 1/2bh, where b is the length of the base of the triangle and h is the height of
the triangle. It's given that the length of the base of a triangle is 8 inches and the height of the triangle is 12 inches. Substituting 8 for b and 12
for h in the formula A = 1/2bh yields A = 1/2 (8) (12) , or A = 48. Therefore, the area, in square inches, of the triangle is 48.
Choice A is incorrect. This is the sum of the length of the base of the triangle and the height of the triangle, not the area of the triangle.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the product of the length of the base of the triangle and the height of the triangle, not the area of the triangle.$qb$);
