-- ============================================================================
--  0082 — College Board's Mathematics questions
--
--  400 questions from College Board's SAT Suite Question Bank, into the
--  Mathematics practice pool. Part 3 of 5.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

select seed_pool_question($qb$CB-dc77e0dc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(t) = 500(0·5) t/I2
The function f models the intensity of an X-ray beam, in number of particles in the X-ray beam, t millimeters below the surface of a sample of
iron. According to the model, what is the estimated number of particles in the X-ray beam when it is at the surface of the sample of iron?$qb$, null, $qb$[{"label": "A", "body": "500"}, {"label": "B", "body": "12"}, {"label": "C", "body": "5"}, {"label": "D", "body": "2"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the function f models the intensity of an X-ray beam, in number of particles in the X-ray beam, t millimeters
below the surface of a sample of iron. When the X-ray beam is at the surface of the sample of iron, it is 0 millimeters below the surface, so the
value of t is 0. Substituting 0 for t in the function  yields f(0) = 500(0·5) o/12 . Since any positive number raised to the power
f(ft)(0=) =50500(00·5) t/12
of 0 is equal to 1, it follows that f(0) = 500(1) , or . Therefore, the estimated number of particles in the X-ray beam at the surface
of the sample of iron is 500.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-062f86db$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$5x^(2) - 37x - 24 = 0
What is the positive solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "3/5"}, {"label": "B", "body": "3"}, {"label": "C", "body": "8"}, {"label": "D", "body": "37"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The left-hand side of the given equation can be factored as (5x + 3)(x - 8). Therefore, the given equation, 5x^(2) - 37x
- 24 = 0, can be written as (5x + 3)(x - 8) = 0. Applying the zero product property to this equation yields 5x + 3 = 0 and x - 8 = 0.
Subtracting 3 from both sides of the equation 5x + 3 = 0 yields 5x = -3. Dividing both sides of this equation by 5 yields x = - 3/5 . Adding 8
to both sides of the equation x - 8 = 0 yields x = 8. Therefore, the two solutions to the given equation, 5x^(2) - 37x - 24 = 0, are - 3/5 and 8.
It follows that 8 is the positive solution to the given equation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0a74365c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The population of the town of Smithville doubled every 75 years from 1659 to 1959. The population of this town was 240,000 in 1959. What
was the population of this town in 1659?$qb$, null, null, null, array[$qb$15000$qb$]::text[], $qb$The correct answer is 15,000. Let y represent the population of Smithville x years after 1659. Since the population doubled every 75 years, the
relationship between x and y can be represented by an exponential equation in the form y = a(b) ?/? , where a is the population of Smithville in
1659 and the population increases by a factor of b every k years. It’s given that the population doubled, or increased by a factor of 2, every 75
years. Therefore, b = 2 and k = 75. Substituting 2 for b and 75 for k in the equation y = a(b) ?/? yields y = a(2) ?/(7?) . It's also given that the
population of this town was 240,000 in 1959. The number of years from 1659 to 1959 is 1959 - 1659, or 300 years. Therefore, when x
= 300, the value of y is 240,000. Substituting 300 for x and 240,000 for y in the equation y = a(2) ?/(7?) yields 240,000 = a(2) 399/(7?) , or 240,000
= a(2)^(4), which is equivalent to 240,000 = a(16). Dividing both sides of this equation by 16 yields 15,000 = a. Therefore, the population of
this town in 1659 was 15,000.$qb$);
select seed_pool_question($qb$CB-5f10c095$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$(1011123456?890044??669922883355II)/(÷(?- ?|| 444 666 ??? 10II00 121122 ?1144)/-1II)|| | || ?|| || || || || || || || || || || || || || | x
The graph of a system of a linear equation and a quadratic equation is shown. A solution to the system is (x, y) . What is a possible value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5f10c095.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "5"}, {"label": "C", "body": "7·2"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The solutions to the system correspond to the points where the graphs of the equations intersect. The graphs of the linear
equation and the quadratic equation shown intersect at approximately (4, 7·2) and (6, 7·2) . It follows that the possible values of x are 4 and 6.
Of these two possible values, only 4 is given as a choice.
Choice B is incorrect. This is the x-value of the vertex of the graph of the quadratic equation, not the x-value of a solution to the system.
Choice C is incorrect. This is the approximate y-value, not the x-value, of a solution to the system.
Choice D is incorrect. This is the x-value of an x-intercept of the graph of the quadratic equation.$qb$);
select seed_pool_question($qb$CB-ffdbcad4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The expression 4x^(2) + bx - 45, where b is a constant, can be rewritten as (hx + k)(x + j) , where h, k, and j are integer constants. Which of
the following must be an integer?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ffdbcad4.png$qb$, $qb$[{"label": "A", "body": "b/h"}, {"label": "B", "body": "b/k"}, {"label": "C", "body": "45/h"}, {"label": "D", "body": "45/?"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that 4x^(2) + bx - 45 can be rewritten as . The expression  can be rewritten as
4(xh^(2x)++bxk)-(^(x)4+5j)
hx^(2) + jhx + kx + kj, or hx^(2) + (jh + k)x + kj. Therefore, hx2 +((hjxh++kk))(xx++-(kj4j)5)/k is equivalent to . It follows that kj =
-45. Dividing each side of this equation by ? yields j = (-45)/? . Since j is an integer,  must be an integer. Therefore, 45/k must also be an
integer.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-735a0a00$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 0·25x^(2) - 7·5x + 90·25
The equation gives the estimated stock price , in dollars, for a certain company x days after a new product launched, where 0 ≤ x ≤ 20. Which
(x, y) =y (1, 83)
statement is the best interpretation of in this context?$qb$, null, $qb$[{"label": "A", "body": "The company's estimated stock price increased $83 every day after the new product launched."}, {"label": "B", "body": "The company's estimated stock price increased $1 every 83 days after the new product launched."}, {"label": "C", "body": "1 day after the new product launched, the company's estimated stock price is $83."}, {"label": "D", "body": "83 days after the new product launched, the company's estimated stock price is $1."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. In the given equation, x represents the number of days after a new product launched, where 0 ≤ x ≤ 20, and y represents
the estimated stock price, in dollars, for a certain company. Therefore, the best interpretation of (x, y) = (1, 83) in this context is that 1 day
after the new product launched, the company's estimated stock price is $83.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-68607eca$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$On April 1 , there were 233 views of an advertisement posted on a website. Every 2 days after April 1, the number of views of the advertisement
had increased by 70% of the number of views 2 days earlier. The function f gives the predicted number of views x days after April 1. Which
equation defines f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-68607eca.png$qb$, $qb$[{"label": "A", "body": "f(x) = 233(0·70) ?/2"}, {"label": "B", "body": "f(x) = 233(0·70)^(2x)"}, {"label": "C", "body": "f(x) = 233(1·70) ?/2"}, {"label": "D", "body": "f(x) = 233(1·70)^(2x)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that on April 1 , there were 233 views of the advertisement. It’s also given that every 2 days after April 1, the number
of views of the advertisement had increased by 70% of the number of views 2 days earlier. This situation can be represented by an exponential
function of the form f(x) = a ( 1 + r/100 ) x/c , where a is the number of views on April 1 and every c days after April 1, the number of views had
increased by r% of the number of views c days earlier. It follows that a = 233r = 70, , and c = 2. Substituting 233 for a70,  for r, and 2 for c in
the equation f(x) = a ( 1 + r/10o ) ?/c yields f(x) = 233(1 + 7o/100) ?/2 , or f(x) = 233(1·70) ?/2 .
Choice A is incorrect. This function gives the predicted number of views for an advertisement for which every 2 days, the number of views was
70%, rather than increased by 70%, of the number of views 2 days earlier.
Choice B is incorrect. This function gives the predicted number of views for an advertisement for which every 1/2 days, the number of views was
70% of the number of views 1/2 days earlier, rather than an advertisement for which every 2 days, the number of views had increased by 70% of
the number of views 2 days earlier.
Choice D is incorrect. This function gives the predicted number of views for an advertisement for which every 1/2 days, rather than every 2 days,
the number of views had increased by 70% of the number of views 1/2 days earlier, rather than 2 days earlier.$qb$);
select seed_pool_question($qb$CB-2d394c28$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$fbd??tmn?O?SSeee?442222333311II0000000055555555,000,000,000,000,000,000,000,000,,,,,,,,,,,,,,,,000000000000000000000000000000000000000000000000?-/(-222| 444| 666| 888| 10II00|)?|?| | | | | |x
?earSa?ter20I0
The graph shown models the number of residents of a certain city x years after 2010. How many residents does this model estimate the city
had in 2010?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2d394c28.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "2,000"}, {"label": "C", "body": "20,000"}, {"label": "D", "body": "25,000"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that x represents years after 2010. Therefore, 2010 is represented by x = 0. On the model shown, the point with
an x-coordinate of 0 has a y-coordinate of 20,000. Thus, the model estimates that in 2010, the city had 20,000 residents.
Choice A is incorrect. This is the value of x that represents the year 2010.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is approximately the number of residents the model estimates the city had in 2014, not 2010.$qb$);
select seed_pool_question($qb$CB-71014fb1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$(x - 1)^(2) = -4
How many distinct real solutions does the given equation have?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Any quantity that is positive or negative in value has a positive value when squared. Therefore, the left-hand side of the given
equation is either positive or zero for any value of x. Since the right-hand side of the given equation is negative, there is no value of x for which
the given equation is true. Thus, the number of distinct real solutions for the given equation is zero.
Choices A, B, and C are incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-5639dd1a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x2 = (22) (22)
What is the positive solution to the given equation?$qb$, null, null, null, array[$qb$22$qb$]::text[], $qb$The correct answer is 22. The given equation, x2 = (22) (22), is equivalent to x^(2) = (22)^(2). Taking the square root of each side of this equation
yields x = ±22. Thus, the positive solution to the given equation is 22.$qb$);
select seed_pool_question($qb$CB-4a5af623$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is a factor of 2x^(2) + 38x + 10?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "5x"}, {"label": "C", "body": "38x"}, {"label": "D", "body": "2x2"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since 2 is a common factor of each of the terms in the given expression, the expression can be rewritten as
2(x^(2) + 19x + 5) . Therefore, the factors of the given expression are 2 and x^(2) + 19x + 5. Of these two factors, only 2 is listed as a choice.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is a term of the given expression, not a factor of the given expression.
Choice D is incorrect. This is a term of the given expression, not a factor of the given expression.$qb$);
select seed_pool_question($qb$CB-22fd3e1f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to , for ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-22fd3e1f.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since  and , the fraction can be written as
. It is given that , so the common factor  is not equal to 0. Therefore, the fraction can be further simplified to
.
Choice A is incorrect. The expression  is not equivalent to  because at ,  as a value of 1 and  has a value of
0.
Choice B is incorrect and results from omitting the factor x in the factorization of . Choice C is incorrect and may result from incorrectly
factoring  as  instead of .$qb$);
select seed_pool_question($qb$CB-717a1964$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$z^(2) + 10z - 24 = 0
What is one of the solutions to the given equation?$qb$, null, null, null, array[$qb$2$qb$, $qb$-12$qb$]::text[], $qb$The correct answer is either 2 or -12. The left-hand side of the given equation can be rewritten by factoring. The two values that multiply to -24
and add to 10 are 12 and -2. It follows that the given equation can be rewritten as (z + 12) (z - 2) = 0. Setting each factor equal to 0 yields
two equations: z + 12 = 0 and z - 2 = 0. Subtracting 12 from both sides of the equation z + 12 = 0 results in z = -12. Adding 2 to both
sides of the equation z - 2 = 0 results in z = 2. Note that 2 and -12 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-2b6c12eb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-246844662288/(-/--/--/--/-888 666 444 222÷÷÷?864?4466??88 222 444 ??? 888)||||| || || || || || || | || || || || || ?|| || || | x
What is the x-coordinate of the x-intercept of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2b6c12eb.png$qb$, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. An x-intercept of a graph is a point on the graph where it intersects the x-axis, or where the value of y is 0. The graph
shown intersects the x-axis at the point (6, 0). Therefore, the x-coordinate of the x-intercept of the graph shown is 6.$qb$);
select seed_pool_question($qb$CB-4dc5c6f9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = 18
y = -3(x - 18)^(2) + 15
If the given equations are graphed in the xy-plane, at how many points do the graphs of the equations intersect?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A point (x, y) is a solution to a system of equations if it lies on the graphs of both equations in the xy-plane. In other words,
a solution to a system of equations is a point  at which the graphs intersect. It’s given that the first equation is y = 18. Substituting 18 for
18 = -3(x -(^(x)1^(,)8y))^(2) + 15
y in the second equation yields . Subtracting 15 from each side of this equation yields 3 = -3(x - 18)^(2) . Dividing
each side of this equation by -3 yields -1 = (x - 18)^(2) . Since the square of a real number is at least 0, this equation can't have any real
solutions. Therefore, the graphs of the equations intersect at zero points.
Alternate approach: The graph of the second equation is a parabola that opens downward and has a vertex at (18, 15). Therefore, the maximum
value of this parabola occurs when y = 15. The graph of the first equation is a horizontal line at 18 on the y-axis, or y = 18. Since 18 is greater
than 15, or the horizontal line is above the vertex of the parabola, the graphs of these equations intersect at zero points.
Choice A is incorrect. The graph of y = 15, not y = 18, and the graph of the second equation intersect at exactly one point.
Choice B is incorrect. The graph of any horizontal line such that the value of y is less than 15, not greater than 15, and the graph of the second
equation intersect at exactly two points.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-78d5f91a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the function f defined above, what is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-78d5f91a.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "7"}, {"label": "D", "body": "11"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Substituting  for x in the given function f gives , which simplifies to
. This further simplifies to , or .
Choice A is incorrect and may result from correctly substituting  for x in the function but incorrectly simplifying the resulting expression to
, or . Choice B is incorrect and may result from arithmetic errors. Choice D is incorrect and may result from
correctly substituting  for x in the function but incorrectly simplifying the expression to , or 11.$qb$);
select seed_pool_question($qb$CB-d675744f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is the graph in the xy-plane of the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d675744f.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The y-intercept of the graph of an equation is the point , where b is the value of y when . For the given equation,
when . It follows that the y-intercept of the graph of the given equation is . Additionally, for the given equation, the value of y
doubles for each increase of 1 in the value of x. Therefore, the graph contains the points , , , and . Only the graph
shown in choice D passes through these points.
Choices A and B are incorrect because these are graphs of decreasing, not increasing, exponential functions. Choice C is incorrect because the
value of y increases by a growth factor greater than 2 for each increase of 1 in the value of x.$qb$);
select seed_pool_question($qb$CB-79e6ec70$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$- 101211112468004466222288/(?10II-/--/--/-00 888 666 444 222÷÷÷642446622 222 444 ??? 888 10II00)||?|| || || || || || || || || | || || || || || || || || || || | x
What is the x-intercept of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-79e6ec70.png$qb$, $qb$[{"label": "A", "body": "(-5, 0)"}, {"label": "B", "body": "(5, 0)"}, {"label": "C", "body": "(-2, 0)"}, {"label": "D", "body": "(2, 0)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. An x-intercept of a graph in the xy-plane is a point at which the graph crosses the x-axis. The graph shown crosses the x-axis
at the point (5, 0) . Therefore, the x-intercept of the graph shown is (5, 0) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a0b4103e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The expression  can be rewritten as , where k is a positive constant. What is the value of k ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a0b4103e.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "6"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Factoring out the coefficient , the given expression can be rewritten as . The expression  can be
approached as a difference of squares and rewritten as . Therefore, k must be .
Choice A is incorrect. If k were 2, then the expression given would be rewritten as , which is equivalent to , not
.
Choice B is incorrect. This may result from incorrectly factoring the expression and finding  as the factored form of the
expression. Choice C is incorrect. This may result from incorrectly distributing the  and rewriting the expression as .$qb$);
select seed_pool_question($qb$CB-5acbdc30$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 56(0·19)^(x). For any positive integer n, the value of f(n) is p% less than the value of f(n - 1) . What is the
value of p?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5acbdc30.png$qb$, $qb$[{"label": "A", "body": "19"}, {"label": "B", "body": "44"}, {"label": "C", "body": "56"}, {"label": "D", "body": "81"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. For a function of the form f(x) = a(b)^(x) , where a and b are constants and b < 1, the value of f(x) decreases by 100(1
- b)% for every increase of x by 1. In the given function, a = 56 and b = 0·19. Therefore, for the given function, the value of  decreases
f(n -f1)(x)
by 100(1 - 0·19)%, or 81%, for every increase of x by 1. It’s given that the value of f(n) is p% less than the value of . The increase
from x = n - 1 to x = n can be expressed as n - (n - 1) , which is equivalent to n - n + 1, or 1. Since there is an increase by 1 from n - 1
to n, it follows that the value of f(n) is 81% less than the value of f(n - 1). Thus, the value of p is 81.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5377d9cf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If , what is  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5377d9cf.png$qb$, $qb$[{"label": "A", "body": "–5"}, {"label": "B", "body": "–2"}, {"label": "C", "body": "2"}, {"label": "D", "body": "5"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Substituting –1 for x in the equation that defines f gives . Simplifying the expressions in
the numerator and denominator yields , which is equal to  or –5.
Choices B, C, and D are incorrect and may result from misapplying the order of operations when substituting –1 for x.$qb$);
select seed_pool_question($qb$CB-565428e1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$√3 p-2 = t 9/7
In the given equation, p > 1 and t > 1. If t = p3n-1 , where n is a constant, what is the value of n?$qb$, null, null, null, array[$qb$.5061$qb$, $qb$.5062$qb$, $qb$41/81$qb$]::text[], $qb$The correct answer is 41/81 . An expression of the form √^(n) -a^(m), where m and n are integers greater than 1 and a ≥ 0, is equivalent to a m/n .
Therefore, the expression on the left-hand side of the given equation is equivalent to p 2/3 ; thus, p 2/3 = t 9/7 . If t = p3n-1 , where n is a constant,
then substituting p3n-1 for t in the equation yields p2/3 = p9/7 (3n-1) . It's given that p > 1 ; therefore, . Multiplying each side of
14 =2/38=1n9/7-(32n7 - 1)
this equation by 21 yields 14 = 27(3n - 1). Distributing multiplication over subtraction yields . Adding 27 to each side of this
equation yields 41 = 81n. Dividing each side of this equation by 81 yields 41/81 = n. Therefore, if t = p3n-1 , where n is a constant, the value of
n is 41/81 . Note that 41/81, .5061, .5062, and 0.506 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-2cd6b22d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$5x^(2) + 10x + 16 = 0
How many distinct real solutions does the given equation have?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The number of solutions of a quadratic equation of the form ax2 + bx + c = 0, where ab, , and c are constants, can be
determined by the value of the discriminant, b2 - 4ac. If the value of the discriminant is positive, then the quadratic equation has exactly two
distinct real solutions. If the value of the discriminant is equal to zero, then the quadratic equation has exactly one real solution. If the value of
the discriminant is negative, then the quadratic equation has zero real solutions. In the given equation, 5x^(2) + 10x + 16 = 0, a = 5b = 10, ,
and c = 16. Substituting these values for ab, , and c in b2 - 4ac yields (10)^(2) - 4(5)(16) , or -220. Since the value of its discriminant is
negative, the given equation has zero real solutions. Therefore, the number of distinct real solutions the given equation has is zero.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f2d60b99$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f(x) = 1/9 (x - 7)2 + 3 gives a metal ball's height above the ground f(x) , in inches, x seconds after it started moving on a track,
where 0 ≤ x ≤ 10. Which of the following is the best interpretation of the vertex of the graph of y= f(x) in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "The metal ball's minimum height was 3 inches above the ground."}, {"label": "B", "body": "The metal ball's minimum height was 7 inches above the ground."}, {"label": "C", "body": "The metal ball's height was 3 inches above the ground when it started moving."}, {"label": "D", "body": "The metal ball's height was 7 inches above the ground when it started moving."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The graph of a quadratic equation in the form , where ah, , and k are positive constants, is a parabola
f(x) = y1/9=(xa-(x7)-2 +h)23 + k
that opens upward with vertex (h, k) . The given function is in the form , where y= f(x) , a = 1/9 ,
y(=7, 3a)(x - h)^(2) + k
h = 7, and k = 3. Therefore, the graph of y= f(x) is a parabola that opens upward with vertex . Since the parabola opens upward, the
vertex is the lowest point on the graph. It follows that the y-coordinate of the vertex of the graph of y = f(x) is the minimum value of f(x).
Therefore, the minimum value of f(x) is 3. It’s given that f(x) = 1/9 (x - 7)2 + 3 represents the metal ball’s height above the ground, in inches,
x seconds after it started moving on a track. Therefore, the best interpretation of the vertex of the graph of y= f(x) is that the metal ball’s
minimum height was 3 inches above the ground.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f880f910$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The area of a triangle is 270 square centimeters. The length of the base of the triangle is 12 centimeters greater than the height of the triangle.
What is the height, in centimeters, of the triangle?$qb$, null, $qb$[{"label": "A", "body": "15"}, {"label": "B", "body": "18"}, {"label": "C", "body": "30"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The area, A, of a triangle is given by the formula A = 1/2bh, where b represents the length of the base of the triangle and h
represents its height. It’s given that the area of a triangle is 270 square centimeters and that the length of the base of this triangle is 12
centimeters greater than the height of the triangle. Let x represent the height, in centimeters, of the triangle. It follows that the length of the base
of the triangle can be expressed as x + 12. Substituting 270 for Ax,  for h, and x + 12 for b in the formula A = 1/2bh yields 270 = 1/2 (x
+ 12) (x) , or 270 = 1/2x(x + 12) . Multiplying both sides of this equation by 2 yields 540 = x(x + 12). Applying the distributive property on
the right-hand side of this equation yields 540 = x^(2) + 12x. Subtracting 540 from both sides of this equation yields 0 = x^(2) + 12x - 540. In
factored form, this equation is equivalent to (x + 30)(x - 18) = 0. Applying the zero product property, it follows that x + 30 = 0 or x - 18
= 0. Subtracting 30 from both sides of the equation x + 30 = 0 yields x = -30. Adding 18 to both sides of the equation x - 18 = 0 yields x
= 18. Since x represents the height of the triangle, it must be positive. Therefore, the height, in centimeters, of the triangle is 18.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-36b6f8ba$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y
10
8
6
4
-/-??|| ??????? || ?|| ?|| ?|| ?|| ?|| ?
2
x
 1 O 1 2 3 4 5
 2
 4
The graph of y = f(x) + 4 is shown. Which equation defines function f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-36b6f8ba.png$qb$, $qb$[{"label": "A", "body": "f(x) = -3^(x) + 1"}, {"label": "B", "body": "f(x) = -3^(x) + 5"}, {"label": "C", "body": "f(x) = -3^(x) + 8"}, {"label": "D", "body": "f(x) = -3^(x) + 9"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The graph of y = f(x) + 4 is shown, and the graph passes through the point (0, 8). Substituting 0 for x and 8 for y in this
equation yields 8 = f(0) + 4. Subtracting 4 from both sides of this equation yields 4 = f(0). Therefore, when x = 0, the value of f(x) is 4.
Each of the given choices is in the form f(x) = -3^(x) + k, where k is a constant. Substituting 0 for x and 4 for f(x) in this equation yields 4 =
-3^(0) + k, or 4 = -1 + k. Adding 1 to both sides of this equation yields 5 = k. Substituting 5 for k in the equation f(x) = -3^(x) + k yields
f(x) = -3^(x) + 5.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e9349667$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If  and  are the two solutions to the system of equations above, what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e9349667.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The system of equations can be solved using the substitution method. Solving the second equation for y gives y = –x – 1.
Substituting the expression –x – 1 for y into the first equation gives –x – 1 = x2 + 2x + 1. Adding x + 1 to both sides of the equation yields x2 + 3x
+ 2 = 0. The left-hand side of the equation can be factored by finding two numbers whose sum is 3 and whose product is 2, which gives (x + 2)(x
+ 1) = 0. Setting each factor equal to 0 yields x + 2 = 0 and x + 1 = 0, and solving for x yields x = –2 or x = –1. These values of x can be substituted
for x in the equation y = –x – 1 to find the corresponding y-values: y = –(–2) – 1 = 2 – 1 = 1 and y = –(–1) – 1 = 1 – 1 = 0. It follows that (–2, 1)
and (–1, 0) are the solutions to the given system of equations. Therefore, (x1, y1) = (–2, 1), (x2, y2) = (–1, 0), and y1 + y2 = 1 + 0 = 1.
Choice A is incorrect. The solutions to the system of equations are (x1, y1) = (–2, 1) and (x2, y2) = (–1, 0). Therefore, –3 is the sum of the x-
coordinates of the solutions, not the sum of the y-coordinates of the solutions. Choices B and C are incorrect and may be the result of
computation or substitution errors.$qb$);
select seed_pool_question($qb$CB-67f4b449$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f(w) = 6w^(2) gives the area of a rectangle, in Square feet (ft^(2)) , if its width is wft and its length is 6 times its width. Which of
the following is the best interpretation of f(14) = 1,176?$qb$, null, $qb$[{"label": "A", "body": "If the width of the rectangle is 14ft, then the area of the rectangle is 1,176ft^(2) ."}, {"label": "B", "body": "If the width of the rectangle is 14ft, then the length of the rectangle is 1,176ft."}, {"label": "C", "body": "If the width of the rectangle is 1,176ft, then the length of the rectangle is 14ft."}, {"label": "D", "body": "If the width of the rectangle is 1,176ft, then the area of the rectangle is 14ft^(2)."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The function f gives the area of the rectangle, in ft2 , if its width is wft. Since the value of f(14) is the value of f(w) if
w = 14, it follows that f(14) = 1,176 means that f(w) is 1,176 if w = 14. In the given context, this means that if the width of the rectangle is
14ft, then the area of the rectangle is 1,176ft^(2) .
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from interpreting f(w) as the width, in ft, of the rectangle if its area is wft2 , rather than as the area, in ft2 ,
of the rectangle if its width is wft.$qb$);
select seed_pool_question($qb$CB-49efde89$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The expression  is equivalent to for some constant a. What is the value of a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-49efde89.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "3"}, {"label": "C", "body": "4"}, {"label": "D", "body": "7"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that  is equivalent to  for some constant a. Distributing the x over each term in the
parentheses gives , which is in the same form as the first given expression, . The coefficient of the second term in
is 7. Therefore, the value of a is 7.
Choice A is incorrect. If the value of a were 2, then  would be equivalent to , which isn’t equivalent to . Choice B
is incorrect. If the value of a were 3, then  would be equivalent to , which isn’t equivalent to . Choice C is
incorrect. If the value of a were 4, then  would be equivalent to , which isn’t equivalent to .$qb$);
select seed_pool_question($qb$CB-c95686e9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$h (t) = -16t^(2) + b
The function h estimates a ball's height, in feet, above a floor t seconds after the ball is released, where b is a constant. The function estimates
that the ball is 19·36 feet above the floor when it is released at t = 0. How many seconds after being released does the function estimate the
ball will reach the floor?$qb$, null, null, null, array[$qb$1.1$qb$, $qb$11/10$qb$]::text[], $qb$The correct answer is 1·1 . It’s given that h(t) = -16t^(2) + b estimates a ball’s height, in feet, above a floor t seconds after the ball is released,
where b is a constant. It's also given that the function estimates that the ball is 19·36 feet above the floor when it is released at t = 0.
Substituting 19·36 for h(t) and 0 for t in the given function yields 19·36 = -16(0)^(2) + b, or 19·36 = b. Substituting 19·36 for b in function h
yields . When the ball reaches the floor, its height is 0 feet above the floor. Substituting 0 for h(t) yields 0 = -16t^(2)
+ 19·3h6(t) = -16t^(2) + 19·36
. Adding 16t^(2) to both sides of this equation yields 16t^(2) = 19·36. Dividing both sides of this equation by 16 yields t2 = 1·21 . Taking
the positive square root of both sides of this equation yields t = 1·1. Therefore, the function estimates that the ball will reach the floor 1·1
seconds after being released. Note that 1.1 and 11/10 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-44076c7d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-1 10
f??? |||| ||||0 14
1 20
For the quadratic function , the table shows three values of x and their corresponding values of . Which equation defines f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-44076c7d.png$qb$, $qb$[{"label": "A", "body": "f(x) = 3x^(2) + 3x + 14"}, {"label": "B", "body": "f(x) = 5x^(2) + x + 14"}, {"label": "C", "body": "f(x) = 9x^(2) - x + 14"}, {"label": "D", "body": "f(x) = x^(2) + 5x + 14"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The equation of a quadratic function can be written in the form f(x) = a(x - h)^(2) + k, where ah, , and k are constants. It’s
given in the table that when x = - 1 , the corresponding value of f(x) is 10. Substituting -1 for x and 10 for f(x) in the equation f(x)
= a(x - h)^(2) + k gives 10 = a(-1 - h)^(2) + k, which is equivalent to 10 = a(1 + 2h + h^(2)) + k, or 10 = a + 2ah + ah^(2) + k. It’s given in
the table that when x = 0, the corresponding value of f(x) is 14. Substituting 0 for x and 14 for f(x) in the equation f(x) = a(x - h)^(2) + k
gives , or 14 = ah^(2) + k. It’s given in the table that when x = 1 , the corresponding value of  is 20. Substituting 1 for
20 =f(a^(x)()1 - 2h + h^(2)) + k
x= a -142a=ha+f(0(axh-)2h+)^(2)k+ k and 20 for  in the equation  gives 20 = a(1 - h)^(2) + k, which is equivalent to , or 20
20f(=^(x))a=-^(a)2(a^(x)h-+ha)h^(22)++kk
. Adding to the equation 10 = a + 2ah + ah^(2) + k gives 30 = 2a + 2ah^(2) + 2k. Dividing
both sides of this equation by 2 gives 15 = a + ah^(2) + k. Since 14 = ah^(2) + k, substituting 14 for ah^(2) + k into the equation 15 = a + ah^(2)
+ k gives 15 = a + 14. Subtracting 14 from both sides of this equation gives a = 1. Substituting 1 for a in the equations 14 = ah^(2) + k and
20 = ah^(2) - 2ah + a + k gives 14 = h^(2) + k and 20 = 1 - 2h + h^(2) + k, respectively. Since 14 = h^(2) + k, substituting 14 for h^(2) + k in the
equation 20 = 1 - 2h + h^(2) + k gives 20 = 1 - 2h + 14, or 20 = 15 - 2h. Subtracting 15 from both sides of this equation gives 5 = -2h.
Dividing both sides of this equation by -2 gives - 5/2 = h. Substituting  for h into the equation gives 14 = (-5/2)2 + k, or 14
31/4 =-k5/2 14 = h2 +3k1/4
= 25/4 + k. Subtracting 25/4 from both sides of this equation gives . Substituting 1 for a, - 5/2 for h, and for k in the equation f(x)
gives , which is equivalent to f(x) = x2 + 5x + 25/4 + 31/4 , or f(x) = x^(2) + 5x + 14. Therefore,
f=(xa)(x=-xh2 )+^(2) +5xk+ 14 f(x) =f (x + 5/2 ) 2 + 31/4
defines .
Choice A is incorrect. If f(x) = 3x^(2) + 3x + 14, then when x = - 1, the corresponding value of f(x) is 14, not 10.
Choice B is incorrect. If f(x) = 5x^(2) + x + 14, then when x = - 1 , the corresponding value of f(x) is 18, not 10.
Choice C is incorrect. If f(x) = 9x^(2) - x + 14, then when x = - 1, the corresponding value of f(x) is 24, not 10, and when x = 1, the
corresponding value of f(x) is 22, not 20.$qb$);
select seed_pool_question($qb$CB-1f353a9e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(t) = 8,000(0·65)^(t)
The given function f models the number of coupons a company sent to their customers at the end of each year, where t represents the number
of years since the end of 1998, and 0 ≤ t ≤ 5. If y = f(t) is graphed in the ty-plane, which of the following is the best interpretation of the y-
intercept of the graph in this context?$qb$, null, $qb$[{"label": "A", "body": "The minimum estimated number of coupons the company sent to their customers during the 5 years was 1,428."}, {"label": "B", "body": "The minimum estimated number of coupons the company sent to their customers during the 5 years was 8,000."}, {"label": "C", "body": "The estimated number of coupons the company sent to their customers at the end of 1998 was 1,428."}, {"label": "D", "body": "The estimated number of coupons the company sent to their customers at the end of 1998 was 8,000."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The y-intercept of a graph in the ty-plane is the point where t = 0. For the given function f, the y-intercept of the graph of y
= f(t) in the ty-plane can be found by substituting 0 for t in the equation , which gives y = 8,000(0·65)^(o). This is equivalent
yy == f8(,0t)00(0(0·6,58),0^(t)00)
to y = 8,000(1) , or y = 8,000. Therefore, the y-intercept of the graph of  is . It’s given that the function f models the
number of coupons a company sent to their customers at the end of each year. Therefore, f(t) represents the estimated number of coupons the
company sent to their customers at the end of each year. It's also given that t represents the number of years since the end of 1998. Therefore,
t = 0 represents 0 years since the end of 1998, or the end of 1998. Thus, the best interpretation of the y-intercept of the graph of y= f(t)
is that the estimated number of coupons the company sent to their customers at the end of 1998 was 8,000.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3f8d5876$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(??23?56789??77669922883355II |)/(-/-(?222 -111 ?- 1II 222 333 444 555 666 777 888 999)/-÷÷2?22II)|| || | || || ?|| || || || || || || | x
The graph of a system of a linear equation and a nonlinear equation is shown. What is the solution (x, y) to this system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3f8d5876.png$qb$, $qb$[{"label": "A", "body": "(0, 0)"}, {"label": "B", "body": "(0, 4)"}, {"label": "C", "body": "(4, 5)"}, {"label": "D", "body": "(5, 0)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The solution to the system of two equations corresponds to the point where the graphs of the equations intersect. The
graphs of the linear equation and the nonlinear equation shown intersect at the point (4, 5). Thus, the solution to the system is (4, 5) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b03adde3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If , what is t in terms of u ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b03adde3.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Multiplying both sides of the given equation by  yields . Dividing both sides of this equation by
yields . Adding 2 to both sides of this equation yields , which can be rewritten as
. Since the fractions on the right-hand side of this equation have a common denominator, adding the fractions yields
. Applying the distributive property to the numerator on the right-hand side of this equation yields , which
is equivalent to .
Choices A, B, and C are incorrect and may result from various misconceptions or miscalculations.$qb$);
select seed_pool_question($qb$CB-1ce9ffcd$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-9x^(2) + 30x + c = 0
In the given equation, c is a constant. The equation has exactly one solution. What is the value of c?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "0"}, {"label": "C", "body": "-25"}, {"label": "D", "body": "-53"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the equation -9x^(2) + 30x + c = 0 has exactly one solution. A quadratic equation of the form
ax2 + bx + c = 0 has exactly one solution if and only if its discriminant, , is equal to zero. It follows that for the given equation,
-4^(a)3^(c)0^(2)+-b^(2)4(-9)(c)
a = -9 and b = 30. Substituting -9 for a and 30 for b into b2 - 4ac yields , or 900 + 36c. Since the discriminant must
equal zero, 900 + 36c = 0. Subtracting 36c from both sides of this equation yields 900 = -36c. Dividing each side of this equation by -36
yields -25 = c. Therefore, the value of c is -25.
Choice A is incorrect. If the value of c is 3, this would yield a discriminant that is greater than zero. Therefore, the given equation would have two
solutions, rather than exactly one solution.
Choice B is incorrect. If the value of c is 0, this would yield a discriminant that is greater than zero. Therefore, the given equation would have two
solutions, rather than exactly one solution.
Choice D is incorrect. If the value of c is -53, this would yield a discriminant that is less than zero. Therefore, the given equation would have no
real solutions, rather than exactly one solution.$qb$);
select seed_pool_question($qb$CB-104bff62$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x2/(√-x2 -c2) = c2/(√-x2 -c2) + 39
In the given equation, c is a positive constant. Which of the following is one of the solutions to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-104bff62.png$qb$, $qb$[{"label": "A", "body": "-c"}, {"label": "B", "body": "-c2 - 392"}, {"label": "C", "body": "-√-39^(2) - c^(2)"}, {"label": "D", "body": "-√-c^(2) + 39^(2)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. If x2 - c2 ≤ 0, then neither side of the given equation is defined and there can be no solution. Therefore, x2 - c2 > 0.
Subtracting from both sides of the given equation yields x2/(√-x2 -c2) - c2/(√-x2 -c2) = 39, or (x2 -c2)/(√-x2 -c2) = 39. Squaring both sides of this
c2/(√x2 -/(c2)(x2 -c2)/(√-x2 -c2) ) 2
equation yields = 39^(2), or . Since x2 - c2 is positive and, therefore, nonzero, the expression (x2 -c2)/(x2 -c2) is defined
((x2 -c2 ) (x2 -c2 ))/(x2 -c2)((x2 -c2=) (x23-9c22 ))/(x2 -c2) = 39 2
and equivalent to 1. It follows that the equation can be rewritten as , or (1) (x^(2) - c^(2)) = 39^(2) ,
x2 =( (x2 -c2)/(xc22-+c2) )39(x2 2 - c2 ) = 392
which is equivalent to x2 - c2 = 392. Adding c2 to both sides of this equation yields . Taking the square root of both sides of
this equation yields two solutions: x = √-c2 + 392 and x = - √-c2 + 392. Therefore, of the given choices, -√-c^(2) + 39^(2) is one of the
solutions to the given equation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-270cf326$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following functions has(have) a minimum value at -3?
I.
gf((xx)) == --36((63))x^(x) - 3
II.$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A function of the form f(x) = a(b)^(x) + c, where a < 0 and b > 1 , is a decreasing function. Both of the given functions are
of this form; therefore, both are decreasing functions. If a function f is decreasing as the value of x increases, the corresponding value of f(x)
decreases; therefore, the function doesn’t have a minimum value. Thus, neither of the given functions has a minimum value.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fad2f98c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$3x(x - 4)(x + 5) = 0
What is one of the solutions to the given equation?$qb$, null, $qb$[{"label": "A", "body": "-4"}, {"label": "B", "body": "0"}, {"label": "C", "body": "3"}, {"label": "D", "body": "5"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Applying the zero product property to the given equation yields 3x = 0x - 4 = 0, , and x + 5 = 0. Dividing each side of
the equation 3x = 0 by 3 yields x = 0. Adding 4 to each side of the equation x - 4 = 0 yields x = 4. Subtracting 5 from each side of the
equation x + 5 = 0 yields x = -5. Therefore, the solutions to the given equation are 04, , and -5. Thus, one of the solutions to the given
equation is 0.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-769b612d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function g is defined by g (x) = 105^(x)-8. What is the value of x when g(x) is equal to 10,000?$qb$, null, $qb$[{"label": "A", "body": "11/5"}, {"label": "B", "body": "12/5"}, {"label": "C", "body": "3"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that g (x) = 105^(x)-8 . Since 10,000 can be written as 10^(4), substituting 10^(4) for g(x) in this equation yields 10^(4)
= 105x-8. Because the bases on the left-hand side and right-hand side of this equation are equal, it follows that the exponents must be equal.
Therefore, 4 = 5x - 8. Adding 8 to both sides of this equation yields 12 = 5x. Dividing both sides of this equation by 5 yields 12/5 = x.
Therefore, the value of x when g(x) is equal to 10,000 is 12/5 .
Choice A is incorrect. This is the value of x when g(x) is equal to 1,000, not 10,000.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of 5x - 8, not x, when g(x) is equal to 10,000.$qb$);
select seed_pool_question($qb$CB-a267bd29$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$w^(2) + 12w - 40 = 0
Which of the following is a solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "6 - 2√-19"}, {"label": "B", "body": "2√-19"}, {"label": "C", "body": "√-19"}, {"label": "D", "body": "-6 + 2√-19"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Adding 40 to both sides of the given equation yields w^(2) + 12w = 40. To complete the square, adding ( 12/2 ) 2, or 6^(2), to both
sides of this equation yields w^(2) + 12w + 6^(2) = 40 + 6^(2) , or (w + 6)^(2) = 76. Taking the square root of both sides of this equation yields w + 6
= ±√-76, or w + 6 = ±2√-19. Subtracting 6 from both sides of this equation yields w = -6 ± 2√-19. Therefore, the solutions to the given
equation are -6 + 2√-19 and -6 - 2√-19. Of these two solutions, only -6 + 2√-19 is given as a choice.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-75915e3c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For the function f defined above, what is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-75915e3c.png$qb$, $qb$[{"label": "A", "body": "9"}, {"label": "B", "body": "12"}, {"label": "C", "body": "18"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The value of  is found by evaluating the expression  when . Substituting 2 for x in the given equation
yields . Simplifying  in the equation results in . Evaluating the right-hand side of the equation yields .
Therefore, the value of  is 18.
Choice A is incorrect and may result from evaluating the expression as . Choice B is incorrect and may result from evaluating the expression
as . Choice D is incorrect and may result from evaluating the expression as .$qb$);
select seed_pool_question($qb$CB-f44a29a8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An object’s kinetic energy, in joules, is equal to the product of one-half the object’s mass, in kilograms, and the square of the object’s speed, in
meters per second. What is the speed, in meters per second, of an object with a mass of 4 kilograms and kinetic energy of 18 joules?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "6"}, {"label": "C", "body": "9"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that an object’s kinetic energy, in joules, is equal to the product of one-half the object’s mass, in kilograms, and the
square of the object’s speed, in meters per second. This relationship can be represented by the equation , where K is the kinetic
energy, m is the mass, and v is the speed. Substituting a mass of 4 kilograms for m and a kinetic energy of 18 joules for K results in the equation
, or . Dividing both sides of this equation by 2 yields . Taking the square root of both sides yields
and . Since speed can’t be expressed as a negative number, the speed of the object is 3 meters per second.
Choice B is incorrect and may result from computation errors. Choice C is incorrect. This is the value of  rather than v. Choice D is incorrect.
This is the value of  rather than v.$qb$);
select seed_pool_question($qb$CB-d3f7c429$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(??10II12?456?890044??66992288??55II |)/(??33-222-111 ? 111 222 ?33 444 555 666 ?77 888 999101100)|| || || | || || || || || || || || || || |x
The graph of a system of an absolute value function and a linear function is shown. What is the solution (x, y) to this system of two equations?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d3f7c429.png$qb$, $qb$[{"label": "A", "body": "(-1, 5)"}, {"label": "B", "body": "(0, 4)"}, {"label": "C", "body": "(1, 5)"}, {"label": "D", "body": "(4, 2)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The solution to the system of two equations corresponds to the point where the graphs of the equations intersect. The
graphs of the linear function and the absolute value function shown intersect at the point (1, 5) . Thus, the solution to the system is (1, 5).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the y-intercept of the graph of the linear function.
Choice D is incorrect. This is the vertex of the graph of the absolute value function.$qb$);
select seed_pool_question($qb$CB-92f812bb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, a parabola has vertex (9, -14) and intersects the x-axis at two points. If the equation of the parabola is written in the form
y = ax2 + bx + c, where ab, , and c are constants, which of the following could be the value of a + b + c?$qb$, null, $qb$[{"label": "A", "body": "-23"}, {"label": "B", "body": "-19"}, {"label": "C", "body": "-14"}, {"label": "D", "body": "-12"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The equation of a parabola in the xy-plane can be written in the form y = a(x - h)^(2) + k, where a is a constant and (h, k)
is the vertex of the parabola. If a is positive, the parabola will open upward, and if a is negative, the parabola will open downward. It’s given that
the parabola has vertex . Substituting 9 for h and -14 for k in the equation y = a(x - h)^(2) + k gives y = a(x - 9)^(2) - 14, which
y = (a9(,x--149))(x - 9) - 14
can be rewritten as , or y = a(x^(2) - 18x + 81) - 14. Distributing the factor of a on the right-hand side of this
equation yields y = ax2 - 18ax + 81a - 14. Therefore, the equation of the parabola, y = ax2 - 18ax + 81a - 14, can be written in the
form y = ax2 + bx + c, where a = a b = - 18a, , and c = 81a - 14. Substituting -18a for b and 81a - 14 for c in the expression a + b + c
yields (a) + (-18a) + (81a - 14) , or 64a - 14. Since the vertex of the parabola, (9, -14), is below the x-axis, and it’s given that the
parabola intersects the x-axis at two points, the parabola must open upward. Therefore, the constant a must have a positive value. Setting the
expression 64a - 14 equal to the value in choice D yields 64a - 14 = -12. Adding 14 to both sides of this equation yields 64a = 2. Dividing
both sides of this equation by 64 yields a = 2/64 , which is a positive value. Therefore, if the equation of the parabola is written in the form y
= ax2 + bx + c, where ab, , and c are constants, the value of a + b + c could be - 12.
Choice A is incorrect. If the equation of a parabola with a vertex at (9, -14) is written in the form y = ax2 + bx + c, where ab, , and c are
constants and a + b + c = -23, then the value of a will be negative, which means the parabola will open downward, not upward, and will
intersect the x-axis at zero points, not two points.
Choice B is incorrect. If the equation of a parabola with a vertex at (9, -14) is written in the form y = ax2 + bx + c, where ab, , and c are
constants and a + b + c = -19, then the value of a will be negative, which means the parabola will open downward, not upward, and will
intersect the x-axis at zero points, not two points.
Choice C is incorrect. If the equation of a parabola with a vertex at (9, -14) is written in the form y = ax2 + bx + c, where ab, , and c are
constants and a + b + c = -14, then the value of a will be 0, which is inconsistent with the equation of a parabola.$qb$);
select seed_pool_question($qb$CB-f547a8b1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-11-/(?10-00| -| 888| -| 666| -| 444| -| 222| ?| | 222| | 444| | 666| | 888| |101100|)|?| | | | | | | 101214|II1111246800444466222288| | | | | | | | | | | | |x
What is the y-intercept of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f547a8b1.png$qb$, $qb$[{"label": "A", "body": "(-8, 0)"}, {"label": "B", "body": "(-6, 0)"}, {"label": "C", "body": "(0, 6)"}, {"label": "D", "body": "(0, 8)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The y-intercept of a graph in the xy-plane is the point at which the graph crosses the y-axis. The graph shown crosses the y-
axis at the point (0, 8). Therefore, the y-intercept of the graph shown is (0, 8).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b8c4a1cd$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$8j = k + 15m
The given equation relates the distinct positive numbers jk, , and m. Which equation correctly expresses j in terms of k and m?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b8c4a1cd.png$qb$, $qb$[{"label": "A", "body": "j = ?/8 + 15m"}, {"label": "B", "body": "j = k + 15m/8"}, {"label": "C", "body": "j = 8(k + 15m)"}, {"label": "D", "body": "j = (?+15m)/8"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. To express j in terms of k and m, the given equation must be solved for j. Dividing each side of the given equation by 8
yields j = (k+15m)/8 .
Choice A is incorrect. This is equivalent to 8j = k + 120m.
Choice B is incorrect. This is equivalent to 8j = 8k + 15m.
Choice C is incorrect. This is equivalent to j/8 = k + 15m.$qb$);
select seed_pool_question($qb$CB-7bf77c19$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The functions p and r are defined by the equations shown, where a and b are integer constants such that a < b and b < 0. If y = p (x) and y
= r (x) are graphed in the xy-plane, which of the following equations displays, as a constant or coefficient, the y-coordinate of the y-intercept of
the graph of the corresponding function?
I.
pr ((xx)) == aa((44··11))^(x)x++bb
II.$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that a and b are integer constants such that a < b and b < 0. The y-coordinate of the y-intercept of the graph of a
function is the value of the function when x = 0. Equation I is p (x) = a(4·1)^(x) + b. Substituting 0 for x in this equation yields
py (=0)p=(xa) (4·1)o
+ b, which can be rewritten as p(0) = a(1) + b, or p(0) = a + b. Therefore, the y-coordinate of the y-intercept of the graph of  is a
+ b. Equation I has a coefficient of a and a constant b. Thus, the value of the y-coordinate of the y-intercept, a + b, is not displayed as a constant
or coefficient in equation I. Equation II is r (x) = a(4· 1)^(x)+b. Similarly, substituting 0 for x in this equation yields r (0) = a(4·1)o+b, which can
be rewritten as r (0) = a(4·1)b. Since b < 0, the value of (4·1)b is not equal to 1. Thus, the value of a(4·1)b is not equal to a. The value of
a(4·1)b is also not equal to b, since there is no pair of integers a and b such that a(4·1)b = b. Thus, the value of the y-coordinate of the y-
intercept for this equation is a(4·1)b, which is not displayed in equation II as a constant or coefficient. The coefficient in equation II is a, and the
only constant, b, appears in the exponent. Therefore, neither equation I nor equation II displays, as a constant or coefficient, the y-coordinate of
the y-intercept of the graph of the corresponding function.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2f4eafcc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?--/--/-2| ?| ÷1012II112246800446622222288 ?| | 2| | x
The parabola shown intersects the y-axis at the point (x, y) . What is the value of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2f4eafcc.png$qb$, null, null, array[$qb$7$qb$]::text[], $qb$The correct answer is 7. It's given that the parabola intersects the y-axis at the point (x, y) . The graph shows that the parabola intersects the y-
axis at the point (0, 7). Therefore, the value of y is 7.$qb$);
select seed_pool_question($qb$CB-7dbd46d9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$8x + y = -11
2x^(2) = y + 341
The graphs of the equations in the given system of equations intersect at the point (x, y) in the xy-plane. What is a possible value of x?$qb$, null, $qb$[{"label": "A", "body": "-15"}, {"label": "B", "body": "-11"}, {"label": "C", "body": "2"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the graphs of the equations in the given system of equations intersect at the point (x, y) . Therefore, this
intersection point is a solution to the given system. The solution can be found by isolating y in each equation. The given equation 8x + y = -11
can be rewritten to isolate y by subtracting 8x from both sides of the equation, which gives y = -8x - 11 . The given equation 2x^(2) = y + 341
can be rewritten to isolate y by subtracting 341 from both sides of the equation, which gives 2x^(2) - 341 = y. With each equation solved for y,
the value of y from one equation can be substituted into the other, which gives 2x^(2) - 341 = -8x - 11. Adding 8x and 11 to both sides of this
equation results in 2x^(2) + 8x - 330 = 0. Dividing both sides of this equation by 2 results in x^(2) + 4x - 165 = 0. This equation can be
rewritten by factoring the left-hand side, which yields (x + 15) (x - 11) = 0. By the zero-product property, if (x + 15) (x - 11) = 0, then
(x + 15) = 0, or (x - 11) = 0. It follows that x = -15, or x = 11 . Since only -15 is given as a choice, a possible value of x is -15.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0121a235$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x p(x)
||||| ||||| |||||
The table above gives selected values of a polynomial function p. Based on the values in the table, which of the following must be a factor of p ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0121a235.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. According to the table, when x is  or 2, . Therefore, two x-intercepts of the graph of p are  and .
Since  and  are x-intercepts, it follows that  and  are factors of the polynomial equation. This is because when
, the value of  is 0. Similarly, when , the value of  is 0. Therefore, the product  is a factor of the
polynomial function p.
Choice A is incorrect. The factor  corresponds to an x-intercept of , which isn’t present in the table. Choice B is incorrect. The factor
corresponds to an x-intercept of , which isn’t present in the table. Choice C is incorrect. The factors  and  correspond
to x-intercepts  and , respectively, which aren’t present in the table.$qb$);
select seed_pool_question($qb$CB-9da41c80$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A ball is dropped from an initial height of 22 feet and bounces off the ground repeatedly. The function h estimates that the maximum height
reached after each time the ball hits the ground is 85% of the maximum height reached after the previous time the ball hit the ground. Which
equation defines h, where h(n) is the estimated maximum height of the ball after it has hit the ground n times and n is a whole number greater
than 1 and less than 10?$qb$, null, $qb$[{"label": "A", "body": "h(n) = 22(0·22)^(n)"}, {"label": "B", "body": "h(n) = 22(0·85)^(n)"}, {"label": "C", "body": "h(n) = 85(0·22)^(n)"}, {"label": "D", "body": "h(n) = 85(0·85)^(n)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that for the function hh(n),  is the estimated maximum height, in feet, of the ball after it has hit the ground n times.
It's also given that the function h estimates that the maximum height reached after each time the ball hits the ground is 85% of the maximum
height reached after the previous time the ball hit the ground. It follows that h is a decreasing exponential function that can be written in the
form h(n) = a ( p/100 ) n, where a is the initial height, in feet, the ball was dropped from and the function estimates that the maximum height
reached after each time the ball hits the ground is p% of the maximum height reached after the previous time the ball hit the ground. It's given
that the ball is dropped from an initial height of 22 feet. Therefore, a = 22. Since the function h estimates that the maximum height reached
after each time the ball hits the ground is 85% of the maximum height reached after the previous time the ball hit the ground, p = 85.
Substituting 22 for a and 85 for p in the equation h(n) = a ( p/100 ) n yields h(n) = 22 ( 85/10o ) n , or h(n) = 22(0·85)^(n).
Choice A is incorrect. This function estimates that the maximum height reached after each time the ball hits the ground is 22%, not 85%, of the
maximum height reached after the previous time the ball hit the ground.
Choice C is incorrect. This function estimates that the ball is dropped from an initial height of 85 feet, not 22 feet, and that the maximum height
reached after each time the ball hits the ground is 22%, not 85%, of the maximum height reached after the previous time the ball hit the ground.
Choice D is incorrect. This function estimates that the ball is dropped from an initial height of 85 feet, not 22 feet.$qb$);
select seed_pool_question($qb$CB-7160cbb3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-111/(-/--/--/--/--/--/--/--/--/-(?888 -666 -444 -222 ?- 222 444 666 888)/--?÷÷÷÷÷÷÷÷?11??7654321??447766??22??335511?)|| || || || || || || || | || || || || || || || || | x
What is the y-intercept of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7160cbb3.png$qb$, $qb$[{"label": "A", "body": "(0, -6)"}, {"label": "B", "body": "(-6, 0)"}, {"label": "C", "body": "(0, 0)"}, {"label": "D", "body": "(-5, -5)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The y-intercept of a graph in the xy-plane is the point (x, y) on the graph where x = 0. For the graph shown, at x = 0, the
corresponding value of y is -6. Therefore, the y-intercept of the graph shown is (0, -6).
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-d71f6dbf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The height, in feet, of an object x seconds after it is thrown straight up in the air can be modeled by the function .
Based on the model, which of the following statements best interprets the equation  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d71f6dbf.png$qb$, $qb$[{"label": "A", "body": "The height of the object 1.4 seconds after being thrown straight up in the air is 1.64 feet."}, {"label": "B", "body": "The height of the object 1.64 seconds after being thrown straight up in the air is 1.4 feet."}, {"label": "C", "body": "The height of the object 1.64 seconds after being thrown straight up in the air is approximately 1.4 times as great as its initial height."}, {"label": "D", "body": "The speed of the object 1.4 seconds after being thrown straight up in the air is approximately 1.64 feet per second."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The value 1.4 is the value of x, which represents the number of seconds after the object was thrown straight up in the air.
When the function h is evaluated for x = 1.4, the function has a value of 1.64, which is the height, in feet, of the object.
Choices B and C are incorrect and may result from misidentifying seconds as feet and feet as seconds. Additionally, choice C may result from
incorrectly including the initial height of the object as the input x. Choice D is incorrect and may result from misidentifying height as speed.$qb$);
select seed_pool_question($qb$CB-f123e039$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-123454422335511/(-/--/--/--/--/--/--/-(?444 -333 -222 -1II ?- 1II 222 333 444)/-÷?÷÷??÷÷?7654???447766????335511)|| ?|| || ?|| | || || || || | x
The graph of a system of a linear and a quadratic equation is shown. Which system of equations is represented by the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f123e039.png$qb$, $qb$[{"label": "A", "body": "y = -5x y = x2 + 8"}, {"label": "B", "body": "y = -5x y = x2 - 8"}, {"label": "C", "body": "y = 5x y = x2 + 8"}, {"label": "D", "body": "y = 5x y = x2 - 8"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the graph shows a system consisting of a linear and a quadratic equation in the xy-plane. In each of the given
choices, the linear equation is in the form y = mx, where m is a constant, and the quadratic equation is in the form y = x2 + c, where c is a
constant. The graph of a linear equation in the form y = mx has a slope of m and a y-intercept at (0, 0) . Given two points on the line, (x1 , y1 )
and (x2 , y2 ), the slope can be calculated using the formula . The graph of the linear equation in this system has a y-intercept at
m = (y2-y1)/(x(20-,x01))
and passes through the point . Substituting the points  and (1, 5) for (x1 , y1 ) and (x2 , y2 ) in the formula m = (y2-y1)/(x2 -x1) yields
m (=1 , 55/1)
ym(0=,=0x) (5-o)/(21-+o) c, which is equivalent to , or m = 5. It follows that the linear equation is y = 5x. The graph of a quadratic equation in the form
has a vertex at . The graph of the quadratic equation in this system has a vertex at (0, -8) . It follows that the quadratic
y = x2 + (-8)(0, c)
equation is , or y = x2 - 8. Thus, the system of equations represented by the graph is y = 5x and y = x2 - 8.
Choice A is incorrect. The graph of this system of equations has a line with a slope of -5, not 5, and a parabola with a vertex at (0, 8), not (0,
-8) .
Choice B is incorrect. The graph of this system of equations has a line with a slope of -5, not 5.
Choice C is incorrect. The graph of this system of equations has a parabola with a vertex at (0, 8) , not (0, -8).$qb$);
select seed_pool_question($qb$CB-630897df$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The speed of sound in dry air, v, can be modeled by the formula , where T is the temperature in degrees Celsius and v is
measured in meters per second. Which of the following correctly expresses T in terms of v ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-630897df.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. To express T in terms of v, subtract 331.3 from both sides of the equation, which gives v – 331.3 = 0.606T. Dividing both
sides of the equation by 0.606 gives .
Choices A, B, and C are incorrect and are the result of incorrect steps while solving for T.$qb$);
select seed_pool_question($qb$CB-20722644$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = x3 + 9. What is the value of f(2) ?$qb$, null, $qb$[{"label": "A", "body": "14"}, {"label": "B", "body": "15"}, {"label": "C", "body": "17"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that f(x) = x3 + 9. Substituting 2 for x in this equation yields f(2) = (2)^(3) + 9. This is equivalent to f(2) = 8
+ 9, or f(2) = 17.
Choice A is incorrect. This is the value of 2 + 3 + 9, not 23 + 9.
Choice B is incorrect. This is the value of 2(3) + 9, not 23 + 9.
Choice D is incorrect. This is the value of 3^(2) + 9, not 23 + 9.$qb$);
select seed_pool_question($qb$CB-5805e747$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to (7x^(3) + 7x) - (6x^(3) - 3x)?$qb$, null, $qb$[{"label": "A", "body": "x3 + 10x"}, {"label": "B", "body": "-13x3 + 10x"}, {"label": "C", "body": "-13x3 + 4x"}, {"label": "D", "body": "x3 + 4x"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Applying the distributive property, the given expression can be written as 7x3 + 7x - 6x3 + 3x. Grouping like terms in this
expression yields (7x^(3) - 6x^(3)) + (7x + 3x) . Combining like terms in this expression yields x3 + 10x.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-158591f0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x(x + 1) - 56 = 4x(x - 7)
What is the sum of the solutions to the given equation?$qb$, null, null, null, array[$qb$29/3$qb$, $qb$9.666$qb$, $qb$9.667$qb$]::text[], $qb$The correct answer is 29/3 . Applying the distributive property to the left-hand side of the given equation, x(x + 1) - 56, yields x^(2) + x - 56.
Applying the distributive property to the right-hand side of the given equation, 4x(x - 7), yields 4x^(2) - 28x. Thus, the equation becomes x2
+ x - 56 = 4x^(2) - 28x. Combining like terms on the left- and right-hand sides of this equation yields 0 = (4x^(2) - x^(2)) + (-28x - x) + 56,
or 3x^(2) - 29x + 56 = 0. For a quadratic equation in the form ax2 + bx + c = 0, where ab, , and c are constants, the quadratic formula gives
the solutions to the equation in the form . Substituting 3 for a, -29 for b, and 56 for c from the equation 3x^(2) - 29x + 56
x =x (=(2 (-b±√-b^(2)-4ac)/(9?√ 2)a/((-29)^(2)-4(3)(56))))/(2(3))
= 0 into the quadratic formula yields , or . It follows that the solutions to the given equation are
x = 29/6 ? 29/613/6 + 13/6 + 29/6 - 13/6 29/629/3
+ 13/6 and 29/6 - 13/6 . Adding these two solutions gives the sum of the solutions: , which is equivalent to 29/6 + 29/6 , or .
Note that 29/3, 9.666, and 9.667 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-7fe7cf26$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$During the first part of an experiment, a ball was launched from a 7-foot-tall platform. The graph shows the height y, in feet, of the ball x seconds
after it was launched during the first part of the experiment.
10121416IIIIIIII24680044446666222288??/(1II 222)| || || |x
During the second part of the experiment, the ball was launched the same way, but from a platform that is 2 feet shorter than the first platform.
Which of the following graphs could represent the height y, in feet, of the ball x seconds after it was launched during the second part of the
experiment?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7fe7cf26.png$qb$, $qb$[{"label": "A", "body": "10121416IIIIIIII24680044446666222288??/(1II 222)| || || |x"}, {"label": "B", "body": "10121416IIIIIIII24680044446666222288??/(111 222)| || || |x"}, {"label": "C", "body": "10121416IIIIIIII24680044446666222288??/(1II 222)| || || |x"}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that y represents the height, in feet, of the ball x seconds after it was launched. It's also given that during the first
part of an experiment, a ball was launched from a 7-foot-tall platform. Therefore, the y-coordinate of the y-intercept of the given graph, 7,
represents the platform height, in feet. During the second part of the experiment, the platform the ball was launched from was 2 feet shorter than
the platform in the first part of the experiment. It follows that the height of the platform in the second part of the experiment was 7 - 2 feet, or 5
feet. Therefore, the y-coordinate of the y-intercept of the graph representing the second part of the experiment must be 5. Only choice B satisfies
this condition.
Choice A is incorrect. This could represent the graph if the ball were launched from a platform that was about 3 feet shorter rather than 2 feet
shorter.
Choice C is incorrect. This could represent the graph if the ball were launched from a platform that was 2 feet taller rather than 2 feet shorter.
Choice D is incorrect. This could represent the graph if the ball were launched from a platform that was twice as tall rather than 2 feet shorter.$qb$);
select seed_pool_question($qb$CB-bba18ecb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$When the quadratic function f is graphed in the xy-plane, where y= f(x) , its vertex is (-3, 6). One of the x-intercepts of this graph is
(- 17/4 , 0) . What is the other x-intercept of the graph?$qb$, null, $qb$[{"label": "A", "body": "(- 29/4 , 0)"}, {"label": "B", "body": "(-7/4, 0)"}, {"label": "C", "body": "(5/4, 0)"}, {"label": "D", "body": "( 17/4 , 0)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since the line of symmetry for the graph of a quadratic function contains the vertex of the graph, the x-coordinate of the
vertex of the graph of y= f(x) is the x-coordinate of the midpoint of its two x-intercepts. The midpoint of two points with x-coordinates x1 and
x2 has x-coordinate xm, where xm = (x1 +x2)/2 . It′s given that the vertex is (-3, 6) and one of the x-intercepts is (- 17/4 , 0) . Substituting -3 for
xm and - 17/4 for x1 in the equation xm = (x1 +x2)/2 yields -3 = (- 17/4 +x2)/2 . Multiplying each side of this equation by 2 yields -6 = - 17/4 + x2.
Adding 17/4 to each side of this equation yields - 7/4 = x2 . Therefore, the other x-intercept is (-7/4, 0) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-668f1863$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Function f is a quadratic function where f(-20) = 0 and f(-4) = 0. The graph of y = f(x) in the xy-plane has a vertex at (r, -64). What is
the value of r?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-668f1863.png$qb$, null, null, array[$qb$-12$qb$]::text[], $qb$The correct answer is -12. It’s given that function  is a quadratic function where f(-20) = 0 and f(-4) = 0. It follows that the graph of y
(f-20, 0)
= f(x) in the xy-plane passes through the points  and (-4, 0) . When the graph of a quadratic function contains two points and
y =(af, 0(x) )
, the x-coordinate of the vertex of the graph is the average of a and b. Therefore, the x-coordinate of the vertex of the graph of  is
((-b2,o0+)(-4))/2
, or -12. It's given that the graph of y = f(x) in the xy-plane has a vertex at (r, -64). It follows that the value of r is -12.$qb$);
select seed_pool_question($qb$CB-70753f99$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is defined by . The graph of f in the xy-plane is a parabola. Which of the following intervals contains the
x-coordinate of the vertex of the graph of f ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-70753f99.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The graph of a quadratic function in the xy-plane is a parabola. The axis of symmetry of the parabola passes through the
vertex of the parabola. Therefore, the vertex of the parabola and the midpoint of the segment between the two x-intercepts of the graph have the
same x-coordinate. Since , the x-coordinate of the vertex is . Of the shown intervals, only the
interval in choice B contains –2. Choices A, C, and D are incorrect and may result from either calculation errors or misidentification of the graph’s
x-intercepts.$qb$);
select seed_pool_question($qb$CB-c6e85cd7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If 48c = √^(3) -47, what is the value of c?$qb$, null, null, null, array[$qb$.2916$qb$, $qb$.2917$qb$, $qb$7/24$qb$]::text[], $qb$The correct answer is 7/24 . An expression of the form √^(n) -a^(m), where m and n are integers greater than 1 and , is equivalent to a m/n .
48c =a 4≥7/30
Therefore, the expression on the right-hand side of the given equation, √^(3) -47, is equivalent to 4 7/3 . Thus, . It follows that 8c = 7/3 .
Dividing both sides of this equation by 8 yields c = 7/24 . Note that 7/24, .2916, .2917, 0.219, and 0.292 are examples of ways to enter a correct
answer.$qb$);
select seed_pool_question($qb$CB-568aaf27$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If  is a solution to the system of equations above, which of the following is a possible value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-568aaf27.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "2"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Substituting  from the second equation for y in the first equation yields . Subtracting 12 from both sides of
this equation and rewriting the equation results in . Factoring the left-hand side of this equation yields .
Using the zero product property to solve for x, it follows that  and . Solving each equation for x yields  and
, respectively. Thus, two possible values of x are 3 and . Of the choices given, 3 is the only possible value of x.
Choices A, B, and C are incorrect. Substituting 0 for x in the first equation gives , or ; then, substituting 12 for y and 0 for x in
the second equation gives , or , which is false. Similarly, substituting 1 or 2 for x in the first equation yields  or ,
respectively; then, substituting 11 or 10 for y in the second equation yields a false statement.$qb$);
select seed_pool_question($qb$CB-6aefc52b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = -2·5
y = x2 + 8x + k
In the given system of equations, k is a positive integer constant. The system has no real solutions. What is the least possible value of k?$qb$, null, null, null, array[$qb$14$qb$]::text[], $qb$The correct answer is 14. It's given by the first equation of the system of equations that y = -2·5. Substituting -2·5 for y in the second given
equation, y = x2 + 8x + k, yields -2·5 = x^(2) + 8x + k. Adding 2·5 to both sides of this equation yields 0 = x^(2) + 8x + k + 2·5. A quadratic
equation of the form 0 = ax2 + bx + c, where ab, , and c are constants, has no real solutions if and only if its discriminant, b2 - 4ac, is
negative. In the equation 0 = x^(2) + 8x + k + 2·5, where k is a positive integer constant, a = 1, b = 8, and c = k + 2·5. Substituting 1 for a8,
for b, and k + 2·5 for c in b2 - 4ac yields 8^(2) - 4(1)(k + 2·5), or 64 - 4(k + 2·5) . Since this value must be negative, 64 - 4(k + 2·5) < 0.
Adding 4(k + 2·5) to both sides of this inequality yields 64 < 4(k + 2·5) . Dividing both sides of this inequality by 4 yields 16 < k + 2·5.
Subtracting 2·5 from both sides of this inequality yields 13·5 < k. Since k is a positive integer constant, the least possible value of k is 14.$qb$);
select seed_pool_question($qb$CB-04887c7b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f (x) = 2x + 3
g (x) = 7x - 2
h (x) = 5x + 6
The functions fg, , and h are defined as shown. If f (x) · g (x) - h (x) = ax^(2) + bx + c, where ab, , and c are constants, what is the value of
b?$qb$, null, $qb$[{"label": "A", "body": "-5"}, {"label": "B", "body": "12"}, {"label": "C", "body": "20"}, {"label": "D", "body": "22"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that f(x) = 2x + 3g(x) = 7x - 2, , and h(x) = 5x + 6. It’s also given that
+ c, where ab, , and c are constants. Substituting 2x + 3 for f(x) , 7x - 2 for g(x) , and 5x + 6 for h(x) in this equation yields
14x^(2) - 4x + 21x - 6 - 5x - 6 =fa(^(x)x)^(2)(·+2g^(x)(b)^(x)x()7+-^(x))ch+(^(x)((2)2^(x)=^(x)) (+^(a)-^(x)32^(2)))+(7b^(xx)
. Applying the distributive property to the left-hand side of this equation yields
-+ 2(3))-(7(x5)^(x)++(63)) (=-2^(a))^(x)+^(2) +(-b^(x)1)+(5^(c)x) + (-1) (6) = ax^(2) + bx + c
, or . Combining like
terms on the left-hand side of this equation yields 14x^(2) + 12x - 12 = ax^(2) + bx + c. It follows that the value of b is 12.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cef0eada$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-(101112?45678900447766992288??55II ?)/(-/-(?555 -444 -333 -??? -1II ?- 1II 222 333 444 555)/-÷÷2122II)|| || || ?|| || | || || || || || | x
The graph of y = f(x) is shown. What is the y-intercept of y = f (x) + 5?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cef0eada.png$qb$, $qb$[{"label": "A", "body": "(0, 8)"}, {"label": "B", "body": "(0, 5)"}, {"label": "C", "body": "(0, 3)"}, {"label": "D", "body": "(0, 0)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The y-intercept of a graph is the point at which the graph intersects the y-axis. The graph of y= f(x) shown intersects the
y-axis at (0, 3), so the y-intercept of the graph of  is . The graph of y = f (x) + 5 is the result of shifting the graph of y = f(x)
up 5 units. Therefore, the y-intercept of the graph of (0, 3 +y5=y) f=(^(x)f)(^(x))(+0^(,)53) is 5 units above the y-intercept of the graph of y= f(x) . It follows that the y-
intercept of the graph of y = f (x) + 5 is , which is equivalent to (0, 8) .
Choice B is incorrect. The point (0, 5) is 5 units above the point (0, 0) , not the point (0, 3).
Choice C is incorrect. This is the y-intercept of the graph of y = f(x), not the y-intercept of the graph of y = f (x) + 5.
Choice D is incorrect. This is the origin of the coordinate plane, not the y-intercept of the graph of y = f (x) + 5.$qb$);
select seed_pool_question($qb$CB-55c5d3c2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = a^(x) + b, where a and b are constants and a > 0. In the xy-plane, the graph of y= f(x) has a y-intercept at
(0, -25) and passes through the point (2, 23) . What is the value of a + b?$qb$, null, null, null, array[$qb$-19$qb$]::text[], $qb$The correct answer is -19. It's given that function f is defined by f(x) = a^(x) + b, where a and b are constants and a > 0. It's also given that
the graph of y = f(x) in the xy-plane has a y-intercept at (0, -25) and passes through the point (2, 23) . Since the graph has a y-intercept at
(0, -25) , f(0) = -25. Substituting 0 for x in the given equation yields f(0) = a^(0) + b, or f(0) = 1 + b, and substituting -25 for  in this
equation yields -25 = 1 + b. Subtracting 1 from each side of this equation yields -26 = b. Substituting -26 for b in the equation
49 =fff(((a^(xx)0^(2)))) ==^(aaxx)
+ b yields . Since the graph also passes through the point (2, 23) , f(2) = 23. Substituting 2 for x in the equation
ff(^(x)(2) )==^(a)a^(x2)--2266
- 26 yields , and substituting 23 for f(2) yields 23 = a^(2) - 26. Adding 26 to each side of this equation yields . Taking
the square root of both sides of this equation yields ?7 = a. Since it's given that a > 0, the value of a is 7. It follows that the value of a + b is 7
- 26, or -19.$qb$);
select seed_pool_question($qb$CB-5e63b9cf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y
10
9
8
7
6
5||||||||||||?
4
3
2
1
x
O 1 2 3 4 5 6 7 8 9 10
The graph shows a marble's height above the ground y, in inches, x seconds after it started moving on an elevated track of a marble run. Which
of the following is the best interpretation of the y-intercept of the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5e63b9cf.png$qb$, $qb$[{"label": "A", "body": "The marble's height was 0 inches above the ground 8 seconds after it started moving."}, {"label": "B", "body": "The marble's height was 8 inches above the ground when it started moving."}, {"label": "C", "body": "The marble's minimum height was 0 inches above the ground."}, {"label": "D", "body": "The marble's minimum height was 8 inches above the ground."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The y-intercept of a graph is the point at which the graph intersects the y-axis. The graph shown intersects the y-axis at the
point (0, 8) . Therefore, the y-intercept of the graph is (0, 8). It’s given that y is the height of the marble above the ground, in inches, and x is the
number of seconds after the marble started moving. It follows that the marble's height was 8 inches above the ground 0 seconds after it started
moving. Therefore, the best interpretation of the y-intercept of the graph is that the marble’s height was 8 inches above the ground when it
started moving.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-6676f055$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An engineer wanted to identify the best angle for a cooling fan in an engine in order to get the greatest airflow. The engineer discovered that the
function above models the airflow , in cubic feet per minute, as a function of the angle of the fan , in degrees. According to the model,
what angle, in degrees, gives the greatest airflow?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6676f055.png$qb$, $qb$[{"label": "A", "body": "–0.28"}, {"label": "B", "body": "0.28"}, {"label": "C", "body": "27"}, {"label": "D", "body": "880"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The function f is quadratic, so it will have either a maximum or a minimum at the vertex of the graph. Since the coefficient of
the quadratic term (–0.28) is negative, the vertex will be at a maximum. The equation f( ) = –0.28( – 27)2 + 880 is given in vertex form, so the
vertex is at  = 27. Therefore, an angle of 27 degrees gives the greatest airflow.
Choices A and B are incorrect and may be the result of misidentifying which value in a quadratic equation in vertex form represents the
vertex. Choice D is incorrect. This choice identifies the maximum value of f() rather than the value of  for which f() is maximized.$qb$);
select seed_pool_question($qb$CB-53c07bf9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The value of a certain fishing boat was $24,000 when it was purchased. Each year, the value of the fishing boat decreased by 20% of the
previous year’s value. Which equation represents this situation, where v is the value of the fishing boat, in dollars, and y is the number of years
since the fishing boat was purchased?$qb$, null, $qb$[{"label": "A", "body": "v = 0·8(24,000)^(y)"}, {"label": "B", "body": "v = 1·2(24,000)^(y)"}, {"label": "C", "body": "v = 24,000(0·8)^(y)"}, {"label": "D", "body": "v = 24,000(1·2)^(y)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the value of a certain fishing boat was $24,000 when it was purchased. It's also given that each year, the value
of the fishing boat decreased by 20% of the previous year's value. It follows that this situation can be represented by the equation v
= a ( 1 - r/1o0 ) y, where v is the value of the boat, in dollars, y years since it was purchased, a is the value of the boat, in dollars, when it was
purchased, and r is the percent by which the value of the boat decreases each year from the previous year's value. Substituting 24,000 for a and
20 for r in this equation yields v = 24,000 ( 1 - 2o/100 ) y, or v = 24,000(0·8)^(y). Therefore, v = 24,000(0·8)^(y) represents this situation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This equation represents a situation where each year the value of the boat increased, not decreased, by 20% of the
previous year's value.$qb$);
select seed_pool_question($qb$CB-29ed5d39$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$p = 20 + 16/n
The given equation relates the numbers p and n, where n is not equal to 0 and p > 20. Which equation correctly expresses n in terms of p?$qb$, null, $qb$[{"label": "A", "body": "n = (p-20)/16"}, {"label": "B", "body": "n = p/16 + 20"}, {"label": "C", "body": "n = p/16 - 20"}, {"label": "D", "body": "n = 16/(p-20)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. To express n in terms of p, the given equation must be solved for n. Subtracting 9 from both sides of the given equation
yields p - 9 = 14/n . Since n is not equal to 0, multiplying both sides of this equation by n yields . It's given that p > 9, which
(p -((9p)-(9n)()n))/(p-9)==1 414/(p-9)
means p - 9 is not equal to 0. Therefore, dividing both sides of (p - 9)(n) = 14 by (p- 9) yields , or n = 14/(p-9) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-90bcaa61$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f(t) = 60,000(2) t/419 gives the number of bacteria in a population t minutes after an initial observation. How much time, in
minutes, does it take for the number of bacteria in the population to double?$qb$, null, null, null, array[$qb$410$qb$]::text[], $qb$The correct answer is 410. It's given that t minutes after an initial observation, the number of bacteria in a population is 60,000(2) t/41o . This
expression consists of the initial number of bacteria, 60,000, multiplied by the expression 2 t/41o . The time it takes for the number of bacteria to
double is the increase in the value of t that causes the expression 2 t/419 to double. Since the base of the expression 2 t/410 is 2, the expression 2 t/410
will double when the exponent increases by 1. Since the exponent of the expression 2 t/4I9 is t/410 , the exponent will increase by 1 when t
increases by 410. Therefore the time, in minutes, it takes for the number of bacteria in the population to double is 410.$qb$);
select seed_pool_question($qb$CB-895628b5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = (x - 2) (x + 4)
y = 6x - 12
Which ordered pair (x, y) is the solution to the given system of equations?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-895628b5.png$qb$, $qb$[{"label": "A", "body": "(0, 2)"}, {"label": "B", "body": "(-4, 2)"}, {"label": "C", "body": "(2, 0)"}, {"label": "D", "body": "(2, -4)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The second equation in the given system of equations is y = 6x - 12. Substituting 6x - 12 for y in the first equation of
the given system yields 6x - 12 = (x - 2) (x + 4). Factoring 6 out of the left-hand side of this equation yields .
An expression with a factor of the form (x - a) is equal to zero when x = a. Each side of this equation has a factor of 6(x6-(2(2x-) -=2)2(x) - 2)(x + 4), so each side of
the equation is equal to zero when x = 2. Substituting 2 for x into the equation 6(x - 2) = (x - 2)(x + 4) yields
= (2 - 2)(2 + 4) , or 0 = 0, which is true. Substituting 2 for x into the second equation in the given system of equations yields y = 6(2) - 12,
or y = 0. Therefore, the solution to the system of equations is the ordered pair (2, 0).
Choice A is incorrect and may result from switching the order of the solutions for x and y.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8f82ad81$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 4(x^(2) + 6) ?$qb$, null, $qb$[{"label": "A", "body": "4x^(2) + 24"}, {"label": "B", "body": "4x^(2) + 10"}, {"label": "C", "body": "4x^(2) + 6"}, {"label": "D", "body": "4x^(2) - 2"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The expression 4(x^(2) + 6) can be rewritten as 4(x^(2)) + 4(6), which is equivalent to 4x^(2) + 24.
Choice B is incorrect. This expression is equivalent to 4(x2 + 5/2) , not 4(x^(2) + 6) .
Choice C is incorrect. This expression is equivalent to 4(x2 + 3/2) , not 4(x^(2) + 6) .
Choice D is incorrect. This expression is equivalent to 4 (x2 - 1/2 ) , not 4(x^(2) + 6) .$qb$);
select seed_pool_question($qb$CB-26eb61c1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to 6x8y2 + 12x2y2 ?$qb$, null, $qb$[{"label": "A", "body": "6x2y2 (2x6)"}, {"label": "B", "body": "6x2y2 (x4)"}, {"label": "C", "body": "6x2y2 (x6 + 2)"}, {"label": "D", "body": "6x2y2 (x4 + 2)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since each term of the given expression has a common factor of 6x2y2, it may be rewritten as 6x2y2 (x6) + 6x2y2 (2), or
6x2y2 (x6 + 2) .
Choice A is incorrect. This expression is equivalent to 12x8y2, not 6x8y2 + 12x2y2 .
Choice B is incorrect. This expression is equivalent to 6x6y2 , not 6x8y2 + 12x2y2.
Choice D is incorrect. This expression is equivalent to 6x6y2 + 12x2y2 , not 6x8y2 + 12x2y2 .$qb$);
select seed_pool_question($qb$CB-c9417793$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?x - 9? + 45 = 63
What is the sum of the solutions to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c9417793.png$qb$, null, null, array[$qb$18$qb$]::text[], $qb$The correct answer is 18. Subtracting 45 from each side of the given equation yields ?x - 9| = 18. By the definition of absolute value, if ?x - 9|
= 18, then x - 9 = 18 or x - 9 = -18. Adding 9 to each side of the equation x - 9 = 18 yields x = 27. Adding 9 to each side of the
equation x - 9 = -18 yields x = -9. Therefore, the solutions to the given equation are 27 and -9, and it follows that the sum of the
solutions to the given equation is 27 + (-9) , or 18.$qb$);
select seed_pool_question($qb$CB-8f65cddc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$1/7b = 11x/y
The given equation relates the positive numbers bx, , and y. Which equation correctly expresses x in terms of b and y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8f65cddc.png$qb$, $qb$[{"label": "A", "body": "x = 7by/11"}, {"label": "B", "body": "x = y - 77b"}, {"label": "C", "body": "x = y/(7?b)"}, {"label": "D", "body": "x = 77by"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Multiplying each side of the given equation by y yields the equivalent equation y/7b = 1 1x. Dividing each side of this equation
by 11 yields y/77b = x, or x = y/77b.
Choice A is incorrect. This equation is not equivalent to the given equation.
Choice B is incorrect. This equation is not equivalent to the given equation.
Choice D is incorrect. This equation is not equivalent to the given equation.$qb$);
select seed_pool_question($qb$CB-2926cc6d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$(5x + 4)(2x - 5) = 0
Which of the following is a solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2926cc6d.png$qb$, $qb$[{"label": "A", "body": "- 5/2"}, {"label": "B", "body": "- 5/4"}, {"label": "C", "body": "- 4/5"}, {"label": "D", "body": "- 2/5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since a product of two factors is equal to 0 if and only if at least one of the factors is 0, either 5x + 4 = 0 or 2x - 5 = 0.
Subtracting 4 from each side of the equation 5x + 4 = 0 yields 5x = -4. Dividing each side of this equation by 5 yields x = - 4/5. Adding 5 to
each side of the equation 2x - 5 = 0 yields 2x = 5. Dividing each side of this equation by 2 yields x = 5/2 . It follows that the solutions to the
given equation are - 4/5 and 5/2 . Therefore, - 4/5 is a solution to the given equation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-dd8ac009$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Time (years) Total amount (dollars)
1/(|-^(2))|| |||(--670·00 |)/67402(678·06)/t|||
Sara opened a savings account at a bank. The table shows the exponential relationship between the time , in years, since Sara opened the
account and the total amount d, in dollars, in the account. If Sara made no additional deposits or withdrawals, which of the following equations
best represents the relationship between t and d?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dd8ac009.png$qb$, $qb$[{"label": "A", "body": "d = 0·006(1 + 670)^(t)"}, {"label": "B", "body": "d = 670(1 + 0·006)^(t)"}, {"label": "C", "body": "d = (1 + 0·006)^(t)"}, {"label": "D", "body": "d = (1 + 670)^(t)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the relationship between t and d is exponential. The table shows that the value of d increases as the value of t
increases. Therefore, the relationship between t and d can be represented by an increasing exponential equation of the form ,
d = a(d1 + b)^(t)
where a and b are positive constants. The table shows that when t = 0d = 670, . Substituting 0 for t and 670 for d in the equation
= a(1 + b)^(t) yields 670 = a(1 + b)^(0), which is equivalent to 670 = a(1) , or 670 = a. Substituting 670 for a in the equation
d = ad(1 + b)^(t)
yields . The table also shows that when t = 1, d = 674·02. Substituting 1 for t and 674·02 for d in the equation
= 670d(1=+6b7)0t(1 + b)^(t)
yields 674·02 = 670(1 + b)^(1) , or 674·02 = 670(1 + b). Dividing both sides of this equation by 670 yields 1·006 = 1 + b.
Subtracting 1 from both sides of this equation yields b = 0·006. Substituting 0·006 for b in the equation d = 670(1 + b)^(t) yields d
= 670(1 + 0·006)^(t). Therefore, of the choices, choice B best represents the relationship between t and d.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3cce51ea$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?p| + 61 = 65
Which value is a solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3cce51ea.png$qb$, $qb$[{"label": "A", "body": "65/61"}, {"label": "B", "body": "4"}, {"label": "C", "body": "126"}, {"label": "D", "body": "130"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 61 from each side of the given equation yields |p| = 4. By the definition of absolute value, if |p| = 4, then p = 4
or p = -4. Of the given choices, 4 is a solution to the given equation.
Choice A is incorrect. This is the quotient, not the difference, of 65 and 61.
Choice C is incorrect. This is the sum, not the difference, of 65 and 61 .
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2d1614a1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$P(t) = 290(1·04) (4/6)t
The function P models the population, in thousands, of a certain city t years after 2005. According to the model, the population is predicted to
increase by n% every 18 months. What is the value of n?$qb$, null, $qb$[{"label": "A", "body": "0·38"}, {"label": "B", "body": "1·04"}, {"label": "C", "body": "4"}, {"label": "D", "body": "6"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the function P models the population of the city t years after 2005. Since there are 12 months in a year, 18
months is equivalent to 18/12 years. Therefore, the expression can represent the number of years in x18-month periods. Substituting 18/12 x for
P( 18/12 x) = 290( 1 ·04) (4/6) (18/12x18/()12) x
t in the given equation yields , which is equivalent to P(18/12x) = 290(1·04)x. Therefore, for each 18-month
period, the predicted population of the city is 1·04 times, or 104% of, the previous population. This means that the population is predicted to
increase by 4% every 18 months.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. Each year, the predicted population of the city is 1·04 times the previous year's predicted population, which is not the same
as an increase of 1·04%.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d0e8e8f5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$101211II2468004466222288?(??)/(222 444 666 888 10II00 121122)| || || || || || || || || || || || || |x
The graph of a system of a linear and a quadratic equation is shown. What is the solution (x, y) to this system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d0e8e8f5.png$qb$, $qb$[{"label": "A", "body": "(0, 0)"}, {"label": "B", "body": "(-4, 1)"}, {"label": "C", "body": "(4, -1)"}, {"label": "D", "body": "(4, 1)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The solution to the system corresponds to the point where the graphs of the equations intersect. The graphs of the linear
equation and the quadratic equation shown intersect at the point (4, 1). Therefore, (4, 1) is the solution to this system.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9ed9f54d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9ed9f54d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "5x"}, {"label": "D", "body": "5x2"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since  is a common term in the original expression, like terms can be added:
. Distributing the constant term 5 yields .
Choice B is incorrect and may result from not distributing the negative signs in the expressions within the parentheses. Choice C is incorrect and
may result from not distributing the negative signs in the expressions within the parentheses and from incorrectly eliminating the -term.
Choice D is incorrect and may result from incorrectly eliminating the x-term.$qb$);
select seed_pool_question($qb$CB-7a8cb72a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$7m = 2(n + p)
The given equation relates the positive numbers m n, , and p. Which equation correctly gives m in terms of n and p?$qb$, null, $qb$[{"label": "A", "body": "m = (2(n+p))/7"}, {"label": "B", "body": "m = 2(n + p)"}, {"label": "C", "body": "m = 2(n + p) - 7"}, {"label": "D", "body": "m = 2 - n - p - 7"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Dividing each side of the given equation by 7 yields m = (2(n+p))/7 .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This equation is equivalent to 7 + m = 2(n + p) , not 7m = 2(n + p) .
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-dbe9b217$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 8x^(3) + 4. What is the value of f(2) ?$qb$, null, null, null, array[$qb$68$qb$]::text[], $qb$The correct answer is 68. It's given that the function f is defined by f(x) = 8x^(3) + 4. Substituting 2 for x in this equation yields f(2) = 8(2)^(3)
+ 4, or f(2) = 8(8) + 4, which is equivalent to f(2) = 68. Therefore, the value of f(2) is 68.$qb$);
select seed_pool_question($qb$CB-16aa9758$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = -6x^(2) + 60x - 126
The function f is defined by the given equation. Which of the following equivalent forms of the equation displays the maximum value of the
function as a constant or coefficient?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-16aa9758.png$qb$, $qb$[{"label": "A", "body": "f(x) = -6x^(2) + 42x + 18x - 126"}, {"label": "B", "body": "f(x) = -6x(x - 7) + 18(x - 7)"}, {"label": "C", "body": "f(x) = -6(x - 5)^(2) + 24"}, {"label": "D", "body": "f(x) = -6(x - 7)(x - 3)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The given equation is quadratic. The maximum value of a function defined by a quadratic equation can be displayed as a
constant in the vertex form of the equation, f(x) = a(x - h)^(2) + k, where the maximum value of the function is k, which occurs when x = h,
and a is a constant. The given equation can be rewritten in this form by completing the square. To complete the square, the given equation can
be rewritten as f(x) = -6(x^(2) - 10x) - 126, which is equivalent to f(x) = -6(x^(2) - 10x + 25) - 126 + 6(25) , or f(x) = -6(x - 5)^(2)
+ 24. This equation is in vertex form, where a = -6h = 5, , and k = 24. Therefore, f(x) = -6(x - 5)^(2) + 24 displays the maximum value,
24, of the function as a constant.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This form displays one of the zeros, not the maximum value, of the function as a constant.
Choice D is incorrect. This form displays the zeros, not the maximum value, of the function as constants.$qb$);
select seed_pool_question($qb$CB-18c7c3e0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 13x2 - 7x2?$qb$, null, $qb$[{"label": "A", "body": "-91x^(2)"}, {"label": "B", "body": "6x2"}, {"label": "C", "body": "20x^(2)"}, {"label": "D", "body": "40x^(2)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since each term in the given expression has a common factor of x2 , it can be rewritten as (13 - 7)x^(2), or 6x2 . Therefore,
the expression 6x2 is equivalent to 13x2 - 7x2 .
Alternate approach: Since the two terms of the given expression are both constant multiples of x2, they are like terms and can, therefore, be
combined through subtraction. Subtracting like terms in the expression 13x2 - 7x2 yields 6x2 .
Choice A is incorrect. This expression is equivalent to (13x)(-7x) , not 13x2 - 7x2 .
Choice C is incorrect. This expression is equivalent to 13x^(2) + 7x^(2) , not 13x2 - 7x2 .
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-30281058$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, the graph of  intersects line p at  and , where a and b are constants. What is the slope of line p ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-30281058.png$qb$, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "2"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the graph of  and line p intersect at  and . Therefore, the value of y when  is the
value of a, and the value of y when  is the value of b. Substituting 1 for x in the given equation yields , or . Similarly,
substituting 5 for x in the given equation yields , or . Therefore, the intersection points are  and . The slope
of line p is the ratio of the change in y to the change in x between these two points: , or 6.
Choices B, C, and D are incorrect and may result from conceptual or calculation errors in determining the values of a, b, or the slope of line p.$qb$);
select seed_pool_question($qb$CB-42f19012$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to a 11/12 , where a > 0?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-42f19012.png$qb$, $qb$[{"label": "A", "body": "^(1)?^(2) -a132"}, {"label": "B", "body": "^(14)?^(4) -a132"}, {"label": "C", "body": "^(12)?^(1) -a132"}, {"label": "D", "body": "^(1)?^(1) -a132"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since 12/12 = 1, multiplying the exponent of the given expression by 12/12 yields an equivalent expression: a ( 11/12 ) ( 12/12 ) = a ( 132/144 ) .
Since 132/144 = 132 ( 1/144 ) , the expression a 132/144 can be rewritten as a(132) (1/144) . Applying properties of exponents, this expression can be rewritten
as (a132 ) 1/144 . An expression of the form (m) 1/? , where m > 0 and k > 0, is equivalent to √? -m. Therefore, (a132 ) 1/144 is equivalent to ^(14)?^(4) -a132.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-294db8ec$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is equivalent to ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-294db8ec.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The expression  has two terms,  and 4. The greatest common factor of these two terms is 2. Factoring 2 from
each of these terms yields , or .
Choices A and B are incorrect because 4 is not a factor of the term . Choice C is incorrect and may result from factoring 2 from  but not
from 4.$qb$);
select seed_pool_question($qb$CB-2f8a580c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function k is defined by k(x) = x3 + 110. What is the value of k(x) when x = 2?$qb$, null, $qb$[{"label": "A", "body": "118"}, {"label": "B", "body": "116"}, {"label": "C", "body": "115"}, {"label": "D", "body": "110"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Substituting 2 for x in the given equation yields k(2) = 23 + 110, which is equivalent to k(2) = 8 + 110, or k(2) = 118.
Therefore, the value of k(x) when x = 2 is 118.
Choice B is incorrect. This is the value of k(x) when x = 2 if k(x) = 3x + 110, not k(x) = x3 + 110.
Choice C is incorrect. This is the value of k(x) when x = 2 if k(x) = x + 3 + 110, not k(x) = x3 + 110.
Choice D is incorrect. This is the value of k(x) when x = 0, not x = 2.$qb$);
select seed_pool_question($qb$CB-84dd43f8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For the function ff(0) = 86, , and for each increase in x by 1 , the value of f(x) decreases by 80%. What is the value of f(2) ?$qb$, null, null, null, array[$qb$3.44$qb$, $qb$86/25$qb$]::text[], $qb$The correct answer is 3·44. It’s given that f(0) = 86 and that for each increase in x by 1, the value of f(x) decreases by 80%. Because the
output of the function decreases by a constant percentage for each 1 -unit increase in the value of x, this relationship can be represented by an
exponential function of the form f(x) = a(b)^(x), where a represents the initial value of the function and b represents the rate of decay,
expressed as a decimal. Because , the value of a must be 86. Because the value of decreases by 80% for each 1 -unit increase
(1 - 0f·8(00)) = 86 f(xf)(=^(x))86(0·2)^(x)
in x, the value of b must be , or 0·2. Therefore, the function f can be defined by . Substituting 2 for x in this
function yields f(2) = 86(0·2)^(2) , which is equivalent to f(2) = 86(0·04) , or f(2) = 3·44. Either 3·44 or 86?25 may be entered as the correct
answer.
Alternate approach: It’s given that  and that for each increase in x by 1 , the value of decreases by 80%. Therefore, when x = 1 ,
(100 - 80)%f(0) = 86
the value of f(x) is , or 20%, of 86, which can be expressed as (0·20)((08·62)0)(17f·2(^(x)()0)·20)(8(60)·2=0)1(717·2·2) = 3·44. Since , the value of f(1) is 17·2.
Similarly, when x = 2, the value of f(x) is 20% of 17·2, which can be expressed as . Since , the value of
f(2) is 3·44. Either 3·44 or 86?25 may be entered as the correct answer.$qb$);
select seed_pool_question($qb$CB-9ff88bb5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?^(?)tm?See
12II36966992233??/(111 222 333)| || || || |x
???^(t)e?
?ime (SeC0ndS)
A competitive diver dives from a platform into the water. The graph shown gives the height above the water y, in meters, of the diver x seconds
after diving from the platform. What is the best interpretation of the x-intercept of the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9ff88bb5.png$qb$, $qb$[{"label": "A", "body": "The diver reaches a maximum height above the water at 1·6 seconds."}, {"label": "B", "body": "The diver hits the water at 1·6 seconds."}, {"label": "C", "body": "The diver reaches a maximum height above the water at 0·2 seconds."}, {"label": "D", "body": "The diver hits the water at 0·2 seconds."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the graph shows the height above the water y, in meters, of a diver x seconds after diving from a platform. The
x-intercept of a graph is the point at which the graph intersects the x-axis, or when the value of y is 0. The graph shown intersects the x-axis
between x = 1 and x = 2. In other words, the diver is 0 meters above the water, or hits the water, between 1 and 2 seconds after diving from
the platform. Of the given choices, only choice B includes an interpretation where the diver hits the water between 1 and 2 seconds. Therefore,
the best interpretation of the x-intercept of the graph is the diver hits the water at 1·6 seconds.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect. This is the best interpretation of the maximum value, not the x-intercept, of the graph.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-94ff3e2d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function h is defined by h (x) = 8/(5x+6) . What is the value of h(2)?$qb$, null, null, null, array[$qb$.5$qb$, $qb$1/2$qb$]::text[], $qb$The correct answer is 1/2 . The value of h(2) is the value of h(x) when x = 2. Substituting 2 for x in the given equation yields h (2) = 8/(5(2)+6),
which is equivalent to h (2) = 8/16 , or h (2) = 1/2 . Therefore, the value of h(2) is 1/2 . Note that 1/2 and .5 are examples of ways to enter a correct
answer.$qb$);
select seed_pool_question($qb$CB-59d1f4b5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation above models the number of members, M, of a gym t years after the gym opens. Of the following, which equation models the
number of members of the gym q quarter years after the gym opens?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-59d1f4b5.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. In 1 year, there are 4 quarter years, so the number of quarter years, q, is 4 times the number of years, t ; that is, . This
is equivalent to , and substituting this into the expression for M in terms of t gives .
Choices B and D are incorrect and may be the result of incorrectly using  instead of . (Choices B and D are nearly the same since
is equivalent to , which is approximately .) Choice C is incorrect and may be the result of incorrectly using
and unnecessarily dividing 0.02 by 4.$qb$);
select seed_pool_question($qb$CB-281a4f3b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A certain college had 3,000 students enrolled in 2015. The college predicts that after 2015, the number of students enrolled each year will be
2% less than the number of students enrolled the year before. Which of the following functions models the relationship between the number of
students enrolled, , and the number of years after 2015, x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-281a4f3b.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Because the change in the number of students decreases by the same percentage each year, the relationship between the
number of students and the number of years can be modeled with a decreasing exponential function in the form , where
is the number of students, a is the number of students in 2015, r is the rate of decrease each year, and x is the number of years since 2015.
It’s given that 3,000 students were enrolled in 2015 and that the rate of decrease is predicted to be 2%, or 0.02. Substituting these values into the
decreasing exponential function yields , which is equivalent to .
Choices A, B, and C are incorrect and may result from conceptual errors when translating the given information into a decreasing exponential
function.$qb$);
select seed_pool_question($qb$CB-4fb8a648$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = x + 9
y = x^(2) + 16x + 63
A solution to the given system of equations is (x, y). What is the greatest possible value of x?$qb$, null, $qb$[{"label": "A", "body": "-6"}, {"label": "B", "body": "7"}, {"label": "C", "body": "9"}, {"label": "D", "body": "63"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that y = x + 9 and ; therefore, it follows that x + 9 = x^(2) + 16x + 63. This equation can be
rewritten as x + 9 = (x + 9)(x + 7)0 = (x + 9) ((x + 7y) =(-xx1+)^(2)9+) 16x + 63. Subtracting  from both sides of this equation yields 0 = (x + 9)(x + 7) - (x + 9) . This
equation can be rewritten as , or 0 = (x + 9)(x + 6) . By the zero product property, x + 9 = 0 or x + 6 = 0.
Subtracting 9 from both sides of the equation x + 9 = 0 yields x = -9. Subtracting 6 from both sides of the equation x + 6 = 0 yields
x = -6. Therefore, the given system of equations has solutions, (x, y), that occur when x = -9 and x = -6. Since -6 is greater than -9,
the greatest possible value of x is -6.
Choice B is incorrect. This is the negative of the greatest possible value of x when y = 0 for the second equation in the given system of
equations.
Choice C is incorrect. This is the value of y when x = 0 for the first equation in the given system of equations.
Choice D is incorrect. This is the value of y when x = 0 for the second equation in the given system of equations.$qb$);
select seed_pool_question($qb$CB-72ae8a87$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f(x) = 200,000(1·21)^(x) gives a company’s predicted annual revenue, in dollars, x years after the company started selling light
bulbs online, where 0 < x ≤ 10. What is the best interpretation of the statement “f(5) is approximately equal to 518,748” in this context?$qb$, null, $qb$[{"label": "A", "body": "5 years after the company started selling light bulbs online, its predicted annual revenue is approximately 518,748 dollars."}, {"label": "B", "body": "5 years after the company started selling light bulbs online, its predicted annual revenue will have increased by a total of approximately 518,748 dollars."}, {"label": "C", "body": "When the company’s predicted annual revenue is approximately 518,748 dollars, it is 5 times the predicted annual revenue for the previous year."}, {"label": "D", "body": "When the company’s predicted annual revenue is approximately 518,748 dollars, it is 5% greater than the predicted annual revenue for the previous year."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the function f(x) = 200,000(1·21)^(x) gives a company's predicted annual revenue, in dollars, x years after the
company started selling light bulbs online. It follows that  represents the company's predicted annual revenue, in dollars, x years after the
f(xf) (5)
company started selling light bulbs online. Since the value of is the value of f(x) when x = 5, it follows that "f(5) is approximately equal
to 518,748" means that f(x) is approximately equal to 518,748 when x = 5. Therefore, the best interpretation of the statement "f(5) is
approximately equal to 518,748" in this context is 5 years after the company started selling light bulbs online, its predicted annual revenue is
approximately 518,748 dollars.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-5ae4803e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$((x+9)(x-9))/(x+9) = 7
What is the solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "9"}, {"label": "C", "body": "16"}, {"label": "D", "body": "63"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since the left-hand side of the given equation has a factor of x + 9 in both the numerator and the denominator, the solution
to the given equation can be found by solving the equation x - 9 = 7. Adding 9 to both sides of this equation yields x = 16. Substituting 16 for
x in the given equation yields ((16+9)(16-9))/(16+9) = 7, or 7 = 7. Therefore, the solution to the given equation is 16.
Choice A is incorrect. Substituting 7 for x in the given equation yields ((7+9)(7-9))/(7+9) = 7, or -2 = 7, which is false.
Choice B is incorrect. Substituting 9 for x in the given equation yields ((9+9)(9-9))/(9+9) = 7, or 0 = 7, which is false.
Choice D is incorrect. Substituting 63 for x in the given equation yields ((63+9)(63-9))/(63+9) = 7, or 54 = 7, which is false.$qb$);
select seed_pool_question($qb$CB-133f3e41$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$20/p = 2o/q - 2o/r - 2o/s
The given equation relates the positive variables pqr, , , and s. Which of the following is equivalent to q?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-133f3e41.png$qb$, $qb$[{"label": "A", "body": "p + r + s"}, {"label": "B", "body": "20(p + r + s)"}, {"label": "C", "body": "prs/(pr+ps+rs)"}, {"label": "D", "body": "prs/(20p+2or+2os)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Multiplying each side of the given equation by yields . Distributing on each side of
1/(210/r) +( 20/p1/s) = 1/20 ( 2o/q - 2o/r - 20/s )
this equation yields , or 1/p(p=r)/prs 1/(+^(q)) (-ps)/prs1/r+-(r-ss)/prs1/12o = 1/q. Adding  to each side of this equation yields 1/s(pr++1/p2s01/(+^(r))rs+)/prs 1/(=p) (=1)/q 1/q .
pr/pr 20/(201p/r) = ps/ps20/2oq - 20/(210/p r) -rs/rs20/20s
Multiplying 1/s by , by , and by  yields , which is equivalent to (pr+ps+rs)/prs = 1/q . Since , and it's
given that pqr, , , and s are positive, it follows that the reciprocals of each side of this equation are also equal. Thus, prs/(pr+ps+rs) = q/1 , or prs/(pr+ps+rs)
= q. Therefore, prs/(pr+ps+rs) is equivalent to q.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b3b07f0c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-/(|-f(x) ?)| ?(-24)/(-|)|(-30)/(-|)|(-32)/(-|)|
-8 -8 8
For the quadratic function f, the table shows three values of x and their corresponding values of f(x). Which equation defines f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b3b07f0c.png$qb$, $qb$[{"label": "A", "body": "f(x) = (x - 24)(x - 30) + 4"}, {"label": "B", "body": "f(x) = (x - 24)(x - 30) - 8"}, {"label": "C", "body": "f(x) = (x - 8)(x - 32) + 32"}, {"label": "D", "body": "f(x) = (x - 8)(x - 32) - 32"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. According to the table, , , and . Let the quadratic function g be defined by
+ 8. Therefore, g(24g) (=24-) 8=+f8(24) g+(284)g(=300)f=(24f)(3=0)-+88f(30) = -8, , and gf(3(320) )= f(3f2()32+) 8= 8. Substituting -8 for f(24) in the equation
g(2gg4(()^(x)24=)g)=(f=3(f020()4^(x)))
+ 8 yields , or . Substituting -8 for in the equation yields g(30) = -8 + 8, or
g(30)g=(32f)(3=0)1+6 8
= 0. Substituting 8 for f(32) in the equation g(32) = f(32) + 8 yields g(32) = 8 + 8, or . By the factor theorem, if
and , then g(x) = k(x - 24)(x - 30) , where k is a constant. Since , substituting 32 for x and 16 for g(x) in the
g(30g) (=x)0= k(x - 24)(x - 30)
equation yields 16 = k(32 - 24)(32 - 30), or , which is equivalent to 16 = 16k. Dividing both
sides of this equation by 16 yields 1 = k. Substituting 1 for k in the equation g1(6xg=()3=2k)(kf8=()(xx(12-)6)=24()x(x--243)0g()x(x-) =30g)(x(-(x))/8 =24)(x(x--2340))(x - 30g)(x) yields .
Since , it follows that . Subtracting 8 from both sides of the equation yields
- 8 =g((^(x)x)-=2f4)(^(x)(x) +- 830) - 8 g(x) -f(x8)= fg(x(x) ) - 8
. Substituting for in this equation yields .
Choice A is incorrect. If this equation defined f, then when x = 24, the value of f(x) would be 4, not -8.
Choice C is incorrect. If this equation defined f, then when x = 32, the value of f(x) would be 32, not 8.
Choice D is incorrect. If this equation defined f, then when x = 32, the value of f(x) would be -32, not 8.$qb$);
select seed_pool_question($qb$CB-01668cd6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The functions f and g are defined by the given equations, where x ≥ 0. Which of the following equations displays, as a constant or coefficient,
the maximum value of the function it defines, where x ≥ 0?
I. f(x) = 33(0·4)^(x)+^(3)
II. g(x) = 33(0·16)(0·4)^(x)-^(2)$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Functions f and g are both exponential functions with a base of 0·40. Since 0·40 is less than 1, functions f and g are both
decreasing exponential functions. This means that f(x) and g(x) decrease as x increases. Since f(x) and g(x) decrease as x increases, the
maximum value of each function occurs at the least value of x for which the function is defined. It's given that functions f and  are defined for
f^(g)(0)
x ≥ 0. Therefore, the maximum value of each function occurs at x = 0. Substituting 0 for x in the equation defining f yields
, which is equivalent to f(0) = 33(0·4)^(3), or f(0) = 2·112. Therefore, the maximum value of f is 2·112. Since the equation f(x)
== 3333((00··44))x^(0)++^(3)3
doesn't display the value 2·112, the equation defining f doesn't display the maximum value of f. Substituting 0 for x in the
equation defining g yields g(0) = 33(0·16)(0·4)^(0)-^(2), which can be rewritten as , or , which is
g(0) =g(x33) (=0·1363)(0(1/(·01·46^(2))))(0·4)gx(-02) = 33(0·16) (1/(o·16))
equivalent to g(0) = 33. Therefore, the maximum value of g is 33. Since the equation displays the value 33, the
equation defining g displays the maximum value of g. Thus, only equation II displays, as a constant or coefficient, the maximum value of the
function it defines.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-95eeeb5b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function  is defined by f(x) = ax2 + bx + c, where ab, , and c are constants. The graph of y= f(x) in the xy-plane passes through the
(7, 0) f
points  and (-3, 0). If a is an integer greater than 1 , which of the following could be the value of a + b?$qb$, null, $qb$[{"label": "A", "body": "-6"}, {"label": "B", "body": "-3"}, {"label": "C", "body": "4"}, {"label": "D", "body": "5"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the graph of y= f(x) in the xy-plane passes through the points and . It follows that when the
f((7x,)0=) ax2(-+3b,x0)+ c
value of x is either 7 or -3, the value of f(x) is 0. It's also given that the function f is defined by , where ab, , and c are
constants. It follows that the function f is a quadratic function and, therefore, may be written in factored form as f(x)
, where the value of f(x) is 0 when x is either u or v. Since the value of f(x) is 0 when the value of x is either 7 or -3, and
the value of  is 0 when the value of x is either u or v, it follows that u and v are equal to 7 and -3. Substituting 7 for u and -3 for v in the
=^(a)(^(x) -f^(u)()^(x)f()^(x)(^(x)=f-)(^(a)x^(v)())^(x)=-a^(u)()x(^(2x)--7^(v)x) + 3x -f(2^(x)1))=^(a)f(^(x)(x-) =7)a(^(x)x^(2)--(-4a3x))- 21a
equation  yields , or . Distributing the right-hand side of this
f(x) = a(x - 7) (x +f3()x) = ax2 + bx + c
equation yields , or . Since it's given that , it follows that b =
-4a. Adding a to each side of this equation yields a + b = -3a. Since a + b = -3a, if a is an integer, the value of a + b must be a multiple of
3. If a is an integer greater than 1, it follows that a ≥ 2. Therefore, -3a ≤ -3(2). It follows that the value of a + b is less than or equal to
-3(2) , or -6. Of the given choices, only -6 is a multiple of 3 that's less than or equal to -6.
Choice B is incorrect. This is the value of a + b if a is equal to, not greater than, 1.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c77ef2fb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Blood volume,, in a human can be determined using the equation , where  is the plasma volume and H is the hematocrit
(the fraction of blood volume that is red blood cells). Which of the following correctly expresses the hematocrit in terms of the blood volume and
the plasma volume?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c77ef2fb.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The hematocrit can be expressed in terms of the blood volume and the plasma volume by solving the given equation
for H. Multiplying both sides of this equation by  yields . Dividing both sides by  yields
. Subtracting 1 from both sides yields . Dividing both sides by  yields .
Choices B, C, and D are incorrect and may result from errors made when manipulating the equation.$qb$);
select seed_pool_question($qb$CB-7399c3b0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$k^(2) - 53 = 91
What is the positive solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "144"}, {"label": "B", "body": "72"}, {"label": "C", "body": "38"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Adding 53 to each side of the given equation yields k^(2) = 144. Taking the square root of each side of this equation yields k
= ±12. Therefore, the positive solution to the given equation is 12.
Choice A is incorrect. This is the positive solution to the equation k^(2) - 53 = 20,683, not k^(2) - 53 = 91.
Choice B is incorrect. This is the positive solution to the equation k^(2) - 53 = 5,131 , not k^(2) - 53 = 91 .
Choice C is incorrect. This is the positive solution to the equation k^(2) - 53 = 1,391, not k^(2) - 53 = 91.$qb$);
select seed_pool_question($qb$CB-99c5e794$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A model predicts that the population of Bergen was 15,000 in 2005. The model also predicts that each year for the next 5 years, the population
p increased by 4% of the previous year's population. Which equation best represents this model, where x is the number of years after 2005, for
x ≤ 5?$qb$, null, $qb$[{"label": "A", "body": "p = 0·96(15,000)^(x)"}, {"label": "B", "body": "p = 1·04(15,000)^(x)"}, {"label": "C", "body": "p = 15,000(0·96)^(x)"}, {"label": "D", "body": "p = 15,000(1·04)^(x)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that a model predicts the population of Bergen in 2005 was 15,000. The model also predicts that each year for the
next 5 years, the population increased by 4% of the previous year's population. The predicted population in one of these years can be found by
multiplying the predicted population from the previous year by 1·04. Since the predicted population in 2005 was 15,000, the predicted
population 1 year later is 15,000(1·04) . The predicted population 2 years later is this value times 1·04, which is 15,000(1·04)(1·04) , or
15,000(1·04)^(2). The predicted population 3 years later is this value times 1·04, or 15,000(1·04)^(3). More generally, the predicted population, px,
years after 2005 is represented by the equation p = 15,000(1·04)^(x).
Choice A is incorrect. Substituting 0 for x in this equation indicates the predicted population in 2005 was 0·96 rather than 15,000.
Choice B is incorrect. Substituting 0 for x in this equation indicates the predicted population in 2005 was 1·04 rather than 15,000.
Choice C is incorrect. This equation indicates the predicted population is decreasing, rather than increasing, by 4% each year.$qb$);
select seed_pool_question($qb$CB-5ae186b4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$(-54)/w = 6
What is the solution to the given equation?$qb$, null, null, null, array[$qb$-9$qb$]::text[], $qb$The correct answer is -9. Since w is in the denominator of a fraction in the given equation, w can't be equal to 0. Since w isn't equal to 0,
multiplying both sides of the given equation by w yields an equivalent equation, -54 = 6w. Dividing both sides of this equation by 6 yields
-9 = w. Therefore, -9 is the solution to the given equation.$qb$);
select seed_pool_question($qb$CB-b76a2815$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The power P produced by a machine is represented by the equation above, where W is the work performed during an amount of time t. Which of
the following correctly expresses W in terms of P and t ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b76a2815.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Multiplying both sides of the equation by t yields , or , which expresses W in terms of P and t.
This is equivalent to W = Pt.
Choices B, C, and D are incorrect. Each of the expressions given in these answer choices gives W in terms of P and t but doesn’t maintain the
given relationship between W, P, and t. These expressions may result from performing different operations with t on each side of the equation. In
choice B, W has been multiplied by t, and P has been divided by t. In choice C, W has been multiplied by t, and the quotient of P divided by t has
been reciprocated. In choice D, W has been multiplied by t, and P has been added to t. However, in order to maintain the relationship between the
variables in the given equation, the same operation must be performed with t on each side of the equation.$qb$);
select seed_pool_question($qb$CB-1be909aa$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to (h1?q7)/h5q21 , where h > 0 and q > 0?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1be909aa.png$qb$, $qb$[{"label": "A", "body": "h10/q14"}, {"label": "B", "body": "(h^(3))/q3"}, {"label": "C", "body": "h10q14"}, {"label": "D", "body": "h3q3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. For positive values of a, = a(^(m)-^(n)), where m and n are integers. Since it's given that h > 0 and q > 0, this property can
be applied to rewrite the given expression as (a^(m))/(^(a)(^(n)h) (1h5-1o5)q)-(1q4(7-2(1h) )1o) ( 1/q14 ), which is equivalent to h10q-14. For positive values of a a -n = 1/(a^(n)), . This
property can be applied to rewrite the expression  as , which is equivalent to h19/q14.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-bdb0aa23$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 5x5 - 6x4 + 8x3 ?$qb$, null, $qb$[{"label": "A", "body": "x^(4)(5x - 6)"}, {"label": "B", "body": "x3(5x^(2) - 6x + 8)"}, {"label": "C", "body": "8x3(5x^(2) - 6x + 1)"}, {"label": "D", "body": "6x5 (-6x^(4) + 8x3 + 1)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since x3 is a common factor of each term in the given expression, the expression can be rewritten as x3(5x^(2) - 6x + 8) .
Choice A is incorrect. This expression is equivalent to 5x5 - 6x4.
Choice C is incorrect. This expression is equivalent to 40x5 - 48x^(4) + 8x3.
Choice D is incorrect. This expression is equivalent to -36x9 + 48x8 + 6x5.$qb$);
select seed_pool_question($qb$CB-09f58996$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 6 + √-x. What is the value of f(36) ?$qb$, null, null, null, array[$qb$12$qb$]::text[], $qb$The correct answer is 12. The value of f(36) is the value of f(x) when x = 36. Substituting 36 for x in the given equation yields f(36) = 6
+ √-36, which is equivalent to f(36) = 6 + 6, or f(36) = 12. Thus, the value of f(36) is 12.$qb$);
select seed_pool_question($qb$CB-d84a514a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f(x) = 240,000(1·22)^(x) gives a company’s predicted annual revenue, in dollars, x years after the company started selling jewelry
online, where 0 < x ≤ 10. What is the best interpretation of the statement “f(5) is approximately equal to 648,650” in this context?$qb$, null, $qb$[{"label": "A", "body": "5 years after the company started selling jewelry online, its predicted annual revenue is approximately 648,650 dollars."}, {"label": "B", "body": "5 years after the company started selling jewelry online, its predicted annual revenue will have increased by a total of approximately 648,650 dollars."}, {"label": "C", "body": "When the company’s predicted annual revenue is approximately 648,650 dollars, it is 5 times the predicted annual revenue for the previous year."}, {"label": "D", "body": "When the company’s predicted annual revenue is approximately 648,650 dollars, it is 5% greater than the predicted annual revenue for the previous year."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the function f gives a company’s predicted annual revenue, in dollars, x years after the company started
selling jewelry online. Since the value of f(5) is the value of f(x) when x = 5, it follows that “f(5) is approximately equal to 648,650” means
that f(x) is approximately equal to 648,650 when x = 5. Therefore, the best interpretation of the given statement is that 5 years after the
company started selling jewelry online, its predicted annual revenue is approximately 648,650 dollars.
Choice B is incorrect. The function f gives the predicted annual revenue, not the predicted increase in annual revenue.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect. In the given function, x represents the number of years after the company started selling jewelry online, not the percent
increase in revenue from the previous year.$qb$);
select seed_pool_question($qb$CB-beb86a0c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 9x^(2) + 5x?$qb$, null, $qb$[{"label": "A", "body": "x(9x + 5)"}, {"label": "B", "body": "5x(9x + 1)"}, {"label": "C", "body": "9x(x + 5)"}, {"label": "D", "body": "x^(2)(9x + 5)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since x is a factor of each term in the given expression, the expression is equivalent to x(9x) + x(5) , or x(9x + 5) .
Choice B is incorrect. This expression is equivalent to 45x^(2) + 5x, not 9x^(2) + 5x.
Choice C is incorrect. This expression is equivalent to 9x^(2) + 45x, not 9x^(2) + 5x.
Choice D is incorrect. This expression is equivalent to 9x3 + 5x2, not 9x^(2) + 5x.$qb$);
select seed_pool_question($qb$CB-5910bfff$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The formula above can be used to approximate the dew point D, in degrees Fahrenheit, given the temperature T, in degrees Fahrenheit, and the
relative humidity of H percent, where . Which of the following expresses the relative humidity in terms of the temperature and the dew
point?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5910bfff.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that . Solving this formula for H expresses the relative humidity in terms of the
temperature and the dew point. Subtracting T from both sides of this equation yields . Multiplying both sides by
yields . Subtracting 100 from both sides yields . Multiplying both sides
by  results in the formula .
Choices B, C, and D are incorrect and may result from errors made when rewriting the given formula.$qb$);
select seed_pool_question($qb$CB-7ba694f3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The number of bacteria in a liquid medium doubles every day. There are 44,000 bacteria in the liquid medium at the start of an observation.
Which represents the number of bacteria, y, in the liquid medium t days after the start of the observation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7ba694f3.png$qb$, $qb$[{"label": "A", "body": "y = 1/2 (44,000)t"}, {"label": "B", "body": "y = 2(44,000)^(t)"}, {"label": "C", "body": "y = 44,000(1/2)t"}, {"label": "D", "body": "y = 44,000(2)^(t)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the number of bacteria doubles every day, the relationship between t and y can be represented by an exponential
equation of the form y = a(b)^(t), where a is the number of bacteria at the start of the observation and the number of bacteria increases by a
factor of b every day. It’s given that there are 44,000 bacteria at the start of the observation. Therefore, a = 44,000. It’s also given that the
number of bacteria doubles, or increases by a factor of 2, every day. Therefore, b = 2. Substituting 44,000 for a and 2 for b in the equation y
= a(b)^(t) yields y = 44,000(2)^(t).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This equation represents a situation where the number of bacteria is decreasing by half, not doubling, every day.$qb$);
select seed_pool_question($qb$CB-fbb96bb1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x - 29 = (x - a) (x - 29)
Which of the following are solutions to the given equation, where a is a constant and a > 30?
I. a
II. a + 1
III. 29$qb$, null, $qb$[{"label": "A", "body": "I and II only"}, {"label": "B", "body": "I and III only"}, {"label": "C", "body": "II and III only"}, {"label": "D", "body": "I, II, and III"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Subtracting the expression from both sides of the given equation yields 0 = (x - a)(x - 29) - (x - 29), which
0 = (x - a)(x - 29) + (-(^(x)1)-(x2-9) 29)
can be rewritten as . Since the two terms on the right-hand side of this equation have a common factor
of , it can be rewritten as , or . Since x - a - 1 is equivalent to x
- ((xa +- 21)9) 0 = (x -02=9)((x^(x) -- a29-)(1^(x))-^(a) + (-1)) 0 =0 =(^(x)(-x -292)9(^(x))(-x -^(a) -(a1+) 1))
, the equation can be rewritten as . By the zero product property, it follows
that x - 29 = 0 or x - (a + 1) = 0. Adding 29 to both sides of the equation x - 29 = 0 yields x = 29. Adding a + 1 to both sides of the
equation x - (a + 1) = 0 yields x = a + 1. Therefore, the two solutions to the given equation are 29 and a + 1. Thus, only a + 1 and 29, not
a, are solutions to the given equation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-63c00e2b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$r/38 = s + t
The given equation relates the quantities r s, , and t. Which equation correctly expresses r in terms of s and t?$qb$, null, $qb$[{"label": "A", "body": "r = s + t + 38"}, {"label": "B", "body": "r = s + t - 38"}, {"label": "C", "body": "r = 38(s + t)"}, {"label": "D", "body": "r = (s+t)/38"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Multiplying both sides of the given equation by 38 yields r = 38(s + t) .
Choice A is incorrect. This equation is equivalent to r - 38 = s + t, not r/38 = s + t.
Choice B is incorrect. This equation is equivalent to r + 38 = s + t, not r/38 = s + t.
Choice D is incorrect. This equation is equivalent to 38r = s + t, not r/38 = s + t.$qb$);
select seed_pool_question($qb$CB-6e06a0a7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6e06a0a7.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Expanding the given expression using the distributive property yields . Combining like terms yields
, or , which is equivalent to .
Choices A and B are incorrect and may result from incorrectly combining like terms. Choice C is incorrect and may result from distributing
only to a, and not to 3, in the given expression.$qb$);
select seed_pool_question($qb$CB-ad038c19$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ad038c19.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The expression  can be rewritten as . Using the distributive property, the expression yields
. Combining like terms gives .
Choices A, B, and C are incorrect and may result from errors using the distributive property on the given expression or combining like terms.$qb$);
select seed_pool_question($qb$CB-c7a187a7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = x^(2) - 18x - 360
If the given function f is graphed in the xy-plane, where y = f(x), what is an x-intercept of the graph?$qb$, null, $qb$[{"label": "A", "body": "(-12, 0)"}, {"label": "B", "body": "(-30, 0)"}, {"label": "C", "body": "(-360, 0)"}, {"label": "D", "body": "(12, 0)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that y= f(x). The x-intercepts of a graph in the xy-plane are the points where y = 0. Thus, for an x-intercept of
the graph of function f0 = f(x), . Substituting 0 for f(x) in the equation f(x) = x^(2) - 18x - 360 yields 0 = x^(2) - 18x - 360. Factoring the
right-hand side of this equation yields 0 = (x + 12)(x - 30) . By the zero product property, x + 12 = 0 and x - 30 = 0. Subtracting 12 from
both sides of the equation x + 12 = 0 yields x = -12. Adding 30 to both sides of the equation x - 30 = 0 yields x = 30. Therefore, the x-
intercepts of the graph of y = f(x) are (-12, 0) and (30, 0). Of these two x-intercepts, only (-12, 0) is given as a choice.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ebe4bde0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The quadratic function graphed above models a particular measure of plant diversity as a function of the elevation in a region of Switzerland.
According to the model, which of the following is closest to the elevation, in meters, at which plant diversity is greatest?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ebe4bde0.png$qb$, $qb$[{"label": "A", "body": "13,500"}, {"label": "B", "body": "3,000"}, {"label": "C", "body": "1,250"}, {"label": "D", "body": "250"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Each point  on the graph represents the elevation x, in meters, and the corresponding measure of plant diversity y in a
region of Switzerland. Therefore, the point on the graph with the greatest y-coordinate represents the location that has the greatest measure of
plant diversity in the region. The greatest y-coordinate of any point on the graph is approximately 13,500. The x-coordinate of that point is
approximately 1,250. Therefore, the closest elevation at which the plant diversity is the greatest is 1,250 meters.
Choice A is incorrect. This value is closest to the greatest y-coordinate of any point on the graph and therefore represents the greatest measure
of plant diversity, not the elevation where the greatest measure of plant diversity occurs. Choice B is incorrect. At an elevation of 3,000 meters
the measure of plant diversity is approximately 4,000. Because there are points on the graph with greater y-coordinates, 4,000 can’t be the
greatest measure of plant diversity, and 3,000 meters isn’t the elevation at which the greatest measure of plant diversity occurs. Choice D is
incorrect. At an elevation of 250 meters, the measure of plant diversity is approximately 11,000. Because there are points on the graph with
greater y-coordinates, 11,000 can’t be the greatest measure of plant diversity and 250 meters isn’t the elevation at which the greatest measure of
plant diversity occurs.$qb$);
select seed_pool_question($qb$CB-ef926848$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Square P has a side length of x inches. Square Q has a perimeter that is 176 inches greater than the perimeter of square P. The function f gives
the area of square Q, in square inches. Which of the following defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = (x + 44)^(2)"}, {"label": "B", "body": "f(x) = (x + 176)^(2)"}, {"label": "C", "body": "f(x) = (176x + 44)^(2)"}, {"label": "D", "body": "f(x) = (176x + 176)^(2)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Let x represent the side length, in inches, of square P. It follows that the perimeter of square P is 4x inches. It's given that
square Q has a perimeter that is 176 inches greater than the perimeter of square P. Thus, the perimeter of square Q is 176 inches greater than
4x inches, or 4x + 176 inches. Since the perimeter of a square is 4 times the side length of the square, each side length of Q is , or x
(x + 44) (x (4x+176)/(+ 4^(4)4))
+ 44 inches. Since the area of a square is calculated by multiplying the length of two sides, the area of square Q is , or
(x + 44)^(2) square inches. It follows that function f is defined by f(x) = (x + 44)^(2) .
Choice B is incorrect. This function represents a square with side lengths (x + 176) inches.
Choice C is incorrect. This function represents a square with side lengths (176x + 44) inches.
Choice D is incorrect. This function represents a square with side lengths (176x + 176) inches.$qb$);
select seed_pool_question($qb$CB-77c0cced$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = 2x^(2) - 21x + 64
y = 3x + a
In the given system of equations, a is a constant. The graphs of the equations in the given system intersect at exactly one point, (x, y), in the xy-
plane. What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "-8"}, {"label": "B", "body": "-6"}, {"label": "C", "body": "6"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the graphs of the equations in the given system intersect at exactly one point, (x, y) , in the xy-plane. Therefore,
(x, y) is the only solution to the given system of equations. The given system of equations can be solved by subtracting the second equation, y
= 3x + a, from the first equation, y = 2x^(2) - 21x + 64. This yields y - y = (2x^(2) - 21x + 64) - (3x + a) , or 0 = 2x^(2) - 24x + 64 - a.
Since the given system has only one solution, this equation has only one solution. A quadratic equation in the form rx2 + sx + t = 0, where r,
s, and t are constants, has one solution if and only if the discriminant, s2 - 4rt, is equal to zero. Substituting 2 for r -24,  for s, and -a + 64
for t in the expression s2 - 4rt yields (-24)2 - (4)(2)(64 - a). Setting this expression equal to zero yields (-24)^(2) - (4)(2)(64 - a) = 0,
or 8a + 64 = 0. Subtracting 64 from both sides of this equation yields 8a = -64. Dividing both sides of this equation by 8 yields a = -8.
Substituting -8 for a in the equation 0 = 2x^(2) - 24x + 64 - a yields 0 = 2x^(2) - 24x + 64 + 8, or 0 = 2x^(2) - 24x + 72. Factoring 2 from
the right-hand side of this equation yields 0 = 2(x^(2) - 12x + 36) . Dividing both sides of this equation by 2 yields 0 = x^(2) - 12x + 36, which
is equivalent to 0 = (x - 6)(x - 6), or 0 = (x - 6)^(2). Taking the square root of both sides of this equation yields 0 = x - 6. Adding 6 to both
sides of this equation yields x = 6.
Choice A is incorrect. This is the value of a, not x.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-635f54ee$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The surface area of a cube is , where a is a positive constant. Which of the following gives the perimeter of one face of the cube?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-635f54ee.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A cube has 6 faces of equal area, so if the total surface area of a cube is , then the area of one face is .
Likewise, the area of one face of a cube is the square of one of its edges; therefore, if the area of one face is , then the length of one edge
of the cube is . Since the perimeter of one face of a cube is four times the length of one edge, the perimeter is .
Choice A is incorrect because if the perimeter of one face of the cube is , then the total surface area of the cube is ,
which is not . Choice C is incorrect because if the perimeter of one face of the cube is 4a, then the total surface area of the cube is
, which is not . Choice D is incorrect because if the perimeter of one face of the cube is 6a, then the total surface
area of the cube is , which is not .$qb$);
select seed_pool_question($qb$CB-c99d154a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(246?446622?? ?)/(-/--/--/--/-?888 666 444 222??÷÷864244662288 222 ?44 ??? ???)|| || || || || || || || ?| || || || || || || || || | x
What is the y-coordinate of the y-intercept of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c99d154a.png$qb$, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. A y-intercept of a graph in the xy-plane is a point (x, y) on the graph where x = 0. For the graph shown, at x = 0, the
corresponding value of y is 3. Therefore, the y-coordinate of the y-intercept of the graph shown is 3.$qb$);
select seed_pool_question($qb$CB-a26c29f7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f (x) = 7x^(3). In the xy-plane, the graph of y = g (x) is the result of shifting the graph of y= f(x) down 2 units.
Which equation defines function g?$qb$, null, $qb$[{"label": "A", "body": "g (x) = 7/2 x3"}, {"label": "B", "body": "g (x) = 7x 3/2"}, {"label": "C", "body": "g (x) = 7x3 + 2"}, {"label": "D", "body": "g (x) = 7x3 - 2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. If the graph of y = g (x) is the result of shifting the graph of  down k units in the xy-plane, the function g can be
f (x) = 7xy^(3) = f (^(x))
defined by an equation of the form . It’s given that and the graph of y = g (x) is the result of shifting the graph
g (x)7=x3f (x) - k
of y= f(x) down 2 units. Substituting for f(x) and 2 for k in the equation g(x) = f(x) - k yields g (x) = 7x3 - 2.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect. This equation defines a function g for which the graph of y = g (x) is the result of shifting the graph of y= f(x) up, not
down, 2 units.$qb$);
select seed_pool_question($qb$CB-99269e03$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-/1??? |||(-y)/119/(-|)|||
a
The table shows three values of x and their corresponding values of y for the equation y = 4(2)^(x) + 3. In the table, a is a constant. What is the
value of a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-99269e03.png$qb$, $qb$[{"label": "A", "body": "67"}, {"label": "B", "body": "35"}, {"label": "C", "body": "32"}, {"label": "D", "body": "27"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the table shows three values of x and their corresponding values of y for the equation y = 4(2)^(x) + 3. It's also
given that when x = 3 the corresponding value of y is a, and a is a constant. Substituting 3 for x and a for y in the given equation yields a
= 4(2)^(3) + 3, or a = 35. Therefore, the value of a is 35.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a1262cdb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The equation 12t + b = c relates the variables tb, , and c. Which of the following correctly expresses the value of c - b in terms of t?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a1262cdb.png$qb$, $qb$[{"label": "A", "body": "t/12"}, {"label": "B", "body": "t"}, {"label": "C", "body": "t + 1/12"}, {"label": "D", "body": "12t"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Subtracting b from each side of the given equation yields 12t = c - b. Therefore, the expression 12t correctly expresses the
value of c - b in terms of t.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-893c7519$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?-(?10?121111111?34567890044776699??22883355II11 |)/((1II ?- 1II)/-÷111)|| | || | x
The graph of the exponential function f is shown, where y= f(x) . The y-intercept of the graph is (0, y). What is the value of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-893c7519.png$qb$, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. For the graph of the exponential function f shown, where y = f(x), it's given that the y-intercept of the graph is (0, y) .
The graph intersects the y-axis at the point (0, 3). Therefore, the value of y is 3.$qb$);
select seed_pool_question($qb$CB-0980fcdd$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A solution to the given system of equations is . Which of the following is a possible value of xy ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0980fcdd.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "6"}, {"label": "C", "body": "12"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Solutions to the given system of equations are ordered pairs  that satisfy both equations in the system. Adding the left-
hand and right-hand sides of the equations in the system yields , or . Subtracting y from
both sides of this equation yields . Taking the square root of both sides of this equation yields  and . Therefore, there
are two solutions to this system of equations, one with an x-coordinate of 6 and the other with an x-coordinate of . Substituting 6 for x in the
second equation yields , or ; therefore, one solution is . Similarly, substituting  for x in the second equation
yields , or ; therefore, the other solution is . It follows then that if  is a solution to the system, then
possible values of  are  and . Only 0 is among the given choices.
Choice B is incorrect. This is the x-coordinate of one of the solutions, . Choice C is incorrect and may result from conceptual or
computational errors. Choice D is incorrect. This is the square of the x-coordinate of one of the solutions, .$qb$);
select seed_pool_question($qb$CB-3c600337$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 270(0·1)^(x). What is the value of f(0)?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "27"}, {"label": "D", "body": "270"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The value of f(0) is the value of f(x) when x = 0. Substituting 0 for x in the given function yields f(0) = 270(0·1)^(0), or
f(0) = 270(1), which is equivalent to f(0) = 270. Therefore, the value of f(0) is 270.
Choice A is incorrect. This is the value of x, not f(x) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of f(1) , not f(0) .$qb$);
select seed_pool_question($qb$CB-3ea87153$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function g is defined by g(x) = x2 + 9. For which value of x is g(x) = 25?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "5"}, {"label": "C", "body": "9"}, {"label": "D", "body": "13"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that g(x) = x2 + 9. Substituting 25 for g(x) in this equation yields 25 = x^(2) + 9. Subtracting 9 from both sides
of this equation yields 16 = x2 . Taking the square root of each side of this equation yields x = ±4. It follows that g(x) = 25 when the value of
x is 4 or -4. Only 4 is listed among the choices.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-290cdc2c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to (x) 1/14 , where x > 0?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-290cdc2c.png$qb$, $qb$[{"label": "A", "body": "1/14 · x"}, {"label": "B", "body": "1?4 -x"}, {"label": "C", "body": "14 · x"}, {"label": "D", "body": "(x) 14"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. An expression in the form x 1/? , where x > 0 and k > 0, is equivalent to √? -x. It follows that x 1/14 , where x > 0, is equivalent
to 1?4 -x.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-abc61109$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to (4x+1)/(x-9) , where x > 9?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-abc61109.png$qb$, $qb$[{"label": "A", "body": "4 + 37/(x-9)"}, {"label": "B", "body": "4 + 35/(x-9)"}, {"label": "C", "body": "4 + 1/(x-9)"}, {"label": "D", "body": "4 - 1/(x-9)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given expression  can be rewritten as (4x-36+36+1)/(x-9) , which is equivalent to . Factoring 4 from the
(4(x-9))/(x-9)(4x+1)/(x-+9)37/(x-9) 4 + 37/(x-9)(4x-36)/(x-9) + 37/(x-9)
numerator of the first fraction yields . Since x > 9, this expression is equivalent to . Therefore, (4x+1)/(x-9) is equivalent to 4
+ 37/(x-9) .
Choice B is incorrect. This expression is equivalent to (4x-1)/(x-9) , not (4x+1)/(x-9) .
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-499cb491$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 5x2 - 50xy2 ?$qb$, null, $qb$[{"label": "A", "body": "5x(x - 10y^(2))"}, {"label": "B", "body": "5x(x - 50y^(2))"}, {"label": "C", "body": "5x^(2) (10xy^(2))"}, {"label": "D", "body": "5x^(2)(50xy^(2))"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since each term of the given expression has a factor of 5x, it can be rewritten as 5x(x) - 5x(10y^(2)), or 5x(x - 10y^(2)) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d46da42c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined as shown. Which of the following graphs in the xy-plane could be the graph of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d46da42c.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. For the quadratic function , the vertex of the graph is , and because the  term is positive, the vertex
is the minimum of the function. Choice D is the only option that meets these conditions.
Choices A, B, and C are incorrect. The vertex of each of these graphs doesn’t correspond to the minimum of the given function.$qb$);
select seed_pool_question($qb$CB-4209aefe$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f(x) = 206(1·034)^(x) models the value, in dollars, of a certain bank account by the end of each year from 1957 through 1972,
where x is the number of years after 1957. Which of the following is the best interpretation of “f(5) is approximately equal to 243” in this
context?$qb$, null, $qb$[{"label": "A", "body": "The value of the bank account is estimated to be approximately 5 dollars greater in 1962 than in 1957."}, {"label": "B", "body": "The value of the bank account is estimated to be approximately 243 dollars in 1962."}, {"label": "C", "body": "The value, in dollars, of the bank account is estimated to be approximately 5 times greater in 1962 than in 1957."}, {"label": "D", "body": "The value of the bank account is estimated to increase by approximately 243 dollars every 5 years between 1957 and 1972."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the function f(x) = 206(1·034)^(x) models the value, in dollars, of a certain bank account by the end of each
year from 1957 through 1972, where x is the number of years after 1957. It follows that f(x) represents the estimated value, in dollars, of the
bank account x years after 1957. Since the value of f(5) is the value of f(x) when x = 5, it follows that “f(5) is approximately equal to 243”
means that f(x) is approximately equal to 243 when x = 5. In the given context, this means that the value of the bank account is estimated to
be approximately 243 dollars 5 years after 1957. Therefore, the best interpretation of the statement “f(5) is approximately equal to 243” in this
context is the value of the bank account is estimated to be approximately 243 dollars in 1962.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-482a445b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to (x^(2) + 11)^(2) + (x - 5) (x + 5)?$qb$, null, $qb$[{"label": "A", "body": "x^(4) + 23x^(2) - 14"}, {"label": "B", "body": "x^(4) + 23x^(2) + 96"}, {"label": "C", "body": "x^(4) + 12x^(2) + 121"}, {"label": "D", "body": "x^(4) + x^(2) + 146"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The expression  can be written as , which is equivalent to .
(x^(2) + 11)(^(x2) + 1x1^(4))+^(2) 11x^(2) + 11x^(2) + 121(^(x2) + 1x1^(4)) (+^(x2)2+2x1^(2)1+) 121 (xx^(2)-(x5^(2)) (+x1+1)5)+ 11(x^(2) + 11)
Distributing x2 and 11 to yields , or . The expression  is equivalent to
(x - 5)x + (x - 5)5. Distributing x and 5 to yields x^(2) - 5x + 5x - 25, or x^(2) - 25. Therefore, the expression (x^(2) + 11)^(2)
+ (x - 5) (x + 5x) 4 + 23x2 + 96 (x^(4) + 22x(^(2x)+-152)1) + (x^(2) - 25) is equivalent to , or x^(4) + 22x^(2) + 121 + x^(2) - 25. Combining like terms in this
expression yields .
Choice A is incorrect. Equivalent expressions must be equivalent for any value of x. Substituting 0 for x in this expression yields -14, whereas
substituting 0 for x in the given expression yields 96.
Choice C is incorrect. Equivalent expressions must be equivalent for any value of x. Substituting 0 for x in this expression yields 121 , whereas
substituting 0 for x in the given expression yields 96.
Choice D is incorrect. Equivalent expressions must be equivalent for any value of x. Substituting 0 for x in this expression yields 146, whereas
substituting 0 for x in the given expression yields 96.$qb$);
select seed_pool_question($qb$CB-f1fa0821$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$1012IIII2468004466222288?-/(-1II| 222| ?33| 444| 555|)|?| | | | | |x
The graph gives the estimated population y, in thousands, of a town x years since 2003, where 0 ≤ x ≤ 5. Which of the following best
describes the increase in the estimated population from x = 0 to x = 1 ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f1fa0821.png$qb$, $qb$[{"label": "A", "body": "The estimated population at x = 1 is 0·5 times the estimated population at x = 0."}, {"label": "B", "body": "The estimated population at x = 1 is 1·5 times the estimated population at x = 0."}, {"label": "C", "body": "The estimated population at x = 1 is 2·5 times the estimated population at x = 0."}, {"label": "D", "body": "The estimated population at x = 1 is 3·5 times the estimated population at x = 0."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. On the graph shown, the y-axis represents estimated population, in thousands. The graph shows that when x = 0, the y-
coordinate is 6. Therefore, the estimated population at x = 0 is 6 thousand. The graph also shows that when x = 1, the y-coordinate is 9.
Therefore, the estimated population at x = 1 is 9 thousand. Dividing 9 thousand by 6 thousand yields 1·5; therefore, 9 thousand is 1·5 times 6
thousand. It follows that the estimated population at x = 1 is 1·5 times the estimated population at x = 0.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9833d0e3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$According to a model, the estimated volume of a certain tree in a forest increases by 13·9% for every increase of 100 centimeters in the tree's
height. The equation y = ab ?/1o9 represents this model, where y represents the estimated volume, in cubic centimeters, of this tree in the forest, x
represents the tree's height, in centimeters, and a and b are constants. In this equation, what is the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9833d0e3.png$qb$, $qb$[{"label": "A", "body": "0·139"}, {"label": "B", "body": "1"}, {"label": "C", "body": "1·139"}, {"label": "D", "body": "13·9"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that equation y = ab ?/199 represents the model, where y is the estimated volume, in cubic centimeters, of a certain
tree in a forest and x is the tree's height, in centimeters. For an exponential equation of this form to represent a model where the value of y
increases as the value of x increases, it must follow that the values of a and b are positive. It's also given that the tree's estimated volume
increases by 13·9% for every increase of 100 centimeters in the tree's height. Therefore, for every 100-centimeter increase in the tree's height,
the estimated volume of the tree is 1·139 times larger. In other words, ab (?+10o)/10o = 1 · 1 39ab x/10o , which is equivalent to ab ?/109 b 199/109 = 1 · 1 39ab ?/1o0 .
Since a and b are positive, dividing both sides of this equation by ab ?/1o0 yields b 109/109 = 1 · 1 39, or b = 1·139. Therefore, the value of b is 1·139.
Choice A is incorrect. This is the given percent increase in decimal form, not the value of b.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the given percent increase, not the value of b.$qb$);
select seed_pool_question($qb$CB-5bf0f84a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function above models the height h, in feet, of an object above ground t seconds after being launched straight up in the air. What does the
number 72 represent in the function?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5bf0f84a.png$qb$, $qb$[{"label": "A", "body": "The initial height, in feet, of the object"}, {"label": "B", "body": "The maximum height, in feet, of the object"}, {"label": "C", "body": "The initial speed, in feet per second, of the object"}, {"label": "D", "body": "The maximum speed, in feet per second, of the object"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The variable t represents the seconds after the object is launched. Since , this means that the height, in feet, at 0
seconds, or the initial height, is 72 feet.
Choices B, C, and D are incorrect and may be the result of misinterpreting the function in context.$qb$);
select seed_pool_question($qb$CB-4b6f0a3f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x^(2) - 5x - 24 = 0
What is the sum of the solutions to the given equation?$qb$, null, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. The given quadratic equation can be rewritten in factored form as (x - 8)(x + 3) = 0. Based on the zero product
property, it follows that x - 8 = 0 or x + 3 = 0. Adding 8 to both sides of the equation x - 8 = 0 yields x = 8. Subtracting 3 from both sides
of the equation x + 3 = 0 yields x = -3. Therefore, the solutions to the given equation are 8 and -3. It follows that the sum of the solutions to
the given equation is 8 + (-3), or 5.$qb$);
select seed_pool_question($qb$CB-c048055c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A model predicts that the population of Bergen was 15,000 in 2005. The model also predicts that each year for the next 5 years, the population
p increased by 4% of the previous year's population. Which equation best represents this model, where x is the number of years after 2005, for
x ≤ 5?$qb$, null, $qb$[{"label": "A", "body": "p = 0·96(15,000)^(x)"}, {"label": "B", "body": "p = 1·04(15,000)^(x)"}, {"label": "C", "body": "p = 15,000(0·96)^(x)"}, {"label": "D", "body": "p = 15,000(1·04)^(x)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that a model predicts the population of Bergen in 2005 was 15,000. The model also predicts that each year for the
next 5 years, the population increased by 4% of the previous year's population. The predicted population in one of these years can be found by
multiplying the predicted population from the previous year by 1·04. Since the predicted population in 2005 was 15,000, the predicted
population 1 year later is 15,000(1·04) . The predicted population 2 years later is this value times 1·04, which is 15,000(1·04)(1·04) , or
15,000(1·04)^(2). The predicted population 3 years later is this value times 1·04, or 15,000(1·04)^(3). More generally, the predicted population, px,
years after 2005 is represented by the equation p = 15,000(1·04)^(x).
Choice A is incorrect. Substituting 0 for x in this equation indicates the predicted population in 2005 was 0·96 rather than 15,000.
Choice B is incorrect. Substituting 0 for x in this equation indicates the predicted population in 2005 was 1·04 rather than 15,000.
Choice C is incorrect. This equation indicates the predicted population is decreasing, rather than increasing, by 4% each year.$qb$);
select seed_pool_question($qb$CB-70ebd3d0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function N defined above can be used to model the number of species of brachiopods at various ocean depths d, where d is in hundreds of-
meters. Which of the following does the model predict?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-70ebd3d0.png$qb$, $qb$[{"label": "A", "body": "For every increase in depth by 1 meter, the number of brachiopod species decreases by 115."}, {"label": "B", "body": "For every increase in depth by 1 meter, the number of brachiopod species decreases by 10%."}, {"label": "C", "body": "For every increase in depth by 100 meters, the number of brachiopod species decreases by 115."}, {"label": "D", "body": "For every increase in depth by 100 meters, the number of brachiopod species decreases by 10%."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The function N is exponential, so it follows that  changes by a fixed percentage for each increase in d by 1. Since d is
measured in hundreds of meters, it also follows that the number of brachiopod species changes by a fixed percentage for each increase in
ocean depth by 100 meters. Since the base of the exponent in the model is 0.90, which is less than 1, the number of brachiopod species
decreases as the ocean depth increases. Specifically, the number of brachiopod species at a depth of  meters is 90% of the number of
brachiopod species at a depth of d meters. This means that for each increase in ocean depth by 100 meters, the number of brachiopod species
decreases by 10%.
Choices A and C are incorrect. These describe situations where the number of brachiopod species are decreasing linearly rather than
exponentially. Choice B is incorrect and results from interpreting the decrease in the number of brachiopod species as 10% for every 1-meter
increase in ocean depth rather than for every 100-meter increase in ocean depth.$qb$);
select seed_pool_question($qb$CB-91aa9aa9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to (9x^(2) + 6) - (8x^(2)) ?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "17x^(2) + 6"}, {"label": "C", "body": "x2 - 6"}, {"label": "D", "body": "x^(2) + 6"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given expression is equivalent to 9x^(2) + 6 - 8x^(2) . The terms 9x2 and -8x2 are like terms. Combining these like terms
yields x2. It follows that the expression (9x^(2) + 6) - (8x^(2)) is equivalent to x^(2) + 6.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is equivalent to (9x^(2) + 6) + (8x^(2)) , not the given expression.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-70fb357b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = 576(2^(x)+2)
The graph of the given equation in the xy-plane has a y-intercept of (r, s). Which of the following equivalent equations displays the value of s as
a constant, a coefficient, or the base?$qb$, null, $qb$[{"label": "A", "body": "y = 331,776(^(x)+^(1))"}, {"label": "B", "body": "y = 24(4^(x)+4)"}, {"label": "C", "body": "y = 1/24 (24) (4x+5)"}, {"label": "D", "body": "y = 1/576 (576) (2x+3)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The y-intercept of a graph in the xy-plane is the point where x = 0. Substituting 0 for x in the given equation, y = 576(2^(x)+2) ,
yields y = 576(^(2)(^(0))+^(2)) , which is equivalent to y = 576^(2) , or y = 331,776. Therefore, the graph of the given equation in the xy-plane has a y-
intercept of (0, 331,776) . It follows that r = 0 and s = 331,776. Thus, the equivalent equation y = 331,776(^(x)+^(1)) displays the value of s as
the base.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-20291f47$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which expression is equivalent to (y+12)/(x-8) + (y(x-8))/(x2y-8xy) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-20291f47.png$qb$, $qb$[{"label": "A", "body": "(xy+y+4)/(x3y-16x2y+64xy)"}, {"label": "B", "body": "(xy+9y+12)/(x2y-8xy+x-8)"}, {"label": "C", "body": "(xy2+13xy-8y)/(x2y-8xy)"}, {"label": "D", "body": "(xy2+13xy-8y)/(x3y-16x2y+64xy)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Factoring the denominator in the second term of the given expression gives . This expression can be
rewritten with common denominators by multiplying the first term by xy/xy , giving (xy(y+12))/(xy(x-8))(xy2+12xy++xy-8y)/(x2y-8xy)(y(x-8))/(xy(x-8))(y+12)/(x-8) + (y(x-8))/(xy(x-8)). Adding these two terms yields
(xy(y+12)+y(x-8))/(xy(x-8)) . Using the distributive property to rewrite this expression gives . Combining the like terms in the numerator of
this expression gives (xy2+13xy-8y)/(x2y-8xy) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-42f8e4b4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$One of the factors of 2x3 + 42x^(2) + 208x is x + b, where b is a positive constant. What is the smallest possible value of b?$qb$, null, null, null, array[$qb$8$qb$]::text[], $qb$The correct answer is 8. Since each term of the given expression, 2x3 + 42x^(2) + 208x, has a factor of 2x, the expression can be rewritten as
, or 2x(x^(2) + 21x + 104) . Since the values 8 and 13 have a sum of 21 and a product of 104, the expression x2
2+x2(x1x^(2))++120x4(21x) + 2x(104)
can be factored as (x + 8)(x + 13) . Therefore, the given expression can be factored as . It follows that the
2x(x + 8) (xx++1b3)
factors of the given expression are 2x, , x + 8, and x + 13. Of these factors, only x + 8 and x + 13 are of the form , where b is a positive
constant. Therefore, the possible values of b are 8 and 13. Thus, the smallest possible value of b is 8.$qb$);
select seed_pool_question($qb$CB-0f9f8ea7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 3,600(a)^(x)
The given equation, where a is a positive constant, gives the predicted number of bacteria, y, in a growth medium x hours after the number of
bacteria was initially measured. According to the equation, what was the predicted number of bacteria initially measured in the growth medium?$qb$, null, null, null, array[$qb$3600$qb$]::text[], $qb$The correct answer is 3,600. The predicted number of bacteria initially measured in the growth medium is the value of y when x = 0.
Substituting 0 for x in the given equation yields y = 3,600(a)^(o). Since a is positive, this equation is equivalent to y = 3,600(1) . Therefore, when
x = 0, the value of y is 3,600. Thus, the predicted number of bacteria initially measured in the growth medium is 3,600.$qb$);
select seed_pool_question($qb$CB-a67a439d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x + 7 = 10
(x + 7)^(2) = y
Which ordered pair (x, y) is a solution to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(3, 100)"}, {"label": "B", "body": "(3, 3)"}, {"label": "C", "body": "(3, 10)"}, {"label": "D", "body": "(3, 70)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The solution to a system of equations is the ordered pair (x, y) that satisfies all equations in the system. It's given by the
first equation in the system that x + 7 = 10. Substituting 10 for x + 7 into the second equation yields 102 = y, or y = 100. The x-coordinate
of the solution to the system of equations can be found by subtracting 7 from both sides of the equation x + 7 = 10, which yields x = 3.
Therefore, the ordered pair (3, 100) is a solution to the given system of equations.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-de39858a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function h is defined by h (x) = a^(x) + b, where a and b are positive constants. The graph of y = h (x) in the xy-plane passes through the
points (0, 10) and (-2, 325/36 ). What is the value of ab?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-de39858a.png$qb$, $qb$[{"label": "A", "body": "1/4"}, {"label": "B", "body": "1/2"}, {"label": "C", "body": "54"}, {"label": "D", "body": "60"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the function h is defined by  and that the graph of y = h(x) in the xy-plane passes through the
hh(x(x) )= a^(x) + b
points (0, 10) and (-2, 325/36 ) . Substituting 0 for x and 10 for  in the equation yields 10 = a0 + b, or 10 = 1 + b.
h((x32)5)/36= ax + b
Subtracting 1 from both sides of this equation yields 9 = b. Substituting -2 for x and  for h(x) in the equation h(x) = a^(x) + 9 yields 325/36
= a-2 + 9. Subtracting 9 from both sides of this equation yields 1/36 = a-2, which can be rewritten as a2 = 36. Taking the square root of both
sides of this equation yields a = 6 and a = -6, but because it’s given that a is a positive constant, a must equal 6. Because the value of a is 6
and the value of b is 9, the value of ab is (6)(9) , or 54.
Choice A is incorrect and may result from finding the value of a-2b rather than the value of ab.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from correctly finding the value of a as 6, but multiplying it by the y-value in the first ordered pair rather than
by the value of b.$qb$);
select seed_pool_question($qb$CB-2683b5db$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In a city, the property tax T, in dollars, is calculated using the formula above, where P is the value of the property, in dollars. Which of the following
expresses the value of the property in terms of the property tax?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2683b5db.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. To express the value of the property in terms of the property tax, the given equation must be solved for P. Multiplying both
sides of the equation by 100 gives . Adding 40,000 to both sides of the equation gives .
Therefore, .
Choice A is incorrect and may result from multiplying 40,000 by 0.01, then subtracting 400 from, instead of adding 400 to, the left-hand side of
the equation. Choice B is incorrect and may result from multiplying 40,000 by 0.01. Choice C is incorrect and may result from subtracting instead
of adding 40,000 from the left-hand side of the equation.$qb$);
select seed_pool_question($qb$CB-d41cf4d3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = a√-x + b, where a and b are constants. In the xy-plane, the graph of y = f(x) passes through the point
(-24, 0) , and f(24) < 0. Which of the following must be true?$qb$, null, $qb$[{"label": "A", "body": "f(0) = 24"}, {"label": "B", "body": "f(0) = -24"}, {"label": "C", "body": "a > b"}, {"label": "D", "body": "a < b"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that f(24) < 0. Substituting 24 for f(x) in the equation f(x) = a√-x + b yields . Therefore,
y = f(xf)(24) = a√-24 + b
a√-24 + b < 0. Since √-24 + b can't be negative, it follows that a < 0. It's also given that the graph of passes through the point
. It follows that when x = -24f(x) = 0, . Substituting -24 for x and 0 for f(x) in the equation yields 0
=(-a2√4,(0))/(-24 + b) f√((x) = a)/(24 + b) √=-x0+ b
. By the zero product property, either a = 0 or √--24 + b = 0. Since a < 0, it follows that . Squaring both sides
of this equation yields -24 + b = 0. Adding 24 to both sides of this equation yields b = 24. Since a < 0 and b is 24, it follows that a < b must
be true.
Choice A is incorrect. The value of f(0) is a√-b, which must be negative.
Choice B is incorrect. The value of f(0) is a√-b, which could be -24, but doesn't have to be.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1178f2df$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
(?--21)/23/(?-25)?? ||||(-y)/88/8-/(y = f)||||(x) + 4
The table shows three values of x and their corresponding values of y, where and f is a quadratic function. What is the y-
coordinate of the y-intercept of the graph of y= f(x) in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1178f2df.png$qb$, null, null, array[$qb$-2112$qb$]::text[], $qb$The correct answer is -2,112. It's given that f is a quadratic function. It follows that f can be defined by an equation of the form f(x)
, where ah, , and k are constants. It's also given that the table shows three values of x and their corresponding values of y,
= a(xy-=hf)^(2)(x+) +k4
where . Substituting a(x - h)^(2) + k for f(x) in this equation yields y = a(x - h)^(2) + k + 4. This equation represents a
quadratic relationship between x and y, where k + 4 is either the maximum or the minimum value of y, which occurs when x = h. For quadratic
relationships between x and y, the maximum or minimum value of y occurs at the value of x halfway between any two values of x that have the
same corresponding value of y. The table shows that x-values of 21 and 25 correspond to the same y-value, -8. Since 23 is halfway between 21
and 25, the maximum or minimum value of y occurs at an x-value of 23. The table shows that when x = 23y = 8, . It follows that h = 23 and
k + 4 = 8. Subtracting 4 from both sides of the equation k + 4 = 8 yields k = 4. Substituting 23 for h and 4 for k in the equation y
= a(x - h)^(2) + k + 4 yields y = a(x - 23)^(2) + 4 + 4, or y = a(x - 23)^(2) + 8. The value of a can be found by substituting any x-value and its
corresponding y-value for x and y, respectively, in this equation. Substituting 25 for x and -8 for y in this equation yields -8 = a(25 - 23)^(2)
+ 8, or -8 = a(2)^(2) + 8. Subtracting 8 from both sides of this equation yields , or . Dividing both sides of this equation
f-(1x6) == aa((2x)^(2)- h)-21+6k= 4a
by 4 yields -4 = a. Substituting -4 for a23,  for h, and 4 for k in the equation  yields .
f(x) = -4(x - 23f)(^(2)x+) =4
The y-intercept of the graph of y= f(x) in the xy-plane is the point on the graph where x = 0. Substituting 0 for x in the equation
-4(x - 23)^(2) + 4 yields , or f(0) = -4(-23)^(2) + 4. This is equivalent to f(0) = -2,112, so the y-intercept of the
f(0) = -4(0(0, --22,131)^(2)2)+ 4
graph of y = f(x) in the xy-plane is . Thus, the y-coordinate of the y-intercept of the graph of y= f(x) in the xy-plane is -2,112.$qb$);
select seed_pool_question($qb$CB-ce940f80$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x2/25 = 36
What is a solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "30"}, {"label": "C", "body": "450"}, {"label": "D", "body": "900"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Multiplying the left- and right-hand sides of the given equation by 25 yields x^(2) = 900. Taking the square root of the left- and
right-hand sides of this equation yields x = 30 or x = -30. Of these two solutions, only 30 is given as a choice.
Choice A is incorrect. This is a solution to the equation x2 = 36.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-45df91ee$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$g (x) = 11 (1/12)x
If the given function g is graphed in the xy-plane, where y = g (x), what is the y-intercept of the graph?$qb$, null, $qb$[{"label": "A", "body": "(0, 11)"}, {"label": "B", "body": "(0, 132)"}, {"label": "C", "body": "(0, 1)"}, {"label": "D", "body": "(0, 12)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The x-coordinate of any y-intercept of a graph is 0. Substituting 0 for x in the given equation yields g (0) = 11 (1/12)0. Since
any nonzero number raised to the 0th power is 1 , this gives g(0) = 11 · 1, or g(0) = 11. The y-intercept of the graph is, therefore, the point
(0, 11) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c8a5c221$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$(9x^(4) + 8x3) - (7x3 + 5x^(2)) - (3x^(2) + x)
The given expression can be written in the form 9x4 + x3 + ax2 - x, where a is a constant. What is the value of a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c8a5c221.png$qb$, $qb$[{"label": "A", "body": "-8"}, {"label": "B", "body": "-2"}, {"label": "C", "body": "2"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given expression is equivalent to 9x4 + 8x3 - 7x3 - 5x2 - 3x2 - x. By combining like terms, this can be written as
9x4 + x3 - 8x2 - x. This expression is in the form 9x4 + x3 + ax2 - x, where a is a constant. Therefore, the value of a is -8.
Choice B is incorrect. This may result from adding -5x2 and 3x2 rather than -5x2 and -3x2.
Choice C is incorrect. This may result from adding 5x2 and -3x2 rather than -5x2 and -3x2 .
Choice D is incorrect. This may result from adding 5x2 and 3x2 rather than -5x2 and -3x2 .$qb$);
select seed_pool_question($qb$CB-f8871ccd$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to 2 (x - 9/2) (x + 8) ?$qb$, null, $qb$[{"label": "A", "body": "2x^(2) - 72"}, {"label": "B", "body": "2x^(2) + 7x - 72"}, {"label": "C", "body": "2x^(2) - x - 36"}, {"label": "D", "body": "x^(2) + 7x - 36"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In the given expression,  can be rewritten as , or 2x - 9. Applying the distributive property to the
2x2 + 16x2-x -9x2-(9/(^(2)7))2
expression  yields 2x(x +28()x--99/(2()x)2+x28+) 7x - 72, or . Combining like terms in this expression yields 2x2
(2x - 29)(x(x-+98/2)) (x + 8)
+ 7x - 72. Thus,  is equivalent to .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-67e866b5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 9x^(2) + 7x^(2) + 9x?$qb$, null, $qb$[{"label": "A", "body": "63x^(4) + 9x"}, {"label": "B", "body": "9x^(2) + 16x"}, {"label": "C", "body": "25x5"}, {"label": "D", "body": "16x^(2) + 9x"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. In the given expression, the first two terms, 9x2 and 7x2 , are like terms. Combining these like terms yields 9x2 + 7x2 , or
16x^(2). It follows that the expression 9x^(2) + 7x^(2) + 9x is equivalent to 16x^(2) + 9x.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-40f2e601$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$P = N(19 - C)
The given equation relates the positive numbers P, N, and C. Which equation correctly expresses C in terms of P and N?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-40f2e601.png$qb$, $qb$[{"label": "A", "body": "C = (19+P)/N"}, {"label": "B", "body": "C = (19-P)/N"}, {"label": "C", "body": "C = 19 + P/N"}, {"label": "D", "body": "C = 19 - P/N"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the values of PN, , and C are positive. Therefore, dividing each side of the given equation by N yields
19 - P/NP/N
= 19 - C. Subtracting 19 from each side of this equation yields P/N - 19 = -C. Dividing each side of this equation by -1 yields
= C, or C = 19 - P/N .
Choice A is incorrect. This equation is equivalent to P = NC - 19, not P = N(19 - C) .
Choice B is incorrect. This equation is equivalent to P = 19 - NC, not P = N(19 - C) .
Choice C is incorrect. This equation is equivalent to P = N(C - 19) , not P = N(19 - C) .$qb$);
select seed_pool_question($qb$CB-fd65f47f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to (2x^(2) + x - 9) + (x^(2) + 6x + 1) ?$qb$, null, $qb$[{"label": "A", "body": "2x^(2) + 7x + 10"}, {"label": "B", "body": "2x^(2) + 6x - 8"}, {"label": "C", "body": "3x^(2) + 7x - 10"}, {"label": "D", "body": "3x^(2) + 7x - 8"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given expression is equivalent to , which can be rewritten as (2x^(2) + x^(2))
(2^(x2) +^(x) +3x(-^(2)9+))7+x +(^(x)(^(2)-+8)6^(x) +3x1^(2)) + 7x - 8
+ (x + 6x) + (-9 + 1) . Adding like terms in this expression yields , or .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7f87deff$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is an x-coordinate of an x-intercept of the graph of y = 3(x - 14)(x + 5)(x + 4) in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7f87deff.png$qb$, null, null, array[$qb$14$qb$, $qb$-5$qb$, $qb$-4$qb$]::text[], $qb$The correct answer is either 14 -5, , or -4. The x-intercepts of a graph in the xy-plane are the points at which the graph intersects the x-axis, or
when the value of y is 0. Substituting 0 for y in the given equation yields 0 = 3(x - 14)(x + 5)(x + 4) . Dividing both sides of this equation by
3 yields 0 = (x - 14)(x + 5)(x + 4) . Applying the zero product property to this equation yields three equations: x - 14 = 0x + 5 = 0, , and
x + 4 = 0. Adding 14 to both sides of the equation x - 14 = 0 yields x = 14, subtracting 5 from both sides of the equation x + 5 = 0 yields
x = -5, and subtracting 4 from both sides of the equation x + 4 = 0 yields x = -4. Therefore, the x-coordinates of the x-intercepts of the
graph of the given equation are 14 -5, , and -4. Note that 14, -5, and -4 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-97158b3a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The area A, in square centimeters, of a rectangular painting can be represented by the expression w(w + 29), where w is the width, in
centimeters, of the painting. Which expression represents the length, in centimeters, of the painting?$qb$, null, $qb$[{"label": "A", "body": "w"}, {"label": "B", "body": "29"}, {"label": "C", "body": "(w + 29)"}, {"label": "D", "body": "w(w + 29)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the expression w(w + 29) represents the area, in square centimeters, of a rectangular painting, where w is
the width, in centimeters, of the painting. The area of a rectangle can be calculated by multiplying its length by its width. It follows that the length,
in centimeters, of the painting is represented by the expression (w + 29).
Choice A is incorrect. This expression represents the width, in centimeters, of the painting, not its length, in centimeters.
Choice B is incorrect. This is the difference between the length, in centimeters, and the width, in centimeters, of the painting, not its length, in
centimeters.
Choice D is incorrect. This expression represents the area, in square centimeters, of the painting, not its length, in centimeters.$qb$);
select seed_pool_question($qb$CB-84e8cc72$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A quadratic function models the height, in feet, of an object above the ground in terms of the time, in seconds, after the object is launched off an
elevated surface. The model indicates the object has an initial height of 10 feet above the ground and reaches its maximum height of 1,034 feet
above the ground 8 seconds after being launched. Based on the model, what is the height, in feet, of the object above the ground 10 seconds
after being launched?$qb$, null, $qb$[{"label": "A", "body": "234"}, {"label": "B", "body": "778"}, {"label": "C", "body": "970"}, {"label": "D", "body": "1,014"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that a quadratic function models the height, in feet, of an object above the ground in terms of the time, in seconds,
after the object is launched off an elevated surface. This quadratic function can be defined by an equation of the form f(x) = a(x - h)^(2) + k,
where f(x) is the height of the object x seconds after it was launched, and ah, , and k are constants such that the function reaches its
maximum value, k, when x = h. Since the model indicates the object reaches its maximum height of 1,034 feet above the ground 8 seconds
after being launched, f(x) reaches its maximum value, 1,034, when x = 8. Therefore, k = 1,034 and h = 8. Substituting 8 for h and 1,034
for k in the function f(x) = a(x - h)^(2) + k yields f(x) = a(x - 8)^(2) + 1,034. Since the model indicates the object has an initial height of 10
feet above the ground, the value of f(x) is 10 when x = 0. Substituting 0 for x and 10 for f(x) in the equation f(x) = a(x - 8)^(2) + 1,034
yields 10 = a(0 - 8)^(2) + 1,034, or 10 = 64a + 1,034. Subtracting 1,034 from both sides of this equation yields 64a = -1,024. Dividing
both sides of this equation by 64 yields a = -16. Therefore, the model can be represented by the equation f(x) = -16(x - 8)^(2) + 1,034.
Substituting 10 for x in this equation yields f(10) = -16(10 - 8)^(2) + 1,034, or f(10) = 970. Therefore, based on the model, 10 seconds
after being launched, the height of the object above the ground is 970 feet.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0ad5012e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = -1/4x2 + 2x + 29
The given equation models a company’s scheduled deliveries over 8 months, where y is the estimated number of scheduled deliveries x months
after the end of May 2012, where 0 ≤ x ≤ 8. Which statement is the best interpretation of the y-intercept of the graph of this equation in the xy-
plane?$qb$, null, $qb$[{"label": "A", "body": "At the end of May 2012, the estimated number of scheduled deliveries was 0."}, {"label": "B", "body": "At the end of May 2012, the estimated number of scheduled deliveries was 29."}, {"label": "C", "body": "At the end of June 2012, the estimated number of scheduled deliveries was 0."}, {"label": "D", "body": "At the end of June 2012, the estimated number of scheduled deliveries was 29."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The y-intercept of a graph in the xy-plane is the point where x = 0. For the given equation, the y-intercept of the graph in the
xy-plane can be found by substituting 0 for x in the equation, which yields y = -1/4 (0)2 + 2(0) + 29, or y = 29. Therefore, the y-intercept of
the graph is (0, 29) . It’s given that y is the estimated number of scheduled deliveries x months after the end of May 2012. Therefore, x = 0
represents 0 months after the end of May 2012, or the end of May 2012. Thus, the best interpretation of the y-intercept of the graph of this
equation in the xy-plane is that at the end of May 2012, the estimated number of scheduled deliveries was 29.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-5c7d5744$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$(?| 2?6844662288)/(-/--/--/-888 666 444 2÷÷÷642446622 2 ??? 666)|| || || || ?|| || || || ?| | || || || || || || | x
The graph of a system of a linear equation and a nonlinear equation is shown. What is the solution (x, y) to this system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5c7d5744.png$qb$, $qb$[{"label": "A", "body": "(6, 0)"}, {"label": "B", "body": "(-2, 6)"}, {"label": "C", "body": "(0, -2)"}, {"label": "D", "body": "(0, 0)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The solution (x, y) to the system of two equations corresponds to the point where the graphs of the equations intersect in
the xy-plane. The graphs of the linear equation and the nonlinear equation shown intersect at the point (-2, 6) . Thus, the solution (x, y) to this
system is (-2, 6).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-12e7faf8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation  is true for all , where a and d are integers. What is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-12e7faf8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "0"}, {"label": "D", "body": "1"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since the expression  can be factored as , the given equation can be rewritten as
. Since ,  is also not equal to 0, so both the numerator and denominator of  can be
divided by . This gives . Equating the coefficient of x on each side of the equation gives . Equating the constant
terms gives . The sum is .
Choice A is incorrect and may result from incorrectly simplifying the equation. Choices B and D are incorrect. They are the values of d and a,
respectively, not .$qb$);
select seed_pool_question($qb$CB-24016dee$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to (8x^(3) + 8) - (x^(3) - 2) ?$qb$, null, $qb$[{"label": "A", "body": "8x3 + 6"}, {"label": "B", "body": "7x3 + 10"}, {"label": "C", "body": "8x3 + 10"}, {"label": "D", "body": "7x3 + 6"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given expression is equivalent to 8x3 + 8 - x3 - (-2) , or 8x3 + 8 - x3 + 2. Combining like terms in this expression
yields 7x3 + 10.
Choice A is incorrect. This expression is equivalent to (8x^(3) + 8) - 2, not (8x^(3) + 8) - (x^(3) - 2) .
Choice C is incorrect. This expression is equivalent to (8x^(3) + 8) - (-2) , not (8x^(3) + 8) - (x^(3) - 2) .
Choice D is incorrect. This expression is equivalent to (8x3 + 8) - (x3 + 2) , not (8x^(3) + 8) - (x^(3) - 2) .$qb$);
select seed_pool_question($qb$CB-89fc23af$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-89fc23af.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The numerator of the given expression can be rewritten in terms of the denominator, , as follows:
, which is equivalent to . So the given expression is equivalent to
. Since the given expression is defined for , the expression can be
rewritten as .
Long division can also be used as an alternate approach. Choices A, B, and C are incorrect and may result from errors made when dividing the
two polynomials or making use of structure.$qb$);
select seed_pool_question($qb$CB-9a1f1941$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?4x - 3| = -9
How many solutions does the given equation have?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9a1f1941.png$qb$, $qb$[{"label": "A", "body": "Zero"}, {"label": "B", "body": "One"}, {"label": "C", "body": "Two"}, {"label": "D", "body": "Infinitely many"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that |4x - 3| = -9. By the definition of absolute value, the left-hand side of this equation, |4x - 3| , must be
nonnegative. Since the right-hand side of this equation, -9, is negative, it follows that no value of x can make this equation true; therefore, the
given equation has zero solutions.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-041eda89$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x^(2) + 7x + 5 = 0
One solution to the given equation can be written as x = (-7+√-k)/2, where k is a constant. What is the value of k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-041eda89.png$qb$, null, null, array[$qb$29$qb$]::text[], $qb$The correct answer is 29. The solutions to a quadratic equation in the form ax2 + bx + c = 0, where ab, , and c are constants, can be
calculated using the quadratic formula, which gives two solutions: x = (-b+√-b^(2)-4ac)/2a and x = (-b-√-b^(2)-4ac)/2a . The given equation is in the form
ax2 + bx + c = 0, where a = 1b = 7, , and c = 5. It follows that one solution to the given quadratic equation is , or x
x = (-7+√-7^(2)-4(1)(5))/(x = (-27(+1)√-?)/2)
= (-7+√-49-20)/2 , which is equivalent to x = (-7+√-29)/2 . It's given that one solution to the given equation can be written as , where k is a
constant. It follows that the value of k is 29.$qb$);
select seed_pool_question($qb$CB-d8ace155$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A company opens an account with an initial balance of $36,100·00. The account earns interest, and no additional deposits or withdrawals are
made. The account balance is given by an exponential function A, where A(t) is the account balance, in dollars, t years after the account is
opened. The account balance after 13 years is $68,071·93. Which equation could define A?$qb$, null, $qb$[{"label": "A", "body": "A (t) = 36,100·00(1·05)^(t)"}, {"label": "B", "body": "A (t) = 31,971·93(1·05)^(t)"}, {"label": "C", "body": "A (t) = 31,971·93(0·05)^(t)"}, {"label": "D", "body": "A (t) = 36,100·00(0·05)^(t)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since it's given that the account balance, A(t) , in dollars, after t years can be modeled by an exponential function, it follows
that function A can be written in the form A (t) = Nr^(t) , where N is the initial value of the function and r is a constant related to the growth of
the function. It's given that the initial balance of the account is $36,100·00, so it follows that the initial value of the function, or N, must be
36,100·00. Substituting 36,100·00 for N in the equation yields . It's given that the account balance after 13
A (13A) (=t) 6=8,N07^(r)1^(t)·93 A36(,t1)00=·0306r^(,1)1^(3)0=0·0608^(r),0^(t)71·93
years, or when t = 13, is $68,071·93. It follows that , or . Dividing each side of the equation
36,100·00r^(13) = 68,071·93 by 36,100·00 yields r13 = (68,071·93)/(36,1o0·o0) . Taking the 13th root of both sides of this equation yields , or
A (t) = 36, 100·00( 1 ·r05=) t√13 (-68,071·93)/(36,10o·0o)
r is approximately equal to 1·05. Substituting 1·05 for r in the equation A (t) = 36,100·00r^(t) yields , so the
equation A (t) = 36,100·00(1·05)^(t) could define A.
Choice B is incorrect. Substituting 0 for t in this function indicates an initial balance of $31,971·93, rather than $36,100·00.
Choice C is incorrect. Substituting 0 for t in this function indicates an initial balance of $31,971·93, rather than $36,100·00. Additionally, this
function indicates the account balance is decreasing, rather than increasing, over time.
Choice D is incorrect. This function indicates the account balance is decreasing, rather than increasing, over time.$qb$);
select seed_pool_question($qb$CB-c3a72da5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the sum of  and ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c3a72da5.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Adding the two expressions yields . Because the pair of terms  and  and the pair of
terms  and  each contain the same variable raised to the same power, they are like terms and can be combined as  and ,
respectively. The sum of the given expressions therefore simplifies to .
Choice A is incorrect and may result from adding the coefficients and the exponents in the given expressions. Choice B is incorrect and may
result from adding the exponents as well as the coefficients of the like terms in the given expressions. Choice C is incorrect and may result from
multiplying, rather than adding, the coefficients of the like terms in the given expressions.$qb$);
select seed_pool_question($qb$CB-5a74f696$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An investment account was opened with an initial value of $890. The value of the account doubled every 10 years. Which equation represents
the value of the account M(t), in dollars, t years after the account was opened?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5a74f696.png$qb$, $qb$[{"label": "A", "body": "M(t) = 890(1/2) t/19"}, {"label": "B", "body": "M(t) = 890(1/1o) t/2"}, {"label": "C", "body": "M(t) = 890(2) t/19"}, {"label": "D", "body": "M(t) = 890(10) t/2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that t represents the number of years since the account was opened. Therefore, t/1o represents the number of 10-
year periods since the account was opened. Since the value of the account doubles during each of these 10-year periods, the value of the
account can be found by multiplying the initial value by t/1o factors of 2. This is equivalent to 2 t/19 . It's given that the initial value of the account is
$890. Therefore, the value of the account M(t) , in dollars, t years after the account was opened can be represented by M(t) = 890(2) t/1o .
Choice A is incorrect. This equation represents the value of an account if the value of the account halves, not doubles, every 10 years.
Choice B is incorrect. This equation represents the value of an account if the value of the account decreases by 90%, not doubles, every 2, not
10, years.
Choice D is incorrect. This equation represents the value of an account if the value of the account increases by a factor of 10, not doubles, every
2, not 10, years.$qb$);
select seed_pool_question($qb$CB-1863e3be$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The y-intercept of the graph of y = x2 + 31 in the xy-plane is (0, y) . What is the value of y?$qb$, null, null, null, array[$qb$31$qb$]::text[], $qb$The correct answer is 31 . It's given that the y-intercept of the graph of y = x2 + 31 in the xy-plane is (0, y) . Substituting 0 for x in the given
equation yields y = (0)^(2) + 31, or y = 31. Thus, the value of y is 31.$qb$);
select seed_pool_question($qb$CB-dba7432e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x f(x)
0 5
1
|||| |||| ||||
2
3
The table above gives the values of the function f for some values of x. Which of the following equations could define f ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dba7432e.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Each choice has a function with coefficient 5 and base 2, so the exponents must be analyzed. When the input value of x
increases, the output value of f(x) decreases, so the exponent must be negative. An exponent of –x yields the values in the table: ,
, , and .
Choices A and B are incorrect and may result from choosing equations that yield an increasing, rather than decreasing, output value of f(x) when
the input value of x increases. Choice C is incorrect and may result from choosing an equation that doesn’t yield the values in the table.$qb$);
select seed_pool_question($qb$CB-b74f2feb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The expression 6√^(5) -35x45 · √^(8) -28x is equivalent to axb , where a and b are positive constants and x > 1. What is the value of a + b?$qb$, null, null, null, array[$qb$361/8$qb$, $qb$45.12$qb$, $qb$45.13$qb$]::text[], $qb$The correct answer is 361/8 . The rational exponent property is , where ,  and n are integers, and n > 0. This property can be
6√^(?) -35x45 · √^(8) -28x 6√n(-y3(m?)/? )=(xy(4?)/5m/n) (28/8 ) (yx(>1)/8 )0 m
applied to rewrite the given expression  as , or . This expression can be rewritten
by multiplying the constants, which gives . The multiplication exponent property is 6√56((3) (yxn)/35x459·)·√(8y2(m) (=x)/28x 1/(=8y) )n+3m6x 73/8, where y > 0. This property
can be applied to rewrite the expression 3366(x(x99) )(x( x1/(^(8)b)1/(8))=) 73/8 as 36x9+1/8 , or 36x 73/8 . Therefore, . It's given that 6√^(?) -35x45
· √^(8) -28x is equivalent to axb; therefore, a = 36 and . It follows that a + b = 36 + 73/8. Finding a common denominator on the right-hand
side of this equation gives a + b = 288/8 + 73/8, or a + b = 361/8. Note that 361/8, 45.12, and 45.13 are examples of ways to enter a correct
answer.$qb$);
select seed_pool_question($qb$CB-2f958af9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The formula above expresses the square of the speed v of a wave moving along a string in terms of tension T, mass m, and length L of the string.
What is T in terms of m, v, and L ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2f958af9.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. To write the formula as T in terms of m, v, and L means to isolate T on one side of the equation. First, multiply both sides of
the equation by m, which gives , which simplifies to mv2 = LT. Next, divide both sides of the equation by L, which gives
, which simplifies to .
Choices B, C, and D are incorrect and may be the result of incorrectly applying operations to each side of the equation.$qb$);
select seed_pool_question($qb$CB-4d425cef$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the polynomial function f, the graph of y= f(x) in the xy-plane passes through the points (-5, 0) , (1, 0) , and (4, 0) . Which of the
following must be a factor of f(x) ?$qb$, null, $qb$[{"label": "A", "body": "x + 1"}, {"label": "B", "body": "x + 4"}, {"label": "C", "body": "x - 1"}, {"label": "D", "body": "x - 5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that f is a polynomial function and the graph of y = f(x) in the xy-plane passes through the points (-5, 0),
(1, 0) , and (4, 0) . A point in the form (a, 0) on the graph of f(x) means that x - a is a factor of f(x). Since the graph of the function f passes
through the point (1, 0) , x - 1 must be a factor of f(x).
Choice A is incorrect. This is a factor if the graph of y= f(x) passed through (-1, 0) .
Choice B is incorrect. This is a factor if the graph of y = f(x) passed through (-4, 0).
Choice D is incorrect. This is a factor if the graph of y= f(x) passed through (5, 0) .$qb$);
select seed_pool_question($qb$CB-cbc4c163$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 5 ( 1/4 - x) 2 + 11/4 . What is the value of f(1/4) ?$qb$, null, null, null, array[$qb$11/4$qb$, $qb$2.75$qb$]::text[], $qb$The correct answer is . It’s given that the function f is defined by . Substituting 1/4 for x in this equation yields
f( 1/4 ) = 5 ( 1/4 - 1/4 ) 211/(+^(4)) 11/4 f( 1/4 ) = 5 (0) 2 + (f11()/4x) =f(5(1()/4 1/()4) =- (x11))/4 2 + 11/4
, which is equivalent , or . Therefore, the value of f(1/4) is 11/4. Note that 11/4 or
2.75 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-5edc8c98$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$64x^(2) - (16a + 4b)x + ab = 0
In the given equation, a and b are positive constants. The sum of the solutions to the given equation is k(4a + b) , where k is a constant. What
is the value of k?$qb$, null, null, null, array[$qb$.0625$qb$, $qb$1/16$qb$]::text[], $qb$The correct answer is . Let  and q represent the solutions to the given equation. Then, the given equation can be rewritten as
6-46(4x(p-+p)q()x - q) = 1/016 64px^(2) - 64(p + q) + pq = 0
, or . Since this equation is equivalent to the given equation, it follows that -(16a + 4b) =
. Dividing both sides of this equation by -64 yields (16a+4b)/64 = p + q, or 1/16 (4a + b) = p + q. Therefore, the sum of the solutions
to the given equation, p + q, is equal to 1/16 (4a + b) . Since it's given that the sum of the solutions to the given equation is k(4a + b), where k is
a constant, it follows that k = 1/16 . Note that 1/16, .0625, 0.062, and 0.063 are examples of ways to enter a correct answer.
Alternate approach: The given equation can be rewritten as 64x^(2) - 4(4a + b)x + ab = 0, where a and b are positive constants. Dividing both
sides of this equation by 4 yields 16x2 - (4a + b)x + ab/4 = 0. The solutions for a quadratic equation in the form Ax^(2) + Bx + C = 0, where
AB, , and C are constants, can be calculated using the quadratic formula, and x = (-B-√-B^(2)-4AC)/2A . It follows that the sum
x (-=B+√B^(2)-4AC)/2A(-B+√-B^(2)-4AC)/(-2A +)(-B-√-B^(2)-4AC)/2A
of the solutions to a quadratic equation in the form Ax^(2) + Bx + C = 0 is , which can be rewritten as
(-B+-B+√-B^(2)-4AC-√-B^(2)-4AC)/2A , which is equivalent to (-2B)/2A , or . In the equation 16x2 - (4a + b)x + ab/4 = 0, A = 16B = -(4a + b), ,
--B/AB/A
and C = ab/4 . Substituting 16 for A and  for B in  yields - (-(4a+b))/16 , which can be rewritten as 1/16 (4a + b). Thus, the sum of the
1/16 (4a-+(4ba) + b)
solutions to the given equation is . Since it's given that the sum of the solutions to the given equation is k(4a + b), where k is a
constant, it follows that k = 1/16 .$qb$);
select seed_pool_question($qb$CB-c7789423$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$|x - 2| = 9
What is one possible solution to the given equation?$qb$, null, null, null, array[$qb$11$qb$, $qb$-7$qb$]::text[], $qb$The correct answer is 11 or -7. By the definition of absolute value, if ?x - 2? = 9, then x - 2 = 9 or x - 2 = -9. Adding 2 to both sides of
the equation x - 2 = 9 yields x = 11. Adding 2 to both sides of the equation x - 2 = -9 yields x = -7. Thus, the given equation, |x -^(2)|
= 9, has two possible solutions, 11 and -7. Note that 11 and -7 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-ca4ee54e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The graph shows the predicted value y, in dollars, of a certain sport utility vehicle x years after it is first purchased.
??1d11?O?Saea?222233IIII000000555555,000,000,000,000,000,000,,,,,,,,,,,,000000000000000000000000000000000000?-/(-111| 222| ?33| 444| 555|)|?| | | | | |x
?earSa?terPurChaSe
Which of the following is closest to the predicted value of the sport utility vehicle 3 years after it is first purchased?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ca4ee54e.png$qb$, $qb$[{"label": "A", "body": "$9,619"}, {"label": "B", "body": "$13,632"}, {"label": "C", "body": "$19,320"}, {"label": "D", "body": "$23,000"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For the graph shown, the horizontal axis represents the number of years after a certain sport utility vehicle is first purchased,
and the vertical axis represents the predicted value, in dollars, of the sport utility vehicle. According to the graph, 3 years after the sport utility
vehicle is purchased, the predicted value of the sport utility vehicle is between $10,000 and $15,000. Of the given choices, only $13,632 is
between $10,000 and $15,000. Therefore, $13,632 is closest to the predicted value of the sport utility vehicle 3 years after it is first purchased.
Choice A is incorrect. This is closest to the predicted value of the sport utility vehicle 5 years after it is first purchased.
Choice C is incorrect. This is closest to the predicted value of the sport utility vehicle 1 year after it is first purchased.
Choice D is incorrect. This is closest to the predicted value of the sport utility vehicle when it is first purchased.$qb$);
select seed_pool_question($qb$CB-d9137a84$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which expression represents the product of (x-6y3z5 ) and (x4z5 + y8z-7)?$qb$, null, $qb$[{"label": "A", "body": "x-2z10 + y11z-2"}, {"label": "B", "body": "x-2z10 + x-6z-2"}, {"label": "C", "body": "x-2y3z10 + y8z-7"}, {"label": "D", "body": "x-2y3z1o + x-6y11z-2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The product of (x-6y3z5 ) and can be represented by the expression .
x(-x6-x64yy33zz55)z5(x+4zx5-+6yy3y8z8z-57z) -7
Applying the distributive property to this expression yieldsx-6+4y3z5+5 + x-(6xy43z+58(z+x5--y678yz3-z7x5))-2(xy34zz150) ++ x(-x6-y61y1z3z-52) (y8z-7) , or .
This expression is equivalent to , or .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-876a731c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-/(|-|)| |
If (x, y) is a solution of the system of equations above and x > 0, what is the value of xy ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-876a731c.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "2"}, {"label": "C", "body": "3"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Substituting  for y in the second equation gives . This equation can be solved as follows:
Apply the distributive property.
Subtract 2x and 6 from both sides of the equation.
||| ||| |||
Combine like terms.
Factor both terms on the left side of the equation
by 2x.
Thus,  and  are the solutions to the system. Since , only  needs to be considered. The value of y when  is
. Therefore, the value of xy is .
Choices B, C, and D are incorrect and likely result from a computational or conceptual error when solving this system of equations.$qb$);
select seed_pool_question($qb$CB-cd358b89$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Function f is defined by . Function g is defined by g(x) = f(x - 1) . The graph of y = g(x) in the xy-plane
(a, 0)f((xb,)0=) (x +(c6,)0()x + 5)(x + 1)
has x-intercepts at , , and , where ab, , and c are distinct constants. What is the value of a + b + c?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cd358b89.png$qb$, $qb$[{"label": "A", "body": "-15"}, {"label": "B", "body": "-9"}, {"label": "C", "body": "11"}, {"label": "D", "body": "15"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that g(x) = f(x - 1). Since , it follows that
f(x) = (xf+(x6)-(x1+) =5)((xx ++ 51))(x + 4)(x) f(^(x) - 1g)(x) = x(x + 5)(x + 4)
= (x - 1 + 6) (x - 1 + 5) (x - 1 + 1) . Combining like terms yields . Therefore, .
The x-intercepts of a graph in the xy-plane are the points where y = 0. The x-coordinates of the x-intercepts of the graph of y = g(x) in the xy-
plane can be found by solving the equation 0 = x(x + 5)(x + 4). Applying the zero product property to this equation yields three equations:
x = 0x + 5 = 0, , and x + 4 = 0. Solving each of these equations for x yields x = 0 x = -5, , and x = -4, respectively. Therefore, the x-
intercepts of the graph of are (0, 0), (-5, 0) , and (-4, 0) . It follows that the values of ab, , and c are 0, -5, and -4. Thus, the value
0 + (-5)y+=(-g(4^(x)))
of a + b + c is , which is equal to -9.
Choice A is incorrect. This is the value of a + b + c if g(x) = f(x + 1) .
Choice C is incorrect. This is the value of a + b + c - 1 if g(x) = (x - 6)(x - 5)(x - 1).
Choice D is incorrect. This is the value of a + b + c if f(x) = (x - 6)(x - 5)(x - 1) .$qb$);
select seed_pool_question($qb$CB-f89e1d6f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If , which of the following is equivalent to the expression ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f89e1d6f.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Factoring –1 from the second, third, and fourth terms gives x2 – c2 – 2cd – d2 = x2 – (c2 + 2cd + d2). The expression c2 + 2cd
+ d2 is the expanded form of a perfect square: c2 + 2cd + d2 = (c + d)2. Therefore, x2 – (c2 + 2cd + d2) = x2 – (c + d)2. Since a = c + d, x2 – (c + d)2
= x2 – a2. Finally, because x2 – a2 is the difference of squares, it can be expanded as x2 – a2 = (x + a)(x – a).
Choices A and B are incorrect and may be the result of making an error in factoring the difference of squares x2 – a2. Choice D is incorrect and
may be the result of incorrectly combining terms.$qb$);
select seed_pool_question($qb$CB-ff2e5c76$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x^(2) - 40x - 10 = 0
What is the sum of the solutions to the given equation?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "5"}, {"label": "C", "body": "10"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Adding 10 to each side of the given equation yields x^(2) - 40x = 10. To complete the square, adding ( 4o/2 ) 2, or 20^(2), to each
side of this equation yields x^(2) - 40x + 20^(2) = 10 + 20^(2) , or (x - 20)^(2) = 410. Taking the square root of each side of this equation yields x
- 20 = ±√-410. Adding 20 to each side of this equation yields . Therefore, the solutions to the given equation are x = 20
(2x0=+ 2√0±/410√) -4+10(20 - √-410)
+ √-410 and x = 20 - √-410. The sum of these solutions is , or 40.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c5d83a99$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$1/x + 8 = 1/6 + 8
What is the solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "6"}, {"label": "C", "body": "8"}, {"label": "D", "body": "14"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 8 from each side of the given equation yields 1/x = 1/6 . Multiplying each side of this equation by 6x yields 6 = x.
Thus, the solution to the given equation is 6.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c8bf5313$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x = 8
y = x2 + 8
The graphs of the equations in the given system of equations intersect at the point (x, y) in the xy-plane. What is the value of y?$qb$, null, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "24"}, {"label": "C", "body": "64"}, {"label": "D", "body": "72"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the graphs of the equations in the given system intersect at the point (x, y), the point (x, y) represents a solution to
the given system of equations. The first equation of the given system of equations states that x = 8. Substituting 8 for x in the second equation
of the given system of equations yields y = 8^(2) + 8, or y = 72. Therefore, the value of y is 72.
Choice A is incorrect. This is the value of x, not y.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c1eead73$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function g is defined by g(x) = ?x + 18|. What is the value of g(4) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c1eead73.png$qb$, $qb$[{"label": "A", "body": "-18"}, {"label": "B", "body": "-4"}, {"label": "C", "body": "14"}, {"label": "D", "body": "22"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The value of  is the value of g(x) when x = 4. Substituting 4 for x in the given equation yields g(4) = |4 + 18|, which
gg(4(4))= 22
is equivalent to g(4) = |22| , or . Therefore, the value of g(4) is 22.
Choice A is incorrect. This would be the value of g(4) if function g was defined by g(x) = -| 18| , not g(x) = |x + 18? .
Choice B is incorrect. This would be the value of g(4) if function g was defined by g(x) = -|x? , not g(x) = |x + 18| .
Choice C is incorrect. This would be the value of g(4) if function g was defined by g(x) = |-x + 18| , not g(x) = |x + 18| .$qb$);
select seed_pool_question($qb$CB-3934dd0a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which quadratic equation has exactly one distinct real solution?$qb$, null, $qb$[{"label": "A", "body": "(x + 15)^(2) = 0"}, {"label": "B", "body": "(x + 15)^(2) = -45"}, {"label": "C", "body": "(x + 15)^(2) = 45"}, {"label": "D", "body": "(x + 15)^(2) = 135"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Taking the square root of both sides of (x + 15)^(2) = 0 yields x + 15 = 0. Subtracting 15 from both sides of this equation
yields x = -15. Therefore, this equation has exactly one distinct real solution.
Choice B is incorrect. This equation has no distinct real solutions, not exactly one distinct real solution.
Choice C is incorrect. This equation has exactly two distinct real solutions, not exactly one distinct real solution.
Choice D is incorrect. This equation has exactly two distinct real solutions, not exactly one distinct real solution.$qb$);
select seed_pool_question($qb$CB-df0ef054$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the expression above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-df0ef054.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Using the distributive property to multiply the terms in the parentheses yields
, which is equivalent to . Combining like terms results in
.
Choices A and D are incorrect and may result from conceptual errors when multiplying the terms in the given expression. Choice B is incorrect
and may result from adding, instead of multiplying,  and .$qb$);
select seed_pool_question($qb$CB-f1c81b3b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The exponential function g is defined by g(x) = 19 · a^(x) , where a is a positive constant. If g(3) = 2,375, what is the value of g(4) ?$qb$, null, null, null, array[$qb$11875$qb$]::text[], $qb$The correct answer is 11,875. It's given that the exponential function g is defined by , where a is a positive constant, and
g(xg) (=x)19 · a^(x) 2,375 = 19 · ag3(3)
= 2,375. It follows that when x = 3g(x) = 2,375, . Substituting 3 for x and 2,375 for in the given equation yields .
Dividing each side of this equation by 19 yields 125 = a3. Taking the cube root of both sides of this equation gives a = 5. Substituting 4 for x
and 5 for a in the equation g(x) = 19 · a^(x) yields g(4) = 19 · 5^(4), or g(4) = 11, 875. Therefore, the value of g(4) is 11,875.$qb$);
select seed_pool_question($qb$CB-bef4b1c6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$55/(x+6) = x
What is the positive solution to the given equation?$qb$, null, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. Multiplying both sides of the given equation by x + 6 results in 55 = x(x + 6). Applying the distributive property of
multiplication to the right-hand side of this equation results in 55 = x^(2) + 6x. Subtracting 55 from both sides of this equation results in
0 = x^(2) + 6x - 55. The right-hand side of this equation can be rewritten by factoring. The two values that multiply to -55 and add to 6 are 11
and -5. It follows that the equation 0 = x^(2) + 6x - 55 can be rewritten as 0 = (x + 11)(x - 5). Setting each factor equal to 0 yields two
equations: x + 11 = 0 and x - 5 = 0. Subtracting 11 from both sides of the equation x + 11 = 0 results in x = -11. Adding 5 to both sides
of the equation x - 5 = 0 results in x = 5. Therefore, the positive solution to the given equation is 5.$qb$);
select seed_pool_question($qb$CB-c19d1fb0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An egg is thrown from a rooftop. The equation h = -4·9t^(2) + 9t + 18 represents this situation, where h is the height of the egg above the
ground, in meters, t seconds after it is thrown. According to the equation, what is the height, in meters, from which the egg was thrown?$qb$, null, null, null, array[$qb$18$qb$]::text[], $qb$The correct answer is 18. It's given that an egg is thrown from a rooftop and that the equation h = -4·9t^(2) + 9t + 18 represents this situation,
where h is the height of the egg above the ground, in meters, t seconds after it is thrown. If follows that the height, in meters, from which the egg
was thrown is the value of h when t = 0. Substituting 0 for t in the equation h = -4·9t^(2) + 9t + 18 yields h(0) = -4·9(0)^(2) + 9(0) + 18, or
h = 18. Therefore, according to the equation, the height, in meters, from which the egg was thrown is 18.$qb$);
select seed_pool_question($qb$CB-3e9cc0c2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3e9cc0c2.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Multiplying (1 – p) by each term of the polynomial within the second pair of parentheses gives (1 – p)1 = 1 – p; (1 – p)p = p –
p2; (1 – p)p2 = p2 – p3; (1 – p)p3 = p3 – p4; (1 – p)p4 = p4 – p5; (1 – p)p5 = p5 – p6; and (1 – p)p6 = p6 – p7. Adding these seven expressions
together and combining like terms gives 1 + (p – p) + (p2 – p2) + (p3 – p3) + (p4 – p4) + (p5 – p5) + (p6 – p6) – p7, which can be simplified to 1 –
p7.
Choices A, C, and D are incorrect and may result from incorrectly identifying the highest power of p in the expressions or incorrectly combining
like terms.$qb$);
select seed_pool_question($qb$CB-2c5c22d0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$How many solutions are there to the system of equations above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2c5c22d0.png$qb$, $qb$[{"label": "A", "body": "There are exactly 4 solutions."}, {"label": "B", "body": "There are exactly 2 solutions."}, {"label": "C", "body": "There is exactly 1 solution."}, {"label": "D", "body": "There are no solutions."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The second equation of the system can be rewritten as . Substituting  for y in the first equation gives
. This equation can be solved as shown below:
Substituting 1 for x in the equation  gives . Therefore,  is the only solution to the system of equations.
Choice A is incorrect. In the xy-plane, a parabola and a line can intersect at no more than two points. Since the graph of the first equation is a
parabola and the graph of the second equation is a line, the system cannot have more than 2 solutions. Choice B is incorrect. There is a single
ordered pair  that satisfies both equations of the system. Choice D is incorrect because the ordered pair  satisfies both equations
of the system.$qb$);
select seed_pool_question($qb$CB-f678483b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A submersible device is used for ocean research. The function  gives the depth below the surface of the ocean,
g(x) = -1/55 (x +x >190) (x - 35)
in meters, of the submersible device x minutes after collecting a sample, where . How many minutes after collecting the sample did it take
for the submersible device to reach the surface of the ocean?$qb$, null, null, null, array[$qb$35$qb$]::text[], $qb$The correct answer is 35. It's given that the function g(x) = -1/55 (x + 19) (x - 35) gives the depth below the surface of the ocean, in meters,
of the submersible device x minutes after collecting a sample, where x > 0. It follows that when the submersible device is at the surface of the
ocean, the value of g(x) is 0. Substituting 0 for g(x) in the equation g(x) = -1/55 (x + 19) (x - 35) yields 0 = -1/55 (x + 19)(x - 35) .
Multiplying both sides of this equation by -55 yields 0 = (x + 19)(x - 35). Since a product of two factors is equal to 0 if and only if at least
one of the factors is 0, either x + 19 = 0 or x - 35 = 0. Subtracting 19 from both sides of the equation x + 19 = 0 yields x = -19. Adding
35 to both sides of the equation x - 35 = 0 yields x = 35. Since x > 0, 35 minutes after collecting the sample the submersible device
reached the surface of the ocean.$qb$);
select seed_pool_question($qb$CB-7348f046$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the given expression?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7348f046.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Distributing the negative sign to the terms in the second parentheses yields . This expression can be
rewritten as . Combining like terms results in .
Choice A is incorrect and may result from not distributing the negative sign to the 7. Choice B is incorrect and may result from adding  to
instead of subtracting . Choice D is incorrect and may result from adding the product of  and x to the product of 3 and 7.$qb$);
select seed_pool_question($qb$CB-0aaef7aa$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function p is defined by p(n) = 7n3. What is the value of n when p(n) is equal to 56?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0aaef7aa.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "8/3"}, {"label": "C", "body": "7"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that p(n) = 7n3. Substituting 56 for p(n) in this equation yields 56 = 7n^(3). Dividing each side of this equation by
7 yields 8 = n3 . Taking the cube root of each side of this equation yields 2 = n. Therefore, when p(n) is equal to 56, the value of n is 2.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-928498f3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What are the solutions to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-928498f3.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The quadratic formula, , can be used to find the solutions to an equation in the form
. In the given equation, , , and . Substituting these values into the quadratic formula gives
, or .
Choice B is incorrect and may result from using  as the quadratic formula. Choice C is incorrect and may result from using
as the quadratic formula. Choice D is incorrect and may result from using  as the quadratic
formula.$qb$);
select seed_pool_question($qb$CB-26e83bbc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = x^(2) + bx
g(x) = 9x2 - 27x
Functions f and g are given, and in function fb,  is a constant. If f(x) · g(x) = 9x4 - 26x3 - 3x2, what is the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-26e83bbc.png$qb$, $qb$[{"label": "A", "body": "-26"}, {"label": "B", "body": "- 26/9"}, {"label": "C", "body": "1/9"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Multiplying the given functions f and yields . Applying the distributive property to
the right-hand side of this equation yields . Applying the distributive property once again
to the right-hand side of this equation yields f(fx()x·)g·(xg()x=) =(gx2(x) (29)x(f92x(-x2))2·-7gx(()xx)+2)=((2b(x7xx)2()9++x2b((x))/bxf ()(29x(7x9)xx2·)2g-f)((x-x2)7)x(=·b)gx9()xx()247=-x)92x6x4 3+-(-3x227 + 9b)x3, which is equivalent to f(x)
· g(x) = 9x4 - 27x3 + 9bx3 - 27bx2. Factoring out x3 from the second and third terms yields
- 27bx^(2). Since the left-hand sides of and are equal, it
(-27 + 9b)x3 = -26x3f(^(x)) · g(^(x)) = 9^(x4) + (-27-+279bbx)^(x2)3=--237xb^(x22)
follows that , or -27 + 9b = -26, and , or -27b = -3. Adding 27 to each side of -27 + 9b =
-26 yields 9b = 1. Dividing each side of this equation by 9 yields b = 1/9 . Similarly, dividing each side of -27b = -3 by -27 yields b = 1/9 .
Therefore, the value of b is 1/9 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b7cd6ca6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The equation E(t) = 5(1·8)^(t) gives the estimated number of employees at a restaurant, where t is the number of years since the restaurant
opened. Which of the following is the best interpretation of the number 5 in this context?$qb$, null, $qb$[{"label": "A", "body": "The estimated number of employees when the restaurant opened"}, {"label": "B", "body": "The increase in the estimated number of employees each year"}, {"label": "C", "body": "The number of years the restaurant has been open"}, {"label": "D", "body": "The percent increase in the estimated number of employees each year"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. For an exponential function of the form E(t) = a(b)^(t) , where a and b are constants, the initial value of the function—that is,
the value of the function when t = 0—is a and the value of the function increases by a factor of b each time t increases by 1. Since the function
E(t) = 5(1·8)^(t) gives the estimated number of employees at a restaurant and t is the number of years since the restaurant opened, the best
interpretation of the number 5 in this context is the estimated number of employees when t = 0, or when the restaurant opened.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-04b985e6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The kinetic energy, in joules, of an object with mass 9 kilograms traveling at a speed of v meters per second is given by the function K, where
K(v) = 9/2 v2 . Which of the following is the best interpretation of K(34) = 5,202 in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-04b985e6.png$qb$, $qb$[{"label": "A", "body": "The object traveling at 34 meters per second has a kinetic energy of 5,202 joules."}, {"label": "B", "body": "The object traveling at 340 meters per second has a kinetic energy of 5,202 joules."}, {"label": "C", "body": "The object traveling at 5,202 meters per second has a kinetic energy of 34 joules."}, {"label": "D", "body": "The object traveling at 23,409 meters per second has a kinetic energy of 34 joules."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the kinetic energy, in joules, of an object with a mass of 9 kilograms traveling at a speed of v meters per
second is given by the function K, where K(v) = 9/2 v2. It follows that in the equation K(34) = 5,20234,  is the value of v, or the speed of the
object, in meters per second, and 5,202 is the kinetic energy, in joules, of the object at that speed. Therefore, the best interpretation of K(34)
= 5,202 in this context is the object traveling at 34 meters per second has a kinetic energy of 5,202 joules.
Choice B is incorrect. The object traveling at 340 meters per second has a kinetic energy of 520,200 joules.
Choice C is incorrect. The object traveling at 5,202 meters per second has a kinetic energy of 121,773,618 joules.
Choice D is incorrect. The object traveling at 23,409 meters per second has a kinetic energy of 2,465,915,764·5 joules.$qb$);
select seed_pool_question($qb$CB-b47419f4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the expression above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b47419f4.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. By distributing the minus sign through the expression , the given expression can be rewritten as
, which is equivalent to . Combining like terms gives , or .
Choice B is incorrect and may be the result of failing to distribute the minus sign appropriately through the second term and simplifying the
expression . Choice C is incorrect and may be the result of multiplying the expressions  and .
Choice D is incorrect and may be the result of multiplying the expressions  and .$qb$);
select seed_pool_question($qb$CB-fc3dfa26$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$What value of x satisfies the equation above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fc3dfa26.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": "3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Each fraction in the given equation can be expressed with the common denominator . Multiplying  by
yields , and multiplying  by  yields . Therefore, the given equation can be written as
. Multiplying each fraction by the denominator results in the equation , or
. This equation can be solved by setting a quadratic expression equal to 0, then solving for x. Subtracting  from both
sides of this equation yields . The expression  can be factored, resulting in the equation
. By the zero product property,  or . To solve for x in , 1 can be added to both sides of
the equation, resulting in . Dividing both sides of this equation by 2 results in . Solving for x in  yields .
However, this value of x would result in the second fraction of the original equation having a denominator of 0. Therefore,  is an
extraneous solution. Thus, the only value of x that satisfies the given equation is .
Choice A is incorrect and may result from solving  but not realizing that this solution is extraneous because it would result in a
denominator of 0 in the second fraction. Choice B is incorrect and may result from a sign error when solving  for x. Choice D is
incorrect and may result from a calculation error.$qb$);
select seed_pool_question($qb$CB-8838a672$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to the expression above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8838a672.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Using the distributive property, the given expression can be rewritten as . Combining like
terms, this expression can be rewritten as , which is equivalent to .
Choices A, C, and D are incorrect and may result from an error when applying the distributive property or an error when combining like terms.$qb$);
select seed_pool_question($qb$CB-eb268057$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following values of x satisfies the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-eb268057.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": "4"}, {"label": "C", "body": "32"}, {"label": "D", "body": "128"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Solving for x by taking the square root of both sides of the given equation yields  or . Of the choices given,
satisfies the given equation.
Choice B is incorrect and may result from a calculation error when solving for x. Choice C is incorrect and may result from dividing 64 by 2
instead of taking the square root. Choice D is incorrect and may result from multiplying 64 by 2 instead of taking the square root.$qb$);
select seed_pool_question($qb$CB-f76c1858$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$7x^(2) - 20x - 32 = 0
What is the positive solution to the given equation?$qb$, null, null, null, array[$qb$4$qb$]::text[], $qb$The correct answer is 4. The left-hand side of the given equation can be factored as (7x + 8)(x - 4) . Therefore, the given equation, 7x^(2) - 20x
- 32 = 0, can be written as (7x + 8)(x - 4) = 0. Applying the zero product property to this equation yields 7x + 8 = 0 and x - 4 = 0.
Subtracting 8 from both sides of the equation 7x + 8 = 0 yields 7x = -8. Dividing both sides of this equation by 7 yields x = - 8/7. Adding 4
to both sides of the equation x - 4 = 0 yields x = 4. Therefore, the two solutions to the given equation, 7x^(2) - 20x - 32 = 0, are - 8/7 and 4.
It follows that 4 is the positive solution to the given equation.$qb$);
select seed_pool_question($qb$CB-6d9e01a2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = 4x^(2) - 50x + 126
The given equation defines the function f. For what value of x does f(x) reach its minimum?$qb$, null, null, null, array[$qb$25/4$qb$, $qb$6.25$qb$]::text[], $qb$The correct answer is 25/4 . The given equation can be rewritten in the form f(x) = a(x - h)^(2) + k, where ah, , and k are constants. When a
> 0, h is the value of x for which f(x) reaches its minimum. The given equation can be rewritten as , which is
ff(x(x))==44(((xx2--50/850/(4))x2)-+(152o/86)2) + 126
equivalent to . This equation can be rewritten as ,
orf(xf)(x) = 4(fx(x-) (5=o)/8)42(-x24-(25/45o/85o/(4))x2 ++ 1(50/286)2 - (50/8)2) + 126, which is equivalent to f(x) = 4 (x - 25/4 ) 2 - 121/4 . Therefore, h = 25/4 , so the value of x for which
reaches its minimum is . Note that 25/4 and 6.25 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-0af701e7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(^(x)) = ?^(x) - 4^(x)? . What value of a satisfies f(5) - f(a) = -15?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0af701e7.png$qb$, $qb$[{"label": "A", "body": "-20"}, {"label": "B", "body": "5"}, {"label": "C", "body": "10"}, {"label": "D", "body": "45"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the function f is defined by f(^(x)) = |^(x) - 4^(x)| . It's also given that f(5) - f(a) = -15. Substituting 5 for x in
the function  yields  and substituting a for x in the function  yields .
f(f5()^(x)=) =15?^(x) - 4f^(x)(a? ) = |-f3(a5|) = ?5 - 4(5)| f(^(x)) =f(|5^(x))--4f^(x)(?a) = -15f(^(a)) = ?^(a)1-5 -4^(a)?-| 3a?
Therefore,  and . Substituting 15 for  and  for f(a) in the equation  yields
f-(5|-) 3a| |=-3-^(a)3|0
= -15. Subtracting 15 from both sides of this equation yields . Dividing both sides of this equation by -1 yields ?-3a? = 30.
By the definition of absolute value, if |-3a? = 30, then -3a = 30 or -3a = -30. Dividing both sides of each of these equations by -3 yields
a = -10 or a = 10, respectively. Thus, of the given choices, a value of a that satisfies f(5) - f(a) = -15 is 10.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-dd3a910a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(??10II12?456?890044??66992288??55II |)/(??33-222-111 ? 111 222 ?33 444 555 666 ?77 888 999101100)|| || || | || || || || || || || || || || |x
The graph of a system of an absolute value function and a linear function is shown. What is the solution (x, y) to this system of two equations?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dd3a910a.png$qb$, $qb$[{"label": "A", "body": "(-1, 5)"}, {"label": "B", "body": "(0, 4)"}, {"label": "C", "body": "(1, 5)"}, {"label": "D", "body": "(4, 2)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The solution to the system of two equations corresponds to the point where the graphs of the equations intersect. The
graphs of the linear function and the absolute value function shown intersect at the point (1, 5) . Thus, the solution to the system is (1, 5).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the y-intercept of the graph of the linear function.
Choice D is incorrect. This is the vertex of the graph of the absolute value function.$qb$);
select seed_pool_question($qb$CB-2cf7f039$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 8√-x. For what value of x does f(x) = 48?$qb$, null, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "8"}, {"label": "C", "body": "36"}, {"label": "D", "body": "64"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that . Substituting 48 for f(x) in this equation yields 48 = 8√-x. Dividing both sides of this equation
f(x) = 8√√-x-x = 6
by 8 yields 6 = √-x. This can be rewritten as . Squaring both sides of this equation yields x = 36. Therefore, the value of x for which
f(x) = 48 is 36.
Choice A is incorrect. If x = 6f(x) = 8√-6, , not 48.
Choice B is incorrect. If x = 8, f(x) = 8√-8, not 48.
Choice D is incorrect. If x = 64, f(x) = 8√-64, which is equivalent to 64, not 48.$qb$);
select seed_pool_question($qb$CB-0b3d25c5$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to , where ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0b3d25c5.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given expression can also be written as . The trinomial  can be rewritten in factored
form as . Thus, the entire expression can be rewritten as . Simplifying the exponents yields .
Choices A, B, and C are incorrect and may result from errors made when simplifying the exponents in the expression .$qb$);
select seed_pool_question($qb$CB-083ef63a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = (x - 2)(x + 15)
The function f is defined by the given equation. For what value of x does f(x) reach its minimum?$qb$, null, null, null, array[$qb$-13/2$qb$, $qb$-6.5$qb$]::text[], $qb$The correct answer is . The value of x for which f(x) reaches its minimum can be found by rewriting the given equation in the form f(x)
- 13/(f^(2)() x)
= (x - h)^(2) + k, where  reaches its minimum, k, when the value of x is h. The given equation, , can be rewritten
(xf2 (+x)1=3x(+x -(123/2))(2x)+-1350) - (13/2)2
as f(x) = x^(2) + 13x - 30. By completing the square, this equation can be rewritten as f(x) = , which
is equivalent to f(x) = (x + 13/2 ) 2 - 289/4 , or f(x) = (x - (- 13/2 ) ) 2 - 289/4 . Therefore, f(x) reaches its minimum when the value of x is
- 13/2 . Note that -13/2 and -6.5 are examples of ways to enter a correct answer.
Alternate approach: The graph of y= f(x) in the xy-plane is a parabola. The value of x for the vertex of a parabola is the x-value of the midpoint
between the two x-intercepts of the parabola. Since it's given that , it follows that the two x-intercepts of the graph of y
in the xy-plane occur when x = 2 and x = -15, or at the points f(x) =(((-2x,10-5),20))(x(+/((21-1551,5))/20,)(o+o)/2) and . The midpoint between two points,  and
=(x2f,(yx2)) f((xx1), y1)
, is ( (x1 +x2)/2 , (y1+y2)/2 ) . Therefore, the midpoint between (2, 0) and  is , or (- 13/2 , 0) . It follows that  reaches
its minimum when the value of x is - 13/2 . Note that -13/2 and -6.5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-d45572cc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(?123?5678??77662288335511)/(-/--/--/--/--/--/--/-(?- - - ?-)/-?888 666 444 222÷÷÷÷÷÷÷÷8765432?44776622883355II 222 444 666 888)|| || || || || || || || | || || || || || || || || | x
The graph of y = f(x) is shown in the xy-plane. The value of f(0) is an integer. What is the value of f(0)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d45572cc.png$qb$, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. The value of f(0) is the value of y on the graph of y = f(x) in the xy-plane that corresponds with x = 0. It's given that
the value of f(0) is an integer. For the graph of y= f(x) shown, when x = 0, the corresponding integer value of y is 3. Therefore, the value of
f(0) is 3.$qb$);
select seed_pool_question($qb$CB-6011a3f8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$64x^(2) + bx + 25 = 0
In the given equation, b is a constant. For which of the following values of b will the equation have more than one real solution?$qb$, null, $qb$[{"label": "A", "body": "-91"}, {"label": "B", "body": "-80"}, {"label": "C", "body": "5"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A quadratic equation of the form ax2 + bx + c = 0, where ab, , and c are constants, has either no real solutions, exactly
one real solution, or exactly two real solutions. That is, for the given equation to have more than one real solution, it must have exactly two real
solutions. When the value of the discriminant, or b2 - 4ac, is greater than 0, the given equation has exactly two real solutions. In the given
equation, 64x^(2) + bx + 25 = 0a = 64, and c = 25. Therefore, the given equation has exactly two real solutions when (b)^(2) - 4 (64) (25) > 0,
or b^(2) - 6,400 > 0. Adding 6,400 to both sides of this inequality yields b^(2) > 6,400. Taking the square root of both sides of b^(2) > 6,400 yields
two possible inequalities: b < -80 or b > 80. Of the choices, only choice A satisfies b < -80 or b > 80.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0e61101e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = 9(4)^(x)
The function f is defined by the given equation. If g(x) = f(x + 2) , which of the following equations defines the function g?$qb$, null, $qb$[{"label": "A", "body": "g(x) = 18(4)^(x)"}, {"label": "B", "body": "g(x) = 144(4)^(x)"}, {"label": "C", "body": "g(x) = 18(8)^(x)"}, {"label": "D", "body": "g(x) = 81(16)^(x)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that f(x) = 9(4)^(x) and g(x) = f(x + 2) . Substituting x + 2 for x in f(x) = 9(4)^(x) gives .
f(x + 2) = 9f(4(^(x))^(x)+(126)) = 9(4)^(x)+^(2)
Rewriting this equation using properties of exponents gives , which is equivalent to . Multiplying
fg((^(x)x)+=2)f=(x9+(42))^(x)(g4()x^(2)) = 144(4)^(x)
9 and 16 in this equation gives f(x + 2) = 144(4)^(x). Since , .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e117d3b8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If a and c are positive numbers, which of the following is equivalent to ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e117d3b8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Using the property that for positive numbers x and y, with x = (a + c)3 and y = a + c, it follows that
. By rewriting (a + c)4 as ((a + c)2)2, it is possible to simplify the square root expression as follows:
.
Choice A is incorrect and may be the result of . Choice B is incorrect and may be the result of incorrectly rewriting (a +
c)2 as a2 + c2. Choice D is incorrect and may be the result of incorrectly applying properties of exponents.$qb$);
select seed_pool_question($qb$CB-f44b4125$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The functions f and g are defined by the given equations, where x ≥ 0. Which of the following equations displays, as a constant or coefficient,
the maximum value of the function it defines, where x ≥ 0?
I.
gf((xx)) == 91(80(·17·32)5x)^(x) + 41
II.$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For the function f, since the base of the exponent, 1·25, is greater than 1, the value of (1·25)^(x) increases as x increases.
Therefore, the value of 18(1·25)^(x) and the value of 18(1·25)^(x) + 41 also increase as x increases. Since f is therefore an increasing function
where x ≥ 0, the function f has no maximum value. For the function g, since the base of the exponent, 0·73, is less than 1, the value of (0·73)^(x)
decreases as x increases. Therefore, the value of 9(0·73)^(x) also decreases as x increases. It follows that the maximum value of g(x) for x ≥ 0
occurs when x = 0. Substituting 0 for x in the function g yields g(0) = 9(0·73)^(o), which is equivalent to g(0) = 9(1), or g(0) = 9. Therefore,
the maximum value of g(x) for x ≥ 0 is 9, which appears as a coefficient in equation II. So, of the two equations given, only II displays, as a
constant or coefficient, the maximum value of the function it defines, where x ≥ 0.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7a6d06bf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A rectangle has an area of 155 square inches. The length of the rectangle is 4 inches less than 7 times the width of the rectangle. What is the
width of the rectangle, in inches?$qb$, null, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. Let x represent the width, in inches, of the rectangle. It's given that the length of the rectangle is 4 inches less than 7
times its width, or 7x - 4 inches. The area of a rectangle is equal to its width multiplied by its length. Multiplying the width, x inches, by the
length, 7x - 4 inches, yields x(7x - 4) square inches. It’s given that the rectangle has an area of 155 square inches, so it follows that
x(7x - 4) = 155, or 7x^(2) - 4x = 155. Subtracting 155 from both sides of this equation yields 7x^(2) - 4x - 155 = 0. Factoring the left-hand
side of this equation yields (7x + 31)(x - 5) = 0. Applying the zero product property to this equation yields two solutions: x = - 31/7 and
x = 5. Since x is the rectangle’s width, in inches, which must be positive, the value of x is 5. Therefore, the width of the rectangle, in inches, is 5.$qb$);
select seed_pool_question($qb$CB-04bbce67$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = (x + 7)^(2) + 4
The function f is defined by the given equation. For what value of x does f(x) reach its minimum?$qb$, null, null, null, array[$qb$-7$qb$]::text[], $qb$The correct answer is -7. For a quadratic function defined by an equation of the form f(x) = a(x - h)^(2) + k, where ah, , and k are constants
and a > 0, the function reaches its minimum when x = h. In the given function, a = 1 , h = -7, and k = 4. Therefore, the value of x for which
f(x) reaches its minimum is -7.$qb$);
select seed_pool_question($qb$CB-4880eecb$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The product of a positive number x and the number that is 8 more than x is 180. What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "10"}, {"label": "C", "body": "18"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The number that's 8 more than x can be represented by the expression x + 8. It's given that the product of x and x + 8 is
180, so it follows that (x)(x + 8) = 180, or x^(2) + 8x = 180. Subtracting 180 from each side of this equation yields x^(2) + 8x - 180 = 0.
Factoring the left-hand side of this equation yields (x - 10)(x + 18) = 0. Applying the zero product property to this equation yields two
solutions: x = 10 and x = -18. Since x is a positive number, the value of x is 10.
Choice A is incorrect. If x = 5, the product of x and the number that's 8 more than x would be (5)(13) , or 65, not 180.
Choice C is incorrect. This is the value of the number that's 8 more than x, not the value of x.
Choice D is incorrect. If x = 36, the product of x and the number that's 8 more than x would be (36)(44) , or 1,584, not 180.$qb$);
select seed_pool_question($qb$CB-e8779461$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = x^(2) + 14x + 48
x + 8 = 11
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, null, null, array[$qb$99$qb$]::text[], $qb$The correct answer is 99. In the given system of equations, the second equation is x + 8 = 11. Subtracting 8 from both sides of this equation
yields x = 3. In the given system of equations, the first equation is y = x^(2) + 14x + 48. Substituting 3 for x in this equation yields y = (3)^(2)
+ 14 (3) + 48, or y = 99. Therefore, the solution to the given system of equations is (x, y) = (3, 99). Thus, the value of y is 99.$qb$);
select seed_pool_question($qb$CB-50338a48$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 15w^(2) + 8w?$qb$, null, $qb$[{"label": "A", "body": "w(15w + 8)"}, {"label": "B", "body": "8w(15w + 1)"}, {"label": "C", "body": "15w^(2)(8w + 1)"}, {"label": "D", "body": "23(w^(2) + w)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since each term of the given expression has a common factor of w, it may be rewritten as w(15w + 8) . Therefore, the
expression w(15w + 8) is equivalent to 15w^(2) + 8w.
Choice B is incorrect. This expression is equivalent to 120w^(2) + 8w, not 15w^(2) + 8w.
Choice C is incorrect. This expression is equivalent to 120w3 + 15w^(2) , not 15w^(2) + 8w.
Choice D is incorrect. This expression is equivalent to 23w^(2) + 23w, not 15w^(2) + 8w.$qb$);
select seed_pool_question($qb$CB-98f735f2$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The total revenue from sales of a product can be calculated using the formula , where T is the total revenue, P is the price of the
product, and Q is the quantity of the product sold. Which of the following equations gives the quantity of product sold in terms of P and T ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-98f735f2.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Solving the given equation for Q gives the quantity of the product sold in terms of P and T. Dividing both sides of the given
equation by P yields , or . Therefore,  gives the quantity of product sold in terms of P and T.
Choice A is incorrect and may result from an error when dividing both sides of the given equation by P. Choice C is incorrect and may result from
multiplying, rather than dividing, both sides of the given equation by P. Choice D is incorrect and may result from subtracting P from both sides of
the equation rather than dividing both sides by P.$qb$);
select seed_pool_question($qb$CB-79ba511a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = x3 + 15. What is the value of f(2) ?$qb$, null, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "21"}, {"label": "C", "body": "23"}, {"label": "D", "body": "24"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The value of f(2) is the value of f(x) when x = 2. Substituting 2 for x in the given function yields f(2) = (2)^(3) + 15, or
f(2) = 8 + 15, which is equivalent to f(2) = 23. Therefore, the value of f(2) is 23.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of f(2) when f(x) = x(3) + 15, rather than f(x) = x3 + 15.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-30596346$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$1/7 (x - k) (16 - x2) = 0
In the given equation, k is a positive constant. The sum of the solutions to the equation is 59. What is the value of k?$qb$, null, null, null, array[$qb$59$qb$]::text[], $qb$The correct answer is 59. It's given that in the equation 1/7 (x - k) (16 - x2) = 0, k is a positive constant. Multiplying both sides of this
equation by 7 yields (x - k) (16 - x^(2)) = 0. By the zero product property, it follows that x - k = 0 or 16 - x^(2) = 0. Adding k to both sides of
the equation x - k = 0 yields x = k. Adding x2 to both sides of the equation 16 - x^(2) = 0 yields 16 = x2. Taking the square root of both
sides of this equation yields 4 = x and -4 = x. Therefore, the solutions to the given equation are k4, , and -4. It's given that the sum of the
solutions to the equation is 59. Thus, k + 4 + (-4) = 59, or k = 59.$qb$);
select seed_pool_question($qb$CB-dcf63c94$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = 272(2)^(x)
The function f is defined by the given equation. If h(x) = f(x - 4) , which of the following equations defines function h?$qb$, null, $qb$[{"label": "A", "body": "h(x) = 17(2)^(x)"}, {"label": "B", "body": "h(x) = 68(2)^(x)"}, {"label": "C", "body": "h(x) = 272(16)^(x)"}, {"label": "D", "body": "h(x) = 272(8)^(x)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that f(x) = 272(2)^(x) and h(x) = f(x- 4) . Substituting  for x in f(x) = 272(2)^(x) yields f(x - 4)
= 272(2)^(x)-^(4). Substituting h(x) for  in this equation yields h(xh) (=x)2=72((2272)(^(x)2-)^(?)x4)/16 - 4. Using the properties of exponents, the function h(x)
= 272(2)^(x)-^(4) can be rewritten as h(xfh)(x(=x-)(2472)(2)^(?))/(=^(24)17() 2)x, which is equivalent to , or h(x) = 17(2)^(x) . Therefore, of the given choices,
an equation that defines function h is .
Choice B is incorrect. This equation defines function h if h(x) = f(x - 2), not h(x) = f(x - 4).
Choice C is incorrect. This equation defines function h if h(x) = f(4x) , not h(x) = f(x- 4) .
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-26f5269a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?-(444477????50?40?50?60?20?8077666622228833335555IIII?00????0000000000555555????555555 ?)/(222 ? 222 444 666 888 101100)|| ?| || || || || || |x
The y-intercept of the graph shown is (x, y) . What is the value of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-26f5269a.png$qb$, null, null, array[$qb$40$qb$]::text[], $qb$The correct answer is 40. The y-intercept of a graph in the xy-plane is the point (x, y) on the graph where x = 0. The y-intercept of the graph
shown is (0, 40) . Therefore, the value of y is 40.$qb$);
select seed_pool_question($qb$CB-50418728$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?-111/(-/--/--/--/--/--/--/--/--/--/--/-(1II ?- 1II)/-?---?÷÷÷÷÷?÷÷12?101111II987654?210044776699222288??551111 ?)|| | || | x
The graph of the polynomial function f, where y= f(x) , is shown. The y-intercept of the graph is (0, y) . What is the value of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-50418728.png$qb$, null, null, array[$qb$-3$qb$]::text[], $qb$The correct answer is -3. The y-intercept of the graph of a function in the xy-plane is the point where the graph crosses the y-axis. The graph of
the polynomial function shown crosses the y-axis at the point (0, -3). It's given that the y-intercept of the graph is (0, y). Thus, the value of y is
-3.$qb$);
select seed_pool_question($qb$CB-9cb9beec$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = -1·5
y = x2 + 8x + a
In the given system of equations, a is a positive constant. The system has exactly one distinct real solution. What is the value of a?$qb$, null, null, null, array[$qb$14.5$qb$, $qb$29/2$qb$]::text[], $qb$The correct answer is 29/2 . According to the first equation in the given system, the value of y is -1·5. Substituting -1·5 for y in the second
equation in the given system yields - 1 ·5 = x2 + 8x + a. Adding 1·5 to both sides of this equation yields 0 = x^(2) + 8x + a + 1·5. If the given
system has exactly one distinct real solution, it follows that 0 = x^(2) + 8x + a + 1·5 has exactly one distinct real solution. A quadratic equation
in the form 0 = px2 + qx + r, where pq, , and r are constants, has exactly one distinct real solution if and only if the discriminant, q2 - 4pr, is
equal to 0. The equation is in this form, where p = 1q = 8, , and r = a + 1 · 5. Therefore, the discriminant of the
0 =^(x2) + 8^(x)(8+)^(2a)-+41(1·5) (a + 1·5)
equation 0 = x^(2) + 8x + a + 1·5 is , or 58 - 4a. Setting the discriminant equal to 0 to solve for a yields 58 - 4a = 0.
Adding 4a to both sides of this equation yields 58 = 4a. Dividing both sides of this equation by 4 yields 58/4 = a, or 29/2 = a. Therefore, if the
given system of equations has exactly one distinct real solution, the value of a is 29/2 . Note that 29/2 and 14.5 are examples of ways to enter a
correct answer.$qb$);
select seed_pool_question($qb$CB-f5e8ccf1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined above. Which of the following is NOT an x-intercept of the graph of the function in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f5e8ccf1.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The graph of the function f in the xy-plane has x-intercepts at the points , where . Substituting 0 for
in the given equation yields . By the zero product property, if , then
, , or . Solving each of these linear equations for x, it follows that , , and ,
respectively. This means that the graph of the function f in the xy-plane has three x-intercepts: , , and . Therefore,
isn’t an x-intercept of the graph of the function f.
Alternate approach: Substitution may be used. Since by definition an x-intercept of any graph is a point in the form  where k is a constant,
and since all points in the options are in this form, it need only be checked whether the points in the options lie on the graph of the function f.
Substituting  for x and 0 for  in the given equation yields , or . Therefore,
the point  doesn’t lie on the graph of the function f and can’t be an x-intercept of the graph.
Choices A, C, and D are incorrect because each of these points is an x-intercept of the graph of the function f in the xy-plane. By definition, an x-
intercept is a point on the graph of the form , where k is a constant. Substituting  for x and 0 for  in the given equation yields
, or . Since this is a true statement, the point  lies on the graph of the function f and is an
x-intercept of the graph. Performing similar substitution using the points  and  also yields the true statement , illustrating
that these points also lie on the graph of the function f and are x-intercepts of the graph.$qb$);
select seed_pool_question($qb$CB-fe62f031$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f (x) = 3x^(5). In the xy-plane, the graph of y = g (x) is the result of shifting the graph of y= f(x) up 4 units.
Which equation defines the function g?$qb$, null, $qb$[{"label": "A", "body": "g (x) = 3x5 + 4"}, {"label": "B", "body": "g (x) = 3x5 - 4"}, {"label": "C", "body": "g (x) = 3x20"}, {"label": "D", "body": "g (x) = 12x5"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that in the xy-plane, the graph of is the result of shifting the graph of up 4 units. It follows that
gy(x=) =f(^(x)f)(x) + 4
g(x) = f(x) + 4. It's also given that function f is defined by g(x) =yf3(=x^(x)5)g+=(^(x)4)3^(x)5 . Substituting 3x5 for f(x) into yields g(x) = 3x5
+ 4. Therefore, the equation that defines function g is .
Choice B is incorrect. This equation defines a function g for which the graph of y = g(x) is the result of shifting the graph of y = f(x) down,
not up, 4 units.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-127b2759$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 8 + d^(2) + 3?$qb$, null, $qb$[{"label": "A", "body": "d^(2) + 24"}, {"label": "B", "body": "d^(2) + 11"}, {"label": "C", "body": "d^(2) + 5"}, {"label": "D", "body": "d^(2) - 11"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given expression can be rewritten as d^(2) + 8 + 3. Adding 8 and 3 in this expression yields d^(2) + 11.
Choice A is incorrect. This expression is equivalent to d^(2) + 8(3) .
Choice C is incorrect. This expression is equivalent to 8 + d^(2) - 3.
Choice D is incorrect. This expression is equivalent to -8 + d^(2) - 3.$qb$);
select seed_pool_question($qb$CB-02c67921$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?-(?10?12111111123??678900??7766992222883355II11 |)/((1II ?- 1II)/-÷111)|| | || | x
The graph of the exponential function f is shown, where y= f(x) . The y-intercept of the graph is (0, y). What is the value of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-02c67921.png$qb$, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. It's given that the y-intercept of the graph shown is (0, y) . The graph passes through the point (0, 3) . Therefore, the
value of y is 3.$qb$);
select seed_pool_question($qb$CB-efc469c4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-14(5x - 2)^(2) + 6(5x - 3)^(2)
The given expression can be rewritten as a/6 x2 + b/6 x + c/6 , where ab, , and c are constants. What is the value of a + b + c?$qb$, null, $qb$[{"label": "A", "body": "-612"}, {"label": "B", "body": "-306"}, {"label": "C", "body": "-102"}, {"label": "D", "body": "-17"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Expanding each squared binomial in the given expression yields . Applying
the distributive property to both terms of this expression yields . Combining like terms in this
(-350x2 +a28=0x--1,-250610)(4a+()/6bx2=52(x1+65200(-xb)/(^(6)0)x22-0+x(1+c8)/6 04x) ++564()25x2 - 30x + 9)
expression yields -200x^(2) + 100x - 2. Since the given expression can be rewritten as , it follows that a/6 = -200, b/6 = 100,
and . Multiplying both sides of each of these equations by 6 yields , , and c = -12, respectively. Substituting
-1, c/260 0= -2
for a600,  for b, and -12 for c in the expression a + b + c yields -1,200 + 600 - 12, or -612.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of a/6 + b/6 + c/6 , not a + b + c.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2b1a27cd$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The quadratic function g models the depth, in meters, below the surface of the water of a seal t minutes after the seal entered the water during a
dive. The function estimates that the seal reached its maximum depth of 302·4 meters 6 minutes after it entered the water and then reached the
surface of the water 12 minutes after it entered the water. Based on the function, what was the estimated depth, to the nearest meter, of the seal
10 minutes after it entered the water?$qb$, null, null, null, array[$qb$168$qb$]::text[], $qb$The correct answer is 168. The quadratic function g gives the estimated depth of the seal, g(t) , in meters, t minutes after the seal enters the
water. It's given that function g estimates that the seal reached its maximum depth of 302·4 meters 6 minutes after it entered the water.
Therefore, function g can be expressed in vertex form as g(t) = a(t - 6)^(2) + 302·4, where a is a constant. Since it's also given that the seal
reached the surface of the water after 12 minutes, g(12) = 0. Substituting 12 for t and 0 for g(t) in g(t) = a(t - 6)^(2) + 302·4 yields 0
, or 36a = -302·4. Dividing both sides of this equation by 36 gives a = -8·4. Substituting -8·4 for a in g(t)
== aa((t12--6)62)+^(2) +30320·24·4
gives . Substituting 10 for t in g(t) gives g(10) = -8·4(10 - 6)^(2) + 302·4, which is
g(10) = -8·4(g4()t2) +=3-082··44(t - 6)^(2) + 302·4
equivalent to , or g(10) = 168. Therefore, the estimated depth, to the nearest meter, of the seal 10 minutes after it
entered the water was 168 meters.$qb$);
select seed_pool_question($qb$CB-1073d70c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$At the time that an article was first featured on the home page of a news website, there were 40 comments on the article. An exponential model
estimates that at the end of each hour after the article was first featured on the home page, the number of comments on the article had
increased by 190% of the number of comments on the article at the end of the previous hour. Which of the following equations best represents
this model, where C is the estimated number of comments on the article t hours after the article was first featured on the home page and t
≤ 4?$qb$, null, $qb$[{"label": "A", "body": "C = 40(1·19)^(t)"}, {"label": "B", "body": "C = 40(1·9)^(t)"}, {"label": "C", "body": "C = 40(19)^(t)"}, {"label": "D", "body": "C = 40(2·9)^(t)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that an exponential model estimates that the number of comments on an article increased by a fixed percentage at
the end of each hour. Therefore, the model can be represented by an exponential equation of the form C = Kat, where C is the estimated
number of comments on the article t hours after the article was first featured on the home page and K and a are constants. It's also given that
when the article was first featured on the home page of the news website, there were 40 comments on the article. This means that when t = 0,
C = 40. Substituting 0 for t and 40 for C in the equation C = Kat yields 40 = Ka^(o), or 40 = K. It's also given that the number of comments
on the article at the end of an hour had increased by 190% of the number of comments on the article at the end of the previous hour. Multiplying
the percent increase by the number of comments on the article at the end of the previous hour yields the number of estimated additional
comments the article has on its home page: (40) (190/1o0) , or 76 comments. Thus, the estimated number of comments for the following hour is the
sum of the comments from the end of the previous hour and the number of additional comments, which is 40 + 76, or 116. This means that
when t = 1C = 116, . Substituting 1 for t, 116 for C, and 40 for K in the equation C = Kat yields 116 = 40a^(1) , or 116 = 40a. Dividing both
sides of this equation by 40 yields 2 ·9 = a. Substituting 40 for K and 2·9 for a in the equation C = Kat yields C = 40(2·9)^(t). Thus, the
equation that best represents this model is C = 40(2·9)^(t) .
Choice A is incorrect. This model represents a situation where the number of comments at the end of each hour increased by 19% of the
number of comments at the end of the previous hour, rather than 190%.
Choice B is incorrect. This model represents a situation where the number of comments at the end of each hour increased by 90% of the
number of comments at the end of the previous hour, rather than 190%.
Choice C is incorrect. This model represents a situation where the number of comments at the end of each hour was 19 times the number of
comments at the end of the previous hour, rather than increasing by 190% of the number of comments at the end of the previous hour.$qb$);
select seed_pool_question($qb$CB-dc67c130$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 64t2s3 - 56t3s?$qb$, null, $qb$[{"label": "A", "body": "4ts(16s^(2) - 14ts)"}, {"label": "B", "body": "4ts(16t^(2)s^(2) - 14t)"}, {"label": "C", "body": "4t^(2)s(16ts - 14s)"}, {"label": "D", "body": "4t^(2)s(16s^(2) - 14t)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. For the expression 64t2s3 - 56t3s4, is a common factor of 64 and 56t^(2),  is a common factor of t2 and t3, and s is a
common factor of s3 and s. It follows that 4t2s is a common factor of each term in the given expression. Factoring out 4t2s from each term in
the expression 64t2s3 - 56t3s yields 4t^(2)s(16s^(2) - 14t) . Therefore, 4t^(2)s(16s^(2) - 14t) is equivalent to 64t2s3 - 56t3s.
Choice A is incorrect. This expression is equivalent to 64ts3 - 56t2s2, not 64t2s3 - 56t3s.
Choice B is incorrect. This expression is equivalent to 64t3s3 - 56t2s, not 64t2s3 - 56t3s.
Choice C is incorrect. This expression is equivalent to 64t3s2 - 56t2s2 , not 64t2s3 - 56t3s.$qb$);
select seed_pool_question($qb$CB-fb96a5b3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fb96a5b3.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Applying the distributive property to the given expression yields , or . Adding the like
terms  and 2 results in the expression .
Choice A is incorrect and may result from multiplying  by 2 without multiplying  by 2 when applying the distributive property. Choices C
and D are incorrect and may result from computational or conceptual errors.$qb$);
select seed_pool_question($qb$CB-aa95fb33$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$÷÷--1012IIII4224680044446622222288??/(222 444 666 888 101100)| || || || || || || || || || || | x
The graph of the rational function f is shown, where y= f(x) and x ≥ 0. Which of the following is the graph of y = f(x) + 5, where x ≥ 0?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-aa95fb33.png$qb$, $qb$[{"label": "A", "body": "÷÷--101211114224680044446622222288??/(222 444 666 888 10II00)| || || || || || || || || || || | x"}, {"label": "B", "body": "÷÷--101211114224680044446622222288??/(222 444 666 888 10II00)| || || || || || || || || || || | x"}, {"label": "C", "body": "÷÷--101211114224680044446622222288??/(222 444 666 888 10II00)| || || || || || || || || || || | x"}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the graph of the rational function  is shown, where y = f(x) and x ≥ 0. The graph shown passes through
the point (3, 3). It follows that when the value of x is 3, the value of (3,f8f)(x) is 3. When the value of f(x) is 3, the value of f(x) + 5 is 3 + 5, or 8.
Therefore, the graph of y = f(x) + 5 passes through the point . Of the given choices, choice D is the only graph that passes through the
point (3, 8) and is therefore the graph of y = f(x) + 5.
Choice A is incorrect. This is the graph of y = f(x) - 5, rather than y = f(x) + 5.
Choice B is incorrect. This is the graph of y = (f(x))/5 , rather than y = f(x) + 5.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-09e5e4d3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 42/x = 7x, what is the value of 7x2?$qb$, null, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "7"}, {"label": "C", "body": "42"}, {"label": "D", "body": "294"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Multiplying both sides of the given equation by x yields 42 = 7x^(2). Therefore, the value of 7x2 is 42.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1fe10d97$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$p(t) = 90,000(1·06)^(t)
The given function p models the population of Lowell t years after a census. Which of the following functions best models the population of
Lowell m months after the census?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1fe10d97.png$qb$, $qb$[{"label": "A", "body": "r(m) = (90,00o)/12 ( 1 ·06) m"}, {"label": "B", "body": "r(m) = 90,000 ( (1·o6)/12 ) m"}, {"label": "C", "body": "r(m) = 90,000 ( (1·o6)/12 ) m/12"}, {"label": "D", "body": "r(m) = 90,000(1·06) m/12"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the function p models the population of Lowell t years after a census. Since there are 12 months in a year, m
months after the census is equivalent to m/12 years after the census. Substituting m/12 for t in the equation yields p(m/12)
p(t) = 90,00r0((m1·)06)^(t)
. Therefore, the function r that best models the population of Lowell m months after the census is
== 9900,,000000((11··0066)) m/12m/12
.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5f07b257$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?-(?10?12111111123?5678900??7766992222883355II11 ?)/((1II ?- 1II)/-÷111)|| | || | x
The graph of the polynomial function f, where y= f(x) , is shown. The y-intercept of the graph is (0, y) . What is the value of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5f07b257.png$qb$, null, null, array[$qb$4$qb$]::text[], $qb$The correct answer is 4. The y-intercept of the graph of a function in the xy-plane is the point where the graph intersects the y-axis. The graph of
the polynomial function shown intersects the y-axis at the point (0, 4) . It's given that the y-intercept of the graph is (0, y) . Therefore, the value of
y is 4.$qb$);
select seed_pool_question($qb$CB-6acdcece$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$b - 72 = x/y
The given equation relates the positive numbers bx, , and y. Which equation correctly expresses x in terms of b and y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6acdcece.png$qb$, $qb$[{"label": "A", "body": "x = (b-72)/y"}, {"label": "B", "body": "x = by - 72"}, {"label": "C", "body": "x = (by-72)/y"}, {"label": "D", "body": "x = by - 72y"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Multiplying both sides of the given equation by y yields y(b - 72) = x. Distributing on the left-hand side of this equation
yields by - 72y = x, or x = by - 72y. Therefore, the equation x = by - 72y correctly expresses x in terms of b and y.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7355b9d9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If k - x is a factor of the expression -x2 + 1/29 nk2 , where n and k are constants and k > 0, what is the value of n?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7355b9d9.png$qb$, $qb$[{"label": "A", "body": "-29"}, {"label": "B", "body": "- 1/29"}, {"label": "C", "body": "1/29"}, {"label": "D", "body": "29"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. If k - x is a factor of the expression , then the expression can be written as (k - x)(ax + b) , where a
a-kxx2++b(k1/(2-9) )anxk22- bx
and b are constants. This expression can be rewritten as , or -ax^(2) + (ak - b)x + bk. Since this expression is
equivalent to , it follows that -a = -1ak - b = 0, , and . Dividing each side of the equation -a = - 1 by -1
-x2 + ( 1/29 )1nk2 bk = (1/29)nbk2
yields a = 1. Substituting  for a in the equation ak - b = 0 yields k - b = 0. Adding  to each side of this equation yields k = b. Substituting
k for b in the equation bk = ( 1/29 ) nk2 yields . Since k is positive, dividing each side of this equation by k^(2) yields 1 = ( 1/29 ) n.
k2 =2(91/(2=9) )nnk2
Multiplying each side of this equation by 29 yields .
Alternate approach: The expression  can be written as , which is a difference of two squares. It follows that
(( 1/(√29)()n)/(1/29 n)k)2k
- x2 is equivalent to . It’s given that k - x is a factor of -x2 + ( 1/29 ) nk2 , so the factor
( (√(-1)/29n) kx-2 x-)y(2 (√(-1)/29n) k + x)((x√(--1y)/29n) ()xk+-yx) = k - x
- x is equal to k - x. Adding x to both sides of the equation  yields (√(-1)/29n) k = k. Since k is positive, dividing
both sides of this equation by k yields √(-1)/29 n = 1. Squaring both sides of this equation yields 1/29 n = 1 . Multiplying both sides of this equation
by 29 yields n = 29.
Choice A is incorrect. This value of n gives the expression -x2 + (1/29) (-29)k2, or -x2 - k2. This expression doesn't have k - x as a factor.
Choice B is incorrect. This value of n gives the expression -x2 + ( 1/29 ) (- 1/29 ) k2, or -x2 + (- 1/841 ) k2. This expression doesn't have k - x as
a factor.
Choice C is incorrect. This value of n gives the expression -x2 + ( 1/29 ) ( 1/29 ) k2, or -x2 + ( 1/841 ) k2. This expression doesn't have k - x as a
factor.$qb$);
select seed_pool_question($qb$CB-b73ee6cf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The population of a town is currently 50,000, and the population is estimated to increase each year by 3% from the previous year. Which of the
following equations can be used to estimate the number of years, t, it will take for the population of the town to reach 60,000 ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b73ee6cf.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Stating that the population will increase each year by 3% from the previous year is equivalent to saying that the population
each year will be 103% of the population the year before. Since the initial population is 50,000, the population after t years is given by
50,000(1.03)t. It follows that the equation 60,000 = 50,000(1.03)t can be used to estimate the number of years it will take for the population to
reach 60,000.
Choice A is incorrect. This equation models how long it will take the population to decrease from 60,000 to 50,000, which is impossible given the
growth factor. Choice B is incorrect and may result from misinterpreting a 3% growth as growth by a factor of 3. Additionally, this equation
attempts to model how long it will take the population to decrease from 60,000 to 50,000. Choice C is incorrect and may result
from misunderstanding how to model percent growth by multiplying the initial amount by a factor greater than 1.$qb$);
select seed_pool_question($qb$CB-08d03fe4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For the exponential function f, the value of f(1) is k, where k is a constant. Which of the following equivalent forms of the function f shows the
value of k as the coefficient or the base?$qb$, null, $qb$[{"label": "A", "body": "f (x) = 50(2)^(x)+^(1)"}, {"label": "B", "body": "f (x) = 80(2)^(x)"}, {"label": "C", "body": "f (x) = 128(2)^(x)-^(1)"}, {"label": "D", "body": "f (x) = 205(2)^(x)-^(2)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For the form of the function in choice C, f (x) = 128(1·6)^(x)-^(1), the value of f(1) can be found as 128(1·6)^(1)-^(1) , which is
equivalent to 128(1·6)0 , or 128. Therefore, k = 128, which is shown in f (x) = 128(1·6)^(x)-^(1) as the coefficient.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-df747160$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 17(x^(2) - 100y^(2)) ?$qb$, null, $qb$[{"label": "A", "body": "17(x - 2y)(x - 50y)"}, {"label": "B", "body": "17(x - 2y)(x + 50y)"}, {"label": "C", "body": "17(x - 10y)(x - 10y)"}, {"label": "D", "body": "17(x - 10y) (x + 10y)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Expressions in the form a2 - b2 follow the difference of two squares pattern and can be factored as (a - b)(a + b) . In the
given expression, 17(x^(2) - 100y^(2)) , the expression x2 - 100y2 follows the difference of two squares pattern. It follows that the expression x2
- 100y^(2) can be rewritten as (x - 10y) (x + 10y) . Therefore, the expression 17(x - 10y) (x + 10y) is equivalent to 17(x^(2) - 100y^(2)) .
Choice A is incorrect. This expression is equivalent to 17(x^(2) - 52xy + 100y^(2)) , not 17(x^(2) - 100y^(2)) .
Choice B is incorrect. This expression is equivalent to 17(x^(2) + 48xy - 100y^(2)), not 17(x^(2) - 100y^(2)) .
Choice C is incorrect. This expression is equivalent to 17(x^(2) - 20xy + 100y^(2)) , not 17(x^(2) - 100y^(2)) .$qb$);
select seed_pool_question($qb$CB-befeb95f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f (x) = x3 + 15. What is the value of f(2)?$qb$, null, null, null, array[$qb$23$qb$]::text[], $qb$The correct answer is 23. The value of f(2) is the value of f(x) when x = 2. The function f is defined by f (x) = x3 + 15. Substituting 2 for
x in this equation yields f (2) = 23 + 15. This equation can be rewritten as f (2) = 8 + 15, or f (2) = 23. Therefore, the value of f(2) is 23.$qb$);
select seed_pool_question($qb$CB-3918e8bc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An object is kicked from a platform. The equation h = -4·9t^(2) + 7t + 9 represents this situation, where h is the height of the object above the
ground, in meters, t seconds after it is kicked. Which number represents the height, in meters, from which the object was kicked?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "4·9"}, {"label": "C", "body": "7"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the equation h = -4·9t^(2) + 7t + 9 represents this situation, where h is the height, in meters, of the object t
seconds after it is kicked. It follows that the height, in meters, from which the object was kicked is the value of h when t = 0. Substituting 0 for t
in the equation h = -4·9t^(2) + 7t + 9 yields h = -4·9(0)^(2) + 7(0) + 9, or h = 9. Therefore, the object was kicked from a height of 9 meters.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d964bc26$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y - 57 = px
The given equation relates the positive numbers px, , and y. Which equation correctly expresses y in terms of p and x?$qb$, null, $qb$[{"label": "A", "body": "y = 57x + p"}, {"label": "B", "body": "y = px + 57"}, {"label": "C", "body": "y = 57px"}, {"label": "D", "body": "y = px/57"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Adding 57 to each side of the given equation yields y = px + 57. Therefore, the equation y = px + 57 correctly expresses
y in terms of p and x.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-1dd13816$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$(5x^(3) - 3) - (-4x^(3) + 8)
The given expression is equivalent to bx3 - 11, where b is a constant. What is the value of b?$qb$, null, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. The given expression can be rewritten as . By applying the distributive property, this
expression can be rewritten as , which is equivalent to(5x^(3) - 3) +(5(-x31)+(-4x4x3)^(3)b+x+3(8--) 311+ (-8)). Adding like terms in this
5x^(3) - 3 + 4x^(3) +(5(x-38-) 3) - (-4x3 + 8)
expression yields 9x3 - 11. Since it's given that is equivalent to , it follows that 9x3 - 11 is equivalent to
bx3 - 11 . Therefore, the coefficients of x3 in these two expressions must be equivalent, and the value of b must be 9.$qb$);
select seed_pool_question($qb$CB-2289b199$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$(√3 -n17p5)/(5n2 (√8p-8))
For all positive values of n and p, the given expression is equivalent to which of the following?
I. ((n 14/3 ) (p5/3 ))/5np
II. (√3 -n11p2)/5$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2289b199.png$qb$, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For positive values of a, √? -a = a 1/? . Therefore, the given expression, (?3 -n17p?)/(5n2 (?8p-8)), can be rewritten as ((n17p? ) 1/3)/(5n2 (p8) 1/8) . Applying
properties of exponents, this can be rewritten as (n 17/3p?/3)/(5n2p8/8) , or (n 17/3p?/3)/5n2p . Dividing the numerator and the denominator of this expression by n yields
, which is statement I. Dividing the numerator and the denominator of this expression by np yields (n 11/3p2/3)/5 . This expression is equivalent to
(n I4/3p?/3)/5np((n11p2 ) 1/3)/5
. It follows that this expression is equivalent to (√3 -n11p2)/5 , which is statement II. Therefore, for all positive values of n and p, the given
expression is equivalent to I and II.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e597050f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 9x + 6x + 2y + 3y?$qb$, null, $qb$[{"label": "A", "body": "3x + 5y"}, {"label": "B", "body": "6x + 8y"}, {"label": "C", "body": "12x + 8y"}, {"label": "D", "body": "15x + 5y"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Combining like terms in the given expression yields (9x + 6x) + (2y + 3y), or 15x + 5y.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7eed640d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The quadratic function above models the height above the ground h, in feet, of a projectile x seconds after it had been launched vertically. If
is graphed in the xy-plane, which of the following represents the real-life meaning of the positive x-intercept of the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7eed640d.png$qb$, $qb$[{"label": "A", "body": "The initial height of the projectile"}, {"label": "B", "body": "The maximum height of the projectile"}, {"label": "C", "body": "The time at which the projectile reaches its maximum height"}, {"label": "D", "body": "The time at which the projectile hits the ground"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The positive x-intercept of the graph of  is a point  for which . Since  models the height
above the ground, in feet, of the projectile, a y-value of 0 must correspond to the height of the projectile when it is 0 feet above ground or, in other
words, when the projectile is on the ground. Since x represents the time since the projectile was launched, it follows that the positive x-intercept,
, represents the time at which the projectile hits the ground.
Choice A is incorrect and may result from misidentifying the y-intercept as a positive x-intercept. Choice B is incorrect and may result from
misidentifying the y-value of the vertex of the graph of the function as an x-intercept. Choice C is incorrect and may result from misidentifying the
x-value of the vertex of the graph of the function as an x-intercept.$qb$);
select seed_pool_question($qb$CB-494d247d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(-/|??123456?89447766992288335511)/(?888 -?77 -666 -555 -444 -?33 -222 -1II ? 1II 222 333)|| || || || || || || || | || || || |x
The graph of a system of an absolute value function and a linear function is shown. What is the solution (x, y) to this system of two equations?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-494d247d.png$qb$, $qb$[{"label": "A", "body": "(0, 8)"}, {"label": "B", "body": "( 7/2 , 9/2 )"}, {"label": "C", "body": "(- 7/2 , 9/2 )"}, {"label": "D", "body": "(-3, 4)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The solution to a system of two equations corresponds to the point where the graphs of the equations intersect. The graphs
of the linear function and the absolute value function shown intersect at a point with an x-coordinate between -4 and -3 and a y-coordinate
between 4 and 5. Of the given choices, only (- 7/2 , 9/2 ) has an x-coordinate between -4 and -3 and a y-coordinate between 4 and 5.
Choice A is incorrect. This is the y-intercept of the graph of the linear function.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the vertex of the graph of the absolute value function.$qb$);
select seed_pool_question($qb$CB-30a07668$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 4x
y = x2 - 12
A solution to the given system of equations is (x, y), where x > 0. What is the value of x?$qb$, null, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. It’s given that y = 4x and y = x2 - 12. Since y = 4x, substituting 4x for y in the second equation of the given
system yields 4x = x2 - 12. Subtracting 4x from both sides of this equation yields 0 = x^(2) - 4x - 12. This equation can be rewritten as 0
= (x - 6) (x + 2) . By the zero product property, x - 6 = 0 or x + 2 = 0. Adding 6 to both sides of the equation x - 6 = 0 yields x = 6.
Subtracting 2 from both sides of the equation x + 2 = 0 yields x = -2. Therefore, solutions to the given system of equations occur when
x = 6 and when x = -2. It’s given that a solution to the given system of equations is (x, y) , where x > 0. Since 6 is greater than 0, it follows
that the value of x is 6.$qb$);
select seed_pool_question($qb$CB-2d2ab76b$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$When the equations above are graphed in the xy-plane, what are the coordinates (x, y) of the points of intersection of the two graphs?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2d2ab76b.png$qb$, $qb$[{"label": "A", "body": "and"}, {"label": "B", "body": "and"}, {"label": "C", "body": "and"}, {"label": "D", "body": "and"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The two equations form a system of equations, and the solutions to the system correspond to the points of intersection of
the graphs. The solutions to the system can be found by substitution. Since the second equation gives y = 3, substituting 3 for y in the first
equation gives 3 = x2 – 1. Adding 1 to both sides of the equation gives 4 = x2. Solving by taking the square root of both sides of the equation
gives x = ±2. Since y = 3 for all values of x for the second equation, the solutions are (2, 3) and (–2, 3). Therefore, the points of intersection of the
two graphs are (2, 3) and (–2, 3).
Choices B, C, and D are incorrect and may be the result of calculation errors.$qb$);
select seed_pool_question($qb$CB-de362c2f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f (x) = 5x^(2). What is the value of f(8)?$qb$, null, $qb$[{"label": "A", "body": "40"}, {"label": "B", "body": "50"}, {"label": "C", "body": "80"}, {"label": "D", "body": "320"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the function f is defined by f (x) = 5x^(2) . Substituting 8 for x in f (x) = 5x^(2) yields f(8) = 5(8)^(2), which is
equivalent to f(8) = 5 (64) , or f (8) = 320. Therefore, the value of f(8) is 320.
Choice A is incorrect. This is the value of f(8) if f (x) = 5x.
Choice B is incorrect. This is the value of f(8) if f (x) = 5 (x + 2).
Choice C is incorrect. This is the value of f(8) if f(x) = (5x) (2) .$qb$);
select seed_pool_question($qb$CB-5dd53f73$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 34x + 34y?$qb$, null, $qb$[{"label": "A", "body": "34xy"}, {"label": "B", "body": "34(x + y)"}, {"label": "C", "body": "68y"}, {"label": "D", "body": "68x"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since 34 is a common factor of each term in the given expression, the expression can be rewritten as 34(x + y).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This expression is equivalent to 34y + 34y.
Choice D is incorrect. This expression is equivalent to 34x + 34x.$qb$);
select seed_pool_question($qb$CB-da602115$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If |4x - 4? = 112, what is the positive value of x - 1 ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-da602115.png$qb$, null, null, array[$qb$28$qb$]::text[], $qb$The correct answer is 28. The given absolute value equation can be rewritten as two linear equations: 4x - 4 = 112 and -(4x - 4) = 112, or
4x - 4 = -112. Adding 4 to both sides of the equation 4x - 4 = 112 results in 4x = 116. Dividing both sides of this equation by 4 results in
x = 29. Adding 4 to both sides of the equation 4x - 4 = -112 results in 4x = -108. Dividing both sides of this equation by 4 results in
x = -27. Therefore, the two values of x - 1 are 29 - 1, or 28, and -27 - 1, or -28. Thus, the positive value of x - 1 is 28.
Alternate approach: The given equation can be rewritten as |4(x - 1) | = 112, which is equivalent to 4?x - 1 ? = 112. Dividing both sides of
this equation by 4 yields |x - 1 ? = 28. This equation can be rewritten as two linear equations: x - 1 = 28 and -(x - 1) = 28, or
x - 1 = -28. Therefore, the positive value of x - 1 is 28.$qb$);
select seed_pool_question($qb$CB-1e8d7183$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 256w^(2) - 676?$qb$, null, $qb$[{"label": "A", "body": "(16w - 26)(16w - 26)"}, {"label": "B", "body": "(8w - 13) (8w + 13)"}, {"label": "C", "body": "(8w - 13)(8w - 13)"}, {"label": "D", "body": "(16w - 26) (16w + 26)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given expression follows the difference of two squares pattern, x2 - y2, which factors as . Therefore,
(1(6^(x)w--y)26(^(x)) (+16yw) + 26)
the expression 256w^(2) - 676 can be written as (16w)^(2) - 26^(2), or (16w) (16w) - (26) (26), which factors as .
Choice A is incorrect. This expression is equivalent to 256w^(2) - 832w + 676.
Choice B is incorrect. This expression is equivalent to 64w^(2) - 169.
Choice C is incorrect. This expression is equivalent to 64w^(2) - 208w + 169.$qb$);
select seed_pool_question($qb$CB-044c1cb7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$h(x) = x^(2) - 3
Which table gives three values of x and their corresponding values of h(x) for the given function h?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-044c1cb7.png$qb$, $qb$[{"label": "A", "body": "x -/(|-h(x) |)| |(-1)/(-|)|(-2)/(-|)|(-3)/(-?)? 4 5 6"}, {"label": "B", "body": "x -/(|-h(x) |)| |(-1)/(-|)|(-2)/(-|)|(-3)/(-?)? -2 1 6"}, {"label": "C", "body": "x -/(|-h(x) |)| |(-1)/(-|)|(-2)/(-|)|(-3)/(-?)? -1 1 3"}, {"label": "D", "body": "x -/(|-h(x) |)| |(-1)/(-|)|(-2)/(-|)|(-3)/(-?)? -2 1 3"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It′s given that h(x) = x^(2) - 3. Each table gives 1 , 2, and 3 as the three given values of x. Substituting 1 for x in the
equation h(x) = x^(2) - 3 yields h(1) = (1)^(2) - 3, or h(1) = -2. Substituting 2 for x in the equation h(x) = x^(2) - 3 yields h(2) = (2)^(2) - 3,
or . Finally, substituting 3 for x in the equation h(x) = x^(2) - 3 yields h(3) = (3)^(2) - 3, or h(3) = 6. Therefore, h(x) is -2 when x is
hh((x2)) = 1
1,  is 1 when x is 2, and h(x) is 6 when x is 3. Choice B is a table with these values of x and their corresponding values of h(x) .
Choice A is incorrect. This is a table of values for the function h(x) = x + 3, not h(x) = x^(2) - 3.
Choice C is incorrect. This is a table of values for the function h(x) = 2x - 3, not h(x) = x^(2) - 3.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7e5a3640$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Bacteria are growing in a liquid growth medium. There were 300,000 cells per milliliter during an initial observation. The number of cells per
milliliter doubles every 3 hours. How many cells per milliliter will there be 15 hours after the initial observation?$qb$, null, $qb$[{"label": "A", "body": "1,500,000"}, {"label": "B", "body": "2,400,000"}, {"label": "C", "body": "4,500,000"}, {"label": "D", "body": "9,600,000"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Let y represent the number of cells per milliliter x hours after the initial observation. Since the number of cells per milliliter
doubles every 3 hours, the relationship between x and y can be represented by an exponential equation of the form y = a(b) ?/? , where a is the
number of cells per milliliter during the initial observation and the number of cells per milliliter increases by a factor of b every k hours. It’s given
that there were 300,000 cells per milliliter during the initial observation. Therefore, a = 300,000. It’s also given that the number of cells per
milliliter doubles, or increases by a factor of 2, every 3 hours. Therefore, b = 2 and k = 3. Substituting 300,000 for a2,  for b, and 3 for k in the
equation y = a(b) ?/? yields y = 300,000(2) x/3 . The number of cells per milliliter there will be 15 hours after the initial observation is the value of
y in this equation when x = 15. Substituting 15 for x in the equation y = 300,000(2) ?/3 yields y = 300,000(2) (1?)/3 , or y = 300,000(2)^(5). This is
equivalent to y = 300,000 (32), or y = 9,600,000. Therefore, 15 hours after the initial observation, there will be 9,600,000 cells per milliliter.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fc2ec559$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x + 5 = 14
y = 4x2 + 4
At what point (x, y) do the graphs of the equations in the given system intersect?$qb$, null, $qb$[{"label": "A", "body": "(9, 324)"}, {"label": "B", "body": "(9, 328)"}, {"label": "C", "body": "(14, 4)"}, {"label": "D", "body": "(14, 788)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The point (x, y) at which the graphs of the given equations intersect is the solution to the system of equations. Subtracting
5 from both sides of the equation x + 5 = 14 yields x = 9. Substituting 9 for x in the equation yields y = 4(9)^(2) + 4, or y
(9, 328)y = 4^(x2) + 4
= 328. Therefore, the graphs of the equations in the given system intersect at the point .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-faeae876$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$52(x^(3) + 64) (x^(4) - 81) = 0
How many distinct real solutions does the given equation have?$qb$, null, $qb$[{"label": "A", "body": "Exactly two"}, {"label": "B", "body": "Exactly three"}, {"label": "C", "body": "Exactly five"}, {"label": "D", "body": "Exactly seven"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given equation can be rewritten as 52(x + 4) (x^(2) - 4x + 16) (x^(2) - 9) (x^(2) + 9) = 0, which is equivalent to 52(x
. Applying the zero product property in this equation yields 52 = 0x + 4 = 0, , x2 - 4x
++ 416) (=x^(2)0- 4x + 16) (x - 3) (x + 3) (xx2^(2)++99=) =00
, x - 3 = 0, x + 3 = 0, and . The equation 52 = 0 has no solution. Subtracting 4 from both sides of the equation x + 4
= 0 yields x = -4. Adding 3 to both sides of the equation x - 3 = 0 yields x = 3. Subtracting 3 from both sides of the equation x + 3 = 0
yields x = -3. The discriminant of a quadratic equation of the form ax2 + bx + c = 0 is b2 - 4ac. If the discriminant is positive, the equation
has two distinct real solutions. If the discriminant is zero, the equation has one distinct real solution. If the discriminant is negative, the equation
has no real solutions. In the equation , a = 1b = -4, , and c = 16. Substituting these values in the equation for the
discriminant, b2 - 4ac, yields (-4)2x-^(2)4-c(=14)x9(+161)6 = 0, or -48. Since the discriminant is negative, this equation has no real solutions. In the
equation x2 + 9 = 0 a = 1, , b = 0, and . Substituting these values in the equation for the discriminant, b2 - 4ac, yields 0^(2) - 4(1) (9) , or
-36. Since the discriminant is negative, this equation has no real solutions. Therefore, the distinct real solutions to the given equation are x =
-4x = 3, , and x = -3. Thus, the given equation has exactly three distinct real solutions.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0354c7de$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the given expression?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0354c7de.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since 5 is a factor of both terms,  and 15, the given expression can be factored and rewritten as .
Choice B is incorrect and may result from subtracting 5 from the constant when factoring 5 from the given expression. Choice C is incorrect and
may result from factoring 5 from only the first term, not both terms, of the given expression. Choice D is incorrect and may result from adding 5
to the constant when factoring 5 from the given expression.$qb$);
select seed_pool_question($qb$CB-4d037075$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$- (y|)/(-/--/--/--/--/--/--/--/--/-(?10II00 -999 -888 -777 -666 -555 -444 -333 -222 -1II ?-)/-? -?÷÷÷÷÷÷÷÷10II987654321004477669922883355II)|| || || || || || || || || || | | x
The rational function  is defined by an equation in the form f(x) = a/(x+b) , where a and b are constants. The partial graph of y= f(x) is shown.
g(x) = f(x + 4) f
If , which equation could define function g?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4d037075.png$qb$, $qb$[{"label": "A", "body": "g(x) = 6/x"}, {"label": "B", "body": "g(x) = 6/(x+4)"}, {"label": "C", "body": "g(x) = 6/(x+8)"}, {"label": "D", "body": "g(x) = (6(x+4))/(x+4)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that f(x) = a/(x+b) and that the graph shown is a partial graph of y = f(x). Substituting y for f(x) in the equation
yields y = a/(x+b) . The graph passes through the point (-7, -2). Substituting -7 for x and -2 for y in the equation y = a/(x+b)
yieldsf(x) =- a/(2x(+=-b)5a/(-, -7+6b)). Multiplying each side of this equation by -7 + b yields -2(-7 + b) = a, or 14 - 2b = a. The graph also passes through
the point . Substituting -5 for x and -6 for y in the equation y = a/(x+b) yields . Multiplying each side of this equation by
-6 = a/(-5+b)30 - 6b = 14 - 2b
-5 + b yields -6(-5 + b) = a, or 30 - 6b = a. Substituting 14 - 2b for a in this equation yields . Adding 6b to each
side of this equation yields 30 = 14 + 4b. Subtracting 14 from each side of this equation yields 16 = 4b. Dividing each side of this equation by
4 yields 4 = b. Substituting 4 for b in the equation 14 - 2b = a yields 14 - 2(4) = a, or 6 = a. Substituting 6 for a and 4 for b in the equation
yields . It's given that . Substituting x + 4 for x in the equation f(x) = 6/(x+4) yields f(x + 4)
f=( (x) =6)/(x+4+4)a/(x+b) f(x) = 6/(x+4)f(x + 4) = (g6 ()/(x+8)x) = f(x + 4)
, which is equivalent to . It follows that g(x) = 6/(x+8) .
Choice A is incorrect. This could define function g if g(x) = f(x - 4) .
Choice B is incorrect. This could define function g if g(x) = f(x).
Choice D is incorrect. This could define function g if g(x) = f(x) · (x + 4) .$qb$);
select seed_pool_question($qb$CB-39652e93$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 16/x . What is the value of f(x) when x = 17?$qb$, null, $qb$[{"label": "A", "body": "16/17"}, {"label": "B", "body": "17/16"}, {"label": "C", "body": "16"}, {"label": "D", "body": "17"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that f(x) = 16/x . Substituting 17 for x in this function yields f(17) = 16/17 . Therefore, when x = 17, the value of
f(x) is 16/17 .
Choice B is incorrect. This is the value of the reciprocal of f(x) when x = 17.
Choice C is incorrect. This is the value of f(x) when x = 1.
Choice D is incorrect. This is the value of x when x = 17.$qb$);
select seed_pool_question($qb$CB-f25a34aa$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The area of a triangle is equal to x2 square centimeters. The length of the base of the triangle is 2x + 22 centimeters, and the height of the
triangle is x - 10 centimeters. What is the value of x?$qb$, null, null, null, array[$qb$110$qb$]::text[], $qb$The correct answer is 110. The area of a triangle is equal to one half of the product of the length of the base of the triangle and the height of the
triangle. It's given that the length of the base of the triangle is 2x + 22 centimeters and the height of the triangle is x - 10 centimeters;
therefore, its area is 1/2 (2x + 22) (x - 10) square centimeters. It's also given that the area of the triangle is equal to x2 square centimeters.
Therefore, it follows that 1/2 (2x + 22) (x - 10) = x2. This equation can be rewritten as (x + 11) (x - 10) = x^(2), or x2 + x - 110 = x2.
Subtracting x2 from both sides of this equation yields x - 110 = 0. Adding 110 to both sides of this equation yields x = 110. Therefore, the
value of x is 110.$qb$);
select seed_pool_question($qb$CB-4d7064a6$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = (x - 10)(x + 13)
The function f is defined by the given equation. For what value of x does f(x) reach its minimum?$qb$, null, $qb$[{"label": "A", "body": "-130"}, {"label": "B", "body": "-13"}, {"label": "C", "body": "- 23/2"}, {"label": "D", "body": "- 3/2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that , which can be rewritten as f(x) = x^(2) + 3x - 130. Since the coefficient of the
x2-term is positive, the graph of in the xy-plane opens upward and reaches its minimum value at its vertex. The x-coordinate of the
-yf(f=(b(x)/2axf))(=x) (x - 10)(x + 13)
vertex is the value of x such that reaches its minimum. For an equation in the form f(x) = ax2 + bx + c, where ab, , and c are constants,
the x-coordinate of the vertex is . For the equation f(x) = x^(2) + 3x - 130, a = 1 , b = 3, and c = -130. It follows that the x-coordinate of
the vertex is - 3/(2(1)), or - 3/2 . Therefore, f(x) reaches its minimum when the value of x is - 3/2 .
Alternate approach: The value of x for the vertex of a parabola is the x-value of the midpoint between the two x-intercepts of the parabola. Since
it’s given that , it follows that the two x-intercepts of the graph of  in the xy-plane occur when x = 10 and x
f(x) = (x(1-0,100))(x + 13) y =(xf2,(yx2))
= -13, or at the points  and . The midpoint between two points, (x1 , y1 ) and , is ( (x1 +x2)/2 , (y1+y2)/2 ) . Therefore, the
(-13, 0( ()10+(-13))/2 , (0+0)/2 )
midpoint between (10, 0) and (-13, 0) is , or (-3/2, 0) . It follows that f(x) reaches its minimum when the value of x is - 3/2.
Choice A is incorrect. This is the y-coordinate of the y-intercept of the graph of y= f(x) in the xy-plane.
Choice B is incorrect. This is one of the x-coordinates of the x-intercepts of the graph of y= f(x) in the xy-plane.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4eaf0a3a$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which expression is equivalent to √7 -x9y9, where x and y are positive?$qb$, null, $qb$[{"label": "A", "body": "(xy) 7/9"}, {"label": "B", "body": "(xy) 9/7"}, {"label": "C", "body": "(xy) 16"}, {"label": "D", "body": "(xy)63"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For positive values of a and b a^(m)b^(m) = (ab)^(m), , , and (aj) ? = a??. Therefore, the given expression, √^(7) -x9y9, can
( (xy) 9) 1/7√n -a = (a) 1/n
be rewritten as √7 -(xy)9. This expression is equivalent to , which can be rewritten as (xy) 9·1/7 , or (xy) 9/7 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c8e9a011$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$12/n - 2/t = - 2/w
The given equation relates the variables nt, , and w, where n > 0t > 0, , and w > t. Which expression is equivalent to n?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c8e9a011.png$qb$, $qb$[{"label": "A", "body": "12tw"}, {"label": "B", "body": "6(t - w)"}, {"label": "C", "body": "(w-t)/6tw"}, {"label": "D", "body": "6tw/(w-t)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Adding 2/t to each side of the given equation yields . The fractions on the right side of this equation have a
12/n12/n == (2-w)/tw2/(w-) (+2t)/tw2/t
common denominator of tw; therefore, the equation can be written as , or 12/n = (2w-2t)/tw , which is equivalent to 12/n = (2(w-t))/tw .
Dividing each side of this equation by 2 yields . Since n t w, , , and w - t are all positive quantities, taking the reciprocal of each side of
6/n = (w-t)/twn/6 = tw/(w-t)
the equation 6/n = (w-t)/tw yields an equivalent equation: . Multiplying each side of this equation by 6 yields n = 6tw/(w-t) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is equivalent to 1/n rather than n.$qb$);
select seed_pool_question($qb$CB-52e589f9$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$m(t) = -0·0274(t/7)2 + 7·3873(t/7) + 75·032
The function m gives the predicted body mass m(t), in kiI0gramS (kg) , of a certain animal t days after it was born in a wildlife reserve, where
t ≤ 390. Which of the following is the best interpretation of the statement “m(330) is approximately equal to 362” in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-52e589f9.png$qb$, $qb$[{"label": "A", "body": "The predicted body mass of the animal was approximately 330kg362 days after it was born."}, {"label": "B", "body": "The predicted body mass of the animal was approximately 362kg330 days after it was born."}, {"label": "C", "body": "The predicted body mass of the animal was approximately 362 kg 33o/7 days after it was born."}, {"label": "D", "body": "The predicted body mass of the animal was approximately 330/7 kg362 days after it was born."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In the statement "m(330) is approximately equal to 362," the input of the function, 330, is the value of t, the elapsed time, in
days, since the animal was born. The approximate value of the function, 362, is the predicted body mass, in kilograms, of the animal after that
time has elapsed. Therefore, the predicted body mass of the animal was approximately 362kg330 days after it was born.
Choice A is incorrect. This would be the best interpretation of the statement "m(362) is approximately equal to 330."
Choice C is incorrect. The number 330/7 is the number of weeks, not the number of days, after the animal was born.
Choice D is incorrect. This would be the best interpretation of the statement "m(362) is approximately equal to 330/7 ."$qb$);
select seed_pool_question($qb$CB-7e6ea718$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = 2(x - d)(x + d)(x + g)(x - d)
In the given equation, d and g are unique positive constants. When the equation is graphed in the xy-plane, how many distinct x-intercepts does
the graph have?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "3"}, {"label": "C", "body": "2"}, {"label": "D", "body": "1"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. An x-intercept of a graph in the xy-plane is a point on the graph where the value of y is 0. Substituting 0 for y in the given
equation yields 0 = 2(x - d)(x + d)(x + g)(x - d). By the zero product property, the solutions to this equation are x = d, x = -d,
x = -g, and x = d. However, x = d and x = d are identical. It's given that d and g are unique positive constants. It follows that the equation 0
= 2(x - d)(x + d)(x + g)(x - d) has 3 unique solutions: x = d x = -d, , and x = -g. Thus, the graph of the given equation has 3 distinct
x-intercepts.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-a58232b7$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The functions g and h are defined by the given equations, where x ≥ 0. Which of the following equations displays, as a constant or coefficient,
the minimum value of the function it defines, where x ≥ 0?
I.
gh((xx)) == 1188((11··146)x)+(14·4)^(x)+^(2)
II.$qb$, null, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A function defined by an equation in the form f(x) = a(b)^(x)+^(h) , where ab, , and h are positive constants and x ≥ 0, has a
minimum value of f(0). It's given that function g is defined by , which is equivalent to g(x) = 20·88(1·4)^(x)+^(2).
g(0) = 20·88(1·4)^(0)g+(^(x2) ) =g(108)(1=·1460)(·912·44)8^(x)+^(2)
Substituting 0 for x in this equation yields , or . Therefore, the minimum value of g(x) is 40·9248, so
doesn't display its minimum value as a constant or coefficient. It's also given that function h is defined by h(x)
g=(x1)8=(1·148)x(+14·16) (1·4)^(x)+^(2)
. Substituting 0 for x in this equation yields h(0) = 18(1·4)^(0)+^(4), or h(0) = 69·1488. Therefore, the minimum value of h(x) is
69·1488, so h(x) = 18(1·4)^(x)+^(4) doesn't display its minimum value as a constant or coefficient. Therefore, neither I nor II displays, as a
constant or coefficient, the minimum value of the function it defines, where x ≥ 0.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4993b828$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The area A, in square centimeters, of a rectangular cutting board can be represented by the expression w(w + 9), where w is the width, in
centimeters, of the cutting board. Which expression represents the length, in centimeters, of the cutting board?$qb$, null, $qb$[{"label": "A", "body": "w(w + 9)"}, {"label": "B", "body": "w"}, {"label": "C", "body": "9"}, {"label": "D", "body": "(w + 9)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the expression w(w + 9) represents the area, in square centimeters, of a rectangular cutting board, where w
is the width, in centimeters, of the cutting board. The area of a rectangle can be calculated by multiplying its length by its width. It follows that the
length, in centimeters, of the cutting board is represented by the expression (w + 9).
Choice A is incorrect. This expression represents the area, in square centimeters, of the cutting board, not its length, in centimeters.
Choice B is incorrect. This expression represents the width, in centimeters, of the cutting board, not its length.
Choice C is incorrect. This is the difference between the length, in centimeters, and the width, in centimeters, of the cutting board, not its length,
in centimeters.$qb$);
select seed_pool_question($qb$CB-508344ac$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 16 (x + 15) ?$qb$, null, $qb$[{"label": "A", "body": "16x + 31"}, {"label": "B", "body": "16x + 240"}, {"label": "C", "body": "16x + 1"}, {"label": "D", "body": "16x + 15"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The expression 16 (x + 15) can be rewritten as 16 (x) + 16 (15), which is equivalent to 16x + 240.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1853bb35$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the function q, the value of q(x) decreases by 45% for every increase in the value of x by 1. If q (0) = 14, which equation defines q?$qb$, null, $qb$[{"label": "A", "body": "q (x) = 0·55(14)^(x)"}, {"label": "B", "body": "q (x) = 1·45(14)^(x)"}, {"label": "C", "body": "q (x) = 14(0·55)^(x)"}, {"label": "D", "body": "q (x) = 14(1·45)^(x)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since the value of q(x) decreases by a fixed percentage, 45%, for every increase in the value of x by 1, the function q is a
decreasing exponential function. A decreasing exponential function can be written in the form , where a is the value of
q (x) = a ( 1a -= p/1104o ) x
q(0) and the value of q(x) decreases by p% for every increase in the value of x by 1. If q (0) = 14, then . Since the value of
q (x) = a(1 -q(xp)/1o0)x
decreases by 45% for every increase in the value of x by 1p = 45, . Substituting 14 for a and 45 for  in the equation
q (x) = 14(0·55)^(x)p
yields q (x) = 14(1 - 45/100)x , which is equivalent to q (x) = 14(1 - 0·45)^(x), or .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. For this function, the value of q(x) increases, rather than decreases, by 45% for every increase in the value of x by 1.$qb$);
select seed_pool_question($qb$CB-a54753ca$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, the graph of the equation y = -x^(2) + 9x - 100 intersects the line y = c at exactly one point. What is the value of c?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a54753ca.png$qb$, $qb$[{"label": "A", "body": "- 481/4"}, {"label": "B", "body": "-100"}, {"label": "C", "body": "- 319/4"}, {"label": "D", "body": "- 9/2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. In the xy-plane, the graph of the line y = c is a horizontal line that crosses the y-axis at y = c and the graph of the quadratic
equation y = -x^(2) + 9x - 100 is a parabola. A parabola can intersect a horizontal line at exactly one point only at its vertex. Therefore, the
value of c should be equal to the y-coordinate of the vertex of the graph of the given equation. For a quadratic equation in vertex form, y
, the vertex of its graph in the xy-plane is . The given quadratic equation, y = -x^(2) + 9x - 100, can be rewritten as y =
=- (ax(x2 --2h()29/2)+xk+ (9/2)2) + (9/2)2 - 100 y = -(x -( (h9^(,))/2)k2) + (-319/4)
, or . Thus, the value of c is equal to - 319/4 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c602140f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is equivalent to the expression above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c602140f.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Expanding all terms yields (x – 11y)(2x – 3y) – 12y(–2x + 3y), which is equivalent to 2x2 – 22xy – 3xy + 33y2 + 24xy – 36y2.
Combining like terms gives 2x2 – xy – 3y2.
Choice A is incorrect and may be the result of using the sums of the coefficients of the existing x and y terms as the coefficients of the x and y
terms in the new expressions. Choice C is incorrect and may be the result of incorrectly combining like terms. Choice D is incorrect and may be
the result of using the incorrect sign in front of the 12y term.$qb$);
select seed_pool_question($qb$CB-fcb78856$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$b = 42cf
The given equation relates the positive numbers bc, , and f. Which equation correctly expresses c in terms of b and f?$qb$, null, $qb$[{"label": "A", "body": "c = b/42f"}, {"label": "B", "body": "c = (b-42)/f"}, {"label": "C", "body": "c = 42bf"}, {"label": "D", "body": "c = 42 - b - f"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the equation b = 42cf relates the positive numbers bc, , and f. Dividing each side of the given equation by
42f yields b/42f = c, or c = b/42f . Thus, the equation c = b/42f correctly expresses c in terms of b and f.
Choice B is incorrect. This equation can be rewritten as b = cf + 42.
Choice C is incorrect. This equation can be rewritten as b = c/42f.
Choice D is incorrect. This equation can be rewritten as b = 42 - c - f.$qb$);
select seed_pool_question($qb$CB-a8ae0d22$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Two variables, x and y, are related such that for each increase of 1 in the value of x, the value of y increases by a factor of 4. When x = 0,
y = 200. Which equation represents this relationship?$qb$, null, $qb$[{"label": "A", "body": "y = 4(x) 200"}, {"label": "B", "body": "y = 4(200)^(x)"}, {"label": "C", "body": "y = 200(x)^(4)"}, {"label": "D", "body": "y = 200(4)^(x)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the value of y increases by a constant factor, 4, for each increase of 1 in the value of x, the relationship between x and
y is exponential. An exponential relationship between x and y can be represented by an equation of the form y = a(b)^(x), where a is the value of
x when y = 0 and y increases by a factor of b for each increase of 1 in the value of x. Since y = 200 when x = 0a = 200, . Since y increases
by a factor of 4 for each increase of 1 in the value of xb = 4, . Substituting 200 for a and 4 for b in the equation y = a(b)^(x) yields y = 200(4)^(x).
Thus, the equation y = 200(4)^(x) represents the relationship between x and y.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect. This equation represents a relationship where for each increase of 1 in the value of x, the value of y increases by a factor
of 200, not 4, and when x = 0y,  is equal to 4, not 200.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-782a8a53$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$(?10?121111111?345678900447766992222883355IIII)/((?-222 ?- 222)/-÷1II)|| || || | || || || | x
The graph of the quadratic function y = f(x) is shown. What is the vertex of the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-782a8a53.png$qb$, $qb$[{"label": "A", "body": "(0, -2)"}, {"label": "B", "body": "(0, -3)"}, {"label": "C", "body": "(0, 2)"}, {"label": "D", "body": "(0, 3)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The vertex of the graph of a quadratic function in the xy-plane is the point at which the graph is either at its minimum or
maximum y-value. In the graph shown, the minimum y-value occurs at the point (0, 2).
Choice A is incorrect. The graph shown doesn't pass through the point (0, -2) .
Choice B is incorrect. The graph shown doesn't pass through the point (0, -3).
Choice D is incorrect. The graph shown doesn't pass through the point (0, 3) .$qb$);
select seed_pool_question($qb$CB-cec36caf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$8x^(2) - 40 = 32
What is the positive solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "4"}, {"label": "C", "body": "9"}, {"label": "D", "body": "72"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Adding 40 to both sides of the given equation yields 8x^(2) = 72. Dividing both sides of this equation by 8 yields x2 = 9.
Taking the square root of both sides of this equation yields x = 3 or x = -3. Therefore, the positive solution to the given equation is 3.
Choice B is incorrect. This is the solution to the equation 8x = 32, not the given equation.
Choice C is incorrect. This is the solution to the equation 8x - 40 = 32, not the given equation.
Choice D is incorrect. This is the solution to the equation x - 40 = 32, not the given equation.$qb$);
select seed_pool_question($qb$CB-fd4b2aa0$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 12x3 - 5x3?$qb$, null, $qb$[{"label": "A", "body": "7x6"}, {"label": "B", "body": "17x3"}, {"label": "C", "body": "7x3"}, {"label": "D", "body": "17x6"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The given expression shows subtraction of two like terms. The two terms can be subtracted as follows: 12x3 - 5x3
= (12 - 5)x3, or 7x3.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the result of adding, not subtracting, the two like terms.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3e28a622$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function g is defined by g(x) = √-x + 300. What is the value of g(x) when x = 81?$qb$, null, $qb$[{"label": "A", "body": "9"}, {"label": "B", "body": "300"}, {"label": "C", "body": "309"}, {"label": "D", "body": "381"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that function g is defined by g(x) = √-x + 300. Substituting 81 for x in function g yields g(81) = √-81 + 300,
which is equivalent to g(81) = 9 + 300, or g(81) = 309. Therefore, the value of g(x) when x = 81 is 309.
Choice A is incorrect. This is the value of √-81, not √-81 + 300.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of 81 + 300, not √-81 + 300.$qb$);
select seed_pool_question($qb$CB-981aca65$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = (a-19)/x + 5
In the given function fa,  is a constant. The graph of function f in the xy-plane, where y= f(x) , is translated 3 units down and 4 units to the
right to produce the graph of y = g(x). Which equation defines function g?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-981aca65.png$qb$, $qb$[{"label": "A", "body": "g(x) = (a-19)/(x+4) + 2"}, {"label": "B", "body": "g(x) = (a-19)/(x-4) + 2"}, {"label": "C", "body": "g(x) = (a-22)/(x+4) + 5"}, {"label": "D", "body": "g(x) = (a-22)/(x-4) + 5"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the graph of y = g(x) is produced by translating the graph of y = f(x) 3 units down and 4 units to the right in
the xy-plane. Therefore, function g can be defined by an equation in the form g(x) = f(x - 4) - 3. Function f is defined by the equation f(x)
, where a is a constant. Substituting x - 4 for x in the equation  yields . Substituting
(=a-19)/(x-4)(a-19)/(^(x)+) 5+ 5 g(x) =f((ax-)19)/(x-4)=+(a-19)/(5^(x)-) 3+ 5 g(x) =f((xa--19)/(x-4)4+) =2 (a-19)/(x-4) + 5
for  in the equation g(x) = f(x - 4) - 3 yields , or . Therefore, the equation that
f(x -g4()x) = (a-19)/(x-4) + 2
defines function g is .
Choice A is incorrect. This equation defines a function whose graph is produced by translating the graph of y = f(x) 3 units down and 4 units
to the left, not 3 units down and 4 units to the right.
Choice C is incorrect. This equation defines a function whose graph is produced by translating the graph of y = f(x) 4 units to the left, not 3
units down and 4 units to the right.
Choice D is incorrect. This equation defines a function whose graph is produced by translating the graph of y = f(x) 4 units to the right, not 3
units down and 4 units to the right.$qb$);
select seed_pool_question($qb$CB-bf704c34$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$c- 7 = 25p + k
The given equation relates the positive numbers cp, , and k. Which equation correctly expresses c in terms of p and k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bf704c34.png$qb$, $qb$[{"label": "A", "body": "c = 25p + k + 7"}, {"label": "B", "body": "c = 25p + k - 7"}, {"label": "C", "body": "c = 7(25p + k)"}, {"label": "D", "body": "c = (25p+?)/7"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Adding 7 to each side of the given equation yields c = 25p + k + 7.
Choice B is incorrect. This equation is equivalent to c + 7 = 25p + k, not c- 7 = 25p + k.
Choice C is incorrect. This equation is equivalent to c/7 = 25p + k, not c - 7 = 25p + k.
Choice D is incorrect. This equation is equivalent to 7c = 25p + k, not c - 7 = 25p + k.$qb$);
select seed_pool_question($qb$CB-4236c5a3$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If , which of the following is a possible value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4236c5a3.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. If , then taking the square root of each side of the equation gives  or . Solving these
equations for x gives  or . Of these,  is the only solution given as a choice.
Choice A is incorrect and may result from solving the equation  and making a sign error. Choice B is incorrect and may result from
solving the equation . Choice C is incorrect and may result from finding a possible value of .$qb$);
select seed_pool_question($qb$CB-161126cf$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$f(x) = (1·84) x/4
The function f is defined by the given equation. The equation can be rewritten as f(x) = (1 + p/1o0)x, where p is a constant. Which of the
following is closest to the value of p?$qb$, null, $qb$[{"label": "A", "body": "16"}, {"label": "B", "body": "21"}, {"label": "C", "body": "46"}, {"label": "D", "body": "96"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The equation f(x) = (1·84) ?/4 can be rewritten as , which is equivalent to (1·841/4) x , or
approximately . Since it's given that f(x) = (1·(8p4))/100f(?()/4x) = (1·84) (1/4)(x) can be rewritten as f(x0) ·=164(167+ p/10o)x f(x) =, where p is a constant, it
1 +f((xp))/100= (1·16467)x
follows that  is approximately equal to 1·16467. Therefore,  is approximately equal to . It follows that the value of p is
approximately equal to 16·467. Of the given choices, 16 is closest to the value of p.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a7711fe8$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$What is the minimum value of the function f defined by ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a7711fe8.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "2"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given quadratic function f is in vertex form, , where  is the vertex of the graph of
in the xy-plane. Therefore, the vertex of the graph of  is . In addition, the y-coordinate of the vertex represents either the
minimum or maximum value of a quadratic function, depending on whether the graph of the function opens upward or downward. Since the
leading coefficient of f (the coefficient of the term ) is 1, which is positive, the graph of  opens upward. It follows that at
, the minimum value of the function f is .
Choice B is incorrect and may result from making a sign error and from using the x-coordinate of the vertex. Choice C is incorrect and may result
from using the x-coordinate of the vertex. Choice D is incorrect and may result from making a sign error.$qb$);
select seed_pool_question($qb$CB-7a4475df$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A function p estimates that there were 2,000 animals in a population in 1998. Each year from 1998 to 2010, the function estimates that the
number of animals in this population increased by 3% of the number of animals in the population the previous year. Which equation defines this
function, where p(x) is the estimated number of animals in the population x years after 1998?$qb$, null, $qb$[{"label": "A", "body": "p(x) = 2,000(3)^(x)"}, {"label": "B", "body": "p(x) = 2,000(1·97)^(x)"}, {"label": "C", "body": "p(x) = 2,000(1·03)^(x)"}, {"label": "D", "body": "p(x) = 2,000(0·97)^(x)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that a function p estimates that there were 2,000 animals in a population in 1998 and that each year from 1998 to
2010, the number of animals in this population increased by 3% of the number of animals in the population the previous year. It follows that this
situation can be represented by the function p(x) = a ( 1 + r/10o ) x , where p(x) is the estimated number of animals in the population x years
after 1998a,  is the estimated number of animals in the population in 1998, and each year the estimated number of animals increased by r%.
Substituting 2,000 for a and 3 for r in this function yields p(x) = 2,000(1 + 3/10o)x , or p(x) = 2,000(1·03)^(x).
Choice A is incorrect. This function represents a population in which each year the number of animals increased by 200%, not 3%, of the
number of animals in the population the previous year.
Choice B is incorrect. This function represents a population in which each year the number of animals increased by 97%, not 3%, of the number
of animals in the population the previous year.
Choice D is incorrect. This function represents a population in which each year the number of animals decreased, rather than increased, by 3%
of the number of animals in the population the previous year.$qb$);
select seed_pool_question($qb$CB-3b4b8831$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$38x^(2) = 38(9)
What is the negative solution to the given equation?$qb$, null, null, null, array[$qb$-3$qb$]::text[], $qb$The correct answer is -3. Dividing both sides of the given equation by 38 yields x2 = 9. Taking the square root of both sides of this equation
yields the solutions x = 3 and x = -3. Therefore, the negative solution to the given equation is -3.$qb$);
select seed_pool_question($qb$CB-f5247e52$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the equation above, a and c are positive constants. How many times does the graph of the equation above intersect the graph of the equation
in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f5247e52.png$qb$, $qb$[{"label": "A", "body": "Zero"}, {"label": "B", "body": "One"}, {"label": "C", "body": "Two"}, {"label": "D", "body": "More than two"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It is given that the constants a and c are both positive; therefore, the graph of the given quadratic equation is a parabola that
opens up with a vertex on the y-axis at a point below the x-axis. The graph of the second equation provided is a horizontal line that lies above the
x-axis. A horizontal line above the x-axis will intersect a parabola that opens up and has a vertex below the x-axis in exactly two points.
Choices A, B, and D are incorrect and are the result of not understanding the relationships of the graphs of the two equations given. Choice A is
incorrect because the two graphs intersect. Choice B is incorrect because in order for there to be only one intersection point, the horizontal line
would have to intersect the parabola at the vertex, but the vertex is below the x-axis and the line is above the x-axis. Choice D is incorrect
because a line cannot intersect a parabola in more than two points.$qb$);
select seed_pool_question($qb$CB-1a722d7d$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Let the function p be defined as , where c is a constant. If , what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1a722d7d.png$qb$, $qb$[{"label": "A", "body": "10.00"}, {"label": "B", "body": "10.25"}, {"label": "C", "body": "10.75"}, {"label": "D", "body": "11.00"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The value of p(12) depends on the value of the constant c, so the value of c must first be determined. It is given that p(c) =
10. Based on the definition of p, it follows that:
This means that  for all values of x. Therefore:
Choice A is incorrect. It is the value of p(8), not p(12). Choices B and C are incorrect. If one of these values were correct, then x = 12 and the
selected value of p(12) could be substituted into the equation to solve for c. However, the values of c that result from choices B and C each result
in p(c) < 10.$qb$);
select seed_pool_question($qb$CB-be1b8c74$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x = 8a(b + 9)
The given equation relates the positive numbers ab, , and x. Which equation correctly expresses a in terms of b and x?$qb$, null, $qb$[{"label": "A", "body": "a = x/8 - (b + 9)"}, {"label": "B", "body": "a = x/(8(b+9))"}, {"label": "C", "body": "a = (8(b+9))/x"}, {"label": "D", "body": "a = 8x(b + 9)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. To express a in terms of b and x, the given equation can be rewritten such that a is isolated on one side of the equation.
Since it’s given that b is a positive number, b + 9 is not equal to zero. Therefore, dividing both sides of the given equation by 8(b + 9) yields the
equivalent equation x/(8(b+9)) = a, or a = x/(8(b+9)) .
Choice A is incorrect. This equation is equivalent to x = 8(a + (b + 9)) .
Choice C is incorrect. This equation is equivalent to x = (8(b+9))/a .
Choice D is incorrect. This equation is equivalent to x = a/(8(b+9)) .$qb$);
select seed_pool_question($qb$CB-b5ebd31c$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$2r = 9s + t
The given equation relates the variables r s, , and t. Which equation correctly expresses s in terms of r and t?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b5ebd31c.png$qb$, $qb$[{"label": "A", "body": "s = 2/9 r - t"}, {"label": "B", "body": "s = (2r-t)/9"}, {"label": "C", "body": "s = 18r - t"}, {"label": "D", "body": "s = 9 (2r - t)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting t from each side of the given equation yields 2r - t = 9s. Dividing each side of this equation by 9 yields (2r-t)/9
= s, which can be rewritten as s = (2r-t)/9 . Therefore, the equation s = (2r-t)/9 correctly expresses s in terms of r and t.
Choice A is incorrect. This equation is equivalent to 2r = 9 (s + t) , not 2r = 9s + t.
Choice C is incorrect. This equation is equivalent to 2r = (s+t)/9 , not 2r = 9s + t.
Choice D is incorrect. This equation is equivalent to 2r = s/9 + t, not 2r = 9s + t.$qb$);
select seed_pool_question($qb$CB-3a01a5ee$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$|-5x + 13| = 73
What is the sum of the solutions to the given equation?$qb$, null, $qb$[{"label": "A", "body": "- 146/5"}, {"label": "B", "body": "-12"}, {"label": "C", "body": "0"}, {"label": "D", "body": "26/5"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. By the definition of absolute value, if |-5x + 13| = 73, then -5x + 13 = 73 or -5x + 13 = -73. Subtracting 13 from
both sides of the equation -5x + 13 = 73 yields -5x = 60. Dividing both sides of this equation by -5 yields x = -12. Subtracting 13 from
both sides of the equation -5x + 13 = -73 yields -5x = -86. Dividing both sides of this equation by -5 yields x = 86/5 . Therefore, the
solutions to the given equation are -12 and 86/5 , and it follows that the sum of the solutions to the given equation is -12 + 86/5 , or 26/5 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is a solution, not the sum of the solutions, to the given equation.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6e7ae9fc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The function g is defined by g(x) = x(x - 2) (x + 6)^(2). The value of g(7 - w) is 0, where w is a constant. What is the sum of all possible
values of w?$qb$, null, null, null, array[$qb$25$qb$]::text[], $qb$The correct answer is 25. The value of g(7 - w) is the value of g(x) when x = 7 - w, where w is a constant. Substituting 7 - w for x in the
given equation yields , which is equivalent to . It’s
g(7 - w) =g((77--ww))(5=-(7w-)(w13)(-5w-)w2 )(13 - w)^(2)
given that the value of = (7 - w)(5 - w)(1gg3(7(-7--ww)w2))= (7 - w)(7 - w - 2g)((77 -- ww)+ 6)^(2) is 0. Substituting 0 for in the equation yields 0
. Since the product of the three factors on the right-hand side of this equation is equal to 0, at least one of these
three factors must be equal to 0. Therefore, the possible values of w can be found by setting each factor equal to 0. Setting the first factor equal
to 0 yields 7 - w = 0. Adding w to both sides of this equation yields 7 = w. Therefore, 7 is one possible value of w. Setting the second factor
equal to 0 yields 5 - w = 0. Adding w to both sides of this equation yields 5 = w. Therefore, 5 is a second possible value of w. Setting the third
factor equal to 0 yields (13 - w)^(2) = 0. Taking the square root of both sides of this equation yields 13 - w = 0. Adding w to both sides of this
equation yields 13 = w. Therefore, 13 is a third possible value of w. Adding the three possible values of w yields 7 + 5 + 13, or 25. Therefore,
the sum of all possible values of w is 25.$qb$);
select seed_pool_question($qb$CB-0de8359f$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$r (t) = 63t - 2t2
The function r is defined by the given equation. The function s is defined by s (t) = r (t) + 1. Which expression represents the maximum value
of s (t) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0de8359f.png$qb$, $qb$[{"label": "A", "body": "1 + (63/2)2"}, {"label": "B", "body": "1 + 2(63/4)2"}, {"label": "C", "body": "1 - 2(63/4)2"}, {"label": "D", "body": "1 - ( 63/2 ) 2"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that s (t) = r (t) + 1. Since r (t) = 63t - 2t2, it follows that s (t) = 63t - 2t^(2) + 1 , or s (t) = -2t^(2) + 63t
+ 1. For a quadratic function s defined by an equation of the form s (t) = a(t - h)^(2) + k, where ah, , and k are constants and a is negative, the
value of reaches its maximum, k, when the value of t is h. The equation s (t) = -2t^(2) + 63t + 1 can be rewritten in the form s (t)
=-2a((tt2--sh( (t)6)23)/2+t +k (63/4) 2 - (63/4) 2) + 1 by completing the square. The equation s(t) = -2t^(2) + 63t + 1 is equivalent to , or s (t) =
. This equation can be rewritten as as=(t)-=2 -h2=( ((6t3)/4- 63/4k) 2s=-(t1)((=63)/(+^(4))2-)(2(26)3()/4t+)22-1 63/2t) + 1, or s (t) = -2(t - 63/4) 2
+ 1 + 2(63/4)2 . This equation is in the form s (t) = a(t - h)^(2) + k, where , , and . Therefore, the maximum
value of s (t) is 1 + 2(63/4)2 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ee05c84e$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined above. What is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ee05c84e.png$qb$, $qb$[{"label": "A", "body": "250"}, {"label": "B", "body": "500"}, {"label": "C", "body": "750"}, {"label": "D", "body": "2,000"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Adding the like terms x and  yields the equation . Substituting 20 for x yields
. The product  is equal to 25, and the difference  is equal to 30. Substituting these values
in the given equation gives , and multiplying 25 by 30 results in .
Choices A, B, and D are incorrect and may result from conceptual or computational errors when finding the value of .$qb$);
select seed_pool_question($qb$CB-5d93c782$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to x^(2) + 3x - 40?$qb$, null, $qb$[{"label": "A", "body": "(x - 4)(x + 10)"}, {"label": "B", "body": "(x - 5)(x + 8)"}, {"label": "C", "body": "(x - 8)(x + 5)"}, {"label": "D", "body": "(x - 10)(x + 4)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The given expression may be rewritten as x^(2) + 8x - 5x - 40. Since the first two terms of this expression have a common
factor of x and the last two terms of this expression have a common factor of -5, this expression may be rewritten as x(x) + x(8) - 5(x)
- 5(8) , or x(x + 8) - 5(x + 8) . Since each term of this expression has a common factor of (x + 8), it may be rewritten as (x - 5)(x + 8) .
Alternate approach: An expression of the form x2 + bx + c, where b and c are constants, can be factored if there are two values that add to give
b and multiply to give c. In the given expression, b = 3 and c = -40. The values of -5 and 8 add to give 3 and multiply to give -40, so the
expression can be factored as (x - 5)(x + 8).
Choice A is incorrect. This expression is equivalent to x^(2) + 6x - 40, not x^(2) + 3x - 40.
Choice C is incorrect. This expression is equivalent to x^(2) - 3x - 40, not x^(2) + 3x - 40.
Choice D is incorrect. This expression is equivalent to x^(2) - 6x - 40, not x^(2) + 3x - 40.$qb$);
select seed_pool_question($qb$CB-5c00c2c1$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$There were no jackrabbits in Australia before 1788 when 24 jackrabbits were introduced. By 1920 the population of jackrabbits had reached 10
billion. If the population had grown exponentially, this would correspond to a 16.2% increase, on average, in the population each year. Which of
the following functions best models the population  of jackrabbits t years after 1788?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5c00c2c1.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. This exponential growth model can be written in the form , where  is the population t years after
1788, A is the initial population, and r is the yearly growth rate, expressed as a decimal. Since there were 24 jackrabbits in Australia in 1788,
. Since the number of jackrabbits increased by an average of 16.2% each year, . Therefore, the equation that best models
this situation is .
Choices A, B, and D are incorrect and may result from misinterpreting the form of an exponential growth model.$qb$);
select seed_pool_question($qb$CB-974d33dc$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to the sum of  and  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-974d33dc.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Grouping like terms, the given expressions can be rewritten as . This can be rewritten as
.
Choice A is incorrect and may result from adding the two sets of unlike terms,  and  as well as  and , and then adding the respective
exponents. Choice B is incorrect and may result from adding the unlike terms  and  as if they were  and  and adding the unlike terms
and  as if they were  and . Choice C is incorrect and may result from errors when combining like terms.$qb$);
select seed_pool_question($qb$CB-405c5ced$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function C defined by C (t) = 6(1·5)^(t) gives the estimated number of clients at a certain business, where t is the number of weeks since
the business opened. Which of the following is the best interpretation of the number 6 in this context?$qb$, null, $qb$[{"label": "A", "body": "The estimated number of clients when the business opened"}, {"label": "B", "body": "The increase in the estimated number of clients each week"}, {"label": "C", "body": "The number of weeks the business has been open"}, {"label": "D", "body": "The percent increase in the estimated number of clients each week"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. For an exponential function of the form C (t) = a(b)^(t), where a and b are constants, the initial value of the function, or the
value of the function when t = 0, is a, and the value of the function changes by a factor of b each time t increases by 1. It follows that in the
given function, the initial value is 6 and the value of the function changes by a factor of 1·5 each time t increases by 1. It's given that the
function C gives the estimated number of clients at a certain business and t is the number of weeks since the business opened. Therefore, the
best interpretation of the number 6 in this context is the estimated number of clients when t = 0, or when the business opened.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-d4d513ff$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$equivalent_expressions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression is equivalent to 12x + 27?$qb$, null, $qb$[{"label": "A", "body": "12(9x + 1)"}, {"label": "B", "body": "27(12x + 1)"}, {"label": "C", "body": "3(4x + 9)"}, {"label": "D", "body": "3(9x + 24)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Each term in the given expression, 12x + 27, has a common factor of 3. Therefore, the expression can be rewritten as
3(4x) + 3(9) , or 3(4x + 9) . Thus, the expression 3(4x + 9) is equivalent to the given expression.
Choice A is incorrect. This expression is equivalent to 108x + 12, not 12x + 27.
Choice B is incorrect. This expression is equivalent to 324x + 27, not 12x + 27.
Choice D is incorrect. This expression is equivalent to 27x + 72, not 12x + 27.$qb$);
select seed_pool_question($qb$CB-48f83c34$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right rectangular prism has a height of 9 inches. The length of the prism's base is x inches, which is 7 inches more than the width of the
prism's base. Which function V gives the volume of the prism, in cubic inches, in terms of the length of the prism's base?$qb$, null, $qb$[{"label": "A", "body": "V(x) = x(x + 9)(x + 7)"}, {"label": "B", "body": "V(x) = x(x + 9)(x - 7)"}, {"label": "C", "body": "V(x) = 9x(x + 7)"}, {"label": "D", "body": "V(x) = 9x(x - 7)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The volume of a right rectangular prism can be represented by a function V that gives the volume of the prism, in cubic
inches, in terms of the length of the prism's base. The volume of a right rectangular prism is equal to the area of its base times its height. It's
given that the length of the prism's base is x inches, which is 7 inches more than the width of the prism's base. This means that the width of the
prism's base is x - 7 inches. It follows that the area of the prism's base, in square inches, is x(x - 7) and the volume, in cubic inches, of the
prism is . Thus, the function V that gives the volume of this right rectangular prism, in cubic inches, in terms of the length of the
^(x)(^(x) - 7)V(9()x) = 9x(x - 7)
prism's base, x, is .
Choice A is incorrect. This function would give the volume of the prism if the height were 9 inches more than the length of its base and the width
of the base were 7 inches more than its length.
Choice B is incorrect. This function would give the volume of the prism if the height were 9 inches more than the length of its base.
Choice C is incorrect. This function would give the volume of the prism if the width of the base were 7 inches more than its length, rather than the
length of the base being 7 inches more than its width.$qb$);
select seed_pool_question($qb$CB-58b109d4$qb$, $qb$mathematics$qb$, $qb$advanced_math$qb$, $qb$nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x^(2) + y + 7 = 7
20x + 100 - y = 0
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-58b109d4.png$qb$, null, null, array[$qb$-10$qb$]::text[], $qb$The correct answer is -10. Adding y to both sides of the second equation in the given system yields 20x + 100 = y. Substituting 20x + 100
for  in the first equation in the given system yields x^(2) + 20x + 100 + 7 = 7. Subtracting 7 from both sides of this equation yields
x^(2)y+ 20x + 100 = 0
. Factoring the left-hand side of this equation yields (x + 10)(x + 10) = 0, or (x + 10)^(2) = 0. Taking the square root of
both sides of this equation yields x + 10 = 0. Subtracting 10 from both sides of this equation yields x = -10. Therefore, the value of x is
-10.$qb$);
select seed_pool_question($qb$CB-85939da5$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Texting Talks on cell Does not talk on
behavior phone daily cell phone daily Total
Light 110 146 256
||| ||| ||| ||| |||
Medium 139 164 303
Heavy 166 74 240
Total 415 384 799
In a study of cell phone use, 799 randomly selected US teens were asked how often they talked on a cell phone and about their texting behavior.
The data are summarized in the table above. Based on the data from the study, an estimate of the percent of US teens who are heavy texters is
30% and the associated margin of error is 3%. Which of the following is a correct statement based on the given margin of error?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-85939da5.png$qb$, $qb$[{"label": "A", "body": "Approximately 3% of the teens in the study who are classified as heavy texters are not really heavy texters."}, {"label": "B", "body": "It is not possible that the percent of all US teens who are heavy texters is less than 27%."}, {"label": "C", "body": "The percent of all US teens who are heavy texters is 33%."}, {"label": "D", "body": "It is doubtful that the percent of all US teens who are heavy texters is 35%."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given margin of error of 3% indicates that the actual percent of all US teens who are heavy texters is likely within 3% of
the estimate of 30%, or between 27% and 33%. Therefore, it is unlikely, or doubtful, that the percent of all US teens who are heavy texters would
be 35%.
Choice A is incorrect. The margin of error doesn’t provide any information about the accuracy of reporting in the study. Choice B is incorrect.
Based on the estimate and given margin of error, it is unlikely that the percent of all US teens who are heavy texters would be less than 27%, but it
is possible. Choice C is incorrect. While the percent of all US teens who are heavy texters is likely between 27% and 33%, any value within this
interval is equally likely. We can’t be certain that the value is exactly 33%.$qb$);
select seed_pool_question($qb$CB-3c8fdc40$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A printer produces posters at a constant rate of 42 posters per minute. At what rate, in posters per hour, does the printer produce the posters?-$qb$, null, null, null, array[$qb$2520$qb$]::text[], $qb$The correct answer is . There are 60 minutes in one hour. At a rate of 42 posters per minute, the number of posters produced in one hour
2( (^(,)4522P098ter8)/(1 minutc) ) ( (60 minutc8)/(1 h0ur) )
can be determined by , which is 2,520 posters per hour.$qb$);
select seed_pool_question($qb$CB-eccbf957$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Each face of a fair 14-sided die is labeled with a number from 1 through 14, with a different number appearing on each face. If the die is rolled
one time, what is the probability of rolling a 2?$qb$, null, $qb$[{"label": "A", "body": "1/14"}, {"label": "B", "body": "2/14"}, {"label": "C", "body": "12/14"}, {"label": "D", "body": "13/14"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The total number of possible outcomes for rolling a fair 14-sided die is 14. The number of possible outcomes for rolling a 2
is 1. The probability of rolling a 2 is the number of possible outcomes for rolling a 2 divided by the total number of possible outcomes, or 1/14 .
Choice B is incorrect. This is the probability of rolling a number no greater than 2.
Choice C is incorrect. This is the probability of rolling a number greater than 2.
Choice D is incorrect. This is the probability of rolling a number other than 2.$qb$);
select seed_pool_question($qb$CB-affb2315$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$There are 55 students in Spanish club. A sample of the Spanish club students was selected at random and asked whether they intend to enroll in
a new study program. Of those surveyed, 20% responded that they intend to enroll in the study program. Based on this survey, which of the
following is the best estimate of the total number of Spanish club students who intend to enroll in the study program?$qb$, null, $qb$[{"label": "A", "body": "11"}, {"label": "B", "body": "20"}, {"label": "C", "body": "44"}, {"label": "D", "body": "55"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that 20% of the students surveyed responded that they intend to enroll in the study program. Therefore, the
proportion of students in Spanish club who intend to enroll in the study program, based on the survey, is 0·20. Since there are 55 total students
in Spanish club, the best estimate for the total number of these students who intend to enroll in the study program is 55(0·20) , or 11 .
Choice B is incorrect. This is the best estimate for the percentage, rather than the total number, of students in Spanish club who intend to enroll
in the study program.
Choice C is incorrect. This is the best estimate for the total number of Spanish club students who do not intend to enroll in the study program.
Choice D is incorrect. This is the total number of students in Spanish club.$qb$);
select seed_pool_question($qb$CB-954943a4$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Jennifer bought a box of Crunchy Grain cereal. The nutrition facts on the box state that a serving size of the cereal is  cup and provides 210
calories, 50 of which are calories from fat. In addition, each serving of the cereal provides 180 milligrams of potassium, which is 5% of the daily
allowance for adults. If p percent of an adult’s daily allowance of potassium is provided by x servings of Crunchy Grain cereal per day, which of
the following expresses p in terms of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-954943a4.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that each serving of Crunchy Grain cereal provides 5% of an adult’s daily allowance of potassium, so x servings
would provide x times 5%. The percentage of an adult’s daily allowance of potassium, p, is 5 times the number of servings, x. Therefore, the
percentage of an adult’s daily allowance of potassium can be expressed as .
Choices A, C, and D are incorrect and may result from incorrectly converting 5% to its decimal equivalent, which isn’t necessary since p is
expressed as a percentage. Additionally, choices C and D are incorrect because the context should be represented by a linear relationship, not by
an exponential relationship.$qb$);
select seed_pool_question($qb$CB-1baffbcf$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The expression 0·35x represents the result of decreasing a positive quantity x by what percent?$qb$, null, $qb$[{"label": "A", "body": "3·5%"}, {"label": "B", "body": "35%"}, {"label": "C", "body": "6·5%"}, {"label": "D", "body": "65%"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Let n% represent the percent by which the positive quantity x is decreased to result in 0·35x. The value of n can be found
by solving the equation . Since x is a common factor of each of the terms on the left-hand side of this equation, the
equation can be rewritten asx -1(0n/(x01(01o-) )-nx (=n)/(=100)30)5·3=5x0·35x. Dividing each side of this equation by x yields . Multiplying each side of
-1 n- n/(=1o-0) 6=5 0·35
this equation by 100 yields . Subtracting 100 from each side of this equation yields . Dividing each side of this
equation by -1 yields n = 65. Therefore, the expression 0·35x represents the result of decreasing the positive quantity x by 65%.
Choice A is incorrect. Decreasing the quantity x by 3·5% yields x - 0·035x, or 0·965x, not 0·35x.
Choice B is incorrect. Decreasing the quantity x by 35% yields x - 0·35x, or 0·65x, not 0·35x.
Choice C is incorrect. Decreasing the quantity x by 6·5% yields x - 0·065x, or 0·935x, not 0·35x.$qb$);
select seed_pool_question($qb$CB-a5b069b4$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$410, , 18445, , , , 65,
What is the median of the data set shown?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "5"}, {"label": "C", "body": "7"}, {"label": "D", "body": "14"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If a data set contains an even number of data values, when the data values are listed in ascending or descending order, the
median is between the two middle values. The given data set contains 8 values. When listed in ascending order, the data set is 4445, , , , 56, , 10,
18 and the two middle values are 5 and 5. Since the two middle values are the same, the median must be 5.
Choice A is incorrect. This value is between the two middle values in the list shown, not the two middle values when the data values are listed in
ascending or descending order.
Choice C is incorrect. This is the mean, not the median, of the data set.
Choice D is incorrect. This is the range, not the median, of the data set.$qb$);
select seed_pool_question($qb$CB-b1b5300b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Prices of 14 Different Cars
Priced at no more Priced greater
Type of car Total
than $25,000 than $25,000
|| ?? || || ??Nonhybrid 5 3 8
Hybrid 2 4 6
Total 7 7 14
The table above shows information about 14 cars listed for sale on an auto dealership’s website. If one of the cars listed for sale is selected at
random, what is the probability that the car selected will be a hybrid car priced at no more than $25,000 ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b1b5300b.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that there are 2 hybrid cars priced at no more than $25,000. It’s also given that there are 14 cars total for sale.
Therefore, the probability of selecting a hybrid priced at no more than $25,000 when one car is chosen at random is .
Choice B is incorrect. This is the probability of selecting a hybrid car priced greater than $25,000 when choosing one car at random. Choice C is
incorrect. This is the probability, when choosing randomly from only the hybrid cars, of selecting one priced at no more than $25,000. Choice D is
incorrect. This is the probability of selecting a hybrid car when selecting at random from only the cars priced greater than $25,000.$qb$);
select seed_pool_question($qb$CB-d28c29e1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The International Space Station orbits Earth at an average speed of 4.76 miles per second. What is the space station’s average speed in miles
per hour?$qb$, null, $qb$[{"label": "A", "body": "285.6"}, {"label": "B", "body": "571.2"}, {"label": "C", "body": "856.8"}, {"label": "D", "body": "17,136.0"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since 1 minute = 60 seconds and 1 hour = 60 minutes, it follows that 1 hour = (60)(60), or 3,600 seconds. Using this
conversion factor, the space station’s average speed of 4.76 miles per second is equal to an average speed of
, or 17,136 miles per hour.
Choice A is incorrect. This is the space station’s average speed in miles per minute. Choice B is incorrect. This is double the space station’s
average speed in miles per minute, or the number of miles the space station travels on average in 2 minutes. Choice C is incorrect. This is triple
the space station’s average speed in miles per minute, or the number of miles the space station travels on average in 3 minutes.$qb$);
select seed_pool_question($qb$CB-1adb39f0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit for the data is also shown. Which of the following is
closest to the difference between the y-coordinate of the data point with  and the y-value predicted by the line of best fit at  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1adb39f0.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "2"}, {"label": "C", "body": "5"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The data point with  has a y-coordinate of 12. The y-value predicted by the line of best fit at  is approximately
11. The difference between the y-coordinate of the data point and the y-value predicted by the line of best fit at  is , or 1.
Choices B and C are incorrect and may result from incorrectly reading the scatterplot. Choice D is incorrect. This is the y-coordinate of the data
point at .$qb$);
select seed_pool_question($qb$CB-555939d2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A cable provider wanted to know how many of its 30,000 customers would be interested in a new service plan. The provider selected 300
customers at random and asked each customer whether the customer would be interested in the new plan. Of those surveyed, 8 said they would
be interested. Which of the following is the best estimate of the total number of customers who would be interested in the new service plan?$qb$, null, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "80"}, {"label": "C", "body": "800"}, {"label": "D", "body": "8,000"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that 8 out of 300 customers in a random sample said they would be interested in the new plan. This means the
fraction of sampled customers who said they would be interested is 8/3o0 . Multiplying this fraction by the total customer population yields
(8/30o) (30,000) , or 800. Therefore, the best estimate of the total number of customers who would be interested in the new service plan is 800.
Choice A is incorrect. This is the number of customers surveyed who said they would be interested in the new plan, not the best estimate of the
total number of customers who would be interested in the new plan.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b4912cc5$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The population density of Iceland, in people per square kilometer of land area, increased from 2.5 in 1990 to 3.3 in 2014. During this time period,
the land area of Iceland was 100,250 square kilometers. By how many people did Iceland’s population increase from 1990 to 2014?$qb$, null, $qb$[{"label": "A", "body": "330,825"}, {"label": "B", "body": "132,330"}, {"label": "C", "body": "125,312"}, {"label": "D", "body": "80,200"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The increase in Iceland’s population can be found by multiplying the increase in population density, in people per square
kilometer, by the area, in square kilometers. It’s given that the population density of Iceland was 2.5 people per square kilometer in 1990 and 3.3
people per square kilometer in 2014. The increase in population density can be found by subtracting 2.5 from 3.3, which yields 0.8. It’s given that
the land area of Iceland was 100,250 square kilometers. Thus, the increase in population is , or 80,200.
Alternate approach: It’s given that the population density of Iceland, in people per square kilometer of land area, in 1990 was 2.5. Since the land
area of Iceland was 100,250 square kilometers, it follows that the population of Iceland in 1990 was , or 250,625. Similarly, the
population of Iceland in 2014 was , or 330,825. The population increase is the difference in the population from 1990 to 2014, or
, which yields 80,200. Therefore, Iceland’s population increased by 80,200 from 1990 to 2014.
Choice A is incorrect. This is the population of Iceland in 2014. Choice B is incorrect and may result from dividing 3.3 by 2.5, instead of
subtracting 2.5 from 3.3. Choice C is incorrect and may result from dividing the population of Iceland in 1990 by 2.$qb$);
select seed_pool_question($qb$CB-f890dc20$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the median of the seven data values shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f890dc20.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "3"}, {"label": "C", "body": "4"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. When a data set has an odd number of values, the median can be found by ordering the values from least to greatest and
determining the value in the middle. Since the values are already presented in order from least to greatest and there are 7 values, the median is
the fourth value in the list. Therefore, the median is 3.
Choice A is incorrect. This is the mode. Choice C is incorrect. This is the mean. Choice D is incorrect. This is the range.$qb$);
select seed_pool_question($qb$CB-d3b9c8d8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?rouP 1 -| ?| |
?r0uP2 -| ?| |
-| | | | | | | | | | | | |
20 22 24 26 28 30 32
?aSS (?iIogramS)
The box plots summarize the masses, in kilograms, of two groups of gazelles. Based on the box plots, which of the following statements must
be true?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d3b9c8d8.png$qb$, $qb$[{"label": "A", "body": "The mean mass of group 1 is greater than the mean mass of group 2."}, {"label": "B", "body": "The mean mass of group 1 is less than the mean mass of group 2."}, {"label": "C", "body": "The median mass of group 1 is greater than the median mass of group 2."}, {"label": "D", "body": "The median mass of group 1 is less than the median mass of group 2."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The median of a data set represented in a box plot is represented by the vertical line within the box. It follows that the
median mass of the gazelles in group 1 is 25 kilograms, and the median mass of the gazelles in group 2 is 24 kilograms. Since 25 kilograms is
greater than 24 kilograms, the median mass of group 1 is greater than the median mass of group 2.
Choice A is incorrect. The mean mass of each of the two groups cannot be determined from the box plots.
Choice B is incorrect. The mean mass of each of the two groups cannot be determined from the box plots.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-825b7490$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The ratio 140 to m is equivalent to the ratio 4 to 28. What is the value of m?$qb$, null, null, null, array[$qb$980$qb$]::text[], $qb$The correct answer is 980. It's given that the ratio 140 to m is equivalent to the ratio 4 to 28. Therefore, the value of m can be found by solving
the equation 140/m = 4/28 . Multiplying each side of this equation by m yields 140 = 4m/28 . Multiplying each side of this equation by 28 yields
3,920 = 4m. Dividing each side of this equation by 4 yields 980 = m. Therefore, the value of m is 980.$qb$);
select seed_pool_question($qb$CB-86636d8f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A customer spent $27 to purchase oranges at $3 per pound. How many pounds of oranges did the customer purchase?$qb$, null, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. It’s given that the customer spent $27 to purchase oranges at $3 per pound. Therefore, the number of pounds of
oranges the customer purchased is $27 ( 1P0und/($3) ) , or 9 pounds.$qb$);
select seed_pool_question($qb$CB-608cf8e2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?C??nee??
223110000555 |/0(???)/(I0 20 30 40 50 60 70)| | | | | | | |
Numbero? P0intS
The histogram summarizes data set A, which represents the number of points per player earned by 50 players of a game. A new player earns 18
points playing the game, and this number of points is added to data set A to create data set B with 51 values. Which of the following must be
true?
I. The median number of points per player for data set B is less than the median number of points per player for data set A.
II. The mean number of points per player for data set B is less than the mean number of points per player for data set A.$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-608cf8e2.png$qb$, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "Neither I nor II"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The mean of a data set is the sum of the values divided by the number of values. It's given that a new player earns 18 points
playing the game, and this number of points is added to data set A to create data set B with 51 values. The histogram shows that all the values in
data set A are greater than 18. Since the additional number of points, 18, is less than any of the values in the original data set, the mean number
of points per player for data set B is less than the mean number of points per player for data set A. The median of a data set with 50 values is
between the 25th and 26th values when the values are listed in ascending order. The median of a data set with 51 values is the 26th value
when the values are listed in ascending order. Therefore, the median of data set B is the 26th value in data set B, which is the 25th value in data
set A. The histogram shows that the 25th and 26th values in data set A are both between 50 and 60 points. Therefore, the 25th and 26th
values in data set A could be equal, in which case the median of data set A would be equal to both the 25th and 26th values in data set A. Then,
the median number of points per player for data set A would be equal to the median number of points per player for data set B. Therefore, only
statement II must be true.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fe4c1c9e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A mechanical device in a workshop produces items at a constant rate of 60 items per hour. At this rate, how many items will the mechanical
device produce in 3 hours?$qb$, null, null, null, array[$qb$180$qb$]::text[], $qb$The correct answer is 180. It’s given that a mechanical device produces items at a constant rate of 60 items per hour. This rate can be written as
60itcm8/(1 h9ur) . Let x represent the number of items the mechanical device will produce in 3 hours at the given rate. It follows that 60itemS/(1 hour) = (x itcmS)/(3 h0ur8) ,
which can be written as , or . Multiplying each side of this equation by 3 yields 180 = x. Therefore, at the given rate, the
60/1 = x/31 80 60 = x/33
mechanical device will produce  items in  hours.
Alternate approach: It's given that a mechanical device produces items at a constant rate of 60 items per hour. At this rate, the mechanical
device will produce ( 6oitem8/(1 h0ur) ) (3 h0urS), or 180 items in 3 hours.$qb$);
select seed_pool_question($qb$CB-1ea09200$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A sample of 40 fourth-grade students was selected at random from a certain school. The 40 students completed a survey about the morning
announcements, and 32 thought the announcements were helpful. Which of the following is the largest population to which the results of the
survey can be applied?$qb$, null, $qb$[{"label": "A", "body": "The 40 students who were surveyed"}, {"label": "B", "body": "All fourth-grade students at the school"}, {"label": "C", "body": "All students at the school"}, {"label": "D", "body": "All fourth-grade students in the county in which the school is located"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Selecting a sample of a reasonable size at random to use for a survey allows the results from that survey to be applied to the
population from which the sample was selected, but not beyond this population. In this case, the population from which the sample was selected
is all fourth-grade students at a certain school. Therefore, the results of the survey can be applied to all fourth-grade students at the school.
Choice A is incorrect. The results of the survey can be applied to the 40 students who were surveyed. However, this isn’t the largest group to
which the results of the survey can be applied. Choices C and D are incorrect. Since the sample was selected at random from among the fourth-
grade students at a certain school, the results of the survey can’t be applied to other students at the school or to other fourth-grade students who
weren’t represented in the survey results. Students in other grades in the school or other fourth-grade students in the country may feel differently
about announcements than the fourth-grade students at the school.$qb$);
select seed_pool_question($qb$CB-82aaa0a1$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Of the following, which is the best model for the data in the scatterplot?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-82aaa0a1.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The graphical model that most closely fits the data in the scatterplot is a model in which the number of data points above
and below the model are approximately balanced. Fitting a graphical model to the data shown results in an upward-facing parabola with a y-
intercept near  and a vertex with an approximate x-value of 2.5. Of the given choices, only choice B gives an equation of an upward-facing
parabola with a y-intercept at . Furthermore, substituting 2.5 for x into the equation in choice B yields . This is approximately the y-
value of the vertex of the model.
Choices A, C, and D are incorrect. These equations don’t give a graphical model that best fits the data. At , they have y-values of ,
, and 3, respectively. At , they have y-values of , , and 3, respectively.$qb$);
select seed_pool_question($qb$CB-37930b2a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$evaluating_statistical_claims_observational_studies_and_experiments$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Residents of a town were surveyed to determine whether they are satisfied with the concession stand at the local park. A random sample of
200 residents was selected. All 200 responded, and 87% said they are satisfied. Based on this information, which of the following statements
must be true?
I. Of all the town residents, 87% would say they are satisfied with the concession stand at the local park.
II. If another random sample of 200 residents were surveyed, 87% would say they are satisfied.$qb$, null, $qb$[{"label": "A", "body": "Neither"}, {"label": "B", "body": "I only"}, {"label": "C", "body": "II only"}, {"label": "D", "body": "I and II"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The purpose of surveying a random sample of residents is to approximate the percent of the town residents that are
satisfied with the concession stand. The sample doesn’t necessarily get the same result as surveying every resident of the town, nor would
another sample necessarily have identical results. Therefore, although it’s possible that either statement I or statement II could prove true by
surveying every resident of the town, these statements cannot be proven true solely based on the results of the sample.
Choice B is incorrect because surveying a sample of the town residents may not have the same result as surveying all the town residents.
Choices C and D are incorrect because surveying a different sample of residents could yield different results.$qb$);
select seed_pool_question($qb$CB-83272c51$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In an experiment, a heated cup of coffee is removed from a heat source, and the cup of coffee is then left in a room that is kept at a constant
temperature. The graph above shows the temperature, in degrees Fahrenheit (°F), of the coffee immediately after being removed from the heat
source and at 10-minute intervals thereafter. During which of the following 10-minute intervals does the temperature of the coffee decrease at
the greatest average rate?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-83272c51.png$qb$, $qb$[{"label": "A", "body": "Between 0 and 10 minutes"}, {"label": "B", "body": "Between 30 and 40 minutes"}, {"label": "C", "body": "Between 50 and 60 minutes"}, {"label": "D", "body": "Between 90 and 100 minutes"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The average rate of change in temperature of the coffee in degrees Fahrenheit per minute is calculated by dividing the
difference between two recorded temperatures by the number of minutes in the corresponding interval of time. Since the time intervals given are
all 10 minutes, the average rate of change is greatest for the points with the greatest difference in temperature. Of the choices, the greatest
difference in temperature occurs between 0 and 10 minutes.
Choices B, C, and D are incorrect and may result from misinterpreting the average rate of change from the graph.$qb$);
select seed_pool_question($qb$CB-3310c2ab$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$How many fluid ounces are equivalent to - 76 quarts? (8 f1uid 0unceS = 1 cuP and 4 cuPS = 1 quart)$qb$, null, null, null, array[$qb$2432$qb$]::text[], $qb$The correct answer is 2,432. It's given that 4 cuPS = 1 quart. It follows that 76 quarts is equivalent to , or 304 cups. It's
(304 cuPS) ( (8f1uid0u(n7cc68)/1cuP q) uar2tS,4) 3( (4 cuP8)/21quart )
also given that 8 fIuid 0unceS = 1 cuP. It follows that 304 cups is equivalent to , or  fluid ounces.$qb$);
select seed_pool_question($qb$CB-4c774b00$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Ages of 20 Students Enrolled in a College Class
Age Frequency
18 6
19 5
20 4
??????? ||||||| |||||||
21 2
22 1
23 1
30 1
The table above shows the distribution of ages of the 20 students enrolled in a college class. Which of the following gives the correct order of
the mean, median, and mode of the ages?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4c774b00.png$qb$, $qb$[{"label": "A", "body": "mode < median < mean"}, {"label": "B", "body": "mode < mean < median"}, {"label": "C", "body": "median < mode < mean"}, {"label": "D", "body": "mean < mode < median"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The mode is the data value with the highest frequency. So for the data shown, the mode is 18. The median is the middle data
value when the data values are sorted from least to greatest. Since there are 20 ages ordered, the median is the average of the two middle
values, the 10th and 11th, which for these data are both 19. Therefore, the median is 19. The mean is the sum of the data values divided by the
number of the data values. So for these data, the mean is
.
Since the mode is 18, the median is 19, and the mean is 20, .
Choices B and D are incorrect because the mean is greater than the median. Choice C is incorrect because the median is greater than the mode.
Alternate approach: After determining the mode, 18, and the median, 19, it remains to determine whether the mean is less than 19 or more than
19. Because the mean is a balancing point, there is as much deviation below the mean as above the mean. It is possible to compare the data to
19 to determine the balance of deviation above and below the mean. There is a total deviation of only 6 below 19 (the 6 values of 18); however,
the data value 30 alone deviates by 11 above 19. Thus the mean must be greater than 19.$qb$);
select seed_pool_question($qb$CB-1353b86e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Colors of
Marbles in a Bag
Color Number
Red 8
|||| |||| ????Blue 10
Green 22
Total 40
The table shows the number of different colors of marbles in a bag. If a marble is chosen at random from the bag, what is the probability that the
marble will be blue?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1353b86e.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. If a marble is chosen at random from the bag, the probability of choosing a marble of a certain color is the number of
marbles of that color divided by the total number of marbles in the bag. Since there are 10 blue marbles in the bag, and there are 40 total marbles
in the bag, the probability that the marble chosen will be blue is .
Choices A, B, and C are incorrect. These represent the probability that the marble chosen won’t be blue (choice A), will be green (choice B), and
won’t be green (choice C).$qb$);
select seed_pool_question($qb$CB-29fa7970$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The bar graph summarizes the charge, in kilowatt-hours (kWh) , a battery received each day for 15 days.
7
6
5
4
Number of days | ? ? ? ? ? ?
3
2
1
0
0 8 9 11 16 23
Charge (kWh)
For how many of these 15 days did the battery receive a charge of 0kWh?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-29fa7970.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "4"}, {"label": "D", "body": "6"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the bar graph summarizes the charge, in kilowatt-hours (kWh) , a battery received each day for 15 days. The
height of each bar in the bar graph shown represents the number of days the battery received the charge, in kWh, specified at the bottom of the
bar. The bar for a charge of 0kWh reaches a height of 6. Therefore, the battery received a charge of 0kWh for 6 of these days.
Choice A is incorrect. This is the charge, in kWh, that the battery received, not the number of days the battery received this charge.
Choice B is incorrect. This is the number of days the battery received a charge of either 8, 16, or 23kWh.
Choice C is incorrect. This is the number of days the battery received a charge of 11kWh.$qb$);
select seed_pool_question($qb$CB-d89c1513$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Customer Purchases at a Gas Station
Beverage purchased Beverage not purchased Total
Gasoline purchased 60 25 85
||| ||| ||| ||| ???
Gasoline not purchased 35 15 50
Total 90 40 135
On Tuesday, a local gas station had 135 customers. The table above summarizes whether or not the customers on Tuesday purchased gasoline,
a beverage, both, or neither. Based on the data in the table, what is the probability that a gas station customer selected at random on that day did
not purchase gasoline?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d89c1513.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The total number of gas station customers on Tuesday was 135. The table shows that the number of customers who did not
purchase gasoline was 50. Finding the ratio of the number of customers who did not purchase gasoline to the total number of customers gives
the probability that a customer selected at random on that day did not purchase gasoline, which is .
Choice A is incorrect and may result from finding the probability that a customer did not purchase a beverage, given that the customer did not
purchase gasoline. Choice B is incorrect and may result from finding the probability that a customer did not purchase gasoline, given that the
customer did not purchase a beverage. Choice C is incorrect and may result from finding the probability that a customer did purchase a
beverage, given that the customer did not purchase gasoline.$qb$);
select seed_pool_question($qb$CB-52f9a246$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$44448, , , , , 88, , 1313,
Which frequency table correctly represents the data listed?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-52f9a246.png$qb$, $qb$[{"label": "A", "body": "Number Frequency -/48/(|-^(1)3 |)||| |||-/43/(-^(2) ?)???"}, {"label": "B", "body": "Number Frequency -/43/(|-^(2) |)||| |||-/48/(-13 ?)???"}, {"label": "C", "body": "Number Frequency -/48/(|-^(1)3 |)||| |||-/162/(-26 ?)???"}, {"label": "D", "body": "Number Frequency 16/42/(|-^(26) |)||| |||8/(-13 ?)???"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A frequency table is a table that lists the data value and shows the number of times the data value occurs. In the data listed,
the number 4 occurs four times, the number 8 occurs three times, and the number 13 occurs two times. This corresponds to the table in choice
A.
Choice B is incorrect. This table has the values for number and frequency reversed.
Choice C is incorrect because the frequency values don't represent the data listed.
Choice D is incorrect. This table represents the listed number values as the frequency values.$qb$);
select seed_pool_question($qb$CB-a456cfd2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Data
Frequency
value
9/111/123/(|-14 |)|||||||| ||||||||0/(-^(6) |)||||||||
The frequency table summarizes the 57 data values in a data set. What is the maximum data value in the data set?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a456cfd2.png$qb$, null, null, array[$qb$14$qb$]::text[], $qb$The correct answer is 14. The maximum value is the largest value in the data set. The frequency refers to the number of times a data value
occurs. The given frequency table shows that for this data set, the data value 6 occurs three times, the data value 7 occurs three times, the data
value 8 occurs eight times, the data value 9 occurs eight times, the data value 10 occurs nine times, the data value 11 occurs eleven times, the
data value 12 occurs nine times, the data value 13 occurs zero times, and the data value 14 occurs six times. Therefore, the maximum data
value in the data set is 14.$qb$);
select seed_pool_question($qb$CB-e1ad3d41$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Eye color
Coat color
Deep blue Light brown Total
??? |||| -/(||)??? -/(||)|Cream-tortoiseshell 16 16 32
Chocolate 12 4 16
Total 28 20 48
The data on the coat color and eye color for 48 Himalayan kittens available for adoption were collected and summarized in the table above. What
fraction of the chocolate-colored kittens has deep blue eyes?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e1ad3d41.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The table shows that there are a total of 16 kittens that have a chocolate-colored coat. Of the 16 with a chocolate-colored
coat, 12 have deep blue eyes. Therefore, the fraction of chocolate-colored kittens with deep blue eyes is simply the ratio of those two numbers,
or .
Choice A is incorrect; this is the fraction of all chocolate-colored kittens. Choice B is incorrect; this is the fraction of kittens with deep blue eyes
that have a chocolate-colored coat. Choice C is incorrect; this is the fraction of cream-tortoiseshell-colored kittens with deep blue eyes.$qb$);
select seed_pool_question($qb$CB-3726e079$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If x/y = 4 and 24x/ny = 4, what is the value of n?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3726e079.png$qb$, null, null, array[$qb$24$qb$]::text[], $qb$The correct answer is 24. The equation 24x/ny = 4 can be rewritten as ( 24/n ) ( x/y ) = 4. It's given that . Substituting 4 for x/y in the equation
(24)(4) = x/(4^(y))n= 4
yields (24/n) (4) = 4. Multiplying both sides of this equation by n yields . Dividing both sides of this equation by 4
( 24/n ) (2x/(^(y)4) )==n4
yields . Therefore, the value of n is 24.$qb$);
select seed_pool_question($qb$CB-8baf2118$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit is also shown.
101214IIII11246800444466222288?(?|? ? ? || ? ? ? |)/(222 444 666 888 10II00 12II22 14II44)| || || || || || || || || || || || || || || |x
Which of the following equations best represents the line of best fit shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8baf2118.png$qb$, $qb$[{"label": "A", "body": "y = 13·5 + 0·8x"}, {"label": "B", "body": "y = 13·5 - 0·8x"}, {"label": "C", "body": "y = -13·5 + 0·8x"}, {"label": "D", "body": "y = -13·5 - 0·8x"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The line of best fit shown intersects the y-axis at a positive y-value and has a negative slope. The graph of an equation of the
form y = a + bx, where a and b are constants, intersects the y-axis at a y-value of a and has a slope of b. Of the given choices, only choice B
represents a line that intersects the y-axis at a positive y-value, 13·5, and has a negative slope, -0·8.
Choice A is incorrect. This equation represents a line that has a positive slope, not a negative slope.
Choice C is incorrect. This equation represents a line that intersects the y-axis at a negative y-value, not a positive y-value, and has a positive
slope, not a negative slope.
Choice D is incorrect. This equation represents a line that intersects the y-axis at a negative y-value, not a positive y-value.$qb$);
select seed_pool_question($qb$CB-05195d8a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In a sample, 80% of the items are faulty. There are 88 faulty items in the sample. How many total items are in the sample?$qb$, null, null, null, array[$qb$110$qb$]::text[], $qb$The correct answer is 110. Let x represent the total number of items in the sample. It’s given that 80% of the items are faulty and that there are
88 faulty items in the sample. Therefore, 80% of x is 88. Since 80% can be rewritten as 8o/1o0 , it follows that 80/10o x = 88. Multiplying both sides
of this equation by 100 yields 80x = 8,800. Dividing both sides of this equation by 80 yields x = 110. Therefore, there are 110 total items in
the sample.$qb$);
select seed_pool_question($qb$CB-ac5b6558$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot above shows the high temperature on a certain day and the elevation of 8 different locations in the Lake Tahoe Basin. A line of
best fit for the data is also shown. What temperature is predicted by the line of best fit for a location in the Lake Tahoe Basin with an elevation of
8,500 feet?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ac5b6558.png$qb$, $qb$[{"label": "A", "body": "37°F"}, {"label": "B", "body": "39°F"}, {"label": "C", "body": "41°F"}, {"label": "D", "body": "43°F"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The line of best fit passes through the point . Therefore, the line of best fit predicts a temperature of 39°F for a
location in Lake Tahoe Basin with an elevation of 8,500 feet.
Choice A is incorrect. This is the lowest temperature listed on the scatterplot, and the line of best fit never crosses this value for any of the
elevations shown. Choice C is incorrect. According to the line of best fit, the temperature of 41°F is predicted for an elevation of slightly greater
than 7,500 feet, not an elevation of 8,500 feet. Choice D is incorrect. According to the line of best fit, the temperature of 43°F is predicted for an
elevation of roughly 6,700 feet, not an elevation of 8,500 feet.$qb$);
select seed_pool_question($qb$CB-28ff3966$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A square scale drawing has a side length of 55 inches, and 1 inch on the drawing represents an actual distance of 19 miles. A larger version of
the same drawing is printed as a square with the side length 65% longer than the side length of the previous drawing. On the larger drawing,
which of the following is closest to the actual distance, in miles, represented by 1 inch?$qb$, null, $qb$[{"label": "A", "body": "6·65"}, {"label": "B", "body": "11·52"}, {"label": "C", "body": "31·35"}, {"label": "D", "body": "35·75"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that 1 inch on the drawing represents an actual distance of 19 miles and that the larger drawing has a side length
that is 65% longer than the side length of the previous drawing. It follows that (1·65)(1inch), or 1·65 inches, on the larger drawing also
represents an actual distance of 19 miles. Therefore, the scale of the larger drawing can be represented as 19miIe8/(1·65incheS) , which is approximately
11·52 miles per inch. Therefore, 11·52 is closest to the actual distance, in miles, represented by 1 inch on the larger drawing.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-46545dd6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Number of High School Students Who
Completed Summer Internships
High Year
school 2008 2009 2010 2011 2012
||| ???? -/(||)||| -/(||)-/(??)-/(||)|Foothill 87 80 75 76 70
Valley 44 54 65 76 82
Total 131 134 140 152 152
The table above shows the number of students from two different high schools who completed summer internships in each of five years. No
student attended both schools. Of the students who completed a summer internship in 2010, which of the following represents the fraction of
students who were from Valley High School?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-46545dd6.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. According to the table, 140 students from the two high schools completed summer internships in 2010. Of these, 65 were
from Valley High School. Therefore, of the students who completed summer internships in 2010,  represents the fraction who were from
Valley High School.
Choice A is incorrect. This is the difference between the numbers of students from the two high schools who completed internships in 2010
divided by the total number of students from the two schools who completed internships that year. Choice C is incorrect. This is the fraction of
students from Foothill High School who completed internships out of all the students who completed internships in 2010. Choice D is incorrect.
This is the number of students from Valley High School who completed internships in 2010 divided by the number of students from Foothill High
School who completed internships in 2010.$qb$);
select seed_pool_question($qb$CB-58a71e06$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Of 300,000 paper clips, 234,000 are size large. What percentage of the paper clips are size large?$qb$, null, $qb$[{"label": "A", "body": "22%"}, {"label": "B", "body": "33%"}, {"label": "C", "body": "66%"}, {"label": "D", "body": "78%"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The proportion of the paper clips that are size large can be written as (234,o00)/(3o0,o00) , or 0·78. Therefore, the percentage of the
paper clips that are size large is 0·78(100), or 78%.
Choice A is incorrect. This is the percentage of the paper clips that are not size large.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4aaa9c42$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The positive number a is 2,241% of the sum of the positive numbers b and c, and b is 83% of c. What percent of b is a?$qb$, null, $qb$[{"label": "A", "body": "23·24%"}, {"label": "B", "body": "49·41%"}, {"label": "C", "body": "2,324%"}, {"label": "D", "body": "4,941%"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that a is 2,241% of the sum of b and c. This can be represented by the equation a = , or a
b =( (2,241)/(01·08o3)c) (b + c)
= 22·41(b + c) . It’s also given that that b is 83% of c. This can be represented by the equation b = ( 83/1o0 ) c, or . Dividing both sides
of this equation by 0·83 yields b/(0·83) = c. Substituting b/(0·83) for c in the equation a = 22·41(b + c) yields a = 22·41 (b + b/(o·83)) , or a
= 22·41 ( (1·83b)/(o·83) ) , which is equivalent to a = (41·0103b)/(0·83), or a = 49·41b. This equation is equivalent to a = ( (4,941)/100 ) b; therefore, a is 4,941% of b.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-16cea46c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Voice type Number of singers
Countertenor 4
|||| |||| ????Tenor 6
Baritone 10
Bass 5
A total of 25 men registered for singing lessons. The frequency table shows how many of these singers have certain voice types. If one of these
singers is selected at random, what is the probability he is a baritone?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-16cea46c.png$qb$, $qb$[{"label": "A", "body": "0.10"}, {"label": "B", "body": "0.40"}, {"label": "C", "body": "0.60"}, {"label": "D", "body": "0.67"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. This probability is calculated by dividing the number of baritone singers by the total number of men registered for singing
lessons. It’s given that a total of 25 men registered for singing lessons and that there are 10 baritones. Therefore, the probability of selecting a
baritone from this group at random is , which is equivalent to 0.40.
Choice A is incorrect. This would be the probability of selecting a baritone at random if there were 100 total men who registered for singing
lessons. Choice C is incorrect. This is the probability of selecting a singer at random who isn’t a baritone. Choice D is incorrect. This would be the
probability of selecting a baritone at random if there were 15 total men registered for singing lessons.$qb$);
select seed_pool_question($qb$CB-fb866265$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$???11IIII004444204060806622228800000000000000?(-/?-/??| | | |)/(222 444 666 888 10II00 12II22 14II44)| || || || || || || || || || || || || || || |x
The scatterplot shows the relationship between two variables, x and y. An equation for the exponential model shown can be written as y
= a(b)^(x), where a and b are positive constants. Which of the following is closest to the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fb866265.png$qb$, $qb$[{"label": "A", "body": "0·83"}, {"label": "B", "body": "1·83"}, {"label": "C", "body": "18·36"}, {"label": "D", "body": "126·35"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that an equation for the exponential model shown can be written as y = a(b)^(x) , where a and b are positive
constants. For an exponential model written in this form, if the value of b is greater than 0 but less than 1 , the model is decreasing. If the value of
b is greater than 1, the model is increasing. The exponential model shown is decreasing. Therefore, the value of b is greater than 0 but less than
1. Of the given choices, only 0·83 is a value greater than 0 but less than 1. Thus, 0·83 is closest to the value of b.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-bd90f87e$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A table of the US minimum wage for 6 different years is shown below.
US minimum
wage
Year
(dollars per
hour)
1960 1.00
||||| ||||| |||||1970 1.60
1980 3.10
1990 3.80
2000 5.15
2010 7.25
What was the percent increase of the minimum wage from 1960 to 1970?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bd90f87e.png$qb$, $qb$[{"label": "A", "body": "30%"}, {"label": "B", "body": "60%"}, {"label": "C", "body": "62.5%"}, {"label": "D", "body": "120%"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. According to the table, the minimum wage in 1960 was $1.00 per hour, and in 1970 it was $1.60 per hour. The percentage
change is therefore .
Choice A is incorrect and may result from averaging the two wages before calculating the percentage change. Choice C is incorrect. This is the
1960 wage expressed as a percentage of the 1970 wage, not the percentage change between the two. Choice D is incorrect and may result from
a calculation error.$qb$);
select seed_pool_question($qb$CB-15d87c0f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The bar graph shows the distribution of the number of students in each of four extracurricular activities at a high school.
60
50
40
Number of students 30 |????
20
10
0
chess drama robotics
yearbook
Activity
How many more students are in drama than in chess?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-15d87c0f.png$qb$, $qb$[{"label": "A", "body": "10"}, {"label": "B", "body": "30"}, {"label": "C", "body": "40"}, {"label": "D", "body": "70"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the bar graph shows the distribution of the number of students in each of four extracurricular activities at a
high school. The bar representing drama has a height of 40; therefore, there are 40 students in drama. The bar representing chess has a height
of 30; therefore, there are 30 students in chess. Thus, there are 40 - 30, or 10 more students in drama than in chess.
Choice B is incorrect. This is the number of students in chess.
Choice C is incorrect. This is the number of students in drama.
Choice D is incorrect. This is the sum of the number of students in drama and in chess.$qb$);
select seed_pool_question($qb$CB-312ba47c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In a box of pens, the ratio of black pens to red pens is 8 to 1. There are 40 black pens in the box. How many red pens are in the box?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "8"}, {"label": "C", "body": "40"}, {"label": "D", "body": "320"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the ratio of black pens to red pens is 8 to 1. Therefore, there are  as many red pens as black pens in the box.
1/840
It’s also given that there are 40 black pens in the box. Therefore, the number of red pens is 1/8 of the  black pens. Thus, the number of red pens
is 40(1/8) , or 5.
Choice B is incorrect. This is the number of black pens in the box for every red pen.
Choice C is incorrect. This is the number of black pens in the box.
Choice D is incorrect. This is the number of red pens in the box if the ratio of black pens to red pens is 1 to 8.$qb$);
select seed_pool_question($qb$CB-0ea56bb2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Subscriptions
Year
sold
(?--|)/(?-|)? |(--|)/(-|)|
2012 5,600
2013 5,880
The manager of an online news service received the report above on the number of subscriptions sold by the service. The manager estimated
that the percent increase from 2012 to 2013 would be double the percent increase from 2013 to 2014. How many subscriptions did the manager
expect would be sold in 2014?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0ea56bb2.png$qb$, $qb$[{"label": "A", "body": "6,020"}, {"label": "B", "body": "6,027"}, {"label": "C", "body": "6,440"}, {"label": "D", "body": "6,468"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The percent increase from 2012 to 2013 was , or 5%. Since the percent increase from 2012 to
2013 was estimated to be double the percent increase from 2013 to 2014, the percent increase from 2013 to 2014 was expected to be 2.5%.
Therefore, the number of subscriptions sold in 2014 is expected to be the number of subscriptions sold in 2013 multiplied by , or
.
Choice A is incorrect and is the result of adding half of the value of the increase from 2012 to 2013 to the 2013 result. Choice C is incorrect and
is the result adding twice the value of the increase from 2012 to 2013 to the 2013 result. Choice D is incorrect and is the result of interpreting the
percent increase from 2013 to 2014 as double the percent increase from 2012 to 2013.$qb$);
select seed_pool_question($qb$CB-15617f62$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The population density of Worthington is 290 people per square mile. Worthington has a population of 92,800 people. What is the area, in
square miles, of Worthington?$qb$, null, $qb$[{"label": "A", "body": "102,400"}, {"label": "B", "body": "93,090"}, {"label": "C", "body": "320"}, {"label": "D", "body": "32"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the population density of Worthington is 290 people per square mile and Worthington has a population of
92,800 people. Therefore, the area of Worthington is 92,800 PeoPIe ( (1 8quarc miIe)/29oPc0P1e ) , which is equivalent to (92,8o0 8quarc miIc8)/290 , or 320 square
miles.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8736334b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Data set A and data set B each contain 5 numbers. If the mean of data set A is equal to the mean of data set B, what is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8736334b.png$qb$, $qb$[{"label": "A", "body": "77"}, {"label": "B", "body": "85"}, {"label": "C", "body": "86"}, {"label": "D", "body": "95"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The mean of a data set is found by dividing the sum of the values in the data set by the number of values in the data set.
Therefore, the mean of data set A is , which simplifies to 74. The mean of data set B is represented by the equation
, or . It’s given that the mean of data set A is equal to the mean of data set B. Therefore, the equation
can be used to solve for x. Multiplying both sides of this equation by 5 yields . Subtracting 284 from both
sides of this equation yields .
Choices A, B, and D are incorrect and may result from calculation errors.$qb$);
select seed_pool_question($qb$CB-be35c117$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A wind turbine completes 900 revolutions in 50 minutes. At this rate, how many revolutions per minute does this turbine complete?$qb$, null, $qb$[{"label": "A", "body": "18"}, {"label": "B", "body": "850"}, {"label": "C", "body": "950"}, {"label": "D", "body": "1,400"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Dividing the number of revolutions by the number of minutes gives the number of revolutions the turbine completes per
minute. It’s given that the wind turbine completes 900 revolutions in 50 minutes. Therefore, at this rate, this turbine completes 90o/50 , or 18,
revolutions per minute.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4a2264b3$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The line graph shows the percent of cars for sale at a used car lot on a given day by model year.
1aSe
??O
110055???????||??|| ?|| ?|| ?|| ?|| ?|| ?|| ?|| ?||
fptCC??naOSee
????
?odeI ?ear
For what model year is the percent of cars for sale the smallest?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4a2264b3.png$qb$, $qb$[{"label": "A", "body": "2012"}, {"label": "B", "body": "2013"}, {"label": "C", "body": "2014"}, {"label": "D", "body": "2015"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For the given line graph, the percent of cars for sale at a used car lot on a given day is represented on the vertical axis. The
percent of cars for sale is the smallest when the height of the line graph is the lowest. The lowest height of the line graph occurs for cars with a
model year of 2014.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-e3d49511$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The number of raccoons in a 131 -square-mile area is estimated to be 2,358. What is the estimated population density, in raccoons per square
mile, of this area?$qb$, null, $qb$[{"label": "A", "body": "18"}, {"label": "B", "body": "131"}, {"label": "C", "body": "149"}, {"label": "D", "body": "2,376"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that there are 2,358 raccoons in a 131 -square-mile area. The estimated population density, in raccoons per square
mile, is the estimated number of raccoons divided by the number of square miles. Therefore, the estimated population density of this area is
(2,358 racco0nS)/(131 8quarc mi1e8) , or 18 raccoons per square mile.
Choice B is incorrect. This is the number of square miles in the area, not the estimated number of raccoons per square mile in this area.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3e1bd4e2$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Researchers studied a sample of a species of fish from a certain location. The researchers found that the mean length of fish in the sample was
16·59 millimeters. Based on the sample mean and margin of error, the researchers estimated that the mean length of all fish of this species
from this location was between 15·86 and 17·32 millimeters. What is the margin of error, in millimeters?$qb$, null, $qb$[{"label": "A", "body": "0·73"}, {"label": "B", "body": "2·19"}, {"label": "C", "body": "15·86"}, {"label": "D", "body": "16·59"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the mean length of fish in the sample was 16·59 millimeters. It’s also given that based on the sample mean
and margin of error, the researchers estimated that the mean length of all fish of this species from this location was between 15·86 and 17·32
millimeters. These values are calculated by subtracting the margin of error from 16·59 millimeters to get the lower bound, 15·86 millimeters,
and by adding the margin of error to 16·59 millimeters to get the upper bound, 17·32 millimeters. It follows that the margin of error, in
millimeters, can be calculated as the difference between 16·59 and 15·86 or between 17·32 and 16·59. The difference between 16·59 and
15·86 is 16·59 - 15·86, or 0·73. Therefore, the margin of error, in millimeters, is 0·73.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the lower bound of the researchers' estimate of the mean length of all fish of this species from this location, not the
margin of error.
Choice D is incorrect. This is the mean length of fish in the sample, not the margin of error.$qb$);
select seed_pool_question($qb$CB-b680e76d$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A survey taken by 1,000 students at a school asked whether they played school sports. The table below summarizes all 1,000 responses from
the students surveyed.
How many of the males surveyed responded that they do not play a school sport?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b680e76d.png$qb$, $qb$[{"label": "A", "body": "109"}, {"label": "B", "body": "252"}, {"label": "C", "body": "468"}, {"label": "D", "body": "688"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The table summarizes all 1,000 responses from the students surveyed. If 312 are males who play a sport, 220 are females
who play a sport, and 216 are females who do not play a sport, then 1,000 – 312 – 220 – 216 = 252 males who do not play a sport.
Choices A, C, and D are incorrect. If 109 males who do not play a sport responded, then the table summary would be 109 + 312 + 220 + 216 =
857 total student responses rather than 1,000. If 468 males who do not play a sport responded, then the table summary would be 468 + 312 +
220 + 216 = 1,216 total student responses rather than 1,000. If 688 males who do not play a sport responded, then the table summary would be
688 + 312 + 220 + 216 = 1,436 total student responses rather than 1,000.$qb$);
select seed_pool_question($qb$CB-53d97af5$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A study was done on the weights of different types of fish in a pond. A random sample of fish were caught and marked in order to ensure that
none were weighed more than once. The sample contained 150 largemouth bass, of which 30% weighed more than 2 pounds. Which of the
following conclusions is best supported by the sample data?$qb$, null, $qb$[{"label": "A", "body": "The majority of all fish in the pond weigh less than 2 pounds."}, {"label": "B", "body": "The average weight of all fish in the pond is approximately 2 pounds."}, {"label": "C", "body": "Approximately 30% of all fish in the pond weigh more than 2 pounds."}, {"label": "D", "body": "Approximately 30% of all largemouth bass in the pond weigh more than 2 pounds."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The sample of 150 largemouth bass was selected at random from all the largemouth bass in the pond, and since 30% of the
fish in the sample weighed more than 2 pounds, it can be concluded that approximately 30% of all largemouth bass in the pond weigh more than
2 pounds.
Choices A, B, and C are incorrect. Since the sample contained 150 largemouth bass, of which 30% weighed more than 2 pounds, this result can
be generalized only to largemouth bass in the pond, not to all fish in the pond.$qb$);
select seed_pool_question($qb$CB-15ce8207$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y.
?
44223355II,000,000,000,000,000,,,,,,,,,,000000000000000000000000000000?(-/(| | ? ?))/(1II 222 ?33 444 555 666 ?77)| || || || || || || || |x?
?
Which of the following graphs shows the most appropriate model for the data?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-15ce8207.png$qb$, $qb$[{"label": "A", "body": "44223355II,000,000,000,000,000,,,,,,,,,,000000000000000000000000000000?(-/(| ? ? ? ?)-/?(y-|)/?)/(1II 222 333 444 555 666 777)|?|| || || || || || || |x"}, {"label": "B", "body": "44223355II,000,000,000,000,000,,,,,,,,,,000000000000000000000000000000?(-/(| ? ? ?)-/?(y-|)/??)/(111 222 333 444 555 666 777)| || || || || || || || |x ?"}, {"label": "C", "body": "44223355II,000,000,000,000,000,,,,,,,,,,000000000000000000000000000000?(-/(| | ? ? ?)-/?(y-|)/??)/(1II 222 333 444 555 666 777)| || || || || || || || |x"}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. An appropriate model should follow the trend of the data points and should have data points both above and below the
model. The scatterplot shows that the data points have an increasing trend that is curved. Therefore, an appropriate model should be an
increasing curve with data points both above and below the model. Of the given choices, only the model in choice D is an increasing curve with
data points both above and below the model.
Choice A is incorrect. Since the trend of the data points isn't linear, a line isn't the most appropriate model for the data.
Choice B is incorrect. Since the trend of the data points is increasing and isn't linear, a decreasing line isn't the most appropriate model for the
data.
Choice C is incorrect. All the data points are below the model shown in this graph.$qb$);
select seed_pool_question($qb$CB-0301c5dc$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table below shows the number of state parks in a certain state that contain camping facilities and bicycle paths.
Has bicycle paths Does not have bicycle paths
|| || || ??Has camping facilities 20 5
Does not have camping facilities 8 4
If one of these state parks is selected at random, what is the probability that it has camping facilities but does not have bicycle paths?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0301c5dc.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The total number of state parks in the state is . According to the table, 5 of these have camping
facilities but not bicycle paths. Therefore, if a state park is selected at random, the probability that it has camping facilities but not bicycle paths
is .
Choice B is incorrect. This is the probability that a state park selected at random from the state parks with camping facilities does not have
bicycle paths. Choice C is incorrect. This is the probability that a state park selected at random from the state parks with bicycle paths does not
have camping facilities. Choice D is incorrect. This is the probability that a state park selected at random from the state parks without bicycle
paths does have camping facilities.$qb$);
select seed_pool_question($qb$CB-0ae37ff3$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In a bag, there are 7 red, 4 white, 33 blue, and 33 yellow cubes. If one of these cubes is selected at random, what is the probability of selecting a
cube that is neither- blue nor- yellow?$qb$, null, $qb$[{"label": "A", "body": "6/7"}, {"label": "B", "body": "7/11"}, {"label": "C", "body": "1/3"}, {"label": "D", "body": "1/7"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that there are 7 red, 4 white, 33 blue, and 33 yellow cubes in the bag. Therefore, there are a total of 7 + 4 + 33
+ 33, or 77, cubes in the bag. If the cube is neither blue nor yellow, then it must be either red or white. Therefore, the probability of selecting a
cube that is neither blue nor yellow is equivalent to the probability of selecting a cube that is either red or white. If one of these cubes is selected
at random, the probability of selecting a cube that is either red or white is equal to the sum of the number of red cubes and white cubes divided
by the total number of cubes in the bag. There are 7 red cubes, 4 white cubes, and 77 total cubes in the bag. Therefore, the probability of
selecting a red or white cube is , which is equivalent to 11/77 , or 1/7 . Thus, if one cube is selected at random, the probability of selecting a cube
(7+4)/(17/77)
that is neither blue nor yellow is .
Choice A is incorrect. This is the probability of selecting a cube that is either blue or yellow, rather than the probability of selecting a cube that is
neither blue nor yellow.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c88e0663$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a school fund-raiser, 10 students sold a total of 90 boxes of cookies. Which of the following can be calculated from this information?$qb$, null, $qb$[{"label": "A", "body": "The average number of boxes sold per student"}, {"label": "B", "body": "The median number of boxes sold per student"}, {"label": "C", "body": "The greatest number of boxes sold by one student"}, {"label": "D", "body": "The least number of boxes sold by one student"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The average can be found by dividing the total number of boxes sold by the number of students, which is .
Choices B, C, and D are incorrect. Each results from choosing measures that require the results of individual students, which are not given.$qb$);
select seed_pool_question($qb$CB-9bb4107c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?^(?)dtnnnOSOSeeC??
10?1111123456789004477669922883355II11?-/(-1II| 222| ?33| 444| 555| 666| 777| 888| 999|)?|?| || | ?| | || | ?| | |x
?tmnmOe?
?ime (SeCondS)
The graph shows the momentum y, in newton-seconds, of an object x seconds after the object started moving, for 0 ≤ x ≤ 8. What is the
average rate of change, in newton-seconds per second, in the momentum of the object from x = 2 to x = 6?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9bb4107c.png$qb$, null, null, array[$qb$0.5$qb$, $qb$1/2$qb$]::text[], $qb$The correct answer is 1/2 . For the graph shown, x represents time, in seconds, and y represents momentum, in newton-seconds. Therefore, the
average rate of change, in newton-seconds per second, in the momentum of the object between two x-values is the difference in the
corresponding y-values divided by the difference in the x-values. The graph shows that at x = 2, the corresponding y-value is 6. The graph also
shows that at x = 6, the corresponding y-value is 8. It follows that the average rate of change, in newton-seconds per second, from x = 2 to
x = 6 is (8-6)/(6-2), which is equivalent to 2/4 , or 1/2 . Note that 1/2 and .5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-3f2ee20a$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The results of two independent surveys are shown in the table below.
Men's Height
Group Sample size Mean (centimeters) Standard deviation (centimeters)
|| || || || ||A 2,500 186 12.5
B 2,500 186 19.1
Which statement is true based on the table?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3f2ee20a.png$qb$, $qb$[{"label": "A", "body": "The Group A data set was identical to the Group B data set."}, {"label": "B", "body": "Group B contained the tallest participant."}, {"label": "C", "body": "The heights of the men in Group B had a larger spread than the heights of the men in Group A."}, {"label": "D", "body": "The median height of Group B is larger than the median height of Group A."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Standard deviation is a measure of spread, so data sets with larger standard deviations tend to have larger spread. The
standard deviation of the heights of the men in Group B is larger than the standard deviation of the heights of the men in Group A. Therefore, the
heights of the men in Group B had a larger spread than the heights of the men in Group A.
Choice A is incorrect. If two data sets are identical, they will have equivalent means and equivalent standard deviations. Since the two data sets
have different standard deviations, they cannot be identical. Choice B is incorrect. Without knowing the maximum value for each data set, it’s
impossible to know which group contained the tallest participant. Choice D is incorrect. Since the means of the two groups are equivalent, the
medians could also be the same or could be different, but it's impossible to tell from the given information.$qb$);
select seed_pool_question($qb$CB-993000da$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The positive number a is 230% of the number b, and a is 60% of the number c. If c is p% of b, which of the following is closest to the value of
p?$qb$, null, $qb$[{"label": "A", "body": "138"}, {"label": "B", "body": "217"}, {"label": "C", "body": "283"}, {"label": "D", "body": "383"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that a is 230% of b. It follows that a = 23o/10o b. It's also given that a is 60% of c. It follows that . Since a
a = 60/b10o c
and a = 6o/1o0 c, it follows that 23o/10o b = 6o/100 c. Multiplying each side of this equation by 10o/60 yields 23/6 b = c. If c is p% of , then c
3==8 23o/(1p0o/(31·o30))3bb. It follows that 23/6 = p/1o0 . Multiplying each side of this equation by 100 yields (2,300)/6 = p. It follows that the value of p is approximately
. Therefore, of the given choices, 383 is closest to the value of p.
Choice A is incorrect. This is closest to the value of p if b is 230% of a, rather than if a is 230% of b, and if b is p% of c, rather than if c is p% of
b.
Choice B is incorrect. This is closest to the value of p if a is 230% greater than b, rather than 230% of b.
Choice C is incorrect. This is closest to the value of p if c is p% greater than b, rather than p% of b.$qb$);
select seed_pool_question($qb$CB-f6c18a66$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For data set A, the table summarizes the distribution of the number of deliveries received by an office each day during a period of 11 days.
Deliveries Days
3/46/7??????? |||||||2/22/1|||||||
The data value 13 was recorded in error and is removed from data set A to create data set B, which consists of the remaining 10 data values.
Which statement best compares the median of data set A and the median of data set B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f6c18a66.png$qb$, $qb$[{"label": "A", "body": "The median of data set B is less than the median of data set A."}, {"label": "B", "body": "The median of data set B is greater than the median of data set A."}, {"label": "C", "body": "The median of data set B is equal to the median of data set A."}, {"label": "D", "body": "There is not enough information to compare the medians of the two data sets."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that for data set A, the table summarizes the number of deliveries received by an office each day over a period of
11 days. If a data set contains an odd number of data values, the median is represented by the middle data value in the list when the data values
are listed in ascending or descending order. Since data set A contains 11 data values in ascending order, the median of data set A is the 6th
value. Based on the number of days for each value shown in the table, the 6th value is 4, so the median of data set A is 4. It’s also given that the
data value 13 was recorded in error and is removed from data set A to create data set B. It follows that data set B contains 10 data values in
ascending order. If a data set contains an even number of data values, the median is between the two middle data values when the values are
listed in ascending or descending order. It follows that the median of data set B is between the 5th and 6th values. Based on the number of
days for each value shown in the table, the 5th and 6th values are both 4, so the median of data set B is 4. Therefore, the median of data set B is
equal to the median of data set A.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fe6a49d6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The bar graph shows the distribution of the number of walnuts per container for 20 containers at a grocery store.
8
7
6
5
Frequency 4 |????
3
2
1
0
75 76 77 78
Number of walnuts per container
How many of these containers of walnuts contain exactly 78 walnuts?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fe6a49d6.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "7"}, {"label": "C", "body": "20"}, {"label": "D", "body": "78"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The height of each bar in the graph shown represents the number of containers that contain the number of walnuts specified
at the bottom of the bar. The bar for 78 walnuts has a height of 7. Therefore, 7 of these containers of walnuts contain exactly 78 walnuts.
Choice A is incorrect. This is the number of containers that contain exactly 75 walnuts, not 78 walnuts.
Choice C is incorrect. This is the total number of containers of walnuts represented in the bar graph, not the number that contain exactly 78
walnuts.
Choice D is incorrect. This is the number of walnuts in a container that contains exactly 78 walnuts, not the number of containers that contain
exactly 78 walnuts.$qb$);
select seed_pool_question($qb$CB-632cf8f9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The graph of the function f is shown, where y= f(x) .
-(?246446622)/(-/-?222)|| || || || || || | || || || | x
Which of the following best describes the function f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-632cf8f9.png$qb$, $qb$[{"label": "A", "body": "Decreasing exponential"}, {"label": "B", "body": "Increasing exponential"}, {"label": "C", "body": "Decreasing linear"}, {"label": "D", "body": "Increasing linear"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The graph of function f shows that as x increases, f(x) also increases, which means that f is an increasing function. The
graph of function f is curved upward and increases at an increasing rate, not a constant rate. This behavior is characteristic of exponential
functions, not linear functions. Therefore, of the given choices, function f is best described as increasing exponential.
Choice A is incorrect. For a decreasing function, as x increases, f(x) decreases rather than increases.
Choice C is incorrect. For a decreasing function, as x increases, f(x) decreases rather than increases, and the graph of a linear function isn't
curved.
Choice D is incorrect. The graph of a linear function isn't curved.$qb$);
select seed_pool_question($qb$CB-d0efc1dd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$medium$qb$::difficulty_level, null, $qb$15, 14, 18, 17, x
The mean and the median of the five numbers above are equal. Which of the following is NOT a possible value of x ?$qb$, null, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "11"}, {"label": "C", "body": "16"}, {"label": "D", "body": "21"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. If x is 6, then the five numbers in the given list are 15, 14, 18, 17, 6. The mean of these five numbers is the sum of all the
values divided by the number of values, or . The median of these five numbers can be found by
ordering the numbers from least to greatest and determining the middle value. When ordered from least to greatest, the numbers in the given list
are 6, 14, 15, 17, 18, and the middle value is 15. Since the mean is 14 and the median is 15, the mean and median aren’t equal when x is 6.
Choices B, C, and D are incorrect. If any of these values is substituted for x, the mean and median of the data set would be equal.$qb$);
select seed_pool_question($qb$CB-80f1f3a9$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$easy$qb$::difficulty_level, null, $qb$??n?eeC?? 47628351000000000 | ? ? ? ?
b1ue green red ?eI10W
?0Ior
A data set consists of 173 colors. The bar graph shows the number of times each color appears in the data set. Which color appears 70 times?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-80f1f3a9.png$qb$, $qb$[{"label": "A", "body": "Blue"}, {"label": "B", "body": "Green"}, {"label": "C", "body": "Red"}, {"label": "D", "body": "Yellow"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that a data set consists of 173 colors and the bar graph shows the number of times each color appears in the data
set. Therefore, for each color specified at the bottom of the bar, the frequency corresponds to the number of times that color appears in the data
set. The color that appears 70 times in the data set has a frequency of 70 on the bar graph. Since the bar with a frequency of 70 corresponds to
green, green is the color that appears 70 times.
Choice A is incorrect. The color blue appears about 27 times, not 70 times.
Choice C is incorrect. The color red appears about 33 times, not 70 times.
Choice D is incorrect. The color yellow appears about 43 times, not 70 times.$qb$);
select seed_pool_question($qb$CB-e9fb7774$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What percentage of 300 is 75?$qb$, null, $qb$[{"label": "A", "body": "25%"}, {"label": "B", "body": "50%"}, {"label": "C", "body": "75%"}, {"label": "D", "body": "225%"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Let x represent the percentage of 300 that is 75. This can be written as x/10o (300) = 75, or 3x = 75. Dividing both sides of
this equation by 3 yields x = 25. Therefore, 25% of 300 is 75.
Choice B is incorrect. 50% of 300 is 150, not 75.
Choice C is incorrect. 75% of 300 is 225, not 75.
Choice D is incorrect. 225% of 300 is 675, not 75.$qb$);
select seed_pool_question($qb$CB-190be2fc$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Data set A consists of 10 positive integers less than 60. The list shown gives 9 of the integers from data set A.
43, 45, 4443, , 3839, , 404640, ,
The mean of these 9 integers is 42. If the mean of data set A is an integer that is greater than 42, what is the value of the largest integer from
data set A?$qb$, null, null, null, array[$qb$52$qb$]::text[], $qb$The correct answer is 52. The mean of a data set is calculated by dividing the sum of the data values by the number of values. It’s given that data
set A consists of 10 values, 9 of which are shown. Let x represent the 10th data value in data set A, which isn’t shown. The mean of data set A
can be found using the expression (43+45+44+43+38+39+40+46+40+x)/10 , or (378+x)/1o . It’s given that the mean of the 9 values shown is 42 and that the
mean of all 10 numbers is greater than 42. Consequently, the 10th data value, x, is larger than 42. It’s also given that the data values in data set
A are positive integers less than 60. Thus, 42 < x < 60. Finally, it’s given that the mean of data set A is an integer. This means that the sum of
the 10 data values, 378 + x, is divisible by 10. Thus, 378 + x must have a ones digit of 0. It follows that x must have a ones digit of 2. Since 42
< x < 60 and x has a ones digit of 2, the only possible value of x is 52. Since 52 is larger than any of the integers shown, the largest integer
from data set A is 52.$qb$);
select seed_pool_question($qb$CB-3f236a64$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x y
1 4
|||| |||| ||||3 12
5 20
40 k
In the table above, the ratio of y to x for each ordered pair is constant. What is the value of k ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3f236a64.png$qb$, $qb$[{"label": "A", "body": "28"}, {"label": "B", "body": "36"}, {"label": "C", "body": "80"}, {"label": "D", "body": "160"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the ratio of y to x is constant for each ordered pair in the table, the first row can be used to determine that the ratio of y
to x is 4 to 1. The proportion  can be used to solve for k. Multiplying each side of the equation by 40 yields .
Choice A is incorrect. This is the value of y when the value of x is 7, not 40. Choice B is incorrect and may result from subtracting 4 from 40
instead of multiplying 40 by 4. Choice C is incorrect and may result from incorrectly setting up the proportion.$qb$);
select seed_pool_question($qb$CB-8705ecba$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The cost of a certain shirt is $20 before a 5% sales tax is added. What is the total cost, including sales tax, to purchase the shirt?$qb$, null, $qb$[{"label": "A", "body": "$20.05"}, {"label": "B", "body": "$20.50"}, {"label": "C", "body": "$21.00"}, {"label": "D", "body": "$25.00"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The total cost to purchase the shirt is the $20 cost of the shirt plus the 5% sales tax. The value of the 5% sales tax on the $20
shirt is equivalent to, or $1. Therefore, the total cost to purchase the shirt is , or $21.
Choice A is incorrect and may result from neglecting to multiply by $20 when finding the value of the sales tax. Choice B is incorrect and may
result from dividing by 10, instead of by 100, and then neglecting to multiply by $20 when finding the sales tax. Choice D is incorrect and may
result from interpreting the sales tax of 5% as $5.$qb$);
select seed_pool_question($qb$CB-2e74e403$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the given scatterplot, a line of best fit for the data is shown.
1011123456789004477669922883355II?-/(-1II| 222| 333| 444| 555| 666| 777| 888| 999| 10II00|)?|?|| | ? ?| | ? | ? | ? |? | ? | ? | |x
Which of the following is closest to the slope of this line of best fit?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2e74e403.png$qb$, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "0·7"}, {"label": "C", "body": "-0·7"}, {"label": "D", "body": "-7"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A line of best fit is shown in the scatterplot such that as the value of x increases, the value of y decreases. It follows that the
slope of the line of best fit shown is negative. The slope of a line in the xy-plane that passes through the points (x1 , y1 ) and  can be
(0, (8^(x))2^(,) y2()x1, y1)
calculated as . The line of best fit shown passes approximately through the points (0, 8) and (10, 1). Substituting  for  and
(x (y2-y1)/(2x,2y-2x)1)
(10, 1) for  in (y2-y1)/(x2 -x1) yields the slope of the line being approximately (1-8)/(1o-o) , which is equivalent to (-7)/10, or -0·7. Therefore, of the given
choices, -0·7 is the closest to the slope of this line of best fit.
Choice A is incorrect. The line of best fit shown has a negative slope, not a positive slope.
Choice B is incorrect. The line of best fit shown has a negative slope, not a positive slope.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f8f79e11$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A park ranger asked a random sample of visitors how far they hiked during their visit. Based on the responses, the estimated mean was found to
be 4.5 miles, with an associated margin of error of 0.5 miles. Which of the following is the best conclusion from these data?$qb$, null, $qb$[{"label": "A", "body": "It is likely that all visitors hiked between 4 and 5 miles."}, {"label": "B", "body": "It is likely that most visitors hiked exactly 4.5 miles."}, {"label": "C", "body": "It is not possible that any visitor hiked less than 3 miles."}, {"label": "D", "body": "It is plausible that the mean distance hiked for all visitors is between 4 and 5 miles."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given estimated mean has an associated margin of error because from sample data, the population mean can’t be
determined precisely. Rather, from the sample mean, an interval can be determined within which it’s plausible that the population’s mean is likely
to lie. Since the estimated mean is 4.5 miles with an associated margin of error of 0.5 miles, it follows that between  miles and
miles, or between 4 and 5 miles, is plausibly the mean distance hiked for all visitors.
Choices A, B, and C are incorrect. Based on the estimated mean, no determination can be made about the number of miles hiked for all visitors
to the park.$qb$);
select seed_pool_question($qb$CB-da9ffcf6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The ratio of the length of line segment XY to the length of line segment ZV is 6 to 1 . If the length of line segment XY is 102 inches, what is
the length, in inches, of line segment ZV?$qb$, null, $qb$[{"label": "A", "body": "17"}, {"label": "B", "body": "96"}, {"label": "C", "body": "102"}, {"label": "D", "body": "612"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the ratio of the length of line segment XY to the length of line segment ZV is 6 to 1, which means .
XY/ZVℓ = 6/1
It’s given that the length of line segment XY is 102 inches. If the length, in inches, of line segment ZV is represented by ℓ, the value of  can
be calculated by solving the equation 102/ℓ = 6/1, or 1o2/ℓ = 6. Multiplying each side of this equation by ℓ yields 102 = 6ℓ. Dividing each side of
this equation by 6 yields 17 = ℓ. Therefore, the length of line segment ZV is 17 inches.
Choice B is incorrect. This is the length, in inches, of line segment ZV if the length of line segment XY is 576, not 102, inches.
Choice C is incorrect. This is the length, in inches, of line segment XY, not line segment ZV.
Choice D is incorrect. This is the length, in inches, of line segment ZV if the ratio of the length of line segment XY to the length of line segment
ZV is 1 to 6, not 6 to 1.$qb$);
select seed_pool_question($qb$CB-db88a933$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Data Set Q
Value Frequency
a
b/(|-|)||| |||-/11030/(-0 |)|||
c
Data Set R
Value Frequency
a
|||| ||||0/3|||
c
Data sets Q and R are summarized in the tables shown, where , , and c are positive, consecutive integers and a < b < c. Which statement
comparing the means of the data sets is true?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-db88a933.png$qb$, $qb$[{"label": "A", "body": "The mean of data set R is (2(11))/14 less than the mean of data set Q."}, {"label": "B", "body": "The mean of data set R is (2(11))/14 greater than the mean of data set Q."}, {"label": "C", "body": "The mean of data set Q is 10 times the mean of data set R."}, {"label": "D", "body": "The means of the two data sets are equal."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The mean of a data set is the sum of the values of the data set divided by the total number of values in the data set. When a
data set is represented in a frequency table, the sum of the values in the data set is the sum of the products of each value and its frequency. For
data set Q, the sum of the products of each value and its frequency is 110a + 30b + 0c, or 110a + 30b, and the number of values is 110 + 30
+ 0, or 140. Therefore, the mean of data set Q is . For data set R, the sum of the products of each value and its frequency is 0a + 3b
(110a+30b)/(0 +^(14)30+)1 1
+ 11c, or 3b + 11c, and the number of values is , or 14. Therefore, the mean of data set R is (3b+11c)/14 . Since ab, , and c are positive,
consecutive integers and a < b < c, it follows that b = a + 1 and c = a + 2. Substituting a + 1 for b in the mean of data set Q yields
, or , which is equivalent to (140a+30)/14o , or . Substituting a + 1 for b and a + 2 for c in the mean of data set R
(110a+3o(a+1))/14o(3(a+1)+11(a+2))/14(110a+30a+3o)/140 (1a4a++33/(+142) (11))/14
yields , or , which is equivalent to , or a + 3/14 + (2(11))/14. Subtracting the mean of data set Q from the
(3a+3+11a+2(11))/((a + 134/14 +)(2(11))/14 ) - (a + 3/14 )
mean of data set R yields , or (2(11))/14 . Therefore, the mean of data set R is (2(11))/14 greater than the mean of data
set Q.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2e8027b0$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$hard$qb$::difficulty_level, null, $qb$441020504050223355II0000000000?-/(-| 444| | 888| | 12II22| | 16II66| | 202200|)-/?(- ?)/|-/|-/|-/|-/?|?|| | | | | | | | || | |x
The scatterplot shows the relationship between two variables, x and y, for data set E. A line of best fit is shown. Data set F is created by
multiplying the y-coordinate of each data point from data set E by 3·9. Which of the following could be an equation of a line of best fit for data
set F?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2e8027b0.png$qb$, $qb$[{"label": "A", "body": "y = 46·8 + 5·9x"}, {"label": "B", "body": "y = 46·8 + 1·5x"}, {"label": "C", "body": "y = 12 + 5·9x"}, {"label": "D", "body": "y = 12 + 1·5x"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. An equation of a line of best fit for data set F can be written in the form y = a + bx, where a is the y-coordinate of the y-
intercept of the line of best fit and b is the slope. The line of best fit shown for data set E has a y-intercept at approximately (0, 12). It's given that
data set F is created by multiplying the y-coordinate of each data point from data set E by 3·9. It follows that a line of best fit for data set F has a
y-intercept at approximately , or . Therefore, the value of a is approximately 46·8. The slope of a line that passes through
(x2, y2)(0, 12(3·9)) (0, 46(y·82-) y1)/(x2 -x1)
points (x1 , y1 ) and  can be calculated as . Since the line of best fit shown for data set E passes approximately through the point
, it follows that a line of best fit for data set F passes approximately through the point (12, 30(3·9)) , or . Substituting
((012, 4^(,) 630·8)) ((71o2·2^(,))/12 117)
and (12, 117) for (x1 , y1 ) and (x2 , y2 ), respectively, in  yields (117-46·8)/(12-0) , which is equivalent to , or 5·85. Therefore, the
y = 4(y2-y1)/(x62·-8x+1) 5 ·9x
value of b is approximately 5·85, or approximately 5·9. Thus, could be an equation of a line of best fit for data set F.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This could be an equation of a line of best fit for data set E, not data set F.$qb$);
select seed_pool_question($qb$CB-c178d4da$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Data set A Data set B
Value
frequency frequency
(-/30? |)/442/46/27????? |||||(-/2|)/45/7||||4/(-2 |)||||
Data set A and data set B each consist of  values. The table shows the frequencies of the values for each data set. Which of the following
statements best compares the means of the two data sets?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c178d4da.png$qb$, $qb$[{"label": "A", "body": "The mean of data set A is greater than the mean of data set B."}, {"label": "B", "body": "The mean of data set A is less than the mean of data set B."}, {"label": "C", "body": "The mean of data set A is equal to the mean of data set B."}, {"label": "D", "body": "There is not enough information to compare the means of the data sets."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The mean value of a data set is the sum of the values of the data set divided by the number of values in the data set. When a
data set is represented in a frequency table, the sum of the values in the data set is the sum of the products of each value and its frequency. For
data set A, the sum of products of each value and its frequency is 30(2) + 34(4) + 38(5) + 42(7) + 46(9) , or 1,094. It's given that there are
27 values in data set A. Therefore, the mean of data set A is (1,o94)/27, or approximately 40·52. Similarly, the mean of data B is 958/27 , or approximately
35·48. Therefore, the mean of data set A is greater than the mean of data set B.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2c76bcce$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$inference_from_sample_statistics_and_margin_of_error$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A company designs and makes handbags. To estimate the mean weight of the handbags made by the company on a particular day, a sample of
the handbags made by the company on that day was selected at random. Based on the sample, it is estimated that the mean weight of all
handbags made by the company on that day is 27·8 0unceS (0?) , with an associated margin of error of 0·02o?. Based on this estimate and
associated margin of error, which of the following is the most plausible conclusion?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2c76bcce.png$qb$, $qb$[{"label": "A", "body": "The mean weight of all handbags made by the company on that day is between 27·78o? and 27·820?."}, {"label": "B", "body": "The actual weights of all handbags made by the company on that day are between 27·780? and 27·82o?."}, {"label": "C", "body": "The actual weights of all handbags from the sample are between 27·780? and 27·820?."}, {"label": "D", "body": "The mean weight of all handbags made by the company on that day is 27·8o?."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the estimated mean weight of all handbags made by the company on a particular day is 27·80?, with an
associated margin of error of 0·02o?. It follows that plausible values for the mean weight are between (27·8 - 0·02) o? and (27·8
+ 0·02) 0?. Therefore, the most plausible conclusion is that the mean weight of all handbags made by the company on that day is between
27·780? and 27·82o?.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9fa781f8$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The ratio x to y is equivalent to the ratio 9 to 5. If the value of x is 162, what is the value of y?$qb$, null, null, null, array[$qb$90$qb$]::text[], $qb$The correct answer is 90. It’s given that the ratio of x to y is equivalent to the ratio 9 to 5. It follows that x/y = 9/5 . Multiplying each side of this
equation by 5y yields ((5y)x)/y = (9(5y))/5 , or 5x = 9y. Dividing each side of this equation by 9 yields 5x/9 = y. Substituting 162 for x in this equation
yields (5(162))/9 = y, which is equivalent to 810/9 = y, or 90 = y. Therefore, if the value of x is 162, the value of y is 90.$qb$);
select seed_pool_question($qb$CB-9a144a01$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following is true about the values of  and  for ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9a144a01.png$qb$, $qb$[{"label": "A", "body": "For all , it is true that ."}, {"label": "B", "body": "For all , it is true that ."}, {"label": "C", "body": "There is a constant c such that if , then , but if , then ."}, {"label": "D", "body": "There is a constant c such that if , then , but if , then ."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. At , the value of  is less than the value of , which is equivalent to . As the value of x
increases, the value of  remains less than the value of  until , which is when the two values are equal: , which is
equivalent to . Then, for , the value of  is greater than the value of . So there is a constant, 3, such that when ,
then , but when , then .
Choice A is incorrect because  when . Choice B is incorrect because  when . Choice D is incorrect
because  when  and  when .$qb$);
select seed_pool_question($qb$CB-022e9894$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An insurance company offers a series of three information sessions. 1,250 people attended the first information session. 72% of the people
who attended the first information session attended the second information session, and 36% of the people who attended the first and second
information sessions attended the third information session. How many people attended all three information sessions?$qb$, null, null, null, array[$qb$324$qb$]::text[], $qb$The correct answer is 324. It’s given that 1,250 people attended the first information session, and that 72% of the people who attended the first
information session attended the second information session. Therefore, the number of people who attended the first and second information
sessions can be found by calculating 72% of 1,250, which is equal to 1, 250(72/10o) , or 900. It’s also given that 36% of the people who attended
the first and second information sessions attended the third information session. Since 900 people attended the first and second information
sessions, the number of people who attended the first, second, and third information sessions can be found by calculating 36% of 900, which is
equal to 900(36/1o0) , or 324. Therefore, 324 people attended all three information sessions.$qb$);
select seed_pool_question($qb$CB-457d2f2c$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$one_variable_data_distributions_and_measures_of_center_and_spread$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A data set of 27 different numbers has a mean of 33 and a median of 33. A new data set is created by adding 7 to each number in the original
data set that is greater than the median and subtracting 7 from each number in the original data set that is less than the median. Which of the
following measures does NOT have the same value in both the original and new data sets?$qb$, null, $qb$[{"label": "A", "body": "Median"}, {"label": "B", "body": "Mean"}, {"label": "C", "body": "Sum of the numbers"}, {"label": "D", "body": "Standard deviation"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. When a data set has an odd number of elements, the median can be found by ordering the values from least to greatest and
determining the middle value. Out of the 27 different numbers in this data set, 13 numbers are below the median, one number is exactly 33, and
13 numbers are above the median. When 7 is subtracted from each number below the median and added to each number above the median, the
data spread out from the median. Since the median of this data set, 33, is equivalent to the mean of the data set, the data also spread out from
the mean. Since standard deviation is a measure of how spread out the data are from the mean, a greater spread from the mean indicates an
increased standard deviation.
Choice A is incorrect. All the numbers less than the median decrease and all the numbers greater than the median increase, but the median itself
doesn’t change. Choices B and C are incorrect. The mean of a data set is found by dividing the sum of the values by the number of values. The
net change from subtracting 7 from 13 numbers and adding 7 to 13 numbers is zero. Therefore, neither the mean nor the sum of the numbers
changes.$qb$);
select seed_pool_question($qb$CB-e24765e6$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$During a study, the temperature, in degrceS ?eISiuS (°?) , of the air in a chamber was recorded to the nearest integer at certain times. The
scatterplot shows the recorded temperature yin^(°)?, , of the air in the chamber x minutes after the start of the study.
y
30
28
26
24
22
20
18
Temperature 16
14|| | | | | | | | | ?
(°C) 12
10
8
6
4
2
x
O 1 2 3 4 5 6 7 8
Time (minutes)
What was the average rate of change, in^(°)? per minute, of the recorded temperature of the air in the chamber from x = 5 to x = 7?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e24765e6.png$qb$, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. For the graph shown, x represents time, in minutes, and y represents temperature, in degrees Celsius (°?) . Therefore,
the average rate of change, in ^(°)? per minute, of the recorded temperature of the air in the chamber between two x-values is the difference in the
corresponding y-values divided by the difference in the x-values. The graph shows that at x = 5, the corresponding y-value is 14. The graph also
shows that at x = 7, the corresponding y-value is 24. It follows that the average rate of change, in ^(?)? per minute, from x = 5 to x = 7 is
(24-14)/(7-5) , which is equivalent to 10/2 , or 5.$qb$);
select seed_pool_question($qb$CB-47624288$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The table gives the distribution of votes for a new school mascot and grade level for 80 students.
Grade level
Mascot Sixth Seventh Eighth Total
Badger 4 9 9 22
????? |||||| -/(||||)????? -/(||||)-/(||||)|Lion 9 2 9 20
Longhorn 4 6 4 14
Tiger 6 9 9 24
Total 23 26 31 80
If one of these students is selected at random, what is the probability of selecting a student whose vote for new mascot was for a lion?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-47624288.png$qb$, $qb$[{"label": "A", "body": "1/9"}, {"label": "B", "body": "1/5"}, {"label": "C", "body": "1/4"}, {"label": "D", "body": "2/3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If one of these students is selected at random, the probability of selecting a student whose vote for the new mascot was for
a lion is given by the number of votes for a lion divided by the total number of votes. The given table indicates that the number of votes for a lion
is 20 votes, and the total number of votes is 80 votes. The table gives the distribution of votes for 80 students, and the table shows a total of 80
votes were counted. It follows that each of the 80 students voted exactly once. Thus, the probability of selecting a student whose vote for the
new mascot was for a lion is 20/80 , or 1/4 .
Choice A is incorrect and may result from conceptual or computational errors.
Choice B is incorrect and may result from conceptual or computational errors.
Choice D is incorrect and may result from conceptual or computational errors.$qb$);
select seed_pool_question($qb$CB-6310adbc$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$ratios_rates_proportional_relationships_and_units$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The ratio of t to u is 1 to 2, and . What is the value of u ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6310adbc.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "5"}, {"label": "C", "body": "10"}, {"label": "D", "body": "20"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the ratio of t to u is 1 to 2. Since , it follows that the ratio of 10 to u is also 1 to 2. The relationship
between these ratios can be represented by the proportion . Multiplying both sides of this equation by 2 and then by u yields
.
Choice A is incorrect. This is the value of u when . Choice B is incorrect. This would be the value of u if the ratio of t to u were 2 to 1. Choice
C is incorrect. This is the value of t, not u.$qb$);
select seed_pool_question($qb$CB-e438ec3f$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A grove has 6 rows of birch trees and 5 rows of maple trees. Each row of birch trees has 8 trees 20 feet or taller and 6 trees shorter than 20 feet.
Each row of maple trees has 9 trees 20 feet or taller and 7 trees shorter than 20 feet. A tree from one of these rows will be selected at random.
What is the probability of selecting a maple tree, given that the tree is 20 feet or taller?$qb$, null, $qb$[{"label": "A", "body": "9/164"}, {"label": "B", "body": "3/1o"}, {"label": "C", "body": "15/31"}, {"label": "D", "body": "9/17"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If a tree from one of these rows is selected at random, the probability of selecting a maple tree, given that the tree is 20 feet
or taller, is equal to the number of maple trees that are 20 feet or taller divided by the total number of trees that are 20 feet or taller. It's given that
there are 6 rows of birch trees, and each row of birch trees has 8 trees that are 20 feet or taller. This means that there are a total of 6(8) , or 48,
birch trees that are 20 feet or taller. It's given that there are 5 rows of maple trees, and each row of maple trees has 9 trees that are 20 feet or
taller. This means that there are a total of 5(9) , or 45, maple trees that are 20 feet or taller. It follows that there are a total of , or 93,
48 (+15)/3145
trees that are 20 feet or taller. Therefore, the probability of selecting a maple tree, given that the tree is 20 feet or taller, is 45/93 , or .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-63573fea$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$medium$qb$::difficulty_level, null, $qb$During the first month of sales, a company sold 1,300,000 units of a certain type of smartphone. During the same month, 15% of the units sold
were returned. If sales and the return rate remain the same for each of the next 5 months, about how many units of this smartphone will be
returned to the company during this 6-month period?$qb$, null, $qb$[{"label": "A", "body": "195,000"}, {"label": "B", "body": "975,000"}, {"label": "C", "body": "1,170,000"}, {"label": "D", "body": "6,630,000"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Of the 1,300,000 units sold during the first month, 15% were returned, so  units were
returned during the first month. If the units were sold and returned at the same rate for the next 5 months, then a total of
smartphone units were returned during the 6-month period.
Choice A is incorrect. This is the number of units that were returned in 1 month. Choice B is incorrect. This is the number of units that were
returned in 5 months. Choice D is incorrect. This is the number of units sold and not returned during the first 6 months.$qb$);
select seed_pool_question($qb$CB-191d167b$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$percentages$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Last year, 200 students enrolled in an interior design program. This year, the number of students enrolled is 147% of last year’s number. How
many students are enrolled in the interior design program this year?$qb$, null, $qb$[{"label": "A", "body": "247"}, {"label": "B", "body": "294"}, {"label": "C", "body": "347"}, {"label": "D", "body": "394"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the number of students enrolled in an interior design program this year is 147% of last year's number, which is
200. 147% of 200 can be expressed as (147/1o0) (200) , or (1·47)(200) , which is equivalent to 294. Therefore, 294 students are enrolled in the
interior design program this year.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-03a16790$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$two_variable_data_models_and_scatterplots$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The scatterplot shows the relationship between two variables, x and y. A line of best fit is also shown.
101214IIIIII246800444466222288?(??? ? ? ?? ? ? ? ?)/(222 444 666 888 10II00 12II22 14II44)| || || || || || || || || || || || || || || |x
Which of the following is closest to the slope of the line of best fit shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-03a16790.png$qb$, $qb$[{"label": "A", "body": "-2·4"}, {"label": "B", "body": "-0·8"}, {"label": "C", "body": "0·8"}, {"label": "D", "body": "2·4"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A line of best fit is shown in the scatterplot such that as the value of x increases, the value of y decreases. Thus, the slope of
the line of best fit shown is negative. The slope of a line passing through two points,  and , can be calculated as . The line
(^(x1,) y^(1))(1, 12()^(x2,) y^(2)()11, 4) (y2-y1)/(x(2x-2x,1)y2 )
of best fit shown passes approximately through the points  and (11, 4). Substituting  and  for (x1 , y1 ) and ,
-((81,)/1o 12)
respectively, in (y2-y1)/(x2 -x1) gives (4-12)/(11-1) , which is equivalent to , or -0·8. Therefore, of the given choices, -0·8 is closest to the slope of the line
of best fit shown.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. The line of best fit shown has a negative slope, not a positive slope.
Choice D is incorrect. The line of best fit shown has a negative slope, not a positive slope.$qb$);
select seed_pool_question($qb$CB-60caadfd$qb$, $qb$mathematics$qb$, $qb$problem_solving_and_data_analysis$qb$, $qb$probability_and_conditional_probability$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Each rock in a collection of 70 rocks was classified as either igneous, metamorphic, or sedimentary, as shown in the frequency table.
Classification Frequency
igneous 10
||| ||| |||
metamorphic 33
sedimentary 27
If one of these rocks is selected at random, what is the probability of selecting a rock that is igneous?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-60caadfd.png$qb$, $qb$[{"label": "A", "body": "1o/27"}, {"label": "B", "body": "10/33"}, {"label": "C", "body": "1o/6o"}, {"label": "D", "body": "10/70"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. If one of the rocks in the collection is selected at random, the probability of selecting a rock that is igneous is equal to the
number of igneous rocks in the collection divided by the total number of rocks in the collection. According to the table, there are 10 igneous
rocks in the collection, and it's given that there's a total of 70 rocks in the collection. Therefore, if one of the rocks in the collection is selected at
random, the probability of selecting a rock that is igneous is 10/70 .
Choice A is incorrect. This is the number of igneous rocks in the collection divided by the number of sedimentary rocks in the collection, not
divided by the total number of rocks in the collection.
Choice B is incorrect. This is the number of igneous rocks in the collection divided by the number of metamorphic rocks in the collection, not
divided by the total number of rocks in the collection.
Choice C is incorrect. This is the number of igneous rocks in the collection divided by the number of rocks in the collection that aren't igneous,
not divided by the total number of rocks in the collection.$qb$);
