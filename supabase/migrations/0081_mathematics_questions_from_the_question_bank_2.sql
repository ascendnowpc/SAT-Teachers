-- ============================================================================
--  0081 — College Board's Mathematics questions
--
--  400 questions from College Board's SAT Suite Question Bank, into the
--  Mathematics practice pool. Part 2 of 5.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

select seed_pool_question($qb$CB-6d8ad460$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$- (?II)/(-/--/--/--/--/--/--/--/--/-(?10II00-999 -888 -777 -666 -?55 -444 -333 -222 -1II ?- 1II)/--?÷÷÷÷?÷÷÷10II98765432?004477669922883355II |)|| || || ?|| ||| || || || || || | || | x
Line k is shown in the xy-plane. Line j (not shown) is perpendicular to line k. What is the slope of line j?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6d8ad460.png$qb$, null, null, array[$qb$1.2$qb$, $qb$6/5$qb$]::text[], $qb$The correct answer is 6/5 . It’s given that line j is perpendicular to line k in the xy-plane. This means that the slope of line j is the opposite
reciprocal of the slope of line k. For a line that passes through the points and (x2 , y2 ) in the xy-plane, the slope of the line can be
calculated as (y2-y1)/(x2 -x1) . It's shown that line k passes through the points (-6, 0)(x1, y1) (0(^(,)6)/5-5) and  in the xy-plane. Substituting -6 for x1 , 0 for y1 , 0 for
x2, and -5 for y2 in (y2-y1)/(x2 -x1) yields (-5-0)/(0-(-6)) , or - 5/6 . The opposite reciprocal of - 5/6 is . Therefore, the slope of line j is 6/5 . Note that 6/5 and
1.2 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-34aca984$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The length of a rectangle is 50 inches and the width is x inches. The perimeter is at most 210 inches. Which inequality represents this situation?$qb$, null, $qb$[{"label": "A", "body": "2x + 100 ≤ 210"}, {"label": "B", "body": "2x + 100 ≥ 210"}, {"label": "C", "body": "2x + 50 ≤ 210"}, {"label": "D", "body": "2x + 50 ≥ 210"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The perimeter of a rectangle is equal to the sum of 2 times its length and 2 times its width. It's given that the rectangle's
length is 50 inches and the width is x inches. Therefore, the perimeter, in inches, is 2(50) + 2x, or 100 + 2x, which is equivalent to 2x + 100.
It's given that the perimeter is at most 210 inches; therefore, 2x + 100 ≤ 210 represents this situation.
Choice B is incorrect. This inequality represents a situation where the perimeter is at least, rather than at most, 210 inches.
Choice C is incorrect. This inequality represents a situation where 2 times the length, rather than the length, is 50 inches.
Choice D is incorrect. This inequality represents a situation where 2 times the length, rather than the length, is 50 inches, and the perimeter is at
least, rather than at most, 210 inches.$qb$);
select seed_pool_question($qb$CB-963da34c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A shipping service restricts the dimensions of the boxes it will ship for a certain type of service. The restriction states that for boxes shaped like
rectangular prisms, the sum of the perimeter of the base of the box and the height of the box cannot exceed 130 inches. The perimeter of the
base is determined using the width and length of the box. If a box has a height of 60 inches and its length is 2.5 times the width, which inequality
shows the allowable width x, in inches, of the box?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-963da34c.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. If x is the width, in inches, of the box, then the length of the box is 2.5x inches. It follows that the perimeter of the base is
, or 7x inches. The height of the box is given to be 60 inches. According to the restriction, the sum of the perimeter of the base and
the height of the box should not exceed 130 inches. Algebraically, this can be represented by , or . Dividing both sides
of the inequality by 7 gives . Since x represents the width of the box, x must also be a positive number. Therefore, the inequality
represents all the allowable values of x that satisfy the given conditions.
Choices B, C, and D are incorrect and may result from calculation errors or misreading the given information.$qb$);
select seed_pool_question($qb$CB-184ce5aa$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Line h is defined by 1/5 x + 1/7 y - 70 = 0. Line j is perpendicular to line h in the xy-plane. What is the slope of line j?$qb$, null, $qb$[{"label": "A", "body": "- 7/5"}, {"label": "B", "body": "- 5/7"}, {"label": "C", "body": "7/5"}, {"label": "D", "body": "5/7"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that line h is defined by 1/5 x + 1/7 y - 70 = 0. This equation can be written in slope-intercept form y = mx + b,
where m is the slope of line h and b is the y-coordinate of the y-intercept of line h. Adding 70 to both sides of 1/5 x + 1/7 y - 70 = 0 yields 1/5 x
. Subtracting 1/5 x from both sides of this equation yields . Multiplying both sides of this equation by 7 yields y =
+-7/51/7xy+=47900 1/j7 y = - 1/5 x + 70
. Therefore, the slope of line h is - 7/5 . It’s given that line  is perpendicular to line h in the xy-plane. Two lines are perpendicular if
their slopes are negative reciprocals, meaning that the slope of the first line is equal to -1 divided by the slope of the second line. Therefore, the
slope of line j is the negative reciprocal of the slope of line h. The negative reciprocal of - 7/5 is (-1)/(-7/?) , or 5/7 . Therefore, the slope of line j is 5/7 .
Choice A is incorrect. This is the slope of a line in the xy-plane that is parallel, not perpendicular, to line h.
Choice B is incorrect. This is the reciprocal, not the negative reciprocal, of - 7/5 .
Choice C is incorrect. This is the negative, not the negative reciprocal, of - 7/5 .$qb$);
select seed_pool_question($qb$CB-76f29fa5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The cost to rent a commercial fishing boat from a certain company is $950 for the first 2 hours and an additional $50 per hour for each hour
after the first 2 hours. If the total cost to rent the commercial fishing boat from the company for t hours, where t > 2, is $1,100, which equation
represents this situation?$qb$, null, $qb$[{"label": "A", "body": "950(t - 2) + 50t = 1,100"}, {"label": "B", "body": "950(2t) + 50t = 1,100"}, {"label": "C", "body": "950 + 50(t - 2) = 1,100"}, {"label": "D", "body": "950 + 50(2t) = 1,100"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the cost to rent a commercial fishing boat is $950 for the first 2 hours and an additional $50 per hour for each
hour after the first 2 hours. It’s also given that t represents the total number of hours and t > 2. Therefore, the number of additional hours after
the first 2 hours can be represented with the expression t - 2. The cost for these additional hours is $50 per hour, so the cost for the additional
hours can be represented by the expression 50(t - 2) . The total cost can be calculated by adding the cost for the first 2 hours to the cost for
the additional hours and can be represented by the expression 950 + 50(t - 2). It’s also given that the total cost to rent the commercial fishing
boat from the company for t hours is $1,100. Thus, the equation that represents this situation is 950 + 50(t - 2) = 1,100.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-b2de69bd$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x y
1 5
???? |||| ||||2 7
3 9
4 11
The table above shows some pairs of x values and y values. Which of the following equations could represent the relationship between x and y ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b2de69bd.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Each of the choices is a linear equation in the form y = mx + b, where m and b are constants. In this equation, m represents
the change in y for each increase in x by 1. From the table, it can be determined that the value of y increases by 2 for each increase in x by 1. In
other words, for the pairs of x and y in the given table, m = 2. The value of b can be found by substituting the values of x and y from any row of
the table and substituting the value of m into the equation y = mx + b and then solving for b. For example, using x = 1, y = 5, and m = 2 yields 5 =
2(1) + b. Solving for b yields b = 3. Therefore, the equation y = 2x + 3 could represent the relationship between x and y in the given table.
Alternatively, if an equation represents the relationship between x and y, then when each pair of x and y from the table is substituted into the
equation, the result will be a true statement. Of the equations given, the equation y = 2x + 3 in choice A is the only equation that results in a true
statement when each of the pairs of x and y are substituted into the equation.
Choices B, C, and D are incorrect because when at least one pair of x and y from the table is substituted into the equations given in these
choices, the result is a false statement. For example, when the pair x = 4 and y = 11 is substituted into the equation in choice B, the result is 11 =
3(4) – 2, or 11 = 10, which is false.$qb$);
select seed_pool_question($qb$CB-aacc834b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x = 8
x + 3y = 26
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. The first equation in the given system is x = 8. Substituting 8 for x in the second equation in the given system yields 8
+ 3y = 26. Subtracting 8 from both sides of this equation yields 3y = 18. Dividing both sides of this equation by 3 yields y = 6. Therefore, the
value of y is 6.$qb$);
select seed_pool_question($qb$CB-042aa429$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If f (x) = x + 7 and g (x) = 7x, what is the value of 4f(2) - g(2) ?$qb$, null, $qb$[{"label": "A", "body": "-5"}, {"label": "B", "body": "1"}, {"label": "C", "body": "22"}, {"label": "D", "body": "28"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The value of f(2) can be found by substituting 2 for x in the given equation f(x) = x + 7, which yields , or
f(2) = 9. The value of  can be found by substituting 2 for x in the given equation g(x) = 7x, which yields g(2) = 7(2)f4(2(9g))(=2-)21=+4174, or . The
^(g)4f(2()2) - g(2)
value of the expression can be found by substituting the corresponding values into the expression, which gives . This
expression is equivalent to 36 - 14, or 22.
Choice A is incorrect. This is the value of f(2) -g(2) , not 4f(2) - g(2).
Choice B is incorrect and may result from calculating 4f(2) as 4(2) + 7, rather than
4(2 + 7).
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cd33b015$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If  is the solution to the given system of equations, what is the value of y ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cd33b015.png$qb$, $qb$[{"label": "A", "body": "10"}, {"label": "B", "body": "15"}, {"label": "C", "body": "60"}, {"label": "D", "body": "65"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Substituting 20 for  in the second equation in the system yields , or . Subtracting
40 from both sides of this equation yields . Dividing both sides of this equation by 3 yields .
Choice A is incorrect. If , then  since . However, substituting 10 for both x and y in the second equation yields
, which is a false statement. Choice C is incorrect. If , then  since . However, substituting these values
for x and y in the second equation yields , which is a false statement. Choice D is incorrect. If , then  since
. However, substituting these values for x and y in the second equation yields , which is a false statement.$qb$);
select seed_pool_question($qb$CB-e2e3942f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the system of equations above, a is a constant. If the system of equations has no solution, what is the value of a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e2e3942f.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": "0"}, {"label": "C", "body": "1"}, {"label": "D", "body": "2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A system of two linear equations has no solution when the graphs of the equations have the same slope and different y-
coordinates of the y-intercepts. Each of the given equations is written in the slope-intercept form of a linear equation, , where m is
the slope and b is the y-coordinate of the y-intercept of the graph of the equation. For these two linear equations, the y-coordinates of the y-
intercepts are different:  and . Thus, if the system of equations has no solution, the slopes of the two linear equations must be the same.
The slope of the first linear equation is 2. Therefore, for the system of equations to have no solution, the value of a must be 2.
Choices A, B, and C are incorrect and may result from conceptual and computational errors.$qb$);
select seed_pool_question($qb$CB-f03465dc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$248x^(x)++271yy==927
For each real number r, which of the following points lies on the graph of each equation in the xy-plane for the given system?$qb$, null, $qb$[{"label": "A", "body": "(r, - 8r/7 + 9/7 )"}, {"label": "B", "body": "(- 8r/7 + 9/7 , r)"}, {"label": "C", "body": "(-8r/7 + 9, 8r/7 + 27)"}, {"label": "D", "body": "(r/3 + 9, -r/3 + 27)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Dividing both sides of the second equation in the given system by 3 yields 8x + 7y = 9, which is the first equation in the
given system. Therefore, the first and second equations represent the same line in the xy-plane. If the x- and y-coordinates of a point satisfy an
equation, the point lies on the graph of the equation in the xy-plane. Choice A is a point with x-coordinate r and y-coordinate - 8r/7 + 9/7.
Substituting r for x and - 8r/7 + 9/7 for y in the equation 8x + 7y = 9 yields 8r + 7 (-8/7r + 9/7) = 9. Applying the distributive property to the
left-hand side of this equation yields 8r - 8r + 9 = 9. Combining like terms on the left-hand side of this equation yields 9 = 9, so the
coordinates of the point (r, - 8/7 r + 9/7 ) satisfy both equations in the given system. Therefore, for each real number r, the point
(r, - 8/7 r + 9/7 ) lies on the graph of each equation in the xy-plane for the given system.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f8ff3249$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y < 6x + 2
For which of the following tables are all the values of x and their corresponding values of y solutions to the given inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f8ff3249.png$qb$, $qb$[{"label": "A", "body": "x 5/(|-7 |)||| |||(-y)/20/23/(-44 ?)???"}, {"label": "B", "body": "x 5/(|-7 |)||| |||(-y)/136/(-40 ?)???"}, {"label": "C", "body": "x 5/(|-7 |)||| |||(-y)/16/28/(-40 ?)???"}, {"label": "D", "body": "x 5/(|-7 |)||| |||(-y)/436/(-48 ?)???"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. All the tables in the choices have the same three values of x, so each of the three values of x can be substituted in the given
inequality to compare the corresponding values of y in each of the tables. Substituting 3 for x in the given inequality yields y < 6(3) + 2, or y
< 20. Therefore, when x = 3, the corresponding value of y is less than 20. Substituting 5 for x in the given inequality yields , or y
yy << 66((57)) ++ 22
< 32. Therefore, when x = 5, the corresponding value of y is less than 32. Substituting 7 for x in the given inequality yields , or y
< 44. Therefore, when x = 7, the corresponding value of y is less than 44. For the table in choice C, when x = 3, the corresponding value of y
is 16, which is less than 20; when x = 5, the corresponding value of y is 28, which is less than 32; when x = 7, the corresponding value of y is
40, which is less than 44. Therefore, the table in choice C gives values of x and their corresponding values of y that are all solutions to the given
inequality.
Choice A is incorrect. In the table for choice A, when x = 3, the corresponding value of y is 20, which is not less than 20; when x = 5, the
corresponding value of y is 32, which is not less than 32; when x = 7, the corresponding value of y is 44, which is not less than 44.
Choice B is incorrect. In the table for choice B, when x = 5, the corresponding value of y is 36, which is not less than 32.
Choice D is incorrect. In the table for choice D, when x = 3, the corresponding value of y is 24, which is not less than 20; when x = 5, the
corresponding value of y is 36, which is not less than 32; when x = 7, the corresponding value of y is 48, which is not less than 44.$qb$);
select seed_pool_question($qb$CB-5ab9903f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The cost to rent a bus from Company X is $950 for the first 3 hours and an additional $50 per hour for each hour after the first 3 hours. If the
total cost to rent the bus from Company X for t hours, where t > 3, is $1,150, which equation represents this situation?$qb$, null, $qb$[{"label": "A", "body": "950(t - 3) + 50t = 1,150"}, {"label": "B", "body": "950(3t) + 50t = 1,150"}, {"label": "C", "body": "950 + 50(t - 3) = 1,150"}, {"label": "D", "body": "950 + 50(3t) = 1,150"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the cost to rent a bus is $950 for the first 3 hours and an additional $50 per hour for each hour after the first 3
hours. It’s also given that t represents the total number of hours and t > 3. Therefore, the number of additional hours after the first 3 hours can
be represented by the expression t - 3. The cost for these additional hours is $50 per hour, so the cost for the additional hours can be
represented by the expression 50(t - 3) . The total cost can be calculated by adding the cost for the first 3 hours to the cost for the additional
hours and can be represented by the expression 950 + 50(t - 3) . It’s also given that the total cost to rent the bus from the company for t hours
is $1,150. Thus, the equation that represents this situation is 950 + 50(t - 3) = 1,150.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-a35c7164$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$5x + 7y = 1
ax + by = 1
In the given pair of equations, a and b are constants. The graph of this pair of equations in the xy-plane is a pair of perpendicular lines. Which of
the following pairs of equations also represents a pair of perpendicular lines?$qb$, null, $qb$[{"label": "A", "body": "10x + 7y = 1 ax - 2by = 1"}, {"label": "B", "body": "10x + 7y = 1 ax + 2by = 1"}, {"label": "C", "body": "10x + 7y = 1 2ax + by = 1"}, {"label": "D", "body": "5x - 7y = 1 ax + by = 1"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Two lines are perpendicular if their slopes are negative reciprocals, meaning that the slope of the first line is equal to -1
divided by the slope of the second line. Each equation in the given pair of equations can be written in slope-intercept form, y = mx + b, where
m is the slope of the graph of the equation in the xy-plane and (0, b) is the y-intercept. For the first equation, 5x + 7y = 1, subtracting 5x from
both sides gives 7y = -5x + 1, and dividing both sides of this equation by 7 gives y = - 5/7 x + 1/7. Therefore, the slope of the graph of this
equation is . For the second equation, ax + by = 1 , subtracting ax from both sides gives by = -ax + 1, and dividing both sides of this
-b 5/7
equation by  gives y = - a/bx + 1/b . Therefore, the slope of the graph of this equation is - a/b . Since the graph of the given pair of equations is a
pair of perpendicular lines, the slope of the graph of the second equation, - a/b , must be the negative reciprocal of the slope of the graph of the
first equation, - 5/7 . The negative reciprocal of - 5/7 is (-1)/(-?/7) , or 7/5. Therefore, - a/b = 7/5 , or a/b = - 7/5 . Similarly, rewriting the equations in choice
B in slope-intercept form yields y = - 1o/7 x + 1/7 and y = - a/2b x + 1/2b . It follows that the slope of the graph of the first equation in choice B is
- 10/7 and the slope of the graph of the second equation in choice B is - a/2b . Since a/b = - 7/5 , - a/2b is equal to -(1/2)(-7/5) , or 7/10 . Since 7/10 is
the negative reciprocal of - 10/7, the pair of equations in choice B represents a pair of perpendicular lines.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-de6fe450$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$On January 1, 2015, a city’s minimum hourly wage was $9.25. It will increase by $0.50 on the first day of the year for the next 5 years. Which of
the following functions best models the minimum hourly wage, in dollars, x years after January 1, 2015, where  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-de6fe450.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the city’s minimum hourly wage will increase by $0.50 on the first day of the year for the 5 years after January
1, 2015. Therefore, the total increase, in dollars, in the minimum hourly wage x years after January 1, 2015, is represented by . Since the
minimum hourly wage on January 1, 2015, was $9.25, it follows that the minimum hourly wage, in dollars, x years after January 1, 2015, is
represented by . Therefore, the function  best models this situation.
Choices A, B, and D are incorrect. In choice A, the function models a situation where the minimum hourly wage is $9.25 on January 1, 2015, but
decreases by $0.50 on the first day of the year for the next 5 years. The functions in choices B and D both model a situation where the minimum
hourly wage is increasing by $9.25 on the first day of the year for the 5 years after January 1, 2015.$qb$);
select seed_pool_question($qb$CB-d0a2fed5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 6/7p + 18 = 54, what is the value of 7p?$qb$, null, null, null, array[$qb$294$qb$]::text[], $qb$The correct answer is 294. Subtracting 18 from each side of the given equation yields 6/7p = 36. Multiplying each side of this equation by 7/6
yields p = 42. Multiplying each side of this equation by 7 yields 7p = 294. Therefore, the value of 7p is 294.$qb$);
select seed_pool_question($qb$CB-e8fd6d99$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Terry has a goal to collect at least 16 items per week for a donation drive. This week, Terry has collected 4 items. If x represents the additional
number of items Terry needs to collect this week to meet the goal, which inequality represents this situation?$qb$, null, $qb$[{"label": "A", "body": "4 - x ≤ 16"}, {"label": "B", "body": "4 + x ≤ 16"}, {"label": "C", "body": "4 - x ≥ 16"}, {"label": "D", "body": "4 + x ≥ 16"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that this week, Terry has collected 4 items. It follows that the expression 4 + x represents the total number of
items Terry will have collected after collecting x additional items. It’s also given that Terry’s goal is to collect at least 16 items per week.
Therefore, the inequality 4 + x ≥ 16 represents this situation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This inequality represents a situation where the goal is to collect at most, not at least, 16 items per week.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-03503d49$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A business owner plans to purchase the same model of chair for each of the 81 employees. The total budget to spend on these chairs is
$14,000, which includes a 7% sales tax. Which of the following is closest to the maximum possible price per chair, before sales tax, the
business owner could pay based on this budget?$qb$, null, $qb$[{"label": "A", "body": "$148·15"}, {"label": "B", "body": "$161·53"}, {"label": "C", "body": "$172·84"}, {"label": "D", "body": "$184·94"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that a business owner plans to purchase 81 chairs. If p is the price per chair, the total price of purchasing 81 chairs
is 81p. It’s also given that 7% sales tax is included, which is equivalent to 81p multiplied by 1·07, or 81(1·07)p. Since the total budget is
$14,000, the inequality representing the situation is given by 81(1·07)p ≤ 14,000. Dividing both sides of this inequality by 81(1·07) and
rounding the result to two decimal places gives p ≤ 161·53. To not exceed the budget, the maximum possible price per chair is $161·53.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the maximum possible price per chair including sales tax, not the maximum possible price per chair before sales
tax.
Choice D is incorrect. This is the maximum possible price if the sales tax is added to the total budget, not the maximum possible price per chair
before sales tax.$qb$);
select seed_pool_question($qb$CB-4f8bd093$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What value of x is the solution to the equation 16x + 24 = 24x?$qb$, null, $qb$[{"label": "A", "body": "-4"}, {"label": "B", "body": "3/1o"}, {"label": "C", "body": "1/3"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Subtracting 16x from both sides of the given equation yields 24 = 8x. Dividing both sides of this equation by 8 yields 3
= x. Therefore, the solution to the given equation is 3.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4ec95eab$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = -3x
4x + y = 15
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "5"}, {"label": "C", "body": "15"}, {"label": "D", "body": "45"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The given system of linear equations can be solved by the substitution method. Substituting -3x for y from the first
equation in the given system into the second equation yields 4x + (-3x) = 15, or x = 15.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the absolute value of y, not the value of x.$qb$);
select seed_pool_question($qb$CB-63d03c0b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For a particular car, the linear function  gives the predicted power, in brake horsepower (bhP) , for engine speeds between
1 ,000 reV0Iuti0nS Per minute (rPmf )
and 6,000rPm. According to this function, the car's predicted power is 433bhP at an engine speed
of 3,331rPm and 600bhP at an engine speed of 4,500rPm. The equation f(x) = 1/7 (x - a) + 433 defines f, where x is the engine speed,
in rPm, and a is a constant. What is the value of a?$qb$, null, null, null, array[$qb$3331$qb$]::text[], $qb$The correct answer is 3,331 . For engine speeds between 1 ,000 reVoIuti0nS Per minute (rPm) and 6,000rPm, it’s given that the equation
f(x) = 1/7 (x - a) + 433 defines the linear function f and gives the predicted power, in brake horsepower (bhP), at an engine speed of
x rPm, where a is a constant. It’s also given that the car's predicted power is 433bhP at an engine speed of 3,331rPm. Substituting 3,331
for x and 433 for  in the equation yields 433 = 1/7 (3,331 - a) + 433. Subtracting 433 from both sides of this equation yields 0
= 1/7 (3,331 - a)f(x)
. Multiplying both sides of this equation by 7 yields 0 = 3,331 - a. Adding a to both sides of this equation yields a = 3,331.
Thus, the value of a is 3,331 .$qb$);
select seed_pool_question($qb$CB-2d54c272$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$5G + 45R = 380
At a school fair, students can win colored tokens that are worth a different number of points depending on the color. One student won G green
tokens and R red tokens worth a total of 380 points. The given equation represents this situation. How many more points is a red token worth
than a green token?$qb$, null, null, null, array[$qb$40$qb$]::text[], $qb$The correct answer is 40. It's given that 5G + 45R = 380, where G is the number of green tokens and R is the number of red tokens won by
one student and these tokens are worth a total of 380 points. Since the equation represents the situation where the student won points with
green tokens and red tokens for a total of 380 points, each term on the left-hand side of the equation represents the number of points won for
one of the colors. Since the coefficient of G in the given equation is 5, a green token must be worth 5 points. Similarly, since the coefficient of R
in the given equation is 45, a red token must be worth 45 points. Therefore, a red token is worth 45 - 5 points, or 40 points, more than a green
token.$qb$);
select seed_pool_question($qb$CB-fbd5483f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In a set of four consecutive odd integers, where the integers are ordered from least to greatest, the first integer is represented by x. The product
of 12 and the fourth odd integer is at most 26 less than the sum of the first and third odd integers. Which inequality represents this situation?$qb$, null, $qb$[{"label": "A", "body": "12(x + 6) ≤ x + (x + 4) - 26"}, {"label": "B", "body": "12(x + 6) ≥ 26 - (x + (x + 4))"}, {"label": "C", "body": "12(x + 4) ≤ x + (x + 3) - 26"}, {"label": "D", "body": "12(x + 4) ≥ 26 - (x + (x + 3))"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the four odd integers are consecutive, ordered from least to greatest, and that the first odd integer is
represented by x. It follows that the second odd integer is represented by x + 2, the third odd integer is represented by x + 4, and the fourth
odd integer is represented by x + 6. Therefore, the product of 12 and the fourth odd integer is represented by 12(x + 6) , and 26 less than the
sum of the first and third odd integers is represented by x + (x + 4) - 26. Since the product of 12 and the fourth odd integer is at most 26 less
than the sum of the first and third odd integers, it follows that 12(x + 6) ≤ x + (x + 4) - 26.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4f89e4d4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A student council group is selling school posters for a fundraiser. They use the function p(x) = 5x - 220 to determine their profit p(x) , in
dollars, for selling x school posters. In order to earn a profit of $900, how many school posters must they sell?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4f89e4d4.png$qb$, null, null, array[$qb$224$qb$]::text[], $qb$The correct answer is 224. It’s given that a student council group uses the function p(x) = 5x - 220 to determine their profit p(x) , in dollars,
for selling x school posters. Substituting 900 for p(x) in the given function yields 900 = 5x - 220. Adding 220 to each side of this equation
yields 1,120 = 5x. Dividing each side of this equation by 5 yields 224 = x. Therefore, in order to earn a profit of $900, they must sell 224
school posters.$qb$);
select seed_pool_question($qb$CB-4fb8adf7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$4x - 3y = 5
x = 8
What is the solution (x, y) to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(8, 9)"}, {"label": "B", "body": "(8, -24)"}, {"label": "C", "body": "(8, -9)"}, {"label": "D", "body": "(8, 24)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The second equation in the given system is x = 8. Substituting 8 for x in the first equation in the given system yields 4(8)
- 3y = 5, or 32 - 3y = 5. Subtracting 32 from both sides of this equation yields -3y = -27. Dividing both sides of this equation by -3
yields y = 9. Therefore, the solution (x, y) to the given system of equations is (8, 9) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d0cb49e8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Argon is placed inside a container with a constant volume. The graph shows the estimated pressure y, in P0undS Per Square inch (PSi), of
the argon when its temperature is x kelvins.
???Sp
12??50?223333IIII6004466662288??/(?II000020022000020033000044?0000200550000200660000200770000200880000)| || || || || || || || || || || || || || || || || |x
p?SS?ee?
?emPerature (?eIVinS)
What is the estimated pressure of the argon, in PSi, when the temperature is 600 kelvins?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d0cb49e8.png$qb$, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "12"}, {"label": "C", "body": "300"}, {"label": "D", "body": "600"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For the graph shown, the x-axis represents temperature, in kelvins, and the y-axis represents the estimated pressure, in
P0undS Per Square inch (PSi) . The estimated pressure of the argon when the temperature is 600 kelvins can be found by locating the point
on the graph where the value of x is equal to 600. The graph passes through the point (600, 12). This means that when the temperature is 600
kelvins, the estimated pressure is 12 PSi.
Choice A is incorrect. This is the estimated pressure, in PSi, of the argon when the temperature is 300 kelvins, not 600 kelvins.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the temperature, in kelvins, of the argon.$qb$);
select seed_pool_question($qb$CB-cee5b352$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The length, y, of a white whale was 162 centimeterS (cm) when it was born and increased an average of 4·8 cm per month for the first 12
months after it was born. Which equation best represents this situation, where x is the number of months after the whale was born and y is the
length, in cm, of the whale?$qb$, null, $qb$[{"label": "A", "body": "y = 162x"}, {"label": "B", "body": "y = 162x + 162"}, {"label": "C", "body": "y = 4·8x + 4·8"}, {"label": "D", "body": "y = 4·8x + 162"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the length of the whale was 162cm when it was born and that its length increased an average of 4·8 cm per
month for the first 12 months after it was born. Since x represents the number of months after the whale was born, the total increase in the
whale's length, in cm, is 4·8 times x, or 4·8x. The length of the whale y, in cm, can be found by adding the whale's length at birth, 162cm, to the
total increase in length, 4·8x cm. Therefore, the equation that best represents this situation is y = 4·8x + 162.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-c9355dec$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$(???????223355??)/(-/--/--/--/--/--/--/--/--/-(?- -22 ?- 22 II00)/-??? ?-?÷???????10II98???????00??77669922883355?? ? ??? ?66 ??? 10)|||||| || || || | || || || || || || || || || || | x
The shaded region shown represents the solutions to which inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c9355dec.png$qb$, $qb$[{"label": "A", "body": "y ≥ 2/3 x - 6"}, {"label": "B", "body": "y ≥ 2/3 x + 6"}, {"label": "C", "body": "y ≥ 2/3 x - 9"}, {"label": "D", "body": "y ≥ 2/3 x + 9"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The equation for the line representing the boundary of the shaded region can be written in slope-intercept form y = mx + b,
where m is the slope and (0, b) is the y-intercept of the line. For the graph shown, the boundary line passes through the points (0, -6) and
(9, 0) . Given two points on a line, (x1 , y1 ) and (x2 , y2 ), the slope of the line can be calculated using the equation m = (y2-y1)/(x2 -x1) . Substituting the
points  and (9, 0) for (x1 , y1 ) and (x2 , y2 ) , respectively, in this equation yields m = (o-(-6))/(9-0) , which is equivalent to m = 6/9 , or m = 2/3 .
(0, -6) (0, -6)
Since the point  represents the y-intercept, it follows that b = -6. Substituting 2/3 for m and -6 for b in the equation y = mx + b yields
y = 2/3 x - 6 as the equation of the boundary line. Since the shaded region represents all the points on and above this boundary line, it follows
that the shaded region shown represents the solutions to the inequality y ≥ 2/3 x - 6.
Choice B is incorrect. This inequality represents a region whose boundary line has a y-intercept of (0, 6), not (0, -6) .
Choice C is incorrect. This inequality represents a region whose boundary line has a y-intercept of (0, -9) , not (0, -6).
Choice D is incorrect. This inequality represents a region whose boundary line has a y-intercept of (0, 9) , not (0, -6).$qb$);
select seed_pool_question($qb$CB-58477a6c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$2x + 9y = 7
The given equation is one equation in a system of two linear equations. If the system of equations has at least one solution, which of the
following equations could be the other equation in the system?
I. 3x + 13·5y = 10·5
II. 3x - 13·5y = 10·5$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A system of two linear equations in two variables has at least one solution if the equations represent the same line or lines
that intersect at exactly one point. Statement I gives the equation 3x + 13·5y = 10·5. Multiplying both sides of the given equation, 2x + 9y
= 7, by 3/2 yields 3x + 13·5y = 10·5, so the equation in statement I is equivalent to the given equation. Therefore, the system formed by these
two equations represents the same line and has infinitely many solutions. Statement II gives the equation 3x - 13·5y = 10·5. Adding the right-
and left-hand sides of 3x + 13·5y = 10·5 and 3x - 13·5y = 10·5 yields 3x + 13·5y + 3x - 13·5y = 10·5 + 10·5, or 6x = 21. Dividing
both sides of this equation by 6 yields x = 21/6 . Therefore, the lines represented by these equations intersect at exactly one point, where x = 21/6 ,
and the system formed by the given equation and the equation in statement II has one solution. It follows that both the equation in statement I
and the equation in statement II could be the other equation in a system of equations with at least one solution.
Choice A is incorrect. Both the equation in statement I and the equation in statement II could be the other equation in this system of equations
with at least one solution.
Choice B is incorrect. Both the equation in statement I and the equation in statement II could be the other equation in this system of equations
with at least one solution.
Choice D is incorrect. Both the equation in statement I and the equation in statement II could be the other equation in this system of equations
with at least one solution.$qb$);
select seed_pool_question($qb$CB-1e0a46e4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which system of linear equations has no solution?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1e0a46e4.png$qb$, $qb$[{"label": "A", "body": "-2x + 3y = -9 2x - 3y = 9"}, {"label": "B", "body": "2x - 3y = 9 3x + 4y = 10"}, {"label": "C", "body": "2x - 3y = 9 -6x + 9y = -27"}, {"label": "D", "body": "-2x + 3y = 9 4x - 6y = 18"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A system of linear equations can be solved by the elimination method. Multiplying the equation -2x + 3y = 9 by 2 yields
-4x + 6y = 18. Adding this equation to the equation 4x - 6y = 18 yields 0 = 36, which has no solution. It follows that the system of linear
equations consisting of -2x + 3y = 9 and 4x - 6y = 18 has no solution.
Choice A is incorrect. This system of linear equations has infinitely many solutions, rather than no solution.
Choice B is incorrect. This system of linear equations has one solution, rather than no solution.
Choice C is incorrect. This system of linear equations has infinitely
many solutions, rather than no solution.$qb$);
select seed_pool_question($qb$CB-1e11190a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Store A sells raspberries for $5·50 per pint and blackberries for $3·00 per pint. Store B sells raspberries for $6·50 per pint and blackberries for
$8·00 per pint. A certain purchase of raspberries and blackberries would cost $37·00 at Store A or $66·00 at Store B. How many pints of
blackberries are in this purchase?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "5"}, {"label": "C", "body": "8"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice C is correct. It’s given that store A sells raspberries for $5·50 per pint and blackberries for $3·00 per pint, and a certain purchase of
raspberries and blackberries at store A would cost $37·00. It’s also given that store B sells raspberries for $6·50 per pint and blackberries for
$8·00 per pint, and this purchase of raspberries and blackberries at store B would cost $66·00. Let r represent the number of pints of
raspberries and b represent the number of pints of blackberries in this purchase. The equation 5·50r + 3·00b = 37·00 represents this purchase
of raspberries and blackberries from store A and the equation 6·50r + 8·00b = 66·00 represents this purchase of raspberries and blackberries
from store B. Solving the system of equations by elimination gives the value of r and the value of b that make the system of equations true.
Multiplying both sides of the equation for store A by 6·5 yields (5·50r)(6·5) + (3·00b)(6·5) = (37·00)(6·5), or 35·75r + 19·5b = 240·5.
Multiplying both sides of the equation for store B by 5·5 yields (6·50r)(5·5) + (8·00b)(5·5) = (66·00)(5·5) , or 35·75r + 44b = 363.
Subtracting both sides of the equation for store A, 35·75r + 19·5b = 240·5, from the corresponding sides of the equation for store B, 35·75r
+ 44b = 363, yields (35·75r - 35·75r) + (44b - 19·5b) = (363 - 240·5) , or 24·5b = 122·5. Dividing both sides of this equationby 24·5
yields b = 5. Thus, 5 pints of blackberries are in
this purchase.
Choices A and B are incorrect and may result from conceptual or calculation errors. Choice D is incorrect. This is the number of pints of
raspberries, not blackberries, in the purchase.$qb$);
select seed_pool_question($qb$CB-c39dbbdf$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Line r is defined by the equation 4x - 9y = 3. Line s is parallel to line r in the xy-plane. What is the slope of line s?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c39dbbdf.png$qb$, $qb$[{"label": "A", "body": "9/4"}, {"label": "B", "body": "4/9"}, {"label": "C", "body": "-4"}, {"label": "D", "body": "-9"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that line s is parallel to line r in the xy-plane. This means that the slope of line r is equal to the slope of line s. Line r
is defined by the equation 4x - 9y = 3. This equation can be written in slope-intercept form y = mx + b, where m represents the slope of the
line and b represents the y-coordinate of the y-intercept of the line. Subtracting 4x from both sides of the equation 4x - 9y = 3 yields -9y =
-4x + 3. Dividing both sides of this equation by -9 yields y = 4/9 x - 1/3 . Therefore, the slope of line r is 4/9. Since parallel lines have equal
slopes, the slope of line s is also 4/9 .
Choice A is incorrect. This is the reciprocal of the slope of line s, not the slope of line s.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5518885d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The equation x + y = 1,440 represents the number of minutes of daylight (between sunrise and sunset), x, and the number of minutes of non-
daylight, y, on a particular day in Oak Park, Illinois. If this day has 670 minutes of daylight, how many minutes of non-daylight does it have?$qb$, null, $qb$[{"label": "A", "body": "670"}, {"label": "B", "body": "770"}, {"label": "C", "body": "1,373"}, {"label": "D", "body": "1,440"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the equation x + y = 1,440 represents the number of minutes of daylight, x, and the number of minutes of
non-daylight, y, on a particular day in Oak Park, Illinois. It’s also given that this day has 670 minutes of daylight. Substituting 670 for x in the
equation x + y = 1,440 yields 670 + y = 1,440. Subtracting 670 from both sides of this equation yields y = 770. Therefore, this day has 770
minutes of non-daylight.
Choice A is incorrect. This is the number of minutes of daylight, not non-daylight, on this day.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the total number of minutes of daylight and non-daylight.$qb$);
select seed_pool_question($qb$CB-78391fcc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
-/(|-|)| |-/(-|)|-/(-?)?-/(-|)|-/(-|)|
f(x) 21 18 15 12
The table above shows some values of x and their corresponding values  for the linear function f. What is the x-intercept of the graph of
in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-78391fcc.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The equation of a linear function can be written in the form , where , m is the slope of the graph of
, and b is the y-coordinate of the y-intercept of the graph. The value of m can be found using the slope formula, .
According to the table, the points  and  lie on the graph of . Using these two points in the slope formula yields
, or . Substituting  for m in the slope-intercept form of the equation yields . The value of b can be
found by substituting values from the table and solving; for example, substituting the coordinates of the point  into the equation
gives , which yields . This means the function given by the table can be represented by the
equation . The value of the x-intercept of the graph of  can be determined by finding the value of x when .
Substituting  into  yields , or . This corresponds to the point .
Choice A is incorrect and may result from substituting the value of the slope for the x-coordinate of the x-intercept. Choice C is incorrect and may
result from a calculation error. Choice D is incorrect and may result from substituting the y-coordinate of the y-intercept for the x-coordinate of
the x-intercept.$qb$);
select seed_pool_question($qb$CB-9ff10b3b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If , what is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9ff10b3b.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "3"}, {"label": "D", "body": "6"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. To make it easier to add like terms on the left-hand side of the given equation, both sides of the equation can be multiplied
by 6, which is the lowest common denominator of  and . This yields , which can be rewritten as . Dividing both sides
of this equation by 2 yields .
Choice A is incorrect and may result from subtracting the denominators instead of numerators with common denominators to get , rather
than , on the left-hand side of the equation. Choice B is incorrect and may result from rewriting the given equation as  instead of
. Choice D is incorrect and may result from conceptual or computational errors.$qb$);
select seed_pool_question($qb$CB-ca452900$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the slope of the graph of y = 5x/13 - 23 in the xy-plane?$qb$, null, null, null, array[$qb$.3846$qb$, $qb$5/13$qb$]::text[], $qb$The correct answer is 5/13 . The graph of a line in the xy-plane can be represented by the equation y = mx + b, where m is the slope of the line
and b is the y-coordinate of the y-intercept. The given equation can be written as y = (5/13)x - 23. Therefore, the slope of the graph of this
equation in the xy-plane is 5/13. Note that 5/13, .3846, 0.385, and 0.384 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-e77a76ce$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following systems of linear equations has no solution?$qb$, null, $qb$[{"label": "A", "body": "y = 6x + 3 y = 6x + 9"}, {"label": "B", "body": "y = 10 y = 10x + 10"}, {"label": "C", "body": "y = 14x + 14 y = 10x + 14"}, {"label": "D", "body": "x = 3 y = 10"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A system of two linear equations in two variables, x and y, has no solution if the graphs of the lines represented by the
equations in the xy-plane are distinct and parallel. The graphs of two lines in the xy-plane represented by equations in slope-intercept form, y
= mx + b, where m and b are constants, are parallel if their slopes, m, are the same and are distinct if their y-coordinates of the y-intercepts, b,
are different. In the equations y = 6x + 3 and y = 6x + 9, the values of m are each 6, and the values of b are 3 and 9, respectively. Since the
slopes of these lines are the same and the y-coordinates of the y-intercepts are different, it follows that the system of linear equations in choice
A has no solution.
Choice B is incorrect. The two lines represented by these equations are a horizontal line and a line with a slope of 10 that have the same y-
coordinate of the y-intercept. Therefore, this system has a solution, (0, 10), rather than no solution.
Choice C is incorrect. The two lines represented by these equations have different slopes and the same y-coordinate of the y-intercept. Therefore,
this system has a solution, (0, 14) , rather than no solution.
Choice D is incorrect. The two lines represented by these equations are a vertical line and a horizontal line. Therefore, this system has a solution,
(3, 10) , rather than no solution.$qb$);
select seed_pool_question($qb$CB-b2fe7ab6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-/13/(?-4 |)???? ||||(-g(x))/45/518/(-45 |)||||
For the linear function g, the table shows four values of x and their corresponding values of g(x) . The function can be written as g(x) = mx
+ b, where m and b are constants. What is the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b2fe7ab6.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "27"}, {"label": "C", "body": "54"}, {"label": "D", "body": "57"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that for the linear function g, the table shows four values of x and their corresponding values of g(x) . It's also given
that the function can be written as g(x) = mx + b, where m and b are constants. The table shows that when the value of x is 1, the
corresponding value of g(x) is 54. Substituting 1 for x and 54 for g(x) in g(x) = mx + b yields 54 = m(1) + b or, 54 = m + b. Subtracting
b from both sides of this equation yields 54 - b = m. The table also shows that when the value of x is 2, the corresponding value of g(x) is
51. Substituting 2 for x and 51 for g(x) in g(x) = mx + b yields 51 = m(2) + b, or 51 = 2m + b. Substituting 54 - b for m in this equation
yields 51 = 2(54 - b) + b. Applying the distributive property to the right-hand side of this equation yields 51 = 108 - 2b + b, or 51 = 108
- b. Subtracting 108 from both sides of this equation yields -57 = -b. Dividing both sides of this equation by -1 yields 57 = b.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-aad7e1b9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 1/10 x - 2. What is the y-intercept of the graph of y = f(x) in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-aad7e1b9.png$qb$, $qb$[{"label": "A", "body": "(-2, 0)"}, {"label": "B", "body": "(0, -2)"}, {"label": "C", "body": "(0, 1/10 )"}, {"label": "D", "body": "( 1/10 , 0)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The y-intercept of the graph of a function in the xy-plane is the point on the graph where x = 0. It′s given that f(x) = 1/1o x
- 2. Substituting 0 for x in this equation yields , or . Since it′s given that y= f(x) , it follows that y = -2 when
fy(0=) =f( 1/(x1)0) (0) - 2 f(0) (=0,--22)
x = 0. Therefore, the y-intercept of the graph of in the xy-plane is .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1bc11c4e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$g(m) = -0·05m + 12·1
The given function g models the number of gallons of gasoline that remains from a full gas tank in a car after driving m miles. According to the
model, about how many gallons of gasoline are used to drive each mile?$qb$, null, $qb$[{"label": "A", "body": "0·05"}, {"label": "B", "body": "12·1"}, {"label": "C", "body": "20"}, {"label": "D", "body": "242·0"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the function g models the number of gallons that remain from a full gas tank in a car after driving m miles. In
the given function g(m) = -0·05m + 12·1 , the coefficient of m is -0·05. This means that for every increase in the value of m by 1, the value
of g(m) decreases by 0·05. It follows that for each mile driven, there is a decrease of 0·05 gallons of gasoline. Therefore, 0·05 gallons of
gasoline are used to drive each mile.
Choice B is incorrect and represents the number of gallons of gasoline in a full gas tank.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-68c5c81a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$11x + 14y ≤ 115
Anthony will spend at most $115 to purchase x small cheese pizzas and y large cheese pizzas for a team dinner. The given inequality represents
this situation. Which of the following is the best interpretation of 14y in this context?$qb$, null, $qb$[{"label": "A", "body": "The amount, in dollars, Anthony will spend on each large cheese pizza"}, {"label": "B", "body": "The amount, in dollars, Anthony will spend on each small cheese pizza"}, {"label": "C", "body": "The total amount, in dollars, Anthony will spend on large cheese pizzas"}, {"label": "D", "body": "The total amount, in dollars, Anthony will spend on small cheese pizzas"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that Anthony will spend at most $115 to purchase x small cheese pizzas and y large cheese pizzas. In the
inequality 11x + 14y ≤ 115y,  represents the number of large cheese pizzas that Anthony will purchase. This means the coefficient 14
represents the amount, in dollars, Anthony will spend on each large cheese pizza. Therefore, the best interpretation of 14y in this context is the
total amount, in dollars, Anthony will spend on large cheese pizzas.
Choice A is incorrect. This is the best interpretation of 14, not 14y.
Choice B is incorrect. This is the best interpretation of 11, not 14y.
Choice D is incorrect. This is the best interpretation of 11x, not 14y.$qb$);
select seed_pool_question($qb$CB-b3c7ca1d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following systems of linear equations has no solution?$qb$, null, $qb$[{"label": "A", "body": "x = 3 y = 5"}, {"label": "B", "body": "y = 6x + 6 y = 5x + 6"}, {"label": "C", "body": "y = 16x + 3 y = 16x + 19"}, {"label": "D", "body": "y = 5 y = 5x + 5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A system of two linear equations in two variables, x and y, has no solution if the graphs of the lines represented by the
equations in the xy-plane are distinct and parallel. The graphs of two lines in the xy-plane represented by equations in slope-intercept form, y
= mx + b, where m and b are constants, are parallel if their slopes, m, are the same and are distinct if their y-coordinates of the y-intercepts, b,
are different. In the equations y = 16x + 3 and y = 16x + 19, the values of m are each 16, and the values of b are 3 and 19, respectively.
Since the slopes of these lines are the same, and the y-coordinates of the y-intercepts are different, it follows that the system of linear equations
in choice C has no solution.
Choice A is incorrect. The lines represented by the equations in this system are a vertical line and a horizontal line. Therefore, this system has a
solution, (3, 5) , rather than no solution.
Choice B is incorrect. The two lines represented by these equations have different slopes and the same y-coordinate of the y-intercept. Therefore,
this system has a solution, (0, 6) , rather than no solution.
Choice D is incorrect. The two lines represented by these equations are a horizontal line and a line with a slope of 5 that have the same y-
coordinate of the y-intercept. Therefore, this system has a solution, (0, 5), rather than no solution.$qb$);
select seed_pool_question($qb$CB-deee9063$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Line k is defined by y = 6x + 4. Line j is parallel to line k in the xy-plane and passes through the point (0, 5) . Which equation defines line j?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-deee9063.png$qb$, $qb$[{"label": "A", "body": "y = 6x + 5"}, {"label": "B", "body": "y = -5x + 5"}, {"label": "C", "body": "y = -6x + 5"}, {"label": "D", "body": "y = 5x + 5"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. An equation that defines a line in the xy-plane can be written as y = mx + b, where m is the slope of the line and (0, b) is
its y-intercept. It’s given that line k is defined by the equation y = 6x + 4; therefore, the slope of line k is 6. Since line j is parallel to line k in the
xy-plane and parallel lines have equal slopes, it follows that the slope of line j is 6. It’s also given that line j passes through the point (0, 5),
which is its y-intercept. Substituting 6 for m and 5 for b in the equation y = mx + b yields y = 6x + 5. Therefore, the equation y = 6x + 5
defines line j.
Choice B is incorrect. This equation defines a line that has a slope of -5, not 6.
Choice C is incorrect. This equation defines a line that has a slope of -6, not 6.
Choice D is incorrect. This equation defines a line that has a slope of 5, not 6.$qb$);
select seed_pool_question($qb$CB-2d0e13a6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Line k is defined by y = 1/4 x + 1. Line j is parallel to line k in the xy-plane. What is the slope of j?$qb$, null, null, null, array[$qb$.25$qb$, $qb$1/4$qb$]::text[], $qb$The correct answer is 1/4 . It's given that line k is defined by y = 1/4 x + 1 . It's also given that line j is parallel to line k in the xy-plane. A line in the
xy-plane represented by an equation in slope-intercept form y = mx + b has a slope of m and a y-intercept of (0, b) . Therefore, the slope of line
k is 1/4. Since parallel lines have equal slopes, the slope of line j is 1/4 . Note that 1/4 and .25 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-59afe8db$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$3x + 5(x + 4) = 76
What value of x is the solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "8"}, {"label": "C", "body": "56"}, {"label": "D", "body": "72"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Applying the distributive property on the left-hand side of the given equation yields 3x + 5x + 20 = 76, or 8x + 20 = 76.
Subtracting 20 from each side of this equation yields 8x = 56. Dividing each side of this equation by 8 yields x = 7.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the solution to the equation x + 4 = 76, not 3x + 5(x + 4) = 76.$qb$);
select seed_pool_question($qb$CB-b8e73b5b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Ken is working this summer as part of a crew on a farm. He earned $8 per hour for the first 10 hours he worked this week. Because of his
performance, his crew leader raised his salary to $10 per hour for the rest of the week. Ken saves 90% of his earnings from each week. What is
the least number of hours he must work the rest of the week to save at least $270 for the week?$qb$, null, $qb$[{"label": "A", "body": "38"}, {"label": "B", "body": "33"}, {"label": "C", "body": "22"}, {"label": "D", "body": "16"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Ken earned $8 per hour for the first 10 hours he worked, so he earned a total of $80 for the first 10 hours he worked. For the
rest of the week, Ken was paid at the rate of $10 per hour. Let x be the number of hours he will work for the rest of the week. The total of Ken’s
earnings, in dollars, for the week will be . He saves 90% of his earnings each week, so this week he will save  dollars.
The inequality  represents the condition that he will save at least $270 for the week. Factoring 10 out of the expression
gives . The product of 10 and 0.9 is 9, so the inequality can be rewritten as . Dividing both sides of this
inequality by 9 yields , so . Therefore, the least number of hours Ken must work the rest of the week to save at least $270 for
the week is 22.
Choices A and B are incorrect because Ken can save $270 by working fewer hours than 38 or 33 for the rest of the week. Choice D is incorrect. If
Ken worked 16 hours for the rest of the week, his total earnings for the week will be , which is less than $270. Since he
saves only 90% of his earnings each week, he would save even less than $240 for the week.$qb$);
select seed_pool_question($qb$CB-4b06557b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?--/-(1II| ?- 1II| 222| 333| 444| ?55| 666| 777| 888| 999|)/--/-÷÷| 21123454422223355IIII | | ?| ?| | | | | | | | x
The graph of a system of linear equations is shown. The solution to the system is (x, y) . What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4b06557b.png$qb$, null, null, array[$qb$4$qb$]::text[], $qb$The correct answer is 4. A solution to a system of equations must satisfy each equation in the system. It follows that if (x, y) is a solution to the
system, the point (x, y) lies on the graph in the xy-plane of each equation in the system. According to the graph, the point (x, y) that lies on the
graph of each equation in the system is (4, 1). Therefore, the solution to the system is (4, 1) . It follows that the value of x is 4.$qb$);
select seed_pool_question($qb$CB-830120b0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following consists of the y-coordinates of all the points that satisfy the system of inequalities above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-830120b0.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting the same number from each side of an inequality gives an equivalent inequality. Hence, subtracting 1 from each
side of the inequality  gives . So the given system of inequalities is equivalent to the system of inequalities  and
, which can be rewritten as . Using the transitive property of inequalities, it follows that .
Choice A is incorrect because there are points with a y-coordinate less than 6 that satisfy the given system of inequalities. For example,
satisfies both inequalities. Choice C is incorrect. This may result from solving the inequality  for x, then replacing x with y. Choice D is
incorrect because this inequality allows y-values that are not the y-coordinate of any point that satisfies both inequalities. For example,  is
contained in the set ; however, if 2 is substituted into the first inequality for y, the result is . This cannot be true because the
second inequality gives .$qb$);
select seed_pool_question($qb$CB-23c5d458$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-/1???? ||||(-g(x))/23/28/24||||
For the linear function g, the table shows four values of x and their corresponding values of g(x) . The function can be written as g(x) = mx
+ b, where m and b are constants. What is the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-23c5d458.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "16"}, {"label": "C", "body": "32"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that for the linear function g, the table shows four values of x and their corresponding values of g(x) . It's also given
that the function can be written as g(x) = mx + b, where m and b are constants. The table shows that when the value of x is 1, the
corresponding value of g(x) is 32. Substituting 1 for x and 32 for g(x) in g(x) = mx + b yields 32 = m(1) + b, or 32 = m + b. Subtracting
b from both sides of this equation yields 32 - b = m. The table also shows that when the value of x is 2, the corresponding value of g(x) is 28.
Substituting 2 for x and 28 for g(x) in g(x) = mx + b yields 28 = m(2) + b, or 28 = 2m + b. Substituting 32 - b for m in this equation
yields 28 = 2(32 - b) + b. Applying the distributive property to the right-hand side of this equation yields 28 = 64 - 2b + b, or 28 = 64 - b.
Subtracting 64 from both sides of this equation yields -36 = -b. Dividing both sides of this equation by -1 yields 36 = b.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e86a06fe$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Kaylani used fabric measuring 5 yards in length to make each suit for a men's choir. The relationship between the number of suits that Kaylani
made, x, and the total length of fabric that she purchased y, in yards, is represented by the equation y - 5x = 6. What is the best interpretation
of 6 in this context?$qb$, null, $qb$[{"label": "A", "body": "Kaylani made 6 suits."}, {"label": "B", "body": "Kaylani purchased a total of 6 yards of fabric."}, {"label": "C", "body": "Kaylani used a total of 6 yards of fabric to make the suits."}, {"label": "D", "body": "Kaylani purchased 6 yards more fabric than she used to make the suits."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the equation y - 5x = 6 represents the relationship between the number of suits that Kaylani made, x, and
the total length of fabric she purchased, y, in yards. Adding 5x to both sides of the given equation yields y = 5x + 6. Since Kaylani made x
suits and used 5 yards of fabric to make each suit, the expression 5x represents the total amount of fabric she used to make the suits. Since y
represents the total length of fabric Kaylani purchased, in yards, it follows from the equation y = 5x + 6 that Kaylani purchased 5x yards of
fabric to make the suits, plus an additional 6 yards of fabric. Therefore, the best interpretation of 6 in this context is that Kaylani purchased 6
yards more fabric than she used to make the suits.
Choice A is incorrect. Kaylani made a total of x suits, not 6 suits.
Choice B is incorrect. Kaylani purchased a total of y yards of fabric, not a total of 6 yards of fabric.
Choice C is incorrect. Kaylani used a total of 5x yards of fabric to make the suits, not a total of 6 yards of fabric.$qb$);
select seed_pool_question($qb$CB-c8e0f511$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a camping trip a group bought x one-liter bottles of water and y three-liter bottles of water, for a total of 240 liters of water. Which equation
represents this situation?$qb$, null, $qb$[{"label": "A", "body": "x + 3y = 240"}, {"label": "B", "body": "x + y = 240"}, {"label": "C", "body": "3x + 3y = 240"}, {"label": "D", "body": "3x + y = 240"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that for a camping trip a group bought x one-liter bottles of water and y three-liter bottles of water. Since the group
bought x one-liter bottles of water, the total number of liters bought from x one-liter bottles of water is represented as 1x, or x. Since the group
bought y three-liter bottles of water, the total number of liters bought from y three-liter bottles of water is represented as 3y. It's given that the
group bought a total of 240 liters; thus, the equation x + 3y = 240 represents this situation.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect. This equation represents a situation where the group bought x three-liter bottles of water and y one-liter bottles of water,
for a total of 240 liters of water.$qb$);
select seed_pool_question($qb$CB-c4ea43ef$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$To earn money for college, Avery works two part-time jobs: A and B. She earns $10 per hour working at job A and $20 per hour working at job B.
In one week, Avery earned a total of s dollars for working at the two part-time jobs. The graph above represents all possible combinations of
numbers of hours Avery could have worked at the two jobs to earn s dollars. What is the value of s ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c4ea43ef.png$qb$, $qb$[{"label": "A", "body": "128"}, {"label": "B", "body": "160"}, {"label": "C", "body": "200"}, {"label": "D", "body": "320"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Avery earns $10 per hour working at job A. Therefore, if she works a hours at job A, she will earn  dollars. Avery earns
$20 per hour working at job B. Therefore, if she works b hours at job B, she will earn  dollars. The graph shown represents all possible
combinations of the number of hours Avery could have worked at the two jobs to earn s dollars. Therefore, if she worked a hours at job A, worked
b hours at job B, and earned s dollars from both jobs, the following equation represents the graph: , where s is a constant.
Identifying any point  from the graph and substituting the values of the coordinates for a and b, respectively, in this equation yield the value
of s. For example, the point , where  and , lies on the graph. Substituting 16 for a and 0 for b in the equation
yields , or . Similarly, the point , where  and , lies on the graph.
Substituting 0 for a and 8 for b in the equation  yields , or .
Choices A, C, and D are incorrect. If the value of s is 128, 200, or 320, then no points  on the graph will satisfy this equation. For example, if
the value of s is 128 (choice A), then the equation  becomes . The point , where  and
, lies on the graph. However, substituting 16 for a and 0 for b in  yields , or ,
which is false. Therefore,  doesn’t satisfy the equation, and so the value of s can’t be 128. Similarly, if  (choice C) or
(choice D), then substituting 16 for a and 0 for b yields  and , respectively, which are both false.$qb$);
select seed_pool_question($qb$CB-fb5e7f59$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-x - wy = -337
2x - wy = 47
In the given system of equations, w is a constant. In the xy-plane, the graphs of these equations intersect at the point (q, 19) , where q is a
constant. What is the value of w?$qb$, null, null, null, array[$qb$11$qb$]::text[], $qb$The correct answer is 11 . It’s given that the graphs of the equations in the given system intersect at the point (q, 19) , where q is a constant.
Therefore, the coordinates of this point must satisfy both equations. Substituting the point (q, 19) into the first equation, -x - wy = -337,
yields -q - w(19) = -337. Adding 19w to both sides of this equation yields -q = -337 + 19w, which is equivalent to q = 337 - 19w.
Substituting the point (q, 19) into the second equation yields 2q - w(19) = 47. Substituting 337 - 19w in place of q in the equation 2q
- w(19) = 47 yields 2(337 - 19w) - 19w = 47. Applying the distributive property to the left-hand side of this equation yields 674 - 38w
- 19w = 47. Combining like terms on the left-hand side of this equation yields 674 - 57w = 47. Subtracting 674 from both sides of this
equation yields -57w = -627. Dividing both sides of this equation by -57 yields w = 11.$qb$);
select seed_pool_question($qb$CB-2869fe95$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a 3-week period in a town in Illinois, the lowest recorded temperature was 31 degrees Fahrenheit (°F) and the highest recorded temperature
was 67^(°)F. Which inequality is true for any recorded temperature t, in ^(?)F, in this town for this 3-week period?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2869fe95.png$qb$, $qb$[{"label": "A", "body": "t ≥ 98"}, {"label": "B", "body": "t ≥ 67"}, {"label": "C", "body": "31 ≤ t ≤ 67"}, {"label": "D", "body": "t ≤ 31"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that for a 3-week period in a town in Illinois, the lowest recorded temperature was 31^(°)F and the highest recorded
temperature was 67^(?)F. It follows that the inequality 31 ≤ t ≤ 67 is true for any recorded temperature t, in ^(°)F, in this town for this 3-week
period.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-4e77195b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 2 + x = 60, what is the value of 16 + 8x?$qb$, null, null, null, array[$qb$480$qb$]::text[], $qb$The correct answer is 480. Multiplying both sides of the given equation by 8 yields 8(2 + x) = 8(60) , or 16 + 8x = 480. Therefore, if 2 + x
= 60, the value of 16 + 8x is 480.$qb$);
select seed_pool_question($qb$CB-113b938e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The equation above represents the speed y, in feet per second, of Sheila’s bicycle x seconds after she applied the brakes at the end of a ride. If
the equation is graphed in the xy-plane, which of the following is the best interpretation of the x-coordinate of the line’s x-intercept in the context
of the problem?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-113b938e.png$qb$, $qb$[{"label": "A", "body": "The speed of Sheila’s bicycle, in feet per second, before Sheila applied the brakes"}, {"label": "B", "body": "The number of feet per second the speed of Sheila’s bicycle decreased each second after Sheila applied the brakes"}, {"label": "C", "body": "The number of seconds it took from the time Sheila began applying the brakes until the bicycle came to a complete stop"}, {"label": "D", "body": "The number of feet Sheila’s bicycle traveled from the time she began applying the brakes until the bicycle came to a complete stop"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that for each point  on the graph of the given equation, the x-coordinate represents the number of seconds
after Sheila applied the brakes, and the y-coordinate represents the speed of Sheila’s bicycle at that moment in time. For the graph of the
equation, the y-coordinate of the x-intercept is 0. Therefore, the x-coordinate of the x-intercept of the graph of the given equation represents the
number of seconds it took from the time Sheila began applying the brakes until the bicycle came to a complete stop.
Choice A is incorrect. The speed of Sheila’s bicycle before she applied the brakes is represented by the y-coordinate of the y-intercept of the
graph of the given equation, not the x-coordinate of the x-intercept. Choice B is incorrect. The number of feet per second the speed of Sheila’s
bicycle decreased each second after Sheila applied the brakes is represented by the slope of the graph of the given equation, not the x-
coordinate of the x-intercept. Choice D is incorrect and may result from misinterpreting x as the distance, in feet, traveled after applying the
brakes, rather than the time, in seconds, after applying the brakes.$qb$);
select seed_pool_question($qb$CB-fe287f7e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$To repair a refrigerator, a technician charges $60 per hour for labor plus $120 for parts. Which function f represents the total amount, in dollars,
the technician will charge for this job if it takes x hours?$qb$, null, $qb$[{"label": "A", "body": "f(x) = x + 120"}, {"label": "B", "body": "f(x) = 60x"}, {"label": "C", "body": "f(x) = 60x + 120"}, {"label": "D", "body": "f(x) = 60x - 120"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the technician charges $60 per hour for labor. Therefore, if the job takes x hours, the technician will charge
( ($6o)/(1 hour) ) (x hourS) , or $60x, for labor. It’s also given that the technician charges $120 for parts. Therefore, f(x) = 60x + 120 represents the
total amount, in dollars, the technician will charge for this job if it takes x hours.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This function represents the total amount, in dollars, the technician charges for labor only, not the total amount charged for
labor and parts.
Choice D is incorrect. This function represents the total amount, in dollars, the technician would charge if the charge for parts were subtracted
from, rather than added to, the charge for labor.$qb$);
select seed_pool_question($qb$CB-029c2dc2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A teacher is creating an assignment worth 70 points. The assignment will consist of questions worth 1 point and questions worth 3 points.
Which equation represents this situation, where x represents the number of 1-point questions and y represents the number of 3-point questions?$qb$, null, $qb$[{"label": "A", "body": "4xy = 70"}, {"label": "B", "body": "4(x + y) = 70"}, {"label": "C", "body": "3x + y = 70"}, {"label": "D", "body": "x + 3y = 70"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since x represents the number of 1-point questions and y represents the number of 3-point questions, the assignment is
worth a total of 1 · x + 3 · y, or x + 3y, points. Since the assignment is worth 70 points, the equation x + 3y = 70 represents this situation.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-2e1a7f66$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Figure A and figure B are both regular polygons. The sum of the perimeter of figure A and the perimeter of figure B is 63 inches. The equation
3x + 6y = 63 represents this situation, where x is the number of sides of figure A and y is the number of sides of figure B. Which statement is
the best interpretation of 6 in this context?$qb$, null, $qb$[{"label": "A", "body": "Each side of figure B has a length of 6 inches."}, {"label": "B", "body": "The number of sides of figure B is 6."}, {"label": "C", "body": "Each side of figure A has a length of 6 inches."}, {"label": "D", "body": "The number of sides of figure A is 6."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that figure A and figure B (not shown) are both regular polygons and the sum of the perimeters of the two figures is
63incheS. It’s also given that x is the number of sides of figure A and y is the number of sides of figure B, and that the equation 3x + 6y
= 63 represents this situation. Thus, 3x and 6y represent the perimeters, in inches, of figure A and figure B, respectively. Since 6y represents
the perimeter, in inches, of figure B and y is the number of sides of figure B, it follows that each side of figure B has a length of 6 incheS.
Choice B is incorrect. The number of sides of figure B is y, not 6.
Choice C is incorrect. Since the perimeter, in inches, of figure A is represented by 3x, each side of figure A has a length of 3 incheS, not
6 incheS.
Choice D is incorrect. The number of sides of figure A is x, not 6.$qb$);
select seed_pool_question($qb$CB-5e422ff9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the solution to the system of equations above, what is the value of y ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5e422ff9.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "9"}, {"label": "D", "body": "15"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Multiplying both sides of  by 5 results in . Multiplying both sides of  by 2 results in
. Subtracting the resulting equations yields , which simplifies to . Dividing both sides
of  by  results in .
Choices A and B are incorrect and may result from incorrectly subtracting the transformed equation. Choice C is incorrect and may result from
finding the value of x instead of the value of y.$qb$);
select seed_pool_question($qb$CB-e744499e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An elementary school teacher is ordering x workbooks and y sets of flash cards for a math class. The teacher must order at least 20 items, but
the total cost of the order must not be over $80. If the workbooks cost $3 each and the flash cards cost $4 per set, which of the following
systems of inequalities models this situation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e744499e.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The total number of workbooks and sets of flash cards ordered is represented by x + y. Since the teacher must order at least
20 items, it must be true that x + y ≥ 20. Each workbook costs $3; therefore, 3x represents the cost, in dollars, of x workbooks. Each set of
flashcards costs $4; therefore, 4y represents the cost, in dollars, of y sets of flashcards. It follows that the total cost for x workbooks and y sets
of flashcards is 3x + 4y. Since the total cost of the order must not be over $80, it must also be true that 3x + 4y ≤ 80. Of the choices given, these
inequalities are shown only in choice A.
Choice B is incorrect. The second inequality says that the total cost must be greater, not less than or equal to $80. Choice C incorrectly limits the
cost by the minimum number of items and the number of items with the maximum cost. Choice D is incorrect. The first inequality incorrectly
says that at most 20 items must be ordered, and the second inequality says that the total cost of the order must be at least, not at most, $80.$qb$);
select seed_pool_question($qb$CB-59352689$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$7/8 y - 5/8 x = 4/7 - 7/8 y
5/4 x + 7/4 = py + 15/4
In the given system of equations, p is a constant. If the system has no solution, what is the value of p?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-59352689.png$qb$, null, null, array[$qb$3.5$qb$, $qb$7/2$qb$]::text[], $qb$The correct answer is 7/2 . A system of two linear equations in two variables, x and y, has no solution if the lines represented by the equations in
the xy-plane are distinct and parallel. Two lines represented by equations in standard form Ax + By = C, where AB, , and C are constants, are
parallel if the coefficients for x and  in one equation are proportional to the corresponding coefficients in the other equation. The first equation
in the given system, , can be written in standard form by adding  to both sides of the equation, which yields 14/8 y - 5/8 x
5/4 x + 7/4-=5/8pxy++14/815/47/y8 y=-4/75/8 x = 4/7y- 7/8 y 5x - 7/184yy = - 32/7
= 4/7 , or . Multiplying each term in this equation by -8 yields . The second equation in the given system,
, can be written in standard form by subtracting 7/4 and py from both sides of the equation, which yields .
5x - 14y = - 32/7 5/4 x - py = 8/4
Multiplying each term in this equation by 4 yields 5x - 4py = 8. The coefficient of x in the first equation, , is equal to the
coefficient of x in the second equation, 5x - 4py = 8. For the lines to be parallel, and for the coefficients for x and y in one equation to be
proportional to the corresponding coefficients in the other equation, the coefficient of y in the second equation must also be equal to the
coefficient of y in the first equation. Therefore, -14 = -4p. Dividing both sides of this equation by -4 yields (-14)/(-4) = p, or p = 7/2 . Therefore, if
the given system of equations has no solution, the value of p is 7/2. Note that 7/2 and 3.5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-5eb4918d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 9x + 4 = 67, what is the value of 90x + 40?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "70"}, {"label": "C", "body": "130"}, {"label": "D", "body": "670"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Multiplying both sides of the given equation by 10 yields 10(9x + 4) = 10(67), or 90x + 40 = 670. Therefore, the value
of 90x + 40 is 670.
Choice A is incorrect. This is the value of x, not 90x + 40.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c5479c1a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A shipment consists of 5-pound boxes and 10-pound boxes with a total weight of 220 pounds. There are 1310-pound boxes in the shipment.
How many 5-pound boxes are in the shipment?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "10"}, {"label": "C", "body": "13"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the shipment consists of 5-pound boxes and 10-pound boxes with a total weight of 220 pounds. Let x
represent the number of 5-pound boxes and y represent the number of 10-pound boxes in the shipment. Therefore, the equation
5x + 10y = 220 represents this situation. It's given that there are 1310-pound boxes in the shipment. Substituting 13 for y in the equation
5x + 10y = 220 yields 5x + 10(13) = 220, or 5x + 130 = 220. Subtracting 130 from both sides of this equation yields 5x = 90. Dividing
both sides of this equation by 5 yields 18. Thus, there are 185-pound boxes in the shipment.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the number of 10-pound boxes in the shipment.$qb$);
select seed_pool_question($qb$CB-14360f84$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$4x - 9y = 9y + 5
hy = 2 + 4x
In the given system of equations, h is a constant. If the system has no solution, what is the value of h?$qb$, null, $qb$[{"label": "A", "body": "-9"}, {"label": "B", "body": "0"}, {"label": "C", "body": "9"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A system of two linear equations in two variables, x and y, has no solution if the lines represented by the equations in the xy-
plane are distinct and parallel. The graphs of two lines in the xy-plane represented by equations in the form Ax + By = C, where AB, , and C
are constants, are parallel if the coefficients for x and y in one equation are proportional to the corresponding coefficients in the other equation.
The first equation in the given system can be written in the form Ax + By = C by subtracting 9y from both sides of the equation to yield 4x
- 18y = 5. The second equation in the given system can be written in the form Ax + By = C by subtracting 4x from both sides of the
equation to yield -4x + hy = 2. The coefficient of x in this second equation, -4, is -1 times the coefficient of x in the first equation, 4. For
the lines to be parallel, the coefficient of y in the second equation, h, must also be -1 times the coefficient of y in the first equation, -18. Thus,
h = -1(-18) , or h = 18. Therefore, if the given system has no solution, the value of h is 18.
Choice A is incorrect. If the value of h is -9, then the given system would have one solution, rather than no solution.
Choice B is incorrect. If the value of h is 0, then the given system would have one solution, rather than no solution.
Choice C is incorrect. If the value of h is 9, then the given system would have one solution, rather than no solution.$qb$);
select seed_pool_question($qb$CB-f01ef454$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A geologist estimates that the volume of a slab of granite is greater than 12·7 cubic feet but less than 15·7 cubic feet. The geologist also
estimates that the slab of granite weighs 165 pounds per cubic foot of volume. Which inequality represents this situation, where x represents
the estimated total weight, in pounds, of the slab of granite?$qb$, null, $qb$[{"label": "A", "body": "165 - 15·7 < x < 165 - 12·7"}, {"label": "B", "body": "165 + 12·7 < x < 165 + 15·7"}, {"label": "C", "body": "165(12·7) < x < 165(15·7)"}, {"label": "D", "body": "165/(15·7) < x < 165/(12·7)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the estimated volume of the slab of granite is greater than 12·7 cubic feet but less than 15·7 cubic feet. It's
also given that the estimated weight per cubic foot of volume of that slab is 165 pounds. The estimated total weight of the slab of granite, in
pounds, can be calculated by multiplying the estimated volume by the estimated weight per cubic foot. Therefore, if the estimated volume of the
slab of granite is 12·7 cubic feet, its estimated total weight is 165(12·7) pounds, and if the estimated volume of the slab of granite is 15·7 cubic
feet, its estimated total weight is 165(15·7) pounds. Since the estimated volume of the slab of granite is greater than 12·7 cubic feet but less
than 15·7 cubic feet, the estimated total weight x, in pounds, must be greater than 165(12·7) pounds and less than 165(15·7) pounds. This
situation can be represented by the inequality 165(12·7) < x < 165(15·7).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6efcc0a3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the linear function hh(0) = 41, and h(1) = 40. Which equation defines h?$qb$, null, $qb$[{"label": "A", "body": "h(x) = -x + 41"}, {"label": "B", "body": "h(x) = -x"}, {"label": "C", "body": "h(x) = -41x"}, {"label": "D", "body": "h(x) = -41"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. An equation defining a linear function can be written in the form h(x) = ax + b, where a and b are constants. It’s given that
h(0) = 41. Substituting 0 for x and 41 for h(x) in the equation h(x) = ax + b yields 41 = a(0) + b, or b = 41. Substituting 41 for b in the
equation h(x) = ax + b yields h(x) = ax + 41. It’s also given that h(1) = 40. Substituting 1 for x and 40 for h(x) in the equation h(x)
= ax + 41 yields 40 = a(1) + 41 , or 40 = a + 41 . Subtracting 41 from the left- and right-hand sides of this equation yields - 1 = a.
Substituting -1 for a in the equation h(x) = ax + 41 yields h(x) = -1x + 41 , or h(x) = -x + 41.
Choice B is incorrect. Substituting 0 for x and 41 for h(x) in this equation yields 41 = -0, which isn't a true statement.
Choice C is incorrect. Substituting 0 for x and 41 for h(x) in this equation yields 41 = -41(0), or 41 = 0, which isn't a true statement.
Choice D is incorrect. Substituting 41 for h(x) in this equation yields 41 = -41 , which isn't a true statement.$qb$);
select seed_pool_question($qb$CB-637022d2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$2·5b + 5r = 80
The given equation describes the relationship between the number of birds, b, and the number of reptiles, r, that can be cared for at a pet care
business on a given day. If the business cares for 16 reptiles on a given day, how many birds can it care for on this day?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "5"}, {"label": "C", "body": "40"}, {"label": "D", "body": "80"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The number of birds can be found by calculating the value of b when r = 16 in the given equation. Substituting 16 for r in
the given equation yields 2·5b + 5(16) = 80, or 2·5b + 80 = 80. Subtracting 80 from both sides of this equation yields 2·5b = 0. Dividing
both sides of this equation by 2·5 yields b = 0. Therefore, if the business cares for 16 reptiles on a given day, it can care for 0 birds on this day.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-776cfa7c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Hana deposited a fixed amount into her bank account each month. The function f(t) = 100 + 25t gives the amount, in dollars, in Hana's bank
account after t monthly deposits. What is the best interpretation of 25 in this context?$qb$, null, $qb$[{"label": "A", "body": "With each monthly deposit, the amount in Hana's bank account increased by $25."}, {"label": "B", "body": "Before Hana made any monthly deposits, the amount in her bank account was $25."}, {"label": "C", "body": "After 1 monthly deposit, the amount in Hana's bank account was $25."}, {"label": "D", "body": "Hana made a total of 25 monthly deposits."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that t represents the number of monthly deposits. In the given function f(t) = 100 + 25t, the coefficient of t is
25. This means that for every increase in the value of t by 1, the value of f(t) increases by 25. It follows that with each monthly deposit, the
amount in Hana's bank account increased by $25.
Choice B is incorrect. Before Hana made any monthly deposits, the amount in her bank account was $100.
Choice C is incorrect. After 1 monthly deposit, the amount in Hana's bank account was $125.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-f6b055dc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$- (10II24?80044662288)/(?10II-/--/--/--/--/-00 -888 -666 -444 --222÷÷÷?10II86420044662288? 222 444 666 888 10II00)||?|| || || ?|| || || || || || | || || || || || || || || || || | x
The graph of a system of two linear equations is shown. What is the solution (x, y) to the system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f6b055dc.png$qb$, $qb$[{"label": "A", "body": "(0, 4)"}, {"label": "B", "body": "(2, 2)"}, {"label": "C", "body": "(4, 0)"}, {"label": "D", "body": "(4, 4)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The solution to this system of linear equations is represented by the point that lies on both lines shown, or the point of
intersection of the two lines. According to the graph, the point of intersection occurs when x = 2 and y = 2, or at the point (2, 2) . Therefore, the
solution (x, y) to the system is (2, 2).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0393ba15$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-49x = -98x
How many solutions does the given equation have?$qb$, null, $qb$[{"label": "A", "body": "Zero"}, {"label": "B", "body": "Exactly one"}, {"label": "C", "body": "Exactly two"}, {"label": "D", "body": "Infinitely many"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Adding 98x to each side of the given equation yields 49x = 0. Dividing each side of this equation by 49 yields x = 0. This
means that 0 is the only solution to the given equation. Therefore, the given equation has exactly one solution.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-74c98c82$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An event planner is planning a party. It costs the event planner a onetime fee of $35 to rent the venue and $10·25 per attendee. The event
planner has a budget of $200. What is the greatest number of attendees possible without exceeding the budget?$qb$, null, null, null, array[$qb$16$qb$]::text[], $qb$The correct answer is 16. The total cost of the party is found by adding the onetime fee of the venue to the cost per attendee times the number
of attendees. Let x be the number of attendees. The expression 35 + 10·25x thus represents the total cost of the party. It's given that the
budget is $200, so this situation can be represented by the inequality 35 + 10·25x ≤ 200. The greatest number of attendees can be found by
solving this inequality for x. Subtracting 35 from both sides of this inequality gives 10·25x ≤ 165. Dividing both sides of this inequality by
10·25 results in approximately x ≤ 16·098. Since the question is stated in terms of attendees, rounding x down to the nearest whole number,
16, gives the greatest number of attendees possible.$qb$);
select seed_pool_question($qb$CB-1efd8202$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = 70x + 8
Which table gives three values of x and their corresponding values of y for the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1efd8202.png$qb$, $qb$[{"label": "A", "body": "x 0/2||| ???8/4(1 8)/(-288 |)|||"}, {"label": "B", "body": "2/(|-4 ?)||| ???70/78|||"}, {"label": "C", "body": "x 2/(|-4 ?)||| ???70/140|||"}, {"label": "D", "body": "x 2/(|-4 ?)||| ???8/132|||"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Each of the given choices gives three values of x: 0, 2, and 4. Substituting 0 for x in the given equation yields y = 70 (0)
+ 8, or y = 8. Therefore, when x = 0, the corresponding value of y for the given equation is 8. Substituting 2 for x in the given equation yields y
= 70 (2) + 8, or y = 148. Therefore, when x = 2, the corresponding value of y for the given equation is 148. Substituting 4 for x in the given
equation yields y = 70 (4) + 8, or y = 288. Therefore, when x = 4, the corresponding value of y for the given equation is 288. Thus, if the
three values of x are 0, 2, and 4, then their corresponding values of y are 8, 148, and 288, respectively, for the given equation.
Choice B is incorrect. This table gives three values of x and their corresponding values of y for the equation y = 4x + 70.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-73b5f330$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 5x + 8. For what value of x does f(x) = 58?$qb$, null, $qb$[{"label": "A", "body": "10"}, {"label": "B", "body": "13"}, {"label": "C", "body": "50"}, {"label": "D", "body": "298"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the function f is defined by f(x) = 5x + 8. Substituting 58 for f(x) in this equation yields 58 = 5x + 8.
Subtracting 8 from both sides of this equation yields 50 = 5x. Dividing both sides of this equation by 5 yields 10 = x. Therefore, the value of x
when f(x) = 58 is 10.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of f(58) , not the value of x when f(x) = 58.$qb$);
select seed_pool_question($qb$CB-d76ab4f5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$4x + 1 = 33
Which equation has the same solution as the given equation?$qb$, null, $qb$[{"label": "A", "body": "4x = 32"}, {"label": "B", "body": "4x = 5"}, {"label": "C", "body": "4x = 1"}, {"label": "D", "body": "4x = -32"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Subtracting 1 from both sides of the given equation, 4x + 1 = 33, yields 4x = 32. Therefore, 4x = 32 has the same
solution as the given equation.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-295a41f0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The graph of y = f (x) - 11 is shown.
-1234564466223355II/(-/--/--/--/--/-(?444 -333 -?22 -1II ?- 111 222 333 444)/-÷÷÷??÷654?21446622??5511)||?|| || || | || || || || | x
Which equation defines the linear function f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-295a41f0.png$qb$, $qb$[{"label": "A", "body": "f (x) = -13x - 11"}, {"label": "B", "body": "f (x) = -2x + 7"}, {"label": "C", "body": "f (x) = -13x + 7"}, {"label": "D", "body": "f (x) = -2x - 11"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The graph of a line in the xy-plane can be represented by the equation y = mx + b, where m is the slope of the line and
is the y-intercept. The slope of a line that passes through the points  and (x2 , y2 ) can be calculated using the formula m
=(0 ,(yb2)-y1)/(x2 -x1) (0, -4()^(x1,) y^(1))
. The line shown passes through the points  and . Substituting (-1, -2) and (0, 4) for (x1 , y1 ) and (x2 , y2 ) ,
m = ((--4-1(,--2)2)/(0-(-1)) )
respectively, in the formula m = (y2-y1)/(x2 -x1) yields , which is equivalent to m = (-2)/1 , or m = -2. Since the line shown passes
through the point (0, -4) , it follows that b = -4. Substituting -2 for m and -4 for b in the equation y = mx + b yields y = -2x - 4. It’s
given that the graph shown is the graph of y = f (x) - 11. Substituting -2x - 4 for y in the equation  yields -2x - 4
y =f (fx()x=) --12x1 + 7
= f (x) - 11 . Adding 11 to both sides of this equation yields -2x + 7 = f (x) . Therefore, the equation  defines the linear
function f.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a71b1bc1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A piece of wire with a length of 32 inches is cut into two parts. One part has a length of x inches, and the other part has a length of y inches. The
value of x is 4 more than 3 times the value of y. What is the value of x?$qb$, null, null, null, array[$qb$25$qb$]::text[], $qb$The correct answer is 25. It’s given that a piece of wire has a length of 32 inches and is cut into two parts. It’s also given that one part has a
length of x inches and the other part has a length of y inches. It follows that the equation x + y = 32 represents this situation. It’s also given
that the value of x is 4 more than 3 times the value of y, or x = 3y + 4. Substituting 3y+ 4 for x in the equation x + y = 32 yields 3y+ 4
+ y = 32. Combining like terms on the left-hand side of this equation yields 4y + 4 = 32. Subtracting 4 from both sides of this equation yields
4y = 28. Dividing both sides of this equation by 4 yields y = 7. Substituting 7 for y in the equation x = 3y + 4 yields x = 3(7) + 4, or x
= 25. Therefore, the value of x is 25.$qb$);
select seed_pool_question($qb$CB-1ce51655$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A bowl contains 20 ounces of water. When the bowl is uncovered, the amount of water in the bowl decreases by 1 ounce every 4 days. If 9
ounces of water remain in this bowl, for how many days has it been uncovered?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "7"}, {"label": "C", "body": "36"}, {"label": "D", "body": "44"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the bowl starts with 20 ounces of water and has 9 ounces of water remaining after a period of time has
passed. The amount of water the bowl has lost during the time period can be found by subtracting the remaining amount of water from the
amount of water the bowl starts with, which yields 20 - 9 ounces, or 11 ounces. This means the bowl loses 11 ounces of water during that
period of time. It’s given that the amount of water decreases by 1 ounce every 4 days. Letting t represent the number of days the bowl has been
uncovered, it follows that 1/4 = 11/t . Multiplying both sides of this equation by 4t yields t = 44. Therefore, the bowl has been uncovered for 44
days.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of t for the equation 1/4 = 9/t, not 1/4 = 11/t .$qb$);
select seed_pool_question($qb$CB-e9ef0e6b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A model estimates that whales from the genus Eschrichtius travel 72 to 77 miles in the ocean each day during their migration. Based on this
model, which inequality represents the estimated total number of miles, x, a whale from the genus Eschrichtius could travel in 16 days of its
migration?$qb$, null, $qb$[{"label": "A", "body": "72 + 16 ≤ x ≤ 77 + 16"}, {"label": "B", "body": "(72)(16) ≤ x ≤ (77)(16)"}, {"label": "C", "body": "72 ≤ 16 + x ≤ 77"}, {"label": "D", "body": "72 ≤ 16x ≤ 77"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the model estimates that whales from the genus Eschrichtius travel 72 to 77 miles in the ocean each day
during their migration. If one of these whales travels 72 miles each day for 16 days, then the whale travels 72(16) miles total. If one of these
whales travels 77 miles each day for 16 days, then the whale travels  miles total. Therefore, the model estimates that in 16 days of its
7727(1(166))
migration, a whale from the genus Eschrichtius could travel at least  and at most 77(16) miles total. Thus, the inequality (72)(16) ≤ x
≤ (77)(16) represents the estimated total number of miles, x, a whale from the genus Eschrichtius could travel in 16 days of its migration.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-c841e8e8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$k + 12 = 336
What is the solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "28"}, {"label": "B", "body": "324"}, {"label": "C", "body": "348"}, {"label": "D", "body": "4,032"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 12 from both sides of the given equation yields k = 324. Therefore, the solution to the given equation is 324.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e103300e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f(x) is defined as 19 more than 4 times a number x. If y = f(x) is graphed in the xy-plane, what is the best interpretation of the
x-intercept?$qb$, null, $qb$[{"label": "A", "body": "When f(x) = 0, the number is - 19/4 ."}, {"label": "B", "body": "When the number is 0, f(x) = 19."}, {"label": "C", "body": "The value of f(x) increases by 1 for each increase of 4 in the value of the number."}, {"label": "D", "body": "For each increase of 1 in the value of the number, f(x) increases by 4."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the function f(x) is defined as 19 more than 4 times a number x. This can be represented by the equation
f(x) = 4x + 19. The x-intercept of the graph of y= f(x) in the xy-plane is the point where the graph intersects the x-axis, or the point on the
graph where the value of f(x) is equal to 0. Substituting 0 for f(x) in the equation f(x) = 4x + 19 yields 0 = 4x + 19. Subtracting 19 from
each side of this equation yields -19 = 4x. Dividing each side of this equation by 4 yields x = - 19/4 . Therefore, when f(x) = 0, the number is
- 19/4 .
Choice B is incorrect. This is the best interpretation of the y-intercept, not the x-intercept, of the graph of the function.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the best interpretation of the slope, not the x-intercept, of the graph of the function.$qb$);
select seed_pool_question($qb$CB-81390d6c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function h is defined by h(x) = x + 200. What is the value of h(50) ?$qb$, null, $qb$[{"label": "A", "body": "200"}, {"label": "B", "body": "250"}, {"label": "C", "body": "10,000"}, {"label": "D", "body": "50,200"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Substituting 50 for x in the given function yields h(50) = 50 + 200, or h(50) = 250. Therefore, the value of h(50) is 250.
Choice A is incorrect. This is the value of h(0) .
Choice C is incorrect. This is the value of h(9,800) .
Choice D is incorrect. This is the value of h(50,000) .$qb$);
select seed_pool_question($qb$CB-ed856e9c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the y-intercept of the graph of y = 34x + 81 in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "(0, 81)"}, {"label": "B", "body": "(0, 34)"}, {"label": "C", "body": "(0, -34)"}, {"label": "D", "body": "(0, -81)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. In the xy-plane, the graph of an equation in the form y = mx + b, where m and b are constants, has a slope of m and a y-
intercept of (0, b) . Therefore, the y-intercept of the graph of y = 34x + 81 is (0, 81) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-97eab129$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Area (square
Water (gallons)
feet)
(?--2,520 |)/3780,/(?-5,040 |)?? ||(--4,536 |)/6804,/(-9,072 |)||
The buildings of a shopping center are designed to allow water to drain from the roof into gutters on the sides of the buildings. The table shows
the relationship between the area x, in square feet, of a roof and the amount of water f(x), in gallons, drained from the roof into the gutters over
a certain period of time. Which equation could define f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-97eab129.png$qb$, $qb$[{"label": "A", "body": "f(x) = 0·6x"}, {"label": "B", "body": "f(x) = 1·8x"}, {"label": "C", "body": "f(x) = 2,268x"}, {"label": "D", "body": "f(x) = 4,536x"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the table represents the relationship between the area x, in square feet, of the roof of a shopping center and
the amount of water f(x), in gallons, drained from the roof into the gutters. Every choice represents this relationship with an equation defining f
in the form f(x) = mx, where m is a constant rate of change. The value of m can be determined by dividing both sides of the equation by x.
Each of three pairs of x and f(x) in the table yield m = 1 ·8, since (4,536)/(2,520) = 1 ·8, (6,804)/(3,780) = 1 ·8, and (9,o72)/(5,o4o) = 1 ·8. Therefore, the equation f(x)
= 1 ·8x could define f.
Choice A is incorrect. For the roof with an area of 2,520 square feet, this equation would yield 0·6(2,520) , or 1,512, gallons, not the 4,536
gallons shown in the table.
Choice C is incorrect. For the roof with an area of 2,520 square feet, this equation would yield 2,268(2,520) , or 5,715,360, gallons, not the
4,536 gallons shown in the table.
Choice D is incorrect. For the roof with an area of 2,520 square feet, this equation would yield 4,536(2,520) , or 11,430,720, gallons, not the
4,536 gallons shown in the table.$qb$);
select seed_pool_question($qb$CB-567ac7ab$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$One of the two equations in a linear system is . The system has no solution. Which of the following could be the other equation
in the system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-567ac7ab.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A system of two linear equations written in standard form has no solution when the equations are distinct and the ratio of
the x-coefficient to the y-coefficient for one equation is equivalent to the ratio of the x-coefficient to the y-coefficient for the other equation. This
ratio for the given equation is 2 to 6, or 1 to 3. Only choice B is an equation that isn’t equivalent to the given equation and whose ratio of the x-
coefficient to the y-coefficient is 1 to 3.
Choice A is incorrect. Multiplying each of the terms in this equation by 2 yields an equation that is equivalent to the given equation. This system
would have infinitely many solutions. Choices C and D are incorrect. The ratio of the x-coefficient to the y-coefficient in  (choice C)
is  to 2, or  to 1. This ratio in  (choice D) is 6 to 2, or 3 to 1. Since neither of these ratios is equivalent to that for the given
equation, these systems would have exactly one solution.$qb$);
select seed_pool_question($qb$CB-9d0396d4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$101214IIII11246800444466222288?-/(-| 222| | 444| | 666| | 888^(?)| | 10II00| | 12II22| | 14II44|)?|?| | | | | | | | | | | | | | |x
The point with coordinates (d, 4) lies on the line shown. What is the value of d?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9d0396d4.png$qb$, $qb$[{"label": "A", "body": "7/2"}, {"label": "B", "body": "26/7"}, {"label": "C", "body": "24/7"}, {"label": "D", "body": "27/8"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given from the graph that the points  and (8, 0) lie on the line. For two points on a line, (x1 , y1 ) and (x2 , y2 ) , the
slope of the line can be calculated using the slope formula m =m(0-=, 77/8()y2-yI)/(x2 -x1) . Substituting (0, 7) for  and (8, 0) for (x2 , y2 ) in this formula,
the slope of the line can be calculated as m = (0-7)/(8-0) , or . It's also given that the point  lies on the line. Substituting (d, 4) for
-7 +- 7/87/8 d==(((dx-,414,)/(8--d4))y1 )
(x1 , y1 ) ,  for (x2 , y2 ) , and - 7/8 for m in the slope formula yields - 7/8 = (0-4)/(8-d), or . Multiplying both sides of this equation by 8
- d yields 7/8d(=8-, (07))/(3^(8)) (8 - d) = -4. Expanding the left-hand side of this equation yields . Adding 7 to both sides of this equation
yields . Multiplying both sides of this equation by 8/7 yields d = 24/7 . Thus, the value of d is 24/7 .
Choice A is incorrect. This is the value of y when x = 4.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4771a64a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If 5 - 7(2 - 4x) = 16 - 8(2 - 4x) , what is the value of 2 - 4x?$qb$, null, null, null, array[$qb$11$qb$]::text[], $qb$The correct answer is 11 . Subtracting 5 from each side of the given equation yields -7(2 - 4x) = 11 - 8(2 - 4x) . Adding 8(2 - 4x) to
each side of this equation yields 2 - 4x = 11. Therefore, the value of 2 - 4x is 11 .$qb$);
select seed_pool_question($qb$CB-5a7ab8e8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$66x = 66x
How many solutions does the given equation have?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If the two sides of a linear equation are equivalent, then the equation is true for any value. If an equation is true for any value,
it has infinitely many solutions. Since the two sides of the given linear equation 66x = 66x are equivalent, the given equation has infinitely many
solutions.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-55447be2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 1/3 x - 14
y = -x + 18
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, null, null, null, array[$qb$24$qb$]::text[], $qb$The correct answer is 24. The given system of equations can be solved by the substitution method. The first equation in the given system of
equations is y = 1/3 x - 14. Substituting 1/3 x - 14 for y in the second equation in the given system yields . Adding 14 to
4/3 x = 3 1/23 x - 14 = -x + 18
both sides of this equation yields 1/3 x = -x + 32. Adding x to both sides of this equation yields . Multiplying both sides of this
equation by 3/4 yields x = 24.$qb$);
select seed_pool_question($qb$CB-40049d49$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$4x + 12 = (a(x+3))/2
In the given equation, a is a constant. If the equation has infinitely many solutions, what is the value of a?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "3"}, {"label": "C", "body": "8"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If an equation has infinitely many solutions, then the two sides of the equation must be equivalent. Multiplying each side of
the given equation by 2 yields . Since 8 is a common factor of both terms on the left-hand side of this equation, the
88(^(x)x++234) == a^(a) ((x^(x) ++ 33))
equation can be rewritten as . The two sides of this equation are equivalent when a = 8. Therefore, if the given equation
has infinitely many solutions, the value of a is 8.
Alternate approach: If the given equation, 4x + 12 = (a(x+3))/2 , has infinitely many solutions, then both sides of this equation are equal for any
value of x. If x = 0, then substituting 0 for x in the given equation yields 4 (0) + 12 = (a(0+3))/2 , or 12 = 3/2 a. Dividing both sides of this equation
by 3/2 yields 8 = a.
Choice A is incorrect. If the value of a is 0, the given equation is equivalent to 4x + 12 = 0, which has one solution, not infinitely many
solutions.
Choice B is incorrect. If the value of a is 3, the given equation is equivalent to 4x + 12 = (3(x+3))/2 , or 4x + 12 = 3/2 x + 9/2 , which has one
solution, not infinitely many solutions.
Choice D is incorrect. If the value of a is 12, the given equation is equivalent to 4x + 12 = (12(x+3))/2 , or 4x + 12 = 6x + 18, which has one
solution, not infinitely many solutions.$qb$);
select seed_pool_question($qb$CB-080e75c2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y
16
14
12
10
Number of
8||||||||||?
participants
(in thousands) 6
4
2
x
O 2 4 6 8 10 12 14 16
Years since 2010
The functions f and g model the number of participants, in thousands, in two different programs x years since 2010. The graphs of y = f(x)
and y = g(x) are shown. Which of the following could represent functions f and g?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-080e75c2.png$qb$, $qb$[{"label": "A", "body": "f (x) = -4/11x + 13 g (x) = 2/11 x + 7"}, {"label": "B", "body": "f (x) = - 4/11 x + 7 g (x) = 2/11x + 13"}, {"label": "C", "body": "f (x) = -2/11x + 13 g (x) = 4/11 x + 7"}, {"label": "D", "body": "f (x) = - 2/11 x + 7 g (x) = 4/11x + 13"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A line in the xy-plane that passes through the points (x1 , y1 ) and (x2 , y2 ) has slope m, where m = (y2-y1)/(x2 -x1) . The equation of
the line can be written in the form y = mx + b, where b is the y-intercept represented by (0, b) . One of the lines shown in the graph passes
through the points  and (11, 11) . Substituting 0 for x1, 7 for y1 , 11 for x2 , and 11 for y2 in the equation m = (y2-y1)/(x2 -x1) yields , or
(0, (74))/11 my== (11-7)/((141-)/11 x0)
m = 4/11 . Substituting  for m and 7 for b in the equation y = mx + b yields . Therefore, an equation of this line is
+ 7. Similarly, the other line shown in the graph passes through the points (0, 13)y = (-2)/114/11(x11+, 171) and . Substituting 0 for x1 , 13 for y1 , 11 for x2, and
11 for y2 in the equation m = (y2-y1)/(x2 -x1) yields m = (11-13)/(11-0) , or m = (-2)/11. Substituting  for m and 13 for b in the equation y = mx + b yields y
. Therefore, an equation of this line is y = (-2)/11 x + 13. So, the functions f and g could be represented by f(x) = (-2)/11x + 13 and
g=( (-2)/(x1)1)=x (+4)/111x3+ 7
.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-935f3403$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a restaurant owner to purchase a pizza oven at a total price of 13,000 dollars, a onetime down payment is required, and then fixed monthly
payments are made for the remaining amount owed for the pizza oven. The equation 13,000 = 2,800 + 200t represents this situation, where t
is the number of fixed monthly payments that are made. Which of the following is the best interpretation of 200 in this context?$qb$, null, $qb$[{"label": "A", "body": "The amount, in dollars, of the down payment"}, {"label": "B", "body": "The amount, in dollars, of each fixed monthly payment"}, {"label": "C", "body": "The total amount, in dollars, paid for the pizza oven after t fixed monthly payments"}, {"label": "D", "body": "The total number of fixed monthly payments"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For a restaurant owner to purchase a pizza oven at a total price of 13,000 dollars, a onetime down payment is required, and
then fixed monthly payments are made for the remaining amount owed for the pizza oven. It’s given that the equation 13,000 = 2,800 + 200t
represents this situation, where t is the number of fixed monthly payments that are made. In this equation, 2,800 is a constant term, which
represents the onetime down payment, in dollars, and 200 is the coefficient of t. Multiplying 200 by t gives the total amount, in dollars, paid by
the fixed monthly payments. Therefore, the best interpretation of 200 in this context is the amount, in dollars, of each fixed monthly payment.
Choice A is incorrect. This is the best interpretation of 2,800, not 200, in this context.
Choice C is incorrect. This is the best interpretation of 13,000, not 200, in this context.
Choice D is incorrect. This is the best interpretation of the variable t, not 200, in this context.$qb$);
select seed_pool_question($qb$CB-2704399f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following systems of equations has the same solution as the system of equations graphed above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2704399f.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The solution to a system of equations is the coordinates of the intersection point of the graphs of the equations in the xy-
plane. Based on the graph, the solution to the given system of equations is best approximated as . In the xy-plane, the graph of  is
a horizontal line on which every y-coordinate is 0, and the graph of  is a vertical line on which every x-coordinate is . These graphs
intersect at the point . Therefore, the system of equations in choice A has the same solution as the given system.
Choices B, C, and D are incorrect. If graphed in the xy-plane, these choices would intersect at the points , , and , respectively,
not .$qb$);
select seed_pool_question($qb$CB-f02b4509$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A moving truck can tow a trailer if the combined weight of the trailer and the boxes it contains is no more than 4,600 pounds. What is the
maximum number of boxes this truck can tow in a trailer with a weight of 500 pounds if each box weighs 120 pounds?$qb$, null, $qb$[{"label": "A", "body": "34"}, {"label": "B", "body": "35"}, {"label": "C", "body": "38"}, {"label": "D", "body": "39"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the truck can tow a trailer if the combined weight of the trailer and the boxes it contains is no more than 4,600
pounds. If the trailer has a weight of 500 pounds and each box weighs 120 pounds, the expression 500 + 120b, where b is the number of boxes,
gives the combined weight of the trailer and the boxes. Since the combined weight must be no more than 4,600 pounds, the possible numbers
of boxes the truck can tow are given by the inequality . Subtracting 500 from both sides of this inequality yields 120b
500 + 120b(2≤o5)/64,600
≤ 4,100. Dividing both sides of this inequality by 120 yields b ≤ , or b is less than or equal to approximately 34·17. Since the number of
boxes, b, must be a whole number, the maximum number of boxes the truck can tow is the greatest whole number less than 34·17, which is 34.
Choice B is incorrect. Towing the trailer and 35 boxes would yield a combined weight of 4,700 pounds, which is greater than 4,600 pounds.
Choice C is incorrect. Towing the trailer and 38 boxes would yield a combined weight of 5,060 pounds, which is greater than 4,600 pounds.
Choice D is incorrect. Towing the trailer and 39 boxes would yield a combined weight of 5,180 pounds, which is greater than 4,600 pounds.$qb$);
select seed_pool_question($qb$CB-daad7c32$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$An object hangs from a spring. The formula  relates the length , in centimeters, of the spring to the weight w, in newtons, of the
object. Which of the following describes the meaning of the 2 in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-daad7c32.png$qb$, $qb$[{"label": "A", "body": "The length, in centimeters, of the spring with no weight attached"}, {"label": "B", "body": "The weight, in newtons, of an object that will stretch the spring 30 centimeters"}, {"label": "C", "body": "The increase in the weight, in newtons, of the object for each one-centimeter increase in the length of the spring"}, {"label": "D", "body": "The increase in the length, in centimeters, of the spring for each one-newton increase in the weight of the object"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The value 2 is multiplied by w, the weight of the object. When the weight is 0, the length is 30 + 2(0) = 30 centimeters. If the
weight increases by w newtons, the length increases by 2w centimeters, or 2 centimeters for each one-newton increase in weight.
Choice A is incorrect because this describes the value 30. Choice B is incorrect because 30 represents the length of the spring before it has been
stretched. Choice C is incorrect because this describes the value w.$qb$);
select seed_pool_question($qb$CB-3f8a701b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation , where a and b are constants, has no solutions. Which of the following must be true?
I.
II.
III.$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3f8a701b.png$qb$, $qb$[{"label": "A", "body": "None"}, {"label": "B", "body": "I only"}, {"label": "C", "body": "I and II only"}, {"label": "D", "body": "I and III only"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. For a linear equation in a form  to have no solutions, the x-terms must have equal coefficients and the
remaining terms must not be equal. Expanding the right-hand side of the given equation yields . Inspecting the x-terms, 9
must equal a, so statement I must be true. Inspecting the remaining terms, 5 can’t equal . Dividing both of these quantities by 9 yields that b
can’t equal . Therefore, statement III must be true. Since b can have any value other than , statement II may or may not be true.
Choice A is incorrect. For the given equation to have no solution, both  and  must be true. Choice B is incorrect because it must
also be true that . Choice C is incorrect because when , there are many values of b that lead to an equation having no solution.
That is, b might be 5, but b isn’t required to be 5.$qb$);
select seed_pool_question($qb$CB-eeebe166$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$- -/-|?| | | | | | | | ÷10II|22468004466222288 | | | | x
What is the y-intercept of the line graphed?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-eeebe166.png$qb$, $qb$[{"label": "A", "body": "(-5, 0)"}, {"label": "B", "body": "(0, 0)"}, {"label": "C", "body": "(0, 5)"}, {"label": "D", "body": "(0, 9)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The y-intercept of a graph is the point where the graph intersects the y-axis. The line graphed intersects the y-axis at the point
(0, 5) . Therefore, the y-intercept of the line graphed is (0, 5).
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-3a84f885$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$(x - 2) - 4(y + 7) = 117
(x - 2) + 4(y + 7) = 442
The solution to the given system of equations is (x, y) . What is the value of 6(x - 2)?$qb$, null, null, null, array[$qb$1677$qb$]::text[], $qb$The correct answer is 1,677. Adding the first equation to the second equation in the given system yields (x - 2) + (x - 2) + (-4)(y + 7)
+ 4(y + 7) = 117 + 442, or 2(x - 2) = 559. Multiplying both sides of this equation by 3 yields 6(x - 2) = 1,677. Therefore, the value of
6(x - 2) is 1,677.$qb$);
select seed_pool_question($qb$CB-b9839f9e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the equation above, F represents the total amount of money, in dollars, a food truck charges for x drinks and y salads. The price, in dollars, of
each drink is the same, and the price, in dollars, of each salad is the same. Which of the following is the best interpretation for the number 7.00 in
this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b9839f9e.png$qb$, $qb$[{"label": "A", "body": "The price, in dollars, of one drink"}, {"label": "B", "body": "The price, in dollars, of one salad"}, {"label": "C", "body": "The number of drinks bought during the day"}, {"label": "D", "body": "The number of salads bought during the day"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that  is equal to the total amount of money, in dollars, a food truck charges for x drinks and y
salads. Since each salad has the same price, it follows that the total charge for y salads is  dollars. When , the value of the
expression  is , or 7.00. Therefore, the price for one salad is 7.00 dollars.
Choice A is incorrect. Since each drink has the same price, it follows that the total charge for x drinks is  dollars. Therefore, the price, in
dollars, for one drink is 2.50, not 7.00. Choices C and D are incorrect. In the given equation, F represents the total charge, in dollars, when x drinks
and y salads are bought at the food truck. No information is provided about the number of drinks or the number of salads that are bought during
the day. Therefore, 7.00 doesn’t represent either of these quantities.$qb$);
select seed_pool_question($qb$CB-023c0a8d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For the function f, if  for all values of x, what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-023c0a8d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "0"}, {"label": "D", "body": "2"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that  for all values of x. If , then  will equal . Dividing both sides of  by
3 gives . Therefore, substituting 2 for x in the given equation yields , which can be rewritten as .
Choice A is incorrect. This is the value of the constant in the given equation for f. Choice C is incorrect and may result from substituting ,
rather than , into the given equation. Choice D is incorrect. This is the value of x that yields  for the left-hand side of the given
equation; it’s not the value of .$qb$);
select seed_pool_question($qb$CB-a94ed4e0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$3y = 4x + 17
-3y = 9x - 23
The solution to the given system of equations is (x, y) . What is the value of 39x?$qb$, null, $qb$[{"label": "A", "body": "-18"}, {"label": "B", "body": "-6"}, {"label": "C", "body": "6"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Adding the second equation to the first equation in the given system of equations yields 3y - 3y = 4x + 9x + 17 - 23, or
0 = 13x - 6. Adding 6 to each side of this equation yields 6 = 13x. Multiplying each side of this equation by 3 yields 18 = 39x. Therefore,
the value of 39x is 18.
Choice A is incorrect. This is the value of -39x, not 39x.
Choice B is incorrect. This is the value of -13x, not 39x.
Choice C is incorrect. This is the value of 13x, not 39x.$qb$);
select seed_pool_question($qb$CB-686b7cad$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A proposal for a new library was included on an election ballot. A radio show stated that 3 times as many people voted in favor of the proposal
as people who voted against it. A social media post reported that 15,000 more people voted in favor of the proposal than voted against it. Based
on these data, how many people voted against the proposal?$qb$, null, $qb$[{"label": "A", "body": "7,500"}, {"label": "B", "body": "15,000"}, {"label": "C", "body": "22,500"}, {"label": "D", "body": "45,000"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a radio show stated that 3 times as many people voted in favor of the proposal as people who voted against it.
Let x represent the number of people who voted against the proposal. It follows that 3x is the number of people who voted in favor of the
proposal and 3x - x, or 2x, is how many more people voted in favor of the proposal than voted against it. It's also given that a social media post
reported that 15,000 more people voted in favor of the proposal than voted against it. Thus, 2x = 15,000. Since 2x = 15,000, the value of x
must be half of 15,000, or 7,500. Therefore, 7,500 people voted against the proposal.
Choice B is incorrect. This is how many more people voted in favor of the proposal than voted against it, not the number of people who voted
against the proposal.
Choice C is incorrect. This is the number of people who voted in favor of the proposal, not the number of people who voted against the proposal.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fbb0ea7f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A rocket contained 467,000 kilograms (kg) of propellant before launch. Exactly 21 seconds after launch, 362,105 kg of this propellant
remained. On average, approximately how much propellant, in kg, did the rocket burn each second after launch?$qb$, null, $qb$[{"label": "A", "body": "4,995"}, {"label": "B", "body": "17,243"}, {"label": "C", "body": "39,481"}, {"label": "D", "body": "104,895"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the rocket contained 467,000kiI0gramS (kg) of propellant before launch and had 362,105kg remaining
exactly 21 seconds after launch. Finding the difference between the amount, in kg, of propellant before launch and the remaining amount, in kg,
of propellant after launch gives the amount, in kg, of propellant burned during the 21 seconds: 467,000 - 362,105 = 104,895. Dividing the
amount of propellant burned by the number of seconds yields (1o4,895)/21 = 4,995. Thus, an average of 4,995kg of propellant burned each second
after launch.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from finding the amount of propellant burned, rather than the amount of propellant burned each second.$qb$);
select seed_pool_question($qb$CB-a5882327$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The linear function g is defined by g(x) = b - 15x, where b is a constant. If g(c + 7) = c/4, where c is a constant, which of the following
expressions represents the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a5882327.png$qb$, $qb$[{"label": "A", "body": "15c/4"}, {"label": "B", "body": "19c/4 + 7"}, {"label": "C", "body": "61c/4 + 105"}, {"label": "D", "body": "15c + 105"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that . Therefore, for the given linear function g, when x = c + 7 g(x) = c/4, . Substituting c + 7 for x
g(c + 7()c)/4==c/(^(4)b) - 15(c + 7)
and  for g(x) in g(x) = b - 15x yields . Applying the distributive property to the right-hand side of this equation yields c/4
= b c/(-4) 15c - 105
. Adding 15c to both sides of this equation yields c/4 + 15c = b - 105. Adding 105 to both sides of this equation yields c/4
+ 15c + 105 = b, or 61c/4 + 105 = b. Therefore, the expression that represents the value of b is 61c/4 + 105.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-75012ee7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$102x^(x)++135yy==735
For each real number r, which of the following points lies on the graph of each equation in the xy-plane for the given system?$qb$, null, $qb$[{"label": "A", "body": "(r/5 + 7, -r/5 + 35)"}, {"label": "B", "body": "(- 3r/2 + 7/2 , r)"}, {"label": "C", "body": "(r, 2r/3 + 7/3 )"}, {"label": "D", "body": "(r, - 3r/2 + 7/2 )"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The two given equations are equivalent because the second equation can be obtained from the first equation by multiplying
each side of the equation by 5. Thus, the graphs of the equations are coincident, so if a point lies on the graph of one of the equations, it also lies
on the graph of the other equation. A point (x, y) lies on the graph of an equation in the xy-plane if and only if this point represents a solution to
the equation. It is sufficient, therefore, to find the point that represents a solution to the first given equation. Substituting the x- and y-coordinates
of choice B, - 3r/2 + 7/2 and r, for x and , respectively, in the first equation yields 2(-3r/2 + 7/2) + 3r = 7, which is equivalent to -3r + 7 + 3r
= 7 7 = 7 (- 3yr/2 + 7/2 , r)
, or . Therefore, the point  represents a solution to the first equation and thus lies on the graph of each equation in the
xy-plane for the given system.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1f0966db$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 9/7 x + 8/7 . For what value of x does f(x) = 5?$qb$, null, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. Substituting 5 for f(x) in the given function yields . Multiplying each side of this equation by 7 yields 7(5)
5 = 9/7 x +28/(7^(7)) = 9x
, or 35 = 9x + 8. Subtracting 8 from each side of this equation yields . Dividing each side of this equation by 9 yields 3
= 7(9/7x + 8/7) f(x) = 5
= x. Therefore,  when the value of x is 3.$qb$);
select seed_pool_question($qb$CB-c387583f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, line k passes through the points (8, 6) and (9, 12) and is defined by the equation y = mx + b. What is the value of b?$qb$, null, null, null, array[$qb$-42$qb$]::text[], $qb$The correct answer is -42. For a linear equation in the form y = mx + bm,  represents the slope and b represents the y-coordinate of the y-
intercept of the graph in the xy-plane. The slope of the graph of a line containing any two points, (x1 , y1 ) and (x2 , y2 ) , can be found using the
slope formula . It’s given that in the xy-plane, line k passes through the points (8, 6) and (9, 12) . Substituting (8, 6) and (9, 12) for
(xm2 ,=y2(y2-y1)/(x) 2 -x1)
(x1 , y1 ) and , respectively, in the slope formula yields m = (12-6)/(9-8) , or m = 6. Since line k passes through the point (9, 12) and the
slope of the line is 6, substituting 9 for x, 12 for y, and 6 for m in the equation y = mx + b yields 12 = (6)(9) + b, or 12 = 54 + b.
Subtracting 54 from both sides of this equation yields -42 = b. Therefore, the value of b is -42.$qb$);
select seed_pool_question($qb$CB-a7a14e87$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, line k is defined by . Line j is perpendicular to line k, and the y-intercept of line j is . Which of the following is an
equation of line j ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a7a14e87.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that line j is perpendicular to line k and that line k is defined by the equation . This equation can be
rewritten in slope-intercept form, , where m represents the slope of the line and b represents the y-coordinate of the y-intercept of
the line, by subtracting x from both sides of the equation, which yields . Thus, the slope of line k is . Since line j and line k are
perpendicular, their slopes are opposite reciprocals of each other. Thus, the slope of line j is 1. It’s given that the y-intercept of line j is .
Therefore, the equation for line j in slope-intercept form is , which can be rewritten as .
Choices A, B, and C are incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-74d0906a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A tow truck travels at a speed of at least 25 miles per hour but no more than 45 miles per hour for a section of a road. Which inequality
represents this situation, where x is the speed of the tow truck, in miles per hour, on this section of the road?$qb$, null, $qb$[{"label": "A", "body": "x ≥ 25"}, {"label": "B", "body": "x ≥ 45"}, {"label": "C", "body": "25 ≤ x ≤ 45"}, {"label": "D", "body": "x ≤ 70"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that a tow truck travels at a speed of at least 25 miles per hour but no more than 45 miles per hour. It's also given
that x represents the speed of the tow truck, in miles per hour. At least 25 miles per hour means x ≥ 25, and no more than 45 miles per hour
means x ≤ 45. Therefore, the inequality that represents this situation is 25 ≤ x ≤ 45.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ccc3ad6b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(123??6??66223355II)/(-/--/--/--/--/-(?666 -555 -444 -333 -??? -111 ?- 1II ??? 333 444 555 666)/-÷÷÷÷÷?65432?4466223355II)||?|| || || || ?|| | || || || || || || | x
The graph of a system of linear equations is shown. What is the solution (x, y) to the system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ccc3ad6b.png$qb$, $qb$[{"label": "A", "body": "(4, -5)"}, {"label": "B", "body": "(0, 3)"}, {"label": "C", "body": "(0, -2)"}, {"label": "D", "body": "(-2, 3)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The solution to this system of linear equations is represented by the point that lies on both lines shown, or the point of
intersection of the two lines. According to the graph, the point of intersection occurs when x = 4 and y = -5, or at the point (4, -5) .
Therefore, the solution (x, y) to the system is (4, -5).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1fe778dc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A line in the xy-plane has a slope of - 1/2 and passes through the point (0, 3). Which equation represents this line?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1fe778dc.png$qb$, $qb$[{"label": "A", "body": "y = - 1/2 x - 3"}, {"label": "B", "body": "y = - 1/2 x + 3"}, {"label": "C", "body": "y = 1/2 x - 3"}, {"label": "D", "body": "y = 1/2 x + 3"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A line in the xy-plane with a slope of m and a y-intercept of (0, b) can be represented by the equation y = mx + b. It's given
that the line has a slope of - 1/2 . Therefore, . It's also given that the line passes through the point . Therefore, b = 3. Substituting
y = mmx=+-b1/2 y = -1/2(x0,+3)3
- 1/2 for m and 3 for b in the equation  yields y = - 1/2 x + 3. Therefore, the equation  represents this line.
Choice A is incorrect. This equation represents a line in the xy-plane that passes through the point (0, -3), not (0, 3) .
Choice C is incorrect. This equation represents a line in the xy-plane that has a slope of 1/2 , not - 1/2 , and passes through the point (0, -3) , not
(0, 3) .
Choice D is incorrect. This equation represents a line in the xy-plane that has a slope of 1/2 , not - 1/2 .$qb$);
select seed_pool_question($qb$CB-90bd9ef8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The average annual energy cost for a certain home is $4,334. The homeowner plans to spend $25,000 to install a geothermal heating system.
The homeowner estimates that the average annual energy cost will then be $2,712. Which of the following inequalities can be solved to find t, the
number of years after installation at which the total amount of energy cost savings will exceed the installation cost?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-90bd9ef8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The savings each year from installing the geothermal heating system will be the average annual energy cost for the home
before the geothermal heating system installation minus the average annual energy cost after the geothermal heating system installation, which
is  dollars. In t years, the savings will be  dollars. Therefore, the inequality that can be solved to find the
number of years after installation at which the total amount of energy cost savings will exceed (be greater than) the installation cost, $25,000, is
.
Choice A is incorrect. It gives the number of years after installation at which the total amount of energy cost savings will be less than the
installation cost. Choice C is incorrect and may result from subtracting the average annual energy cost for the home from the onetime cost
of the geothermal heating system installation. To find the predicted total savings, the predicted average cost should be subtracted from the
average annual energy cost before the installation, and the result should be multiplied by the number of years, t. Choice D is incorrect and may
result from misunderstanding the context. The ratio  compares the average energy cost before installation and the average energy cost
after installation; it does not represent the savings.$qb$);
select seed_pool_question($qb$CB-c3989ef8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Henry receives a $60·00 gift card to pay for movies online. He uses his gift card to buy 3 movies for $7·50 each. If he spends the rest of his gift
card balance on renting movies for $1·50 each, how many movies can Henry rent?$qb$, null, $qb$[{"label": "A", "body": "10"}, {"label": "B", "body": "25"}, {"label": "C", "body": "35"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that Henry uses his $60·00 gift card to buy 3 movies for $7·50 each. Therefore, Henry spends 3($7·50) , or
$22·50, of his $60·00 gift card to buy 3 movies. After buying 3 movies with his $60·00 gift card, Henry has a gift card balance of $60·00
- $22·50, or $37·50. It's also given that Henry spends the rest of his gift card balance on renting movies for $1·50 each. Therefore, Henry can
rent ($37·50)/($1·5o) , or 25, movies.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-429fb7c0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$What value of t is the solution to the equation 0·8t - 0·46 = 8(t - 0·001) + 1·9?$qb$, null, null, null, array[$qb$-.3266$qb$, $qb$-.3267$qb$, $qb$-49/150$qb$]::text[], $qb$The correct answer is -·3267. Applying the distributive property to the right-hand side of the given equation yields 0·8t - 0·46 = 8t - 0·008
+ 1·9, or 0·8t - 0·46 = 8t + 1·892. Subtracting 0·8t from both sides of this equation yields -0·46 = 7·2t + 1·892. Subtracting 1·892 from
both sides of this equation yields -2·352 = 7·2t. Dividing both sides of this equation by 7·2 yields (-2·352)/(7·2) = t. Therefore, the value of t is
approximately -0·32667. Note that -.3267, -.3266, -0.326, and -0.327 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-6f6dfe3e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
(-/(-6)|)/3-/(|-0 ?)|| ???(-y)/184(n +)/92(n +)/(-?)???
n
The table shows three values of x and their corresponding values of y, where n is a constant, for the linear relationship between x and y. What is
the slope of the line that represents this relationship in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6f6dfe3e.png$qb$, $qb$[{"label": "A", "body": "- 92/3"}, {"label": "B", "body": "- 3/92"}, {"label": "C", "body": "(n+92)/(-3)"}, {"label": "D", "body": "(2n-92)/3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The slope, m, of a line in the xy-plane can be found using two points on the line, (x1 , y1 ) and (x2 , y2 ) , and the slope formula
. Based on the given table, the line representing the relationship between x and y in the xy-plane passes through the points
m(-=6, (y2-yI)/(nx2+-x11)84)
, (-3, n + 92), and (0, n) , where n is a constant. Substituting two of these points, (-3, n + 92) and (0, n) , for (x1 , y1 ) and
(x2 , y2 ) , respectively, in the slope formula yields , which is equivalent to m = (n-n-92)/(o+3), or m = - 92/3 . Therefore, the slope of the
m =-(n-(n+92))/((902-)/3 (-3))
line that represents this relationship in the xy-plane is .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8f0c82e2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The minimum value of x is 12 less than 6 times another number n. Which inequality shows the possible values of x?$qb$, null, $qb$[{"label": "A", "body": "x ≤ 6n - 12"}, {"label": "B", "body": "x ≥ 6n - 12"}, {"label": "C", "body": "x ≤ 12 - 6n"}, {"label": "D", "body": "x ≥ 12 - 6n"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the minimum value of x is 12 less than 6 times another number n. Therefore, the possible values of x are all
greater than or equal to the value of 12 less than 6 times n. The value of 6 times n is given by the expression 6n. The value of 12 less than 6n is
given by the expression 6n - 12. Therefore, the possible values of x are all greater than or equal to 6n - 12. This can be shown by the
inequality x ≥ 6n - 12.
Choice A is incorrect. This inequality shows the possible values of x if the maximum, not the minimum, value of x is 12 less than 6 times n.
Choice C is incorrect. This inequality shows the possible values of x if the maximum, not the minimum, value of x is 6 times n less than 12, not
12 less than 6 times n.
Choice D is incorrect. This inequality shows the possible values of x if the minimum value of x is 6 times n less than 12, not 12 less than 6
times n.$qb$);
select seed_pool_question($qb$CB-5ad9eff0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The width of a rectangular dance floor is w feet. The length of the floor is 6 feet longer than its width. Which of the following expresses the
perimeter, in feet, of the dance floor in terms of w ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5ad9eff0.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It is given that the width of the dance floor is w feet. The length is 6 feet longer than the width; therefore, the length of the
dance floor is . So the perimeter is .
Choice A is incorrect because it is the sum of one length and one width, which is only half the perimeter. Choice C is incorrect and may result
from using the formula for the area instead of the formula for the perimeter and making a calculation error. Choice D is incorrect because this is
the area, not the perimeter, of the dance floor.$qb$);
select seed_pool_question($qb$CB-39617468$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x + y = 350
The given equation relates the total number of maple trees, x, and the total number of birch trees, y, planted in a 14-acre forest preserve. If 245
maple trees were planted in the forest preserve, how many birch trees were planted in the forest preserve?$qb$, null, $qb$[{"label": "A", "body": "14"}, {"label": "B", "body": "25"}, {"label": "C", "body": "105"}, {"label": "D", "body": "245"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the equation x + y = 350 relates the total number of maple trees, x, and the total number of birch trees, y,
planted in a 14-acre forest preserve. It’s also given that 245 maple trees were planted in the forest preserve. Substituting 245 for x in the given
equation yields 245 + y = 350. Subtracting 245 from both sides of this equation yields y = 105. Therefore, 105 birch trees were planted in the
forest preserve.
Choice A is incorrect. This is the number of acres in the forest preserve, not the number of birch trees planted in the forest preserve.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the number of maple trees planted in the forest preserve, not the number of birch trees planted in the forest
preserve.$qb$);
select seed_pool_question($qb$CB-038d87d7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A neighborhood consists of a 2-hectare park and a 35-hectare residential area. The total number of trees in the neighborhood is 3,934. The
equation 2x + 35y = 3,934 represents this situation. Which of the following is the best interpretation of x in this context?$qb$, null, $qb$[{"label": "A", "body": "The average number of trees per hectare in the park"}, {"label": "B", "body": "The average number of trees per hectare in the residential area"}, {"label": "C", "body": "The total number of trees in the park"}, {"label": "D", "body": "The total number of trees in the residential area"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a neighborhood consists of a 2-hectare park and a 35-hectare residential area and that the total number of
trees in the neighborhood is 3,934. It's also given that the equation 2x + 35y = 3,934 represents this situation. Since the total number of trees
for a given area can be determined by taking the number of hectares times the average number of trees per hectare, this must mean that the
terms 2x and 35y correspond to the number of trees in the park and in the residential area, respectively. Since 2x corresponds to the number of
trees in the park, and 2 is the size of the park, in hectares, x must represent the average number of trees per hectare in the park.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-174885f8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Jay walks at a speed of 3 miles per hour and runs at a speed of 5 miles per hour. He walks for w hours and runs for r hours for a combined total
of 14 miles. Which equation represents this situation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-174885f8.png$qb$, $qb$[{"label": "A", "body": "3w + 5r = 14"}, {"label": "B", "body": "1/3 w + 1/5 r = 14"}, {"label": "C", "body": "1/3 w + 1/5 r = 1 12"}, {"label": "D", "body": "3w + 5r = 112"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since Jay walks at a speed of 3 miles per hour for w hours, Jay walks a total of 3w miles. Since Jay runs at a speed of 5
miles per hour for r hours, Jay runs a total of 5r miles. Therefore, the total number of miles Jay travels can be represented by 3w + 5r. Since
the combined total number of miles is 14, the equation 3w + 5r = 14 represents this situation.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-441558e7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Scientists collected fallen acorns that each housed a colony of the ant species P. ohioensis and analyzed each colony's structure. For any of
these colonies, if the colony has x worker ants, the equation y = 0·67x + 2·6, where 20 ≤ x ≤ 110, gives the predicted number of larvae, y, in
the colony. If one of these colonies has 58 worker ants, which of the following is closest to the predicted number of larvae in the colony?$qb$, null, $qb$[{"label": "A", "body": "41"}, {"label": "B", "body": "61"}, {"label": "C", "body": "83"}, {"label": "D", "body": "190"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the equation y = 0·67x + 2·6, where 20 ≤ x ≤ 110, gives the predicted number of larvae, y, in a colony of
ants if the colony has x worker ants. If one of these colonies has 58 worker ants, the predicted number of larvae in that colony can be found by
substituting 58 for x in the given equation. Substituting 58 for x in the given equation yields y = 0·67 (58) + 2·6, or y = 41·46. Of the given
choices, 41 is closest to the predicted number of larvae in the colony.
Choice B is incorrect. This is closest to the predicted number of larvae in a colony with 87 worker ants.
Choice C is incorrect. This is closest to the number of worker ants for which the predicted number of larvae in a colony is 58.
Choice D is incorrect. This is closest to the predicted number of larvae in a colony with 280 worker ants.$qb$);
select seed_pool_question($qb$CB-56e373b3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A manager is responsible for ordering supplies for a shaved ice shop. The shop's inventory starts with 4,500 paper cups, and the manager
estimates that 70 of these paper cups are used each day. Based on this estimate, in how many days will the supply of paper cups reach 1,700?$qb$, null, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "40"}, {"label": "C", "body": "60"}, {"label": "D", "body": "80"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the shop’s inventory starts with 4,500 paper cups and that the manager estimates that 70 of these paper cups
are used each day. Let x represent the number of days in which the estimated supply of paper cups will reach 1,700. The equation 4,500 - 70x
= 1,700 represents this situation. Subtracting 4,500 from both sides of this equation yields -70x = -2,800. Dividing both sides of this
equation by -70 yields x = 40. Therefore, based on this estimate, the supply of paper cups will reach 1,700 in 40 days.
Choice A is incorrect. After 20 days, the estimated supply of paper cups would be 4,500 - 70(20) , or 3,100 cups, not 1,700 cups.
Choice C is incorrect. After 60 days, the estimated supply of paper cups would be 4,500 - 70(60) , or 300 cups, not 1,700 cups.
Choice D is incorrect. After 80 days, the estimated supply of paper cups would be 4,500 - 70(80) , or -1,100 cups, which isn't possible.$qb$);
select seed_pool_question($qb$CB-2eef7e61$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The graph of the function f is a line in the xy-plane. If the line has slope  and , which of the following defines f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2eef7e61.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The equation for the function f in the xy-plane can be represented by , where m is the slope and b is the y-
coordinate of the y-intercept. Since it’s given that the line has a slope of , it follows that  in , which yields
. It’s given that . This implies that the graph of the function f in the xy-plane passes through the point . Thus, the y-
coordinate of the y-intercept of the graph is 3, so  in , which yields . Therefore, the equation
defines the function f.
Choice A is incorrect and may result from a sign error for the y-intercept. Choice C is incorrect and may result from using the denominator of the
given slope as m in , in addition to a sign error for the y-intercept. Choice D is incorrect and may result from using the
denominator of the given slope as m in .$qb$);
select seed_pool_question($qb$CB-e3bbde69$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$8x + y = 5
y = 9x + 1
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e3bbde69.png$qb$, $qb$[{"label": "A", "body": "-6"}, {"label": "B", "body": "4/17"}, {"label": "C", "body": "6/17"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The second equation in the given system is y = 9x + 1. Substituting 9x + 1 for y in the first equation in the given system
yields 8x + 9x + 1 = 5, which is equivalent to 17x + 1 = 5. Subtracting 1 from both sides of this equation yields 17x = 4. Dividing both
sides of this equation by 17 yields x = 4/17 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f0773a55$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?O-y^(|)|?^(|x)
The graph represents the total charge, in dollars, by an electrician for x hours of work. The electrician charges a onetime fee plus an hourly rate.
What is the best interpretation of the slope of the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f0773a55.png$qb$, $qb$[{"label": "A", "body": "The electrician’s hourly rate"}, {"label": "B", "body": "The electrician’s onetime fee"}, {"label": "C", "body": "The maximum amount that the electrician charges"}, {"label": "D", "body": "The total amount that the electrician charges"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the electrician charges a onetime fee plus an hourly rate. It's also given that the graph represents the total
charge, in dollars, for x hours of work. This graph shows a linear relationship in the xy-plane. Thus, the total charge y, in dollars, for x hours of
work can be represented as y = mx + b, where m is the slope and (0, b) is the y-intercept of the graph of the equation in the xy-plane. Since
the given graph represents the total charge, in dollars, by an electrician for x hours of work, it follows that its slope is m, or the electrician’s
hourly rate.
Choice B is incorrect. The electrician's onetime fee is represented by the y-coordinate of the y-intercept, not the slope, of the graph.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-8da536c6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In 2010, a swim club had a total of 35 swimmers, each classified as either advanced or intermediate. From 2010 to 2020, the number of
advanced swimmers in the club increased by approximately 53%, and the number of intermediate swimmers in the club increased by
approximately 44%. The total number of swimmers in the club increased by approximately 49%. Which equation best represents this situation,
where a represents the number of advanced swimmers in the club in 2010 and b represents the number of intermediate swimmers in the club in
2010?$qb$, null, $qb$[{"label": "A", "body": "1·53a + 1·49b = 35(1·44)"}, {"label": "B", "body": "1·49a + 0·53b = 35(1·44)"}, {"label": "C", "body": "1·53a + 1·44b = 35(1·49)"}, {"label": "D", "body": "1·44a + 1·53b = 35(1·49)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that in 2010, a swim club had a total of 35 swimmers, each classified as either advanced or intermediate, and that
a represents the number of advanced swimmers in 2010 and b represents the number of intermediate swimmers in 2010. It's also given that
from 2010 to 2020, the number of advanced swimmers in the club increased by approximately 53% and the number of intermediate swimmers
in the club increased by approximately 44%. Thus, in 2020, the approximate number of advanced swimmers in the club can be represented as
1·53a and the approximate number of intermediate swimmers in the club can be represented as 1·44b. It's given that the total number of
swimmers in the club increased by approximately 49% from 2010 to 2020. Since the club had 35 swimmers in 2010, it follows that the total
number of swimmers in 2020 can be represented as 35(1·49) . Since the sum of the number of advanced swimmers in 2020 and the number of
intermediate swimmers in 2020 equals the total number of swimmers in 2020, the equation 1·53a + 1·44b = 35(1·49) best represents this
situation.
Choice A is incorrect. This equation represents a situation where the number of intermediate swimmers in the club in 2020 increased by
approximately 49%, not 44%, and the total number of swimmers in the club in 2020 increased by approximately 44%, not 49%.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect. This equation represents a situation where the number of advanced swimmers in the club in 2020 increased by
approximately 44%, not 53%, and the number of intermediate swimmers in the club in 2020 increased by approximately 53%, not 44%.$qb$);
select seed_pool_question($qb$CB-5e08a055$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = 6x + 18
One of the equations in a system of two linear equations is given. The system has no solution. Which equation could be the second equation in
the system?$qb$, null, $qb$[{"label": "A", "body": "-6x + y = 18"}, {"label": "B", "body": "-6x + y = 22"}, {"label": "C", "body": "-12x + y = 36"}, {"label": "D", "body": "-12x + y = 18"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A system of two linear equations in two variables, x and y, has no solution if the lines represented by the equations in the xy-
plane are parallel and distinct. Lines represented by equations in standard form, Ax + By = C and Dx + Ey = F, are parallel if the
coefficients for x and y in one equation are proportional to the corresponding coefficients in the other equation, meaning D/A = E/B ; and the lines
are distinct if the constants are not proportional, meaning F/C is not equal to  or E/B. The given equation, y = 6x + 18, can be written in
-6D/xA+ y = 18
standard form by subtracting 6x from both sides of the equation to yield . Therefore, the given equation can be written in the
form Ax + By = C, where A = -6, B = 1, and C = 18. The equation in choice B, , is written in the form ,
-6x + y(E=)/B =221/1 Dx + EE/By==1F
where D = -6, E = 1, and F = 22. Therefore, , which can be rewritten as D/A = 1 ; , which can be rewritten as ; and
D/A (=D)/A (-6)/(=-6)1
, which can be rewritten as F/C = 11/9 . Since , E/B = 1 , and F/C is not equal to 1, it follows that the given equation and the equation
F/(-C)6=x 22/(+18y) = 22
are parallel and distinct. Therefore, a system of two linear equations consisting of the given equation and the equation -6x + y
= 22 has no solution. Thus, the equation in choice B could be the second equation in the system.
Choice A is incorrect. The equation -6x + y = 18 and the given equation represent the same line in the xy-plane. Therefore, a system of these
linear equations would have infinitely many solutions, rather than no solution.
Choice C is incorrect. The equation -12x + y = 36 and the given equation represent lines in the xy-plane that are distinct and not parallel.
Therefore, a system of these linear equations would have exactly one solution, rather than no solution.
Choice D is incorrect. The equation -12x + y = 18 and the given equation represent lines in the xy-plane that are distinct and not parallel.
Therefore, a system of these linear equations would have exactly one solution, rather than no solution.$qb$);
select seed_pool_question($qb$CB-0ea7ef01$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Oxygen gas is placed inside a tank with a constant volume. The graph shows the estimated temperature y, in kelvins, of the oxygen gas when its
pressure is x atmospheres.
?^(?)?1?nSe?
II,000,,?????????004477669922883355110000000000000000000000000000000000000000?-/(-1II| 222| 333| 444| ?55| 666| ?77| 888| 999| 10II00|)| | ?| | | | | | | | | |x
?tm??epeae?
?reSSure (atm0SPhereS)
What is the estimated temperature, in kelvins, of the oxygen gas when its pressure is 6 atmospheres?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0ea7ef01.png$qb$, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "60"}, {"label": "C", "body": "700"}, {"label": "D", "body": "760"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For the graph shown, the x-axis represents pressure, in atmospheres, and the y-axis represents temperature, in kelvins.
Therefore, the estimated temperature, in kelvins, of the oxygen gas when its pressure is 6 atmospheres is represented by the y-coordinate of the
point on the graph that has an x-coordinate of 6. The point on the graph with an x-coordinate of 6 has a y-coordinate of approximately
700. Therefore, the estimated temperature, in kelvins, of the oxygen gas when its pressure is 6 atmospheres is 700.
Choice A is incorrect. This is the pressure, in atmospheres, not the estimated temperature, in kelvins, of the oxygen gas when its pressure is 6
atmospheres.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0df106df$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An online bookstore sells novels and magazines. Each novel sells for $4, and each magazine sells for $1. If Sadie purchased a total of 11 novels
and magazines that have a combined selling price of $20, how many novels did she purchase?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "3"}, {"label": "C", "body": "4"}, {"label": "D", "body": "5"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Let n be the number of novels and m be the number of magazines that Sadie purchased. If Sadie purchased a total of 11
novels and magazines, then . It is given that the combined price of 11 novels and magazines is $20. Since each novel sells for $4
and each magazine sells for $1, it follows that . So the system of equations below must hold.
Subtracting corresponding sides of the second equation from the first equation yields , so . Therefore, Sadie purchased 3 novels.
Choice A is incorrect. If 2 novels were purchased, then a total of $8 was spent on novels. That leaves $12 to be spent on magazines, which
means that 12 magazines would have been purchased. However, Sadie purchased a total of 11 novels and magazines. Choices C and D are
incorrect. If 4 novels were purchased, then a total of $16 was spent on novels. That leaves $4 to be spent on magazines, which means that 4
magazines would have been purchased. By the same logic, if Sadie purchased 5 novels, she would have no money at all ($0) to buy magazines.
However, Sadie purchased a total of 11 novels and magazines.$qb$);
select seed_pool_question($qb$CB-820ad8e8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In a chess tournament, each participant earns 1 point for each game the participant plays that ends in a draw and 3 points for each game the
participant wins. A certain participant in this tournament has earned 41 points. Which equation represents this situation, where d represents the
number of games this participant has played that ended in a draw and w represents the number of games this participant has won?$qb$, null, $qb$[{"label": "A", "body": "d + 3w = 41"}, {"label": "B", "body": "3d + w = 41"}, {"label": "C", "body": "d + w/3 = 41"}, {"label": "D", "body": "d/3 + w = 41"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that each participant earns 1 point for each game the participant plays that ends in a draw and 3 points for each
game the participant wins. Since d represents the number of games that a certain participant has played that ended in a draw and w represents
the number of games this participant has won, this participant has earned a total of 1d + 3w, or d + 3w, points. Since this participant earned
41 points, the equation d + 3w = 41 represents this situation.
Choice B is incorrect. This equation represents the situation where the participant earned 3 points for each game played that ended in a draw
and 1 point for each game won and earned 41 points.
Choice C is incorrect. This equation represents the situation where the participant earned 1 point for each game played that ended in a draw and
1/3 point for each game won and earned 41 points.
Choice D is incorrect. This equation represents the situation where the participant earned 1/3 point for each game played that ended in a draw
and 1 point for each game won and earned 41 points.$qb$);
select seed_pool_question($qb$CB-9f70fd47$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$What is the y-coordinate of the y-intercept of the graph of 3x/7 = - 5y/9 + 21 in the xy-plane?$qb$, null, null, null, array[$qb$189/5$qb$, $qb$37.8$qb$]::text[], $qb$The correct answer is 189/5 . A y-intercept of a graph in the xy-plane is a point where the graph intersects the y-axis, which is a point with an x-
coordinate of 0. Substituting 0 for x in the given equation yields , or 0 = -5y/9 + 21. Subtracting 21 from both sides of this
(3(0))/7 = -- 5y/(9^(9)) + 21
equation yields -21 = - 5y/9 . Multiplying both sides of this equation by  yields 189 = 5y. Dividing both sides of this equation by 5 yields
189/5 = y. Therefore, the y-coordinate of the y-intercept of the graph of the given equation in the xy-plane is 189/5. Note that 189/5 and 37.8 are
examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-f5ff91b2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If (x-5)/7 = (x-5)/9 , the value of x - 5 is between which of the following pairs of values?$qb$, null, $qb$[{"label": "A", "body": "-9 and -7"}, {"label": "B", "body": "-3 and 3"}, {"label": "C", "body": "4·5 and 5·5"}, {"label": "D", "body": "6·75 and 9·25"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Multiplying both sides of the given equation by , or 63, yields , or 9(x - 5) = 7(x - 5).
2(x -(75))(=9) 0 (63) ((x-5)/7) = (63) ((x-5)/9)2
Subtracting  from both sides of this equation yields . Dividing both sides of this equation by  yields x - 5 = 0.
7(x(-x5)/7-=5 ()x-5)/9
Therefore, if , then the value of x - 5 is 0. It follows that of the given choices, the value of x - 5 is between -3 and 3.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0c490cd5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Sam has a flag with an area of 110 Square incheS (in^(2)) . Sam plans to enlarge the flag by sewing on pieces of colored nylon, where each
piece would increase the flag's area by 64 in2 . Which equation gives the flag's total area y, in square inches, after Sam sews on x pieces of
nylon?$qb$, null, $qb$[{"label": "A", "body": "y = 64x"}, {"label": "B", "body": "y = 64 + 110x"}, {"label": "C", "body": "y = 110 + 64x"}, {"label": "D", "body": "y = 174x"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that Sam has a flag with an area of 110 Square iucheS (in^(2)) and that each piece of colored nylon Sam sews on
increases the flag's area by 64in^(2). If Sam sews on x pieces of nylon and each piece increases the area by 64in^(2) , it follows that the expression
64x represents the total increase in area, in square inches, from sewing on x pieces of nylon. Adding this increase in area, 64xin^(2), to the
original area of the flag, 110in^(2) , gives the total area of the flag. Therefore, the equation that gives the flag's total area y, in square inches, after
Sam sews on x pieces of nylon is y = 110 + 64x.
Choice A is incorrect. This equation represents the total area, in square inches, of x pieces of colored nylon.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5f46fc76$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$- (y|)/(-/--/--/--/--/--/--/--/--/-(?10II00 -999 -888 -?77 -666 -555 -444 -333 -222 -?II ?-)/--?÷÷?÷÷÷÷÷10II987?5432?00447766992288335511)||?|| || ?|| || || || || || || | | x
The graph of a system of linear equations is shown. What is the solution (x, y) to the system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5f46fc76.png$qb$, $qb$[{"label": "A", "body": "(0, -7)"}, {"label": "B", "body": "(0, -3)"}, {"label": "C", "body": "(-4, -3)"}, {"label": "D", "body": "(-4, 0)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The solution to a system of linear equations is represented by the point that lies on the graph of each equation in the system,
or the point where the lines intersect on a graph. On the graph shown, the two lines intersect at the point (-4, -3) . Therefore, the solution to the
system is (-4, -3).
Choice A is incorrect. This is the y-intercept of the graph of one of the lines shown, not the intersection point of the two lines.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-628300a9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A science teacher is preparing the 5 stations of a science laboratory. Each station will have either Experiment A materials or Experiment B
materials, but not both. Experiment A requires 6 teaspoons of salt, and Experiment B requires 4 teaspoons of salt. If x is the number of stations
that will be set up for Experiment A and the remaining stations will be set up for Experiment B, which of the following expressions represents the
total number of teaspoons of salt required?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-628300a9.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It is given that x represents the number of stations that will be set up for Experiment A and that there will be 5 stations total,
so it follows that 5 – x is the number of stations that will be set up for Experiment B. It is also given that Experiment A requires 6 teaspoons of
salt and that Experiment B requires 4 teaspoons of salt, so the total number of teaspoons of salt required is 6x + 4(5 – x), which simplifies to 2x
+ 20.
Choices A, B, and D are incorrect and may be the result of not understanding the description of the context.$qb$);
select seed_pool_question($qb$CB-a232aa96$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = -3x + 60. What is the value of f(x) when x = -8?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a232aa96.png$qb$, $qb$[{"label": "A", "body": "49"}, {"label": "B", "body": "52"}, {"label": "C", "body": "57"}, {"label": "D", "body": "84"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The value of f(x) when x = -8 can be found by substituting -8 for x in the given function. This yields f(-8) = -3(-8)
+ 60, or f(-8) = 84. Therefore, when x = -8, the value of f(x) is 84.
Choice A is incorrect. This is the value of (-3 + (-8)) + 60, not -3(-8) + 60.
Choice B is incorrect. This is the value of -8 + 60, not -3(-8) + 60.
Choice C is incorrect. This is the value of -3 + 60, not -3(-8) + 60.$qb$);
select seed_pool_question($qb$CB-400798d6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$2x + y = 37
In triangle QRS, sides QR and RS each have a length of x centimeters and side SQ has a length of y centimeters. The given equation
represents this situation. Which of the following is the best interpretation of 37 in this context?$qb$, null, $qb$[{"label": "A", "body": "The difference, in centimeters, between the lengths of sides QR and SQ"}, {"label": "B", "body": "The difference, in centimeters, between the lengths of sides QR and RS"}, {"label": "C", "body": "The sum of the lengths, in centimeters, of the three sides of the triangle"}, {"label": "D", "body": "The length, in centimeters, of one of the two sides of equal length"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that in triangle QRS, sides QR and RS each have a length of x centimeters. Therefore, the expression 2x
represents the sum of the lengths, in centimeters, of sides QR and RS. It's also given that side SQ has a length of y centimeters. Therefore, the
expression 2x + y represents the sum of the lengths, in centimeters, of sides QRRS, , and SQ. Since 2x + y is the sum of the lengths, in
centimeters, of the three sides of the triangle and 2x + y = 37, it follows that 37 is the sum of the lengths, in centimeters, of the three sides of
the triangle.
Choice A is incorrect. The difference, in centimeters, between the lengths of sides QR and SQ is x - y, not 37.
Choice B is incorrect. The difference, in centimeters, between the lengths of sides QR and RS is x - x, or 0, not 37.
Choice D is incorrect. The length, in centimeters, of one of the two sides of equal length is x, not 37.$qb$);
select seed_pool_question($qb$CB-9ed4c1a2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the slope of the graph of y = 1/4 (27x + 15) + 7x in the xy-plane?$qb$, null, null, null, array[$qb$13.75$qb$, $qb$55/4$qb$]::text[], $qb$The correct answer is 55/4 . In the xy-plane, the graph of an equation in the form y = mx + b, where m and b are constants, has a slope of m and
a y-intercept of . Applying the distributive property to the right-hand side of the given equation yields y = 27/4 x + 15/4 + 7x. Combining like
terms yields= 1/4 (27x +y1=5()0(^(,)5b5)/(+^(4)))x7x+ 15/4. This equation is in the form y = mx + b, where m = 55/4 and b = 15/4 . It follows that the slope of the graph of y
in the xy-plane is 55/4. Note that 55/4 and 13.75 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-45bba652$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If , what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-45bba652.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "5"}, {"label": "C", "body": "7"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Adding the like terms on the left-hand side of the given equation yields . Dividing both sides of this equation
by 5 yields .
Choice B is incorrect and may result from subtracting 5, not dividing by 5, on both sides of the equation . Choice C is incorrect.
This is the value of x, not the value of . Choice D is incorrect. This is the value of , not the value of .$qb$);
select seed_pool_question($qb$CB-53487897$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The relationship between two variables, x and y, is linear. For every increase in the value of x by 1 , the value of y increases by 8. When the value
of x is 2, the value of y is 18. Which equation represents this relationship?$qb$, null, $qb$[{"label": "A", "body": "y = 2x + 18"}, {"label": "B", "body": "y = 2x + 8"}, {"label": "C", "body": "y = 8x + 2"}, {"label": "D", "body": "y = 3x + 26"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the relationship between x and y is linear. An equation representing a linear relationship can be written in the
form y = mx + b, where m is the slope and b is the y-coordinate of the y-intercept of the graph of the relationship in the xy-plane. It’s given that
for every increase in the value of x by 1, the value of y increases by 8. The slope of a line can be expressed as the change in y over the change in
x. Thus, the slope, m, of the line representing this relationship can be expressed as 8/1 , or 8. Substituting 8 for m in the equation y = mx + b
yields y = 8x + b. It's also given that when the value of x is 2, the value of y is 18. Substituting 2 for x and 18 for y in the equation y = 8x + b
yields 18 = 8(2) + b, or 18 = 16 + b. Subtracting 16 from each side of this equation yields 2 = b. Substituting 2 for b in the equation
y = 8x + b yields y = 8x + 2. Therefore, the equation y = 8x + 2 represents this relationship.
Choice A is incorrect. This equation represents a relationship where for every increase in the value of x by 1, the value of y increases by 2, not 8,
and when the value of x is 2, the value of y is 22, not 18.
Choice B is incorrect. This equation represents a relationship where for every increase in the value of x by 1 , the value of y increases by 2, not 8,
and when the value of x is 2, the value of y is 12, not 18.
Choice D is incorrect. This equation represents a relationship where for every increase in the value of x by 1, the value of y increases by 3, not 8,
and when the value of x is 2, the value of y is 32, not 18.$qb$);
select seed_pool_question($qb$CB-208626df$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$2ℓ + 2w ≤ 27
A rectangle has length ℓ and width w. The inequality gives the possible values of ℓ and w for which the perimeter of this rectangle is less than
or equal to 27. Which statement is the best interpretation of (ℓ, w) = (8, 3) in this context?$qb$, null, $qb$[{"label": "A", "body": "If the rectangle has length 3 and width 8, its perimeter is less than or equal to 27."}, {"label": "B", "body": "If the rectangle has length 8 and width 3, its perimeter is less than or equal to 27."}, {"label": "C", "body": "If the rectangle has length 3 and width 8, its perimeter is greater than or equal to 27."}, {"label": "D", "body": "If the rectangle has length 8 and width 3, its perimeter is greater than or equal to 27."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that a rectangle has length ℓ and width w, and the inequality 2ℓ + 2w ≤ 27 gives the possible values of ℓ and w
for which the perimeter of this rectangle is less than or equal to 27. To determine the best interpretation of  in this context, the
2(8(ℓ) ,+w2) (=3) (≤8, 237)
values can be substituted in the given inequality. Substituting 8 for ℓ and 3 for w in this inequality yields , which is equivalent
to 16 + 6 ≤ 27, or 22 ≤ 27. Since this inequality is true, if the rectangle has length 8 and width 3, its perimeter is less than or equal to 27.
Choice A is incorrect. The interpretation of (ℓ, w) = (8, 3) implies that the rectangle has length 8 and width 3, not length 3 and width 8.
Choice C is incorrect. The interpretation of (ℓ, w) = (8, 3) implies that the rectangle has length 8 and width 3, not length 3 and width 8.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1ecaa9c0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Robert rented a truck to transport materials he purchased from a hardware store. He was charged an initial fee of $20.00 plus an additional
$0.70 per mile driven. If the truck was driven 38 miles, what was the total amount Robert was charged?$qb$, null, $qb$[{"label": "A", "body": "$46.60"}, {"label": "B", "body": "$52.90"}, {"label": "C", "body": "$66.90"}, {"label": "D", "body": "$86.50"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that Robert was charged an initial fee of $20.00 to rent the truck plus an additional $0.70 per mile driven. Let m
represent the number of miles the truck was driven. Since the rental charge is $0.70 per mile driven,  represents the amount Robert was
charged for m miles driven. Let c equal the total amount, in dollars, Robert was charged to rent the truck. The total amount can be represented by
the equation . It’s given that the truck was driven 38 miles, thus . Substituting 38 into the equation gives
. Multiplying  gives . Adding these values gives , so the total amount
Robert was charged is $46.60.
Choices B, C, and D are incorrect and may result from setting up the equation incorrectly or from making calculation errors.$qb$);
select seed_pool_question($qb$CB-fb43b85f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A line passes through the points (4, 6) and (15, 24) in the xy-plane. What is the slope of the line?$qb$, null, null, null, array[$qb$1.636$qb$, $qb$18/11$qb$]::text[], $qb$The correct answer is 18/11 . For a line that passes through the points (x1 , y1 ) and in the xy-plane, the slope of the line can be calculated
using the slope formula, . It's given that a line passes through the pointsm =( (x242-^(,)(4y6)/(15-4),26) ) and in the xy-plane. Substituting  for
m(x=2 , (y2-y1)/(yx22-) x1) m =( (1158^(,))/11 24) ( (41^(,)86)/11 )
(x1 , y1 ) and (15, 24) for in the slope formula, m = (y2-y1)/(x2 -x1) , yields , or . Therefore, the slope of the line is . Note
that 18/11 and 1.636 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-eafdbbbd$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$1/4 (x + 5) - 1/3 (x + 5) = -7
What value of x is the solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "-12"}, {"label": "B", "body": "-5"}, {"label": "C", "body": "79"}, {"label": "D", "body": "204"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For the given equation, is a factor of both terms on the left-hand side. Therefore, the given equation can be rewritten
(3/12 - 4/12)((xx++55)) = -7
as , or , which is equivalent to . Multiplying both sides of this equation by
-1(21/4 - 1/3) (x + 5) = -7 x =-71/912 (x + 5) = -7
yields x + 5 = 84. Subtracting 5 from both sides of this equation yields .
Choice A is incorrect. This is the value of x for which the left-hand side of the given equation equals 7/12 , not -7.
Choice B is incorrect. This is the value of x for which the left-hand side of the given equation equals 0, not -7.
Choice D is incorrect. This is the value of x for which the left-hand side of the given equation equals - 2o9/12 , not -7.$qb$);
select seed_pool_question($qb$CB-7d89376f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A discount airline sells a certain number of tickets, x, for a flight for $90 each. It sells the number of remaining tickets, y, for $250 each. For a
particular flight, the airline sold 120 tickets and collected a total of $27,600 from the sale of those tickets. Which system of equations represents
this relationship between x and y ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7d89376f.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The airline sold two types of tickets for this flight: x tickets at $90 each and the remaining tickets, y, at $250 each. Because
the airline sold a total of 120 tickets for this flight, it must be true that x + y = 120. The amount, in dollars, collected from the sale of x tickets at
$90 each is represented by 90x. The amount, in dollars, collected from the sale of the remaining y tickets at $250 each is represented by 250y. It
is given that a total of $27,600 was collected from the sale of all tickets. Therefore, it must also be true that 90x + 250y = 27,600.
Choice B is incorrect. The total number of tickets sold is represented correctly as x + y = 120. The total amount, in dollars, collected from the sale
of the x tickets at $90 each and the remaining tickets, y, at $250 has been correctly represented as 90x + 250y. However, according to the
information given, this total should be equal to 27,600, not 120(27,600) dollars. Choice C is incorrect. The total number of tickets sold has been
correctly represented as x + y. However, according to the information given, this total should be equal to 120, not 27,600, as shown in choice C.
The total amount, in dollars, collected from the sale of the x tickets at $90 each and the remaining tickets, y, at $250 has been correctly
represented as 90x + 250y. However, according to the information given, this total should be equal to 27,600, not 120(27,600) dollars. Choice D is
incorrect. The two equations given in choice D have no meaning in this context.$qb$);
select seed_pool_question($qb$CB-3ce92ce8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = 2x + 3
For the given function f, the graph of y= f(x) in the xy-plane is parallel to line j. What is the slope of line j?$qb$, null, null, null, array[$qb$2$qb$]::text[], $qb$The correct answer is 2. It’s given that function f is defined by f(x) = 2x + 3. Therefore, the equation representing the graph of y = f(x) in
the xy-plane is y = 2x + 3, and the graph is a line. For a linear equation in the form ,  represents the slope of the line. Since the
yf= mx + bm
value of m in the equation y = 2x + 3 is 2, the slope of the line defined by function  is 2. It's given that line j is parallel to the line defined by
function f. The slopes of parallel lines are equal. Therefore, the slope of line j is also 2.$qb$);
select seed_pool_question($qb$CB-0bd33265$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation h = (9(v-273·15))/5 + 32 gives the corresponding temperature h, in degrees Fahrenheit, of any substance that has a temperature of v
kelvins, where v > 0. If a substance has a temperature of 467·33 degrees Fahrenheit, what is the corresponding temperature, in kelvins, of this
substance?$qb$, null, null, null, array[$qb$515$qb$]::text[], $qb$The correct answer is 515. It’s given that the equation h = (9(?-273·15))/5 + 32 gives the corresponding temperature h, in degrees Fahrenheit, of
any substance that has a temperature of v kelvins, where v > 0. Substituting 467·33 for h in the given equation yields 467·33 = (9(v-273·15))/5
+ 32. Subtracting 32 from both sides of this equation yields 435·33 = (9(v-273·15))/5 . Multiplying both sides of this equation by 5 yields 2,176·65
= 9(v - 273·15). Dividing both sides of this equation by 9 yields 241·85 = v - 273·15. Adding 273·15 to both sides of this equation yields
515 = v. Therefore, if a substance has a temperature of 467·33 degrees Fahrenheit, the corresponding temperature, in kelvins, of this substance
is 515.$qb$);
select seed_pool_question($qb$CB-f40552a9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$1011123456789004477669922883355II?-/(-1II| 222| 333| 444| 555| 666| 777| 888| 999| 10II00|)|?| | | | | | | | | | |x
What is the y-intercept of the line graphed?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f40552a9.png$qb$, $qb$[{"label": "A", "body": "(0, -8)"}, {"label": "B", "body": "(0, -1/8)"}, {"label": "C", "body": "(0, 0)"}, {"label": "D", "body": "(0, 8)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The y-intercept of a line graphed in the xy-plane is the point where the line intersects the y-axis. The line graphed intersects
the y-axis at the point (0, 8) . Therefore, the y-intercept of the line graphed is (0, 8).
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-12ae3452$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The equation 46 = 2a + 2b gives the relationship between the side lengths a and b of a certain parallelogram. If a = 9, what is the value of b?$qb$, null, null, null, array[$qb$14$qb$]::text[], $qb$The correct answer is 14. It's given that the equation 46 = 2a + 2b gives the relationship between the side lengths a and b of a certain
parallelogram. Substituting 9 for a in the given equation yields 46 = 2(9) + 2b, or 46 = 18 + 2b. Subtracting 18 from both sides of this
equation yields 28 = 2b. Dividing both sides of this equation by 2 yields 14 = b. Therefore, if a = 9, the value of b is 14.$qb$);
select seed_pool_question($qb$CB-17f176ec$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A movie theater charges $11 for each full-price ticket and $8.25 for each reduced-price ticket. For one movie showing, the theater sold a total of
214 full-price and reduced-price tickets for $2,145. Which of the following systems of equations could be used to determine the number of full-
price tickets, f, and the number of reduced-price tickets, r, sold?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-17f176ec.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The movie theater sells f full-price tickets and r reduced-price tickets, so the total number of tickets sold is f + r. Since the
movie theater sold a total of 214 full-price and reduced-price tickets for one movie showing, it follows that f + r = 214. The movie theater charges
$11 for each full-price ticket; thus, the sales for full-price tickets, in dollars, is given by 11f. The movie theater charges $8.25 for each reduced-
price ticket; thus, the sales for reduced-price tickets, in dollars, is given by 8.25r. Therefore, the total sales, in dollars, for the movie showing is
given by 11f + 8.25r. Since the total sales for all full-price and reduced-price tickets is $2,145, it follows that 11f + 8.25r = 2,145.
Choice A is incorrect. This system of equations suggests that the movie theater sold a total of 2,145 full-price and reduced-price tickets for a
total of $214. Choice C is incorrect. This system suggests that the movie theater charges $8.25 for each full-price ticket and $11 for each
reduced-price ticket. Choice D is incorrect. This system suggests that the movie theater charges $8.25 for each full-price ticket and $11 for each
reduced-price ticket and sold a total of 2,145 tickets for a total of $214.$qb$);
select seed_pool_question($qb$CB-a4989860$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A line in the xy-plane has a slope of 9 and passes through the point (0, -5) . The equation y = px + r defines the line, where p and r are
constants. What is the value of p?$qb$, null, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. It’s given that the equation y = px + r defines the line. In this equation, p represents the slope of the line and r
represents the y-coordinate of the y-intercept of the line. It’s given that the line has a slope of 9. Therefore, the value of p is 9.$qb$);
select seed_pool_question($qb$CB-8643d906$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The population of snow leopards in a certain area can be modeled by the function P defined above, where  is the population t years after
1990. Of the following, which is the best interpretation of the equation  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8643d906.png$qb$, $qb$[{"label": "A", "body": "The snow leopard population in this area is predicted to be 30 in the year 2020."}, {"label": "B", "body": "The snow leopard population in this area is predicted to be 30 in the year 2030."}, {"label": "C", "body": "The snow leopard population in this area is predicted to be 550 in the year 2020."}, {"label": "D", "body": "The snow leopard population in this area is predicted to be 550 in the year 2030."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that  represents the population of snow leopards t years after 1990.  corresponds to
and . It follows that  corresponds to 30 years after 1990, or 2020. Thus, the best interpretation of  is that the
snow leopard population in this area is predicted to be 550 in the year 2020.
Choices A and B are incorrect and may result from reversing the interpretations of t and . Choice D is incorrect and may result from
determining that 30 years after 1990 is 2030, not 2020.$qb$);
select seed_pool_question($qb$CB-bbf9e5ce$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For groups of 25 or more people, a museum charges $21 per person for the first 25 people and $14 for each additional person. Which function f
gives the total charge, in dollars, for a tour group with n people, where n ≥ 25?$qb$, null, $qb$[{"label": "A", "body": "f(n) = 14n + 175"}, {"label": "B", "body": "f(n) = 14n + 525"}, {"label": "C", "body": "f(n) = 35n - 350"}, {"label": "D", "body": "f(n) = 14n + 21"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A tour group with n people, where n ≥ 25, can be split into two subgroups: the first 25 people and the additional n - 25
people. Since the museum charges $21 per person for the first 25 people and $14 for each additional person, the charge for the first 25 people
is  and the charge for the additional n - 25 people is $14(n - 25) . Therefore, the total charge, in dollars, is given by the function f(n)
=$2211((2255))+ 14(n - 25)
, or f(n) = 14n + 175.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-36f068e2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x + y = 53
11x + 18y = 730
The given equations represent the possible numbers of beach chairs, x, and umbrellas, y, rented at a park last month and the total spent, in
dollars, to rent those beach chairs and umbrellas. Which of the following graphs represents this situation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-36f068e2.png$qb$, $qb$[{"label": "A", "body": "y 80 70 60 50 40||||||||||? 30 20 10 x O 10 20 30 40 50 60 70 80"}, {"label": "B", "body": "y 80 70 60 50 40||||||||||? 30 20 10 x O 10 20 30 40 50 60 70 80"}, {"label": "C", "body": "y 80 70 60 50 40||||||||||? 30 20 10 x O 10 20 30 40 50 60 70 80"}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The intercepts of the graph of each equation can be found by substituting 0 for one variable at a time. For the equation x
+ y = 53, substituting 0 for y yields x = 53, so the x-intercept of the graph of the equation is (53, 0) . Substituting 0 for x in this equation
yields , so the y-intercept of the graph of the equation is (0, 53) . Thus, the graph of the equation x + y = 53 has intercepts at (53, 0)
(0y, 5=3)53
and . For the equation 11x + 18y = 730, substituting 0 for y yields x = 730/11, so the x-intercept of the graph of the equation is
approximately (66, 0) . Substituting 0 for x in this equation yields y = 730/18 , so the y-intercept of the graph of the equation is approximately
(0, 41) . Thus, the graph of the equation 11x + 18y = 730 has intercepts at approximately (66, 0) and (0, 41) . Choice B is a graph that shows
one line with intercepts at (0, 53) and (53, 0) and another line with intercepts at approximately (0, 41) and (66, 0) . Thus, choice B represents
this situation.
Choice A is incorrect. This graph represents the equations y = x and 11x + 18y = 730.
Choice C is incorrect. This graph represents the equations x + y = 53 and -11x + 18y = 730.
Choice D is incorrect. This graph represents the equations y = 53 and -11x + 18y = 730.$qb$);
select seed_pool_question($qb$CB-5b7599a6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$- (?II246???446622?? ?)/(?10II-/--/--/--/--/-00 -888 -?66 -444 --222÷÷÷÷101186420044662288? ??? 444 ?66 888 10II00)|| || || || || || || || || ?|| | || || || || || || || || || || | x
The graph shows a linear relationship between x and y. Which equation represents this relationship, where R is a positive constant?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5b7599a6.png$qb$, $qb$[{"label": "A", "body": "Rx + 18y = 36"}, {"label": "B", "body": "Rx - 18y = -36"}, {"label": "C", "body": "18x + Ry = 36"}, {"label": "D", "body": "18x - Ry = -36"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The equation representing the linear relationship shown can be written in slope-intercept form y = mx + b, where m is the
slope and (0, b) is the y-intercept of the line. The line shown passes through the points  and . Given two points on a line, (x1 , y1 ) and
(0^(,) 6) (0, 6()2^(,) 0) (2, 0)
(x2 , y2 ) , the slope of the line can be calculated using the equation . Substituting  and  for (x1 , y1 ) and (x2 , y2 ) ,
respectively, in this equation yields m = (0-6)/(2-0) , which is equivalent to mmy===(y2-y1)/(x-2--x61/(3^(2))x) + 6, or m = -3. Since (0, 6) is the y-intercept, it follows that b = 6.
Substituting -3 for m and 6 for b in the equation y = mx + b yields . Adding 3x to both sides of this equation yields
3x + y = 6. Multiplying this equation by 6 yields 18x + 6y = 36. It follows that the equation 18x + Ry = 36, where R is a positive constant,
represents this relationship.
Choice A is incorrect. The graph of this relationship passes through the point (0, 2) , not (0, 6).
Choice B is incorrect. The graph of this relationship passes through the point (0, 2), not (0, 6) .
Choice D is incorrect. The graph of this relationship passes through the point (-2, 0) , not (2, 0).$qb$);
select seed_pool_question($qb$CB-23758540$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What value of p satisfies the equation 2p + 275 = 325?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "25"}, {"label": "C", "body": "48"}, {"label": "D", "body": "300"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 275 from both sides of the given equation yields 2p = 50. Dividing both sides of this equation by 2 yields
p = 25. Therefore, the value of p that satisfies the given equation is 25.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of p that satisfies the equation (2 + p) + 275 = 325, not 2p + 275 = 325.
Choice D is incorrect. This is the value of p that satisfies the equation 2p - 275 = 325, not 2p + 275 = 325.$qb$);
select seed_pool_question($qb$CB-a4d6fbec$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If y = 5x + 10, what is the value of y when x = 8?$qb$, null, null, null, array[$qb$50$qb$]::text[], $qb$The correct answer is 50. Substituting 8 for x in the given equation yields y = 5 (8) + 10, or y = 50. Therefore, the value of y is 50 when x
= 8.$qb$);
select seed_pool_question($qb$CB-67d63e19$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The cost of renting a carpet cleaner is $52 for the first day and $26 for each additional day. Which of the following functions gives the cost
C(d) , in dollars, of renting the carpet cleaner for d days, where d is a positive integer?$qb$, null, $qb$[{"label": "A", "body": "C(d) = 26d+ 26"}, {"label": "B", "body": "C(d) = 26d+ 52"}, {"label": "C", "body": "C(d) = 52d- 26"}, {"label": "D", "body": "C(d) = 52d+ 78"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the cost of renting a carpet cleaner is $52 for the first day and $26 for each additional day. Therefore, the cost
, in dollars, of renting the carpet cleaner for d days is the sum of the cost for the first day, $52, and the cost for the additional d - 1 days,
C$2(6d()d - 1)
. It follows that C(d) = 52 + 26(d - 1), which is equivalent to C(d) = 52 + 26d - 26, or C(d) = 26d + 26.
Choice B is incorrect. This function gives the cost of renting a carpet cleaner for d days if the cost is $78, not $52, for the first day and $26 for
each additional day.
Choice C is incorrect. This function gives the cost of renting a carpet cleaner for d days if the cost is $26, not $52, for the first day and $52, not
$26, for each additional day.
Choice D is incorrect. This function gives the cost of renting a carpet cleaner for d days if the cost is $130, not $52, for the first day and $52, not
$26, for each additional day.$qb$);
select seed_pool_question($qb$CB-39571c77$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Naomi bought both rabbit snails and nerite snails for a total of $52. Each rabbit snail costs $8 and each nerite snail costs $6. If Naomi bought 2
nerite snails, how many rabbit snails did she buy?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "12"}, {"label": "C", "body": "14"}, {"label": "D", "body": "50"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Let x represent the number of rabbit snails that Naomi bought. It’s given that each rabbit snail costs $8. Therefore, the total
cost, in dollars, of the rabbit snails that Naomi bought can be represented by the expression 8x. It’s also given that each nerite snail costs $6,
and that Naomi bought 2 nerite snails. Therefore, the total cost, in dollars, of the nerite snails that Naomi bought is 6(2) , or 12. Since Naomi
bought both the rabbit snails and the nerite snails for a total of $52, the equation 8x + 12 = 52 can be used to represent the situation.
Subtracting 12 from both sides of this equation yields 8x = 40. Dividing both sides of this equation by 8 yields x = 5. Therefore, Naomi bought
5 rabbit snails.
Choice B is incorrect. This is the total cost, in dollars, of the nerite snails that Naomi bought, not the number of rabbit snails.
Choice C is incorrect. This is the cost, in dollars, of one rabbit snail and one nerite snail, not the number of rabbit snails that Naomi bought.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d02193fb$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-(2???446622??)/(-/--/--/--/-888 666 444 222÷÷÷÷864244662288 ?22 ??? ?66 8??)|| || || || || || ||?||| | || || || || || || || || | x
The shaded region shown represents the solutions to which inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d02193fb.png$qb$, $qb$[{"label": "A", "body": "y < 1 + 4x"}, {"label": "B", "body": "y < 1 - 4x"}, {"label": "C", "body": "y > 1 + 4x"}, {"label": "D", "body": "y > 1 - 4x"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The equation for the line representing the boundary of the shaded region can be written in slope-intercept form ,
where m is the slope and (0, b) is the y-intercept of the line. For the graph shown, the boundary line passes through the points  and
(1, -3) . Given two points on a line, (x1 , y1 ) and (x2 , y2 ) , the slope of the line can be calculated using the equation my =m=b(=-4)/(+^(1))(y2-y(10)/(xm2 -xx1) , 1y) = b + mx. Substituting
the points and (1, -3) for (x1 , y1 ) and (x2 , y2 ) in this equation yields m = (-3-1)/(1-0) , which is equivalent to , or m = -4. Since
(0(0,^(,)11))
the point represents the y-intercept, it follows that b = 1. Substituting -4 for m and 1 for b in the equation yields y = 1
- 4x as the equation of the boundary line. Since the shaded region represents all the points above this boundary line, it follows that the shaded
region shown represents the solutions to the inequality y > 1 - 4x.
Choice A is incorrect. This inequality represents a region below, not above, a boundary line with a slope of 4, not -4.
Choice B is incorrect. This inequality represents a region below, not above, the boundary line shown.
Choice C is incorrect. This inequality represents a region whose boundary line has a slope of 4, not -4.$qb$);
select seed_pool_question($qb$CB-63be6c9a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, line s passes through the point (0, 0) and is parallel to the line represented by the equation y = 18x + 2. If line s also passes
through the point (4, d) , what is the value of d?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "18"}, {"label": "C", "body": "72"}, {"label": "D", "body": "74"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A line in the xy-plane can be represented by an equation of the form , where m is the slope and b is the y-
(0,y0=)^(mx) + b
coordinate of the y-intercept of the line. It's given that line s passes through the point . Therefore, the y-coordinate of the y-intercept of line
s is 0. It's also given that line s is parallel to the line represented by the equation y = 18x + 2. Since parallel lines have the same slope, it
follows that the slope of line s is 18. Therefore, line s can be represented by the equation y = mx + b, where m = 18 and b = 0. Substituting
18 for m and 0 for b in y = mx + b yields the equation y = 18x + 0, or y = 18x. If line s passes through the point (4, d), then when x = 4,
y = d for the equation y = 18x. Substituting 4 for x and d for y in this equation yields d = 18(4) , or d = 72.
Choice A is incorrect. This is the y-coordinate of the y-intercept of the line represented by the equation y = 18x + 2.
Choice B is incorrect. This is the slope of the line represented by the equation y = 18x + 2.
Choice D is incorrect. The line represented by the equation y = 18x + 2, not line s, passes through the point (4, 74) .$qb$);
select seed_pool_question($qb$CB-49cd76d5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 8x = 6, what is the value of 72x?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "15"}, {"label": "C", "body": "54"}, {"label": "D", "body": "57"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that 8x = 6. Multiplying each side of this equation by 9 yields 72x = 54. Therefore, the value of 72x is 54.
Choice A is incorrect. This is the value of 4x, not 72x.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-65833256$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 6x + 16
-7x - y = 36
What is the solution (x, y) to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(-4, -8)"}, {"label": "B", "body": "(- 20/13 , - 80/13 )"}, {"label": "C", "body": "(4, 40)"}, {"label": "D", "body": "(20, 136)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given system of linear equations can be solved by the substitution method. The first equation in the given system of
equations defines y as 6x + 16. Substituting 6x + 16 for y in the second equation of the given system of equations yields -7x - (6x + 16)
= 36. Applying the distributive property on the left-hand side of this equation yields -7x - 6x - 16 = 36, or -13x - 16 = 36. Adding 16 to
both sides of this equation yields -13x = 52. Dividing both sides of this equation by -13 yields x = -4. Substituting -4 for x in the first
equation of the given system of equations, y = 6x + 16, yields y = 6(-4) + 16, or y = -8. Therefore, the solution (x, y) to the given system
of equations is (-4, -8).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-768b2425$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Last week, an interior designer earned a total of $1,258 from consulting for x hours and drawing up plans for y hours. The equation 68x + 85y
= 1,258 represents this situation. Which of the following is the best interpretation of 68 in this context?$qb$, null, $qb$[{"label": "A", "body": "The interior designer earned $68 per hour consulting last week."}, {"label": "B", "body": "The interior designer worked 68 hours drawing up plans last week."}, {"label": "C", "body": "The interior designer earned $68 per hour drawing up plans last week."}, {"label": "D", "body": "The interior designer worked 68 hours consulting last week."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that 68x + 85y = 1,258 represents the situation where an interior designer earned a total of $1,258 last week
from consulting for x hours and drawing up plans for y hours. Thus, 68x represents the amount earned, in dollars, from consulting for x hours,
and 85y represents the amount earned, in dollars, from drawing up plans for y hours. Since 68x represents the amount earned, in dollars, from
consulting for x hours, it follows that the interior designer earned $68 per hour consulting last week.
Choice B is incorrect. The interior designer worked y hours, not 68 hours, drawing up plans last week.
Choice C is incorrect. The interior designer earned $85 per hour, not $68 per hour, drawing up plans last week.
Choice D is incorrect. The interior designer worked x hours, not 68 hours, consulting last week.$qb$);
select seed_pool_question($qb$CB-e53688cb$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x + 3y = 29
3y = 11
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, null, null, null, array[$qb$18$qb$]::text[], $qb$The correct answer is 18. It's given by the second equation in the system that 3y = 11. Substituting 11 for 3y in the first equation in the system,
x + 3y = 29, yields x + 11 = 29. Subtracting 11 from both sides of this equation yields x = 18.$qb$);
select seed_pool_question($qb$CB-44d65912$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Angela is playing a video game. In this game, players can score points only by collecting coins and stars. Each coin is worth c points, and each
star is worth s points.
? The first time she played, Angela scored 700 points. She collected 20 coins and 10 stars.
· The second time she played, Angela scored 850 points. She collected 25 coins and 12 stars.
Which system of equations can be used to correctly determine the values of c and s ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-44d65912.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The number of coins collected can be multiplied by c to give the score from the points earned from coins. Similarly, the
number of stars collected can be multiplied by s to give the score from the points earned from the stars. Therefore, the total score each time
Angela played is , and the total score the second time she played is .
Choices A, C, and D are incorrect and may result from misidentifying the terms of the equation. Choice A switches coins and stars, choice C
switches stars and points, and choice D misidentifies coins, stars, and points.$qb$);
select seed_pool_question($qb$CB-41fdc0b8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table above shows the population of Greenleaf, Idaho, for the years 2000 and 2010. If the relationship between population and year is linear,
which of the following functions P models the population of Greenleaf t years after 2000?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-41fdc0b8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It is given that the relationship between population and year is linear; therefore, the function that models the population t
years after 2000 is of the form , where m is the slope and b is the population when . In the year 2000, . Therefore,
. The slope is given by . Therefore, , which is
equivalent to the equation in choice A.
Choice B is incorrect and may be the result of incorrectly calculating the slope as just the change in the value of P. Choice C is incorrect and may
be the result of the same error as in choice B, in addition to incorrectly using t to represent the year, instead of the number of years after 2000.
Choice D is incorrect and may be the result of incorrectly using t to represent the year instead of the number of years after 2000.$qb$);
select seed_pool_question($qb$CB-8ad64841$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A linear function f gives a company’s profit, in dollars, for selling x items. The company’s profit is $220 when it sells 8 items, and its profit is
$320 when it sells 10 items. Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 150x - 320"}, {"label": "B", "body": "f(x) = 32x"}, {"label": "C", "body": "f(x) = 50x - 10x"}, {"label": "D", "body": "f(x) = 50x - 180"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the relationship between x and f(x) is linear. A linear function can be written in the form f(x) = mx + b,
where m is the slope and b is the y-coordinate of the y-intercept of the graph of  in the xy-plane. Given two points on a line, (x1 , y1 )
m = (yy2-=y1)/(x2 -x1)f(x) $220
and (x2 , y2 ), the slope of the line can be found using the slope formula . It’s given that the company’s profit is  when it sells 8
items and the profit is $320 when it sells 10 items. Since represents the company's profit, in dollars, for selling x items, the graph of
= f(x) in the xy-plane passes through the points  and . Substituting (8, 220) and (10, 320) for (x1 , y1 ) and (x2, fy2(x) )y,
m = (320-(2820^(,))/(2102-08 =)24200f0) (+x)b (10m, 32=0)100/2
respectively, in the slope formula yields , which gives , or m = 50. Substituting 50 for m8,  for x, and 220 for in
f(x) = mx + b yields , or . Subtracting 400 from each side of this equation yields -180 = b. Substituting
220f=(x()50=)(m8)x++bb
50 for m and -180 for b in  yields f(x) = 50x - 180. Therefore, the equation that defines f is f(x) = 50x - 180.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f60aa0dc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 9(4 - 3x) + 2 = 8(4 - 3x) + 18, what is the value of 4 - 3x?$qb$, null, $qb$[{"label": "A", "body": "-16"}, {"label": "B", "body": "-4"}, {"label": "C", "body": "4"}, {"label": "D", "body": "16"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The value of 4 - 3x can be found by isolating this expression in the given equation. Subtracting 2 from both sides of the
given equation yields 9(4 - 3x) = 8(4 - 3x) + 16. Subtracting 8(4 - 3x) from both sides of this equation yields 9(4 - 3x) - 8(4 - 3x)
= 16, which gives 1(4 - 3x) = 16, or 4 - 3x = 16. Therefore, the value of 4 - 3x is 16.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of x, not 4 - 3x.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8b2a2a63$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The y-intercept of the graph of y = -6x - 32 in the xy-plane is (0, y). What is the value of y?$qb$, null, null, null, array[$qb$-32$qb$]::text[], $qb$The correct answer is -32. It’s given that the y-intercept of the graph of y = -6x - 32 is (0, y). Substituting 0 for x in this equation yields y =
-6(0) - 32, or y = -32. Therefore, the value of y that corresponds to the y-intercept of the graph of y = -6x - 32 in the xy-plane is -32.$qb$);
select seed_pool_question($qb$CB-70774aa4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 5x = 20, what is the value of 15x?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "12"}, {"label": "C", "body": "23"}, {"label": "D", "body": "60"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that 5x = 20. Multiplying both sides of this equation by 3 yields 15x = 60. Therefore, the value of 15x is 60.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-8a1544f1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the equation of the line shown in the xy-plane above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8a1544f1.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Any line in the xy-plane can be defined by an equation in the form y = mx + b, where m is the slope of the line and b is the y-
coordinate of the y-intercept of the line. From the graph, the y-intercept of the line is (0, 3). Therefore, b = 3. The slope of the line is the change in
the value of y divided by the change in the value of x for any two points on the line. The line shown passes through (0, 3) and (1, 0), so
, or m = –3. Therefore, the equation of the line is y = –3x + 3.
Choices A and C are incorrect because the equations given in these choices represent a line with a positive slope. However, the line shown has a
negative slope. Choice D is incorrect because the equation given in this choice represents a line with slope of . However, the line shown
has a slope of –3.$qb$);
select seed_pool_question($qb$CB-a9c04a21$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the solution to the equation ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a9c04a21.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "1.5"}, {"label": "C", "body": "2"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Subtracting 3 from both sides of the given equation yields . Dividing both sides by 2 results in .
Choices A and B are incorrect and may result from computational errors. Choice D is incorrect. This is the value of .$qb$);
select seed_pool_question($qb$CB-5907e072$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$f(x) = x + b
For the linear function f, b is a constant. When x = 0, f(x) = 30. What is the value of b?$qb$, null, $qb$[{"label": "A", "body": "-30"}, {"label": "B", "body": "- 1/3o"}, {"label": "C", "body": "1/3o"}, {"label": "D", "body": "30"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that when x = 0, f (x) = 30. Substituting 0 for x and 30 for f(x) in the given function yields 30 = 0 + b, or
30 = b. Therefore, the value of b is 30.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4722abd2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Line p is defined by 2y + 8x = 11. Line r is perpendicular to line p in the xy-plane. What is the slope of line r?$qb$, null, $qb$[{"label": "A", "body": "-4"}, {"label": "B", "body": "- 1/4"}, {"label": "C", "body": "1/4"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that line p is defined by the equation 2y + 8x = 11. The equation can be written in slope-intercept form y = mx
+ b, where m represents the slope of the line. Subtracting 8x from both sides of the equation 2y + 8x = 11 yields 2y = -8x + 11. Dividing
both sides of this equation by 2 yields y = -4x + 11/2 . Therefore, the slope of line p in the xy-plane is -4. It's also given that line p is
perpendicular to line r. Perpendicular lines have slopes that are negative reciprocals of each other, so the slope of line r is - 1/(-4) = 1/4 .
Choice A is incorrect. This is the slope of line p, not line r.
Choice B is incorrect. This is the reciprocal, not the negative reciprocal, of the slope of line p.
Choice D is incorrect. This is the negative, not the negative reciprocal, of the slope of line p.$qb$);
select seed_pool_question($qb$CB-27f5fff3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$- (?? 10II??6800??66??88 ?)/(?10II-/--/--/--/--/-00 -888 -666 -444 --222÷÷÷÷10II86420044662288? 222 444 666 888 10II00)|| || || || || || || || || || | || || || || || || || || || || | x
If a new graph of three linear equations is created using the system of equations shown and the equation x + 4y = -16, how many solutions
(x, y) will the resulting system of three equations have?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-27f5fff3.png$qb$, $qb$[{"label": "A", "body": "Zero"}, {"label": "B", "body": "Exactly one"}, {"label": "C", "body": "Exactly two"}, {"label": "D", "body": "Infinitely many"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A solution to a system of equations must satisfy each equation in the system. It follows that if an ordered pair (x, y) is a
solution to the system, the point (x, y) lies on the graph in the xy-plane of each equation in the system. The only point that lies on each graph of
the system of two linear equations shown is their intersection point (8, 2) . It follows that if a new graph of three linear equations is created
using the system of equations shown and the graph of x + 4y = -16, this system has either zero solutions or one solution, the point (8, 2).
Substituting 8 for x and 2 for y in the equation x + 4y = -16 yields 8 + 4(2) = -16, or 16 = -16. Since this equation is not true, the point
(8, 2) does not lie on the graph of x + 4y = -16. Therefore, (8, 2) is not a solution to the system of three equations. It follows that there are
zero solutions to this system.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-535fa6e6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Davio bought some potatoes and celery. The potatoes cost $0·69 per pound, and the celery cost $0·99 per pound. If Davio spent $5·34 in total
and bought twice as many pounds of celery as pounds of potatoes, how many pounds of celery did Davio buy?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "2·5"}, {"label": "C", "body": "2·67"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Let p represent the number of pounds of potatoes and let c represent the number of pounds of celery that Davio bought. It’s
given that potatoes cost $0·69 per pound and celery costs $0·99 per pound. If Davio spent $5·34 in total, then the equation 0·69p + 0·99c
= 5·34 represents this situation. It’s also given that Davio bought twice as many pounds of celery as pounds of potatoes; therefore, c = 2p.
Substituting 2p for c in the equation 0·69p + 0·99c = 5·34 yields 0·69p + 0·99(2p) = 5·34, which is equivalent to 0·69p + 1·98p = 5·34, or
2·67p = 5·34. Dividing both sides of this equation by 2·67 yields p = 2. Substituting 2 for p in the equation c = 2p yields c = 2(2) , or c = 4.
Therefore, Davio bought 4 pounds of celery.
Choice A is incorrect. This is the number of pounds of potatoes, not the number of pounds of celery, Davio bought.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a73a5c22$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function g is defined by g(x) = 10x + 8. What is the value of g(x) when x = 8?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "8"}, {"label": "C", "body": "10"}, {"label": "D", "body": "88"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The value of g(x) when x = 8 can be found by substituting 8 for x in the given equation g(x) = 10x + 8. This yields g(8)
= 10(8) + 8, or g(8) = 88. Therefore, when x = 8, the value of g(x) is 88.
Choice A is incorrect. This is the value of x when g(x) = 8, rather than the value of g(x) when x = 8.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6fa593f1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If x = 40, what is the value of x + 6?$qb$, null, $qb$[{"label": "A", "body": "34"}, {"label": "B", "body": "40"}, {"label": "C", "body": "46"}, {"label": "D", "body": "64"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that x = 40. Adding 6 to both sides of this equation yields x + 6 = 40 + 6, or x + 6 = 46. Therefore, the value
of x + 6 is 46.
Choice A is incorrect. This is the value of x - 6, not x + 6.
Choice B is incorrect. This is the value of x, not x + 6.
Choice D is incorrect. This is the value of x + 24, not x + 6.$qb$);
select seed_pool_question($qb$CB-8c515062$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A candle is made of 17 ounces of wax. When the candle is burning, the amount of wax in the candle decreases by 1 ounce every 4 hours. If 6
ounces of wax remain in this candle, for how many hours has it been burning?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "6"}, {"label": "C", "body": "24"}, {"label": "D", "body": "44"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the candle starts with 17 ounces of wax and has 6 ounces of wax remaining after a period of time has passed.
The amount of wax the candle has lost during the time period can be found by subtracting the remaining amount of wax from the amount of wax
the candle was made of, which yields 17 - 6 ounces, or 11 ounces. This means the candle loses 11 ounces of wax during that period of time.
It’s given that the amount of wax decreases by 1 ounce every 4 hours. If h represents the number of hours the candle has been burning, it follows
that 1/4 = 11/h . Multiplying both sides of this equation by 4h yields h = 44. Therefore, the candle has been burning for 44 hours.
Choice A is incorrect and may result from using the equation 1/4 = h/11 rather than 1/4 = 11/h to represent the situation, and then rounding to the
nearest whole number.
Choice B is incorrect. This is the amount of wax, in ounces, remaining in the candle, not the number of hours it has been burning.
Choice C is incorrect and may result from using the equation 1/4 = 6/h rather than 1/4 = 11/h to represent the situation.$qb$);
select seed_pool_question($qb$CB-4b76c7f1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the given system of equations, a is a constant. If the system has infinitely many solutions, what is the value of a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4b76c7f1.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "9"}, {"label": "C", "body": "36"}, {"label": "D", "body": "54"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A system of two linear equations has infinitely many solutions if one equation is equivalent to the other. This means that
when the two equations are written in the same form, each coefficient or constant in one equation is equal to the corresponding coefficient or
constant in the other equation multiplied by the same number. The equations in the given system of equations are written in the same form, with
x and y on the left-hand side of the equation and a constant on the right-hand side of the equation. The coefficients of x and y in the second
equation are equal to the coefficients of x and y, respectively, in the first equation multiplied by 4:  and . Therefore, the
constant in the second equation must be equal to 4 times the constant in the first equation: , or .
Choices A, B, and D are incorrect. When , , or , the given system of equations has no solution.$qb$);
select seed_pool_question($qb$CB-1993561d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For the linear function f, the graph of y= f(x) in the xy-plane has a slope of 1/4 and passes through the point (0, 5). Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 1/4x + 5"}, {"label": "B", "body": "f(x) = 1/4 x + 1/5"}, {"label": "C", "body": "f(x) = 1/4 x - 5/4"}, {"label": "D", "body": "f(x) = 1/4 x - 5"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. An equation that defines a linear function f can be written in the form f(x) = mx + b, where m is the slope of the graph of
y= f(x) in the xy-plane and is the y-intercept of the graph. It’s given that for the linear function f, the graph of y = f(x) in the xy-plane
has a slope of . Therefore, m(0=, b()1)/(b^(4))= 5. It’s also given that the graph of y = f(x) passes through the point (0, 5) . Therefore, the y-intercept of the
(0, 5) 1/4
graph is , and it follows that . Substituting 1/4 for m and 5 for b in the equation f(x) = mx + b yields f(x) = 1/4x + 5.
Choice B is incorrect. This equation defines a function whose graph has a y-intercept of (0, 1/5) , not (0, 5).
Choice C is incorrect. This equation defines a function whose graph has a y-intercept of (0, -5/4) , not (0, 5) .
Choice D is incorrect. This equation defines a function whose graph has a y-intercept of (0, -5) , not (0, 5).$qb$);
select seed_pool_question($qb$CB-b64e2c7f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Monarch butterflies can fly only with a body temperature of at least 55·0 degreeS Fahrenheit (?F) . If a monarch butterfly's body temperature
is 51·3^(°)F, what is the minimum increase needed in its body temperature, in ^(?)F, so that it can fly?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b64e2c7f.png$qb$, $qb$[{"label": "A", "body": "1·3"}, {"label": "B", "body": "3·7"}, {"label": "C", "body": "5·0"}, {"label": "D", "body": "6·3"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that monarch butterflies can fly only with a body temperature of at least 55·0 degreeS Fahrenheit (?F). Let x
represent the minimum increase needed in the monarch butterfly's body temperature to fly. If the monarch butterfly's body temperature is 51·3
^(°)F, the inequality 51·3 + x ≥ 55·0 represents this situation. Subtracting 51·3 from both sides of this inequality yields x ≥ 3·7. Therefore, if the
monarch butterfly's body temperature is 51·3^(?)F, the minimum increase needed in its body temperature, in ^(°)F, so that it can fly is 3·7.
Choice A is incorrect. This is the minimum increase needed in body temperature if the monarch butterfly's body temperature is 53·7^(°)F, not 51·3
^(°)F.
Choice C is incorrect. This is the minimum increase needed in body temperature if the monarch butterfly's body temperature is 50·0^(°)F, not 51·3
^(°)F.
Choice D is incorrect. This is the minimum increase needed in body temperature if the monarch butterfly's body temperature is 48·7^(°)F, not 51·3
^(°)F.$qb$);
select seed_pool_question($qb$CB-49800634$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
-/18-/(?-7 |)?? ||(-y)/48-/(-52 |)||
The table shows two values of x and their corresponding values of y. In the xy-plane, the graph of the linear equation representing this
relationship passes through the point ( 1/7 , a) . What is the value of a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-49800634.png$qb$, $qb$[{"label": "A", "body": "- 4/11"}, {"label": "B", "body": "- 4/77"}, {"label": "C", "body": "4/7"}, {"label": "D", "body": "172/7"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The linear relationship between x and y can be represented by the equation y = mx + b, where m is the slope of the graph
of this equation in the xy-plane and b is the y-coordinate of the y-intercept. The slope of a line between any two points  and  on
((^(x)7^(2),^(,)5y2^(2)))
the line can be calculated using the slope formula . Based on the table, the graph contains the points  and .
m = ((y2-y1)/(xx22-, xy12) ) m-4=8 (52-(-(-14(88^(x)),)/(=7-4(-(-^(1)81))81-),+y481b))
Substituting (-18, -48) and (7, 52) for (x1 , y1 ) and , respectively, in the slope formula yields , which is equivalent to
m = 10o/25 , or m = 4. Substituting 4 for m, -18 for x, and -48 for y in the equation y = mx + b yields , or -48 = -72
+ b. Adding 72 to both sides of this equation yields 24 = b. Therefore, m = 4 and b = 24. Substituting 4 for m and 24 for b in the equation y
= mx + b yields y = 4x + 24. Thus, the equation y = 4x + 24 represents the linear relationship between x and y. It's also given that the
graph of the linear equation representing this relationship in the xy-plane passes through the point ( 1/7 , a) . Substituting 1/7 for x and a for y in the
equation y = 4x + 24 yields a = 4(1/7) + 24, which is equivalent to a = 4/7 + 168/7 , or a = 172/7 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7d6928bd$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A cleaning service that cleans both offices and homes can clean at most 14 places per day. Which inequality represents this situation, where f is
the number of offices and h is the number of homes?$qb$, null, $qb$[{"label": "A", "body": "f + h ≤ 14"}, {"label": "B", "body": "f + h ≥ 14"}, {"label": "C", "body": "f - h ≤ 14"}, {"label": "D", "body": "f - h ≥ 14"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the cleaning service cleans both offices and homes, where f is the number of offices and h is the number of
homes the cleaning service can clean per day. Therefore, the expression f + h represents the number of places the cleaning service can clean
per day. It's also given that the cleaning service can clean at most 14 places per day. Since f + h represents the number of places the cleaning
service can clean per day and the service can clean at most 14 places per day, it follows that the inequality f+ h ≤ 14 represents this situation.
Choice B is incorrect. This inequality represents a cleaning service that cleans at least 14 places per day.
Choice C is incorrect. This inequality represents a cleaning service that cleans at most 14 more offices than homes per day.
Choice D is incorrect. This inequality represents a cleaning service that cleans at least 14 more offices than homes per day.$qb$);
select seed_pool_question($qb$CB-a04190b7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A store sells two different-sized containers of blueberries. The store’s sales of these blueberries totaled 896·86 dollars last month. The equation
4·51x + 6·07y = 896·86 represents this situation, where x is the number of smaller containers sold and y is the number of larger containers
sold. According to the equation, what is the price, in dollars, of each smaller container?$qb$, null, null, null, array[$qb$4.51$qb$, $qb$451/100$qb$]::text[], $qb$The correct answer is 4·51 . It’s given that the equation 4·51x + 6·07y = 896·86 represents this situation, where x is the number of smaller
containers sold, y is the number of larger containers sold, and 896·86 is the store’s total sales, in dollars, of blueberries last month. Therefore,
4·51x represents the store's sales, in dollars, of smaller containers, and 6·07y represents the store's sales, in dollars, of larger containers. Since
x is the number of smaller containers sold, the price, in dollars, of each smaller container is 4·51.$qb$);
select seed_pool_question($qb$CB-d1aeb6f1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$10x = 110
6x - 63 = y
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, $qb$[{"label": "A", "body": "63"}, {"label": "B", "body": "11"}, {"label": "C", "body": "10"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Dividing both sides of the equation 10x = 110 by 10 yields x = 11. Substituting 11 for x in the equation 6x - 63 = y
yields 6(11) - 63 = y, which is equivalent to 66 - 63 = y, or 3 = y. Therefore, the value of y is 3.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of x, not y.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5ad6bc97$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$f(x) = 7x + 1
The function gives the total number of people on a company retreat with x managers. What is the total number of people on a company retreat
with 7 managers?$qb$, null, null, null, array[$qb$50$qb$]::text[], $qb$The correct answer is 50. It's given that the function f gives the total number of people on a company retreat with x managers. It's also given
that 7 managers are on the company retreat. Substituting 7 for x in the given function yields f(7) = 7(7) + 1 , or f(7) = 50. Therefore, there
are a total of 50 people on a company retreat with 7 managers.$qb$);
select seed_pool_question($qb$CB-a8e6bd75$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is the graph of the equation in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a8e6bd75.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. In the xy-plane, the graph of the equation , where m and b are constants, is a line with slope m and y-intercept
. Therefore, the graph of  in the xy-plane is a line with slope 2 and a y-intercept . Having a slope of 2 means that for
each increase in x by 1, the value of y increases by 2. Only the graph in choice D has a slope of 2 and crosses the y-axis at . Therefore,
the graph shown in choice D must be the correct answer.
Choices A, B, and C are incorrect. The graph of  in the xy-plane is a line with slope 2 and a y-intercept at . The graph in
choice A crosses the y-axis at the point , not , and it has a slope of , not 2. The graph in choice B crosses the y-axis at
; however, the slope of this line is , not 2. The graph in choice C has a slope of 2; however, the graph crosses the y-axis at , not
.$qb$);
select seed_pool_question($qb$CB-948087f2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-/(|-?)| ?
Which of the following ordered pairs (x, y) satisfies the system of inequalities above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-948087f2.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Any point (x, y) that is a solution to the given system of inequalities must satisfy both inequalities in the system. The second
inequality in the system can be rewritten as . Of the given answer choices, only choice D satisfies this inequality, because inequality
is a true statement. The point  also satisfies the first inequality.
Alternate approach: Substituting  into the first inequality gives , or , which is a true statement. Substituting
into the second inequality gives , or , which is a true statement. Therefore, since  satisfies both
inequalities, it is a solution to the system.
Choice A is incorrect because substituting −2 for x and −1 for y in the first inequality gives , or , which is false.
Choice B is incorrect because substituting −1 for x and 3 for y in the first inequality gives , or , which is false. Choice C
is incorrect because substituting 1 for x and 5 for y in the first inequality gives , or , which is false.$qb$);
select seed_pool_question($qb$CB-00b9bd37$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y
50
40
30
|||||||?
Number of sweatshirts 20
10
x
O 20 40 60 80 100
Number of T-shirts
The graph models the relationship between the number of T-shirts, x, and the number of sweatshirts, y, that Kira can purchase for a school
fundraiser. Which equation could represent this relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-00b9bd37.png$qb$, $qb$[{"label": "A", "body": "y = 7x + 18"}, {"label": "B", "body": "7x + 18y = 630"}, {"label": "C", "body": "y = 18x + 7"}, {"label": "D", "body": "18x + 7y = 630"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A line in the xy-plane can be written as y = mx + b, where m is the slope of the line and b is the y-coordinate of the y-
intercept. The graph shown is a line passing through the points (0, 35) and (90, 0). Substituting 0 for x and 35 for y in the equation y = mx
+ b yields 35 = m(0) + b, or 35 = b. Substituting 35 for b90,  for x, and 0 for y in the equation y = mx + b yields 0 = 90m + 35.
Subtracting 35 from both sides of this equation yields -35 = 90m. Dividing both sides of this equation by 90 yields - 35/90 = m, or .
-17/818 = m
Substituting  for m and 35 for b in the equation y = mx + b yields y = - 7/18 x + 35. Multiplying both sides of this equation by  yields
18y = -7x -+7/(^(1)3^(8)5) (18)
, or 18y = -7x + 630. Adding 7x to both sides of this equation yields 7x + 18y = 630. Therefore, the equation 7x
+ 18y = 630 represents the relationship between x and y modeled by the graph.
Choice A is incorrect. The point (0, 35) is not on the graph of this equation, since 7(0) + 18 = 18, not 35.
Choice C is incorrect. The point (0, 35) is not on the graph of this equation, since 18(0) + 7 = 7, not 35.
Choice D is incorrect. The point (90, 0) is not on the graph of this equation, since 18(90) + 7(0) = 1,620, not 630.$qb$);
select seed_pool_question($qb$CB-73b3b7d8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$5y = 10x + 11
-5y = 5x - 21
The solution to the given system of equations is (x, y) . What is the value of 30x?$qb$, null, null, null, array[$qb$20$qb$]::text[], $qb$The correct answer is 20. Adding the first equation to the second equation in the given system yields 5y - 5y = 10x + 5x + 11 - 21, or 0
= 15x - 10. Adding 10 to both sides of this equation yields 10 = 15x. Multiplying both sides of this equation by 2 yields 20 = 30x. Therefore,
the value of 30x is 20.$qb$);
select seed_pool_question($qb$CB-beca03de$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A rectangle has a length that is 15 times its width. The function y = (15w)(w) represents this situation, where y is the area, in square feet, of
the rectangle and y > 0. Which of the following is the best interpretation of 15w in this context?$qb$, null, $qb$[{"label": "A", "body": "The length of the rectangle, in feet"}, {"label": "B", "body": "The area of the rectangle, in square feet"}, {"label": "C", "body": "The difference between the length and the width of the rectangle, in feet"}, {"label": "D", "body": "The width of the rectangle, in feet"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a rectangle has a length that is 15 times its width. It's also given that the function y = (15w)(w) represents
this situation, where y is the area, in square feet, of the rectangle and y > 0. The area of a rectangle can be calculated by multiplying the
rectangle's length by its width. Since the rectangle has a length that is 15 times its width, it follows that w represents the width of the rectangle,
in feet, and 15w represents the length of the rectangle, in feet. Therefore, the best interpretation of 15w in this context is that it's the length of
the rectangle, in feet.
Choice B is incorrect. This is the best interpretation of y, not 15w, in the given function.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect. This is the best interpretation of w, not 15w, in the given function.$qb$);
select seed_pool_question($qb$CB-512bd5b4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f (x) = 27(1·20) ?/3
For the given function f, the value of f(x) increases by p% for every increase of x by 6. What is the value of p?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-512bd5b4.png$qb$, null, null, array[$qb$44$qb$]::text[], $qb$The correct answer is 44. For a function defined by an equation of the form f (x) = a ( 1 + r/100 ) ?/? , where a r, , and k are positive constants, the
value of f(x) increases by r% for every increase of x by k. The given equation can be rewritten as f (x) = 27(1·20) 2x/6 , or f(x)
, which is equivalent to f (x) = 27(1·44) ?/6 , or . This equation is of the form f (x) = a ( 1 + r/10o ) ?/? ,
= 27(a(1=·2)227) ?/r6 = 44 f (x) = 27(1 + 44/(4^(1)4^(0)%^(o))) ?/6
where , , and k = 6. It follows that the value of f(x) increases by for every increase of x by 6. Therefore, the value of p is
44.
Alternate approach: It's given that f (x) = 27(1·20) x/3 . An increase in the value of x by 6 can be represented by the expression . The value
f (x + 6) = 27(1·20) (xx++6)/3 6
of f(x + 6) can be found by substituting x + 6 for x in the equation f (x) = 27(1·20) ?/3 , which yields . By the
product property of exponents, this equation is equivalent to f (x + 6) = 27(1·20) ?/3 · (1·20) 6/3 , or f (x + 6) = 27(1·20) ?/3 · (1·20)2, which
can be rewritten as f (x + 6) = 27(1·20) ?/3 · . Since f (x) = 27(1·20) ?/3 , it follows that . Therefore, for any
(1·4444%) f(x+ 6) = f(xf) ·(x(1)·44)
value of x, the value of f(x + 6) is 1·44 times, or  greater than, the value of f(x) . It's given that the value of  increases by p% for
every increase in the value of x by 6. It follows that the value of p is 44.$qb$);
select seed_pool_question($qb$CB-4e18fc5d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$v = - w/150x
The given equation relates the distinct positive numbers v w, , and x. Which equation correctly expresses w in terms of v and x?$qb$, null, $qb$[{"label": "A", "body": "w = - 150vx"}, {"label": "B", "body": "w = - 15ov/x"}, {"label": "C", "body": "w = - x/150v"}, {"label": "D", "body": "w = v + 150x"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that x is positive. Therefore, multiplying each side of the given equation by -150x yields - 150xv = w, which is
equivalent to w = - 150vx. Thus, the equation w = - 150vx correctly expresses w in terms of v and x.
Choice B is incorrect. This equation is equivalent to v = - wx/150 .
Choice C is incorrect. This equation is equivalent to v = - x/150w .
Choice D is incorrect. This equation is equivalent to v = w - 150x.$qb$);
select seed_pool_question($qb$CB-f5c3e3b8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to (m4q4z-1 ) (mq5z3) , where mq, , and z are positive?$qb$, null, $qb$[{"label": "A", "body": "m4q20z-3"}, {"label": "B", "body": "m5q9z2"}, {"label": "C", "body": "m6q8z-1"}, {"label": "D", "body": "m20q12z-2"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Applying the commutative property of multiplication, the expression  can be rewritten as
(m4q4z(m-14)m(m) (qq54zq35)) (z-1z3)
. For positive values of x, (x^(a)) (xb) = x^(a)+b. Therefore, the expression can be rewritten as
((mm44+m1)) ((qq44+q55)) ((zz--11+z33))
, or m5q9z2 .
Choice A is incorrect and may result from multiplying, not adding, the exponents.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a5663025$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A system of equations consists of a quadratic equation and a linear equation. The equations in this system are graphed in the xy-plane above.
How many solutions does this system have?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a5663025.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "2"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The solutions to a system of two equations correspond to points where the graphs of the equations intersect. The given
graphs intersect at 2 points; therefore, the system has 2 solutions.
Choice A is incorrect because the graphs intersect. Choice B is incorrect because the graphs intersect more than once. Choice D is incorrect. It’s
not possible for the graph of a quadratic equation and the graph of a linear equation to intersect more than twice.$qb$);
select seed_pool_question($qb$CB-3c95093c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following inequalities is equivalent to the inequality above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3c95093c.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Both sides of the given inequality can be divided by 3 to yield .
Choices A, C, and D are incorrect because they are not equivalent to (do not have the same solution set as) the given inequality. For example, the
ordered pair  is a solution to the given inequality, but it is not a solution to any of the inequalities in choices A, C, or D.$qb$);
select seed_pool_question($qb$CB-d0a7871e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If  is a solution to the system of equations above, which of the following could be the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d0a7871e.png$qb$, $qb$[{"label": "A", "body": "–1"}, {"label": "B", "body": "0"}, {"label": "C", "body": "2"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It is given that y = x + 1 and y = x2 + x. Setting the values for y equal to each other yields x + 1 = x2 + x. Subtracting x from
each side of this equation yields x2 = 1. Therefore, x can equal 1 or –1. Of these, only –1 is given as a choice.
Choice B is incorrect. If x = 0, then x + 1 = 1, but x2 + x = 02 + 0 = 0 ≠︀ 1. Choice C is incorrect. If x = 2, then x + 1 = 3, but x2 + x = 22 + 2 = 6 ≠︀ 3.
Choice D is incorrect. If x = 3, then x + 1 = 4, but x2 + x = 32 + 3 = 12 ≠︀ 4.$qb$);
select seed_pool_question($qb$CB-72ebc024$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 16x3y2 + 14xy?$qb$, null, $qb$[{"label": "A", "body": "2xy(8xy + 7)"}, {"label": "B", "body": "2xy(8x^(2)y + 7)"}, {"label": "C", "body": "14xy(2x^(2)y + 1)"}, {"label": "D", "body": "14xy(8x^(2)y + 1)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since 2xy is a common factor of each term in the given expression, the expression can be rewritten as 2xy(8x^(2)y + 7) .
Choice A is incorrect. This expression is equivalent to 16x2y2 + 14xy.
Choice C is incorrect. This expression is equivalent to 28x3y2 + 14xy.
Choice D is incorrect. This expression is equivalent to 112x3y^(2) + 14xy.$qb$);
select seed_pool_question($qb$CB-dd4ab4c4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is a factor of the polynomial above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dd4ab4c4.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The first and last terms of the polynomial are both squares such that and . The second term
is twice the product of the square root of the first and last terms: . Therefore, the polynomial is the square of a binomial
such that , and  is a factor.
Choice A is incorrect and may be the result of incorrectly factoring the polynomial. Choice C is incorrect and may be the result of dividing the
second and third terms of the polynomial by their greatest common factor. Choice D is incorrect and may be the result of not factoring the
coefficients.$qb$);
select seed_pool_question($qb$CB-b8caaf84$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If  and , which of the following is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b8caaf84.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that  and . Substituting the values for p and v into the expression  yields
. Multiplying the terms  yields . Using the distributive
property to rewrite  yields . Therefore, the entire expression can be represented as
. Combining like terms yields .
Choice A is incorrect and may result from subtracting, instead of adding, the term . Choice C is incorrect. This is the result of multiplying
the terms . Choice D is incorrect and may result from distributing 2, instead of , to the term .$qb$);
select seed_pool_question($qb$CB-f01108a8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = 9 ( a/7 ) x+c - b
How many times does the graph of the given equation in the xy-plane cross the x-axis, where ab, , and c are positive constants such that a > 7
and b > c?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f01108a8.png$qb$, $qb$[{"label": "A", "body": "Zero"}, {"label": "B", "body": "One"}, {"label": "C", "body": "Two"}, {"label": "D", "body": "Three"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that y = 9 ( a/7 ) x+c - b, where ab, , and c are positive constants such that a > 7 and b > c. The graph of any
equation in the xy-plane crosses the x-axis when there is a point on the graph for which the value of y is equal to 0, and the value of y changes
sign when the graph passes through that point. Since a > 7, the base  is greater than 1, so the expression 9 ( a/7 ) x+c - b increases as x
y = 9 ( a/7a/()7)x+c - b
increases. Since b is positive, there is a point on the graph of  for which the value of y is equal to 0. When the graph passes
through this point, the value of y changes sign from negative to positive. Therefore, the graph of the given equation crosses the x-axis exactly
one time.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7f81d0c3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What values satisfy the equation above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7f81d0c3.png$qb$, $qb$[{"label": "A", "body": "and"}, {"label": "B", "body": "and"}, {"label": "C", "body": "and"}, {"label": "D", "body": "and"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Using the quadratic formula to solve the given expression yields .
Therefore,  and  satisfy the given equation.
Choices A and B are incorrect and may result from incorrectly factoring or incorrectly applying the quadratic formula. Choice D is incorrect and
may result from a sign error.$qb$);
select seed_pool_question($qb$CB-332cd67b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$3x^(2) - 15x + 18 = 0
How many distinct real solutions are there to the given equation?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The number of solutions to a quadratic equation of the form ax2 + bx + c = 0, where ab, , and c are constants, can be
determined by the value of the discriminant, b2 - 4ac. If the value of the discriminant is positive, then the quadratic equation has exactly two
distinct real solutions. If the value of the discriminant is equal to zero, then the quadratic equation has exactly one real solution. If the value of
the discriminant is negative, then the quadratic equation has zero real solutions. In the given equation, 3x^(2) - 15x + 18 = 0, a = 3b = -15, ,
and c = 18. Substituting 3 for a, -15 for b, and 18 for c in b2 - 4ac yields (-15)^(2) - 4(3)(18), or 9. Since the value of the discriminant is
positive, the given equation has exactly two distinct real solutions.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-301faf80$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The product of two positive integers is 462. If the first integer is 5 greater than twice the second integer, what is the smaller of the two integers?$qb$, null, null, null, array[$qb$14$qb$]::text[], $qb$The correct answer is 14. Let x represent the first integer and y represent the second integer. If the first integer is 5 greater than twice the
second integer, then x = 2y + 5. It's given that the product of the two integers is 462; therefore xy = 462. Substituting 2y + 5 for x in this
equation yields (2y + 5)(y) = 462, which can be written as 2y^(2) + 5y = 462. Subtracting 462 from each side of this equation yields 2y^(2) + 5y
- 462 = 0. The left-hand side of this equation can be factored by finding two values whose product is 2(-462), or -924, and whose sum is 5.
The two values whose product is -924 and whose sum is 5 are 33 and -28. Thus, the equation 2y^(2) + 5y - 462 = 0 can be rewritten as 2y2
- 28y + 33y - 462 = 0, which is equivalent to 2y(y - 14) + 33(y - 14) = 0, or (2y + 33)(y - 14) = 0. By the zero product property, it
follows that 2y + 33 = 0 or y- 14 = 0. Subtracting 33 from both sides of the equation 2y + 33 = 0 yields 2y = -33. Dividing both sides of
this equation by 2 yields y = - 33/2 . Since y is a positive integer, the value of y isn't - 33/2 . Adding 14 to both sides of the equation y- 14 = 0
yields y = 14. Substituting 14 for y in the equation xy = 462 yields x(14) = 462. Dividing both sides of this equation by 14 yields x = 33.
Therefore, the two integers are 14 and 33, so the smaller of the two integers is 14.$qb$);
select seed_pool_question($qb$CB-128c75e2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function g is defined by g(x) = (|^(x)|)/a - 14, where a < 0. What is the product of g(15a) and g(7a) ?$qb$, null, null, null, array[$qb$609$qb$]::text[], $qb$The correct answer is 609. It’s given that the function g is defined by , where a < 0. Substituting 15a for x in function  yields
g(15a) = (1g5?(^(ax)?)/a)-=1 (|x|)/(4^(a)) - 14 g(|^(a)|)/a =
g(15a) = (? 15a?)/a - 14. This function can be rewritten as , or g(15a) = 15 ((I^(a)|)/a) - 14. Since a < 0, it follows that
-1. Substituting -1 for  in  yields , or g(15a) = -29. Similarly, substituting 7a for x in
g(7a) (|^(a)|)/(=a)(?7^(a)|)/ag-(1154a) = 15 ((?^(a)?)/a) - 14 g(15a)g=(71a5)(=-1(7)|^(a)-|)/a -1414
function g yields . This function can be rewritten as , or . Since a < 0, it again
g(7a) = 7g((|^(a)|)/((^(a)7)a)) -= 1-421
follows that . Substituting -1 for (?a?)/a in  yields g(7a) = 7(-1) - 14, or . Therefore, g(15a) =
g( (|a|)/(7a^(a))) == --121 g(7a) =g7(7((?^(a)?)/(a)^(a))) (--1249)(-21)
-29 and . Thus, the product of g(15a) and  is , or 609.$qb$);
select seed_pool_question($qb$CB-71b74a44$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 7,400(0·87)^(x)
The given equation estimates the value, in dollars, of a certain piece of equipment x years after it was purchased. According to the given
equation, what was the estimated value, in dollars, of the piece of equipment at the time it was purchased?$qb$, null, $qb$[{"label": "A", "body": "740"}, {"label": "B", "body": "6,438"}, {"label": "C", "body": "7,400"}, {"label": "D", "body": "8,700"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that y = 7,400(0·87)^(x) estimates the value, in dollars, of a certain piece of equipment x years after it was
purchased. The estimated value of the piece of equipment at the time it was purchased corresponds to the value of y when x = 0. Substituting
0 for x in the equation y = 7,400(0·87)^(x) yields y = 7,400(0·87)^(0), which is equivalent to y = 7,400(1) , or y = 7,400. Therefore, the
estimated value, in dollars, of the piece of equipment at the time it was purchased was 7,400.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This was the estimated value, in dollars, of the piece of equipment 1 year after it was purchased.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7f2524bf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y
350
300
250
200||||||||?
Value (dollars)
150
100
50
x
O 4 8 12 16 20 24
Number of months
after purchase
The graph shown gives the estimated value, in dollars, of a tablet as a function of the number of months since it was purchased. What is the best
interpretation of the y-intercept of the graph in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7f2524bf.png$qb$, $qb$[{"label": "A", "body": "The estimated value of the tablet was $225 when it was purchased."}, {"label": "B", "body": "The estimated value of the tablet 24 months after it was purchased was $225."}, {"label": "C", "body": "The estimated value of the tablet had decreased by $225 in the 24 months after it was purchased."}, {"label": "D", "body": "The estimated value of the tablet decreased by approximately 2·25% each year after it was purchased."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the graph shown gives the estimated value y, in dollars, of a tablet as a function of the number of months since
it was purchased, x. The y-intercept of a graph is the point at which the graph intersects the y-axis, or when x is 0. The graph shown intersects
the y-axis at the point (0, 225) . It follows that 0 months after the tablet was purchased, or when the tablet was purchased, the estimated value
of the tablet was 225 dollars. Therefore, the best interpretation of the y-intercept is that the estimated value of the tablet was $225 when it was
purchased.
Choice B is incorrect. The estimated value of the tablet 24 months after it was purchased was $50, not $225.
Choice C is incorrect. The estimated value of the tablet had decreased by $225 - $50, or $175, not $225, in the 24 months after it was
purchased.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-e312081b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the given expression?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e312081b.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Using the associative and commutative properties of addition, the given expression  can be rewritten as
. Adding these like terms results in .
Choice A is incorrect and may result from adding . Choice C is incorrect and may result from adding .
Choice D is incorrect and may result from adding .$qb$);
select seed_pool_question($qb$CB-02060533$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
(?---27)/9-/21??? ||||3/05/() g()||||x) = (f(x))/(x+3)
The table shows three values of x and their corresponding values of , where  and f is a linear function. What is the y-intercept
of the graph of y= f(x) in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-02060533.png$qb$, $qb$[{"label": "A", "body": "(0, 36)"}, {"label": "B", "body": "(0, 12)"}, {"label": "C", "body": "(0, 4)"}, {"label": "D", "body": "(0, -9)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the table shows values of x and their corresponding values of g(x), where g(x) = (f(x))/(x+3) . It's also given that f
is a linear function. It follows that an equation that defines f can be written in the form f(x) = mx + b, where m represents the slope and b
represents the y-coordinate of the y-intercept (0, b) of the graph of  in the xy-plane. The slope of the graph of y = f(x) can be found
y =y=f(fx()x)
using two points, (x1 , y1 ) and (x2 , y2 ) , that are on the graph of , and the formula . Since the table shows values of x and
their corresponding values of g(x), substituting values of x and g(x) in the equation 3 =g(f(^(x)(-)27=))/(-24)m(f=(x))/(x+3)(y2-y1)/(x2 -x1) can be used to define function f. Using the
first pair of values from the table, x = -27 and , yields , or . Multiplying each side of this equation by -24
3 =y (f(-27))/(=-2f7+(x3))
yields , so the point 0 = (f(-9))/(-6)(-27, -72g) (x) = 3 is on the graph of . Using the second pair of values from the table, x = -9 and g(x)
= 0, yields -720==f((f-(-297))/(-9+3)()-27, -72), or . Multiplying each side of this equation by -6 yields 0 = f(-9), so the point (-9, 0) is on the graph of y
= f(x) . Substituting  and (-9, 0) for (x1 , y1 ) and (x2 , y2 ) , respectively, in the formula m = (y2-y1)/(x2 -x1) yields , or
m = (o-(-72))/(-^(9)-0(-^(27)))f(x)
m = 4. Substituting 4 for m in the equation f(x) = mx + b yields f(x) = 4x + b. Since 0 = f(-9) , substituting -9 for x and  for  in
the equation f(x) = 4x + b yields , or 0 = -36 + b. Adding 36 to both sides of this equation yields 36 = b. It follows that 36
0(0=, b4)(-9) + b
is the y-coordinate of the y-intercept  of the graph of y = f(x). Therefore, the y-intercept of the graph of y= f(x) is (0, 36) .
Choice B is incorrect. 12 is the y-coordinate of the y-intercept of the graph of y = g(x).
Choice C is incorrect. 4 is the slope of the graph of y= f(x) .
Choice D is incorrect. -9 is the x-coordinate of the x-intercept of the graph of y= f(x) .$qb$);
select seed_pool_question($qb$CB-52931bfa$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to (8x(x-7)-3(x-7))/(2x-14) , where x > 7?$qb$, null, $qb$[{"label": "A", "body": "(x-7)/5"}, {"label": "B", "body": "(8x-3)/2"}, {"label": "C", "body": "(8x^(2)-3x-14)/(2x-14)"}, {"label": "D", "body": "(8x^(2)-3x-77)/(2x-14)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given expression has a common factor of 2 in the denominator, so the expression can be rewritten as .
(8x(x-7)-3(x-7))/(^(2)((^(x)x-^(7)-) 7))
The three terms in this expression have a common factor of . Since it's given that x > 7x,  can't be equal to 7, which means
(8x(x(x--7)7-)3(x-7))/(2(x-7))
can't be equal to 0. Therefore, each term in the expression, , can be divided by (x - 7), which gives (8x-3)/2 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1e003284$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x = 49
y = √-x + 9
The graphs of the given equations intersect at the point (x, y) in the xy-plane. What is the value of y?$qb$, null, $qb$[{"label": "A", "body": "16"}, {"label": "B", "body": "40"}, {"label": "C", "body": "81"}, {"label": "D", "body": "130"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the graphs of the given equations intersect at the point (x, y) in the xy-plane. It follows that (x, y) represents a
solution to the system consisting of the given equations. The first equation given is x = 49. Substituting 49 for x in the second equation given,
, yields y = √-49 + 9, which is equivalent to y = 7 + 9, or y = 16. It follows that the graphs of the given equations intersect at the
y = √(4-^(x)9+, 169)
point . Therefore, the value of y is 16.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-91e7ea5e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The quadratic function h is defined as shown. In the xy-plane, the graph of  intersects the x-axis at the points and , where t
is a constant. What is the value of t ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-91e7ea5e.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "2"}, {"label": "C", "body": "4"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the graph of  intersects the x-axis at  and , where t is a constant. Since this graph
intersects the x-axis when  or when , it follows that  and . If , then . Adding
32 to both sides of this equation yields . Dividing both sides of this equation by 2 yields . Taking the square root
of both sides of this equation yields . Adding 4 to both sides of this equation yields . Therefore, the value of t is 8.
Choices A, B, and C are incorrect and may result from calculation errors.$qb$);
select seed_pool_question($qb$CB-e9aed539$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$--/--/--/--/--/-| | | | | ÷÷÷÷864224444466222288| ?| | | | | | | | | | | | x
The graph shown will be translated up 4 units. Which of the following will be the resulting graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e9aed539.png$qb$, $qb$[{"label": "A", "body": "--/--/--/--/--/-| | | | | ÷÷÷÷?8642??44??6622??88| | | | | | | | | | | | | x"}, {"label": "B", "body": "--/--/--/--/--/-| | ?| | | ÷÷÷?864224444466222288| | | | | | | | | | | | | x"}, {"label": "C", "body": "--/--/--/--/--/-| | | | | ÷÷÷÷864224444466222288| | | | | ?| | | | | | | | x"}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. When a graph is translated up 4 units, each point on the resulting graph is 4 units above the point on the original graph. In
other words, the y-value of each point on the graph increases by 4. The graph shown passes through the points , , and . It
(1, -(11, +-14)) ((22,,--22)+ 4) (3, -1)
follows that when the graph shown is translated up 4 units, the resulting graph will pass through the points , , and
. These points are (1, 3) , (2, 2) , and (3, 3) , respectively. Of the given choices, only the graph in choice A passes through the points
((31,^(,) 3-)1(+2,42))
, , and (3, 3) .
Choice B is incorrect. This is the result of translating the graph down, rather than up, 4 units.
Choice C is incorrect. This is the result of translating the graph left, rather than up, 4 units.
Choice D is incorrect. This is the result of translating the graph right, rather than up, 4 units.$qb$);
select seed_pool_question($qb$CB-358f18bc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = x^(2) - 48x + 2,304
What is the minimum value of the given function?$qb$, null, null, null, array[$qb$1728$qb$]::text[], $qb$The correct answer is 1,728. The given function can be rewritten in the form , where a is a positive constant and the
f(^(x)) =^(a)(^(x) - hf)(^(2)x+) =kx^(2) - 48x + 2,304
minimum value, k, of the function occurs when the value of x is h. By completing the square, can be written as f(x)
, or f(x) = (x - 24)^(2) + 1,728. This equation is in the form f(x) = a(x - h)^(2) + k, where a = 1,
= x2 - 48xk+=(48/(12,)7)228+ 2,304 - (48/2)2
h = 24, and . Therefore, the minimum value of the given function is 1,728.$qb$);
select seed_pool_question($qb$CB-3a9d60b2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$2|4 - x? + 3|4 - x| = 25
What is the positive solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3a9d60b2.png$qb$, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. The given equation can be rewritten as 5|4 - x| = 25. Dividing each side of this equation by 5 yields |4 - x? = 5. By
the definition of absolute value, if |4 - x? = 5, then 4 - x = 5 or 4 - x = -5. Subtracting 4 from each side of the equation 4 - x = 5 yields
-x = 1. Dividing each side of this equation by -1 yields x = - 1. Similarly, subtracting 4 from each side of the equation 4 - x = -5 yields
-x = -9. Dividing each side of this equation by -1 yields x = 9. Therefore, since the two solutions to the given equation are -1 and 9, the
positive solution to the given equation is 9.$qb$);
select seed_pool_question($qb$CB-8490cc45$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = (-8)(2)^(x) + 22. What is the y-intercept of the graph of y= f(x) in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "(0, 14)"}, {"label": "B", "body": "(0, 2)"}, {"label": "C", "body": "(0, 22)"}, {"label": "D", "body": "(0, -8)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The y-intercept of the graph of y= f(x) in the xy-plane occurs at the point on the graph where x = 0. In other words, when
x = 0, the corresponding value of  is the y-coordinate of the y-intercept. Substituting 0 for x in the given equation yields f(0) = (-8)(2)^(0)
f(0) =f((x-)8)(1) + 22
+ 22, which is equivalent to , or f(0) = 14. Thus, when x = 0, the corresponding value of f(x) is 14. Therefore, the y-
intercept of the graph of y= f(x) in the xy-plane is (0, 14) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This could be the y-intercept for f(x) = (-8)(2)^(x), not f(x) = (-8)(2)^(x) + 22.$qb$);
select seed_pool_question($qb$CB-4fbffc0a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?^(?)tm?See
dn?O??
1234567447766223355II?-/(-1II| 222| 333|)-/||?| | | |x
bOae?
???^(t)e?
?ime (SeC0ndS)
The graph shows the height above ground, in meters, of a ball x seconds after the ball was launched upward from a platform. Which statement
is the best interpretation of the marked point (1·0, 4·8) in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4fbffc0a.png$qb$, $qb$[{"label": "A", "body": "1·0 second after being launched, the ball's height above ground is 4·8 meters."}, {"label": "B", "body": "4·8 seconds after being launched, the ball's height above ground is 1·0 meter."}, {"label": "C", "body": "The ball was launched from an initial height of 1·0 meter with an initial velocity of 4·8 meters per second."}, {"label": "D", "body": "The ball was launched from an initial height of 4·8 meters with an initial velocity of 1·0 meter per second."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the graph shows the height above ground, in meters, of a ball x seconds after the ball was launched upward
from a platform. In the graph shown, the x-axis represents time, in seconds, and the y-axis represents the height of the ball above ground, in
meters. It follows that for the marked point (1·0, 4·8) , 1·00 represents the time, in seconds, after the ball was launched upward from a platform
and 4·80 represents the height of the ball above ground, in meters. Therefore, the best interpretation of the marked point (1·0, 4·8) is 1·00
second after being launched, the ball's height above ground is 4·80 meters.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-ebed7dc6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$An auditorium has seats for 1,800 people. Tickets to attend a show at the auditorium currently cost $4·00. For each $1·00 increase to the ticket
price, 100 fewer tickets will be sold. This situation can be modeled by the equation y = -100x^(2) + 1,400x + 7,200, where x represents the
increase in ticket price, in dollars, and y represents the revenue, in dollars, from ticket sales. If this equation is graphed in the xy-plane, at what
value of x is the maximum of the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ebed7dc6.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "7"}, {"label": "C", "body": "14"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the situation can be modeled by the equation y = -100x^(2) + 1,400x + 7,200, where x represents the
increase in ticket price, in dollars, and y represents the revenue, in dollars, from ticket sales. Since the coefficient of the x2 term is negative, the
graph of this equation in the xy-plane opens downward and reaches its maximum value at its vertex. If a quadratic equation in the form y = ax2
+ bx + c, where ab, , and c are constants, is graphed in the xy-plane, the x-coordinate of the vertex is equal to - b/2a . For the equation y =
-100x^(2) + 1,400x + 7,200a = -100b = 1,400, , , and c = 7,200. It follows that the x-coordinate of the vertex is - (1,40o)/(2(-100)) , or 7. Therefore,
if the given equation is graphed in the xy-plane, the maximum of the graph occurs at an x-value of 7.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ba0edc30$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x2 - 2x - 9 = 0
One solution to the given equation can be written as 1 + √-k, where k is a constant. What is the value of k?$qb$, null, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "10"}, {"label": "C", "body": "20"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Adding 9 to each side of the given equation yields x2 - 2x = 9. To complete the square, adding 1 to each side of this
equation yields x^(2) - 2x + 1 = 9 + 1, or . Taking the square root of each side of this equation yields x - 1 = ±√-10. Adding 1
x = 1 (?x √-(1))/10 2 = 10
to each side of this equation yields . Since it's given that one of the solutions to the equation can be written as 1 + √-k, the value
of k must be 10.
Alternate approach: It's given that 1 + √-k is a solution to the given equation. It follows that x = 1 + √-k. Substituting 1 + √-k for x in the
given equation yields (1 + √-k)^(2) , or . Expanding the products on the
-12+(12+√√/k-k+)k--92=-02√(/k 1-+9 √=-k0) (1k+-√1-k0)=-02(1 + √-k10) - 9 = 0
left-hand side of this equation yields , or . Adding  to each side of this equation yields
k = 10.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-39714777$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$p(x) + 57 = x^(2)
The given equation relates the value of x and its corresponding value of p(x) for the function p. What is the minimum value of the function p?$qb$, null, $qb$[{"label": "A", "body": "-3,249"}, {"label": "B", "body": "-57"}, {"label": "C", "body": "57"}, {"label": "D", "body": "3,249"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For a quadratic function defined by an equation of the form p(x) = a(x - h)^(2) + k, where ah, , and k are constants and a
> 0, the minimum value of the function is k. Subtracting 57 from both sides of the given equation yields p(x) = x2 - 57. This function is in the
form p(x) = a(x - h)^(2) + k, where a = 1, h = 0, and k = -57. Therefore, the minimum value of the function p is -57.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fc3d783a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, a line with equation 2y = 4·5 intersects a parabola at exactly one point. If the parabola has equation y = -4x2 + bx, where b
is a positive constant, what is the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fc3d783a.png$qb$, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. It’s given that a line with equation 2y = 4·5 intersects a parabola with equation y = -4x2 + bx, where b is a positive
constant, at exactly one point in the xy-plane. It follows that the system of equations consisting of 2y = 4·5 and y = -4x2 + bx has exactly
one solution. Dividing both sides of the equation of the line by 2 yields y = 2·25. Substituting 2·25 for y in the equation of the parabola yields
2·25 = -4x^(2) + bx. Adding 4x2 and subtracting bx from both sides of this equation yields 4x^(2) - bx + 2·25 = 0. A quadratic equation in the
form of ax2 + bx + c = 0, where ab, , and c are constants, has exactly one solution when the discriminant, b2 - 4ac, is equal to zero.
Substituting 4 for a and 2·25 for c in the expression b2 - 4ac and setting this expression equal to 0 yields b^(2) - 4(4) (2·25) = 0, or b^(2) - 36
= 0. Adding 36 to each side of this equation yields b^(2) = 36. Taking the square root of each side of this equation yields b = ±6. It’s given that b
is positive, so the value of b is 6.$qb$);
select seed_pool_question($qb$CB-a9084ca4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = 9,000(0·66)^(x)
The given function f models the number of advertisements a company sent to its clients each year, where x represents the number of years
since 1997, and 0 ≤ x ≤ 5. If y = f(x) is graphed in the xy-plane, which of the following is the best interpretation of the y-intercept of the
graph in this context?$qb$, null, $qb$[{"label": "A", "body": "The minimum estimated number of advertisements the company sent to its clients during the 5 years was 1,708."}, {"label": "B", "body": "The minimum estimated number of advertisements the company sent to its clients during the 5 years was 9,000."}, {"label": "C", "body": "The estimated number of advertisements the company sent to its clients in 1997 was 1,708."}, {"label": "D", "body": "The estimated number of advertisements the company sent to its clients in 1997 was 9,000."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The y-intercept of a graph in the xy-plane is the point where x = 0. For the given function f, the y-intercept of the graph of y
= f(x) in the xy-plane can be found by substituting 0 for x in the equation , which gives . This is
y = 9,00y0(=0·f66(x)^(x)) (0, 9,000)y = 9,000(0·66)^(o)
equivalent to y = 9,000(1), or y = 9,000. Therefore, the y-intercept of the graph of  is . It’s given that the function f
models the number of advertisements a company sent to its clients each year. Therefore, f(x) represents the estimated number of
advertisements the company sent to its clients each year. It's also given that x represents the number of years since 1997. Therefore, x = 0
represents 0 years since 1997, or 1997. Thus, the best interpretation of the y-intercept of the graph of y = f(x) is that the estimated number of
advertisements the company sent to its clients in 1997 was 9,000.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-075b29b0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to (9x3 + 5x + 7) + (6x3 + 5x^(2) - 5) ?$qb$, null, $qb$[{"label": "A", "body": "15x6 + 5x^(2) - 5x - 35"}, {"label": "B", "body": "15x3 + 10x^(2) + 2"}, {"label": "C", "body": "15x6 + 5x^(2) + 5x + 2"}, {"label": "D", "body": "15x3 + 5x^(2) + 5x + 2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given expression can be rewritten as (9x3 + 6x3) + 5x^(2) + 5x + (7 - 5) . Combining like terms in this expression
yields 15x3 + 5x^(2) + 5x + 2.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2c6f214f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The first term of a sequence is 9. Each term after the first is 4 times the preceding term. If w represents the nth term of the sequence, which
equation gives w in terms of n?$qb$, null, $qb$[{"label": "A", "body": "w = 4(9^(n))"}, {"label": "B", "body": "w = 4(9^(n)-^(1))"}, {"label": "C", "body": "w = 9(4^(n))"}, {"label": "D", "body": "w = 9(4^(n)-^(1))"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since w represents the nth term of the sequence and 9 is the first term of the sequence, the value of w is 9 when the value
of n is 1. Since each term after the first is 4 times the preceding term, the value of w is when the value of n is 2. Therefore, the value of w
9(4n-1)9(4)
is , or 9(4)^(2), when the value of n is 3. More generally, the value of w is for a given value of n. Therefore, the equation w
=99((44)n(-41))
gives w in terms of n.
Choice A is incorrect. This equation describes a sequence for which the first term is 36, rather than 9, and each term after the first is 9, rather
than 4, times the preceding term.
Choice B is incorrect. This equation describes a sequence for which the first term is 4, rather than 9, and each term after the first is 9, rather than
4, times the preceding term.
Choice C is incorrect. This equation describes a sequence for which the first term is 36, rather than 9.$qb$);
select seed_pool_question($qb$CB-781c2f6e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = a(2·2^(x) + 2·2b) , where a and b are integer constants and 0 < a < b. The functions g and h are equivalent
to function f, where k and m are constants. Which of the following equations displays the y-coordinate of the y-intercept of the graph of y
= f(x) in the xy-plane as a constant or coefficient?
I.
gh((xx)) == aa((22··22^(x))x++km)
II.$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A y-intercept of a graph in the xy-plane is a point where the graph intersects the y-axis, or a point where x = 0. Substituting 0
for x in the equation defining function f yields , or f(0) = a(1 + 2·2b) . So, the y-coordinate of the y-intercept of the
a + a(2·f2()0b) = a(2·2o + 2·2b)
graph is , or equivalently, . It's given that function g is equivalent to function f, where 0 < a < b. It follows that k
a(1 +a2(2·2·2b))b
= 2·2b. Since can't be equal to 0, the coefficient a can't be equal to a + a(2·2)b. Since 0 < a, the constant k, which is equal to 2·2b,
can't be equal to a + a(2·2)b. Therefore, function g doesn't display the y-coordinate of the y-intercept of the graph of y = f(x) in the xy-plane as
a constant or coefficient. It's also given that function h is equivalent to function f, where 0 < a < b. The equation defining f can be rewritten
as f(x) = a(2·2)^(x) + a(2·2)b. It follows that . Since a(2·2)b can't be equal to 0, the coefficient a can't be equal to a + a(2·2)b.
ma(=2·2a)(b2·2)b
Since 0 < a, the constant m, which is equal to , can't be equal to a + a(2·2)b. Therefore, function h doesn't display the y-coordinate of
the y-intercept of the graph of y= f(x) in the xy-plane as a constant or coefficient. Thus, neither function g nor function h displays the y-
coordinate of the y-intercept of the graph of y= f(x) in the xy-plane as a constant or coefficient.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cb29c54c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A physics class is planning an experiment about a toy rocket. The equation y = -16(x - 5·6)^(2) + 502 gives the estimated height y, in feet, of
the toy rocket x seconds after it is launched into the air. Which of the following is the best interpretation of the vertex of the graph of the
equation in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "This toy rocket reaches an estimated maximum height of 502 feet 16 seconds after it is launched into the air."}, {"label": "B", "body": "This toy rocket reaches an estimated maximum height of 502 feet 5·6 seconds after it is launched into the air."}, {"label": "C", "body": "This toy rocket reaches an estimated maximum height of 16 feet 502 seconds after it is launched into the air."}, {"label": "D", "body": "This toy rocket reaches an estimated maximum height of 5·6 feet 502 seconds after it is launched into the air."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The vertex of the graph of a quadratic equation is where it reaches its minimum or maximum value. When a quadratic
equation is written in the form , the vertex of the parabola represented by the equation is (x, y) = (h, k). In the given
y = -16(x - 5·6)^(2)y+=50^(a)2(^(x) - h)^(2) + k
equation , the value of h is 5·6 and the value of k is 502. It follows that the vertex of the graph of this equation in the
xy-plane is (x, y) = (5·6, 502). Additionally, since a = -16 in the given equation, the graph of the quadratic equation opens down, and the
vertex represents a maximum. It’s given that the value of y represents the estimated height, in feet, of the toy rocket x seconds after it is
launched into the air. Therefore, this toy rocket reaches an estimated maximum height of 502 feet 5·6 seconds after it is launched into the air.
Choice A is incorrect. The 16 in the equation is an indicator of how narrow the graph of the equation is rather than where it reaches its maximum.
Choice C is incorrect. The 16 in the equation is an indicator of how narrow the graph of the equation is rather than where it reaches its maximum.
Choice D is incorrect. This is an interpretation of the vertex of the graph of the equation y = -16(x - 502)^(2) + 5·6, not of the equation y =
-16(x - 5·6)^(2) + 502.$qb$);
select seed_pool_question($qb$CB-4661e2a9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which ordered pair is a solution to the system of equations above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4661e2a9.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The solution to the given system of equations can be found by solving the first equation for x, which gives , and
substituting that value of x into the second equation which gives . Rewriting this equation by adding like terms and
expanding  gives . Subtracting  from both sides of this equation gives . Adding to 2 to both
sides of this equation gives . Therefore, it follows that . Substituting  for y in the first equation yields .
Adding  to both sides of this equation yields . Therefore, the ordered pair  is a solution to the given system of
equations.
Choice B is incorrect. Substituting  for x and  for y in the first equation yields , or , which isn’t a true
statement. Choice C is incorrect. Substituting  for x and  for y in the second equation yields ,
or , which isn’t a true statement. Choice D is incorrect. Substituting  for x and  for y in the second
equation yields , or , which isn’t a true statement.$qb$);
select seed_pool_question($qb$CB-6abec9a8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(y|)/(-/--/--/--/--/--/-?-??÷÷÷121011118?420044??222288)|| || || || | || || || || | x
What is the y-intercept of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6abec9a8.png$qb$, $qb$[{"label": "A", "body": "(-1, -9)"}, {"label": "B", "body": "(0, -5)"}, {"label": "C", "body": "(0, -4)"}, {"label": "D", "body": "(0, 0)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The y-intercept of a graph in the xy-plane is the point (x, y) on the graph where x = 0. At x = 0, the corresponding value of
y is -5. Therefore, the y-intercept of the graph shown is (0, -5) .
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect. This is the y-intercept of a graph in the xy-plane that intersects the y-axis at y = -4, not y = -5.
Choice D is incorrect. This is the y-intercept of a graph in the xy-plane that intersects the y-axis at y = 0, not y = -5.$qb$);
select seed_pool_question($qb$CB-ad2ec615$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the expression  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ad2ec615.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The term x4 can be factored as . Factoring –6 as  yields values that add to –1, the coefficient of x2 in the
expression.
Choices A, C, and D are incorrect and may result from finding factors of –6 that don’t add to the coefficient of x2 in the original expression.$qb$);
select seed_pool_question($qb$CB-42c71eb5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the expression above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-42c71eb5.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given expression can be rewritten as . Applying the distributive property, the
expression can be rewritten as , or . Adding like terms
yields . Substituting  for  in the given expression yields . By the rules of exponents,
the expression  is equivalent to . Applying the distributive property, this expression can be rewritten as
, or . Adding like terms gives . Substituting
for  in the rewritten expression yields , and adding like terms yields .
Choices B, C, and D are incorrect. Choices C and D may result from rewriting the expression  as , instead of as
. Choices B and C may result from rewriting the expression  as , instead of .$qb$);
select seed_pool_question($qb$CB-52b1700c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Time (years) Total amount (dollars)
1/(|-^(2))|| |||(--604·00 |)/60642·/4(608·8)/t|||
Rosa opened a savings account at a bank. The table shows the exponential relationship between the time , in years, since Rosa opened the
account and the total amount n, in dollars, in the account. If Rosa made no additional deposits or withdrawals, which of the following equations
best represents the relationship between t and n?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-52b1700c.png$qb$, $qb$[{"label": "A", "body": "n = (1 + 604)^(t)"}, {"label": "B", "body": "n = (1 + 0·004)^(t)"}, {"label": "C", "body": "n = 604(1 + 0·004)^(t)"}, {"label": "D", "body": "n = 0·004(1 + 604)^(t)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the relationship between t and n is exponential. The table shows that the value of n increases as the value of t
increases. Therefore, the relationship between t and n can be represented by an increasing exponential equation of the form n = a(1 + b)^(t),
where a and b are positive constants. The table shows that when t = 0n = 604, . Substituting 0 for t and 604 for n in the equation n
= a(1 + b)^(t) yields 604 = a(1 + b)^(0), which is equivalent to 604 = a(1) , or 604 = a. Substituting 604 for a in the equation n = a(1 + b)^(t)
yields . The table also shows that when t = 1 , n = 606·42. Substituting 1 for t and 606·42 for n in the equation n
=1·060044^(n)=(1=1+6+b0)4b^(t)(1 + b)^(t) yields 606·42 = 604(1 + b)^(1) , or 606·42 = 604(1 + b). Dividing both sides of this equation by 604 yields approximately
. Subtracting 1 from both sides of this equation yields that the value of b is approximately 0·004. Substituting 0·004 for b in the
equation n = 604(1 + b)^(t) yields n = 604(1 + 0·004)^(t). Therefore, of the choices, choice C best represents the relationship between t and n.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-371cbf6b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation above is true for all x, where a and b are constants. What is the value of ab ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-371cbf6b.png$qb$, $qb$[{"label": "A", "body": "18"}, {"label": "B", "body": "20"}, {"label": "C", "body": "24"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If the equation is true for all x, then the expressions on both sides of the equation will be equivalent. Multiplying the
polynomials on the left-hand side of the equation gives . On the right-hand side of the equation,
the only -term is . Since the expressions on both sides of the equation are equivalent, it follows that ,
which can be rewritten as . Therefore, , which gives .
Choice A is incorrect. If , then the coefficient of  on the left-hand side of the equation would be , which doesn’t
equal the coefficient of , , on the right-hand side. Choice B is incorrect. If , then the coefficient of  on the left-hand side of
the equation would be , which doesn’t equal the coefficient of , , on the right-hand side. Choice D is incorrect. If
, then the coefficient of  on the left-hand side of the equation would be , which doesn’t equal the coefficient of
, , on the right-hand side.$qb$);
select seed_pool_question($qb$CB-b4acba95$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x^(2) - 12x + 27 = 0
How many distinct real solutions does the given equation have?$qb$, null, $qb$[{"label": "A", "body": "Exactly two"}, {"label": "B", "body": "Exactly one"}, {"label": "C", "body": "Zero"}, {"label": "D", "body": "Infinitely many"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The number of solutions of a quadratic equation of the form ax2 + bx + c = 0, where ab, , and c are constants, can be
determined by the value of the discriminant, b2 - 4ac. If the value of the discriminant is positive, then the quadratic equation has exactly two
distinct real solutions. If the value of the discriminant is equal to zero, then the quadratic equation has exactly one real solution. If the value of
the discriminant is negative, then the quadratic equation has zero real solutions. In the given equation, x^(2) - 12x + 27 = 0, a = 1, b = -12,
and c = 27. Substituting these values for ab, , and c in b2 - 4ac yields (-12)^(2) - 4(1)(27) , or 36. Since the value of its discriminant is
positive, the given equation has exactly two distinct real solutions.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ff8c5844$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-/1-/0??? ||||1/1(-25)/(| 1/(-625) |)||||
1
2
For the exponential function g, the table shows four values of x and their corresponding values of g(x). Which equation defines g?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ff8c5844.png$qb$, $qb$[{"label": "A", "body": "g(x) = -25^(x)"}, {"label": "B", "body": "g(x) = - ( 1/25 ) x"}, {"label": "C", "body": "g(x) = 25^(x)"}, {"label": "D", "body": "g(x) = ( 1/25 ) x"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that function g is exponential. Therefore, an equation defining g can be written in the form , where a
g(gx()x=) =a(ab()bx)^(x)
and b are constants. The table shows that when x = 0g(x) = 1, . Substituting 0 for x and 1 for  in the equation yields 1
gg((x^(x))) = (b)^(x)
= a(b)^(o), which is equivalent to 1 = a. Substituting 1 for a in the equation yields . The table also shows that when
x = 1, g(x) = 1/25 . Substituting 1 for x and  for g(x) in the equation g(x) = (1/25)x g(gx()x=) =(b)ax(b)x yields 1/25 = (b) 1 , which is equivalent to 1/25 = b.
g(x) =1/(^(2)(^(5)b))x
Substituting 1/25 for b in the equation  yields .
Choice A is incorrect. For this function, g(1) is equal to -25, not 1/25 .
Choice B is incorrect. For this function, g(1) is equal to - 1/25 , not 1/25 .
Choice C is incorrect. For this function, g(1) is equal to 25, not 1/25 .$qb$);
select seed_pool_question($qb$CB-a05bd3a4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a05bd3a4.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The expression can be written as a difference of squares x2 – y2, which can be factored as (x + y)(x – y). Here, y2 = 5, so
, and the expression therefore factors as .
Choices A and B are incorrect and may result from misunderstanding how to factor a difference of squares. Choice D is incorrect; (x + 5)(x – 1)
can be rewritten as x2 + 4x – 5, which is not equivalent to the original expression.$qb$);
select seed_pool_question($qb$CB-c3b116d7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following expressions is(are) a factor of 3x^(2) + 20x - 63?
I. x - 9
II. 3x - 7$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given expression can be factored by first finding two values whose sum is 20 and whose product is 3(-63), or -189.
Those two values are 27 and -7. It follows that the given expression can be rewritten as 3x^(2) + 27x - 7x - 63. Since the first two terms of
this expression have a common factor of 3x and the last two terms of this expression have a common factor of -7, this expression can be
rewritten as . Since the two terms of this expression have a common factor of (x + 9), it can be rewritten as
(3x - 7)(x3+x(9x) + 9) - 7(x + 9)
. Therefore, expression II, 3x - 7, is a factor of 3x^(2) + 20x - 63, but expression I, x - 9, is not a factor of 3x^(2) + 20x - 63.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f423771c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$2/(?-4 |)??? |||(-h(x))/12(· 3)/154·/(-1·94 |)|||
The table shows the exponential relationship between the number of years, x, since Hana started training in pole vault, and the estimated height
h(x) , in meters, of her best pole vault for that year. Which of the following functions best represents this relationship, where x ≤ 4?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f423771c.png$qb$, $qb$[{"label": "A", "body": "h(x) = 1·12(0·23)^(x)"}, {"label": "B", "body": "h(x) = 1·12(1·23)^(x)"}, {"label": "C", "body": "h(x) = 1·23(0·12)^(x)"}, {"label": "D", "body": "h(x) = 1·23(1·12)^(x)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The table shows an increasing exponential relationship between the number of years, x, since Hana started training in pole
vault and the estimated height h(x), in meters, of her best pole vault for that year. The relationship can be written as h(x) = Ca^(x) , where C and
a are positive constants. It's given that when x = 0, h(x) = 1·23. Substituting 0 for x and 1·23 for h(x) in h(x) = Ca^(x) yields 1·23 = Ca0 ,
or 1·23 = C. Substituting 1·23 for C in h(x) = Ca^(x) yields h(x) = 1·23a^(x). It's also given that when , . Substituting 2 for x
and 1·54 for h(x) in h(x) = 1·23a^(x) yields 1·54 = 1·23a^(2) . Dividing each side of this equation by 1·23x = 21 · 1(h1(·x54))/(12·23) == (11··2534a^(2))/(1·h23(x) ) = 1 ·23ax yields , or a2 is
approximately equal to 1·252. Since a is positive, a is approximately equal to √-1·252, or 1·12. Substituting  for a in  yields
h(x) = 1·23(1·12)^(x).
Choice A is incorrect. When x = 0, the value of h(x) in this function is equal to 1·12 rather than 1·23, and it is decreasing rather than
increasing.
Choice B is incorrect. When x = 0, the value of h(x) in this function is equal to 1·12 rather than 1·23.
Choice C is incorrect. This function is decreasing rather than increasing.$qb$);
select seed_pool_question($qb$CB-b8f13a3a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Function  is defined by f(x) = -a^(x) + b, where a and b are constants. In the xy-plane, the graph of y = f(x) - 12 has a y-intercept at
(0, -75/7)f
. The product of a and b is 320/7 . What is the value of a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b8f13a3a.png$qb$, null, null, array[$qb$20$qb$]::text[], $qb$The correct answer is 20. It’s given that f(x) = -a^(x) + b. Substituting -a^(x) + b for f(x) in the equation  yields y = -a^(x) + b
-y (=75)/7 f(x) - 12
- 12. It’s given that the y-intercept of the graph of y = f(x) - 12 is . Substituting 0 for x and  for y in the equation y = -a^(x)
+ b - 12 yields - 75/7 = -a0 + b - 12, which is equivalent to (-320)/775/7 =(0a,-b-175/(=+7)(3)b2o)/7- 12, or - 75/7 = b - 13. Adding 13 to both sides of this
equation yields 16/7 = b. It’s given that the product of a and b is , or . Substituting 16/7 for b in this equation yields (a) ( 16/7 ) = 320/7 .
Dividing both sides of this equation by 16/7 yields a = 20.$qb$);
select seed_pool_question($qb$CB-8e1da169$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = (x - 44)(x - 46)
The function f is defined by the given equation. For what value of x does f(x) reach its minimum?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8e1da169.png$qb$, $qb$[{"label": "A", "body": "46"}, {"label": "B", "body": "45"}, {"label": "C", "body": "44"}, {"label": "D", "body": "-1"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that f(x) = (x - 44)(x - 46), which can be rewritten as f(x) = x^(2) - 90x + 2,024. Since the coefficient of
the x2-term is positive, the graph of y= f(x) in the xy-plane opens upward and reaches its minimum value at its vertex. For an equation in the
form f(x) = ax2 + bx + c, where ab, , and c are constants, the x-coordinate of the vertex is . For the equation f(x) = x^(2) - 90x
- (-- b/(920^(a)))/(2(1))
+ 2,024a = 1, , b = -90, and c = 2,024. It follows that the x-coordinate of the vertex is , or 45. Therefore, f(x) reaches its minimum
when the value of x is 45.
Choice A is incorrect. This is one of the x-coordinates of the x-intercepts of the graph of y = f(x) in the xy-plane.
Choice C is incorrect. This is one of the x-coordinates of the x-intercepts of the graph of y = f(x) in the xy-plane.
Choice D is incorrect. This is the y-coordinate of the vertex of the graph of y= f(x) in the xy-plane.$qb$);
select seed_pool_question($qb$CB-1d3c5c95$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = 4,000(0·75)^(x)
An entomologist recommended a program to reduce a certain invasive beetle population in an area. The given function estimates this beetle
species' population x years after 2012, where x ≤ 7. Which of the following is the best interpretation of 4,000 in this context?$qb$, null, $qb$[{"label": "A", "body": "The estimated initial beetle population for this species and area in 2012"}, {"label": "B", "body": "The estimated beetle population for this species and area 7 years after 2012"}, {"label": "C", "body": "The estimated percent decrease in the beetle population for this species and area each year after 2012"}, {"label": "D", "body": "The estimated percent decrease in the beetle population for this species and area every 7 years after 2012"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. For an exponential function in the form , where a and b are positive constants and b < 1, the initial value of
ff(x(x) )= a(b)^(x)
f(x) , or the value of f(x) when x = 0, is a and the value of  decreases by 100(1 - b)% each time x increases by 1. Therefore, the initial
value of the function f(x) = 4,000(0·75)^(x) , or the value of f(x) when x = 0, is 4,000. Therefore, the best interpretation of 4,000 in this
context is the estimated initial beetle population for this species and area in 2012.
Choice B is incorrect. The estimated beetle population for this species and area 7 years after 2012 is 4,000(0·75)^(7), or approximately 534, not
4,000.
Choice C is incorrect. The estimated percent decrease in the beetle population for this species and area each year after 2012 is 100(1 - 0·75) ,
or 25, not 4,000.
Choice D is incorrect. The estimated percent decrease in the beetle population for this species and area every 7 years after 2012 is 100(1
- 0·75^(7)) , or approximately 87, not 4,000.$qb$);
select seed_pool_question($qb$CB-46308566$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$r2 + qr = 2r - 55
In the given equation, q is an integer constant. The given equation has no real solutions. What is the largest possible value of q?$qb$, null, null, null, array[$qb$16$qb$]::text[], $qb$The correct answer is 16. A quadratic equation of the form ax2 + bx + c = 0, where ab, , and c are constants, has no real solution if and only if
its discriminant, b2 - 4ac, is negative. It’s given that in the equation r2 + qr = 2r - 55q, is an integer constant. Subtracting 2r and adding 55
to both sides of this equation yields r^(2) + qr - 2r + 55 = 0, or r^(2) + (q - 2)r + 55 = 0. In this equation, a = 1b = q - 2, , and c = 55.
Substituting 1 for aq - 2,  for b, and 55 for c in the discriminant expression yields , or (q - 2)^(2) - 220. Since the value of
the discriminant must be negative, it follows that (q - 2)^(2) - 220 < 02 - √((q)/220 <- q2)<2(q<2-+222√)02-2-204(1) (55), or . This is equivalent to |q - 2| < √-220, or -√-220
< q - 2 < √-220. Adding 2 to each part of this inequality yields . Since √-220 is approximately 14·83, it follows
that -12·83 < q < 16·83. Since q is an integer, the largest possible value of q is 16.$qb$);
select seed_pool_question($qb$CB-ae05d37b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f(t) = 40,000(2) t/799 gives the number of bacteria in a population t minutes after an initial observation. How much time, in
minutes, does it take for the number of bacteria in the population to double?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "790"}, {"label": "C", "body": "1,580"}, {"label": "D", "body": "40,000"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that t minutes after an initial observation, the number of bacteria in a population is 40,000(2) t/79o . This expression
consists of the initial number of bacteria, 40,000, multiplied by the expression 2 t/790 . The time, in minutes, it takes for the number of bacteria to
double is the increase in the value of t that causes the expression 2 t/799 to double. Since the base is 2, the expression 2 t/790 will double when the
exponent increases by 1. Since the exponent of this expression is t/790 , the exponent will increase by 1 when t increases by 790. Therefore, the
time, in minutes, it takes for the number of bacteria in the population to double is 790.
Choice A is incorrect. This is the base of the exponent, not the time it takes for the number of bacteria in the population to double.
Choice C is incorrect. This is the number of minutes it takes for the population to double twice.
Choice D is incorrect. This is the number of bacteria that are initially observed, not the time it takes for the number of bacteria in the population
to double.$qb$);
select seed_pool_question($qb$CB-1ee962ec$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?^(?)?tee
--------÷÷÷÷----16141210IIIIIIII86420044446666222288?(y|)/(222 444 ??? 888 10II00 12II22 14II44 16II66)|?|| || || || || || || || || || || || || || || || | x
1^(1)Otn?Ceaaeee??
?IaPSedtime (h0urS)
Scientists recorded data about the ocean water levels at a certain location over a period of 6 hours. The graph shown models the data, where
y = 0 represents sea level. Which table gives values of x and their corresponding values of y based on the model?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1ee962ec.png$qb$, $qb$[{"label": "A", "body": "x 0/(|-3 ?)||| ???(-y)/123/(-6 |)|||"}, {"label": "B", "body": "x 0/3||| ???12/(--^(6) |)|||"}, {"label": "C", "body": "x 3/(|-6 ?)||| ???0/12-/(-0 |)|||"}, {"label": "D", "body": "x 0/(|-12 ?)|| ??0/(-3 |)|| | -/-6 ?--0 |"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Each point (x, y) on the graph represents an elapsed time x, in hours, and the corresponding ocean water level y, in feet, at
a certain location based on the model. The graph shown passes through the points (0, 0) , (3, -12) , and (6, 0). Thus, the table in choice C gives
the values of x and their corresponding values of y based on the model.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c6a26e14$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?x + 45| = 48
What is the positive solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c6a26e14.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "48"}, {"label": "C", "body": "93"}, {"label": "D", "body": "96"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given absolute value equation can be rewritten as two linear equations: x + 45 = 48 and -(x + 45) = 48, or
x + 45 = -48. Subtracting 45 from both sides of the equation x + 45 = 48 yields x = 3. Subtracting 45 from both sides of the equation
x + 45 = -48 yields x = -93. Thus, the given equation has two possible solutions, 3 and -93. Therefore, the positive solution to the given
equation is 3.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-07bcecac$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$P(t) = 24·8(1·036)^(t)
The function P gives the predicted population, in millions, of a certain country for the period from 1984 to 2018, where t is the number of years
after 1984. According to the model, what is the best interpretation of the statement “P(8) is approximately equal to 32·91 ”?$qb$, null, $qb$[{"label": "A", "body": "In 1984, the predicted population of this country was approximately 8 million."}, {"label": "B", "body": "In 1984, the predicted population of this country was approximately 32·91 million."}, {"label": "C", "body": "8 years after 1984, the predicted population of this country was approximately 32·91 million."}, {"label": "D", "body": "32·91 years after 1984, the predicted population of this country was approximately 8 million."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The function P gives the predicted population, in millions, of a certain country for the period from 1984 to 2018, where t is
the number of years after 1984. Since the value of P(8) is the value of P(t) when t = 8, it follows that "P(8) is approximately equal to 32·91 "
means that the value of P(t) is approximately equal to 32·91 when t = 8. Therefore, the best interpretation of the statement "P(8) is
approximately equal to 32·91" is that 8 years after 1984, the predicted population of this country was approximately 32·91 million.
Choice A is incorrect. In 1984, the predicted population of this country was 24·8 million, not approximately 8 million.
Choice B is incorrect. In 1984, the predicted population of this country was 24·8 million, not approximately 32·91 million.
Choice D is incorrect. 32·91 years after 1984, the predicted population of this country was 24·8(1·036)3^(2)·9^(1) million, or approximately 79·42
million, not approximately 8 million.$qb$);
select seed_pool_question($qb$CB-ad03127d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$6r = 7s + t
The given equation relates the variables r s, , and t. Which equation correctly expresses s in terms of r and t?$qb$, null, $qb$[{"label": "A", "body": "s = 42r - t"}, {"label": "B", "body": "s = 7(6r - t)"}, {"label": "C", "body": "s = 6/7 r - t"}, {"label": "D", "body": "s = (6r-t)/7"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Subtracting t from both sides of the given equation yields 6r - t = 7s. Dividing both sides of this equation by 7 yields (6r-t)/7
= s. Therefore, the equation s = (6r-t)/7 correctly expresses s in terms of r and t.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-02add2d2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A company has a newsletter. In January 2018, there were 1,300 customers subscribed to the newsletter. For the next 24 months after January
2018, the total number of customers subscribed to the newsletter each month was 7% greater than the total number subscribed the previous
month. Which equation gives the total number of customers, c, subscribed to the company's newsletter m months after January 2018, where m
≤ 24?$qb$, null, $qb$[{"label": "A", "body": "c = 1,300(0·07)^(m)"}, {"label": "B", "body": "c = 1,300(1·07)^(m)"}, {"label": "C", "body": "c = 1,300(1·7)^(m)"}, {"label": "D", "body": "c = 1,300(7)^(m)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that in January 2018, there were 1,300 customers subscribed to a company's newsletter and for the next 24
months after January 2018, the total number of customers subscribed to the newsletter each month was 7% greater than the total number
subscribed the previous month. It follows that this situation can be represented by the equation c = a ( 1 + r/100 ) m , where c is the total number
of customers subscribed to the company's newsletter m months after January 2018a,  is the number of customers subscribed to the newsletter
in January 2018, and the total number of customers subscribed to the newsletter each month was r% greater than the total number subscribed
the previous month. Substituting 1,300 for a and 7 for r in this equation yields c = 1,300(1 + 7/1o0)m , or c = 1,300(1·07)^(m) .
Choice A is incorrect. This equation represents a situation where the total number of customers subscribed each month was 93% less, not 7%
greater, than the total number subscribed the previous month.
Choice C is incorrect. This equation represents a situation where the total number of customers subscribed each month was 70%, not 7%,
greater than the total number subscribed the previous month.
Choice D is incorrect. This equation represents a situation where the total number of customers subscribed each month was 600%, not 7%,
greater than the total number subscribed the previous month.$qb$);
select seed_pool_question($qb$CB-f65288e8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If x is a solution to the given equation, which of the following is a possible value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f65288e8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given equation can be rewritten as . Multiplying both sides of this equation by  yields
. Dividing both sides of this equation by 4 yields . Taking the square root of both sides of this equation yields
or . Therefore, a possible value of  is .
Choices B, C, and D are incorrect and may result from computational or conceptual errors.$qb$);
select seed_pool_question($qb$CB-788bfd56$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 4 + √-x. What is the value of f(144) ?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "16"}, {"label": "C", "body": "40"}, {"label": "D", "body": "76"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The value of f(144) is the value of when x = 144. It's given that the function f is defined by f(x) = 4 + √-x.
f(144) =f4(^(x)+) √-144
Substituting 144 for x in this equation yields . Since the positive square root of 144 is 12, it follows that this equation can
be rewritten as f(144) = 4 + 12, or f(144) = 16. Therefore, the value of f(144) is 16.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of f(1,296) , not f(144).
Choice D is incorrect. This is the value of f(5,184) , not f(144).$qb$);
select seed_pool_question($qb$CB-2c288148$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$√-k - x = 58 - x
In the given equation, k is a constant. The equation has exactly one real solution. What is the minimum possible value of 4k?$qb$, null, null, null, array[$qb$231$qb$]::text[], $qb$The correct answer is 231 . It's given that √-k - x = 58 - x. Squaring both sides of this equation yields k - x = (58 - x)^(2) , which is
equivalent to the given equation if 58 - x > 0. It follows that if a solution to the equation k - x = (58 - x)^(2) satisfies 58 - x > 0, then it's
also a solution to the given equation; if not, it's extraneous. The equation k - x = (58 - x)^(2) can be rewritten as k - x = 3,364 - 116x + x^(2).
Adding x to both sides of this equation yields ? = x^(2) - 115x + 3,364. Subtracting k from both sides of this equation yields 0 = x^(2) - 115x
+ (3,364 - k) . The number of solutions to a quadratic equation in the form 0 = ax2 + bx + c, where ab, , and c are constants, can be
determined by the value of the discriminant, b2 - 4ac. Substituting -115 for b, 1 for a, and 3,364 - k for c in b2 - 4ac yields (-115)^(2)
- 4(1)(3,364 - k), or 4k - 231 . The equation  has exactly one real solution if the discriminant is equal to
0 = x^(2) - 115x + (3,364 - k4)k = 231
zero, or 4k - 231 = 0. Subtracting 231 from both sides of this equation yields . Dividing both sides of this equation by 4 yields k
= 57·75. Therefore, if k = 57·75, then the equation  has exactly one real solution. Substituting 57·75 for k in
0 =^(x2)0-=11x5^(2x)-+1(135^(,)3x6+4 -3,3k0)6·25
this equation yields 0 = x^(2) - 115x + (3,364 - 57·75) , or , which is equivalent to 0 = (x - 57·5)^(2) . Taking the
square root of both sides of this equation yields 0 = x - 57·5. Adding 57·5 to both sides of this equation yields 57·5 = x. To check whether
this solution satisfies 58 - x > 0, the solution, 57·5, can be substituted for x in 58 - x > 0, which yields 58 - 57·5 > 0, or 0·5 > 0. Since
0·5 is greater than 0, it follows that if k = 57·75, or 4k = 231, then the given equation has exactly one real solution. If 4k < 231, then the
discriminant, 4k - 231, is negative and the given equation has no solutions. Therefore, the minimum possible value of 4k is 231.$qb$);
select seed_pool_question($qb$CB-40491607$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = (x - 1)(x + 3)(x- 2)
In the xy-plane, when the graph of the function f, where y= f(x) , is shifted up 6 units, the resulting graph is defined by the function g. If the
graph of y = g(x) crosses through the point (4, b) , where b is a constant, what is the value of b?$qb$, null, null, null, array[$qb$48$qb$]::text[], $qb$The correct answer is 48. It's given that in the xy-plane, when the graph of the function f, where y = f(x), is shifted up 6 units, the resulting
graph is defined by the function g. Therefore, function g can be defined by the equation . It's given that
g(x)g=(x)f=(x)f+(x6) + 6
. Substituting  for f(x) in the equation  yields
g(x) = g(x(^(x)-f) (1^(x)))(x(+4, 34)8()x - 2)
== ((^(xx) -- 11))g((^(xx)(4++) =33))(((4^(xx)--- 122)))(+4 +63)(4 - 2) + 6. For the point (x -(14),(bx)g(+4)3=)(x48- 2), the value of x is 4. Substituting 4 for x in the equation
+ 6 yields , or . It follows that the graph of y = g(x) crosses through the point .
Therefore, the value of b is 48.$qb$);
select seed_pool_question($qb$CB-369b7bb7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function g is defined by g (x) = √-8x + 1. What is the value of g(3) ?$qb$, null, $qb$[{"label": "A", "body": "5/8"}, {"label": "B", "body": "25/8"}, {"label": "C", "body": "5"}, {"label": "D", "body": "25"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the function  is defined by g (x) = √-8x + 1. Substituting 3 for x in the given function yields g(3)
g (3) =g√-25
= √-8 (3) + 1, which is equivalent to , or g (3) = 5. Therefore, the value of g(3) is 5.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of 8 (3) + 1, not √-8 (3) + 1.$qb$);
select seed_pool_question($qb$CB-3206b905$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to 8x10 - 8x9 + 88x?$qb$, null, $qb$[{"label": "A", "body": "x(7x^(1)o - 7x9 + 87x)"}, {"label": "B", "body": "x(8^(1o) - 8^(9) + 88)"}, {"label": "C", "body": "8x (x1o - x9 + 11x)"}, {"label": "D", "body": "8x(x9 - x8 + 11)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since 8x is a common factor of each term in the given expression, the expression can be rewritten as 8x(x9 - x8 + 11) .
Choice A is incorrect. This expression is equivalent to 7x11 - 7x1o + 87x2.
Choice B is incorrect. This expression is equivalent to 810x - 89x + 88x.
Choice C is incorrect. This expression is equivalent to 8x11 - 8x1o + 88x2.$qb$);
select seed_pool_question($qb$CB-f89af023$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A rectangular volleyball court has an area of 162 square meters. If the length of the court is twice the width, what is the width of the court, in
meters?$qb$, null, $qb$[{"label": "A", "body": "9"}, {"label": "B", "body": "18"}, {"label": "C", "body": "27"}, {"label": "D", "body": "54"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the volleyball court is rectangular and has an area of 162 square meters. The formula for the area of a
rectangle is , where A is the area,  is the length, and w is the width of the rectangle. It’s also given that the length of the volleyball
court is twice the width, thus . Substituting the given value into the formula for the area of a rectangle and using the relationship
between length and width for this rectangle yields . This equation can be rewritten as . Dividing both sides of this
equation by 2 yields . Taking the square root of both sides of this equation yields . Since the width of a rectangle is a positive
number, the width of the volleyball court is 9 meters.
Choice B is incorrect because this is the length of the rectangle. Choice C is incorrect because this is the result of using 162 as the perimeter
rather than the area. Choice D is incorrect because this is the result of calculating w in the equation  instead of
.$qb$);
select seed_pool_question($qb$CB-7902bed0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A machine launches a softball from ground level. The softball reaches a maximum height of 51·84 meters above the ground at 1·8 seconds and
hits the ground at 3·6 seconds. Which equation represents the height above ground h, in meters, of the softball t seconds after it is launched?$qb$, null, $qb$[{"label": "A", "body": "h = -t^(2) + 3·6"}, {"label": "B", "body": "h = -t^(2) + 51·84"}, {"label": "C", "body": "h = -16(t - 1·8)^(2) - 3·6"}, {"label": "D", "body": "h = -16(t - 1·8)^(2) + 51·84"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. An equation representing the height above ground h, in meters, of a softball t seconds after it is launched by a machine from
ground level can be written in the form h = -a(t - b)^(2) + c, where ab, , and c are positive constants. In this equation, b represents the time, in
seconds, at which the softball reaches its maximum height of c meters above the ground. It's given that this softball reaches a maximum height
of 51·84 meters above the ground at 1·8 seconds; therefore, b = 1·8 and c = 51·84. Substituting 1·8 for b and 51·84 for c in the equation h =
-a(t - b)^(2) + c yields h = -a(t - 1·8)^(2) + 51·84. It's also given that this softball hits the ground at 3·6 seconds; therefore, h = 0 when t
= 3·6. Substituting 0 for h and 3·6 for t in the equation h = -a(t - 1·8)^(2) + 51·84 yields 0 = -a(3·6 - 1·8)^(2) + 51·84, which is equivalent
to 0 = -a(1·8)^(2) + 51·84, or 0 = -3·24a + 51·84. Adding 3·24a to both sides of this equation yields 3·24a = 51·84. Dividing both sides of
this equation by 3·24 yields a = 16. Substituting 16 for a in the equation h = -a(t - 1·8)^(2) + 51·84 yields h = -16(t - 1·8)^(2) + 51·84.
Therefore, h = -16(t - 1·8)^(2) + 51·84 represents the height above ground h, in meters, of this softball t seconds after it is launched.
Choice A is incorrect. This equation represents a situation where the maximum height is 3·6 meters above the ground at 0 seconds, not 51·84
meters above the ground at 1·8 seconds.
Choice B is incorrect. This equation represents a situation where the maximum height is 51·84 meters above the ground at 0 seconds, not 1·8
seconds.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5ba187d4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 100x^(2) + 2,600?$qb$, null, $qb$[{"label": "A", "body": "100 (26x^(2))"}, {"label": "B", "body": "100 (x^(2) + 26)"}, {"label": "C", "body": "2,600 (100x^(2))"}, {"label": "D", "body": "2,600 (100x^(2) + 1)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Each term in the given expression, 100x^(2) + 2,600, has a common factor of 100. Therefore, the expression can be rewritten
as 100(x^(2)) + 100(26) , or 100(x^(2) + 26).
Choice A is incorrect. This expression is equivalent to 2,600x^(2), not 100x^(2) + 2,600.
Choice C is incorrect. This expression is equivalent to 260,000x^(2), not 100x^(2) + 2,600.
Choice D is incorrect. This expression is equivalent to 260,000x^(2) + 2,600, not 100x^(2) + 2,600.$qb$);
select seed_pool_question($qb$CB-38c90632$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The expression (29x+102)/(x(x+51)) is equivalent to p/x + w/(x+51), where p and w are constants. What is the value of w?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-38c90632.png$qb$, null, null, array[$qb$27$qb$]::text[], $qb$The correct answer is 27. The given expression  can be rewritten with the common denominator x(x + 51) . To add the two terms of
this expression, p/x can be rewritten as (p(x+51))/(x(x+51))(p p/(xx+) 5+1p+wx)/(x(x+51))(w/(xw+51))/(x+51) and  can be rewritten as . Therefore, the expression  can be rewritten
wx/(x(x+51))(29x+1o2)/(x(x+51))
as (p(x+51))/(x(x+51)) + wx/(x(x+51)) , which is equivalent to , or ((p+w)x+51p)/(x(x+51)) . Since  is equivalent to 2 ((p+w)x+5 p/(1^(x)p))/(9x^(x)+(^(x)+150^(1)2))=+( w/(p(^(x)++5w1)))x + 51p and these expressions
have equivalent denominators, these expressions must also have equivalent numerators. It follows that . In this
equation, the x-coefficients must be equal and the constant terms must be equal. Therefore, p + w = 29 and 51p = 102. Dividing both sides of
51p = 102 by 51 yields p = 2. Substituting 2 for p in p + w = 29 yields 2 + w = 29. Subtracting 2 from both sides of this equation yields w
= 27. Therefore, the value of w is 27.$qb$);
select seed_pool_question($qb$CB-4a0d0399$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is defined by , where a and b are constants. In the xy-plane, the graph of y = f(x) has an x-intercept at (2, 0)
(0, -323f)(^(x)) =^(ax) + b
and a y-intercept at . What is the value of b?$qb$, null, null, null, array[$qb$-324$qb$]::text[], $qb$The correct answer is -324. It's given that the function f is defined by f(x) = a^(x) + b, where a and b are constants. It's also given that the
graph of has a y-intercept at (0, -323) . It follows that f(0) = -323. Substituting 0 for x and -323 for f(x) in f(x) = a^(x) + b
-3y2=3 =f(a^(x)0)+ b
yields , or -323 = 1 + b. Subtracting 1 from each side of this equation yields -324 = b. Therefore, the value of b is -324.$qb$);
select seed_pool_question($qb$CB-3cf2698e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The number of cells of a certain bacteria doubles every 25 minutes during its growth period when placed in a medium of milk in a controlled
laboratory environment. If a sample of 830 cells of this bacteria is placed in milk in a controlled laboratory environment, which function f best
represents the number of cells of the bacteria x minutes after the growth period begins, where x is less than the number of minutes in the
growth period?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3cf2698e.png$qb$, $qb$[{"label": "A", "body": "f (x) = 830(1/2) ?/(2?)"}, {"label": "B", "body": "f (x) = 830(2) x/(2?)"}, {"label": "C", "body": "f (x) = 830(1/3) ?/(2?)"}, {"label": "D", "body": "f (x) = 830(3) x/(2?)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For a bacteria with an initial population of P cells and a doubling time of m minutes, the number of cells, f(x), of the
bacteria x minutes after the growth period begins can be given by the equation f (x) = P(2) ?/m . It’s given that there are 830 cells of the
bacteria when the growth period begins. Therefore, P = 830. It’s also given that the number of cells of the bacteria doubles every 25 minutes
during the growth period. Therefore, m = 25. Substituting 830 for P and 25 for m in the equation f (x) = P(2) x/m yields f (x) = 830(2) x/(2?) .
Choice A is incorrect. This function represents a situation where the number of cells decreases by half, rather than doubles, every 25 minutes.
Choice C is incorrect. This function represents a situation where the number of cells decreases by two-thirds, rather than doubles, every 25
minutes.
Choice D is incorrect. This function represents a situation where the number of cells triples, rather than doubles, every 25 minutes.$qb$);
select seed_pool_question($qb$CB-768b60d2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the exponential function f, the value of f(0) is c, where c is a constant. Of the following equations that define the function f, which equation
shows the value of c as the coefficient or the base?$qb$, null, $qb$[{"label": "A", "body": "f (x) = 22(1·5)^(x)+^(1)"}, {"label": "B", "body": "f (x) = 33(1·5)^(x)"}, {"label": "C", "body": "f (x) = 49·5(1·5)^(x)-^(1)"}, {"label": "D", "body": "f (x) = 74·25(1·5)^(x)-^(2)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Each of the given choices is an equation of the form f (x) = a(b)^(x)-^(k), where ab, , and k are constants. For an equation of
this form, the coefficient, a, is equal to the value of the function when the exponent is equal to 0, or when x = k. It follows that in the equation
, the coefficient, 33, is equal to the value of f(0). Substituting 0 for x in this equation yields f (0) = 33(1·5)^(o), which is
f (x) = 33(1f·5()0^(x)) = 33 (1)
equivalent to , or f (0) = 33. Thus, the value of c is 33 and the equation f (x) = 33(1·5)^(x) shows the value of c as the
coefficient.
Choice A is incorrect. This equation shows the value of f(-1), not f(0) , as the coefficient.
Choice C is incorrect. This equation shows the value of f(1), not f(0), as the coefficient.
Choice D is incorrect. This equation shows the value of f(2), not f(0) , as the coefficient.$qb$);
select seed_pool_question($qb$CB-e53add44$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function S above models the annual salary, in dollars, of an employee n years after starting a job, where a is a constant. If the employee’s
salary increases by 4% each year, what is the value of a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e53add44.png$qb$, $qb$[{"label": "A", "body": "0.04"}, {"label": "B", "body": "0.4"}, {"label": "C", "body": "1.04"}, {"label": "D", "body": "1.4"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A model for a quantity S that increases by a certain percentage per time period n is an exponential function in the form
, where I is the initial value at time  for r% annual increase. It’s given that the annual increase in an employee’s
salary is 4%, so . The initial value can be found by substituting 0 for n in the given function, which yields . Therefore,
. Substituting these values for r and I into the form of the exponential function  yields
, or . Therefore, the value of a in the given function is 1.04.
Choices A, B, and D are incorrect and may result from incorrectly representing the annual increase in the exponential function.$qb$);
select seed_pool_question($qb$CB-b4a6ed81$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The expression 90y^(5) - 54y^(4) is equivalent to ry^(4)(15y - 9) , where r is a constant. What is the value of r?$qb$, null, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. Applying the distributive property to the expression yields 15ry5 - 9ry4. Since 90y^(5) - 54y^(4) is
ry145(r1y55y--99r)y4
equivalent to ry^(4)(15y - 9) , it follows that 90y^(5) - 54y^(4) is also equivalent to . Since these expressions are equivalent, it follows
that corresponding coefficients are equivalent. Therefore, 90 = 15r and -54 = -9r. Solving either of these equations for r will yield the value
of r. Dividing both sides of 90 = 15r by 15 yields 6 = r. Therefore, the value of r is 6.$qb$);
select seed_pool_question($qb$CB-9654add7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The revenue , in dollars, that a company receives from sales of a product is given by the function f above, where x is the unit price, in
dollars, of the product. The graph of  in the xy-plane intersects the x-axis at 0 and a. What does a represent?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9654add7.png$qb$, $qb$[{"label": "A", "body": "The revenue, in dollars, when the unit price of the product is $0"}, {"label": "B", "body": "The unit price, in dollars, of the product that will result in maximum revenue"}, {"label": "C", "body": "The unit price, in dollars, of the product that will result in a revenue of $0"}, {"label": "D", "body": "The maximum revenue, in dollars, that the company can make"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. By definition, the y-value when a function intersects the x-axis is 0. It’s given that the graph of the function intersects the x-
axis at 0 and a, that x is the unit price, in dollars, of a product, and that , where , is the revenue, in dollars, that a company
receives from the sales of the product. Since the value of a occurs when , a is the unit price, in dollars, of the product that will result in a
revenue of $0.
Choice A is incorrect. The revenue, in dollars, when the unit price of the product is $0 is represented by , when . Choice B is incorrect.
The unit price, in dollars, of the product that will result in maximum revenue is represented by the x-coordinate of the maximum of f. Choice D is
incorrect. The maximum revenue, in dollars, that the company can make is represented by the y-coordinate of the maximum of f.$qb$);
select seed_pool_question($qb$CB-4618501a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = 3,000(0·75)^(x)
A conservation scientist implemented a program to reduce the population of a certain species in an area. The given function estimates this
species' population x years after 2008, where x ≤ 8. Which of the following is the best interpretation of 3,000 in this context?$qb$, null, $qb$[{"label": "A", "body": "The estimated percent decrease in the population for this species and area every 8 years after 2008"}, {"label": "B", "body": "The estimated percent decrease in the population for this species and area each year after 2008"}, {"label": "C", "body": "The estimated population for this species and area 8 years after 2008"}, {"label": "D", "body": "The estimated initial population for this species and area in 2008"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Substituting 0 for x in the given equation yields f(0) = 3,000(0·75)^(o) , which is equivalent to f(0) = 3,000(1), or f(0)
= 3,000. It’s given that the function estimates the species’ population x years after 2008, so it follows that the estimated population of the
species is 3,000 in 2008. Therefore, the best interpretation of 3,000 in this context is the estimated initial population for this species and area in
2008.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect. The estimated percent decrease in the population for this species and area each year after 2008 is 25%, not 3,000.
Choice C is incorrect. The estimated population for this species and area 8 years after 2008 is 3,000(0·75)^(8), or approximately 300, not 3,000.$qb$);
select seed_pool_question($qb$CB-34847f8a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation above is true for all , where r and t are positive constants. What is the value of rt ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-34847f8a.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": "15"}, {"label": "C", "body": "20"}, {"label": "D", "body": "60"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. To express the sum of the two rational expressions on the left-hand side of the equation as the single rational expression on
the right-hand side of the equation, the expressions on the left-hand side must have the same denominator. Multiplying the first expression by
results in , and multiplying the second expression by  results in , so the given equation can
be rewritten as , or .
Since the two rational expressions on the left-hand side of the equation have the same denominator as the rational expression on the right-hand
side of the equation, it follows that . Combining like terms on the left-hand side yields , so it
follows that  and . Therefore, the value of  is .
Choice A is incorrect and may result from an error when determining the sign of either r or t. Choice B is incorrect and may result from not
distributing the 2 and 3 to their respective terms in . Choice D is incorrect and may
result from a calculation error.$qb$);
select seed_pool_question($qb$CB-253985c2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 6x + 5x + 4y?$qb$, null, $qb$[{"label": "A", "body": "15x"}, {"label": "B", "body": "15y"}, {"label": "C", "body": "11x + 4y"}, {"label": "D", "body": "30x + 4y"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. In the given expression, 6x and 5x are like terms. Combining these like terms yields 11x. It follows that the expression 6x
+ 5x + 4y is equivalent to 11x + 4y.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cc776a04$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is an equivalent form of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cc776a04.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The first expression  can be rewritten as  . Applying the distributive property to
this product yields  . This difference can be rewritten as
. Distributing the factor of  through the second expression yields
. Regrouping like terms, the expression becomes
. Combining like terms yields  .
Choices A, B, and D are incorrect and likely result from errors made when applying the distributive property or combining the resulting like terms.$qb$);
select seed_pool_question($qb$CB-263f9937$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Growth of a Culture of Bacteria
Number of bacteria per
Day
milliliter at end of day
1
||| ||| |||
2
3
A culture of bacteria is growing at an exponential rate, as shown in the table above. At this rate, on which day would the number of bacteria per
milliliter reach ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-263f9937.png$qb$, $qb$[{"label": "A", "body": "Day 5"}, {"label": "B", "body": "Day 9"}, {"label": "C", "body": "Day 11"}, {"label": "D", "body": "Day 12"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The number of bacteria per milliliter is doubling each day. For example, from day 1 to day 2, the number of bacteria increased
from 2.5 × 105 to 5.0 × 105. At the end of day 3 there are 106 bacteria per milliliter. At the end of day 4, there will be 106 × 2 bacteria per milliliter.
At the end of day 5, there will be (106 × 2) × 2, or 106 × (22) bacteria per milliliter, and so on. At the end of day d, the number of bacteria will be 106
× (2d – 3). If the number of bacteria per milliliter will reach 5.12 × 108 at the end of day d, then the equation
must hold. Since 5.12 × 108 can be rewritten as 512 × 106, the equation is equivalent to . Rewriting 512 as 29 gives d – 3 = 9, so d
= 12. The number of bacteria per milliliter would reach 5.12 × 108 at the end of day 12.
Choices A, B, and C are incorrect. Given the growth rate of the bacteria, the number of bacteria will not reach 5.12 × 108 per milliliter by the end of
any of these days.$qb$);
select seed_pool_question($qb$CB-4ac59df6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to (8yz)(y)(7z) ?$qb$, null, $qb$[{"label": "A", "body": "56y2z2"}, {"label": "B", "body": "56y2z"}, {"label": "C", "body": "56yz"}, {"label": "D", "body": "16yz"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given expression can be rewritten as (8 · 7)(y · y)(z · z), which is equivalent to (56)(y2)(z2) , or 56y2z2.
Choice B is incorrect. This expression is equivalent to (8yz)(y)(7) .
Choice C is incorrect. This expression is equivalent to (8z)(y)(7).
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fada6b03$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$2x^(2) - 8x - 7 = 0
One solution to the given equation can be written as (8-√-?)/4 , where k is a constant. What is the value of k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fada6b03.png$qb$, null, null, array[$qb$120$qb$]::text[], $qb$The correct answer is 120. The solutions to a quadratic equation of the form ax2 + bx + c = 0 can be calculated using the quadratic formula
and are given by x = (-b±√-b^(2)-4ac)/2a . The given equation is in the form ax2 + bx + c = 0, where a = 2b = -8, , and c = -7. It follows that the
solutions to the given equation are , which is equivalent to x = (8?√-64+56)/4 , or x = (8?√-120)/4 . It's given that one solution to
x = (8?√-(-8)2-4(2)(-7))/(2(2)(8-√-?)/4)
the equation 2x^(2) - 8x - 7 = 0 can be written as . The solution (8-√-120)/4 is in this form. Therefore, the value of k is 120.$qb$);
select seed_pool_question($qb$CB-926c246b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The equation above estimates the global data traffic D, in terabytes, for the year that is t years after 2010. What is the best interpretation of the
number 5,640 in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-926c246b.png$qb$, $qb$[{"label": "A", "body": "The estimated amount of increase of data traffic, in terabytes, each year"}, {"label": "B", "body": "The estimated percent increase in the data traffic, in terabytes, each year"}, {"label": "C", "body": "The estimated data traffic, in terabytes, for the year that is t years after 2010"}, {"label": "D", "body": "The estimated data traffic, in terabytes, in 2010"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since t represents the number of years after 2010, the estimated data traffic, in terabytes, in 2010 can be calculated using
the given equation when . Substituting 0 for t in the given equation yields , or . Thus, 5,640
represents the estimated data traffic, in terabytes, in 2010.
Choice A is incorrect. Since the equation is exponential, the amount of increase of data traffic each year isn’t constant. Choice B is incorrect.
According to the equation, the percent increase in data traffic each year is 90%. Choice C is incorrect. The estimated data traffic, in terabytes, for
the year that is t years after 2010 is represented by D, not the number 5,640.$qb$);
select seed_pool_question($qb$CB-84e5e36c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y =y =x27-65
The graphs of the given equations in the xy-plane intersect at the point (x, y) . What is a possible value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-84e5e36c.png$qb$, $qb$[{"label": "A", "body": "- 76/5"}, {"label": "B", "body": "-9"}, {"label": "C", "body": "5"}, {"label": "D", "body": "76"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since the point (x, y) is an intersection point of the graphs of the given equations in the xy-plane, the pair (x, y) should
satisfy both equations, and thus is a solution of the given system. According to the first equation, y = 76. Substituting 76 in place of y in the
second equation yields x^(2) - 5 = 76. Adding 5 to both sides of this equation yields x2 = 81. Taking the square root of both sides of this
equation yields two solutions: x = 9 and x = -9. Of these two solutions, only -9 is given as a choice.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of coordinate y, rather than x, of the intersection point (x, y).$qb$);
select seed_pool_question($qb$CB-ff2c1431$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$7m = 5(n + p)
The given equation relates the positive numbers m n, , and p. Which equation correctly gives n in terms of m and p?$qb$, null, $qb$[{"label": "A", "body": "n = 5p/7m"}, {"label": "B", "body": "n = 7m/5 - p"}, {"label": "C", "body": "n = 5(7m) + p"}, {"label": "D", "body": "n = 7m - 5 - p"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the equation 7m = 5(n + p) relates the positive numbers m n, , and p. Dividing both sides of the given
equation by 5 yields 7m/5 = n + p. Subtracting p from both sides of this equation yields 7m/5 - p = n, or n = 7m/5 - p. It follows that the
equation n = 7m/5 - p correctly gives n in terms of m and p.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-137cc6fd$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$√^(?) -70n(√^(6) -70n)^(2)
For what value of x is the given expression equivalent to (70n)^(3ox), where n > 1?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-137cc6fd.png$qb$, null, null, array[$qb$.0177$qb$, $qb$.0178$qb$, $qb$4/225$qb$]::text[], $qb$The correct answer is 4/225 . An expression of the form √? -a, where k is an integer greater than 1 and a ≥ 0, is equivalent to a 1/? . Therefore, the
given expression, where n > 1, is equivalent to (70n) 1/5 ((70n) 1/6) 2. Applying properties of exponents, this expression can be rewritten as
(70n) 1/? (70n) 1/6·2, or , which can be rewritten as (70n) 1/5+1/3 , or . It's given that the expression √^(?) -70n(√^(6) -70n)^(2) is
(70n)3o(x70n) 1/? (70n) 1/3 (7(07n0)n3)08/x15
equivalent to , where n > 1. It follows that (70n) 8/(1?) is equivalent to . Therefore, 8/15 = 30x. Dividing both sides of this
equation by 30 yields 8/450 = x, or 4/225 = x. Thus, the value of x for which the given expression is equivalent to (70n)^(30x), where n > 1, is 4/225.
Note that 4/225, .0177, .0178, 0.017, and 0.018 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-6ce95fc8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following is a solution to the equation above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6ce95fc8.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A quadratic equation in the form , where a, b, and c are constants, can be solved using the quadratic
formula: . Subtracting  from both sides of the given equation yields . Applying the
quadratic formula, where , , and , yields . This can be rewritten as
. Since , or , the equation can be rewritten as . Dividing 2 from both the
numerator and denominator yields  or . Of these two solutions, only  is present among the choices. Thus,
the correct choice is D.
Choice A is incorrect and may result from a computational or conceptual error. Choice B is incorrect and may result from using
instead of  as the quadratic formula. Choice C is incorrect and may result from rewriting
as  instead of .$qb$);
select seed_pool_question($qb$CB-4dd4efcf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = ax2 + 4x + c
In the given quadratic function, a and c are constants. The graph of in the xy-plane is a parabola that opens upward and has a vertex at
f(-9) =^(y)=f(f3()^(x))
the point (h, k), where h and k are constants. If k < 0 and , which of the following must be true?
I. c < 0
II. a ≥ 1$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the graph of y= f(x) in the xy-plane is a parabola with vertex (h, k). If f(-9) = f(3) , then for the graph of
y= f(x) , the point with an x-coordinate of -9 and the point with an x-coordinate of 3 have the same y-coordinate. In the xy-plane, a parabola is
a symmetric graph such that when two points have the same y-coordinate, these points are equidistant from the vertex, and the x-coordinate of
the vertex is halfway between the x-coordinates of these two points. Therefore, for the graph of y = f(x), the points with x-coordinates -9 and
3 are equidistant from the vertex, (h, k), and h is halfway between -9 and 3. The value that is halfway between -9 and 3 is (-9+3)/2 , or -3.
Therefore, h = -3. The equation defining f can also be written in vertex form, f(x) = a(x - h)^(2) + k. Substituting -3 for h in this equation
yields , or . This equation is equivalent to f(x) = a(x^(2) + 6x + 9) + k, or f(x) = ax2
. Since , it follows that 6a = 4 and 9a + ? = c. Dividing both sides of the equation 6a = 4 by 6 yields
f(x) = a(x - (-(f32()/(6^(3)))+x)<2)k+=1=kacx2 +f(4xx) =+ ac(x + 3)2 + k
a+=6ax4/69+( 29/3a)a+=+ k2/(k^(3))= c, or . Since , it's not true that a ≥ 1. Therefore, statement II isn't true. Substituting  for a in the equation 9a + k = c
2/3k < 0
yields , or . Subtracting 6 from both sides of this equation yields k = c - 6. If , then c - 6 < 0, or c < 6. Since c
could be any value less than 6, it's not necessarily true that c < 0. Therefore, statement I isn't necessarily true. Thus, neither I nor II must be true.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cc2601cb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$÷-101122468004466222288?(?? ?)/| || || || || || || ||| || || || || || | x
The x-intercept of the graph shown is (x, 0). What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cc2601cb.png$qb$, null, null, array[$qb$7$qb$]::text[], $qb$The correct answer is 7. It’s given that the x-intercept of the graph shown is (x, 0) . The graph passes through the point (7, 0). Therefore, the
value of x is 7.$qb$);
select seed_pool_question($qb$CB-6bdcac03$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x^(2) = -841
How many distinct real solutions does the given equation have?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the square of a real number is never negative, the given equation isn't true for any real value of x. Therefore, the given
equation has zero distinct real solutions.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f5aa5040$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, a line with equation 2y = c for some constant c intersects a parabola at exactly one point. If the parabola has equation
y = -2x2 + 9x, what is the value of c?$qb$, null, null, null, array[$qb$20.25$qb$, $qb$81/4$qb$]::text[], $qb$The correct answer is 81/4 . The given linear equation is 2y = c. Dividing both sides of this equation by 2 yields . Substituting c/2 for y in the
2yx2=-c/29x + c/2 = 0
equation of the parabola yields c/2 = -2x2 + 9x. Adding 2x2 and -9x to both sides of this equation yields . Since it’s
given that the line and the parabola intersect at exactly one point, the equation 2x2 - 9x + c/2 = 0 must have exactly one solution. An equation
of the form Ax^(2) + Bx + C = 0, where AB, , and C are constants, has exactly one solution when the discriminant, B^(2) - 4AC, is equal to 0.
In the equation , where A = 2, B = -9, and C = c/2 , the discriminant is (-9)2 - 4(2)(c/2) . Setting the discriminant equal
to 0 yields (-9)22x-2 -c4=(92x)(8(1)/4(+c)/2 c/()2)==00, or 81 - 4c = 0. Adding 4c to both sides of this equation yields 81 = 4c. Dividing both sides of this
equation by 4 yields . Note that 81/4 and 20.25 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-252a3b3a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$--/--/--/--/-(?888-777-???-555-?44-???-???-????- 111222333 ??? 555666777888)/--/(-| | | | | | | | | | | | | | | |)|?| | | | |-÷÷÷???1111| 806040??4060800000444466662222888800000000000000000000| | | | | | | | | | | x
Which of the following could be the equation of the graph shown in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-252a3b3a.png$qb$, $qb$[{"label": "A", "body": "y = -1/10x(x - 4) (x + 5)"}, {"label": "B", "body": "y = -1/10x(x - 4) (x + 5)2"}, {"label": "C", "body": "y = -1/10x(x - 5) (x + 4)"}, {"label": "D", "body": "y = -1/10x(x - 5)2(x + 4)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Each of the given choices is an equation of the form y = - 1/1o x (x - a) m (x + b) n, where a b m, , , and n are positive
constants. In the xy-plane, the graph of an equation of this form has x-intercepts at x = 0 x = a, , and x = -b. The graph shown has x-
intercepts at x = 0 x = 4, , and x = -5. Therefore, a = 4 and b = 5. Of the given choices, only choices A and B have a = 4 and b = 5. For an
equation in the form y = - 1/1o x (x - a) m (x + b) n, if all values of x that are less than -b or greater than a correspond to negative y-values,
then the sum of all the exponents of the factors on the right-hand side of the equation is even. In the graph shown, all values of x less than -5 or
greater than 4 correspond to negative y-values. Therefore, the sum of all the exponents of the factors on the right-hand side of the equation y =
- 1/1o x (x - 4) m (x + 5) n must be even. For choice A, the sum of these exponents is , or 3, which is odd. For choice B, the sum of
y = -1/1ox(x - 4) (x +15+)2 1 + 1
these exponents is 1 + 1 + 2, or 4, which is even. Therefore, could be the equation of the graph shown.
Choice A is incorrect. For the graph of this equation, all values of x less than -5 correspond to positive, not negative, y-values.
Choice C is incorrect. The graph of this equation has x-intercepts at x = -4 x = 0, , and x = 5, rather than x-intercepts at x = -5 x = 0, , and
x = 4.
Choice D is incorrect. The graph of this equation has x-intercepts at x = -4 x = 0, , and x = 5, rather than x-intercepts at x = -5 x = 0, , and
x = 4.$qb$);
select seed_pool_question($qb$CB-2992ac30$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$P(t) = 260(1·04) (6/4)t
The function P models the population, in thousands, of a certain city t years after 2003. According to the model, the population is predicted to
increase by 4% every n months. What is the value of n?$qb$, null, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "12"}, {"label": "C", "body": "18"}, {"label": "D", "body": "72"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the function P models the population, in thousands, of a certain city t years after 2003. The value of the base
of the given exponential function, 1·04, corresponds to an increase of 4% for every increase of 1 in the exponent, . If the exponent is equal
to 0, then (6/4)t = 0. Multiplying both sides of this equation by (4/6) yields t = 0. If the exponent is equal to 1 , then (6/(4() ()6t)/42/3)t = 1 . Multiplying both
sides of this equation by (4/6) yields , or t = 2/3 . Therefore, the population is predicted to increase by 4% every  of a year. It’s given that
t = 4/(^(6)4)%
the population is predicted to increase by  every n months. Since there are 12 months in a year, 2/3 of a year is equivalent to (2/3)(12), or 8,
months. Therefore, the value of n is 8.
Choice B is incorrect. This is the number of months in which the population is predicted to increase by 4% according to the model P(t)
= 260(1·04)^(t), not P(t) = 260(1·04) (6/4)t .
Choice C is incorrect. This is the number of months in which the population is predicted to increase by 4% according to the model P(t)
= 260(1·04) (4/6)t, not P(t) = 260(1·04) (6/4)t.
Choice D is incorrect. This is the number of months in which the population is predicted to increase by 4% according to the model P(t)
= 260(1·04) (1/6)t, not P(t) = 260(1·04) (6/4)t.$qb$);
select seed_pool_question($qb$CB-58443765$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = 5x + 4
y = 5x2 + 4
Which ordered pair (x, y) is a solution to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(0, 0)"}, {"label": "B", "body": "(0, 4)"}, {"label": "C", "body": "(8, 44)"}, {"label": "D", "body": "(8, 84)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The second equation in the given system is y = 5x2 + 4. Substituting 5x^(2) + 4 for y in the first equation of the given
system yields 5x^(2) + 4 = 5x + 4. Subtracting 4 from both sides of this equation yields 5x2 = 5x. Subtracting 5x from both sides of this
equation yields 5x2 - 5x = 0. Factoring out a common factor of 5x from the left-hand side of this equation yields 5x(x - 1) = 0. It follows
that 5x = 0 or x - 1 = 0. Dividing both sides of the equation 5x = 0 by 5 yields x = 0. Substituting 0 for x in the equation y = 5x + 4 yields
y = 5(0) + 4, or y = 4. Therefore, a solution to the given system of equations is the ordered pair (0, 4) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3d7d7534$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$(d - 30) (d + 30) - 7 = -7
What is a solution to the given equation?$qb$, null, null, null, array[$qb$30$qb$, $qb$-30$qb$]::text[], $qb$The correct answer is either -30 or 30. Adding 7 to each side of the given equation yields (d - 30) (d + 30) = 0. Since a product of two
factors is equal to 0 if and only if at least one of the factors is 0, either d - 30 = 0 or d + 30 = 0. Adding 30 to each side of the equation
d - 30 = 0 yields d = 30. Subtracting 30 from each side of the equation d + 30 = 0 yields d = -30. Therefore, the solutions to the given
equation are -30 and 30. Note that -30 and 30 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-841ef26c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f (x) = 4x^(2) + 64x + 262
The function g is defined by g (x) = f (x + 5) . For what value of x does g(x) reach its minimum?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-841ef26c.png$qb$, $qb$[{"label": "A", "body": "-13"}, {"label": "B", "body": "-8"}, {"label": "C", "body": "-5"}, {"label": "D", "body": "-3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that . Since f (x) = 4x^(2) + 64x + 262, it follows that f (x + 5) = 4(x + 5)^(2) + 64 (x + 5)
+ 262. Expanding the quantity in this equation yields . Distributing the 4 and
g (x) = 4x2f+(1x0+4x5+) =6842x^(2) (+^(x)g4+0(^(x)x5))+^(2)=1f00(^(x)++645x) + 320 + 262f (^(x) + 5) = 4 (^(x2) + 10^(x) + 25)f+(x64+(5^(x))+=54)x+^(2) +262104x + 682
the 64 yields . Combining like terms yields . Therefore,
. For a quadratic function defined by an equation of the form , where ah, , and k are
constants and a is positive, g(x) reaches its minimum, k, when the value of x is h. The equation can be rewritten
in this form by completing the square. This equation is equivalent tog (x) = 4 ((x +g (1x3))=^(2) -a(1gx6(9-^(x)))h+=)264+8(2^(x)k^(2) +g2(x6))g=+(^(x)46)8(x=2g+^(a)(^(x)(1g^(x))3()-=^(x2))h-4=^(x))4^(22)4+(+1(^(x)6k19^(2)0)+4+^(x)2+668^(x)628+2169 - 169), or
+ 682. This equation can be rewritten as , or , which is equivalent
to g (x) = 4(x + 13)^(2) + 6. This equation is in the form , where a = 4h = -13, , and k = 6. Therefore, g(x) reaches
its minimum when the value of x is -13.
Choice B is incorrect. This is the value of x for which f(x), rather than g(x) , reaches its minimum.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of x for which f(x - 5) , rather than f(x + 5), reaches its minimum.$qb$);
select seed_pool_question($qb$CB-cc6ccd71$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-(10121416II1111II?4680044446666222288)/(-/--/--/--/--/--/--/-(?- - - ?-)/-888 666 444 2----22÷÷÷÷161412101111IIII86??004444666622??88 222 ??? 666 888)|| || || || || || ?|| || | || || || || || || || || | x
The graph of y = f(x) is shown, where the function f is defined by f(x) = ax3 + bx2 + cx + d and a b c, , , and d are constants. For how
many values of x does f(x) = 0?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cc6ccd71.png$qb$, $qb$[{"label": "A", "body": "One"}, {"label": "B", "body": "Two"}, {"label": "C", "body": "Three"}, {"label": "D", "body": "Four"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If a value of x satisfies f(x) = 0, the graph of y= f(x) will contain a point (x, 0) and thus touch the x-axis. Since there
are 3 points at which this graph touches the x-axis, there are 3 values of x for which f(x) = 0.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-70482e20$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 11x3 - 5x3?$qb$, null, $qb$[{"label": "A", "body": "16x3"}, {"label": "B", "body": "6x3"}, {"label": "C", "body": "6x6"}, {"label": "D", "body": "16x6"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given expression can be rewritten as 11x3 + (-5)x3. Since the two terms of this expression are both constant
multiples of x3, they are like terms and can, therefore, be combined through addition. Adding like terms in the expression 11x3 + (-5)x3 yields
6x3.
Choice A is incorrect. This is equivalent to 11x3 + 5x3 , not 11x3 - 5x3 .
Choice C is incorrect. This is equivalent to 11x6 - 5x6 , not 11x3 - 5x3 .
Choice D is incorrect. This is equivalent to 11x6 + 5x6 , not 11x3 - 5x3 .$qb$);
select seed_pool_question($qb$CB-8452c42b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 50x^(2) + 5x^(2)?$qb$, null, $qb$[{"label": "A", "body": "250x^(2)"}, {"label": "B", "body": "10x^(2)"}, {"label": "C", "body": "45x^(2)"}, {"label": "D", "body": "55x^(2)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given expression shows addition of two like terms. Therefore, the given expression is equivalent to (50 + 5)x^(2), or
55x^(2).
Choice A is incorrect. This expression is equivalent to (50)(5)x^(2), not (50 + 5)x^(2).
Choice B is incorrect. This expression is equivalent to ( 5o/5 ) x2 , not (50 + 5)x^(2) .
Choice C is incorrect. This expression is equivalent to (50 - 5)x^(2), not (50 + 5)x^(2).$qb$);
select seed_pool_question($qb$CB-b39d74a0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x y
0 0
|||| |||| ||||1 1
2 8
3 27
The table shown includes some values of x and their corresponding values of y. Which of the following graphs in the xy-plane could represent the
relationship between x and y ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b39d74a0.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Each pair of values shown in the table gives the ordered pair of coordinates for a point that lies on the graph that represents
the relationship between x and y in the xy-plane: , , , and . Only the graph in choice B passes through the points listed in
the table that are visible in the given choices.
Choices A, C, and D are incorrect. None of these graphs passes through the point .$qb$);
select seed_pool_question($qb$CB-ea6d05bb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The expression (3x - 23)(19x + 6) is equivalent to the expression ax2 + bx + c, where ab, , and c are constants. What is the value of b?$qb$, null, null, null, array[$qb$-419$qb$]::text[], $qb$The correct answer is -419. It's given that the expression (3x - 23)(19x + 6) is equivalent to the expression ax2 + bx + c, where ab, , and c
are constants. Applying the distributive property to the given expression, (3x - 23)(19x + 6) , yields
57x2 (-3x4)1(91x9x-) 1+38(3x)(6) - (23)(19x)
- (23)(6) , which can be rewritten as 57x^(2) + 18x - 437x - 138. Combining like terms yields . Since this expression is
equivalent to ax2 + bx + c, it follows that the value of b is -419.$qb$);
select seed_pool_question($qb$CB-09d21d79$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$--/--/--/--/--/--/(-| | | | | | | | | | |)6| | 4| ?| 2?| -?÷÷÷?10II| ?64224004444662222?? ?| | 2| | 4| | | x
The graph of y = 2x2 + bx + c is shown, where b and c are constants. What is the value of bc?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-09d21d79.png$qb$, null, null, array[$qb$-24$qb$]::text[], $qb$The correct answer is -24. Since the graph passes through the point , it follows that when the value of x is 0, the value of y is -6.
-6 = 2((00)^(,2)-+6)b(0) + c
Substituting 0 for x and -6 for y in the given equation yields , or -6 = c. Therefore, the value of c is -6. Substituting
-6 for c in the given equation yields y = 2x2 + bx - 6. Since the graph passes through the point (-1, -8), it follows that when the value of x
is -1, the value of y is -8. Substituting -1 for x and -8 for y in the equation y = 2x2 + bx - 6 yields -8 = 2(-1)^(2) + b(-1) - 6, or -8
= 2 - b - 6, which is equivalent to -8 = -4 - b. Adding 4 to each side of this equation yields -4 = -b. Dividing each side of this equation
by -1 yields 4 = b. Since the value of b is 4 and the value of c is -6, it follows that the value of bc is (4)(-6) , or -24.
Alternate approach: The given equation represents a parabola in the xy-plane with a vertex at (-1, -8). Therefore, the given equation, y = 2x2
+ bx + c, which is written in standard form, can be written in vertex form, y = a(x - h)^(2) + k, where (h, k) is the vertex of the parabola and a
is the value of the coefficient on the x2 term when the equation is written in standard form. It follows that a = 2. Substituting 2 for a -1,  for h,
and -8 for k in this equation yields , or y = 2(x + 1)^(2) - 8. Squaring the binomial on the right-hand side of this
y = 2(x^(2) + 2x + 1y) =- 28(^(x) - (-1))^(2) + (-8)
equation yields . Multiplying each term inside the parentheses on the right-hand side of this equation by 2 yields y
= 2x^(2) + 4x + 2 - 8, which is equivalent to y = 2x2 + 4x - 6. From the given equation y = 2x2 + bx + c, it follows that the value of b is 4
and the value of c is -6. Therefore, the value of bc is (4)(-6) , or -24.$qb$);
select seed_pool_question($qb$CB-722de804$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$(x - 47)^(2) = 1
What is the sum of the solutions to the given equation?$qb$, null, null, null, array[$qb$94$qb$]::text[], $qb$The correct answer is 94. Taking the square root of each side of the given equation yields x - 47 = 1 or x - 47 = -1 . Adding 47 to both sides
of the equation x - 47 = 1 yields x = 48. Adding 47 to both sides of the equation x - 47 = -1 yields x = 46. Therefore, the sum of the
solutions to the given equation is 48 + 46, or 94.$qb$);
select seed_pool_question($qb$CB-e833de9a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x2 + y2 = 36
y = mx + b/4
In the given system of equations, m and b are negative constants. In the xy-plane, the graphs of the equations in the given system intersect at
the point (-5, y), where y < 0. Which expression represents the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e833de9a.png$qb$, $qb$[{"label": "A", "body": "- 5m/4 + (√-11)/4"}, {"label": "B", "body": "5m/4 - (√-11)/4"}, {"label": "C", "body": "-20m + 4√-11"}, {"label": "D", "body": "20m - 4√-11"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the graphs of x2 + y2 = 36 and y = mx + b/4 , where m and b are negative constants, intersect at the point (
-5, y) in the xy-plane. It follows that this intersection point represents a solution to the given system of equations. Substituting -5 for x in the
equation x2 + y2 = 36 yields (-5)^(2) + y^(2) = 36, or 25 + y^(2) = 36. Subtracting 25 from each side of this equation yields y2 = 11. It's also
given that y < 0, so taking the negative square root of each side of this equation yields y = -√-11. Substituting -5 for x and -√-11 for  in
5m -y√-11
the equation y = mx + b/4 yields , or -√-11 = -5m + b/4 . Adding 5m to each side of this equation yields
= b/4 . Multiplying each side of this equation by -√-11 = m4(-5) +4b/((4)5m2-0m√-1-1)4√=b/11 yields . Applying the distributive property to the left-hand side of this
equation yields 20m - 4√-11 = b. Therefore, the expression represents the value of b.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-95d1c344$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$10?12?IIIIII111234567890044776699222288333355IIII?-/(-1II| 222| ?33| 444| 555| 666|)|?| | | | | | |x
The graph models the number of active projects a company was working on x months after the end of November 2012, where 0 ≤ x ≤ 6.
According to the model, what is the predicted number of active projects the company was working on at the end of November 2012?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-95d1c344.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "5"}, {"label": "C", "body": "8"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the graph models the number of active projects a company was working on x months after the end of
November 2012. Therefore, the value of x that corresponds to the end of November 2012 is 0. The point at which x = 0 is the y-intercept of the
graph. It follows that the y-intercept of the graph shown is the point (0, 5) . Therefore, according to the model, the predicted number of active
projects the company was working on at the end of November 2012 is 5.
Choice A is incorrect. This is the value of x that corresponds to the end of November 2012, not the predicted number of active projects the
company was working on at the end of November 2012.
Choice C is incorrect. This is the predicted number of active projects the company was working on 2 months after the end of November 2012.
Choice D is incorrect. This is the predicted number of active projects the company was working on 4 months after the end of November 2012.$qb$);
select seed_pool_question($qb$CB-0536ad4f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 20w - (4w + 3w)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0536ad4f.png$qb$, $qb$[{"label": "A", "body": "10w"}, {"label": "B", "body": "13w"}, {"label": "C", "body": "19w"}, {"label": "D", "body": "21w"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Combining like terms inside the parentheses of the given expression, 20w - (4w + 3w), yields 20w - (7w) . Combining
like terms in this resulting expression yields 13w.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-433184f1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which expression is equivalent to 4/(4x-5) - 1/(x+1) ?$qb$, null, $qb$[{"label": "A", "body": "1/((x+1)(4x-5))"}, {"label": "B", "body": "3/(3x-6)"}, {"label": "C", "body": "- 1/((x+1)(4x-5))"}, {"label": "D", "body": "9/((x+1)(4x-5))"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The expression can be rewritten as . To add the two terms of this expression, the terms can be
4/(4x-5) - 1/(x+1)(x+1)/(x+1) = 1
rewritten with a common denominator. Since , the expression 4/(4x-5) 4/(4+x-5)4/(4x-5)(-+1)/(x+1) (-1)/(x+1) can be rewritten as . Since , the expression
(-1)/(x+1) can be rewritten as . Therefore, the expression can be rewritten as((x+1)(4))/((x+1)(4x-5))((x+1)(4))/((x+1)(4x-5))((4x+4)++(-4x+5))/((x+1)(4x-5))(4(4x-5)/(x4-x-5)5()-=1)/((4x-5)(x+1))(1(4x+(-4x))+(4+5))/((x+1)(4x-5)), which is
((x+1)(4)+(4x-5)(-1))/((x+1)(4x-5))((4x-5)(-1))/((4x-5)(x+1))
equivalent to . Applying the distributive property to each term of the numerator yields , or .
Adding like terms in the numerator yields 9/((x+1)(4x-5)) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d135f4bf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is defined by . In the xy-plane, the graph of y = g(x) is the result of translating the graph of y
f(x) = (xg-(06))(x - 2)(x + 6)
= f(x) up 4 units. What is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d135f4bf.png$qb$, null, null, array[$qb$76$qb$]::text[], $qb$The correct answer is 76. It's given that the graph of y = g(x) is the result of translating the graph of y = f(x) up 4 units in the xy-plane. It
follows that the graph of y = g(x) is the same as the graph of y = f(x) + 4. Substituting  for y in the equation y = f(x) + 4 yields g(x)
. It's given that . Substituting (^(x) - 6)(^(x) -g2(0)g)(^(x)(=^(x)+)(06)- 6)f(0(^(x)-) 2)(0 + 6) + 4 for  in the equation
g(^(x)g) (=0)f=(^(x)7)6+ 4
yields = f(^(x)g)(+x)4= (x -g(06))(x -f2(^(x))()x=+(6^(x))-+64)(^(x) - 2)(^(x) + 6). Substituting 0 for x in this equation yields , or .
Thus, the value of  is 76.$qb$);
select seed_pool_question($qb$CB-b0543157$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$g (x ) = (x2 -x-a)/(x3-x-b)
The function g is defined by the given equation, where a and b are constants. In the xy-plane, the graph of y = g(x) passes through the point
(0, 22) , and g(-22) = 0. What is the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b0543157.png$qb$, $qb$[{"label": "A", "body": "23"}, {"label": "B", "body": "22"}, {"label": "C", "body": "-22"}, {"label": "D", "body": "-23"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that in the xy-plane, the graph of passes through the point (0, 22). It follows that g(0) = 22. Substituting
22 = (0^(2)-oy-=a)/(o^(3)-o-b) g(x)
0 for x and 22 for g(x) in the given equation yields , which is equivalent to , or . Multiplying each side of this
equation by b yields 22b = a. Substituting 22b for a in the equation defining the function  yields . It's given that g(-22) = 0.
2202=+ ((-222)g22-(=-2(-a)/(2-)-bg)2(2xb)/(2(2-^(2)-^(2))^(3)2-2(b-=^(22))-0b) )2=2 (=x2 a/(-bx) -22b)/(x3-x-b)
Substituting -22 for x and 0 for g(x) in the equation g(x) = (x^(2)-x-22b)/(x3-x-b) yields . Since a rational expression equals 0 if
and only if its numerator is 0, it follows that (-22)^(2) - (-22) - 22b = 0, or . Dividing each side of this equation by 22
yields 22 + 1 - b = 0, or 23 - b = 0. Adding b to each side of this equation yields 23 = b, so the value of b is 23.
Choice B is incorrect. This is the value of g(0) , not the value of b.
Choice C is incorrect. This is a value of x for which g(x) = 0, not the value of b.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1d3fee25$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1d3fee25.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Using the distributive property to multiply 3 and  gives , which can be rewritten as .
Choice A is incorrect and may result from rewriting the given expression as . Choice B is incorrect and may result from incorrectly
rewriting the expression as . Choice D is incorrect and may result from incorrectly rewriting the expression as .$qb$);
select seed_pool_question($qb$CB-4ca30186$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(??1??456789447766992288??55II |)/(-/-(?222 -111 ?- 111 222 333 444 555 666 777 888 999)/-÷÷2122II)|| || | || || || || || || || || || | x
The graph of a system of a linear equation and a nonlinear equation is shown. What is the solution (x, y) to this system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4ca30186.png$qb$, $qb$[{"label": "A", "body": "(0, 0)"}, {"label": "B", "body": "(0, 2)"}, {"label": "C", "body": "(2, 4)"}, {"label": "D", "body": "(4, 0)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The solution to the system of two equations corresponds to the point where the graphs of the equations intersect. The
graphs of the linear equation and the nonlinear equation shown intersect at the point (2, 4). Thus, the solution to the system is (2, 4) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-911383f2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the product of the solutions to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-911383f2.png$qb$, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "3"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. By the zero-product property, if , then , , or . Solving each of
these equations for  yields , , or . The product of these solutions is .
Choice A is incorrect and may result from sign errors made when solving the given equation. Choice B is incorrect and may result from finding
the sum, not the product, of the solutions. Choice C is incorrect and may result from finding the sum, not the product, of the solutions in addition
to making sign errors when solving the given equation.$qb$);
select seed_pool_question($qb$CB-d8789a4c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the expression above, b and c are positive integers. If the expression is equivalent to  and , which of the following could be the
value of c ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d8789a4c.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "6"}, {"label": "C", "body": "8"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. If the given expression is equivalent to , then , where x isn’t equal to b. Multiplying both sides of this
equation by  yields . Since the right-hand side of this equation is in factored form for the difference of squares,
the value of c must be a perfect square. Only choice A gives a perfect square for the value of c.
Choices B, C, and D are incorrect. None of these values of c produces a difference of squares. For example, when 6 is substituted for c in the
given expression, the result is . The expression  can’t be factored with integer values, and therefore  isn’t equivalent to
.$qb$);
select seed_pool_question($qb$CB-b80d10d7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the solution to the equation above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b80d10d7.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "2"}, {"label": "C", "body": "3"}, {"label": "D", "body": "5"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since  is equivalent to 1, the right-hand side of the given equation can be rewritten as , or .
Since the left- and right-hand sides of the equation  have the same denominator, it follows that .
Applying the distributive property of multiplication to the expression  yields , or . Therefore, .
Subtracting x and 2 from both sides of this equation yields .
Choices A, C, and D are incorrect. If , then . This can be rewritten as , which is a false statement.
Therefore, 0 isn’t a solution to the given equation. Substituting 3 and 5 into the given equation yields similarly false statements.$qb$);
select seed_pool_question($qb$CB-fde6f3bb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$g(x) = 3/5 x + 7/6
h(x) = 6x - 5
The functions g and h are defined by the equations shown. Which expression is equivalent to g(x) · h(x) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fde6f3bb.png$qb$, $qb$[{"label": "A", "body": "(18x^(2))/5 - 35/6"}, {"label": "B", "body": "(18x^(2))/5 + 27x/11 - 35/6"}, {"label": "C", "body": "(18x^(2))/5 - 4x - 35/6"}, {"label": "D", "body": "(18x^(2))/5 + 4x - 35/6"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that g(x) = 3/5 x + 7/6 and h(x) = 6x - 5. Substituting  for g(x) and 6x - 5 for h(x) in the expression
3/5 x(6x 3/(-5) x5)++7/67/6 (6x - 5)
g(x) · h(x) yields . This expression can be rewritten as , or (18x^(2))/5 - 3x + 7x - 35/6 , which is
(18x^(2))/5 +( 3/54xx+-7/6(3)5)/6(6x - 5)
equivalent to .
Choice A is incorrect. This expression is equivalent to 3/5x(6x) + 7/6 (-5), not (3/5x + 7/6) (6x - 5) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This expression is equivalent to (3/5x - 7/6) (6x + 5), not (3/5x + 7/6) (6x - 5) .$qb$);
select seed_pool_question($qb$CB-ffdfe1e1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are 240 players in a tennis competition that includes 4 rounds of matches. Each player in the competition will play a match against
another player in round 1. At the end of each round, the player who loses the match is eliminated and the player who won the match advances to
the next round to play a match against another winning player. Which equation gives the number of players, p, eliminated at the end of round r,
where r ≤ 4?$qb$, null, $qb$[{"label": "A", "body": "p = 15(1/2)r"}, {"label": "B", "body": "p = 15(2)^(r)"}, {"label": "C", "body": "p = 240(1/2)r"}, {"label": "D", "body": "p = 240(2)^(r)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that one of the two players in a match is eliminated during each round. Therefore, the number of players decreases
by half at the end of each round, and so the number of players eliminated at the end of a round also decreases by half. A decreasing exponential
equation can be written in the form p = a(1 - b)^(r), where b is the value of the decrease each round, r, and a is the value of p, the number of
players, when r = 0. It's given that there are 240 players in the tennis competition. Therefore, a = 240. Since the number of players eliminated
at the end of a round decreases by half, it follows that b = 1/2 . Substituting 240 for a and 1/2 for b in the equation p = a(1 - b)^(r) yields p
= 240(1 - 1/2)r, or p = 240(1/2)r.
Choice A is incorrect. This equation gives the number of players eliminated at the end of round r for a competition in which there are 15, not 240,
players.
Choice B is incorrect. This equation gives the number of players eliminated at the end of round r for a competition in which there are 15, not 240,
players, and for which the number of players doubles, rather than decreases by half, after each round.
Choice D is incorrect. This equation gives the number of players eliminated at the end of round r for a competition in which the number of
players doubles, rather than decreases by half, after each round.$qb$);
select seed_pool_question($qb$CB-d4950429$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A rectangle has a length of x units and a width of (x - 15) units. If the rectangle has an area of 76 square units, what is the value of x?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "19"}, {"label": "C", "body": "23"}, {"label": "D", "body": "76"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The area of a rectangle is equal to its length multiplied by its width. Multiplying the given length, x units, by the given width,
(x - 15) units, yields x(x - 15) square units. If the rectangle has an area of 76 square units, it follows that x(x - 15) = 76, or x2 - 15x
= 76. Subtracting 76 from both sides of this equation yields x^(2) - 15x - 76 = 0. Factoring the left-hand side of this equation yields
(x - 19)(x + 4) = 0. Applying the zero product property to this equation yields two solutions: x = 19 and x = -4. Since x is the rectangle’s
length, in units, which must be positive, the value of x is 19.
Choice A is incorrect. This is the width, in units, of the rectangle, not the value of x.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the area, in square units, of the rectangle, not the value of x.$qb$);
select seed_pool_question($qb$CB-752055d1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A scientist initially measures  bacteria in a growth medium. 4 hours later, the scientist measures 24,000 bacteria. Assuming exponential
P = C(21)2r,t000
growth, the formula  gives the number of bacteria in the growth medium, where r and C are constants and P is the number of
bacteria t hours after the initial measurement. What is the value of r?$qb$, null, $qb$[{"label": "A", "body": "1/(12,0o0)"}, {"label": "B", "body": "1/4"}, {"label": "C", "body": "4"}, {"label": "D", "body": "12,000"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the formula P = C(2)^(rt) gives the number of bacteria in a growth medium, where r and C are constants and
P is the number of bacteria t hours after the initial measurement. It’s also given that a scientist initially measures 12,000 bacteria in the growth
medium. Since the initial measurement is 0 hours after the initial measurement, it follows that when t = 0, P = 12,000. Substituting 0 for t and
12,000 for P in the given equation yields 12,000 = C(2)^(r)(^(0)) , or 12,000 = C(2)^(0), which is equivalent to 12,000 = C. It’s given that 4 hours
later, the scientist measures 24,000 bacteria, or when t = 4P = 24,000, . Substituting 4 for ,  for P, and 12,000 for C in the given
2t =242,040r0
equation yields 24,000 = 12,000(2)^(4r) . Dividing each side of this equation by 12,000 yields , or 21 = 24r, which is equivalent to
1 = 4r. Dividing both sides of this equation by 4 yields 1/4 = r. Therefore, the value of r is 1/4 .
Choice A is incorrect. This is the value of the reciprocal of C.
Choice C is incorrect. This is the value of the reciprocal of r.
Choice D is incorrect. This is the value of C.$qb$);
select seed_pool_question($qb$CB-d0a53ef5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$√-(x - 2)^(2) = √-3x + 34
What is the smallest solution to the given equation?$qb$, null, null, null, array[$qb$-3$qb$]::text[], $qb$The correct answer is -3. Squaring both sides of the given equation yields (x - 2)^(2) = 3x + 34, which can be rewritten as x2 - 4x + 4 = 3x
+ 34. Subtracting 3x and 34 from both sides of this equation yields x^(2) - 7x - 30 = 0. This quadratic equation can be rewritten as
(x - 10)(x + 3) = 0. According to the zero product property, (x - 10)(x + 3) equals zero when either x - 10 = 0 or x + 3 = 0. Solving
each of these equations for x yields x = 10 or x = -3. Therefore, the given equation has two solutions, 10 and -3. Of these two solutions, -3
is the smallest solution to the given equation.$qb$);
select seed_pool_question($qb$CB-3148fe3e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x^(2) + y + 10 = 10
8x + 16 - y = 0
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3148fe3e.png$qb$, $qb$[{"label": "A", "body": "-16"}, {"label": "B", "body": "-4"}, {"label": "C", "body": "2"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Adding y to each side of the second equation in the given system of equations yields 8x + 16 = y. Substituting 8x + 16
for y in the first equation yields . Subtracting 10 from each side of this equation yields x^(2) + 8x + 16 = 0.
x^(2)(x++8x4+)21=60+ 10 = 10
This equation can be rewritten as . Taking the square root of each side of this equation yields x + 4 = 0. Subtracting 4 from each
side of this equation yields x = -4. Therefore, the value of x is -4.
Choice A is incorrect. This is the value of y, not x.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-271ffad7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A quadratic function models a projectile's height, in meters, above the ground in terms of the time, in seconds, after it was launched. The model
estimates that the projectile was launched from an initial height of 7 meters above the ground and reached a maximum height of 51·1 meters
above the ground 3 seconds after the launch. How many seconds after the launch does the model estimate that the projectile will return to a
height of 7 meters?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "6"}, {"label": "C", "body": "7"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that a quadratic function models the projectile's height, in meters, above the ground in terms of the time, in
seconds, after it was launched. It follows that an equation representing the model can be written in the form f(x) = a(x - h)^(2) + k, where
f(x) is the projectile's estimated height above the ground, in meters, x seconds after the launch, a is a constant, and k is the maximum height
above the ground, in meters, the model estimates the projectile reached h seconds after the launch. It's given that the model estimates the
projectile reached a maximum height of 51·1 meters above the ground 3 seconds after the launch. Therefore, k = 51·1 and h = 3. Substituting
51·1 for k and 3 for h in the equation f(x) = a(x - h)^(2) + k yields f(x) = a(x - 3)^(2) + 51·1 . It's also given that the model estimates that
the projectile was launched from an initial height of 7 meters above the ground. Therefore, when x = 0f(x) = 7, . Substituting 0 for x and 7 for
f(x) in the equation f(x) = a(x - 3)^(2) + 51·1 yields 7 = a(0 - 3)^(2) + 51·1 , or 7 = 9a + 51·1 . Subtracting 51·1 from both sides of this
equation yields -44·1 = 9a. Dividing both sides of this equation by 9 yields -4·9 = a. Substituting  for a in the equation f(x)
f(x) = -4·9(x--4·39)^(2) + 51·1
= a(x - 3)^(2) + 51·1 yields f(x) = -4·9(x - 3)^(2) + 51·1. Therefore, the equation models the projectile's
height, in meters, above the ground x seconds after it was launched. The number of seconds after the launch that the model estimates that the
projectile will return to a height of 7 meters is the value of x when f(x) = 7. Substituting 7 for f(x) in yields 7
-44·1 = -4·9(x -f(3^(x)))^(2) = -4·9(^(x) - 3)^(2) + 51·1
= -4·9(x - 3)^(2) + 51·1. Subtracting 51·1 from both sides of this equation yields . Dividing both sides of this
equation by -4·9 yields 9 = (x - 3)^(2). Taking the square root of both sides of this equation yields two equations: 3 = x - 3 and -3 = x - 3.
Adding 3 to both sides of the equation 3 = x - 3 yields 6 = x. Adding 3 to both sides of the equation -3 = x - 3 yields 0 = x. Since 0
seconds after the launch represents the time at which the projectile was launched, 6 must be the number of seconds the model estimates that
the projectile will return to a height of 7 meters.
Alternate approach: It's given that a quadratic function models the projectile's height, in meters, above the ground in terms of the time, in
seconds, after it was launched. It's also given that the model estimates that the projectile was launched from an initial height of 7 meters above
the ground and reached a maximum height of 51·1 meters above the ground 3 seconds after the launch. Since the model is quadratic, and
quadratic functions are symmetric, the model estimates that for any given height less than the maximum height, the time the projectile takes to
travel from the given height to the maximum height is the same as the time the projectile takes to travel from the maximum height back to the
given height. Thus, since the model estimates the projectile took 3 seconds to travel from 7 meters above the ground to its maximum height of
51·1 meters above the ground, the model also estimates the projectile will take 3 more seconds to travel from its maximum height of 51·1
meters above the ground back to 7 meters above the ground. Thus, the model estimates that the projectile will return to a height of 7 meters 3
seconds after it reaches its maximum height, which is 6 seconds after the launch.
Choice A is incorrect. The model estimates that 3 seconds after the launch, the projectile reached a height of 51·1 meters, not 7 meters.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ee857afb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = x^(2) - 14x + 22
The given equation relates the variables x and y. For what value of x does the value of y reach its minimum?$qb$, null, null, null, array[$qb$7$qb$]::text[], $qb$The correct answer is 7. When an equation is of the form y = ax2 + bx + c, where ab, , and c are constants, the value of y reaches its minimum
when x = - b/2a. Since the given equation is of the form y = ax2 + bx + c, it follows that a = 1, b = -14, and c = 22. Therefore, the value of
y reaches its minimum when x = - (-14)/(2(1)) , or x = 7.$qb$);
select seed_pool_question($qb$CB-a520ba07$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to the expression above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a520ba07.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. One of the properties of radicals is . Thus, the given expression can be rewritten as .
Simplifying by taking the cube root of each part gives x1   y2, or xy2.
Choices A, C, and D are incorrect and may be the result of incorrect application of the properties of exponents and radicals.$qb$);
select seed_pool_question($qb$CB-5b6af6b1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to (d - 6) (8d^(2) - 3) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5b6af6b1.png$qb$, $qb$[{"label": "A", "body": "8d^(3) - 14d^(2) - 3d + 18"}, {"label": "B", "body": "8d^(3) - 17?^(2) + 48"}, {"label": "C", "body": "8d^(3) - 48d^(2) - 3d + 18"}, {"label": "D", "body": "8d^(3) - 51d^(2) + 48"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Applying the distributive property to the given expression yields . Applying the distributive
d (8?(^(2)--6)3()--3)6 (8d^(2) - 3)(-3d) +
property once again to this expression yields , or 8d^(3) + . This
8d^(3) - 48d^(2) -(d3)d(+8d1^(2)8) + (d)((d--3)6+) (8(-d26-) (38d)^(2)) + 8d^(3) - 48d^(2) - 3d + 18(-48d^(2)) + 18
expression can be rewritten as . Thus, is equivalent to .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-652054da$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An oceanographer uses the equation  to model the speed s, in knots, of an ocean wave, where p represents the period of the wave, in
seconds. Which of the following represents the period of the wave in terms of the speed of the wave?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-652054da.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that p represents the period of the ocean wave, so the equation  can be solved for p to represent the
period of the wave in terms of the speed of the wave. Multiplying both sides of the equation by the reciprocal of  will isolate p. This yields
, which simplifies to . Therefore, .
Choices B, C, and D are incorrect and may result from errors made when rearranging the equation to solve for p.$qb$);
select seed_pool_question($qb$CB-0380bbdc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 4√-2x = 16, what is the value of 6x?$qb$, null, $qb$[{"label": "A", "body": "24"}, {"label": "B", "body": "48"}, {"label": "C", "body": "72"}, {"label": "D", "body": "96"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Dividing each side of the given equation by 4 yields √-2x = 4. Squaring both sides of this equation yields 2x = 16.
Multiplying each side of this equation by 3 yields 6x = 48. Therefore, the value of 6x is 48.
Choice A is incorrect. This is the value of 3x, not 6x.
Choice C is incorrect. This is the value of 9x, not 6x.
Choice D is incorrect. This is the value of 12x, not 6x.$qb$);
select seed_pool_question($qb$CB-837e9da7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 1/6x . What is the value of f(x) when x = 3?$qb$, null, $qb$[{"label": "A", "body": "1/3"}, {"label": "B", "body": "1/6"}, {"label": "C", "body": "1/9"}, {"label": "D", "body": "1/18"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that f(x) = 1/6x . Substituting 3 for x in this equation yields f(3) = 1/(6(3)) , or f(3) = 1/18 . Therefore, when x = 3,
the value of f(x) is 1/18 .
Choice A is incorrect. This is the value of f(x) when x = 0· 5.
Choice B is incorrect. This is the value of f(x) when x = 1.
Choice C is incorrect. This is the value of f(x) when x = 1 · 5.$qb$);
select seed_pool_question($qb$CB-58b4c6f3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function h is defined by h (x) = a^(x) + b, where a and b are positive constants. The graph of y = h (x) in the xy-plane passes through the
points (0, 10) and (2, 13) . What is the value of ab?$qb$, null, $qb$[{"label": "A", "body": "13"}, {"label": "B", "body": "18"}, {"label": "C", "body": "20"}, {"label": "D", "body": "26"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that function h is defined by h(x) = a^(x) + b, where a and b are positive constants. It's also given that the graph of
y = h(x) in the xy-plane passes through the point (0, 10) . Substituting 0 for x and 10 for h(x) in the equation h(x) = a^(x) + b yields 10 = a0
+ b. Since a0 = 1, this equation can be rewritten as 10 = 1 + b. Subtracting 1 from both sides of this equation yields 9 = b. Substituting 9 for
b in the equation h(x) = a^(x) + b yields h(x) = a^(x) + 9. It's also given that the graph of y = h(x) in the xy-plane passes through the point
(2, 13) . Substituting 2 for x and 13 for h(x) in the equation h(x) = a^(x) + 9 yields 13 = a^(2) + 9. Subtracting 9 from both sides of this equation
yields 4 = a2 . Taking the square root of both sides of this equation yields 2 = a and -2 = a. Since a is positive, it follows that 2 = a. Since 9
= b and 2 = a, it follows that the value of ab is (2)(9), or 18.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a255ae72$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If  and , which of the following is equal to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a255ae72.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that  and . Using the distributive property, the expression  can be rewritten as
. Substituting  and  for  and , respectively, in this expression yields
. Expanding this expression yields
. Combining like terms, this expression can be rewritten as
.
Choices A, C, and D are incorrect and may result from an error in using the distributive property, substituting, or combining like terms.$qb$);
select seed_pool_question($qb$CB-dd3b1e1a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = x5 + 9x + 17
For the given function f, the graph of y= f(x) in the xy-plane passes through the point (0, b), where b is a constant. What is the value of b?$qb$, null, null, null, array[$qb$17$qb$]::text[], $qb$The correct answer is 17. It's given that the graph of y = f(x) in the xy-plane passes through the point (0, b) , where b is a constant. It follows
that f(0) equals b. Substituting 0 for x in the given function yields f(0) = 0^(5) + 9(0) + 17, or f(0) = 17. Therefore, the value of b is 17.$qb$);
select seed_pool_question($qb$CB-3de7a7d7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is a solution to the equation  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3de7a7d7.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "2"}, {"label": "C", "body": "3"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting x2 from both sides of the given equation yields x2 – 4 = 0. Adding 4 to both sides of the equation gives x2 = 4.
Taking the square root of both sides of the equation gives x = 2 or x = –2. Therefore, x = 2 is one solution to the original equation.
Alternative approach: Subtracting x2 from both sides of the given equation yields x2 – 4 = 0. Factoring this equation gives x2 – 4 = (x + 2)(x – 2) =
0, such that x = 2 or x = –2. Therefore, x = 2 is one solution to the original equation.
Choices A, C, and D are incorrect and may be the result of computation errors.$qb$);
select seed_pool_question($qb$CB-1e7a1deb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If a = 4k + 5r and b = 7k - 12r + 3, which expression is equivalent to a - b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1e7a1deb.png$qb$, $qb$[{"label": "A", "body": "-3k + 17r + 3"}, {"label": "B", "body": "-3k + 17r - 3"}, {"label": "C", "body": "-3k - 7r - 3"}, {"label": "D", "body": "-3k - 7r + 3"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Substituting 4k + 5r for a and 7k - 12r + 3 for b in the expression a - b yields (4k + 5r) - (7k - 12r + 3). This
expression can be rewritten as . By applying the distributive property, this expression can be rewritten as 4k
(4k + 5r) + (-(41k)-(7k7k-) +12r(5+r +3)12r) - 3
+ 5r - 7k + 12r - 3, which is equivalent to , or -3k + 17r- 3.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-70f98ab4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$q - 29r = s
The given equation relates the positive numbers qr, , and s. Which equation correctly expresses q in terms of r and s?$qb$, null, $qb$[{"label": "A", "body": "q = s - 29r"}, {"label": "B", "body": "q = s + 29r"}, {"label": "C", "body": "q = 29rs"}, {"label": "D", "body": "q = - s/29r"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Adding 29r to each side of the given equation yields q = s + 29r. Therefore, the equation q = s + 29r correctly expresses
q in terms of r and s.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7bbfbe70$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A lab analyst observes a sample of a substance. An exponential model estimates that the mass, in grams, of the sample decreases by 24%
every 22·96 minutes. Which of the following equations could represent this model, where M is the estimated mass, in grams, of the sample t
minutes after the lab analyst began observing the sample?$qb$, null, $qb$[{"label": "A", "body": "M = 100(0·24)^(t)+^(22)·96"}, {"label": "B", "body": "M = 100(0·24) t/(22·96)"}, {"label": "C", "body": "M = 100(0·76)^(t)+^(22)·96"}, {"label": "D", "body": "M = 100(0·76) t/(22·96)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the mass of a sample of a substance decreases by 24% every 22·96 minutes. Therefore, after each 22·96-
minute interval the mass is multiplied by 1 - 0·24, or 0·76. It’s also given that t represents the number of minutes after the lab analyst began
observing the sample; therefore, t/(22·96) represents the number of 22·96-minute intervals. The equation that could represent this model is M
= 100(0·76) t/(22·96) , where M is the estimated mass, in grams, of the sample t minutes after the lab analyst began observing it.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-35e05e19$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A park ranger hung squirrel houses each in the shape of a right rectangular prism for fox squirrels. Each house has a height of 11 inches. The
length of each house's base is x inches, which is 1 inch more than the width of the house's base. Which function V gives the volume of each
house, in cubic inches, in terms of the length of the house's base?$qb$, null, $qb$[{"label": "A", "body": "V(x) = 11x(x - 1)"}, {"label": "B", "body": "V(x) = 11x(x + 1)"}, {"label": "C", "body": "V(x) = x(x + 11) (x - 1)"}, {"label": "D", "body": "V(x) = x(x + 11) (x + 1)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The volume of a prism is equal to the area of its base times its height. It's given that the length of each house's base is x
inches and that this length is 1 inch more than the width, in inches, of the house's base. It follows that the width, in inches, of the house's base is
x - 1. The area of a rectangle is the product of its length and its width. Therefore, the area of the base of the house is x(x - 1) square inches.
It's given that the height of each house is 11 inches. Therefore, the function V that gives the volume of each house, in cubic inches, in terms of
the length of the house's base x is V(x) = x(x - 1)11, or V(x) = 11x(x - 1) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2c05d312$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$57x^(2) + (57b + a)x + ab = 0
In the given equation, a and b are positive constants. The product of the solutions to the given equation is kab, where k is a constant. What is the
value of k?$qb$, null, $qb$[{"label": "A", "body": "1/57"}, {"label": "B", "body": "1/19"}, {"label": "C", "body": "1"}, {"label": "D", "body": "57"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The left-hand side of the given equation is the expression 57x^(2) + (57b + a)x + ab. Applying the distributive property to
this expression yields 57x^(2) + 57bx + ax + ab. Since the first two terms of this expression have a common factor of 57x and the last two
terms of this expression have a common factor of a, this expression can be rewritten as 57x(x + b) + a(x + b) . Since the two terms of this
expression have a common factor of (x + b), it can be rewritten as (x + b)(57x + a) . Therefore, the given equation can be rewritten as
(x + b)(57x + a) = 0. By the zero product property, it follows that x + b = 0 or 57x + a = 0. Subtracting b from both sides of the equation
x + b = 0 yields x = -b. Subtracting a from both sides of the equation 57x + a = 0 yields 57x = -a. Dividing both sides of this equation by
57 yields . Therefore, the solutions to the given equation are -b and (-a)/57 . It follows that the product of the solutions of the given
equation is , or . It’s given that the product of the solutions of the given equation is kab. It follows that ab/57 = kab, which can also
(x1 ()/57=-=a(-a)/(bb^(5))k(^(7))((1)/57(-a)/(57)) )= a ab/(b^(5)(^(7)k) )
be written as . It’s given that a and b are positive constants. Therefore, dividing both sides of the equation ab(1/57) = ab(k) by
ab yields . Thus, the value of k is 1/57 .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1fe32f7d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-x^(2) + bx - 676 = 0
In the given equation, b is a positive integer. The equation has no real solution. What is the greatest possible value of b?$qb$, null, null, null, array[$qb$51$qb$]::text[], $qb$The correct answer is 51 . A quadratic equation of the form ax2 + bx + c = 0, where ab, , and c are constants, has no real solution if and only if
its discriminant, -4ac + b^(2) , is negative. In the given equation, a = - 1 and c = -676. Substituting -1 for a and -676 for c in this expression
yields a discriminant of b^(2) - 4(-1)(-676) , or b^(2) - 2,704. Since this value must be negative, b^(2) - 2,704 < 0, or b^(2) < 2,704. Taking the
positive square root of each side of this inequality yields b < 52. Since b is a positive integer, and the greatest integer less than 52 is 51, the
greatest possible value of b is 51.$qb$);
select seed_pool_question($qb$CB-a45ffacb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Function  is defined by f(x) = -a^(x) + b, where a and b are constants. In the xy-plane, the graph of y = f(x) - 15 has a y-intercept at
(0, -99/7)f
. The product of a and b is 65/7 . What is the value of a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a45ffacb.png$qb$, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. It’s given that f(x) = -a^(x) + b. Substituting -a^(x) + b for f(x) in the equation  yields y = -a^(x) + b
y-(=99f)/7 (x) - 15
- 15. It’s given that the y-intercept of the graph of y = f(x) - 15 is . Substituting 0 for x and  for y in the equation y = -a^(x)
+ b - 15 yields - 99/7 = -a0 + b - 15, which is equivalent to (-65)/799/7 =(a0b,--=199/7(+65))/7b - 15, or . Adding 16 to both sides of this
- 99/713/7= b - 16
equation yields 13/7 = b. It’s given that the product of a and b is , or . Substituting  for b in this equation yields (a) ( 13/7 ) = 65/7 .
Dividing both sides of this equation by 13/7 yields a = 5.$qb$);
select seed_pool_question($qb$CB-95ed0b69$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$p = ?/(4j+9)
The given equation relates the distinct positive numbers pk, , and j. Which equation correctly expresses 4j + 9 in terms of p and k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-95ed0b69.png$qb$, $qb$[{"label": "A", "body": "4j + 9 = ?/p"}, {"label": "B", "body": "4j + 9 = kp"}, {"label": "C", "body": "4j + 9 = k - p"}, {"label": "D", "body": "4j + 9 = p/?"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. To express 4j + 9 in terms of p and k, the given equation must be solved for 4j + 9. Since it's given that j is a positive
number, 4j + 9 is not equal to zero. Therefore, multiplying both sides of the given equation by 4j + 9 yields the equivalent equation p(4j + 9)
= k. Since it's given that p is a positive number, p is not equal to zero. Therefore, dividing each side of the equation p(4j + 9) = k by p yields
the equivalent equation 4j + 9 = ?/p .
Choice B is incorrect. This equation is equivalent to p = (4j+9)/k.
Choice C is incorrect. This equation is equivalent to p = k - 4j - 9.
Choice D is incorrect. This equation is equivalent to p = k(4j + 9) .$qb$);
select seed_pool_question($qb$CB-463eec13$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If , which of the following expressions is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-463eec13.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Taking the square root of an exponential expression halves the exponent, so , which further
reduces to . This can be rewritten as .
Choice A is incorrect and may result from neglecting the denominator of the given expression and from incorrectly calculating the square root of
16. Choice B is incorrect and may result from rewriting  as  rather than . Choice C is incorrect and may result from taking the square
root of the variables in the numerator twice instead of once.$qb$);
select seed_pool_question($qb$CB-821e724e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function g is defined by , where t is a constant. In the xy-plane, the graph of y = g(x) passes through the point
gg((x0)) = (x + 14)(t - x)
(24, 0) . What is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-821e724e.png$qb$, null, null, array[$qb$336$qb$]::text[], $qb$The correct answer is 336. By the zero product property, if (x + 14)(t - x) = 0, then x + 14 = 0, which gives x = -14, or (t - x) = 0,
which gives x = t. Therefore, g(x) = 0 when x = -14 and when x = t. Since the graph of y = g(x) passes through the point (24, 0) , it
follows that g(24) = 0, so t = 24. Substituting 24 for t in the equation  yields . The value
g(^(x)) =g(0(^(x)) =+ (104)+(t1-4)^(x)(2)4 - 0)g(xg) (=0)(=x +33164)(24 - x)
of g(0) can be calculated by substituting 0 for x in this equation, which yields , or .$qb$);
select seed_pool_question($qb$CB-341ba5db$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$g(x) = x^(2) + 55
What is the minimum value of the given function?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "55"}, {"label": "C", "body": "110"}, {"label": "D", "body": "3,025"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For a quadratic function defined by an equation of the form g(x) = a(x - h)^(2) + k, where ah, , and k are constants and a
> 0, the minimum value of the function is k. In the given function, a = 1, h = 0, and k = 55. Therefore, the minimum value of the given
function is 55.
Choice A is incorrect. This is the value of x for which the given function reaches its minimum value, not the minimum value of the function.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d8e84431$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The area of a rectangular banner is 2,661 square inches. The banner's length x, in inches, is 24 inches longer than its width, in inches. Which
equation represents this situation?$qb$, null, $qb$[{"label": "A", "body": "0 = x^(2) - 24x - 2,661"}, {"label": "B", "body": "0 = x^(2) - 24x + 2,661"}, {"label": "C", "body": "0 = x^(2) + 24x - 2,661"}, {"label": "D", "body": "0 = x^(2) + 24x + 2,661"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the banner’s length x, in inches, is 24 inches longer than its width, in inches. It follows that the banner’s width,
in inches, can be represented by the expression x - 24. The area of a rectangle is the product of its length and its width. It's given that the area
of the banner is 2,661 square inches, so it follows that 2,661 = x(x - 24) , or 2,661 = x^(2) - 24x. Subtracting 2,661 from each side of this
equation yields 0 = x^(2) - 24x - 2,661 . Therefore, the equation that represents this situation is 0 = x^(2) - 24x - 2,661.
Choice B is incorrect and may result from representing the width, in inches, of the banner as 24 - x, rather than x - 24.
Choice C is incorrect and may result from representing the width, in inches, of the banner as x + 24, rather than x - 24.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-18e35375$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = (x - 14)(x + 19)
The function f is defined by the given equation. For what value of x does f(x) reach its minimum?$qb$, null, $qb$[{"label": "A", "body": "-266"}, {"label": "B", "body": "-19"}, {"label": "C", "body": "- 33/2"}, {"label": "D", "body": "- 5/2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that , which can be rewritten as f(x) = x^(2) + 5x - 266. Since the coefficient of the
x2-term is positive, the graph of in the xy-plane opens upward and reaches its minimum value at its vertex. The x-coordinate of the
-yf(f=(b(x)/2axf))(=x) (x - 14)(x + 19)
vertex is the value of x such that reaches its minimum. For an equation in the form f(x) = ax2 + bx + c, where ab, , and c are constants,
the x-coordinate of the vertex is . For the equation f(x) = x^(2) + 5x - 266, a = 1 , b = 5, and c = -266. It follows that the x-coordinate of
the vertex is - 5/(2(1)), or - 5/2 . Therefore, f(x) reaches its minimum when the value of x is - 5/2 .
Alternate approach: The value of x for the vertex of a parabola is the x-value of the midpoint between the two x-intercepts of the parabola. Since
it’s given that , it follows that the two x-intercepts of the graph of  in the xy-plane occur when x = 14 and x
f(x) = (x(1-4,104))(x + 19) y =(xf2,(yx2))
= -19, or at the points  and . The midpoint between two points, (x1 , y1 ) and , is ( (x1 +x2)/2 , (y1+y2)/2 ) . Therefore, the
(-19, 0( ()14+(-19))/2 , (0+0)/2 )
midpoint between (14, 0) and (-19, 0) is , or (-5/2, 0) . It follows that f(x) reaches its minimum when the value of x is - 5/2.
Choice A is incorrect. This is the y-coordinate of the y-intercept of the graph of y= f(x) in the xy-plane.
Choice B is incorrect. This is one of the x-coordinates of the x-intercepts of the graph of y= f(x) in the xy-plane.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c303ad23$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If 3x^(2) - 18x - 15 = 0, what is the value of x2 - 6x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c303ad23.png$qb$, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. Dividing each side of the given equation by 3 yields x2 - 6x - 5 = 0. Adding 5 to each side of this equation yields x2
- 6x = 5. Therefore, if 3x^(2) - 18x - 15 = 0, the value of x2 - 6x is 5.$qb$);
select seed_pool_question($qb$CB-5da5c665$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$4x^(2) - 5x - 5 = 0
What is the greatest solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5da5c665.png$qb$, $qb$[{"label": "A", "body": "5/8 - (√-1o5)/8"}, {"label": "B", "body": "5/8 + (√-105)/8"}, {"label": "C", "body": "5/4 - (√-1o5)/4"}, {"label": "D", "body": "5/4 + (√-1o5)/4"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The solutions to a quadratic equation of the form ax2 + bx + c = 0, where ab, , and c are constants, can be calculated
using the quadratic formula x = (-b±√-b^(2)-4ac)/2a . The given equation is of this form, where a = 4, b = -5, and c = -5. Substituting these values
into the quadratic formula yields , or x = (5?√-25+80)/8 . These solutions can be rewritten as x = (5?√-105)/8 , or x = 5/8
x = (-(-5)?√-(-5)2-4(4)(-5))/(5/8 - (2√((4))/105)/8)
? (√-105)/8 . Since 5/8 + (√-105)/8 is greater than , it follows that the greatest solution to the given equation is 5/8 + (√-105)/8 .
Choice A is incorrect. This is the least, not the greatest, solution to the given equation.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-15c364bf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A sample of a certain isotope takes 29 years to decay to half its original mass. The function s (t) = 184(0·5) t/29 gives the approximate mass of
this isotope, in grams, that remains t years after a 184-gram sample starts to decay. Which statement is the best interpretation of s (87) = 23
in this context?$qb$, null, $qb$[{"label": "A", "body": "Approximately 23 grams of the sample remains 87 years after the sample starts to decay."}, {"label": "B", "body": "The mass of the sample has decreased by approximately 23 grams 87 years after the sample starts to decay."}, {"label": "C", "body": "The mass of the sample has decreased by approximately 87 grams 23 years after the sample starts to decay."}, {"label": "D", "body": "Approximately 87 grams of the sample remains 23 years after the sample starts to decay."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. In the given function, s (t) represents the approximate mass, in grams, of the sample that remains t years after the sample
starts to decay. It follows that the best interpretation of s (87) = 23 is that approximately 23 grams of the sample remains 87 years after the
sample starts to decay.
Choice B is incorrect. The mass of the sample has decreased by approximately 184 - 23, or 161, grams, not 23 grams, 87 years after the
sample starts to decay.
Choice C is incorrect. The mass of the sample has decreased by approximately 78 grams, not 87 grams, 23 years after the sample starts to
decay.
Choice D is incorrect. This would be the best interpretation of s (23) = 87, not s (87) = 23.$qb$);
select seed_pool_question($qb$CB-2cb17792$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y + k = x + 26
y - k = x2 - 5x
In the given system of equations, k is a constant. The system has exactly one distinct real solution. What is the value of k?$qb$, null, null, null, array[$qb$17.5$qb$, $qb$35/2$qb$]::text[], $qb$The correct answer is 35/2 . Subtracting the second equation from the first equation yields (y + k) - (y - k) = x + 26 - (x^(2) - 5x) , or 2k =
-x^(2) + 6x + 26. This is equivalent to x^(2) - 6x + (2k - 26) = 0. It's given that the system has exactly one distinct real solution; therefore, this
equation has exactly one distinct real solution. An equation of the form ax2 + bx + c = 0, where ab, , and c are constants, has exactly one
distinct real solution when the discriminant, b2 - 4ac, is equal to 0. The equation  is of this form, where a = 1, b =
^(x2) - 6(-^(x)6+)^(2)(-2k4-(12)6(2)k=-026)
-6, and . Substituting these values into the discriminant, b2 - 4ac, yields . Setting the discriminant equal
^(c) =(-26k)^(2)--246(1)(2k - 26) = 0
to 0 yields , or -8k + 140 = 0. Subtracting 140 from both sides of this equation yields -8k = -140. Dividing
both sides of this equation by -8 yields k = 35/2 . Note that 35/2 and 17.5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-ce508fb0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The functions f and g are defined by the given equations.
f(x) = 3 + ? - 2x - x^(2) |
g(w) = ? (-w)/(w-1) | - w + 5
If f(-4) = c, where c is a constant, what is the value of g(c)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ce508fb0.png$qb$, null, null, array[$qb$-4.9$qb$, $qb$-49/10$qb$]::text[], $qb$The correct answer is -4·9. The value of f(-4) is the value of f(x) when x = -4. Substituting -4 for x in the equation f(x) = 3
+ | -2x - x^(2) ? yields f(-4) = 3 + |-2(-4) - (-4)^(2)? , or f(-4) = 3 + |-8| , which is equivalent to f(-4) = 3 + 8, or f(-4) = 11.
Since it's given that , it follows that c = 11 and the value of is the value of g(11) . Substituting 11 for w in the equation g(w)
f(-4)g=(11^(c)) = g(11) = |-1g·1(?^(c)-) 6
= | (-w)/(w-1) ? - w + 5 yields | (-11)/(11-1) | - 11 + 5, or , which is equivalent to g(11) = 1·1 - 6, or g(11) = -4·9. Note
that -4.9 and -49/10 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-a1e65979$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is a quadratic function. In the xy-plane, the graph of y = f(x) has a vertex at (1, 9) and passes through the points (2, 33) and
(-1, 105) . What is the value of f(-2) - f(0)?$qb$, null, $qb$[{"label": "A", "body": "81"}, {"label": "B", "body": "129"}, {"label": "C", "body": "192"}, {"label": "D", "body": "225"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that function f is a quadratic function, and in the xy-plane, the graph of  has a vertex at (1, 9) . In the xy-
plane, the graph of a quadratic function with a vertex at  has an equation of the form , where a is a constant.
f (x) = a(x - (1h)2, k+) 9
Therefore, function f can be written as . It’s also given that the graph of f (x3) 3==aa(yx(2=--a1y)1(x2=)2y/(++f)9=(hx9))f2(+x)k passes through the point (2, 33).
Substituting 2 for x and 33 for f(x) in the equation f (x) = a(x - 1)^(2) + 9 yields , or . Subtracting 9 from
24 = a 24 33f=(xa) += 924(x - 1)2 + 9
both sides of this equation yields . Substituting  for a in the equation  yields . The
value of  can be found by substituting -2 for x in function f. Therefore, , which yields ,
f(-2f) (=-222)5 f (-2) = 24(-2f-(01))^(2)=+294(0 - 1)2 + 9f(-2) = 24(9f)(0+) 9
or . The value of f(0) can be found by substituting 0 for x in function . Therefore, , which yields
f(-2) - ff(0) = 192
= 24 + 9, or f(0) = 33. It follows that f(-2) - f(0) = 225 - 33, or .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of f(-2) , not the value of f(-2) - f(0) .$qb$);
select seed_pool_question($qb$CB-00165291$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The expression 6x^(4) + 31x^(2) + 35 can be rewritten as (3x^(2) + a) (2x^(2) + b) , where a and b are positive integers, or as (3x^(2) + c) (2x^(2) + d) ,
where c and d are positive nonintegers. What is the value of a + c?$qb$, null, null, null, array[$qb$15.5$qb$, $qb$31/2$qb$]::text[], $qb$The correct answer is 15·5. It’s given that 6x^(4) + 31x^(2) + 35 can be rewritten as , where a and b are positive integers. The
6x^(4) + 3bx^(2) + 2ax^(2) + ab(3^(x)6^(2)x+^(4) +^(a))((32b^(x)+^(2) +2ab))x^(2) + ab
expression  can be rewritten as , or . Therefore, the expression 6x4
+ (3b + 2a()3x^(x22)++a^(a)b) (2^(x2) + b)
is equivalent to 6x^(4) + 31x^(2) + 35. It follows that 3b + 2a = 31 and ab = 35. Since a and b are positive integers and ab
= 35, the possible values of a and b are 1 and 35, 5 and 77,  and 5, and 35 and 1, respectively. Of these options, the only pair that satisfies the
equation 3b + 2a = 31 is a = 5 and b = 7, since . It’s also given that 6x^(4) + 31x^(2) + 35 can be rewritten as
6x^(4) + 3dx^(2) + 2cx^(2) + c(d3^(x2) +6x^(c4)) (2^(x2)
, where c and d are positive nonintegers. The expression 6x34(7+) +(32d(+5()32x=c2)x3+12 +c) (c2dx2 + d) can be rewritten as , or
++ d(3)d + 2c)x^(2) + cd
. Therefore, the expression  is equivalent to 6x^(4) + 31x^(2) + 35. It follows that 3d + 2c = 31
and cd = 35. Since it's given that c and d are positive nonintegers, it follows that c and d are not zero. Thus, dividing both sides of the equation
cd = 35 by c yields d = 35/c . Substituting  for d in the equation 3d + 2c = 31 yields , or 105/c + 2c = 31 . Multiplying both
3 (35/(3^(c))1)c+ 2c = 31
sides of this equation by 2c2 - 31cc+(1o5/(10^(c)5) =+35/(^(c)02)c) = c(31)c yields , or 105 + 2c^(2) = 31c. Subtracting  from both sides of this equation yields 105
+ 2c^(2) - 31c = 0, or . This equation can be rewritten as 2c^(2) - 10c - 21c + 105 = 0. Since the first two terms of the
expression 2c^(2) - 10c - 21c + 105 have a common factor of 2c and the last two terms of the expression 2c^(2) - 10c - 21c + 105 have a
common factor of 21, the expression 2c^(2) - 10c - 21c + 105 can be rewritten as . Since each term of this expression
2^(c)(^(c) - 5)(-c -215()^(c)(2-c5-) 21)
has a common factor of , the expression 2c(c- 5) - 21(c - 5) can be rewritten as . Thus, the equation 2c^(2) - 31c
(^(c) - 5)(c - 5)(2c - 21) = 0
+ 105 = 0 can be rewritten as . It follows that c = 5 or . Since c is a positive noninteger, it follows that c = 21/2 ,
c5=+ 21/(1^(2)0) ·5
or c = 10·5. Substituting 5 for a and 10·5 for c into the expression a + c yields , or 15·5. Therefore, the value of a + c is 15·5. Note
that 15.5 and 31/2 are examples of ways to enter a correct answer.
Alternate approach: The correct answer is 15·5. It’s given that 6x^(4) + 31x^(2) + 35 can be rewritten as , where a and b are
positive integers. The expression can be rewritten as 6x^(4) + 3bx^(2) + 2ax^(2) + a(b3^(x2)6+x^(a4))+a(2b(^(x)3=b^(2) ++352b)a)x^(2) + ab, or . Therefore,
(3b + 2a)(x32x+^(2) +aba) (2x^(2) + b)
the expression 6x^(4) + is equivalent to 6x^(4) + 31x^(2) + 35. It follows that 3b + 2a = 31 and . Since it's given that a
and b are positive integers, it follows that a and b are not zero. Thus, dividing both sides of the equation ab = 35 by a yields b = 35/a .
Substituting for b in the equation 3b + 2a = 31 yields 3 (35/a) + 2a = 31 , or . Multiplying both sides of this equation by a
105 +35/(^(a)2)a2 = 31a 105/(2^(a)a)2+-23a1=a +31105 = 0
yields . Subtracting 31a from both sides of this equation yields . This equation can be rewritten as 2a2
- 10a - 21a + 105 = 0. Since the first two terms of the expression 2a^(2) - 10a - 21a + 105 have a common factor of 2a and the last two
terms of the expression 2a^(2) - 10a - 21a + 105 have a common factor of 21, the expression 2a^(2) - 10a - 21a + 105 can be rewritten as
2a(a - 5) - 21(a - 5) . Since each term of this expression has a common factor of (a - 5) , the expression 2a(a - 5) - 21(a - 5) can be
rewritten as (a - 5)(2a - 21). Thus, the equation 2a^(2) - 31a + 105 = 0 can be rewritten as (a - 5) (2a - 21) = 0. It follows that a = 5 or
a = 21/2 . Since a is a positive integer, it follows that a = 5. It’s also given that 6x^(4) + 31x^(2) + 35 can be rewritten as ,
6x^(4) + 3dx^(2) + 2cx(3^(2x)+^(2) +cd^(c)) (62x^(x42) ++ d(3)d
where c and d are positive nonintegers. The expression can be rewritten as , or
6x^(4) + (3d +(23c^(x))^(2)x+^(2) +^(c))c(d2^(x2) + d)
. Therefore, the expression is equivalent to 6x^(4) + 31x^(2) + 35. It follows that 3d + 2c = 31 and cd
+= 23c5)x^(2) + cd
. Since it's given that c and d are positive nonintegers, it follows that c and d are not zero. Thus, dividing both sides of the equation cd = 35
by c yields d = 35/c . Substituting  for d in the equation 3d + 2c = 31 yields 3 (35/c) + 2c = 31, or . Multiplying both sides of
105 + 235/(c^(c)2) = 31c 2c105/(2^(c)-) +312cc+=10351 = 0
this equation by c yields . Subtracting 31c from both sides of this equation yields . Since the equations
2a^(2) - 31a + 105 = 0 and 2c^(2) - 31c + 105 = 0 represent the same equation, it follows that a is equal to c. Therefore, c = 5 or .
c =5 21/(+^(2))10·5
Since c is a positive noninteger, it follows that c = 21/2 , or c = 10·5. Substituting 5 for a and 10·5 for c in the expression a + c yields ,
or 15·5. Therefore, the value of a + c is 15·5. Note that 15.5 and 31/2 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-74473be4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which quadratic equation has no real solutions?$qb$, null, $qb$[{"label": "A", "body": "x^(2) + 14x - 49 = 0"}, {"label": "B", "body": "x^(2) - 14x + 49 = 0"}, {"label": "C", "body": "5x^(2) - 14x - 49 = 0"}, {"label": "D", "body": "5x^(2) - 14x + 49 = 0"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The number of solutions to a quadratic equation in the form ax2 + bx + c = 0, where ab, , and c are constants, can be
determined by the value of the discriminant, b2 - 4ac. If the value of the discriminant is greater than zero, then the quadratic equation has two
distinct real solutions. If the value of the discriminant is equal to zero, then the quadratic equation has exactly one real solution. If the value of
the discriminant is less than zero, then the quadratic equation has no real solutions. For the quadratic equation in choice D, 5x^(2) - 14x + 49
= 0, a = 5b = -14, , and c = 49. Substituting 5 for a, -14 for b, and 49 for c in b2 - 4ac yields (-14)^(2) - 4(5)(49) , or -784. Since -784
is less than zero, it follows that the quadratic equation 5x^(2) - 14x + 49 = 0 has no real solutions.
Choice A is incorrect. The value of the discriminant for this quadratic equation is 392. Since 392 is greater than zero, it follows that this
quadratic equation has two real solutions.
Choice B is incorrect. The value of the discriminant for this quadratic equation is 0. Since zero is equal to zero, it follows that this quadratic
equation has exactly one real solution.
Choice C is incorrect. The value of the discriminant for this quadratic equation is 1,176. Since 1,176 is greater than zero, it follows that this
quadratic equation has two real solutions.$qb$);
select seed_pool_question($qb$CB-b5c43226$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(?10II?23456789004477669922883355II)/(?555 -444 -333 -222 -111 ? 111 222 333 444 555)|| || || || || | || || || || || |x
What is the y-intercept of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b5c43226.png$qb$, $qb$[{"label": "A", "body": "(0, 0)"}, {"label": "B", "body": "(0, 2)"}, {"label": "C", "body": "(2, 0)"}, {"label": "D", "body": "(2, 2)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The y-intercept of a graph in the xy-plane is the point at which the graph crosses the y-axis. The graph shown crosses the y-
axis at the point (0, 2). Therefore, the y-intercept of the graph shown is (0, 2).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6bd40794$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$(x - 16) (x - 10) (x + 7) (x + 17) = 0
What is a positive solution to the given equation?$qb$, null, null, null, array[$qb$10$qb$, $qb$16$qb$]::text[], $qb$The correct answer is either 10 or 16. Applying the zero product property to the given equation yields four equations: x - 16 = 0x - 10 = 0, ,
x + 7 = 0, and x + 17 = 0. Adding 16 to both sides of the equation x - 16 = 0 yields x = 16. Adding 10 to both sides of the equation x
- 10 = 0 yields x = 10. Subtracting 7 from both sides of the equation x + 7 = 0 yields x = -7. Subtracting 17 from both sides of the
equation x + 17 = 0 yields x = -17. Therefore, the solutions to the given equation are 1610, , -7, and -17. It follows that there are two
positive solutions to the given equation: 10 and 16. Note that 10 and 16 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-13e5a5d5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$5?x| = 45
What is the positive solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-13e5a5d5.png$qb$, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. Dividing both sides of the given equation by 5 yields |x| = 9. By the definition of absolute value, if |x? = 9, then x = 9
or x = -9. Therefore, the two solutions to the equation 5|x| = 45 are 9 and -9. It follows that the positive solution to the given equation is 9.$qb$);
select seed_pool_question($qb$CB-7bd10ef3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the equation above, t is a constant. If the equation has no real solutions, which of the following could be the value of t ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7bd10ef3.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "1"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The number of solutions to any quadratic equation in the form , where a, b, and c are constants, can be
found by evaluating the expression , which is called the discriminant. If the value of  is a positive number, then there will be
exactly two real solutions to the equation. If the value of  is zero, then there will be exactly one real solution to the equation. Finally, if
the value of  is negative, then there will be no real solutions to the equation.
The given equation  is a quadratic equation in one variable, where t is a constant. Subtracting t from both sides of the equation
gives . In this form, , , and . The values of t for which the equation has no real solutions are the same
values of t for which the discriminant of this equation is a negative value. The discriminant is equal to ; therefore,
. Simplifying the left side of the inequality gives . Subtracting 16 from both sides of the inequality and then
dividing both sides by 8 gives . Of the values given in the options,  is the only value that is less than . Therefore, choice A must
be the correct answer.
Choices B, C, and D are incorrect and may result from a misconception about how to use the discriminant to determine the number of solutions
of a quadratic equation in one variable.$qb$);
select seed_pool_question($qb$CB-2fec8bf4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$P(t) = 1,800(1·02)^(t)
The function P gives the estimated number of marine mammals in a certain area, where t is the number of years since a study began. What is
the best interpretation of P(0) = 1,800 in this context?$qb$, null, $qb$[{"label": "A", "body": "The estimated number of marine mammals in the area was 102 when the study began."}, {"label": "B", "body": "The estimated number of marine mammals in the area was 1,800 when the study began."}, {"label": "C", "body": "The estimated number of marine mammals in the area increased by 102 each year during the study."}, {"label": "D", "body": "The estimated number of marine mammals in the area increased by 1,800 each year during the study."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The function P gives the estimated number of marine mammals in a certain area, where t is the number of years since a
study began. Since the value of P(0) is the value of P(t) when t = 0, it follows that P(0) = 1,800 means that the value of P(t) is 1,800
when t = 0. Since t is the number of years since the study began, it follows that t = 0 is 0 years since the study began, or when the study
began. Therefore, the best interpretation of P(0) = 1,800 in this context is the estimated number of marine mammals in the area was 1,800
when the study began.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e166aca6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$10II24680044662288??/(222 444 666 888 101100)| || || || || || || || || || || |x
What is the x-intercept of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e166aca6.png$qb$, $qb$[{"label": "A", "body": "(-5, 0)"}, {"label": "B", "body": "(5, 0)"}, {"label": "C", "body": "(-4, 0)"}, {"label": "D", "body": "(4, 0)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The x-intercept of the graph shown is the point (x, y) on the graph where y = 0. At y = 0, the corresponding value of x is 4.
Therefore, the x-intercept of the graph shown is (4, 0) .
Choice A is incorrect. This is the x-intercept of a graph in the xy-plane that intersects the x-axis at x = -5, not x = 4.
Choice B is incorrect. This is the x-intercept of a graph in the xy-plane that intersects the x-axis at x = 5, not x = 4.
Choice C is incorrect. This is the x-intercept of a graph in the xy-plane that intersects the x-axis at x = -4, not x = 4.$qb$);
select seed_pool_question($qb$CB-de91a6fc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A certain bowl was sold online for prices varying between $7 and $13. The number of bowls sold can be modeled by a quadratic function based
on the price, where 5 bowls were sold for $12 each and the maximum of 9 bowls were sold for $10 each. According to the model, what is the
number of bowls that were sold for $8 each?$qb$, null, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. It’s given that the number of bowls sold can be modeled by a quadratic function based on the price, where a maximum
of 9 bowls were sold for $10 each and 5 bowls were sold for $12 each. This quadratic function can be defined by an equation of the form N(p)
= a(p - h)^(2) + k, where N(p) is the number of bowls sold when the price is $p each, and ah, , and k are constants such that the function
reaches its maximum value, k, when p = h. Since the model indicates the maximum number of bowls sold is 9 when the price is $10 each,
N(p) reaches its maximum value, 9, when p = 10. Therefore, k = 9 and h = 10. Substituting 10 for h and 9 for k in the function N(p)
yields N (p) = a(p - 10)^(2) + 9. Since the model indicates the number of bowls sold is 5 when the price is $12 each, the
= a(p -Nh()p^(2))+ k
value of  is 5 when p = 12. Substituting 12 for p and 5 for N(p) in the equation N (p) = a(p - 10)^(2) + 9 yields 5 = a(12 - 10)^(2) + 9,
or 5 = 4a + 9. Subtracting 9 from both sides of this equation yields -4 = 4a. Dividing both sides of this equation by 4 yields - 1 = a.
Therefore, the model can be represented by the equation N (p) = -(p - 10)^(2) + 9. Substituting 8 for p in this equation yields N (8) =
-(8 - 10)^(2) + 9, or N(8) = -4 + 9, or N(8) = 5. Therefore, according to the model, the number of bowls sold for $8 each was 5.$qb$);
select seed_pool_question($qb$CB-f28944ff$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$q(x) = 32(2^(x))
Which table gives three values of x and their corresponding values of q(x) for function q?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f28944ff.png$qb$, $qb$[{"label": "A", "body": "x -/(?-q(x) |)? |(--1)/(-|)|(-0)/(-|)|(-1)/(-|)| -64 0 64"}, {"label": "B", "body": "x -/(?-|)? |(--1)/(1/(-16) ?)|(-0)/(-|)|(-1)/(-|)| q(x) 2 64"}, {"label": "C", "body": "x -/(?-|)? |(--1)/(1/(-16) |)|(-0)/(-|)|(-1)/(-|)| q(x) 32 64"}, {"label": "D", "body": "x -/(?-q(x) |)? |(--1)/(-|)|(-0)/(-|)|(-1)/(-|)| 16 32 64"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Substituting -1 for x in the given function yields q(-1) = 32(2)-^(1), which is equivalent to q(-1) = 32(1/2) , or q(-1)
= 16. Therefore, when x = - 1, the corresponding value of q(x) for function q is 16. Substituting 0 for x in the given function yields q(0)
= 32(2)o, which is equivalent to q(0) = 32(1) , or q(0) = 32. Therefore, when x = 0, the corresponding value of q(x) for function q is 32.
Substituting 1 for x in the given function yields q(1) = 32(2)^(1) , which is equivalent to q(1) = 32(2) , or q(1) = 64. Therefore, when x = 1 , the
corresponding value of q(x) for function q is 64. Of the choices given, only the table in choice D gives these three values of x and their
corresponding values of q(x) for function q.
Choice A is incorrect. This table gives three values of x and their corresponding values of q(x) for the function q(x) = 32(2x).
Choice B is incorrect. This table gives three values of x and their corresponding values of q(x) for the function q(x) = 2(32)^(x) .
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-11ccf3e1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$14j + 5k = m
The given equation relates the numbers jk, , and m. Which equation correctly expresses k in terms of j and m?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-11ccf3e1.png$qb$, $qb$[{"label": "A", "body": "k = (m-14j)/5"}, {"label": "B", "body": "k = 1/5m - 14j"}, {"label": "C", "body": "k = (14j-m)/5"}, {"label": "D", "body": "k = 5m - 14j"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Subtracting 14j from each side of the given equation results in 5k = m - 14j. Dividing each side of this equation by 5
results in k = (m-14j)/5 .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-50e40f08$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = (x + 6)(x - 4)
If the given function f is graphed in the xy-plane, where y = f(x), what is the x-coordinate of an x-intercept of the graph?$qb$, null, null, null, array[$qb$-6$qb$, $qb$4$qb$]::text[], $qb$The correct answer is either -6 or 4. The x-intercepts of a graph in the xy-plane are the points where y = 0. Thus, for an x-intercept of the graph
of y= f(x) , 0 = f(x). Substituting 0 for f(x) in the equation f(x) = (x + 6)(x - 4) yields 0 = (x + 6)(x - 4). By the zero product
property, x + 6 = 0 and x - 4 = 0. Subtracting 6 from both sides of the equation x + 6 = 0 yields x = -6. Adding 4 to both sides of the
equation x - 4 = 0 yields x = 4. Therefore, the x-coordinates of the x-intercepts of the graph of y= f(x) are -6 and 4. Note that -6 and 4 are
examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-e11294f9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The solutions to x^(2) + 6x + 7 = 0 are r and s, where r < s. The solutions to x^(2) + 8x + 8 = 0 are t and u, where t < u. The solutions to
x^(2) + 14x + c = 0, where c is a constant, are r + t and s + u. What is the value of c?$qb$, null, null, null, array[$qb$31$qb$]::text[], $qb$The correct answer is 31 . Subtracting 7 from both sides of the equation x^(2) + 6x + 7 = 0 yields x2 + 6x = -7. To complete the square,
adding ( 6/2 ) 2 , or 3^(2) , to both sides of this equation yields x^(2) + 6x + 3^(2) = -7 + 3^(2), or (x + 3)^(2) = 2. Taking the square root of both sides of
this equation yields x + 3 = ±√-2. Subtracting 3 from both sides of this equation yields x = -3 ± √-2. Therefore, the solutions r and s to the
equation x^(2) + 6x + 7 = 0 are -3 - √-2 and -3 + √-2. Since r < s, it follows that r = -3 - √-2 and s = -3 + √-2. Subtracting 8 from
both sides of the equation x^(2) + 8x + 8 = 0 yields x2 + 8x = -8. To complete the square, adding ( 8/2 ) 2, or 4^(2), to both sides of this equation
yields x^(2) + 8x + 4^(2) = -8 + 4^(2), or (x + 4)^(2) = 8. Taking the square root of both sides of this equation yields x + 4 = ?√-8, or x + 4 =
±2√-2. Subtracting 4 from both sides of this equation yields x = -4 ± 2√-2. Therefore, the solutions t and u to the equation
x^(2) + 8x + 8 = 0 are -4 - 2√-2 and -4 + 2√-2. Since t < u, it follows that t = -4 - 2√-2 and u = -4 + 2√-2. It's given that the
solutions to x^(2) + 14x + c = 0, where c is a constant, are r + t and s + u. It follows that this equation can be written as
(x - (r + t))(x - (s + u)) = 0, which is equivalent to . Therefore, the value of c is
. Substituting for , x^(2) - (r + t + s + u)x +-(r4++ t2()-√(s7-2+-u3)√=-2)0(-7 + 3√-2) for , for s, and for u in this equation yields
-((r(-+(33t√ s)√+(-23u)√)+/2)(-4 - 2√-/2)3)-( (√--23 +49√r -/(-2))148+-(2-3√14-2+ 2√t -/2)3)+ √-2, which is equivalent to , or (-7)(-7)
, which is equivalent to , or . Therefore, the value of c is 31.$qb$);
select seed_pool_question($qb$CB-772de699$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 23x3 + 2x^(2) + 9x?$qb$, null, $qb$[{"label": "A", "body": "23x(x^(2) + 2x + 9)"}, {"label": "B", "body": "9x(23x3 + 2x^(2) + 1)"}, {"label": "C", "body": "x(23x^(2) + 2x + 9)"}, {"label": "D", "body": "34(x3 + x^(2) + x)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since x is a common factor of each term in the given expression, the given expression can be rewritten as
x(23x^(2) + 2x + 9) .
Choice A is incorrect. This expression is equivalent to 23x3 + 46x^(2) + 207x.
Choice B is incorrect. This expression is equivalent to 207x^(4) + 18x3 + 9x.
Choice D is incorrect. This expression is equivalent to 34x3 + 34x^(2) + 34x.$qb$);
select seed_pool_question($qb$CB-03ff48d2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x(kx - 56) = -16
In the given equation, k is an integer constant. If the equation has no real solution, what is the least possible value of k?$qb$, null, null, null, array[$qb$50$qb$]::text[], $qb$The correct answer is 50. An equation of the form ax2 + bx + c = 0, where ab, , and c are constants, has no real solutions if and only if its
discriminant, b2 - 4ac, is negative. Applying the distributive property to the left-hand side of the equation x(kx - 56) = -16 yields kx2
- 56x = -16. Adding 16 to each side of this equation yields kx^(2) - 56x + 16 = 0. Substituting k for a, -56 for b, and 16 for c in b2 - 4ac
yields a discriminant of (-56)^(2) - 4(k)(16) , or 3,136 - 64k. If the given equation has no real solution, it follows that the value of 3,136 - 64k
must be negative. Therefore, 3,136 - 64k < 0. Adding 64k to both sides of this inequality yields 3,136 < 64k. Dividing both sides of this
inequality by 64 yields 49 < k, or k > 49. Since it's given that k is an integer, the least possible value of k is 50.$qb$);
select seed_pool_question($qb$CB-7028c74f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$5(x + 7) = 15(x - 17)(x + 7)
What is the sum of the solutions to the given equation?$qb$, null, null, null, array[$qb$10.33$qb$, $qb$31/3$qb$]::text[], $qb$The correct answer is 31/3 . Subtracting 5(x + 7) from each side of the given equation yields . Since
0 = 15(^(x) - 17)(^(x)0+=75) (-x5+(^(x)7)+(37()x - 17) - 1)
5(x + 7) is a common factor of each of the terms on the right-hand side of this equation, it can be rewritten as .
This is equivalent to 0 = 5(x + 7)(3x - 51 - 1), or 0 = 5(x + 7)(3x - 52) . Dividing both sides of this equation by 5 yields 0
= (x + 7)(3x - 52) . Since a product of two factors is equal to 0 if and only if at least one of the factors is 0, either x + 7 = 0 or
3x - 52 = 0. Subtracting 7 from both sides of the equation x + 7 = 0 yields x = -7. Adding 52 to both sides of the equation 3x - 52 = 0
yields 3x = 52. Dividing both sides of this equation by 3 yields x = 52/3 . Therefore, the solutions to the given equation are -7 and 52/3 . It follows
that the sum of the solutions to the given equation is -7 + 52/3 , which is equivalent to - 21/3 + 52/3 , or 31/3 . Note that 31/3 and 10.33 are examples
of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-cfff8f8e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$At the time of posting a video, a social media channel had 53 subscribers. Each day for five days after the video was posted, the number of
subscribers doubled from the number the previous day. Which equation gives the total number of subscribers, n, to the channel d days after the
video was posted?$qb$, null, $qb$[{"label": "A", "body": "n = (53)d"}, {"label": "B", "body": "n = 53(2)d"}, {"label": "C", "body": "n = 53 ( 1/2 ) d"}, {"label": "D", "body": "n = (53)^(2) + d"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that each day for five days after a social media channel posted a video, the number of subscribers doubled from the
number the previous day. Since the number of subscribers doubled each day, the relationship between n and d can be represented by an
exponential equation of the form n = abd, where a is the number of subscribers at the time of posting the video and the number of subscribers
to the channel increases by a factor of b each day. It's given that at the time of posting the video, the channel had 53 subscribers. Therefore, a
= 53. It's also given that the number of subscribers doubled, or increased by a factor of 2, from the number the previous day. Therefore, b = 2.
Substituting 53 for a and 2 for b in the equation n = abd yields n = 53(2)d.
Choice A is incorrect. This equation gives the total number of subscribers to a channel for which the initial number of subscribers was 1 and the
number increased each day by 53 times the number from the previous day.
Choice C is incorrect. This equation gives the total number of subscribers to a channel for which the number of subscribers each day was half
the number from the previous day, rather than double the number.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-c4259674$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 4x-^(1). What is the value of f(21) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c4259674.png$qb$, $qb$[{"label": "A", "body": "-84"}, {"label": "B", "body": "1/84"}, {"label": "C", "body": "4/21"}, {"label": "D", "body": "21/4"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that function f is defined by the equation f(x) = 4x-^(1). The value of  is the value of  when x = 21.
f(21) =f4(2((11))/21) f(21) = (f4(x)/21 )
Substituting 21 for x in the given equation yields f(21) = 4(21)-^(1) , which is equivalent to , or .
Choice A is incorrect. This is the value of f(21) when f(x) = -4x, rather than f(x) = 4x-^(1).
Choice B is incorrect. This is the value of f(21) when f(x) = (4^(x))-^(1), rather than f(x) = 4x-^(1) .
Choice D is incorrect. This is the value of f(21) when f(x) = (4-^(1))x, rather than f(x) = 4x-^(1).$qb$);
select seed_pool_question($qb$CB-88867d37$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$(x + 2)(x - 5)(x + 9) = 0
What is a positive solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "4"}, {"label": "C", "body": "5"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Applying the zero product property to the given equation yields three equations: x + 2 = 0, x - 5 = 0, and x + 9 = 0.
Subtracting 2 from both sides of the equation x + 2 = 0 yields x = -2. Adding 5 to both sides of the equation x - 5 = 0 yields x = 5.
Subtracting 9 from both sides of the equation x + 9 = 0 yields x = -9. Therefore, the solutions to the given equation are -25, , and -9. It
follows that a positive solution to the given equation is 5.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-88a0c425$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-2x^(2) + 20x + c = 0
In the given equation, c is a constant. The equation has exactly one solution. What is the value of c?$qb$, null, $qb$[{"label": "A", "body": "-68"}, {"label": "B", "body": "-50"}, {"label": "C", "body": "-32"}, {"label": "D", "body": "0"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the equation -2x^(2) + 20x + c = 0, where c is a constant, has exactly one solution. A quadratic equation of
the form ax2 + bx + c = 0 has exactly one solution if and only if its discriminant, b2 - 4ac, is equal to zero. It follows that for the given
equation, a = -2 and b = 20. Substituting -2 for a and 20 for b in b2 - 4ac yields , or 400 + 8c. Since the discriminant
20^(2) - 4(-2) (^(c))8c = -400
must equal zero, it follows that 400 + 8c = 0. Subtracting 400 from both sides of this equation yields . Dividing each side of this
equation by 8 yields c = -50. Therefore, the value of c is -50.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-13e57f0a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-4x^(2) - 7x = -36
What is the positive solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-13e57f0a.png$qb$, $qb$[{"label": "A", "body": "7/4"}, {"label": "B", "body": "9/4"}, {"label": "C", "body": "4"}, {"label": "D", "body": "7"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Multiplying each side of the given equation by -16 yields 64x^(2) + 112x = 576. To complete the square, adding 49 to each
side of this equation yields 64x^(2) + 112x + 49 = 576 + 49, or (8x + 7)^(2) = 625. Taking the square root of each side of this equation yields
two equations: 8x + 7 = 25 and . Subtracting 7 from each side of the equation 8x + 7 = 25 yields 8x = 18. Dividing each
x 8=x (+18)/8 7 = -25
side of this equation by 8 yields , or x = 9/4 . Therefore, 9/4 is a solution to the given equation. Subtracting 7 from each side of the
equation 8x + 7 = -25 yields 8x = -32. Dividing each side of this equation by 8 yields x = -4. Therefore, the given equation has two
solutions, 9/4 and -4. Since 9/4 is positive, it follows that 9/4 is the positive solution to the given equation.
Alternate approach: Adding 4x2 and 7x to each side of the given equation yields 0 = 4x^(2) + 7x - 36. The right-hand side of this equation can
be rewritten as 4x^(2) + 16x - 9x - 36. Factoring out the common factor of 4x from the first two terms of this expression and the common
factor of -9 from the second two terms yields 4x(x + 4) - 9(x + 4). Factoring out the common factor of (x + 4) from these two terms
yields the expression (4x - 9)(x + 4). Since this expression is equal to 0, it follows that either 4x - 9 = 0 or x + 4 = 0. Adding 9 to each
side of the equation 4x - 9 = 0 yields 4x = 9. Dividing each side of this equation by 4 yields x = 9/4 . Therefore, 9/4 is a positive solution to the
given equation. Subtracting 4 from each side of the equation x + 4 = 0 yields x = -4. Therefore, the given equation has two solutions, 9/4 and
-4. Since 9/4 is positive, it follows that 9/4 is the positive solution to the given equation.
Choice A is incorrect. Substituting 7/4 for x in the given equation yields - 49/2 = -36, which is false.
Choice C is incorrect. Substituting 4 for x in the given equation yields -92 = -36, which is false.
Choice D is incorrect. Substituting 7 for x in the given equation yields -245 = -36, which is false.$qb$);
select seed_pool_question($qb$CB-02489d55$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 19(x^(2) - 7) ?$qb$, null, $qb$[{"label": "A", "body": "19x^(2) - 133"}, {"label": "B", "body": "19x^(2) - 26"}, {"label": "C", "body": "19x^(2) - 7"}, {"label": "D", "body": "19x^(2) + 12"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The expression 19(x^(2) - 7) can be rewritten as 19(x^(2)) - 19(7) , which is equivalent to 19x^(2) - 133.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-be0c419e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Immanuel purchased a certain rare coin on January 1. The function f(x) = 65(1·03)^(x), where 0 ≤ x ≤ 10, gives the predicted value, in dollars,
of the rare coin x years after Immanuel purchased it. What is the best interpretation of the statement “f(8) is approximately equal to 82” in this
context?$qb$, null, $qb$[{"label": "A", "body": "When the rare coin's predicted value is approximately 82 dollars, it is 8% greater than the predicted value, in dollars, on January 1 of the previous year."}, {"label": "B", "body": "When the rare coin’s predicted value is approximately 82 dollars, it is 8 times the predicted value, in dollars, on January 1 of the previous year."}, {"label": "C", "body": "From the day Immanuel purchased the rare coin to 8 years after Immanuel purchased the coin, its predicted value increased by a total of approximately 82 dollars."}, {"label": "D", "body": "8 years after Immanuel purchased the rare coin, its predicted value is approximately 82 dollars."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the function f(x) = 65(1·03)^(x) gives the predicted value, in dollars, of a certain rare coin x years after
Immanuel purchased it. It follows that f(x) represents the predicted value, in dollars, of the coin x years after Immanuel purchased it. Since the
value of f(8) is the value of f(x) when x = 8, it follows that “f(8) is approximately equal to 82” means that f(x) is approximately equal to 82
when x = 8. Therefore, the best interpretation of the statement “f(8) is approximately equal to 82” in this context is 8 years after Immanuel
purchased the rare coin, its predicted value is approximately 82 dollars.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-8462b105$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f gives the product of a number, x, and a number that is 91 more than x. Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = x^(2) + x + 91"}, {"label": "B", "body": "f(x) = x^(2) + 91"}, {"label": "C", "body": "f(x) = x^(2) + 91x"}, {"label": "D", "body": "f(x) = x^(2) + 91x + 91"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the function f gives the product of a number, x, and a number that is 91 more than x. A number that is 91
more than x can be represented by the expression x + 91 . Therefore, f can be defined by the equation f(x) = x(x + 91) , or f(x) = x2
+ 91x.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ce579859$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A model estimates that at the end of each year from 2015 to 2020, the number of squirrels in a population was 150% more than the number of
squirrels in the population at the end of the previous year. The model estimates that at the end of 2016, there were 180 squirrels in the
population. Which of the following equations represents this model, where n is the estimated number of squirrels in the population t years after
the end of 2015 and t ≤ 5?$qb$, null, $qb$[{"label": "A", "body": "n = 72(1·5)^(t)"}, {"label": "B", "body": "n = 72(2·5)^(t)"}, {"label": "C", "body": "n = 180(1·5)^(t)"}, {"label": "D", "body": "n = 180(2·5)^(t)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since the model estimates that the number of squirrels in the population increased by a fixed percentage, 150%, each year,
the model can be represented by an exponential equation of the form n = a ( 1 + p/1o0 ) t, where a is the estimated number of squirrels in the
population at the end of 2015, and the model estimates that at the end of each year, the number is p% more than the number at the end of the
previous year. Since the model estimates that at the end of each year, the number was 150% more than the number at the end of the previous
year, p = 150. Substituting 150 for p in the equation n = a ( 1 + p/100 ) t yields , which is equivalent to n = a(1 + 1·5)^(t), or n
n = a18( 10 + 150/1o0 ) t
= a(2·5)^(t). It’s given that the estimated number of squirrels at the end of 2016 was . This means that when t = 1 , n = 180. Substituting 1
for t and 180 for n in the equation n = a(2 · 5) t yields , or 180 = 2·5a. Dividing each side of this equation by 2·5 yields 72 = a.
18n0==7a2((22·5·5))^(1)t
Substituting 72 for a in the equation n = a(2 · 5) t yields .
Choice A is incorrect. This equation represents a model where at the end of each year, the estimated number of squirrels was 150% of, not
150% more than, the estimated number at the end of the previous year.
Choice C is incorrect. This equation represents a model where at the end of each year, the estimated number of squirrels was 150% of, not
150% more than, the estimated number at the end of the previous year, and the estimated number of squirrels at the end of 2015, not the end of
2016, was 180.
Choice D is incorrect. This equation represents a model where the estimated number of squirrels at the end of 2015, not the end of 2016, was
180.$qb$);
select seed_pool_question($qb$CB-5355c0ef$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$0·36x^(2) + 0·63x + 1·17
The given expression can be rewritten as a(4x^(2) + 7x + 13), where a is a constant. What is the value of a?$qb$, null, null, null, array[$qb$.09$qb$, $qb$9/100$qb$]::text[], $qb$The correct answer is ·09. It's given that the expression 0·36x^(2) + 0·63x + 1·17 can be rewritten as . Applying the
0·3^(a)6x(4^(2x)+^(2)0+·673^(x)x++113·)17
distributive property to the expression yields 4ax^(2) + 7ax + 13a. Therefore,  can be rewritten as
^(a)(4^(x2) + 7^(x) + 013·3)6x^(2) + 0·63x + 1·17
4ax^(2) + 7ax + 13a. It follows that in the expressions  and 4ax^(2) + 7ax + 13a, the coefficients of x2 are equivalent,
the coefficients of x are equivalent, and the constant terms are equivalent. Therefore, 0·36 = 4a0·63 = 7a, , and 1·17 = 13a. Solving any of
these equations for a yields the value of a. Dividing both sides of the equation 0·36 = 4a by 4 yields 0·09 = a. Therefore, the value of a is
0·09. Note that .09 and 9/100 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-2f51abc2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = |59 - 2x?
The function f is defined by the given equation. For which of the following values of k does f(k) = 3k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2f51abc2.png$qb$, $qb$[{"label": "A", "body": "59/5"}, {"label": "B", "body": "59/2"}, {"label": "C", "body": "177/5"}, {"label": "D", "body": "59"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The value of k for which f(k) = 3k can be found by substituting k for x and 3k for f(x) in the given equation, f(x)
= ?59 - 2x| , which yields 3k = |59 - 2k| . For this equation to be true, either -3k = 59 - 2k or 3k = 59 - 2k. Adding 2k to both sides of
the equation -3k = 59 - 2k yields -k = 59. Dividing both sides of this equation by -1 yields k = -59. To check whether -59 is the value
of k, substituting -59 for k in the equation 3k = |59 - 2k? yields 3(-59) = |59 - 2(-59) | , which is equivalent to -177 = ?177? , or -177
= 177, which isn't a true statement. Therefore, -59 isn't the value of k. Adding 2k to both sides of the equation 3k = 59 - 2k yields 5k = 59.
Dividing both sides of this equation by 5 yields k = 59/5 . To check whether  is the value of k, substituting 59/5 for k in the equation 3k
59/(^(5)|)177/5 ?
= ?59 - 2k? yields , which is equivalent to 177/5 = , or 177/5 = 177/5 , which is a true statement. Therefore, the value
f(k) 3=(59/(3^(5)k)) =(59?)/559 - 2(59/5) ?
of k for which is .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-17d0e87d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$14x/7y = 2√-w + 19
The given equation relates the distinct positive real numbers w x, , and y. Which equation correctly expresses w in terms of x and y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-17d0e87d.png$qb$, $qb$[{"label": "A", "body": "w = √(-x)/y - 19"}, {"label": "B", "body": "w = √(-28x)/14y - 19"}, {"label": "C", "body": "w = ( x/y ) 2 - 19"}, {"label": "D", "body": "w = ( 28x/14y ) 2 - 19"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Dividing each side of the given equation by 2 yields 14x/14y = (2√-w+19)/2 , or . Because it's given that each of the
(x/y)x/2y==w√+-w 1+9 19
variables is positive, squaring each side of this equation yields the equivalent equation . Subtracting 19 from each side of this
equation yields ( x/y ) 2 - 19 = w, or w = ( x/y ) 2 - 19.
Choice A is incorrect. This equation isn't equivalent to the given equation.
Choice B is incorrect. This equation isn't equivalent to the given equation.
Choice D is incorrect. This equation isn't equivalent to the given equation.$qb$);
select seed_pool_question($qb$CB-a1bf1c4e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the expression above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a1bf1c4e.png$qb$, $qb$[{"label": "A", "body": "(x + 3)2 + 5"}, {"label": "B", "body": "(x + 3)2 – 5"}, {"label": "C", "body": "(x – 3)2 + 5"}, {"label": "D", "body": "(x – 3)2 – 5"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given quadratic expression is in standard form, and each answer choice is in vertex form. Completing the square
converts the expression from standard form to vertex form. The first step is to rewrite the expression as follows:
. The first three terms of the revised expression can be rewritten as a perfect square as follows:
. Combining the constant terms gives .
Choice A is incorrect. Squaring the binomial and simplifying the expression in choice A gives . Combining like terms gives
, not . Choice C is incorrect. Squaring the binomial and simplifying the expression in choice C gives
. Combining like terms gives , not . Choice D is incorrect. Squaring the binomial and simplifying
the expression in choice D gives . Combining like terms gives , not .$qb$);
select seed_pool_question($qb$CB-c81b6c57$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the expression  , p is a constant. This expression is equivalent to the expression . What
is the value of p ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c81b6c57.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Using the distributive property, the first given expression can be rewritten as 6x2 + 3px + 24 – 16px – 64x + 24, and then
rewritten as 6x2 + (3p – 16p – 64)x + 24. Since the expression 6x2 + (3p – 16p – 64)x + 24 is equivalent to 6x2 – 155x + 24, the coefficients of
the x terms from each expression are equivalent to each other; thus 3p – 16p – 64 = –155. Combining like terms gives –13p – 64 = –155.
Adding 64 to both sides of the equation gives –13p = –71. Dividing both sides of the equation by –13 yields p = 7.
Choice A is incorrect. If p = –3, then the first expression would be equivalent to 6x2 – 25x + 24. Choice C is incorrect. If p = 13, then the first
expression would be equivalent to 6x2 – 233x + 24. Choice D is incorrect. If p = 155, then the first expression would be equivalent to 6x2 – 2,079x
+ 24.$qb$);
select seed_pool_question($qb$CB-d139cf4b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(t) = 55t - 2t^(2)
The function f is defined by the given equation. The function g is defined by g(t) = f(t) + 3. Which expression represents the maximum value
of g(t) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d139cf4b.png$qb$, $qb$[{"label": "A", "body": "3 + (55/2)2"}, {"label": "B", "body": "3 + 2(55/4)2"}, {"label": "C", "body": "3 - 2(55/4)2"}, {"label": "D", "body": "3 - ( 55/2 ) 2"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that function g is defined by  and that f(t) = 55t - 2t^(2). Substituting 55t - 2t^(2) for f(t) in g(t)
= f(t) + 3 yields g(t) = 55t - 2t^(2) + 3, or . The maximum value of g(t) can be found by completing the square to
rewrite the equation defining g in the form , where the maximum value of the function is k, which occurs when t = h, and
a-2 (t2 - 55/2t + (55/4)k2)=+3 3++2(2(5(5)/455/(4))gf2)(2t)g=(tg)-(=t2)ta=2(+t--525thg2t)(++2t)+35=5ktf+(t3) + 3 is a negative constant. The equation  is equivalent to , which can be rewritten as g(t) =
g(t) = -2(t - 55/4) 2 + 3 + 2(5g5/4()t2) = -2(t2 - 55/2t) + 3
, or . This equation is in the form g(t) = a(t - h)^(2) + k, where
a = -2, h = 55/4 , and . Thus, the maximum value of g(t) is .
3 + 2(55/4f)(2t)
Alternate approach: Since the function is a quadratic function, the maximum value of  occurs at the value of t that’s halfway between the
two zeros of the function. The zeros of function f can be found by substituting 0 for f(t) in the equation defining f, which yields 0 = 55t - 2t^(2).
This equation can be rewritten as 0 = t(55 - 2t). By the zero product property, it follows that t = 0 or 55 - 2t = 0. Subtracting 55 from each
side of the equation 55 - 2t = 0 yields -2t = -55. Dividing each side of this equation by -2 yields t = 55/2 . Therefore, the zeros of function f
are 0 and 55/2 . The value that’s halfway between 0 and 55/2 can be found by calculating the average of 0 and 55/2, which is , or . It follows
f ((o+ (??)/2)/(552/4 ))
that the maximum of function f occurs when t = 55/4 . Substituting 55/4 for t in the equation defining function f yields = 555/(5^(4))( 55/4 )f ( 55/4 )
, which is equivalent to = (55^(2))/4 - 2 ( (55^(2))/(4^(2)) ) . Multiplying  by 4/4 in this equation to get a common denominator yields
-= 24((55/4(55^(2)))/(4^(2)) )2 - 2 ( (55^(2))/(4g2()t)), or , which is equivalent to g(ft)(55/(^(4)3)(55^(2))/()4)= 2 ( 55/4 ) 2 . Thus, the maximum value of f(t) is 2 ( 55/4 ) 2. Since the
3 + 2(55/4gf)(2t(55/() 4=))ff=(t()55/(2^(4)+()()55^(2))/(43^(2)))
equation defining  is , the maximum value of  is  greater than the maximum value of f(t). It follows that the maximum
value of g(t) is .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-802549ac$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is a solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-802549ac.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "0"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Applying the distributive property on the left- and right-hand sides of the given equation yields
, or . Subtracting  from and adding  to both sides of this
equation yields . Subtracting 6 from both sides of this equation and then dividing both sides by 10 yields .
Choices B, C, and D are incorrect. Substituting 0, , or  for x in the given equation will result in a false statement. If , the given
equation becomes ; if , the given equation becomes ; and if , the given equation becomes .
Therefore, the values 0, , and  aren’t solutions to the given equation.$qb$);
select seed_pool_question($qb$CB-75a32330$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = x2 + 1·7
y = 1·7 - x
Which graph represents the given system of equations?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-75a32330.png$qb$, $qb$[{"label": "A", "body": "(?| -666| | -444| | -???| | ?- | 222| | 444| | ?66| |)/--/-| | | | |??| ÷|????45??447766??335511?? | | | | | | | | | x"}, {"label": "B", "body": "(????45??447766223355??)/((?-666 -444 -222 ?- ??? 444 666)/-÷?11)|| || ?|| || || || || | || || || || || || || | x"}, {"label": "C", "body": "(????45??447766223355??)/((?-666 -444 -??? ?- 222 444 ?66)/-÷?11)|| || || || ||?|| || | || || || || || || || | x"}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The graph of a quadratic equation in the form y = x2 + c has its vertex at (0, c). The first equation in the given system of
equations is y = x2 + 1·7, so the graph of this quadratic equation has its vertex at (0, 1·7) . The graph of a linear equation of the form y = b
- x has a slope of -1 and a y-intercept at (0, b) . The second equation in the given system of equations is y = 1·7 - x, so the graph of this
linear equation has a slope of -1 and a y-intercept at (0, 1·7) . Of the choices, only choice A has the graph of a quadratic equation with its vertex
at (0, 1·7) and the graph of a linear equation with a slope of -1 and a y-intercept at (0, 1·7) .
Choice B is incorrect. This graph represents a system in which the second equation is y = 1·7 + x, not y = 1·7 - x.
Choice C is incorrect. This graph represents a system in which the first equation is y = (x + 1·7)^(2), not y = x2 + 1·7.
Choice D is incorrect. This graph represents a system in which the first equation is y = (x + 1·7)^(2), not y = x2 + 1·7, and the second equation
is y = 1·7 + x, not y = 1·7 - x.$qb$);
select seed_pool_question($qb$CB-e1f9000d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$h(t) = -16t^(2) + b
The function h estimates an object’s height, in feet, above the ground t seconds after the object is dropped, where b is a constant. The function
estimates that the object is 3,364 feet above the ground when it is dropped at t = 0. Approximately how many seconds after being dropped
does the function estimate the object will hit the ground?$qb$, null, $qb$[{"label": "A", "body": "7·25"}, {"label": "B", "body": "14·50"}, {"label": "C", "body": "105·13"}, {"label": "D", "body": "210·25"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the function h estimates that the object is  feet above the ground when it's dropped at t = 0.
3,364 = -163(^(,)03)6^(2)4+ b
Substituting 3,364 for h(t) and 0 for t in the function h yields , or 3,364 = b. Substituting 3,364 for b in the function h
yields h(t) = -16t^(2) + 3,364. When the object hits the ground, its height will be 0 feet above the ground. Substituting 0 for h(t) in h(t) =
-16t^(2) + 3,364 yields 0 = -16t^(2) + 3,364. Adding 16t^(2) to each side of this equation yields 16t^(2) = 3,364. Dividing each side of this equation
by 16 yields t^(2) = 210·25. Since the object will hit the ground at a positive number of seconds after it's dropped, the value of t can be found by
taking the positive square root of each side of this equation, which yields t = 14·50. It follows that the function estimates the object will hit the
ground approximately 14·50 seconds after being dropped.
Choice A is incorrect. The function estimates that 7·25 seconds after being dropped, the object's height will be -16(7·25)^(2) + 3,364 feet, or
2,523 feet, above the ground.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a31417d1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$From 2005 through 2014, the number of music CDs sold in the United States declined each year by approximately 15% of the number sold the
preceding year. In 2005, approximately 600 million CDs were sold in the United States. Of the following, which best models C, the number of
millions of CDs sold in the United States, t years after 2005?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a31417d1.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A model for a quantity C that decreases by a certain percentage per time period t is an exponential equation in the form
, where I is the initial value at time  for r% annual decline. It’s given that C is the number of millions of CDs sold in the
United States and that t is the number of years after 2005. It’s also given that 600 million CDs were sold at time , so . This number
declines by 15% per year, so . Substituting these values into the equation produces , or .
Choice A is incorrect and may result from errors made when representing the percent decline. Choices C and D are incorrect. These equations
model exponential increases in CD sales, not exponential decreases.$qb$);
select seed_pool_question($qb$CB-66bce0c1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$What is the solution set of the equation above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-66bce0c1.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 4 from both sides of  isolates the radical expression on the left side of the equation as
follows: . Squaring both sides of  yields . This equation can be rewritten as a
quadratic equation in standard form: . One way to solve this quadratic equation is to factor the expression  by
identifying two numbers with a sum of  and a product of . These numbers are  and 1. So the quadratic equation can be factored as
. It follows that 5 and  are the solutions to the quadratic equation. However, the solutions must be verified by checking
whether 5 and satisfy the original equation, . When , the original equation gives
, or , which is false. Therefore,  does not satisfy the original equation. When , the original
equation gives , or , which is true. Therefore,  is the only solution to the original equation, and so the
solution set is .
Choices A, C, and D are incorrect because each of these sets contains at least one value that results in a false statement when substituted into
the given equation. For instance, in choice D, when 0 is substituted for x into the given equation, the result is , or
. This is not a true statement, so 0 is not a solution to the given equation.$qb$);
select seed_pool_question($qb$CB-6d04c89d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The expression 24/(6x+42) is equivalent to 4/(x+b), where b is a constant and x > 0. What is the value of b?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "10"}, {"label": "C", "body": "24"}, {"label": "D", "body": "252"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since the given expressions are equivalent and the numerator of the second expression is 1/6 of the numerator of the first
expression, the denominator of the second expression must also be 1/6 of the denominator of the first expression. By the distributive property,
1/6 (6x + 42) is equivalent to 1/6 (6x) + 1/6 (42), or x + 7. Therefore, the value of b is 7.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c946d5bd$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y
10
8
6
4
2
|| || || ?|| ?||????????? || || || || || || ? x
 5  4  3  2  1 O 1 2 3 4 5
 2
 4
 6
 8
 10
The graph of y = g(x) is shown. If g(x + 28) = 1/1o (x - a)2(x - b)2(x - c) , where ab, , and c are constants, which of the following could be
the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c946d5bd.png$qb$, $qb$[{"label": "A", "body": "31"}, {"label": "B", "body": "3"}, {"label": "C", "body": "-2"}, {"label": "D", "body": "-25"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Substituting b for x in the given equation yields g(b + 28) = 1/10 (b - a)2 (b - b)2 (b- c) , which is equivalent to g(b
, or . It follows that when x = b + 28g(x) = 0, . There are three points where the graph of y
+= 2g8(x) )= 1/10 (b - a)2 (0)2 (b(--2c,)0) (g1(,b0+) 28) (=3,00)
intersects the x-axis: , , and . Therefore, g(-2) = 0g(1) = 0, , and g(3) = 0. It follows that either b + 28 = -2, b
+ 28 = 1, or b+ 28 = 3. Subtracting 28 from each side of the equation b + 28 = -2 yields b = -30. Subtracting 28 from each side of the
equation b + 28 = 1 yields b = -27. Subtracting 28 from each side of the equation b + 28 = 3 yields b = -25. Thus, the value of b must be
either -30, -27, or -25. Of these values, only -25 is given as a choice.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This would be a possible value of b if the graph shown was the graph of y = g(x + 28), not y = g(x) .
Choice C is incorrect. This would be the value of c, not the value of b, if the graph shown was the graph of y = g(x + 28), not y = g(x) .$qb$);
select seed_pool_question($qb$CB-ebb717ab$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x2 - 34x + c = 0
In the given equation, c is a constant. The equation has no real solutions if c > n. What is the least possible value of n?$qb$, null, null, null, array[$qb$289$qb$]::text[], $qb$The correct answer is 289. A quadratic equation of the form ax2 + bx + c = 0, where ab, , and c are constants, has no real solutions when the
value of the discriminant, b2 - 4ac, is less than 0. In the given equation, x2 - 34x + c = 0, a = 1 and b = -34. Therefore, the discriminant of
the given equation can be expressed as (-34)2- 4(1)(c) , or 1,156 - 4c. It follows that the given equation has no real solutions when 1,156
- 4c < 0. Adding 4c to both sides of this inequality yields 1,156 < 4c. Dividing both sides of this inequality by 4 yields 289 < c, or c > 289.
It's given that the equation x2 - 34x + c = 0 has no real solutions when c > n. Therefore, the least possible value of n is 289.$qb$);
select seed_pool_question($qb$CB-e51bf5b1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following expressions has a factor of x + 2b, where b is a positive integer constant?$qb$, null, $qb$[{"label": "A", "body": "3x^(2) + 7x + 14b"}, {"label": "B", "body": "3x^(2) + 28x + 14b"}, {"label": "C", "body": "3x^(2) + 42x + 14b"}, {"label": "D", "body": "3x^(2) + 49x + 14b"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since each choice has a term of 3x2, which can be written as (3x)(x) , and each choice has a term of 14b, which can be
written as (7)(2b) , the expression that has a factor of x + 2b, where b is a positive integer constant, can be represented as (3x + 7)(x + 2b).
Using the distributive property of multiplication, this expression is equivalent to 3x(x + 2b) + 7(x + 2b) , or 3x^(2) + 6xb + 7x + 14b.
Combining the x-terms in this expression yields 3x^(2) + (7 + 6b)x + 14b. It follows that the coefficient of the x-term is equal to 7 + 6b. Thus,
from the given choices, must be equal to 728, , 42, or 49. Therefore, 6b must be equal to 021, , 35, or 42, respectively, and b must be
472/6+ 6b
equal to o/6 , 21/6 , 35/6 , or , respectively. Of these four values of b, only 42/6 , or 7, is a positive integer. It follows that 7 + 6b must be equal to 49
because this is the only choice for which the value of b is a positive integer constant. Therefore, the expression that has a factor of x + 2b is 3x2
+ 49x + 14b.
Choice A is incorrect. If this expression has a factor of x + 2b, then the value of b is 0, which isn't positive.
Choice B is incorrect. If this expression has a factor of x + 2b, then the value of b is 21/6 , which isn't an integer.
Choice C is incorrect. If this expression has a factor of x + 2b, then the value of b is 35/6, which isn't an integer.$qb$);
select seed_pool_question($qb$CB-197bed38$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?^(?)tm?See
dn?O??
4410205040506066223355II000000000000?(-/??)/(111 222 333 444 555 666 ?77 888 999 101100)| || || || || || || || || || || |x
bOae?
???^(t)e?
?ime (SeC0ndS)
An object was launched upward from a platform. The graph shown models the height above ground, y, in meters, of the object x seconds after it
was launched. For which of the following intervals of time was the height of the object increasing for the entire interval?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-197bed38.png$qb$, $qb$[{"label": "A", "body": "From x = 0 to x = 2"}, {"label": "B", "body": "From x = 0 to x = 4"}, {"label": "C", "body": "From x = 2 to x = 3"}, {"label": "D", "body": "From x = 3 to x = 4"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the variable y represents the height, in meters, of the object above the ground. The graph shows that the height
of the object was increasing from x = 0 to x = 2, and decreasing from x = 2 to x = 4. Therefore, the height of the object was increasing for
the entire interval of time from x = 0 to x = 2.
Choice B is incorrect. The height of the object wasn't increasing for this entire interval of time, as it was decreasing from x = 2 to x = 4.
Choice C is incorrect. The height of the object was decreasing, not increasing, for this entire interval of time.
Choice D is incorrect. The height of the object was decreasing, not increasing, for this entire interval of time.$qb$);
select seed_pool_question($qb$CB-9afe2370$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The population P of a certain city y years after the last census is modeled by the equation below, where r is a constant and  is the population
when .
If during this time the population of the city decreases by a fixed percent each year, which of the following must be true?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9afe2370.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The term (1 + r) represents a percent change. Since the population is decreasing, the percent change must be between 0%
and 100%. When the percent change is expressed as a decimal rather than as a percent, the percentage change must be between 0 and 1.
Because (1 + r) represents percent change, this can be expressed as 0 < 1 + r < 1. Subtracting 1 from all three terms of this compound inequality
results in –1 < r < 0.
Choice A is incorrect. If r < –1, then after 1 year, the population P would be a negative value, which is not possible. Choices C and D are incorrect.
For any value of r > 0, 1 + r > 1, and the exponential function models growth for positive values of the exponent. This contradicts the given
information that the population is decreasing.$qb$);
select seed_pool_question($qb$CB-60fdb4d4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-60fdb4d4.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given expression  can be rewritten as . Combining like
terms yields .
Choices B, C, and D are incorrect and may be the result of errors when applying the distributive property.$qb$);
select seed_pool_question($qb$CB-ad376f1a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(?12?456784477662288335511)/(-/--/--/--/--/--/--/-(?- - - ?-)/-888 666 444 222÷÷÷÷÷÷÷÷8765432?44776622883355II 222 444 ?666 888)|| || || || || || || || | || || || || || || || || | x
The graph of y = f(x) is shown in the xy-plane. What is the value of f(0) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ad376f1a.png$qb$, $qb$[{"label": "A", "body": "-3"}, {"label": "B", "body": "0"}, {"label": "C", "body": "3/5"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Because the graph of y = f(x) is shown, the value of is the value of y on the graph that corresponds with x = 0.
f(0)f(0)
When x = 0, the corresponding value of y is 3. Therefore, the value of is 3.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-bd4d0e0c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f (x) = 10x^(2) - 32x - 152. What is the value of f(0)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bd4d0e0c.png$qb$, $qb$[{"label": "A", "body": "-152"}, {"label": "B", "body": "-32"}, {"label": "C", "body": "0"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The value of f(0) is the value of f(x) when x = 0. The function f is defined by f (x) = 10x^(2) - 32x - 152. Substituting
0 for x in this equation yields f (0) = 10(0)^(2) - 32 (0) - 152. This equation can be rewritten as f (0) = 10 (0) - 0 - 152, or f (0) = -152.
Therefore, the value of f(0) is -152.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-db888cd6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$10II123456789004477669922883355II??/(111 222 333 444 555 666 777 888 999 101100)| || || || || || || || || || || |x
The graph gives the estimated number of catalogs y, in thousands, a company sent to its customers at the end of each year, where x represents
the number of years since the end of 1992, where 0 ≤ x ≤ 10. Which statement is the best interpretation of the y-intercept in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-db888cd6.png$qb$, $qb$[{"label": "A", "body": "The estimated total number of catalogs the company sent to its customers during the first 10 years was 9,000."}, {"label": "B", "body": "The estimated total number of catalogs the company sent to its customers from the end of 1992 to the end of 2002 was 90."}, {"label": "C", "body": "The estimated number of catalogs the company sent to its customers at the end of 1992 was 9."}, {"label": "D", "body": "The estimated number of catalogs the company sent to its customers at the end of 1992 was 9,000."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The y-intercept of the graph is the point at which the graph crosses the y-axis, or the point for which the value of x is
0. Therefore, the y-intercept of the given graph is the point (0, 9) . It's given that x represents the number of years since the end of 1992.
Therefore, x = 0 represents 0 years since the end of 1992, which is the same as the end of 1992. It's also given that y represents the estimated
number of catalogs, in thousands, that the company sent to its customers at the end of the year. Therefore, y = 9 represents 9,000 catalogs. It
follows that the y-intercept (0, 9) means that the estimated number of catalogs the company sent to its customers at the end of 1992 was
9,000.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-df71424b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y
4
2
x
 10  8  6  4  2 O 2 4 6 8 10
??|| |?|| |?|| |?|| |??||??????| || | ?|| | ?|| | ?|| | ?|| | ?|| ? 2
 4
 6
 8
 10
The graph of y = f(x) is shown, where f(x) = ab^(x) + c, and ab, , and c are constants. For how many values of x does f(x) = 0?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-df71424b.png$qb$, $qb$[{"label": "A", "body": "Three"}, {"label": "B", "body": "Two"}, {"label": "C", "body": "One"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Each point (x, y) on the graph of y= f(x) in the xy-plane gives a value of x and its corresponding value of f(x), or y. For
any value of x for which f(x) = 0, there is a corresponding point on the graph of y= f(x) with a y-coordinate of 0. A point with a y-coordinate
of 0 is a point where the graph intersects the x-axis. It's given that f(x) = ab^(x) + c, where ab, , and c are constants. In the xy-plane, the graph of
an equation of this form will lie entirely either above or below the horizontal line defined by y = c. The part of the graph of y= f(x) shown lies
entirely below the horizontal line defined by y = -7, and thus the entire graph of y= f(x) must lie below the line defined by y = -7. It follows
that the graph of y= f(x) will never intersect the x-axis. Therefore, there are zero values of x for which f(x) = 0.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-6ecdbcb4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = (x + 6)(x + 5)(x - 4)
The function f is given. Which table of values represents y = f(x) - 3?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6ecdbcb4.png$qb$, $qb$[{"label": "A", "body": "x -/6-/5-/(?-4 |)??? |||(-y)/9-/8-/(-^(1) |)|||"}, {"label": "B", "body": "x -/6-/5-/(?-^(4) |)??? |||(-y)/3-/3-/(--^(3) |)|||"}, {"label": "C", "body": "x -/6-/5-/(?-4 |)??? |||(-y)/3-/2-/(-7 |)|||"}, {"label": "D", "body": "x -/6-/5-/(?-4 |)??? |||3/3|||"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that  and y = f(x) - 3. Substituting for  in the
y =f((xx)+=6()x(x++6)5()x(x+-54)()x--34)
equation y = f(x) - 3 yields . Substituting -6 for x in this equation yields (xy =+ 6(-)(5xy++=65)()(/((-)x65-++46)5))(-(-6f5+(x-)54))(--63
- 4) - 3, or y = -3. Substituting -5 for x in the equation y = (x + 6)(x + 5)(x - 4) - 3 yields , or
y = -3. Substituting 4 for x in the equation y = (x + 6)(x + 5)(x - 4) - 3 yields y = (4 + 6)(4 + 5)(4 - 4) - 3, or y = -3. Therefore,
when x = -6 then y = -3, when x = -5 then y = -3, and when x = 4 then y = -3. Thus, the table of values in choice B represents y
= f(x) - 3.
Choice A is incorrect. This table represents y = x - 3 rather than y = f(x) - 3.
Choice C is incorrect. This table represents y = x + 3 rather than y = f(x) - 3.
Choice D is incorrect. This table represents y = f(x) + 3 rather than y = f(x) - 3.$qb$);
select seed_pool_question($qb$CB-7cb3a8ee$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$|x - 5| = 10
What is one possible solution to the given equation?$qb$, null, null, null, array[$qb$15$qb$, $qb$-5$qb$]::text[], $qb$The correct answer is 15 or -5. By the definition of absolute value, if ?x - 5? = 10, then x - 5 = 10 or x - 5 = -10. Adding 5 to both sides
of the first equation yields x = 15. Adding 5 to both sides of the second equation yields x = -5. Thus, the given equation has two possible
solutions, 15 and -5. Note that 15 and -5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-967ef685$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which expression is equivalent to 42a/? + 42ak, where k > 0?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-967ef685.png$qb$, $qb$[{"label": "A", "body": "84a/?"}, {"label": "B", "body": "(84ak^(2))/k"}, {"label": "C", "body": "(42a(?+1))/k"}, {"label": "D", "body": "(42a(?^(2)+1))/k"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Two fractions can be added together when they have a common denominator. Since k > 0, multiplying the second term in
the given expression by  yields ((42ak)?)/? , which is equivalent to (42a?^(2))/k . Therefore, the expression 42a/? + 42ak can be written as
(42a+42a?^(2))/k42a/k + (42a?^(2))/?
which is equivalent to (42a(1)+42a(k^(2)))/k(4 ?/(2?a)+42ak2)/k . Since each term in the numerator of this expression has a factor of 42a, the expression  can be
rewritten as , or (42a(1+?^(2)))/? , which is equivalent to (42a(?^(2)+1))/? .
Choice A is incorrect. This expression is equivalent to 42a/? + 42a/? .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This expression is equivalent to 42a/? + 42a.$qb$);
select seed_pool_question($qb$CB-0bebc08c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x = 3
y = (15 - x)^(2)
A solution to the given system of equations is (x, y). What is the value of xy?$qb$, null, $qb$[{"label": "A", "body": "432"}, {"label": "B", "body": "54"}, {"label": "C", "body": "45"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The first equation in the given system of equations is x = 3. Substituting 3 for x in the second equation in the given system
of equations yields y = (15 - 3)^(2), or y = 144. Substituting 3 for x and 144 for y in the expression xy yields (3)(144), or 432. Therefore, the
value of xy is 432.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c13016f9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = x^(2) + x + 71 . What is the value of f(2)?$qb$, null, null, null, array[$qb$77$qb$]::text[], $qb$The correct answer is 77. It’s given that the function f is defined by f(x) = x^(2) + x + 71. Substituting 2 for x in function f yields f(2) = (2)^(2)
+ 2 + 71 , which is equivalent to f(2) = 4 + 2 + 71, or f(2) = 77. Therefore, the value of f(2) is 77.$qb$);
select seed_pool_question($qb$CB-203774bc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The product of two positive integers is 546. If the first integer is 11 greater than twice the second integer, what is the smaller of the two
integers?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "14"}, {"label": "C", "body": "39"}, {"label": "D", "body": "78"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Let x be the first integer and let y be the second integer. If the first integer is 11 greater than twice the second integer, then
x = 2y + 11. If the product of the two integers is 546, then xy = 546. Substituting 2y + 11 for x in this equation results in (2y + 11)y
= 546. Distributing the y to both terms in the parentheses results in 2y^(2) + 11y = 546. Subtracting 546 from both sides of this equation results
in 2y^(2) + 11y - 546 = 0. The left-hand side of this equation can be factored by finding two values whose product is 2(-546) , or -1,092, and
whose sum is 11 . The two values whose product is -1,092 and whose sum is 11 are 39 and -28. Thus, the equation
(2y + 392)y(y^(2) -+ 1141)y=- 0546 = 0
can be rewritten as 2y^(2) + 28y - 39y - 546 = 0, which is equivalent to 2y(y - 14) + 39(y - 14) = 0, or . By the
zero product property, it follows that 2y + 39 = 0 and y - 14 = 0. Subtracting 39 from both sides of the equation  yields
2y-+339/29 = 0
2y = -39. Dividing both sides of this equation by 2 yields y = - 39/2 . Since y is a positive integer, the value of y is not . Adding 14 to both
sides of the equation y - 14 = 0 yields y = 14. Substituting 14 for y in the equation xy = 546 yields x(14) = 546. Dividing both sides of this
equation by 14 results in x = 39. Therefore, the two integers are 14 and 39, so the smaller of the two integers is 14.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the larger of the two integers.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b7c74b73$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = 5,470(0·64) ?/12
The function f gives the value, in dollars, of a certain piece of equipment after x months of use. If the value of the equipment decreases each
year by- p% of its value the preceding year, what is the value of p?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b7c74b73.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "5"}, {"label": "C", "body": "36"}, {"label": "D", "body": "64"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For a function of the form f(x) = a(r) ?/? , where a r, , and k are constants and r < 1, the value of f(x) decreases by
for every increase of x by k. In the given function, a = 5,470r = 0·64, , and k = 12. Therefore, for the given function, the value
10f0((x1)- r)%
of decreases by 100(1 - 0·64)%, or 36%, for every increase of x by 12. Since f(x) represents the value, in dollars, of the equipment
after x months of use, it follows that the value of the equipment decreases every 12 months by 36% of its value the preceding 12 months. Since
there are 12 months in a year, the value of the equipment decreases each year by 36% of its value the preceding year. Thus, the value of p is 36.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c1964c11$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$p + 34 = q + r
The given equation relates the variables pq, , and r. Which equation correctly expresses p in terms of q and r?$qb$, null, $qb$[{"label": "A", "body": "p = q + r + 34"}, {"label": "B", "body": "p = q + r - 34"}, {"label": "C", "body": "p = -q - r + 34"}, {"label": "D", "body": "p = -q - r - 34"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 34 from each side of the given equation yields p = q + r - 34. Thus, the equation p = q + r - 34 correctly
expresses p in terms of q and r.
Choice A is incorrect. This equation can be rewritten as p - 34 = q + r.
Choice C is incorrect. This equation can be rewritten as p - 34 = -q - r.
Choice D is incorrect. This equation can be rewritten as p + 34 = -q - r.$qb$);
select seed_pool_question($qb$CB-3d12b1e0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-16x^(2) - 8x + c = 0
In the given equation, c is a constant. The equation has exactly one solution. What is the value of c?$qb$, null, null, null, array[$qb$-1$qb$]::text[], $qb$The correct answer is -1 . A quadratic equation in the form ax2 + bx + c = 0, where ab, , and c are constants, has exactly one solution when
its discriminant, b2 - 4ac, is equal to 0. In the given equation, -16x^(2) - 8x + c = 0, a = -16 and b = -8. Substituting -16 for a and -8 for
b in b2 - 4ac yields (-8)2 - 4(-16)(c) , or 64 + 64c. Since the given equation has exactly one solution, 64 + 64c = 0. Subtracting 64 from
both sides of this equation yields 64c = -64. Dividing both sides of this equation by 64 yields c = - 1 . Therefore, the value of c is -1.$qb$);
select seed_pool_question($qb$CB-2c88af4d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The expression , where  and , is equivalent to which of the following?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2c88af4d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. For  and ,  and  are equivalent to  and , respectively. Also,  and  are equivalent to
and , respectively. Therefore, the given expression can be rewritten as .
Choices A, B, and C are incorrect because these choices are not equivalent to the given expression for  and .
For example, for  and , the value of the given expression is ; the values of the choices, however, are , , and 1,
respectively.$qb$);
select seed_pool_question($qb$CB-7d3a84bf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y
350
300
250
200
150
100
(-/-)/||?||||||||||||||||?
50
x
O 50 100 150 200 250
 50
 100
 150
200
The graph shows the estimated boiling point y, in degrees Celsius, of a normal paraffin with a molecular weight of x grams per mole, where 1
≤ x ≤ 280. Which statement is the best interpretation of the point (149·02, 186·05) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7d3a84bf.png$qb$, $qb$[{"label": "A", "body": "A normal paraffin with a molecular weight of 186·05 grams per mole has an estimated boiling point of 149·02 degrees Celsius."}, {"label": "B", "body": "A normal paraffin with a molecular weight of 149·02 grams per mole has an estimated boiling point of 186·05 degrees Celsius."}, {"label": "C", "body": "The minimum estimated boiling point for normal paraffins corresponds to a paraffin with a molecular weight of 149·02 grams per mole and an estimated boiling point of 186·05 degrees Celsius."}, {"label": "D", "body": "The maximum estimated boiling point for normal paraffins corresponds to a paraffin with a molecular weight of 149·02 grams per mole and an estimated boiling point of 186·05 degrees Celsius."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the graph shows the estimated boiling point y, in degrees Celsius, of a normal paraffin with a molecular weight
of x grams per mole. It follows that for the point (149·02, 186·05) , 149·02 represents the molecular weight, in grams per mole, of a normal
paraffin and 186·05 represents its estimated boiling point, in degrees Celsius. Therefore, the best interpretation of the point (149·02, 186·05) is
that a normal paraffin with a molecular weight of 149·02 grams per mole has an estimated boiling point of 186·05 degrees Celsius.
Choice A is incorrect. This statement represents a situation where x, not y, represents the boiling point, in degrees Celsius, and y, not x,
represents the molecular weight, in grams, per mole.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-c8db0e19$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$1/4xy + xyz = 1/3yz
In the given equation, xy, , and z are positive numbers. Which expression is equivalent to y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c8db0e19.png$qb$, $qb$[{"label": "A", "body": "(4x-3?)/12x2z2"}, {"label": "B", "body": "√ (-4x-3z)/(12x2?2)"}, {"label": "C", "body": "1/(3x?2 -4x2?)"}, {"label": "D", "body": "√ (-1)/(3x?2 -4x2?)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that in the equation , x, y, and z are positive numbers. Multiplying both sides of this equation by
the least common denominator of 12xyz yields 11/42xxyy+z ( xy1z/4xy += 1/(x3yy^(z)z) ) = 121x2yxz2(y1/(23yz^(z)2) )= 4x - 3z, which gives (12xy?)/4xy + 12x2y2z2 = (12xy?)/3yz , or 3z
+ 12x2y2z2 = 4x. Subtracting 3z from both sides of this equation yields . Dividing both sides of this equation by
12x2z2 yields . Taking the square root of both sides of this equation yields y = ± √(-4x-3z)/12x2z2. Since y is a positive number, the
√ ((y2 =)/(4x-3z))/12x2z2 (4x-3?)/12x2z2
expression  is equivalent to y.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c4cd5bcc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, the y-coordinate of the y-intercept of the graph of the function f is c. Which of the following must be equal to c ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c4cd5bcc.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A y-intercept is the point in the xy-plane where the graph of the function crosses the y-axis, which is where . It’s given
that the y-coordinate of the y-intercept of the graph of function f is c. It follows that the coordinate pair representing the y-intercept must be
. Therefore, c must equal .
Choices B, C, and D are incorrect because , , and would represent the y-value of the coordinate where , , and
, respectively.$qb$);
