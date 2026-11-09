-- ============================================================================
--  0080 — College Board's Mathematics questions
--
--  400 questions from College Board's SAT Suite Question Bank, into the
--  Mathematics practice pool. Part 1 of 5.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

select seed_pool_question($qb$CB-ac472881$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$(12x+28)/4 - s/13 = r(x - 8)
In the given equation, s and r are constants, and s > 0. If the equation has infinitely many solutions, what is the value of s?$qb$, null, null, null, array[$qb$403$qb$]::text[], $qb$The correct answer is 403. For a linear equation in one variable to have infinitely many solutions, the coefficients of the variable must be equal
on both sides of the equation and the constant terms must also be equal on both sides of the equation. The given equation can be rewritten as
, or 3x + 7 - s/13 = r(x - 8) . Applying the distributive property to the right-hand side of this equation yields 3x + 7
(4(3x+7))/(- 4s/13 =) -rxs/(1-3) =8rr(x - 8)
. For this equation to have infinitely many solutions, the coefficients of x must be equal, so it follows that 3 = r. Additionally,
the constant terms must be equal, which means . Substituting 3 for r in this equation yields , or 7 - s/13 =
7 - s/713==--248r+ s/13 7 - s/13 =3-1 8=(3()s)/13
-24. Adding s/13 to both sides of this equation yields . Adding 24 to both sides of this equation yields . Multiplying both
sides of this equation by 13 yields 403 = s. Therefore, if the equation has infinitely many solutions, the value of s is 403.$qb$);
select seed_pool_question($qb$CB-3f5a3602$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-(10II123456?890044??669922883355II)/(-/-(?222 -1II ?- 1II 222 333 444 555 666 777 888 ??? ?????)/-÷÷2122II)||??|| | || || || || || || || || || || | x
What system of linear equations is represented by the lines shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3f5a3602.png$qb$, $qb$[{"label": "A", "body": "8x + 4y = 32 -10x - 4y = -64"}, {"label": "B", "body": "8x - 4y = 32 -10x + 4y = -64"}, {"label": "C", "body": "4x - 10y = 32 -8x + 10y = -64"}, {"label": "D", "body": "4x + 10y = 32 -8x - 10y = -64"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A line in the xy-plane that passes through the points (x1 , y1 ) and (x2 , y2 ) has slope m, where , and can be
defined by an equation of the form y - y1 = m(x - x1 ). One of the lines shown in the graph passes through the points  and (3, 4).
m = (y2-y1)/(x82 -, 0x-1)4/54/5 x
Substituting 8 for x1 , 0 for y1 , 3 for x2, and 4 for y2 in the equation  yields m = (4-0)/(3-8) , or . Substituting  for m8,  for x1
y - 0 = -m4/5=(x(y2-y1)/(x-2 -8x)1) my==--4/54/5 x + 32/5
and 0 for y1 in the equation y - y1 = m(x - x1 ) yields , which is equivalent to . Adding  to both
sides of this equation yields 4/5 x + y = 32/5 . Multiplying both sides of this equation by -10 yields -8x - 10y = -64. Therefore, an equation
of this line is -8x - 10y = -64. Similarly, the other line shown in the graph passes through the points and (3, 2) . Substituting 8 for x1 ,
-((82^(,))/5 0)
0 for y1 , 3 for x2, and 2 for y2 in the equation  yields m = (2-o)/(3-8) , or m = - 2/5 . Substituting  for m8,  for x1 , and 0 for y1 in the
y - 0 =m-=2/5(y2-y1)/(x(x2 --x1)8)
equation y - y1 = m(x - x1 ) yields , which is equivalent to y = - 2/5 x + 16/5 . Adding 2/5 x to both sides of this equation
yields . Multiplying both sides of this equation by 10 yields 4x + 10y = 32. Therefore, an equation of this line is
4x + 2/150xy+=y32= 16/5
. So, the system of linear equations represented by the lines shown is 4x + 10y = 32 and -8x - 10y = -64.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3d1070c9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 25x + 30. What is the value of f(x) when x = 2?$qb$, null, $qb$[{"label": "A", "body": "50"}, {"label": "B", "body": "57"}, {"label": "C", "body": "80"}, {"label": "D", "body": "110"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the function f is defined by f(x) = 25x + 30. Substituting 2 for x in this equation yields f(2) = 25(2)
+ 30, which is equivalent to f(2) = 50 + 30, or f(2) = 80. Therefore, the value of f(x) is 80 when x = 2.
Choice A is incorrect. This is the value of 25(2) , not 25(2) + 30.
Choice B is incorrect. This is the value of 25 + 2 + 30, not 25(2) + 30.
Choice D is incorrect. This is the value of (25 + 30)(2) , not 25(2) + 30.$qb$);
select seed_pool_question($qb$CB-002dba45$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Line k is defined by y = - 17/3 x + 5. Line j is perpendicular to line k in the xy-plane. What is the slope of line j?$qb$, null, null, null, array[$qb$.1764$qb$, $qb$.1765$qb$, $qb$3/17$qb$]::text[], $qb$The correct answer is 3/17 . It’s given that line j is perpendicular to line k in the xy-plane. This means that the slope of line j is the negative
reciprocal of the slope of line k. The equation of line k y = - 17/3 x + 5, , is written in slope-intercept form y = mx + b, where m is the slope of
the line and b is the y-coordinate of the y-intercept of the line. It follows that the slope of line k is - 17/3 . The negative reciprocal of a number is
-1 divided by the number. Therefore, the negative reciprocal of - 17/3 is (-1)/(- 17/3) , or 3/17 . Thus, the slope of line j is 3/17. Note that 3/17, .1764, .1765,
and 0.176 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-edc1b7b7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$2(8x) + 4(7y) = 12
-2(8x) + 4(7y) = 12
The solution to the given system of equations is (x, y) . What is the value of 8x + 7y?$qb$, null, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. Adding the second equation to the first equation in the given system of equations yields (2(8x) - 2(8x))
, or . Dividing both sides of this equation by 8 yields 7y = 3. Substituting 3 for 7y in the first
+ (4(7y)2+(84x()7+y)4) (=7y1)2=+1122 8(72y()8=x)2+44(3) = 12
equation, , yields , or 2(8x) + 12 = 12. Subtracting 12 from both sides of this equation yields 2(8x)
= 0. Dividing both sides of this equation by 2 yields 8x = 0. Substituting 0 for 8x and 3 for 7y in the expression 8x + 7y yields 0 + 3, or 3.
Therefore, the value of 8x + 7y is 3.$qb$);
select seed_pool_question($qb$CB-f224df07$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A cargo helicopter delivers only 100-pound packages and 120-pound packages. For each delivery trip, the helicopter must carry at least 10
packages, and the total weight of the packages can be at most 1,100 pounds. What is the maximum number of 120-pound packages that the
helicopter can carry per trip?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "4"}, {"label": "C", "body": "5"}, {"label": "D", "body": "6"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Let a equal the number of 120-pound packages, and let b equal the number of 100-pound packages. It’s given that the total
weight of the packages can be at most 1,100 pounds: the inequality  represents this situation. It’s also given that the
helicopter must carry at least 10 packages: the inequality  represents this situation. Values of a and b that satisfy these two
inequalities represent the allowable numbers of 120-pound packages and 100-pound packages the helicopter can transport. To maximize the
number of 120-pound packages, a, in the helicopter, the number of 100-pound packages, b, in the helicopter needs to be minimized. Expressing b
in terms of a in the second inequality yields , so the minimum value of b is equal to . Substituting  for b in the first
inequality results in . Using the distributive property to rewrite this inequality yields
, or . Subtracting 1,000 from both sides of this inequality yields .
Dividing both sides of this inequality by 20 results in . This means that the maximum number of 120-pound packages that the helicopter
can carry per trip is 5.
Choices A, B, and D are incorrect and may result from incorrectly creating or solving the system of inequalities.$qb$);
select seed_pool_question($qb$CB-fa80893a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 2x + 3 = 9, what is the value of 6x - 1?$qb$, null, null, null, array[$qb$17$qb$]::text[], $qb$The correct answer is 17. It’s given that 2x + 3 = 9. Multiplying each side of this equation by 3 yields 3(2x + 3) = 3(9), or 6x + 9 = 27.
Subtracting 10 from each side of this equation yields 6x + 9 - 10 = 27 - 10, or 6x - 1 = 17. Therefore, the value of 6x - 1 is 17.$qb$);
select seed_pool_question($qb$CB-bd9eb2b5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 8x. For what value of x does f(x) = 72?$qb$, null, $qb$[{"label": "A", "body": "8"}, {"label": "B", "body": "9"}, {"label": "C", "body": "64"}, {"label": "D", "body": "80"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Substituting 72 for f(x) in the given function yields 72 = 8x. Dividing each side of this equation by 8 yields 9 = x.
Therefore, f (x) = 72 when the value of x is 9.
Choice A is incorrect. This is the value of x for which f (x) = 64, not f (x) = 72.
Choice C is incorrect. This is the value of x for which f (x) = 512, not f (x) = 72.
Choice D is incorrect. This is the value of x for which f (x) = 640, not f (x) = 72.$qb$);
select seed_pool_question($qb$CB-1480dd5c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = 4x + b
For the linear function f, b is a constant and f(7) = 28. What is the value of b?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "4"}, {"label": "D", "body": "7"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. For the linear function f, it’s given that f (7) = 28. Substituting 7 for x and 28 for f(x) in the given function yields 28
= 4 (7) + b, or 28 = 28 + b. Subtracting 28 from each side of this equation yields 0 = b. Therefore, the value of b is 0.
Choice B is incorrect. Substituting 1 for b in the given function yields f (x) = 4x + 1 . For this function, when the value of x is 7, the value of
f(x) is 29, not 28.
Choice C is incorrect. Substituting 4 for b in the given function yields f (x) = 4x + 4. For this function, when the value of x is 7, the value of
f(x) is 32, not 28.
Choice D is incorrect. Substituting 7 for b in the given function yields f (x) = 4x + 7. For this function, when the value of x is 7, the value of
f(x) is 35, not 28.$qb$);
select seed_pool_question($qb$CB-3008cfc3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
k/(?-k + 7 |)?? ||(-y)/13/(--15 |)||
The table gives the coordinates of two points on a line in the xy-plane. The y-intercept of the line is (k - 5, b) , where k and b are constants. What
is the value of b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3008cfc3.png$qb$, null, null, array[$qb$33$qb$]::text[], $qb$The correct answer is 33. It’s given in the table that the coordinates of two points on a line in the xy-plane are (k, 13) and (k + 7, -15). The y-
intercept is another point on the line. The slope computed using any pair of points from the line will be the same. The slope of a line, m, between
any two points, (x1 , y1 ) and (x2 , y2 ) , on the line can be calculated using the slope formula, m = (y2-y1)/(x2 -x1 ) . It follows that the slope of the line
with the given points from the table, and (k + 7, -15) , is m = (-15-13)/(?+7-?) , which is equivalent to , or m = -4. It's given that
(k - 5, b()k^(,) 13) m = (-28)/(^(7)(k) , 13)
the y-intercept of the line is . Substituting -4 for m and the coordinates of the points (k - 5, b) and into the slope formula
yields -4 = (13-b)/(k-(k-5)) , which is equivalent to -4 = (13-b)/(k-?+5) , or -4 = (13-b)/5. Multiplying both sides of this equation by 5 yields -20 = 13 - b.
Subtracting 13 from both sides of this equation yields -33 = -b. Dividing both sides of this equation by -1 yields b = 33. Therefore, the value
of b is 33.$qb$);
select seed_pool_question($qb$CB-0d6ab461$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Gabriella deposits $35 in a savings account at the end of each week. At the beginning of the 1St week of a year there was $600 in that savings
account. How much money, in dollars, will be in the account at the end of the 4th week of that year?$qb$, null, $qb$[{"label": "A", "body": "460"}, {"label": "B", "body": "635"}, {"label": "C", "body": "639"}, {"label": "D", "body": "740"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that at the beginning of the 1St week of the year there was $600 in a savings account and Gabriella deposits $35 in
that savings account at the end of each week. Therefore, the amount of money, in dollars, in the savings account at the end of the 4th week of
that year is 600 + 4(35), or 740.
Choice A is incorrect. This is the amount of money, in dollars, that will be in the account at the end of the 4th week if Gabriella withdraws, rather
than deposits, $35 at the end of each week.
Choice B is incorrect. This is the amount of money, in dollars, that will be in the account at the end of the 1St week, not the 4th week.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4becad44$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$3x = 36y - 45
One of the two equations in a system of linear equations is given. The system has no solution. Which equation could be the second equation in
this system?$qb$, null, $qb$[{"label": "A", "body": "x = 4y"}, {"label": "B", "body": "1/3 x = 4y"}, {"label": "C", "body": "x = 12y - 15"}, {"label": "D", "body": "1/3x = 12y - 15"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A system of two linear equations in two variables, x and y, has no solution when the lines in the xy-plane representing the
equations are parallel and distinct. Two lines are parallel and distinct if their slopes are the same and their y-intercepts are different. The slope of
the graph of the given equation, 3x = 36y - 45, in the xy-plane can be found by rewriting the equation in the form y = mx + b, where m is the
slope of the graph and is the y-intercept. Adding 45 to each side of the given equation yields 3x + 45 = 36y. Dividing each side of this
(1(0)/12 x, b+) 5/4 = y
equation by 36 yields , or y = 1/12 x + 5/4 . It follows that the slope of the graph of the given equation is 1/12 and the y-intercept is
(0, 5/4) . Therefore, the graph of the second equation in the system must also have a slope of 1/12 , but must not have a y-intercept of (0, 5/4) .
Multiplying each side of the equation given in choice B by 1/4 yields 1/12 x = y, or y = 1/12 x. It follows that the graph representing the equation in
choice B has a slope of 1/12 and a y-intercept of (0, 0). Since the slopes of the graphs of the two equations are equal and the y-intercepts of the
graphs of the two equations are different, the equation in choice B could be the second equation in the system.
Choice A is incorrect. This equation can be rewritten as y = 1/4 x. It follows that the graph of this equation has a slope of 1/4 , so the system
consisting of this equation and the given equation has exactly one solution, rather than no solution.
Choice C is incorrect. This equation can be rewritten as y = 1/12 x + 5/4 . It follows that the graph of this equation has a slope of 1/12and a y-
intercept of (0, 5/4) , so the system consisting of this equation and the given equation has infinitely many solutions, rather than no solution.
Choice D is incorrect. This equation can be rewritten as y = 1/36 x + 5/4 . It follows that the graph of this equation has a slope of 1/36 , so the
system consisting of this equation and the given equation has exactly one solution, rather than no solution.$qb$);
select seed_pool_question($qb$CB-cb8f449f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-/(|-?)| ?
The system of equations above has solution (x, y). What is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cb8f449f.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": ""}, {"label": "C", "body": "4"}, {"label": "D", "body": "6"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Adding the corresponding sides of the two equations eliminates y and yields , as shown.
If (x, y) is a solution to the system, then (x, y) satisfies both equations in the system and any equation derived from them. Therefore, .
Choices A, B, and C are incorrect and may be the result of errors when solving the system.$qb$);
select seed_pool_question($qb$CB-3409707e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x + y = 125
x + y + y = 155
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, null, null, array[$qb$30$qb$]::text[], $qb$The correct answer is 30. It’s given that x + y = 125. Substituting 125 for x + y in the second equation of the given system yields 125 + y
= 155. Subtracting 125 from both sides of this equation yields y = 30. Therefore, the value of y is 30.$qb$);
select seed_pool_question($qb$CB-9b7a1b67$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$- (y|)/(-/--/--/--/--/--/---÷÷÷÷1210IIII?6420044662222?? |)|| || || || || || ?||| || || || || || | | x
The graph of line h is shown in the xy-plane. Line k (not shown) is defined by sx + 48y = t, where s and t are constants. If line k is graphed in
this xy-plane, the result is a graph of two linear equations. This system of two linear equations has no solution. Which of the following is NOT a
possible value of t?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9b7a1b67.png$qb$, $qb$[{"label": "A", "body": "-432"}, {"label": "B", "body": "-9"}, {"label": "C", "body": "72"}, {"label": "D", "body": "288"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that if line k is graphed in the xy-plane with line h, the result is the graph of a system of two linear equations that
has no solution. It follows that line h and line k don't intersect. This means that line k and line h have the same slope and different y-intercepts.
The graph shows that the y-intercept of line h is (0, -9). The y-coordinate of the y-intercept of line k is the value of y when x = 0 in the
equation defining line k. Substituting 0 for x in the equation sx + 48y = t yields s (0) + 48y = t, or 48y = t. Dividing both sides of this
equation by 48 yields y = t/48 . Therefore, the y-coordinate of the y-intercept of line k is t/48 , so the y-intercept of line k is . Since line k
(0-, t/(4^(4)3^(8))2)
and line h have different y-intercepts, t/48 can't be equal to -9. It follows that t can't be equal to -9 (48) , or -432. Thus,  isn't a possible
value of t.
Choice B is incorrect. This isn't a possible value of the y-coordinate of the y-intercept of line k, but it is a possible value of t.
Choice C is incorrect. This is the value of s, not a value of t that isn't possible.
Choice D is incorrect. If t = 288, then the y-intercept of line k is (0, 288/48 ) , or (0, 6) , which is different from the y-intercept of line h, (0, -9) .
Therefore, 288 is a possible value of t.$qb$);
select seed_pool_question($qb$CB-520c8177$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A veterinarian recommends that each day a certain rabbit should eat 25 calories per pound of the rabbit’s weight, plus an additional 11 calories.
Which equation represents this situation, where c is the total number of calories the veterinarian recommends the rabbit should eat each day if
the rabbit’s weight is x pounds?$qb$, null, $qb$[{"label": "A", "body": "c = 25x"}, {"label": "B", "body": "c = 36x"}, {"label": "C", "body": "c = 11x + 25"}, {"label": "D", "body": "c = 25x + 11"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that a veterinarian recommends that each day the rabbit should eat 25 calories per pound of the rabbit’s weight,
plus an additional 11 calories. If the rabbit’s weight is x pounds, then multiplying 25 calories per pound by the rabbit’s weight, x pounds, yields
25x calories. Adding the additional 11 calories that the rabbit should eat each day yields 25x + 11 calories. It’s given that c is the total number
of calories the veterinarian recommends the rabbit should eat each day if the rabbit’s weight is x pounds. Therefore, this situation can be
represented by the equation c = 25x + 11.
Choice A is incorrect. This equation represents a situation where a veterinarian recommends that each day the rabbit should eat 25 calories per
pound of the rabbit’s weight.
Choice B is incorrect. This equation represents a situation where a veterinarian recommends that each day the rabbit should eat 25 + 11, or 36,
calories per pound of the rabbit’s weight.
Choice C is incorrect. This equation represents a situation where a veterinarian recommends that each day the rabbit should eat 11 calories per
pound of the rabbit’s weight, plus an additional 25 calories.$qb$);
select seed_pool_question($qb$CB-88e13c8c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The total cost f(x) , in dollars, to lease a car for 36 months from a particular car dealership is given by f(x) = 36x + 1,000, where x is the
monthly payment, in dollars. What is the total cost to lease a car when the monthly payment is $400?$qb$, null, $qb$[{"label": "A", "body": "$13,400"}, {"label": "B", "body": "$13,000"}, {"label": "C", "body": "$15,400"}, {"label": "D", "body": "$37,400"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that f(x) is the total cost, in dollars, to lease a car from this dealership with a monthly payment of x dollars.
Therefore, the total cost, in dollars, to lease the car when the monthly payment is $400 is represented by the value of f(x) when x = 400.
Substituting 400 for x in the equation f(x) = 36x + 1,000 yields f(400) = 36(400) + 1,000, or f(400) = 15,400. Thus, when the
monthly payment is $400, the total cost to lease a car is $15,400.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-744ee7d7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y
60
55
50
45
40
35
?|| || || ???????????? || || || || ?30
25
20
15
10
5
x
 15  10  5 O 5 10 15
The shaded region shown in the graph represents all the solutions to which inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-744ee7d7.png$qb$, $qb$[{"label": "A", "body": "x ≤ 36"}, {"label": "B", "body": "x ≥ 36"}, {"label": "C", "body": "y ≤ 36"}, {"label": "D", "body": "y ≥ 36"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The equation for the line representing the boundary of the shaded region can be written in the form y = b, where (0, b) is the
y-intercept of the line in the xy-plane. For the graph shown in the xy-plane, the boundary line passes through the points (-15, 36) and (0, 36) .
Thus, the equation of the boundary line is y = 36. Since the shaded region represents all the points on and above this boundary line, it follows
that the graph represents all the solutions to the inequality y ≥ 36.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-3cdbf026$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The graph of the equation  is a line in the xy-plane, where a and k are constants. If the line contains the points and
, what is the value of k ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3cdbf026.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "2"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The value of k can be found using the slope-intercept form of a linear equation, , where m is the slope and b is
the y-coordinate of the y-intercept. The equation  can be rewritten in the form . One of the given points,
, is the y-intercept. Thus, the y-coordinate of the y-intercept  must be equal to . Multiplying both sides by k gives .
Dividing both sides by  gives .
Choices B, C, and D are incorrect and may result from errors made rewriting the given equation.$qb$);
select seed_pool_question($qb$CB-00723d16$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Line ℓ is defined by 3y + 12x = 5. Line n is perpendicular to line ℓ in the xy-plane. What is the slope of line n?$qb$, null, null, null, array[$qb$0.25$qb$, $qb$1/4$qb$]::text[], $qb$The correct answer is 1/4 . For an equation in slope-intercept form y = mx + b m,  represents the slope of the line in the xy-plane defined by this
equation. It's given that line ℓ is defined by . Subtracting 12x from both sides of this equation yields 3y = -12x + 5. Dividing
y = 3-y(1+2)/3 x1+2x(5=)/3 5
both sides of this equation by 3 yields , or y = -4x + 5/3 . Thus, the slope of line ℓ in the xy-plane is -4. Since line n is
perpendicular to line ℓ in the xy-plane, the slope of line n is the negative reciprocal of the slope of line ℓ. The negative reciprocal of -4 is -1/(-4)
= 1/4 . Note that 1/4 and .25 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-ff501705$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$3/2 y - 1/4 x = 2/3 - 3/2 y
1/2 x + 3/2 = py + 9/2
In the given system of equations, p is a constant. If the system has no solution, what is the value of p?$qb$, null, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. A system of two linear equations in two variables, x and y, has no solution if the lines represented by the equations in
the xy-plane are parallel and distinct. Lines represented by equations in standard form, Ax + By = C and Dx + Ey = F, are parallel if the
coefficients for x and y in one equation are proportional to the corresponding coefficients in the other equation, meaning ; and the lines
are distinct if the constants are not proportional, meaning  is not equal to or E/B. The first equation in the given system is D/A =3/2E/By36-y1/(4-) x3=x 2/(=3) 8
F/1C8y - 3x = 8 - D/1A8y
. Multiplying each side of this equation by 12 yields . Adding 18y to each side of this equation yields ,
- 3/(-2)3yx + 36y = 8
or . The second equation in the given system is . Multiplying each side of this equation by 2 yields x + 3
1/2xx++3/(3^(2)) -= 2ppyy+=9/29
= 2py + 9. Subtracting 2py from each side of this equation yields . Subtracting 3 from each side of this equation yields x
- 2py = 6. Therefore, the two equations in the given system, written in standard form, are -3x + 36y = 8 and x - 2py = 6. As previously
stated, if this system has no solution, the lines represented by the equations in the xy-plane are parallel and distinct, meaning the proportion 1/(-3)
= (-2p)/36 , or , is true and the proportion 6/8 = 1/(-3) is not true. The proportion 6/8 = 1/(-3) is not true. Multiplying each side of the true
--1/31/3 == --p/18p/18
proportion, , by -18 yields 6 = p. Therefore, if the system has no solution, then the value of p is 6.$qb$);
select seed_pool_question($qb$CB-8c5e6702$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A window repair specialist charges $220 for the first two hours of repair plus an hourly fee for each additional hour. The total cost for 5 hours of
repair is $400. Which function f gives the total cost, in dollars, for x hours of repair, where x ≥ 2?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 60x + 100"}, {"label": "B", "body": "f(x) = 60x + 220"}, {"label": "C", "body": "f(x) = 80x"}, {"label": "D", "body": "f(x) = 80x + 220"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the window repair specialist charges $220 for the first two hours of repair plus an hourly fee for each
additional hour. Let n represent the hourly fee for each additional hour after the first two hours. Since it’s given that x is the number of hours of
repair, it follows that the charge generated by the hourly fee after the first two hours can be represented by the expression n(x - 2). Therefore,
the total cost, in dollars, for x hours of repair is f(x) = 220 + n(x - 2) . It’s given that the total cost for 5 hours of repair is $400. Substituting
5 for x and 400 for f(x) into the equation f(x) = 220 + n(x - 2) yields 400 = 220 + n(5 - 2) , or 400 = 220 + 3n. Subtracting 220
from both sides of this equation yields 180 = 3n. Dividing both sides of this equation by 3 yields n = 60. Substituting 60 for n in the equation
f(x) = 220 + n(x - 2) yields , which is equivalent to f(x) = 220 + 60x - 120, or f(x) = 60x + 100.
f(^(x)) = 220 + 60(^(x) - f2)(x) = 60x + 100
Therefore, the total cost, in dollars, for x hours of repair is .
Choice B is incorrect. This function represents the total cost, in dollars, for x hours of repair where the specialist charges $340, rather than $220,
for the first two hours of repair.
Choice C is incorrect. This function represents the total cost, in dollars, for x hours of repair where the specialist charges $160, rather than $220,
for the first two hours of repair, and an hourly fee of $80, rather than $60, after the first two hours.
Choice D is incorrect. This function represents the total cost, in dollars, for x hours of repair where the specialist charges $380, rather than $220,
for the first two hours of repair, and an hourly fee of $80, rather than $60, after the first two hours.$qb$);
select seed_pool_question($qb$CB-2937ef4f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Hector used a tool called an auger to remove corn from a storage bin at a constant rate. The bin contained 24,000 bushels of corn when Hector
began to use the auger. After 5 hours of using the auger, 19,350 bushels of corn remained in the bin. If the auger continues to remove corn at this
rate, what is the total number of hours Hector will have been using the auger when 12,840 bushels of corn remain in the bin?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "7"}, {"label": "C", "body": "8"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. After using the auger for 5 hours, Hector had removed 24,000 – 19,350 = 4,650 bushels of corn from the storage bin. During
the 5-hour period, the auger removed corn from the bin at a constant rate of  bushels per hour. Assuming the auger continues
to remove corn at this rate, after x hours it will have removed 930x bushels of corn. Because the bin contained 24,000 bushels of corn when
Hector started using the auger, the equation 24,000 – 930x = 12,840 can be used to find the number of hours, x, Hector will have been using the
auger when 12,840 bushels of corn remain in the bin. Subtracting 12,840 from both sides of this equation and adding 930x to both sides of the
equation yields 11,160 = 930x. Dividing both sides of this equation by 930 yields x = 12. Therefore, Hector will have been using the auger for 12
hours when 12,840 bushels of corn remain in the storage bin.
Choice A is incorrect. Three hours after Hector began using the auger, 24,000 – 3(930) = 21,210 bushels of corn remained, not 12,840. Choice B
is incorrect. Seven hours after Hector began using the auger, 24,000 – 7(930) = 17,490 bushels of corn will remain, not 12,840. Choice C is
incorrect. Eight hours after Hector began using the auger, 24,000 – 8(930) = 16,560 bushels of corn will remain, not 12,840.$qb$);
select seed_pool_question($qb$CB-548a4929$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function h is defined by h(x) = 4x + 28. The graph of y = h(x) in the xy-plane has an x-intercept at (a, 0) and a y-intercept at (0, b) ,
where a and b are constants. What is the value of a + b?$qb$, null, $qb$[{"label": "A", "body": "21"}, {"label": "B", "body": "28"}, {"label": "C", "body": "32"}, {"label": "D", "body": "35"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The x-intercept of a graph in the xy-plane is the point on the graph where y = 0. It's given that function h is defined by h(x)
= 4x + 28. Therefore, the equation representing the graph of y = h(x) is y = 4x + 28. Substituting 0 for y in the equation y = 4x + 28
yields 0 = 4x + 28. Subtracting 28 from both sides of this equation yields -28 = 4x. Dividing both sides of this equation by 4 yields -7 = x.
Therefore, the x-intercept of the graph of y = h(x) in the xy-plane is (-7, 0) . It's given that the x-intercept of the graph of y = h(x) is (a, 0).
Therefore, a = -7. The y-intercept of a graph in the xy-plane is the point on the graph where x = 0. Substituting 0 for x in the equation
y = 4x + 28 yields y = 4(0) + 28, or y = 28. Therefore, the y-intercept of the graph of y = h(x) in the xy-plane is (0, 28) . It's given that the
y-intercept of the graph of y = h(x) is (0, b) . Therefore, b = 28. If a = -7 and b = 28, then the value of a + b is -7 + 28, or 21 .
Choice B is incorrect. This is the value of b, not a + b.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of -a + b, not a + b.$qb$);
select seed_pool_question($qb$CB-0adbe034$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 4x - 28 = -24, what is the value of x - 7?$qb$, null, $qb$[{"label": "A", "body": "-24"}, {"label": "B", "body": "-22"}, {"label": "C", "body": "-6"}, {"label": "D", "body": "-1"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Dividing all terms in the given equation by 4 yields 4x/4 - 28/4 = - 24/4 , or x - 7 = -6. Therefore, the value of x - 7 is -6.
Choice A is incorrect. This is the value of 4x - 28, not x - 7.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9bbce683$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
(?--18)/23/(?-26 |)?? |||(-y)/130/160/(-178 |)|||
For line h, the table shows three values of x and their corresponding values of y. Line k is the result of translating line h down 5 units in the xy-
plane. What is the x-intercept of line k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9bbce683.png$qb$, $qb$[{"label": "A", "body": "(- 26/3 , 0)"}, {"label": "B", "body": "(-9/2, 0)"}, {"label": "C", "body": "(- 11/3 , 0)"}, {"label": "D", "body": "(- 17/6 , 0)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The equation of line h can be written in slope-intercept form y = mx + b, where m is the slope of the line and (0, b) is the
y-intercept of the line. It’s given that line h contains the points (18, 130), (23, 160) , and (26, 178). Therefore, its slope m can be found as
, or 6. Substituting 6 for m in the equation y = mx + b yields y = 6x + b. Substituting 130 for y and 18 for x in this equation yields
(160-130)/(13230-=18)6( 18) + b
, or 130 = 108 + b. Subtracting 108 from both sides of this equation yields 22 = b. Substituting 22 for b in y = 6x + b
yields y = 6x + 22. Since line k is the result of translating line h down 5 units, an equation of line k is y = 6x + 22 - 5, or y = 6x + 17.
Substituting 0 for y in this equation yields 0 = 6x + 17. Solving this equation for x yields x = - 17/6 . Therefore, the x-intercept of line k is
(- 17/6 , 0) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2b15d65f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$An economist modeled the demand Q for a certain product as a linear function of the selling price P. The demand was 20,000 units when the
selling price was $40 per unit, and the demand was 15,000 units when the selling price was $60 per unit. Based on the model, what is the
demand, in units, when the selling price is $55 per unit?$qb$, null, $qb$[{"label": "A", "body": "16,250"}, {"label": "B", "body": "16,500"}, {"label": "C", "body": "16,750"}, {"label": "D", "body": "17,500"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Let the economist’s model be the linear function , where Q is the demand, P is the selling price, m is the slope
of the line, and b is the y-coordinate of the y-intercept of the line in the xy-plane, where . Two pairs of the selling price P and the demand Q
are given. Using the coordinate pairs , two points that satisfy the function are  and . The slope m of the
function can be found using the formula . Substituting the given values into this formula yields ,
or . Therefore, . The value of b can be found by substituting one of the points into the function. Substituting
the values of P and Q from the point  yields , or . Adding 10,000 to
both sides of this equation yields . Therefore, the linear function the economist used as the model is .
Substituting 55 for P yields . It follows that when the selling price is $55 per unit, the demand is
16,250 units.
Choices B, C, and D are incorrect and may result from calculation or conceptual errors.$qb$);
select seed_pool_question($qb$CB-e25f0807$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
-/12-/(?-6 |)?? ||(-y)/45-/(-45 |)||
The table shows two values of x and their corresponding values of y. The graph of the linear equation representing this relationship passes
through the point ( 1/4 , a) . What is the value of a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e25f0807.png$qb$, null, null, array[$qb$16.25$qb$, $qb$65/4$qb$]::text[], $qb$The correct answer is 65/4 . The linear relationship between x and y can be represented by the equation y = mx + b, where m and b are
constants. It's given in the table that when x = -12y = -45, . Substituting -12 for x and -45 for y in the equation y = mx + b yields -45
= -12m + b, which can be rewritten as -45 + 12m = b. It's also given in the table that when x = 6, y = 45. Substituting 6 for x and 45 for
y in the equation y = mx + b yields 45 = 6m + b, which can be rewritten as 45 - 6m = b. Substituting -45 + 12m for b in this equation
yields 45 - 6m = -45 + 12m. Adding 6m to both sides of this equation yields 45 = -45 + 18m. Adding 45 to both sides of this equation
yields 90 = 18m. Dividing both sides of this equation by 18 yields 5 = m, or m = 5. Substituting 5 for m, -12 for x, and -45 for y in the
equation y = mx + b yields -45 = 5(-12) + b, or -45 = -60 + b. Adding 60 to both sides of this equation yields 15 = b. Therefore, m
= 5 and b = 15. Substituting 5 for m and 15 for b in the equation y = mx + b yields y = 5x + 15. Thus, the equation y = 5x + 15
represents the linear relationship between x and y. It’s also given that the graph of the linear equation representing this relationship passes
through the point ( 1/4 , a) . Substituting 1/4 for x and a for y in the equation y = 5x + 15 yields a = 5(1/4) + 15, which is equivalent to a = 5/4
+ 15, or a = 65/4 . Note that 65/4 and 16.25 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-686b7244$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A certain apprentice has enrolled in 85 hours of training courses. The equation 10x + 15y = 85 represents this situation, where x is the
number of on-site training courses and y is the number of online training courses this apprentice has enrolled in. How many more hours does
each online training course take than each on-site training course?$qb$, null, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. It's given that the equation 10x + 15y = 85 represents the situation, where x is the number of on-site training courses,
y is the number of online training courses, and 85 is the total number of hours of training courses the apprentice has enrolled in. Therefore, 10x
represents the number of hours the apprentice has enrolled in on-site training courses, and 15y represents the number of hours the apprentice
has enrolled in online training courses. Since x is the number of on-site training courses and y is the number of online training courses the
apprentice has enrolled in, 10 is the number of hours each on-site course takes and 15 is the number of hours each online course takes.
Subtracting these numbers gives 15 - 10, or 5 more hours each online training course takes than each on-site training course.$qb$);
select seed_pool_question($qb$CB-b86123af$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Hiro and Sofia purchased shirts and pants from a store. The price of each shirt purchased was the same and the price of each pair of pants
purchased was the same. Hiro purchased 4 shirts and 2 pairs of pants for $86, and Sofia purchased 3 shirts and 5 pairs of pants for $166. Which
of the following systems of linear equations represents the situation, if x represents the price, in dollars, of each shirt and y represents the price,
in dollars, of each pair of pants?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b86123af.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Hiro purchased 4 shirts and each shirt cost x dollars, so he spent a total of 4x dollars on shirts. Likewise, Hiro purchased 2
pairs of pants, and each pair of pants cost y dollars, so he spent a total of 2y dollars on pants. Therefore, the total amount that Hiro spent was 4x
+ 2y. Since Hiro spent $86 in total, this can be modeled by the equation 4x + 2y = 86. Using the same reasoning, Sofia bought 3 shirts at x dollars
each and 5 pairs of pants at y dollars each, so she spent a total of 3x + 5y dollars on shirts and pants. Since Sofia spent $166 in total, this can be
modeled by the equation 3x + 5y = 166.
Choice B is incorrect and may be the result of switching the number of shirts Sofia purchased with the number of pairs of pants Hiro purchased.
Choice C is incorrect and may be the result of switching the total price each person paid. Choice D is incorrect and may be the result of
switching the total price each person paid as well as switching the number of shirts Sofia purchased with the number of pairs of pants Hiro
purchased.$qb$);
select seed_pool_question($qb$CB-3a3b95df$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$d = 16 - x/3o
The equation shown gives the estimated amount of diesel d, in gallons, that remains in the gas tank of a truck after being driven x miles, where 0
≤ x ≤ 480. What is the estimated amount of diesel, in gallons, that remains in the gas tank of the truck when x = 300?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "6"}, {"label": "C", "body": "14"}, {"label": "D", "body": "16"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the equation d = 16 - x/30 gives the estimated amount of diesel d, in gallons, that remains in the gas tank of
the truck after being driven x miles. Substituting 300 for x in the given equation yields d = 16 - 300/30 , which is equivalent to d = 16 - 10, or
d = 6. Therefore, the estimated amount of diesel that remains in the gas tank of the truck when x = 300 is 6 gallons.
Choice A is incorrect. This is the estimated amount of diesel, in gallons, that will remain in the gas tank of the truck when x = 480, not when
x = 300.
Choice C is incorrect. This is the estimated amount of diesel, in gallons, that will remain in the gas tank of the truck when x = 60, not when
x = 300.
Choice D is incorrect. This is the estimated amount of diesel, in gallons, that will remain in the gas tank of the truck when x = 0, not when
x = 300.$qb$);
select seed_pool_question($qb$CB-1b1deebe$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$ax + by = 72
6x + 2by = 56
In the given system of equations, a and b are constants. The graphs of these equations in the xy-plane intersect at the point (4, y) . What is the
value of a?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "4"}, {"label": "C", "body": "6"}, {"label": "D", "body": "14"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the graphs of the given system of equations intersect at the point (4, y) . Therefore, (4, y) is the solution to the
given system. Multiplying the first equation in the given system by -2 yields -2ax - 2by = -144. Adding this equation to the second
equation in the system yields (-2a + 6)x + (-2b + 2b)y = (-144 + 56) , or (-2a + 6)x = -88. Since (4, y) is the solution to the
system, the value of a can be found by substituting 4 for x in this equation, which yields (-2a + 6)(4) = -88. Dividing both sides of this
equation by 4 yields -2a + 6 = -22. Subtracting 6 from both sides of this equation yields -2a = -28. Dividing both sides of this equation
by -2 yields a = 14.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-187f74bc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y
2
x
 8  6  4  2 O 2 4 6 8
 2
|?|| | || | || | ||???||? || | || | || | || | || ? 4
 6
 8
 10
The shaded region shown represents the solutions to the inequality ry < 60, where r is a constant. What is the value of r?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-187f74bc.png$qb$, $qb$[{"label": "A", "body": "15"}, {"label": "B", "body": "4"}, {"label": "C", "body": "-4"}, {"label": "D", "body": "-15"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The line representing the boundary of the shaded region shown is a horizontal line; therefore, the equation of the line can be
written as y = -4. Since the shaded region represents all of the points above this boundary line, it follows that the shaded region represents the
solutions to the inequality y > -4. It's given that the shaded region shown represents the solutions to the inequality ry < 60, where r is a
constant. The inequality y > -4 can be rewritten in the form ry < 60 by multiplying both sides of the inequality by -15, which yields (-15)y
< 60. Therefore, the value of r is -15.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ee846db7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A store sells two different-sized containers of a certain Greek yogurt. The store’s sales of this Greek yogurt totaled 1,277·94 dollars last month.
The equation 5·48x + 7·30y = 1,277·94 represents this situation, where x is the number of smaller containers sold and y is the number of
larger containers sold. According to the equation, which of the following represents the price, in dollars, of each smaller container?$qb$, null, $qb$[{"label": "A", "body": "5·48"}, {"label": "B", "body": "7·30y"}, {"label": "C", "body": "7·30"}, {"label": "D", "body": "5·48x"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the store's sales of a certain Greek yogurt totaled 1,277·94 dollars last month. It's also given that the equation
5·48x + 7·30y = 1,277·94 represents this situation, where x is the number of smaller containers sold and y is the number of larger containers
sold. Since x represents the number of smaller containers of yogurt sold, the expression 5·48x represents the total sales, in dollars, from
smaller containers of yogurt. This means that x smaller containers of yogurt were sold at a price of 5·48 dollars each. Therefore, according to
the equation, 5·48 represents the price, in dollars, of each smaller container.
Choice B is incorrect. This expression represents the total sales, in dollars, from selling y larger containers of yogurt.
Choice C is incorrect. This value represents the price, in dollars, of each larger container of yogurt.
Choice D is incorrect. This expression represents the total sales, in dollars, from selling x smaller containers of yogurt.$qb$);
select seed_pool_question($qb$CB-baca4a4c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$7(2x - 3) = 63
Which equation has the same solution as the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-baca4a4c.png$qb$, $qb$[{"label": "A", "body": "2x - 3 = 9"}, {"label": "B", "body": "2x - 3 = 56"}, {"label": "C", "body": "2x - 21 = 63"}, {"label": "D", "body": "2x - 21 = 70"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Dividing each side of the given equation by 7 yields (7(2x-3))/7 = 63/7 , or 2x - 3 = 9. Therefore, the equation 2x - 3 = 9 is
equivalent to the given equation and has the same solution.
Choice B is incorrect. This equation is equivalent to 7(2x - 3) = 392, not 7(2x - 3) = 63.
Choice C is incorrect. Distributing 7 on the left-hand side of the given equation yields 14x - 21 = 63, not 2x - 21 = 63.
Choice D is incorrect. Distributing 7 on the left-hand side of the given equation yields 14x - 21 = 63, not 2x - 21 = 70.$qb$);
select seed_pool_question($qb$CB-5b8a8475$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Line k is defined by y = 3x + 15. Line j is perpendicular to line k in the xy-plane. What is the slope of line j?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5b8a8475.png$qb$, $qb$[{"label": "A", "body": "- 1/3"}, {"label": "B", "body": "- 1/12"}, {"label": "C", "body": "- 1/18"}, {"label": "D", "body": "- 1/45"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that line j is perpendicular to line k in the xy-plane. It follows that the slope of line j is the opposite reciprocal of the
slope of line k. The equation for line k is written in slope-intercept form y = mx + b, where m is the slope of the line and b is the y-coordinate
of the y-intercept of the line. It follows that the slope of line k is 3. The opposite reciprocal of a number is -1 divided by the number. Thus, the
opposite reciprocal of 3 is - 1/3 . Therefore, the slope of line j is - 1/3 .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cfe67646$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The point (8, 2) in the xy-plane is a solution to which of the following systems of inequalities?$qb$, null, $qb$[{"label": "A", "body": "x > 0 y > 0"}, {"label": "B", "body": "x > 0 y < 0"}, {"label": "C", "body": "x < 0 y > 0"}, {"label": "D", "body": "x < 0 y < 0"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given point, (8, 2), is located in the first quadrant in the xy-plane. The system of inequalities in choice A represents all
the points in the first quadrant in the xy-plane. Therefore, (8, 2) is a solution to the system of inequalities in choice A.
Alternate approach: Substituting 8 for x in the first inequality in choice A, x > 0, yields 8 > 0, which is true. Substituting 2 for y in the second
inequality in choice A, y > 0, yields 2 > 0, which is true. Since the coordinates of the point (8, 2) make the inequalities x > 0 and y > 0 true,
the point (8, 2) is a solution to the system of inequalities consisting of x > 0 and y > 0.
Choice B is incorrect. This system of inequalities represents all the points in the fourth quadrant, not the first quadrant, in the xy-plane.
Choice C is incorrect. This system of inequalities represents all the points in the second quadrant, not the first quadrant, in the xy-plane.
Choice D is incorrect. This system of inequalities represents all the points in the third quadrant, not the first quadrant, in the xy-plane.$qb$);
select seed_pool_question($qb$CB-608eeb6e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$5x = 15
-4x + y = -2
The solution to the given system of equations is (x, y) . What is the value of x + y?$qb$, null, $qb$[{"label": "A", "body": "-17"}, {"label": "B", "body": "-13"}, {"label": "C", "body": "13"}, {"label": "D", "body": "17"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Adding the second equation of the given system to the first equation yields 5x + (-4x + y) = 15 + (-2) , which is
equivalent to x + y = 13. So the value of x + y is 13.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of -(x + y).
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-be9cb6a2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The cost of renting a backhoe for up to 10 days is $270 for the first day and $135 for each additional day. Which of the following equations
gives the cost y, in dollars, of renting the backhoe for x days, where x is a positive integer and x ≤ 10?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-be9cb6a2.png$qb$, $qb$[{"label": "A", "body": "y = 270x - 135"}, {"label": "B", "body": "y = 270x + 135"}, {"label": "C", "body": "y = 135x + 270"}, {"label": "D", "body": "y = 135x + 135"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the cost of renting a backhoe for up to 10 days is $270 for the first day and $135 for each additional day.
Therefore, the cost y, in dollars, for x days, where x ≤ 10, is the sum of the cost for the first day, $270, and the cost for the additional x - 1
days, $135(x - 1) . It follows that y = 270 + 135(x - 1), which is equivalent to y = 270 + 135x - 135, or y = 135x + 135.
Choice A is incorrect. This equation represents a situation where the cost of renting a backhoe is $135 for the first day and $270 for each
additional day.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-097e10f5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What value of p satisfies the equation 5p + 180 = 250?$qb$, null, $qb$[{"label": "A", "body": "14"}, {"label": "B", "body": "65"}, {"label": "C", "body": "86"}, {"label": "D", "body": "250"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Subtracting 180 from both sides of the given equation yields 5p = 70. Dividing both sides of this equation by 5 yields
p = 14. Therefore, the value of p that satisfies the equation 5p + 180 = 250 is 14.
Choice B is incorrect. This value of p satisfies the equation 5p + 180 = 505.
Choice C is incorrect. This value of p satisfies the equation 5p + 180 = 610.
Choice D is incorrect. This value of p satisfies the equation 5p + 180 = 1,430.$qb$);
select seed_pool_question($qb$CB-1a1a95de$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$tS?Sa
f?tOpe??
????IIIIIIII0044442040608066662222880000000000000000?/(202200 444000 606600 808800 ?II0000 ?II2200 ?II4400 ?II6600)|?|| || || || || || || || || || || || || || || || |x
b?m^(?)e?
Number0? ?^(?)t?PeStarS
A certain open star cluster contains M-type stars and K-type stars. The estimated total mass of M-type and K-type stars in this open star cluster
is 127,882quettagramS. The graph shown models the possible combinations of the number of M-type stars, x, and K-type stars, y, that could
be in this open star cluster if all the M-type stars have the same estimated mass and all the K-type stars have the same estimated mass. Based
on the graph, which of the following is closest to the estimated mass, in quettagrams, of each M-type star in this cluster?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1a1a95de.png$qb$, $qb$[{"label": "A", "body": "811"}, {"label": "B", "body": "938"}, {"label": "C", "body": "51,904"}, {"label": "D", "body": "75,978"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The x-intercept of the graph shown represents the situation in which the cluster contains only M-type stars. Based on the
graph, the x-intercept is approximately (158, 0) . Therefore, if there are 0 K-type stars in the cluster, then there are approximately 158 M-type
stars in the cluster. It’s given that the total mass of the stars in this cluster is 127,882 quettagrams. Therefore, the estimated mass of each M-
type star is approximately (127,882)/158 quettagrams, or approximately 809·38 quettagrams. Thus, of the given choices, 811 is the closest to the
estimated mass, in quettagrams, of each M-type star in this cluster.
Choice B is incorrect. This is the value closest to the estimated mass, in quettagrams, of each K-type star, not each M-type star, in this cluster.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-84664a7c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The front of a roller-coaster car is at the bottom of a hill and is 15 feet above the ground. If the front of the roller-coaster car rises at a constant
rate of 8 feet per second, which of the following equations gives the height h, in feet, of the front of the roller-coaster car s seconds after it starts
up the hill?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-84664a7c.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the front of the roller-coaster car starts rising when it’s 15 feet above the ground. This initial height of 15 feet
can be represented by a constant term, 15, in an equation. Each second, the front of the roller-coaster car rises 8 feet, which can be represented
by 8s. Thus, the equation  gives the height, in feet, of the front of the roller-coaster car s seconds after it starts up the hill.
Choices B and C are incorrect and may result from conceptual errors in creating a linear equation. Choice D is incorrect and may result from
switching the rate at which the roller-coaster car rises with its initial height.$qb$);
select seed_pool_question($qb$CB-b0fc3166$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(12?456446622??55II)/(-/--/--/--/--/-(?666 -555 -444 -333 -222 -1II ?- 1II 222 333 444 555 666)/-÷??÷÷÷65??21??66223355II)|| || || || || ?|| | || || || || || || | x
The graph of a system of linear equations is shown. What is the solution (x, y) to the system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b0fc3166.png$qb$, $qb$[{"label": "A", "body": "(0, 3)"}, {"label": "B", "body": "(1, 3)"}, {"label": "C", "body": "(2, 3)"}, {"label": "D", "body": "(3, 3)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The solution to this system of linear equations is represented by the point that lies on both lines shown, or the point of
intersection of the two lines. According to the graph, the point of intersection occurs when x = 2 and y = 3, or at the point (2, 3) . Therefore, the
solution (x, y) to the system is (2, 3).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9b886541$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 3x - 8 = 7, what is the value of 3x + 8?$qb$, null, $qb$[{"label": "A", "body": "-1"}, {"label": "B", "body": "5"}, {"label": "C", "body": "13"}, {"label": "D", "body": "23"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that 3x - 8 = 7. Adding 8 to both sides of this equation yields 3x = 15. Adding 8 to both sides of this equation
yields 3x + 8 = 23. Therefore, the value of 3x + 8 is 23.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of x, not 3x + 8.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-465c73ad$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$10x = 86
What value of x is the solution to the given equation?$qb$, null, null, null, array[$qb$8.6$qb$, $qb$43/5$qb$]::text[], $qb$The correct answer is 8·6. Dividing both sides of the given equation by 10 yields x = 8·6. Therefore, 8·6 is the solution to the given equation.
Note that 8.6 and 43/5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-db422e7f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Line p is defined by 4y + 8x = 6. Line r is perpendicular to line p in the xy-plane. What is the slope of line r?$qb$, null, null, null, array[$qb$.5$qb$, $qb$1/2$qb$]::text[], $qb$The correct answer is 1/2 . For an equation in slope-intercept form y = mx + b m,  represents the slope of the line in the xy-plane defined by this
equation. It's given that line p is defined by . Subtracting 8x from both sides of this equation yields 4y = -8x + 6. Dividing both
y = - 8/4 x4y+ (+6)/48x = 6
sides of this equation by 4 yields , or y = -2x + 3/2 . Thus, the slope of line p is -2. If line r is perpendicular to line p, then the
slope of line r is the negative reciprocal of the slope of line p. The negative reciprocal of -2 is - 1/(-2) = 1/2 . Note that 1/2 and .5 are examples
of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-590f2187$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 3x - 27 = 24, what is the value of x - 9?$qb$, null, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "8"}, {"label": "C", "body": "24"}, {"label": "D", "body": "35"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Dividing each side of the given equation by 3 yields x - 9 = 8. Therefore, the value of x - 9 is 8.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of 3x - 27, not x - 9.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-01682aa5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Line p is defined by 2y + 18x = 9. Line r is perpendicular to line p in the xy-plane. What is the slope of line r?$qb$, null, $qb$[{"label": "A", "body": "-9"}, {"label": "B", "body": "- 1/9"}, {"label": "C", "body": "1/9"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that line r is perpendicular to line p in the xy-plane. This means that the slope of line r is the negative reciprocal of
the slope of line p. If the equation for line p is rewritten in slope-intercept form y = mx + b, where m and b are constants, then m is the slope
of the line and (0, b) is its y-intercept. Subtracting 18x from both sides of the equation 2y + 18x = 9 yields 2y = -18x + 9. Dividing both
sides of this equation by 2 yields y = -9x + 9/2. It follows that the slope of line p is -9. The negative reciprocal of a number is -1 divided by
the number. Therefore, the negative reciprocal of -9 is (-1)/(-9) , or 1/9 . Thus, the slope of line r is 1/9 .
Choice A is incorrect. This is the slope of line p, not line r.
Choice B is incorrect. This is the reciprocal, not the negative reciprocal, of the slope of line p.
Choice D is incorrect. This is the negative, not the negative reciprocal, of the slope of line p.$qb$);
select seed_pool_question($qb$CB-9b0a4eae$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$10121416?2022II11IIII11246800004444666622228888?(?|)/(222 444 666 888 10II0012II2214II4416II66 ?II88202200)| || || || || || || || || || || || || || || || || || || || || |x
The graph in the xy-plane models the possible combinations of length x, in meterS (m) , and width y, in meters, for a rectangle with a perimeter
of 36m. Which statement is the best interpretation of the point (8, 10) in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9b0a4eae.png$qb$, $qb$[{"label": "A", "body": "The length is 10m less than the perimeter, and the width is 8m less than the perimeter."}, {"label": "B", "body": "The length is 10m, and the width is 8m."}, {"label": "C", "body": "The length is 8m, and the width is 10m."}, {"label": "D", "body": "The length is 8m less than the perimeter, and the width is 10m less than the perimeter."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the graph in the xy-plane models the possible combinations of length x, in meters (m), and width y, in meters,
for a rectangle with a perimeter of 36 m. Since x represents the length, in meters, and y represents the width, in meters, the point (8, 10) in the
xy-plane represents a rectangle whose length is 8 m and whose width is 10 m.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect. This is an interpretation of the point (10, 8), not (8, 10) .
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-7fac16fb$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 7/10x + 55. What is the value of f(20)?$qb$, null, null, null, array[$qb$69$qb$]::text[], $qb$The correct answer is 69. The value of f(20) can be found by evaluating the function  for x = 20. Substituting 20 for x in
ff(2(0x)) =6 7/910x + 55
this function yields f(20) = 7/1o (20) + 55, or f(20) = 69. Therefore, the value of  is .$qb$);
select seed_pool_question($qb$CB-f2b63f49$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$8x - 7x + 130 = 260
What value of x is the solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f2b63f49.png$qb$, null, null, array[$qb$130$qb$]::text[], $qb$The correct answer is 130. It’s given that 8x - 7x + 130 = 260. Combining like terms on the left-hand side of this equation yields x + 130
= 260. Subtracting 130 from each side of this equation yields x = 130. Therefore, the value of x that's the solution to the given equation is
130.$qb$);
select seed_pool_question($qb$CB-45cfb9de$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Adam’s school is a 20-minute walk or a 5-minute bus ride away from his house. The bus runs once every 30 minutes, and the number of minutes,
w, that Adam waits for the bus varies between 0 and 30. Which of the following inequalities gives the values of w for which it would be faster for
Adam to walk to school?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-45cfb9de.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It is given that w is the number of minutes that Adam waits for the bus. The total time it takes Adam to get to school on a
day he takes the bus is the sum of the minutes, w, he waits for the bus and the 5 minutes the bus ride takes; thus, this time, in minutes, is w + 5. It
is also given that the total amount of time it takes Adam to get to school on a day that he walks is 20 minutes. Therefore, w + 5 > 20 gives the
values of w for which it would be faster for Adam to walk to school.
Choices A and B are incorrect because w – 5 is not the total length of time for Adam to wait for and then take the bus to school. Choice C is
incorrect because the inequality should be true when walking 20 minutes is faster than the time it takes Adam to wait for and ride the bus, not
less.$qb$);
select seed_pool_question($qb$CB-06fc1726$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If f is the function defined by , what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-06fc1726.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "3"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. If , then .
Choice A is incorrect and may result from not multiplying x by 2 in the numerator. Choice B is incorrect and may result from dividing 2x by 3 and
then subtracting 1. Choice D is incorrect and may result from evaluating only the numerator 2x – 1.$qb$);
select seed_pool_question($qb$CB-e142f83c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y - 6 = 4/5 (x + 5)
y - v = 4/5 (x + 10)
In the given system of equations, v is a constant. The system has infinitely many solutions. What is the value of v?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e142f83c.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "2"}, {"label": "C", "body": "4"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the system has infinitely many solutions. A system of two linear equations has infinitely many solutions when
the two linear equations are equivalent. Adding 6 to both sides of y - 6 = 4/5 (x + 5) yields . Applying the distributive
y =y4/(5-) (xv =+ 54/5)(+x +6 10)
property to this equation yields y = 4/5 x + 20/5 + 6, or y = 4/5x + 10. Adding v to both sides of  yields y = 4/5 (x + 10)
+ v. Applying the distributive property to this equation yields , or y = 4/5 x + 8 + v. For the equations y = 4/5x + 10 and y
y = 4/5 x + 40/(8^(5)) + v
to be equivalent, it follows that 10 = 8 + v. Subtracting  from both sides of this equation yields 2 = v. Therefore, the value of
= 4/52x + 8 + v
v is .
Choice A is incorrect. If v = 0, the system of equations would have no solution, not infinitely many solutions.
Choice C is incorrect. If v = 4, the system of equations would have no solution, not infinitely many solutions.
Choice D is incorrect. If v = 12, the system of equations would have no solution, not infinitely many solutions.$qb$);
select seed_pool_question($qb$CB-d4572f55$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
(?---34)/17-/(?-0 |)?? |||t/(t 23)+/(-t + 46 |)|||
For a linear relationship between x and y, the table gives three values of x and their corresponding values of y, where t is a constant. Which
equation represents this relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d4572f55.png$qb$, $qb$[{"label": "A", "body": "y = -2x + t + 23"}, {"label": "B", "body": "y = 2x + t + 23"}, {"label": "C", "body": "y = -23/17x + t + 46"}, {"label": "D", "body": "y = 23/17x + t + 46"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that for a linear relationship between x and y, the table gives three values of x and their corresponding values of y.
A linear equation can be written in the form y = mx + b, where m is the slope and (0, b) is the y-intercept of the graph of the equation in the xy-
plane. The slope of a line that passes through the points (x1 , y1 ) and (x2 , y2 ) can be calculated using the formula m = (y2-y1)/(x2 -x1). Substituting (
and  for (x1 , y1 ) and (x2 , y2 ) , respectively, in the formula m = (y2-y1)/(x2 -x1) yields , which is equivalent to
m(0=, t ((t+23)-t)/(+(-4^(17)6))-(-^(34)))
m-3=4, (tt)+23-t()/(-17+34)(2-3)/17 17m, t=+2233/17 t) + 46, or . Based on the table, the graph of this relationship passes through the point . It follows that b = t + 46.
Substituting  for m and  for b in the equation y = mx + b yields y = 23/17x + t + 46. Therefore, the equation y = 23/17x + t + 46
represents this relationship.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-05417146$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$w + 7 = 357
What value of w is the solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "51"}, {"label": "B", "body": "350"}, {"label": "C", "body": "364"}, {"label": "D", "body": "3,577"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 7 from each side of the given equation yields w = 350. Therefore, the value of w that is the solution to the given
equation is 350.
Choice A is incorrect. This is the value of w that is the solution to the equation 7w = 357, not w + 7 = 357.
Choice C is incorrect. This is the value of w that is the solution to the equation w - 7 = 357, not w + 7 = 357.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e3cf671f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 4x + k(x - 1) , where k is a constant, and f(5) = 32. What is the value of f(10) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e3cf671f.png$qb$, null, null, array[$qb$67$qb$]::text[], $qb$The correct answer is 67. It’s given that . Therefore, for the given function f, when x = 5, f(x) = 32. Substituting 5 for x and 32 for
f(x) = 4x +fk(5()x=-312)
f(x) in the given function yields 32 = 4(5) + k(5 - 1) , or 32 = 20 + 4k. Subtracting 20 from each side of this
equation yields 12 = 4k. Dividing each side of this equation by 4 yields k = 3. Substituting 3 for k in the given function f(x) = 4x
+ k(x - 1) yields , which is equivalent to f(x) = 4x + 3x - 3, or f(x) = 7x - 3. Substituting 10 for x into this
f(1f0)(^(x)=) =7(410^(x))+-33(^(x) -f1(1)0) = 67
equation yields , or . Therefore, the value of f(10) is 67.$qb$);
select seed_pool_question($qb$CB-571174f3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$2/5 x + 7/5 y = 2/7
gx + ky = 5/2
In the given system of equations, g and k are constants. The system has infinitely many solutions. What is the value of g/??$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-571174f3.png$qb$, null, null, array[$qb$.2857$qb$, $qb$2/7$qb$]::text[], $qb$The correct answer is 2/7 . It’s given that the system has infinitely many solutions. A system of two linear equations has infinitely many solutions if
and only if the two linear equations are equivalent. Multiplying each side of the first equation in the system by 35/4 yields 35/4 ( 2/5 x + 7/5 y)
= 35/4 ( 2/7 ) , or 7/2 x + 49/4 y = 5/2 . Since this equation is equivalent to the second equation and has the same right side as the second equation, the
coefficients of x and y, respectively, should also be the same. It follows that g = 7/2 and k = 49/4 . Therefore, the value of g/k is (7/2)/(49/4), or 2/7 . Note
that 2/7, .2857, 0.285, and 0.286 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-e723bd67$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$2x - y > 883
For which of the following tables are all the values of x and their corresponding values of y solutions to the given inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e723bd67.png$qb$, $qb$[{"label": "A", "body": "x 441/(|-442 |)|| |||0/2-/(--^(4) |)|||"}, {"label": "B", "body": "x (|--440)/442|| |||(-y)/0-/(--^(4) |)|||"}, {"label": "C", "body": "x (|--442)/440|| |||0/2-/(--^(4) |)|||"}, {"label": "D", "body": "x (|--442)/441/(|-440 |)|| |||0/2-/(--4 |)|||"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. All the tables in the choices have the same three values of x440441, , , and 442, so each of the three values of x can be
substituted in the given inequality to compare the corresponding values of y in each of the tables. Substituting 440 for x in the given inequality
yields 2(440) - y > 883, or 880 - y > 883. Subtracting 880 from both sides of this inequality yields -y > 3. Dividing both sides of this
inequality by -1 yields y < -3. Therefore, when x = 440, the corresponding value of y must be less than -3. Substituting 441 for x in the
given inequality yields 2(441) - y > 883, or 882 - y > 883. Subtracting 882 from both sides of this inequality yields -y > 1 . Dividing both
sides of this inequality by -1 yields y < -1 . Therefore, when x = 441, the corresponding value of y must be less than -1 . Substituting 442 for
x in the given inequality yields 2(442) - y > 883, or 884 - y > 883. Subtracting 884 from both sides of this inequality yields -y > -1 .
Dividing both sides of this inequality by -1 yields y < 1 . Therefore, when x = 442, the corresponding value of y must be less than 1 . For the
table in choice D, when x = 440, the corresponding value of y is -4, which is less than -3; when x = 441, the corresponding value of y is -2,
which is less than -1; when x = 442, the corresponding value of y is 0, which is less than 1. Therefore, the table in choice D gives values of x
and their corresponding values of y that are all solutions to the given inequality.
Choice A is incorrect. When x = 440, the corresponding value of y in this table is 0, which isn't less than -3.
Choice B is incorrect. When x = 440, the corresponding value of y in this table is 0, which isn't less than -3.
Choice C is incorrect. When x = 440, the corresponding value of y in this table is -2, which isn't less than -3.$qb$);
select seed_pool_question($qb$CB-6863c7ce$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$d = 16t
The given equation represents the distance d, in inches, where t represents the number of seconds since an object started moving. Which of the
following is the best interpretation of 16 in this context?$qb$, null, $qb$[{"label": "A", "body": "The object moved a total of 16 inches."}, {"label": "B", "body": "The object moved a total of 16t inches."}, {"label": "C", "body": "The object is moving at a rate of 16 inches per second."}, {"label": "D", "body": "The object is moving at a rate of 1/16 inches per second."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that in the equation d = 16t, d represents the distance, in inches, and t represents the number of seconds since an
object started moving. In this equation, t is being multiplied by 16. This means that the object’s distance increases by 16 inches each second.
Therefore, the best interpretation of 16 in this context is that the object is moving at a rate of 16 inches per second.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect. This is the best interpretation of 16t, rather than 16, in this context.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-979c6ebc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$7x + 6y = 5
28x + 24y = 20
For each real number r, which of the following points lies on the graph of each equation in the xy-plane for the given system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-979c6ebc.png$qb$, $qb$[{"label": "A", "body": "(r, - 6r/7 + 5/7 )"}, {"label": "B", "body": "(r, 7r/6 + 5/6 )"}, {"label": "C", "body": "(r/4 + 5, -r/4 + 20)"}, {"label": "D", "body": "(- 6r/7 + 5/7 , r)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Dividing each side of the second equation in the given system by 4 yields 7x + 6y = 5. It follows that the two equations in
the given system are equivalent and any point that lies on the graph of one equation will also lie on the graph of the other equation. Substituting r
for y in the equation 7x + 6y = 5 yields 7x + 6r = 5. Subtracting 6r from each side of this equation yields 7x = -6r + 5. Dividing each side
of this equation by 7 yields x = - 6r/7 + 5/7 . Therefore, the point (- 6r/7 + 5/7 , r) lies on the graph of each equation in the xy-plane for each real
number r.
Choice A is incorrect. Substituting r for x in the equation 7x + 6y = 5 yields . Subtracting 7r from each side of this equation
y = - 7r7/6 r++5/66y = 5
yields . Dividing each side of this equation by 6 yields . Therefore, the point (r, - 7r/6 + 5/6 ) , not the point
(r, - 66ry/7 += (5-)/7 )7r + 5
, lies on the graph of each equation.
Choice B is incorrect. Substituting r for x in the equation 7x + 6y = 5 yields . Subtracting 7r from each side of this equation
y = - 7r7/6r++56/6 y = 5
yields 6y = -7r + 5. Dividing each side of this equation by 6 yields . Therefore, the point (r, - 7r/6 + 5/6 ) , not the point
(r, 7r/6 + 5/6 ) , lies on the graph of each equation.
Choice C is incorrect. Substituting r/4 + 5 for x in the equation 7x + 6y = 5 yields , or (7r/4 + 35) + 6y = 5. Subtracting
6y = -(77(r)/4r/4-+305) + 6y = 5
from each side of this equation yields 6y = -7r/4 - 35 + 5, or . Dividing each side of this equation by 6 yields
y( 7r/(=4) +- 37r5/24 )- 5
. Therefore, the point ( r/4 + 5, - 7r/24 - 5) , not the point (r/4 + 5, -r/4 + 20), lies on the graph of each equation.$qb$);
select seed_pool_question($qb$CB-51aabd93$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$(p + 3) + 8 = 10
What value of p is the solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "-1"}, {"label": "B", "body": "5"}, {"label": "C", "body": "15"}, {"label": "D", "body": "21"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Subtracting 8 from both sides of the given equation yields p + 3 = 2. Subtracting 3 from both sides of this equation yields
p = -1.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a5834ea4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = 39
For the given linear function f, which table gives three values of x and their corresponding values of f(x)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a5834ea4.png$qb$, $qb$[{"label": "A", "body": "x 0/1||| |||0/(-0 |)|||"}, {"label": "B", "body": "x 1/(|-^(2) |)||| |||39/39|||"}, {"label": "C", "body": "x 0/1||| |||39/(-78 |)|||"}, {"label": "D", "body": "x -/0||| |||(-f(x))/390/(--39 |)|||"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For the given linear function ff(x),  must equal 39 for all values of x. Of the given choices, only choice B gives three values
of x and their corresponding values of f(x) for the given linear function f.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-f14484a5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A manufacturing plant makes 10-inch, 9-inch, and 7-inch frying pans. During a certain day, the number of 10-inch frying pans that the
manufacturing plant makes is 4 times the number n of 9-inch frying pans it makes, and the number of 7-inch frying pans it makes is 10. During
this day, the manufacturing plant makes 100 frying pans total. Which equation represents this situation?$qb$, null, $qb$[{"label": "A", "body": "10(4n) + 9n + 7(10) = 100"}, {"label": "B", "body": "10n + 9n + 7n = 100"}, {"label": "C", "body": "4n + 10 = 100"}, {"label": "D", "body": "5n + 10 = 100"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that during a certain day, the number of 9-inch frying pans the manufacturing plant makes is n and the number of 7
-inch frying pans it makes is 10. It's also given that during this day the number of 10-inch frying pans that the manufacturing plant makes is 4
times the number of 9-inch frying pans, or 4n. Therefore, the total number of 7-inch, 9-inch, and 10-inch frying pans the manufacturing plant
makes is n + 10 + 4n, or 5n + 10. It's given that during this day the manufacturing plant makes 100 frying pans total. Thus, the equation 5n
+ 10 = 100 represents this situation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b52e5b6f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A mixture consisting of only vitamin D and calcium has a total mass of 150 grams. The mass of vitamin D in the mixture is 50 grams. What is the
mass, in grams, of calcium in the mixture?$qb$, null, $qb$[{"label": "A", "body": "200"}, {"label": "B", "body": "150"}, {"label": "C", "body": "100"}, {"label": "D", "body": "50"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Let d represent the mass, in grams, of vitamin D in the mixture, and let c represent the mass, in grams, of calcium in the
mixture. It’s given that the mixture consists of only vitamin D and calcium and that the total mass of the mixture is 150 grams. Therefore, the
equation d + c = 150 represents this situation. It’s also given that the mass of vitamin D in the mixture is 50 grams. Substituting 50 for d in the
equation d + c = 150 yields 50 + c = 150. Subtracting 50 from both sides of this equation yields c = 100. Therefore, the mass of calcium in
the mixture is 100 grams.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the total mass, in grams, of the mixture, not the mass, in grams, of calcium in the mixture.
Choice D is incorrect. This is the mass, in grams, of vitamin D in the mixture, not the mass, in grams, of calcium in the mixture.$qb$);
select seed_pool_question($qb$CB-0b332f00$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function g is defined by g(x) = 6x. For what value of x is g(x) = 54?$qb$, null, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. It’s given that g(x) = 6x. Substituting 54 for g(x) in the given function yields 54 = 6x. Dividing both sides of this
equation by 6 yields x = 9. Therefore, the value of x when g(x) = 54 is 9.$qb$);
select seed_pool_question($qb$CB-349a5bc1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$4x + 5 = 165
What is the solution to the given equation?$qb$, null, null, null, array[$qb$40$qb$]::text[], $qb$The correct answer is 40. Subtracting 5 from both sides of the given equation yields 4x = 160. Dividing both sides of this equation by 4 yields x
= 40. Therefore, the solution to the given equation is 40.$qb$);
select seed_pool_question($qb$CB-c10ad793$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$- -/--/-|?| | | | | | | | ÷÷|844844448888 | | | | x
The graph of the linear function f is shown, where y = f(x). What is the x-intercept of the graph of f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c10ad793.png$qb$, $qb$[{"label": "A", "body": "(-12, 0)"}, {"label": "B", "body": "(0, 0)"}, {"label": "C", "body": "(1/4, 0)"}, {"label": "D", "body": "(12, 0)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The x-intercept of a graph is the point where the graph intersects the x-axis. The graph of function f, where y = f(x),
intersects the x-axis at (-12, 0). Therefore, the x-intercept of the graph of f is (-12, 0).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8b9960b2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The owner of a bakery is giving away free muffins every hour. The equation f (x) = 108 - 9x gives the number of free muffins, f(x), that
remain to be given away after x hours. Which of the following is the best interpretation of f (12) = 0 in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8b9960b2.png$qb$, $qb$[{"label": "A", "body": "The owner of the bakery has 12 free muffins to give away."}, {"label": "B", "body": "The owner of the bakery will give away 12 free muffins in 9 hours."}, {"label": "C", "body": "It will take 12 hours to give away all the free muffins."}, {"label": "D", "body": "It will take 108 hours to give away 12 free muffins."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the equation f(x) = 108 - 9x represents the number of free muffins that remain to be given away after x
hours. For the given equation f(12) = 0, when the value of x is 12, the value of f(x) is 0. It follows that after 12 hours there are 0 free muffins
remaining to be given away. Therefore, based on this context, it will take 12 hours to give away all the free muffins.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This represents giving away 12 muffins over 108 hours rather than giving away all 108 muffins in 12 hours.$qb$);
select seed_pool_question($qb$CB-bf4a8b6a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A company that provides whale-watching tours takes groups of 21 people at a time. The company’s revenue is 80 dollars per adult and 60
dollars per child. If the company’s revenue for one group consisting of adults and children was 1,440 dollars, how many people in the group were
children?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "9"}, {"label": "C", "body": "12"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Let x represent the number of children in a whale-watching tour group. Let y represent the number of adults in this group.
Because it's given that 21 people are in a group and the group consists of adults and children, it must be true that x + y = 21. Since the
company's revenue is 60 dollars per child, the total revenue from x children in this group was 60x dollars. Since the company's revenue is 80
dollars per adult, the total revenue from y adults in this group was 80y dollars. Because it's given that the total revenue for this group was 1,440
dollars, it must be true that 60x + 80y = 1,440. The equations x + y = 21 and 60x + 80y = 1,440 form a linear system of equations that
can be solved to find the value of x, which represents the number of children in the group, using the elimination method. Multiplying both sides
of the equation x + y = 21 by 80 yields 80x + 80y = 1,680. Subtracting 60x + 80y = 1,440 from 80x + 80y = 1,680 yields (80x + 80y)
- (60x + 80y) = 1,680 - 1,440, which is equivalent to 80x - 60x + 80y - 80y = 240, or 20x = 240. Dividing both sides of this equation
by 20 yields x = 12. Therefore, 12 people in the group were children.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the number of adults in the group, not the number of children in the group.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0451d754$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Line k is defined by y = 17/7 x + 4. Line j is parallel to line k in the xy-plane. What is the slope of line j?$qb$, null, $qb$[{"label": "A", "body": "7/17"}, {"label": "B", "body": "17/7"}, {"label": "C", "body": "4"}, {"label": "D", "body": "17"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that line k is defined by y = 17x/7 + 4. For an equation of a line written in the form y = mx + b m,  is the slope of
the line and b is the y-coordinate of the y-intercept of the line. It follows that the slope of line k is 17/7 . It's also given that line j is parallel to line k
in the xy-plane. Since parallel lines have equal slopes, line j also has a slope of 17/7 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the y-coordinate of the y-intercept of line k, not the slope of line j.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-797a81fb$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-12x + 14y = 36
-6x + 7y = -18
How many solutions does the given system of equations have?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A system of two linear equations in two variables, x and y, has zero solutions if the lines representing the equations in the
xy-plane are distinct and parallel. Two lines are distinct and parallel if they have the same slope but different y-intercepts. Each equation in the
given system can be written in slope-intercept form y = mx + b, where m is the slope of the line representing the equation in the xy-plane and
(0, b) is the y-intercept. Adding 12x to both sides of the first equation in the given system of equations, -12x + 14y = 36, yields 14y = 12x
+ 36. Dividing both sides of this equation by 14 yields y = 6/7 x + 18/7 . It follows that the first equation in the given system of equations has a
slope of 6/7 and a y-intercept of (0, 18/7 ) . Adding 6x to both sides of the second equation in the given system of equations, -6x + 7y = -18,
yields 7y = 6x - 18. Dividing both sides of this equation by 7 yields y = 6/7 x - 18/7 . It follows that the second equation in the given system of
equations has a slope of 6/7 and a y-intercept of (0, - 18/7 ) . Since the slopes of these lines are the same and the y-intercepts are different, it
follows that the given system of equations has zero solutions.
Alternate approach: To solve the system by elimination, multiplying the second equation in the given system of equations, -6x + 7y = -18, by
-2 yields 12x - 14y = 36. Adding this equation to the first equation in the given system of equations, -12x + 14y = 36, yields (-12x
+ 12x) + (-14y + 14y) = 36 + 36, or 0 = 72. Since this equation isn't true, the given system of equations has zero solutions.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4f1342d6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In August, a car dealer completed 15 more than 3 times the number of sales the car dealer completed in September. In August and September,
the car dealer completed 363 sales. How many sales did the car dealer complete in September?$qb$, null, null, null, array[$qb$87$qb$]::text[], $qb$The correct answer is 87. It’s given that in August, the car dealer completed 15 more than 3 times the number of sales the car dealer completed
in September. Let x represent the number of sales the car dealer completed in September. It follows that 3x + 15 represents the number of
sales the car dealer completed in August. It’s also given that in August and September, the car dealer completed 363 sales. It follows that x
+ (3x + 15) = 363, or 4x + 15 = 363. Subtracting 15 from each side of this equation yields 4x = 348. Dividing each side of this equation
by 4 yields x = 87. Therefore, the car dealer completed 87 sales in September.$qb$);
select seed_pool_question($qb$CB-7e3f8363$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, the graph of the linear function f contains the points (0, 3) and (7, 31) . Which equation defines f, where y= f(x) ?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 28x + 34"}, {"label": "B", "body": "f(x) = 3x + 38"}, {"label": "C", "body": "f(x) = 4x + 3"}, {"label": "D", "body": "f(x) = 7x + 3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. In the xy-plane, an equation of the graph of a linear function can be written in the form f(x) = mx + b, where m represents
the slope and (0, b) represents the y-intercept of the graph of y= f(x) . It’s given that the graph of the linear function f, where , in
the xy-plane contains the point . Thus, b = 3. The slope of the graph of a line containing any two points (^(x1,) y^(1))(0, 3)(^(x2,)yy(^(2)=7), 3f1(^(x)) ) and  can be
m(0 ,=3 ) (y2-y1)/(x2 -x1)
found using the slope formula, . Since it’s given that the graph of the linear function f contains the points  and , it
follows that the slope of the graph of the line containing these points is m = (31-3)/(7-0) , or m = 4. Substituting 4 for m and 3 for b in f(x) = mx
+ b yields f(x) = 4x + 3.
Choice A is incorrect. This function represents a graph with a slope of 28 and a y-intercept of (0, 34) .
Choice B is incorrect. This function represents a graph with a slope of 3 and a y-intercept of (0, 38) .
Choice D is incorrect. This function represents a graph with a slope of 7 and a y-intercept of (0, 3).$qb$);
select seed_pool_question($qb$CB-cdec4c87$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = 12x - 20
y = 28
What is the solution (x, y) to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(4, 28)"}, {"label": "B", "body": "(20, 28)"}, {"label": "C", "body": "(28, 4)"}, {"label": "D", "body": "(28, 20)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The second equation in the given system is y = 28. Substituting 28 for y in the first equation in the given system yields
28 = 12x - 20. Adding 20 to both sides of this equation yields 48 = 12x. Dividing both sides of this equation by 12 yields 4 = x. Therefore,
the solution (x, y) to the given system of equations is (4, 28).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the solution (y, x) , not (x, y), to the given system of equations.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d11910d6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(10111?345678900447766992288335511)/((?888 -??? -444 -222 ?- 222 444 666 888)/-÷111)||?|| || || || || || || | || || || || || || || || | x
The graph of the linear function f is shown. What is the y-intercept of the graph of y = f(x)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d11910d6.png$qb$, $qb$[{"label": "A", "body": "(-5, 0)"}, {"label": "B", "body": "(2, 0)"}, {"label": "C", "body": "(0, 2)"}, {"label": "D", "body": "(0, -5)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The y-intercept of a graph is the point where the graph intersects the y-axis. The graph of y = f(x) shown intersects the y-
axis at the point (0, 2). Therefore, the y-intercept of the graph of y = f(x) is (0, 2) .
Choice A is incorrect. This is the x-intercept, not the y-intercept, of the graph of y = f(x).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0eae6be1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The number y is 84 less than the number x. Which equation represents the relationship between x and y?$qb$, null, $qb$[{"label": "A", "body": "y = x + 84"}, {"label": "B", "body": "y = 1/84 x"}, {"label": "C", "body": "y = 84x"}, {"label": "D", "body": "y = x - 84"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the number y is 84 less than the number x. A number that's 84 less than the number x is equivalent to 84
subtracted from the number x, or x - 84. Therefore, the equation y = x - 84 represents the relationship between x and y.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-361f97c7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 4x - 3. What is the value of f(10) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-361f97c7.png$qb$, $qb$[{"label": "A", "body": "-30"}, {"label": "B", "body": "37"}, {"label": "C", "body": "40"}, {"label": "D", "body": "43"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the function f is defined by f(x) = 4x - 3. Substituting 10 for x in the given function yields f(10) = 4(10)
- 3, which is equivalent to f(10) = 40 - 3, or f(10) = 37. Therefore, the value of f(10) is 37.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of f(10) for the function f(x) = 4x, not f(x) = 4x - 3.
Choice D is incorrect. This is the value of f(10) for the function f(x) = 4x + 3, not f(x) = 4x - 3.$qb$);
select seed_pool_question($qb$CB-447fa970$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by the equation f(x) = 7x + 2. What is the value of f(x) when x = 4?$qb$, null, null, null, array[$qb$30$qb$]::text[], $qb$The correct answer is 30. The value of f(x) when x = 4 can be found by substituting 4 for x in the given equation f(x) = 7x + 2. This yields
f(4) = 7(4) + 2, or f(4) = 30. Therefore, when x = 4, the value of f(x) is 30.$qb$);
select seed_pool_question($qb$CB-107d0c62$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$0·10x + 0·20y = 0·17 (x + y)
The equation gives a volume x, in gallons, of a 10% solution that could be mixed with a volume y, in gallons, of a 20% solution to produce a
17% solution. According to this equation, what volume, in gallons, of the 20% solution could be mixed with 90·0 gallons of the 10% solution to
produce a 17% solution? (Assume that the volume of the mixture is the sum of the volumes of the two solutions before they were mixed.)$qb$, null, null, null, array[$qb$210$qb$]::text[], $qb$The correct answer is 210. It’s given that the equation  represents mixing a 10% solution and a 20% solution to
0·10x + 0·20y = 0·17(x + y1)0%
obtain a 17% solution. It’s also given that x represents the volume, in gallons, of the  solution. If 90·0 gallons of the 10% solution is used, it
follows that x = 90·0. Substituting 90·0 for x in the given equation yields 0·10(90·0) + 0·20y = 0·17(90·0 + y) , or 9 + 0·20y = 15·3
+ 0·17y. Subtracting 0·17y from both sides of this equation yields 9 + 0·03y = 15·3. Subtracting 9 from both sides of this equation yields
0·03y = 6·3. Dividing both sides of this equation by 0·03 yields y = 210. Therefore, the volume of the 20% solution that could be mixed with
90·0 gallons of the 10% solution to produce a 17% solution is 210 gallons.$qb$);
select seed_pool_question($qb$CB-3dffe9d2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Josie purchased a pass that cost $19·50 to tour a nature preserve. She also purchased 10 identical stickers to give to her nieces and nephews.
The pass and the stickers cost $62·00 total. What was the cost of one sticker?$qb$, null, $qb$[{"label": "A", "body": "$1·95"}, {"label": "B", "body": "$4·25"}, {"label": "C", "body": "$6·20"}, {"label": "D", "body": "$8·15"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that Josie purchased a pass to tour a nature preserve and 10 identical stickers for $62·00 total. It's also given that
the pass cost $19·50. Let x represent the cost, in dollars, of one sticker. This relationship can be represented by the equation 19·50 + 10x
= 62. Subtracting 19·50 from both sides of this equation yields 10x = 42·50. Dividing both sides of this equation by 10 yields x = 4·25.
Therefore, the cost of one sticker was $4·25.
Choice A is incorrect. This is the cost of one sticker if Josie purchased 10 identical stickers for $19·50, not a pass and 10 identical stickers for
$62·00.
Choice C is incorrect. This is the cost of one sticker if Josie purchased 10 identical stickers for $62·00, not a pass and 10 identical stickers for
$62·00.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c039b198$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A computer company pays customers for trading in old computers. The payment p, in dollars, is the original retail price of a computer minus
$150 for each year since the computer was released. Which equation represents this situation for a computer with an original retail price of
$690 when it was released t years ago, where t is a whole number and 1 ≤ t ≤ 4?$qb$, null, $qb$[{"label": "A", "body": "p = 150 - 690t"}, {"label": "B", "body": "p = 690 - 150t"}, {"label": "C", "body": "t = 150 - 690p"}, {"label": "D", "body": "t = 690 - 150p"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the payment p, in dollars, for trading in an old computer is the original retail price of the computer minus $150
for each year since the computer was released t years ago. It's also given that the original retail price of a computer was $690. Thus, the
equation that represents this situation is p = 690 - 150t.
Choice A is incorrect. This equation represents a situation for a computer with an original retail price of $150 minus $690 for each year since the
computer was released.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-55ea0659$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x(r - 9) + 4 = 19x + 27
In the given equation, r is a positive integer. If the given equation has exactly one solution, what CANNOT be the value of r?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-55ea0659.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "9"}, {"label": "C", "body": "23"}, {"label": "D", "body": "28"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. In the given equation, x(r - 9) + 4 = 19x + 27r, is a positive integer. Distributing on the left-hand side of this equation
yields rx - 9x + 4 = 19x + 27. Subtracting 4 from both sides of this equation yields rx - 9x = 19x + 23. Subtracting 19x from both sides
of this equation yields rx - 28x = 23, which can be written as (r - 28)x = 23. For this equation to have exactly one solution, the coefficient
of x, (r - 28) , cannot be equal to 0. Therefore, 28 CANNOT be the value of r.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0dd6227f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$At how many points do the graphs of the equations y = x + 20 and y = 8x intersect in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1"}, {"label": "C", "body": "2"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Each given equation is written in slope-intercept form, y = mx + b, where m is the slope and (0, b) is the y-intercept of the
graph of the equation in the xy-plane. The graphs of two lines that have different slopes will intersect at exactly one point. The graph of the first
equation is a line with slope 1 . The graph of the second equation is a line with slope 8. Since the graphs are lines with different slopes, they will
intersect at exactly one point.
Choice A is incorrect because two graphs of linear equations have 0 intersection points only if they are parallel and therefore have the same
slope.
Choice C is incorrect because two graphs of linear equations in the xy-plane can have only 0, 1, or infinitely many points of intersection.
Choice D is incorrect because two graphs of linear equations in the xy-plane can have only 0, 1, or infinitely many points of intersection.$qb$);
select seed_pool_question($qb$CB-9e5863bd$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a snowstorm in a certain town, the minimum rate of snowfall recorded was 0·6 inches per hour, and the maximum rate of snowfall recorded
was 1·8 inches per hour. Which inequality is true for all values of s, where s represents a rate of snowfall, in inches per hour, recorded for this
snowstorm?$qb$, null, $qb$[{"label": "A", "body": "s ≥ 2·4"}, {"label": "B", "body": "s ≥ 1·8"}, {"label": "C", "body": "0 ≤ s ≤ 0·6"}, {"label": "D", "body": "0·6 ≤ s ≤ 1·8"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that for a snowstorm in a certain town, the minimum rate of snowfall recorded was 0·6 inches per hour, the
maximum rate of snowfall recorded was 1·8 inches per hour, and s represents a rate of snowfall, in inches per hour, recorded for this snowstorm.
It follows that the inequality 0·6 ≤ s ≤ 1·8 is true for all values of s.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-842cec4d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$During a portion of a flight, a small airplane's cruising speed varied between 150 miles per hour and 170 miles per hour. Which inequality best
represents this situation, where s is the cruising speed, in miles per hour, during this portion of the flight?$qb$, null, $qb$[{"label": "A", "body": "s ≤ 20"}, {"label": "B", "body": "s ≤ 150"}, {"label": "C", "body": "s ≤ 170"}, {"label": "D", "body": "150 ≤ s ≤ 170"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that during a portion of a flight, a small airplane's cruising speed varied between 150 miles per hour and 170 miles
per hour. It's also given that s represents the cruising speed, in miles per hour, during this portion of the flight. It follows that the airplane's
cruising speed, in miles per hour, was at least 150, which means s ≥ 150, and was at most 170, which means s ≤ 170. Therefore, the inequality
that best represents this situation is 150 ≤ s ≤ 170.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6105234d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$John paid a total of $165 for a microscope by making a down payment of $37 plus p monthly payments of $16 each. Which of the following
equations represents this situation?$qb$, null, $qb$[{"label": "A", "body": "16p - 37 = 165"}, {"label": "B", "body": "37p - 16 = 165"}, {"label": "C", "body": "16p + 37 = 165"}, {"label": "D", "body": "37p + 16 = 165"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that John made a $16 payment each month for p months. The total amount of these payments can be represented
by the expression 16p. The down payment can be added to that amount to find the total amount John paid, yielding the expression 16p + 37.
It’s given that John paid a total of $165. Therefore, the expression for the total amount John paid can be set equal to that amount, yielding the
equation 16p + 37 = 165.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7efe5495$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 3x
2x + y = 12
The solution to the given system of equations is (x, y) . What is the value of 5x?$qb$, null, $qb$[{"label": "A", "body": "24"}, {"label": "B", "body": "15"}, {"label": "C", "body": "12"}, {"label": "D", "body": "5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given by the first equation in the system that y = 3x. Substituting 3x for y in the equation 2x + y = 12 yields 2x + 3x
= 12, or 5x = 12.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4edecdba$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$8x + 11y = 170
The equation gives the possible combinations of the number of 2009 premium grade Log Cabin Pennies, x, and the number of 1996 select
grade Lincoln Pennies, y, in a collection that is worth a total of $170. If there are 61996 select grade Lincoln Pennies in the collection, how many
2009 premium grade Log Cabin Pennies are in the collection?$qb$, null, null, null, array[$qb$13$qb$]::text[], $qb$The correct answer is 13. It’s given that the equation 8x + 11y = 170 gives the possible combinations of the number of 2009 premium grade
Log Cabin Pennies, x, and the number of 1996 select grade Lincoln Pennies, y, in a collection that is worth a total of $170. It’s also given that
there are 61996 select grade Lincoln Pennies in the collection, and thus y = 6. Substituting 6 for y in the given equation yields 8x + 11(6)
= 170, or 8x + 66 = 170. Subtracting 66 from both sides of this equation yields 8x = 104. Dividing both sides of this equation by 8 yields x
= 13. Therefore, there are 132009 premium grade Log Cabin Pennies in the collection.$qb$);
select seed_pool_question($qb$CB-2c121b25$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Valentina bought two containers of beads. In the first container 30% of the beads are red, and in the second container 70% of the beads are red.
Together, the containers have at least 400 red beads. Which inequality shows this relationship, where x is the total number of beads in the first
container and y is the total number of beads in the second container?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2c121b25.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It is given that x is the total number of beads in the first container and that 30% of those beads are red; therefore, the
expression 0.3x represents the number of red beads in the first container. It is given that y is the total number of beads in the second container
and that 70% of those beads are red; therefore, the expression 0.7y represents the number of red beads in the second container. It is also given
that, together, the containers have at least 400 red beads, so the inequality that shows this relationship is 0.3x + 0.7y ≥ 400.
Choice B is incorrect because it represents the containers having a total of at most, rather than at least, 400 red beads. Choice C is incorrect and
may be the result of misunderstanding how to represent a percentage of beads in each container. Also, the inequality shows the containers
having a combined total of at most, rather than at least, 400 red beads. Choice D is incorrect because the percentages were not converted to
decimals.$qb$);
select seed_pool_question($qb$CB-83f2c3bf$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = x + 4
Which table gives three values of x and their corresponding values of y for the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-83f2c3bf.png$qb$, $qb$[{"label": "A", "body": "x 0/1||| |||(-y)/45/(-6 ?)???"}, {"label": "B", "body": "x 0/1||| |||5/(-4 ?)???"}, {"label": "C", "body": "x -/0||| |||2/1???"}, {"label": "D", "body": "x 0/1||| |||0/1???"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Substituting 0 for x into the given equation yields y = 0 + 4, or y = 4. Therefore, when x = 0, the corresponding value of y
for the given equation is 4. Substituting 1 for x into the given equation yields y = 1 + 4, or y = 5. Therefore, when x = 1, the corresponding
value of y for the given equation is 5. Substituting 2 for x into the given equation yields y = 2 + 4, or y = 6. Therefore, when x = 2, the
corresponding value of y for the given equation is 6. Of the choices given, only the table in choice A gives these three values of x and their
corresponding values of y for the given equation.
Choice B is incorrect. This table gives three values of x and their corresponding values of y for the equation y = -x + 6.
Choice C is incorrect. This table gives three values of x and their corresponding values of y for the equation y = -x + 2.
Choice D is incorrect. This table gives three values of x and their corresponding values of y for the equation y = x.$qb$);
select seed_pool_question($qb$CB-27198699$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$As part of a science project on evaporation, Amaya measured the height of a liquid in a container over a period of time. The function f(x) = 33
- 0·18x gives the estimated height, in centimeters (cm), of the liquid in the container x days after the start of the project. Which of the following
is the best interpretation of 33 in this context?$qb$, null, $qb$[{"label": "A", "body": "The estimated height, in cm, of the liquid at the start of the project"}, {"label": "B", "body": "The estimated height, in cm, of the liquid at the end of the project"}, {"label": "C", "body": "The estimated change in the height, in cm, of the liquid each day"}, {"label": "D", "body": "The estimated number of days for all of the liquid to evaporate"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the function f(x) = 33 - 0·18x gives the estimated height, in centimeters (cm), of the liquid in the container
x days after the start of the project. For a linear function in the form f(x) = a + bx, where a and b are constants, a represents the value of
f(0) and b represents the rate of change of the function. It follows that in the given function, 33 represents the value of f(0) . Therefore, the best
interpretation of 33 in this context is the estimated height, in cm, of the liquid at the start of the project.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. The estimated change in the height, in cm, of the liquid each day is 0·18, not 33.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-00ec9102$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Leo goes to a packing store to buy containers and tape. Leo has $15. Each container costs $1·87 and each roll of tape costs $2·40. Which
inequality represents the relationship between the number of containers, c, and the number of rolls of tape, t, Leo can buy?$qb$, null, $qb$[{"label": "A", "body": "1·87c + 2·40t ≤ 15"}, {"label": "B", "body": "1·87c + 2·40t ≥ 15"}, {"label": "C", "body": "2·40c + 1·87t ≤ 15"}, {"label": "D", "body": "2·40c + 1·87t ≥ 15"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that each container costs $1·87 and c represents the number of containers. It follows that 1·87c represents the
cost, in dollars, of c containers. It's also given that each roll of tape costs $2·40 and t represents the number of rolls of tape. It follows that 2·40t
represents the cost, in dollars, of t rolls of tape. Therefore, the total cost, in dollars, for c containers and t rolls of tape is 1·87c + 2·40t. It's given
that Leo has $15. It follows that the total cost, in dollars, must be less than or equal to 15. Therefore, the inequality 1·87c + 2·40t ≤ 15
represents this relationship.
Choice B is incorrect. This inequality represents a relationship where Leo has at least $15, not at most $15.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f305b5ca$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Lorenzo purchased a box of cereal and some strawberries at the grocery store. Lorenzo paid $2 for the box of cereal and $1·90 per pound for
the strawberries. If Lorenzo paid a total of $9·60 for the box of cereal and the strawberries, which of the following equations can be used to find
p, the number of pounds of strawberries Lorenzo purchased? (Assume there is no sales tax.)$qb$, null, $qb$[{"label": "A", "body": "1·90p + 2 = 9·60"}, {"label": "B", "body": "1·90p - 2 = 9·60"}, {"label": "C", "body": "1·90 + 2p = 9·60"}, {"label": "D", "body": "1·90 - 2p = 9·60"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that p represents the number of pounds of strawberries Lorenzo purchased and Lorenzo paid $1·90 per pound for
the strawberries. It follows that the total amount, in dollars, Lorenzo paid for strawberries can be represented by 1·90p. It’s given that Lorenzo
paid $2 for the box of cereal. If Lorenzo paid a total of $9·60 for the box of cereal and strawberries, it follows that the equation 1·90p + 2
= 9·60 can be used to find p.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-1087f6c4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$24·5x + 24·75y = 641
Isabel ordered topsoil and crushed stone, which cost a total of $641, for her garden. The given equation represents the relationship between the
number of cubic yards of topsoil, x, and the number of tons of crushed stone, y, Isabel ordered. How much more, in dollars, did a ton of crushed
stone cost Isabel than a cubic yard of topsoil?$qb$, null, null, null, array[$qb$0.25$qb$, $qb$1/4$qb$]::text[], $qb$The correct answer is ·25. It’s given that the topsoil and crushed stone Isabel ordered for her garden cost a total of $641. It’s also given that the
equation 24·5x + 24·75y = 641 represents the relationship between the number of cubic yards of topsoil, x, and the number of tons of
crushed stone, y, that Isabel ordered. Since x represents the number of cubic yards of topsoil ordered, 24·5x represents the total cost, in dollars,
of the topsoil, and the cost per cubic yard of topsoil is $24·50. Similarly, since y represents the number of tons of crushed stone ordered, 24·75y
represents the total cost, in dollars, of crushed stone ordered, and the cost per ton of crushed stone is $24·75. Therefore, a ton of crushed stone
cost Isabel 24·75 - 24·50, or 0·25, more dollars than a cubic yard of topsoil. Note that .25 and 1/4 are examples of ways to enter a correct
answer.$qb$);
select seed_pool_question($qb$CB-b5f62071$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$48x - 64y = 48y + 24
ry = 1/8 - 12x
In the given system of equations, r is a constant. If the system has no solution, what is the value of r?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b5f62071.png$qb$, null, null, array[$qb$-28$qb$]::text[], $qb$The correct answer is -28. A system of two linear equations in two variables, x and y, has no solution if the lines represented by the equations
in the xy-plane are distinct and parallel. The graphs of two lines in the xy-plane represented by equations in the form Ax + By = C, where AB, ,
and C are constants, are parallel if the coefficients for x and y in one equation are proportional to the corresponding coefficients for x and y in
the other equation. The first equation in the given system, 48x - 64y = 48y + 24, can be written in the form  by subtracting
ry =A x1/8+-B1y2x= C
48y from both sides of the equation to yield 48x - 112y = 24. The second equation in the given system, , can be written in the
form Ax + By = C by adding 12x to both sides of the equation to yield 12x + ry = 1/8 . The coefficient of x in the second equation is 1/4
times the coefficient of x in the first equation. That is, 48(1/4) = 12. For the lines to be parallel, the coefficient of y in the second equation must
also be 1/4 times the coefficient of y in the first equation. Therefore, -112(1/4) = r, or -28 = r. Thus, if the given system has no solution, the
value of r is -28.$qb$);
select seed_pool_question($qb$CB-4d8ccb96$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A chemist studying the impact of salt on a process mixes x kilograms of a low-salt mixture, which is 2% salt by weight, with y kilograms of a
high-salt mixture, which is 96% salt by weight, to create 24 kilograms of a mixture that is 4% salt by weight. Which equation represents this
situation?$qb$, null, $qb$[{"label": "A", "body": "0·96x + 0·02y = (0·04)(24)"}, {"label": "B", "body": "0·02x + 0·96y = (0·04)(24)"}, {"label": "C", "body": "0·96x + 0·02y = 24"}, {"label": "D", "body": "0·02x + 0·96y = 24"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that a chemist mixes x kilograms of a low-salt mixture, which is 2% salt by weight. Multiplying 0·02 by the amount
of the low-salt mixture, x kilograms, yields 0·02x kilograms of salt in the low-salt mixture. It's also given that the chemist mixes y kilograms of a
high-salt mixture, which is 96% salt by weight. Multiplying 0·96 by the amount of the high-salt mixture, y kilograms, yields 0·96y kilograms of
salt in the high-salt mixture. Therefore, the total amount of salt in the combined mixture is 0·02x + 0·96y kilograms. It's given that the low-salt
mixture and the high-salt mixture together create 24 kilograms of a combined mixture that is 4% salt by weight. Thus, the amount of salt in the
combined mixture is 0·04(24) kilograms. Since the total amount of salt in the combined mixture equals the amount of salt in the low-salt
mixture and the amount of salt in the high-salt mixture, the equation 0·02x + 0·96y = (0·04)(24) represents this situation.
Choice A is incorrect. This equation represents a situation where the low-salt mixture is 96%, not 2%, salt by weight and the high-salt mixture is
2%, not 96%, salt by weight.
Choice C is incorrect. This equation represents a situation where the low-salt mixture is 96%, not 2%, salt by weight and the high-salt mixture is
2%, not 96%, salt by weight, and where the combined mixture contains 24 kilograms of salt, not 24 kilograms of a mixture that is 4% salt by
weight.
Choice D is incorrect. This equation represents a situation where the combined mixture contains 24 kilograms of salt, not 24 kilograms of a
mixture that is 4% salt by weight.$qb$);
select seed_pool_question($qb$CB-c50ede6d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The total cost, in dollars, to rent a surfboard consists of a $25 service fee and a $10 per hour rental fee. A person rents a surfboard for t hours
and intends to spend a maximum of $75 to rent the surfboard. Which inequality represents this situation?$qb$, null, $qb$[{"label": "A", "body": "10t ≤ 75"}, {"label": "B", "body": "10 + 25t ≤ 75"}, {"label": "C", "body": "25t ≤ 75"}, {"label": "D", "body": "25 + 10t ≤ 75"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The cost of the rental fee depends on the number of hours the surfboard is rented. Multiplying t hours by 10 dollars per hour
yields a rental fee of 10t dollars. The total cost of the rental consists of the rental fee plus the 25 dollar service fee, which yields a total cost of
25 + 10t dollars. Since the person intends to spend a maximum of 75 dollars to rent the surfboard, the total cost must be at most 75 dollars.
Therefore, the inequality 25 + 10t ≤ 75 represents this situation.
Choice A is incorrect. This represents a situation where the rental fee, not the total cost, is at most 75 dollars.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c1bd5301$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A model predicts that a certain animal weighed 241 pounds when it was born and that the animal gained 3 pounds per day in its first year of life.
This model is defined by an equation in the form f(x) = a + bx, where f(x) is the predicted weight, in pounds, of the animal x days after it
was born, and a and b are constants. What is the value of a?$qb$, null, null, null, array[$qb$241$qb$]::text[], $qb$The correct answer is 241 . For a certain animal, it's given that a model predicts the animal weighed 241 pounds when it was born and gained 3
pounds per day in its first year of life. It's also given that this model is defined by an equation in the form f(x) = a + bx, where f(x) is the
predicted weight, in pounds, of the animal x days after it was born, and a and b are constants. It follows that a represents the predicted weight,
in pounds, of the animal when it was born and b represents the predicted rate of weight gain, in pounds per day, in its first year of life. Thus, the
value of a is 241.$qb$);
select seed_pool_question($qb$CB-b23bba4c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A shipping company charged a customer $25 to ship some small boxes and some large boxes. The equation above represents the relationship
between a, the number of small boxes, and b, the number of large boxes, the customer had shipped. If the customer had 3 small boxes shipped,
how many large boxes were shipped?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b23bba4c.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "4"}, {"label": "C", "body": "5"}, {"label": "D", "body": "6"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that a represents the number of small boxes and b represents the number of large boxes the customer had
shipped. If the customer had 3 small boxes shipped, then . Substituting 3 for a in the equation  yields
or . Subtracting 9 from both sides of the equation yields . Dividing both sides of this equation by 4 yields .
Therefore, the customer had 4 large boxes shipped.
Choices A, C, and D are incorrect. If the number of large boxes shipped is 3, then . Substituting 3 for b in the given equation yields
or . Subtracting 12 from both sides of the equation and then dividing by 3 yields . However, it’s
given that the number of small boxes shipped, a, is 3, not , so b cannot equal 3. Similarly, if  or , then  or ,
respectively, which is also not true.$qb$);
select seed_pool_question($qb$CB-24854644$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the equation of the line that passes through the point (0, 5) and is parallel to the graph of y = 7x + 4 in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "y = 5x"}, {"label": "B", "body": "y = 7x + 5"}, {"label": "C", "body": "y = 7x"}, {"label": "D", "body": "y = 5x + 7"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The equation of a line in the xy-plane can be written in slope-intercept form y = mx + b, where m is the slope of the line
and (0, b) is its y-intercept. It’s given that the line passes through the point (0, 5). Therefore, b = 5. It’s also given that the line is parallel to the
graph of y = 7x + 4, which means the line has the same slope as the graph of y = 7x + 4. The slope of the graph of y = 7x + 4 is 7.
Therefore, m = 7. Substituting 7 for m and 5 for b in the equation y = mx + b yields y = 7x + 5.
Choice A is incorrect. The graph of this equation passes through the point (0, 0) , not (0, 5), and has a slope of 5, not 7.
Choice C is incorrect. The graph of this equation passes through the point (0, 0) , not (0, 5).
Choice D is incorrect. The graph of this equation passes through the point (0, 7) , not (0, 5), and has a slope of 5, not 7.$qb$);
select seed_pool_question($qb$CB-71189542$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A group of 202 people went on an overnight camping trip, taking 60 tents with them. Some of the tents held 2 people each, and the rest held
4 people each. Assuming all the tents were filled to capacity and every person got to sleep in a tent, exactly how many of the tents were 2-person
tents?$qb$, null, $qb$[{"label": "A", "body": "30"}, {"label": "B", "body": "20"}, {"label": "C", "body": "19"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Let x represent the number of 2-person tents and let y represent the number of 4-person tents. It is given that the total
number of tents was 60 and the total number of people in the group was 202. This situation can be expressed as a system of two equations,
and . The first equation can be rewritten as . Substituting  for y in the equation
yields . Distributing and combining like terms gives . Subtracting 240 from
both sides of  and then dividing both sides by  gives . Therefore, the number of 2-person tents is 19.
Alternate approach: If each of the 60 tents held 4 people, the total number of people that could be accommodated in tents would be 240.
However, the actual number of people who slept in tents was 202. The difference of 38 accounts for the 2-person tents. Since each of these
tents holds 2 people fewer than a 4-person tent,  gives the number of 2-person tents.
Choice A is incorrect. This choice may result from assuming exactly half of the tents hold 2 people. If that were true, then the total number of
people who slept in tents would be ; however, the total number of people who slept in tents was 202, not 180. Choice B
is incorrect. If 20 tents were 2-person tents, then the remaining 40 tents would be 4-person tents. Since all the tents were filled to capacity, the
total number of people who slept in tents would be ; however, the total number of people who slept in
tents was 202, not 200. Choice D is incorrect. If 18 tents were 2-person tents, then the remaining 42 tents would be 4-person tents. Since all the
tents were filled to capacity, the total number of people who slept in tents would be ; however, the total
number of people who slept in tents was 202, not 204.$qb$);
select seed_pool_question($qb$CB-9d4270fe$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A company that creates and sells tape dispensers calculates its monthly profit, in dollars, by subtracting its fixed monthly costs, in dollars, from
its monthly sales revenue, in dollars. The equation 15,000 = 2·00x - 4,500 represents this situation for a month where x tape dispensers are
created and sold. Which statement is the best interpretation of 2·00x in this context?$qb$, null, $qb$[{"label": "A", "body": "The monthly sales revenue, in dollars, from selling x tape dispensers"}, {"label": "B", "body": "The monthly sales revenue, in dollars, from each tape dispenser sold"}, {"label": "C", "body": "The monthly cost, in dollars, of creating each tape dispenser"}, {"label": "D", "body": "The monthly cost, in dollars, of creating x tape dispensers"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the equation 15,000 = 2·00x - 4,500 represents this situation for a month where x tape dispensers are
created and sold. It’s also given that the company calculates its monthly profit, in dollars, by subtracting its fixed monthly costs, in dollars, from
its monthly sales revenue, in dollars. It follows that 2·00x represents the monthly sales revenue, in dollars. Therefore, the best interpretation of
2·00x in this context is the monthly sales revenue from selling x tape dispensers.
Choice B is incorrect. This is the best interpretation of 2·00, not 2·00x.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect. This is the best interpretation of 4,500, not 2·00x.$qb$);
select seed_pool_question($qb$CB-dba8d38a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A petting zoo sells two types of tickets. The standard ticket, for admission only, costs $5. The premium ticket, which includes admission and
food to give to the animals, costs $12. One Saturday, the petting zoo sold a total of 250 tickets and collected a total of $2,300 from ticket sales.
Which of the following systems of equations can be used to find the number of standard tickets, s, and premium tickets, p, sold on that
Saturday?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dba8d38a.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the petting zoo sells two types of tickets, standard and premium, and that s represents the number of standard
tickets sold and p represents the number of premium tickets sold. It’s also given that the petting zoo sold 250 tickets on one Saturday; thus,
. It’s also given that each standard ticket costs $5 and each premium ticket costs $12. Thus, the amount collected in ticket sales
can be represented by  for standard tickets and  for premium tickets. On that Saturday the petting zoo collected a total of $2,300 from
ticket sales; thus, . These two equations are correctly represented in choice A.
Choice B is incorrect. The second equation in the system represents the cost per standard ticket as $12, not $5, and the cost per premium ticket
as $5, not $12. Choices C and D are incorrect. The equations represent the total collected from standard and premium ticket sales as $250, not
$2,300, and the total number of standard and premium tickets sold as $2,300, not $250. Additionally, the first equation in choice D represents the
cost per standard ticket as $12, not $5, and the cost per premium ticket as $5, not $12.$qb$);
select seed_pool_question($qb$CB-59813abf$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$38(x - n) = 38y + 38n
One of the equations in a system of two linear equations is given, where n is a positive constant. The system has no solution. Which equation
could be the second equation in this system?$qb$, null, $qb$[{"label": "A", "body": "4x - 4y = 8n"}, {"label": "B", "body": "4x + 4y = 4n"}, {"label": "C", "body": "4x + 4y = 8n"}, {"label": "D", "body": "4x - 4y = 4n"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A system of two linear equations in two variables, x and y, has no solution if the lines represented by the equations in the xy-
plane are parallel and distinct. Lines represented by equations in standard form, Ax + By = C and Dx + Ey = F, are parallel and distinct if
the coefficients of x and y in one equation are proportional to the corresponding coefficients in the other equation, meaning D/A = E/B , and the
constants are not proportional, meaning F/C is not equal to D/A nor E/B . It's given that one of the equations in a system of two linear equations is
38(x - n) = 38y + 38n, where n is a positive constant. Distributing 38 on the left-hand side of this equation yields 38x - 38n = 38y
+ 38n. Adding 38n to both sides of this equation yields 38x = 38y + 76n. Subtracting 38y from both sides of this equation yields 38x - 38y
= 76n. Therefore, the given equation can be written in the form Ax + By = C, where A = 38B = -38, , and C = 76n. The equation in
choice D, , is written in the form , where D = 4E = -4, , and F = 4n. Using these values, it follows that the
4x -44/38y = 4n Dx(+2)/19Ey = F
value of D/A is , or 2/19 ; the value of E/B is (-4)/(-38) , or ; and the value of F/C is 4n/76n, or 1/19 , since n is a positive constant. Since D/A = E/B and since
F/C is not equal to D/A nor E/B , it follows that the lines represented by these two equations are parallel and distinct. Therefore, the second equation
in this system of equations with no solution could be 4x - 4y = 4n.
Choice A is incorrect. The system consisting of this equation and the given equation has infinitely many solutions rather than no solution.
Choice B is incorrect. The system consisting of this equation and the given equation has one solution rather than no solution.
Choice C is incorrect. The system consisting of this equation and the given equation has one solution rather than no solution.$qb$);
select seed_pool_question($qb$CB-64c85440$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In North America, the standard width of a parking space is at least 7.5 feet and no more than 9.0 feet. A restaurant owner recently resurfaced the
restaurant’s parking lot and wants to determine the number of parking spaces, n, in the parking lot that could be placed perpendicular to a curb
that is 135 feet long, based on the standard width of a parking space. Which of the following describes all the possible values of n ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-64c85440.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Placing the parking spaces with the minimum width of 7.5 feet gives the maximum possible number of parking spaces.
Thus, the maximum number that can be placed perpendicular to a 135-foot-long curb is . Placing the parking spaces with the
maximum width of 9 feet gives the minimum number of parking spaces. Thus, the minimum number that can be placed perpendicular to a 135-
foot-long curb is . Therefore, if n is the number of parking spaces in the lot, the range of possible values for n is .
Choices A and C are incorrect. These choices equate the length of the curb with the maximum possible number of parking spaces. Choice B is
incorrect. This is the range of possible values for the width of a parking space instead of the range of possible values for the number of parking
spaces.$qb$);
select seed_pool_question($qb$CB-0c541d87$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Two customers purchased the same kind of bread and eggs at a store. The first customer paid 12·45 dollars for 1 loaf of bread and 2 dozen
eggs. The second customer paid 19·42 dollars for 4 loaves of bread and 1 dozen eggs. What is the cost, in dollars, of 1 dozen eggs?$qb$, null, $qb$[{"label": "A", "body": "3·77"}, {"label": "B", "body": "3·88"}, {"label": "C", "body": "4·15"}, {"label": "D", "body": "4·34"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Let ℓ represent the cost, in dollars, of 1 loaf of bread, and let d represent the cost, in dollars, of 1 dozen eggs. It’s given that
the first customer paid 12·45 dollars for 1 loaf of bread and 2 dozen eggs. Therefore, the first customer’s purchase can be represented by the
equation ℓ + 2d = 12·45. It’s also given that the second customer paid 19·42 dollars for 4 loaves of bread and 1 dozen eggs. Therefore, the
second customer’s purchase can be represented by the equation 4ℓ + d = 19·42. The equations ℓ + 2d = 12·45 and 4ℓ + d = 19·42 form a
system of linear equations, which can be solved by elimination to find the value of d. Multiplying the first equation in the system by -4 yields
-4ℓ - 8d = -49·8. Adding -4ℓ - 8d = -49·8 to the second equation, 4ℓ + d = 19·42, yields (-4ℓ + 4ℓ) + (-8d + d)
= (-49·8 + 19·42) , which is equivalent to -7d = -30·38. Dividing both sides of this equation by -7 yields d = 4·34. Therefore, the cost, in
dollars, of 1 dozen eggs is 4·34.
Choice A is incorrect. This is the cost, in dollars, of 1 loaf of bread.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-87322577$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The equation above relates the number of minutes, x, Maria spends running each day and the number of minutes, y, she spends biking each day.
In the equation, what does the number 75 represent?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-87322577.png$qb$, $qb$[{"label": "A", "body": "The number of minutes spent running each day"}, {"label": "B", "body": "The number of minutes spent biking each day"}, {"label": "C", "body": "The total number of minutes spent running and biking each day"}, {"label": "D", "body": "The number of minutes spent biking for each minute spent running"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Maria spends x minutes running each day and y minutes biking each day. Therefore,  represents the total number of
minutes Maria spent running and biking each day. Because , it follows that 75 is the total number of minutes that Maria spent
running and biking each day.
Choices A and B are incorrect. The number of minutes Maria spent running each day is represented by x and need not be 75. Similarly, the
number of minutes that Maria spends biking each day is represented by y and need not be 75. The number of minutes Maria spends running
each day and biking each day may vary; however, the total number of minutes she spends each day on these activities is constant and equal to
75. Choice D is incorrect. The number of minutes Maria spent biking for each minute spent running cannot be determined from the information
provided.$qb$);
select seed_pool_question($qb$CB-5c94e6fa$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$3x + 21 = 3x + k
In the given equation, k is a constant. The equation has infinitely many solutions. What is the value of k?$qb$, null, null, null, array[$qb$21$qb$]::text[], $qb$The correct answer is 21 . It's given that the equation 3x + 21 = 3x + k has infinitely many solutions. If an equation in one variable has
infinitely many solutions, then the equation is true for any value of the variable. Subtracting 3x from both sides of the given equation yields
k = 21. Since this equation must be true for any value of x, the value of k is 21 .$qb$);
select seed_pool_question($qb$CB-a130fcdc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$g(x) = 11x + 4
For the given linear function g, which table shows three values of x and their corresponding values of g(x)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a130fcdc.png$qb$, $qb$[{"label": "A", "body": "x -/10/(|-1 ?)||| ???(-g(x))/7|||"}, {"label": "B", "body": "x -/10/(|-1 ?)||| ???(-g(x))/40/(-4 |)|||"}, {"label": "C", "body": "x -/10/(|-1 ?)||| ???(-g(x))/7-/4|||"}, {"label": "D", "body": "x -/10/(|-1 ?)||| ???(-g(x))/110/(-11 |)|||"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Each of the tables shows the same three values of x: -1 , 0, and 1 . Substituting -1 for x in the given function yields g(-1)
, or . Therefore, when x = - 1 , the corresponding value of  is -7. Substituting 0 for x in the given function
= 11(g-(01)) += 411(0g)(+-14) = -7 g(xg)(x)
yields , or g(0) = 4. Therefore, when x = 0, the corresponding value of  is 4. Substituting 1 for x in the given function
yields g(1) = 11(1) + 4, or g(1) = 15. Therefore, when x = 1 , the corresponding value of g(x) is 15. The table in choice C shows -74, , and
15 as the corresponding value of  for x-values of -1, 0, and 1, respectively. Therefore, the table in choice C shows three values of x and
g(xg)(x)
their corresponding values of .
Choice A is incorrect. This table shows three values of x and their corresponding values of g(x) for the linear function g(x) = 4x + 11.
Choice B is incorrect. This table shows three values of x and their corresponding values of g(x) for the linear function g(x) = 4x.
Choice D is incorrect. This table shows three values of x and their corresponding values of g(x) for the linear function g(x) = 11x.$qb$);
select seed_pool_question($qb$CB-7a5a74a6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If x is the solution to the equation above, what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7a5a74a6.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Because 2 is a factor of both  and 6, the expression  can be rewritten as . Substituting  for
on the left-hand side of the given equation yields , or .
Subtracting  from both sides of this equation yields . Adding 11 to both sides of this equation yields
. Dividing both sides of this equation by 2 yields .
Alternate approach: Distributing 3 to the quantity  on the left-hand side of the given equation and distributing 4 to the quantity
on the right-hand side yields , or . Subtracting  from both sides of this equation yields
. Adding 29 to both sides of this equation yields . Dividing both sides of this equation by 2 yields .
Therefore, the value of  is , or .
Choice A is incorrect. This is the value of x, not . Choices C and D are incorrect. If the value of  is  or , it follows that
the value of x is  or , respectively. However, solving the given equation for x yields . Therefore, the value of  can’t be
or .$qb$);
select seed_pool_question($qb$CB-f5563c26$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = 4
x = y+ 6
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "10"}, {"label": "B", "body": "6"}, {"label": "C", "body": "4"}, {"label": "D", "body": "2"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. According to the first equation in the given system, y = 4. Substituting 4 for y in the second equation in the given system
yields x = 4 + 6, or x = 10.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the value of y, not x.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-38bf4e04$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A factory makes 9-inch, 7-inch, and 4-inch concrete screws. During a certain day, the number of 9-inch concrete screws that the factory makes is
5 times the number n of 7-inch concrete screws, and the number of 4-inch concrete screws is 22. During this day, the factory makes 100
concrete screws total. Which equation represents this situation?$qb$, null, $qb$[{"label": "A", "body": "9(5n) + 7n + 4(22) = 100"}, {"label": "B", "body": "9n + 7n + 4n = 100"}, {"label": "C", "body": "5n + 22 = 100"}, {"label": "D", "body": "6n + 22 = 100"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that during a certain day at a factory, the number of 7-inch concrete screws the factory makes is n and the number
of 4-inch concrete screws the factory makes is 22. It's also given that during this day the number of 9-inch concrete screws the factory makes is
5 times the number of 7-inch concrete screws, or 5n. Therefore, the total number of 7-inch, 9-inch, and 4-inch concrete screws is n + 5n + 22,
or 6n + 22. It's given that during this day, the factory makes 100 concrete screws total. Thus, the equation 6n + 22 = 100 represents this
situation.
Choice A is incorrect. This equation represents a situation where the total length, in inches, of all the concrete screws, rather than the total
number of concrete screws, is 100.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This equation represents a situation where the total number of 9-inch concrete screws and 4-inch concrete screws, not
including the 7-inch concrete screws, is 100.$qb$);
select seed_pool_question($qb$CB-e6545fa8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$10II123456789004477669922883355II?-/(-1II| 222| 333| 444| 555| ?66| 777| 888| 999| 10II00|)|??| | | | | | | | | | |x
The graph of a system of linear equations is shown. What is the solution (x, y) to the system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e6545fa8.png$qb$, $qb$[{"label": "A", "body": "(2, 3)"}, {"label": "B", "body": "(3, 4)"}, {"label": "C", "body": "(4, 5)"}, {"label": "D", "body": "(5, 6)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If a point (x, y) lies on both lines in the graph of a system of two linear equations, the ordered pair (x, y) is a solution to the
system. The graph shown is the graph of a system of two linear equations, where the two lines in the graph intersect at the point (3, 4) .
Therefore, the point (3, 4) lies on both lines, so the ordered pair (3, 4) is the solution to the system.
Choice A is incorrect. The point (2, 3) lies on one, not both, of the lines in the graph shown.
Choice C is incorrect. The point (4, 5) lies on one, not both, of the lines in the graph shown.
Choice D is incorrect. The point (5, 6) lies on one, not both, of the lines in the graph shown.$qb$);
select seed_pool_question($qb$CB-b7e6394d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Alan drives an average of 100 miles each week. His car can travel an average of 25 miles per gallon of gasoline. Alan would like to reduce his
weekly expenditure on gasoline by $5. Assuming gasoline costs $4 per gallon, which equation can Alan use to determine how many fewer
average miles, m, he should drive each week?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b7e6394d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since gasoline costs $4 per gallon, and since Alan’s car travels an average of 25 miles per gallon, the expression  gives
the cost, in dollars per mile, to drive the car. Multiplying  by m gives the cost for Alan to drive m miles in his car. Alan wants to reduce his
weekly spending by $5, so setting m equal to 5 gives the number of miles, m, by which he must reduce his driving.
Choices A, B, and C are incorrect. Choices A and B transpose the numerator and the denominator in the fraction. The fraction  would result
in the unit miles per dollar, but the question requires a unit of dollars per mile. Choices A and C set the expression equal to 95 instead of 5, a
mistake that may result from a misconception that Alan wants to reduce his driving by 5 miles each week; instead, the question says he wants to
reduce his weekly expenditure by $5.$qb$);
select seed_pool_question($qb$CB-3c03cbd8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A certain township consists of a 5-hectare industrial park and a 24-hectare neighborhood. The total number of trees in the township is 4,529.
The equation 5x + 24y = 4,529 represents this situation. Which of the following is the best interpretation of x in this context?$qb$, null, $qb$[{"label": "A", "body": "The average number of trees per hectare in the industrial park"}, {"label": "B", "body": "The average number of trees per hectare in the neighborhood"}, {"label": "C", "body": "The total number of trees in the industrial park"}, {"label": "D", "body": "The total number of trees in the neighborhood"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a certain township consists of a 5-hectare industrial park and a 24-hectare neighborhood and that the total
number of trees in the township is 4,529. It's also given that the equation 5x + 24y = 4,529 represents this situation. Since the total number of
trees for a given area can be determined by taking the size of the area, in hectares, times the average number of trees per hectare, the best
interpretation of 5x is the number of trees in the industrial park and the best interpretation of 24y is the number of trees in the neighborhood.
Since 5 is the size of the industrial park, in hectares, the best interpretation of x is the average number of trees per hectare in the industrial park.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-0b221d05$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-/--/--/-| 6| | 4| | 2| ÷÷÷|?4??4?444466662222|?| | ?| | ?| | ?| | | x
The shaded region shown represents the solutions to an inequality. Which ordered pair (x, y) is a solution to this inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0b221d05.png$qb$, $qb$[{"label": "A", "body": "(-5, -6)"}, {"label": "B", "body": "(-2, 5)"}, {"label": "C", "body": "(1, 4)"}, {"label": "D", "body": "(6, -2)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the shaded region shown represents the solutions to an inequality, an ordered pair (x, y) is a solution to the inequality
if it's represented by a point in the shaded region. Of the given choices, only (6, -2) is represented by a point in the shaded region. Therefore, the
ordered pair (6, -2) is a solution to this inequality.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-7625073d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The equation 7g + 7b = 840 represents the number of blue tiles, b, and the number of green tiles, g, an artist needs for an 840-square-inch tile
project. The artist needs 71 blue tiles for the project. How many green tiles does he need?$qb$, null, null, null, array[$qb$49$qb$]::text[], $qb$The correct answer is 49. It’s given that the equation 7g+ 7b = 840 represents the number of blue tiles, b, and the number of green tiles, g, an
artist needs for an 840-square-inch tile project. It’s also given that the artist needs 71 blue tiles for the project. Substituting 71 for b in the
equation 7g+ 7b = 840 yields 7g+ 7(71) = 840, or 7g + 497 = 840. Subtracting 497 from both sides of this equation yields 7g = 343.
Dividing both sides of this equation by 7 yields g = 49. Therefore, the artist needs 49 green tiles for the project.$qb$);
select seed_pool_question($qb$CB-bf36c815$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function g is defined by . What is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bf36c815.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": "0"}, {"label": "C", "body": "4"}, {"label": "D", "body": "8"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The value of  is found by substituting 0 for x in the function g. This yields , which can be rewritten as
.
Choice A is incorrect and may result from misinterpreting the equation as  instead of . Choice B is incorrect.
This is the value of x, not . Choice C is incorrect and may result from calculation errors.$qb$);
select seed_pool_question($qb$CB-c5e38487$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A chemist combines water and acetic acid to make a mixture with a volume of 56miIIiIiterS (m?) . The volume of acetic acid in the mixture is
10m?. What is the volume of water, in m?, in the mixture? (Assume that the volume of the mixture is the sum of the volumes of water and
acetic acid before they were mixed.)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c5e38487.png$qb$, null, null, array[$qb$46$qb$]::text[], $qb$The correct answer is 46. It's given that a chemist combines water and acetic acid to make a mixture with a volume of 56 milliliters (mL) and that
the volume of acetic acid in the mixture is 10 mL. Let x represent the volume of water, in mL, in the mixture. The equation x + 10 = 56
represents this situation. Subtracting 10 from both sides of this equation yields x = 46. Therefore, the volume of water, in mL, in the mixture is
46.$qb$);
select seed_pool_question($qb$CB-968e9e51$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following ordered pairs  is a solution to the system of inequalities above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-968e9e51.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The solutions to the given system of inequalities is the set of all ordered pairs  that satisfy both inequalities in the
system. For an ordered pair to satisfy the inequality , the value of the ordered pair’s y-coordinate must be less than or equal to the value of
the ordered pair’s x-coordinate. This is true of the ordered pair , because . To satisfy the inequality , the value of the
ordered pair’s y-coordinate must be less than or equal to the value of the additive inverse of the ordered pair’s x-coordinate. This is also true of
the ordered pair . Because 0 is its own additive inverse, is the same as . Therefore, the ordered pair  is a
solution to the given system of inequalities.
Choice A is incorrect. This ordered pair satisfies only the inequality  in the given system, not both inequalities. Choice B incorrect. This
ordered pair satisfies only the inequality  in the system, but not both inequalities. Choice C is incorrect. This ordered pair satisfies
neither inequality.$qb$);
select seed_pool_question($qb$CB-9f3cb472$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Line t in the xy-plane has a slope of - 1/3 and passes through the point (9, 10). Which equation defines line t?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9f3cb472.png$qb$, $qb$[{"label": "A", "body": "y = 13x - 1/3"}, {"label": "B", "body": "y = 9x + 10"}, {"label": "C", "body": "y = -x/3 + 10"}, {"label": "D", "body": "y = -x/3 + 13"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The equation that defines line t in the xy-plane can be written in slope-intercept form y = mx + b, where m is the slope of
line t and (0, b) is its y-intercept. It’s given that line t has a slope of - 1/3 . Therefore, m = - 1/3 . Substituting  for m in the equation
(9, 1-01/()3)
y = mx + b yields , or . It’s also given that line t passes through the point . Substituting 9 for x and 10 for y
in the equation yy == y-- (=x)/3x/3 -++1/(^(3)bb) x + b yields y10=y==--x/3(-9)/3x/(+3)++1b3b, or 10 = -3 + b. Adding 3 to both sides of this equation yields 13 = b. Substituting 13 for b
in the equation  yields .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This equation defines a line that has a slope of 9, not - 1/3, and passes through the point (0, 10) , not (9, 10) .
Choice C is incorrect. This equation defines a line that passes through the point (0, 10), not (9, 10) .$qb$);
select seed_pool_question($qb$CB-aa85b138$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A tree had a height of 6 feet when it was planted. The equation above can be used to find how many years n it took the tree to reach a height of
14 feet. Which of the following is the best interpretation of the number 2 in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-aa85b138.png$qb$, $qb$[{"label": "A", "body": "The number of years it took the tree to double its height"}, {"label": "B", "body": "The average number of feet that the tree grew per year"}, {"label": "C", "body": "The height, in feet, of the tree when the tree was 1 year old"}, {"label": "D", "body": "The average number of years it takes similar trees to grow 14 feet"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The height of the tree at a given time is equal to its height when it was planted plus the number of feet that the tree grew. In
the given equation, 14 represents the height of the tree at the given time, and 6 represents the height of the tree when it was planted. It follows
that represents the number of feet the tree grew from the time it was planted until the time it reached a height of 14 feet. Since n represents
the number of years between the given time and the time the tree was planted, 2 must represent the average number of feet the tree grew each
year.
Choice A is incorrect and may result from interpreting the coefficient 2 as doubling instead of as increasing by 2 each year. Choice C is incorrect.
The height of the tree when it was 1 year old was  feet, not 2 feet. Choice D is incorrect. No information is given to connect the
growth of one particular tree to the growth of similar trees.$qb$);
select seed_pool_question($qb$CB-15daa8d6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$2x + 16 = a(x + 8)
In the given equation, a is a constant. If the equation has infinitely many solutions, what is the value of a?$qb$, null, null, null, array[$qb$2$qb$]::text[], $qb$The correct answer is 2. An equation with one variable, x, has infinitely many solutions only when both sides of the equation are equal for any
defined value of x. It's given that 2x + 16 = a(x + 8) , where a is a constant. This equation can be rewritten as 2(x + 8) = a(x + 8). If this
equation has infinitely many solutions, then both sides of this equation are equal for any defined value of x. Both sides of this equation are equal
for any defined value of x when 2 = a. Therefore, if the equation has infinitely many solutions, the value of a is 2.
Alternate approach: If the given equation, , has infinitely many solutions, then both sides of this equation are equal for any
2^(x) + 126x =+^(a)16(^(x)=+a8(x) + 8)
value of x. If x = 0, then substituting 0 for x in  yields 2(0) + 16 = a(0 + 8), or 16 = 8a. Dividing both sides of this
equation by 8 yields 2 = a.$qb$);
select seed_pool_question($qb$CB-d7c8ba0b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, line t passes through the points (0, 9) and (1, 17). Which equation defines line t?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d7c8ba0b.png$qb$, $qb$[{"label": "A", "body": "y = 1/8 x + 9"}, {"label": "B", "body": "y = x + 1/8"}, {"label": "C", "body": "y = x + 8"}, {"label": "D", "body": "y = 8x + 9"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. An equation defining a line in the xy-plane can be written in the form , where m represents the slope and (0, b)
represents the y-intercept of the line. It’s given that line t passes through the point ; therefore, b = 9. The slope, m, of a line can be found
m =(0(,y92-)yy1)/(x82 -x1)= mx + b
using any two points on the line, (x1 , y1 ) and (x2 , y2 ) , and the slope formula . Substituting (0, 9) and (1, 17) for (x1 , y1 ) and
(x2 , y2 ) , respectively, in the slope formula yields m = (17-9)/(1-o) , or m = 8. Substituting  for m and 9 for b in the equation y = mx + b yields y
= 8x + 9.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2f0a43b2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If x/8 = 5, what is the value of 8/x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2f0a43b2.png$qb$, null, null, array[$qb$.2$qb$, $qb$1/5$qb$]::text[], $qb$The correct answer is 1/5 . Since the number 5 can also be written as 5/1 , the given equation can also be written as x/8 = 5/1 . This equation is
equivalent to 8/x = 1/5 . Therefore, the value of 8/x is 1/5 . Note that 1/5 and .2 are examples of ways to enter a correct answer.
Alternate approach: Multiplying both sides of the equation x/8 = 5 by 8 yields x = 40. Substituting 40 for x into the expression 8/x yields 8/4o , or
1/5 .$qb$);
select seed_pool_question($qb$CB-ebf8d2b7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A machine makes large boxes or small boxes, one at a time, for a total of 700 minutes each day. It takes the machine 10 minutes to make a large
box or 5 minutes to make a small box. Which equation represents the possible number of large boxes, x, and small boxes, y, the machine can
make each day?$qb$, null, $qb$[{"label": "A", "body": "5x + 10y = 700"}, {"label": "B", "body": "10x + 5y = 700"}, {"label": "C", "body": "(x + y)(10 + 5) = 700"}, {"label": "D", "body": "(10 + x)(5 + y) = 700"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that it takes the machine 10 minutes to make a large box. It's also given that x represents the possible number of
large boxes the machine can make each day. Multiplying 10 by x gives 10x, which represents the amount of time spent making large boxes. It’s
given that it takes the machine 5 minutes to make a small box. It's also given that y represents the possible number of small boxes the machine
can make each day. Multiplying 5 by y gives 5y, which represents the amount of time spent making small boxes. Combining the amount of time
spent making x large boxes and y small boxes yields 10x + 5y. It’s given that the machine makes boxes for a total of 700 minutes each day.
Therefore 10x + 5y = 700 represents the possible number of large boxes, x, and small boxes, y, the machine can make each day.
Choice A is incorrect and may result from associating the time of 10 minutes with small, rather than large, boxes and the time of 5 minutes with
large, rather than small, boxes.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-997bec28$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The perimeter of an isosceles triangle is 83 inches. Each of the two congruent sides of the triangle has a length of 24 inches. What is the length,
in inches, of the third side?$qb$, null, null, null, array[$qb$35$qb$]::text[], $qb$The correct answer is 35. It’s given that the perimeter of an isosceles triangle is 83 inches and that each of the two congruent sides has a length
of 24 inches. The perimeter of a triangle is the sum of the lengths of its three sides. The equation 24 + 24 + x = 83 can be used to represent
this situation, where x is the length, in inches, of the third side. Combining like terms on the left-hand side of this equation yields 48 + x = 83.
Subtracting 48 from both sides of this equation yields x = 35. Therefore, the length, in inches, of the third side is 35.$qb$);
select seed_pool_question($qb$CB-088bc84e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 2 (5x) = 6, what is the value of 5x?$qb$, null, $qb$[{"label": "A", "body": "4/5"}, {"label": "B", "body": "5/3"}, {"label": "C", "body": "3"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Dividing both sides of the given equation by 2 yields 5x = 3. Therefore, the value of 5x is 3.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-40ba6288$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 3x = 30, what is the value of 3x - 12?$qb$, null, $qb$[{"label": "A", "body": "-2"}, {"label": "B", "body": "18"}, {"label": "C", "body": "22"}, {"label": "D", "body": "42"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 12 from each side of the given equation yields 3x - 12 = 30 - 12, or 3x - 12 = 18. Therefore, the value of
3x - 12 is 18.
Choice A is incorrect. This is the value of x - 12, not 3x - 12.
Choice C is incorrect. This is the value of x + 12, not 3x - 12.
Choice D is incorrect. This is the value of 3x + 12, not 3x - 12.$qb$);
select seed_pool_question($qb$CB-12ee1edc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the given equation, b is a constant. If the equation has no solution, what is the value of b ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-12ee1edc.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "4"}, {"label": "C", "body": "6"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. This equation has no solution when there is no value of x that produces a true statement. Solving the given equation for x by
dividing both sides by  gives . When , the right-hand side of this equation will be undefined, and the equation
will have no solution. Therefore, when , there is no value of x that satisfies the given equation.
Choices B, C, and D are incorrect. Substituting 4, 6, and 10 for b in the given equation yields exactly one solution, rather than no solution, for x.
For example, substituting 4 for b in the given equation yields , or . Dividing both sides of  by 2 yields .
Similarly, if  or ,  and , respectively.$qb$);
select seed_pool_question($qb$CB-6fa1dc0f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Line r in the xy-plane has a slope of 4 and passes through the point (0, 6). Which equation defines line r?$qb$, null, $qb$[{"label": "A", "body": "y = -6x + 4"}, {"label": "B", "body": "y = 6x + 4"}, {"label": "C", "body": "y = 4x - 6"}, {"label": "D", "body": "y = 4x + 6"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A line in the xy-plane with a slope of m and a y-intercept of (0, b) can be defined by an equation in the form y = mx + b.
It’s given that line r has a slope of 4 and passes through the point (0, 6) . It follows that m = 4 and b = 6. Substituting 4 for m and 6 for b in the
equation y = mx + b yields y = 4x + 6. Therefore, the equation y = 4x + 6 defines line r.
Choice A is incorrect. This equation defines a line that has a slope of -6, not 4, and passes through the point (0, 4), not (0, 6) .
Choice B is incorrect. This equation defines a line that has a slope of 6, not 4, and passes through the point (0, 4) , not (0, 6).
Choice C is incorrect. This equation defines a line that passes through the point (0, -6), not (0, 6) .$qb$);
select seed_pool_question($qb$CB-c6b151d4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A total of 364 paper straws of equal length were used to construct two types of polygons: triangles and rectangles. The triangles and rectangles
were constructed so that no two polygons had a common side. The equation 3x + 4y = 364 represents this situation, where x is the number of
triangles constructed and y is the number of rectangles constructed. What is the best interpretation of (x, y) = (24, 73) in this context?$qb$, null, $qb$[{"label": "A", "body": "If 24 triangles were constructed, then 73 rectangles were constructed."}, {"label": "B", "body": "If 24 triangles were constructed, then 73 paper straws were used."}, {"label": "C", "body": "If 73 triangles were constructed, then 24 rectangles were constructed."}, {"label": "D", "body": "If 73 triangles were constructed, then 24 paper straws were used."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that 364 paper straws of equal length were used to construct triangles and rectangles, where no two polygons had
a common side. It's also given that the equation 3x + 4y = 364 represents this situation, where x is the number of triangles constructed and y
is the number of rectangles constructed. The equation (x, y) = (24, 73) means that if x = 24, then y = 73. Substituting 24 for x and 73 for y
in 3x + 4y = 364 yields 3(24) + 4(73) = 364, or 364 = 364, which is true. Therefore, in this context, the equation (x, y) = (24, 73) means
that if 24 triangles were constructed, then 73 rectangles were constructed.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-99ea3715$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If the graph of 27x + 33y = 297 is shifted down 5 units in the xy-plane, what is the y-intercept of the resulting graph?$qb$, null, $qb$[{"label": "A", "body": "(0, 4)"}, {"label": "B", "body": "(0, 6)"}, {"label": "C", "body": "(0, 14)"}, {"label": "D", "body": "(0, 28)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. When the graph of an equation in the form Ax + By = C, where AB, , and C are constants, is shifted down k units in the
xy-plane, the resulting graph can be represented by the equation Ax + B(y + k) = C. It's given that the graph of 27x + 33y = 297 is shifted
down 5 units in the xy-plane. Therefore, the resulting graph can be represented by the equation 27x + 33(y + 5) = 297, or
27x + 33y + 165 = 297. Subtracting 165 from both sides of this equation yields 27x + 33y = 132. The y-intercept of the graph of an
equation in the xy-plane is the point where the line intersects the y-axis, represented by the point (0, y) . Substituting 0 for x in the equation
27x + 33y = 132 yields 27(0) + 33y = 132, or 33y = 132. Dividing both sides of this equation by 33 yields y = 4. Therefore, if the graph of
27x + 33y = 297 is shifted down 5 units, the y-intercept of the resulting graph is (0, 4).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the y-intercept of the graph of 27x + 33y = 297 shifted up, not down, 5 units.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0d391910$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 4x. For what value of x does f(x) = 8?$qb$, null, null, null, array[$qb$2$qb$]::text[], $qb$The correct answer is 2. Substituting 8 for f(x) in the given equation yields 8 = 4x. Dividing the left- and right-hand sides of this equation by 4
yields x = 2. Therefore, the value of x is 2 when f(x) = 8.$qb$);
select seed_pool_question($qb$CB-ee439cff$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$On a car trip, Rhett and Jessica each drove for part of the trip, and the total distance they drove was under 220 miles. Rhett drove at an average
speed of 35miIeSPerh0ur (mPh) , and Jessica drove at an average speed of 40mPh. Which of the following inequalities represents this
situation, where r is the number of hours Rhett drove and j is the number of hours Jessica drove?$qb$, null, $qb$[{"label": "A", "body": "35r + 40j > 220"}, {"label": "B", "body": "35r + 40j < 220"}, {"label": "C", "body": "40r + 35j > 220"}, {"label": "D", "body": "40r + 35j < 220"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that Rhett drove at an average speed of 35 miles per hour and that he drove for r hours. Multiplying 35 miles per
hour by r hours yields 35r miles, or the distance that Rhett drove. It’s also given that Jessica drove at an average speed of 40 miles per hour and
that she drove for j hours. Multiplying 40 miles per hour by j hours yields 40j miles, or the distance that Jessica drove. The total distance, in
miles, that Rhett and Jessica drove can be represented by the expression 35r + 40j. It’s given that the total distance they drove was under 220
miles. Therefore, the inequality 35r + 40j < 220 represents this situation.
Choice A is incorrect. This inequality represents a situation in which the total distance Rhett and Jessica drove was over, rather than under, 220
miles.
Choice C is incorrect. This inequality represents a situation in which Rhett drove at an average speed of 40, rather than 35, miles per hour,
Jessica drove at an average speed of 35, rather than 40, miles per hour, and the total distance they drove was over, rather than under, 220 miles.
Choice D is incorrect. This inequality represents a situation in which Rhett drove at an average speed of 40, rather than 35, miles per hour, and
Jessica drove at an average speed of 35, rather than 40, miles per hour.$qb$);
select seed_pool_question($qb$CB-8c98c834$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The equation  models the relationship between the number of different pieces of music a certain pianist practices, y, during an x-
minute practice session. How many pieces did the pianist practice if the session lasted 30 minutes?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8c98c834.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "3"}, {"label": "C", "body": "10"}, {"label": "D", "body": "30"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the equation  models the relationship between the number of different pieces of music a certain
pianist practices, y, and the number of minutes in a practice session, x. Since it’s given that the session lasted 30 minutes, the number of pieces
the pianist practiced can be found by substituting 30 for x in the given equation, which yields , or .
Choices A and C are incorrect and may result from misinterpreting the values in the equation. Choice D is incorrect. This is the given value of x,
not the value of y.$qb$);
select seed_pool_question($qb$CB-563407e5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A bakery sells trays of cookies. Each tray contains at least 50 cookies but no more than 60. Which of the following could be the total number of
cookies on 4 trays of cookies?$qb$, null, $qb$[{"label": "A", "body": "165"}, {"label": "B", "body": "205"}, {"label": "C", "body": "245"}, {"label": "D", "body": "285"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If each tray contains the least number of cookies possible, 50 cookies, then the least number of cookies possible on 4 trays
is 50 × 4 = 200 cookies. If each tray contains the greatest number of cookies possible, 60 cookies, then the greatest number of cookies possible
on 4 trays is 60 × 4 = 240 cookies. If the least number of cookies on 4 trays is 200 and the greatest number of cookies is 240, then 205 could be
the total number of cookies on these 4 trays of cookies because .
Choices A, C, and D are incorrect. The least number of cookies on 4 trays is 200 cookies, and the greatest number of cookies on 4 trays is 240
cookies. The choices 165, 245, and 285 are each either less than 200 or greater than 240; therefore, they cannot represent the total number of
cookies on 4 trays.$qb$);
select seed_pool_question($qb$CB-25e1cfed$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$How many solutions does the equation 10(15x - 9) = -15(6 - 10x) have?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Applying the distributive property to each side of the given equation yields 150x - 90 = -90 + 150x. Applying the
commutative property of addition to the right-hand side of this equation yields 150x - 90 = 150x - 90. Since the two sides of the equation
are equivalent, this equation is true for any value of x. Therefore, the given equation has infinitely many solutions.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-38a43902$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = -2x
3x + y = 40
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, null, null, null, array[$qb$40$qb$]::text[], $qb$The correct answer is 40. It’s given in the first equation of the system that y = -2x. Substituting -2x for y in the second equation of the
system yields 3x + (-2x) = 40. Combining like terms on the left-hand side of this equation yields x = 40. Therefore, the value of x is 40.$qb$);
select seed_pool_question($qb$CB-930c2990$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Hydrogen is placed inside a container and kept at a constant pressure. The graph shows the estimated volume y, in liters, of the hydrogen when
its temperature is x kelvins.
?^(?)1?t?Se
10?12IIIIII12345678900447766992222883355II11?-/(-|?II00| 00 |2002200| 00 |2003300| 00 |44?00| 00 |2005500| 00 |2006600| 00 |2007700| 00 |2008800|)| | ?| | | | | | | | | | | | | | | 00|x
1?mOe?
?emPerature (?eIVinS)
What is the estimated volume, in liters, of the hydrogen when its temperature is 500 kelvins?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-930c2990.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "7/5o0"}, {"label": "C", "body": "7"}, {"label": "D", "body": "5o0/7"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. For the graph shown, the x-axis represents temperature, in kelvins, and the y-axis represents volume, in liters. Therefore, the
estimated volume, in liters, of the hydrogen when its temperature is 500 kelvins is represented by the y-coordinate of the point on the graph that
has an x-coordinate of 500. The point on the graph with an x-coordinate of 500 has a y-coordinate of 7. Therefore, the estimated volume, in liters,
of the hydrogen when its temperature is 500 kelvins is 7.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-317e80f9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x + y = 18
5y = x
What is the solution (x, y) to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(15, 3)"}, {"label": "B", "body": "(16, 2)"}, {"label": "C", "body": "(17, 1)"}, {"label": "D", "body": "(18, 0)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The second equation in the given system defines the value of x as 5y. Substituting 5y for x into the first equation yields 5y
+ y = 18 or 6y = 18. Dividing each side of this equation by 6 yields y = 3. Substituting 3 for y in the second equation yields 5(3) = x or x
= 15. Therefore, the solution (x, y) to the given system of equations is (15, 3) .
Choice B is incorrect. Substituting 16 for x and 2 for y in the second equation yields 5(2) = 16, which is not true. Therefore, (16, 2) is not a
solution to the given system of equations.
Choice C is incorrect. Substituting 17 for x and 1 for y in the second equation yields 5(1) = 17, which is not true. Therefore, (17, 1) is not a
solution to the given system of equations.
Choice D is incorrect. Substituting 18 for x and 0 for y in the second equation yields 5(0) = 18, which is not true. Therefore, (18, 0) is not a
solution to the given system of equations.$qb$);
select seed_pool_question($qb$CB-f8fa0cf0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$9r = 7(r + 7)
What value of r is the solution to the given equation?$qb$, null, null, null, array[$qb$24.5$qb$, $qb$49/2$qb$]::text[], $qb$The correct answer is 49/2 . It’s given that 9r = 7(r + 7) . Applying the distributive property on the right-hand side of this equation yields 9r = 7r
+ 49. Subtracting 7r from both sides of this equation yields 2r = 49. Dividing both sides of this equation by 2 yields r = 49/2 . Therefore, the
solution to the given equation is 49/2 . Note that 49/2 and 24.5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-3f5375d9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The line graphed in the xy-plane below models the total cost, in dollars, for a cab ride, y, in a certain city during nonpeak hours based on the
number of miles traveled, x.
According to the graph, what is the cost for each additional mile traveled, in dollars, of a cab ride?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3f5375d9.png$qb$, $qb$[{"label": "A", "body": "$2.00"}, {"label": "B", "body": "$2.60"}, {"label": "C", "body": "$3.00"}, {"label": "D", "body": "$5.00"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The cost of each additional mile traveled is represented by the slope of the given line. The slope of the line can be calculated
by identifying two points on the line and then calculating the ratio of the change in y to the change in x between the two points. Using the points
and , the slope is equal to , or 2. Therefore, the cost for each additional mile traveled of the cab ride is $2.00.
Choice B is incorrect and may result from calculating the slope of the line that passes through the points  and . However,
does not lie on the line shown. Choice C is incorrect. This is the y-coordinate of the y-intercept of the graph and represents the flat fee for a cab
ride before the charge for any miles traveled is added. Choice D is incorrect. This value represents the total cost of a 1-mile cab ride.$qb$);
select seed_pool_question($qb$CB-541bef2f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y ≤ x + 7
y ≥ -2x - 1
Which point (x, y) is a solution to the given system of inequalities in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "(-14, 0)"}, {"label": "B", "body": "(0, -14)"}, {"label": "C", "body": "(0, 14)"}, {"label": "D", "body": "(14, 0)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A point (x, y) is a solution to a system of inequalities in the xy-plane if substituting the x-coordinate and the y-coordinate of
the point for x and y, respectively, in each inequality makes both of the inequalities true. Substituting the x-coordinate and the y-coordinate of
choice D, 14 and 0, for x and y, respectively, in the first inequality in the given system, y ≤ x + 7, yields 0 ≤ 14 + 7, or 0 ≤ 21, which is true.
Substituting 14 for x and 0 for y in the second inequality in the given system, y ≥ -2x - 1, yields 0 ≥ -2(14) - 1, or 0 ≥ -29, which is true.
Therefore, the point (14, 0) is a solution to the given system of inequalities in the xy-plane.
Choice A is incorrect. Substituting -14 for x and 0 for y in the inequality y ≤ x + 7 yields 0 ≤ -14 + 7, or 0 ≤ -7, which is not true.
Choice B is incorrect. Substituting 0 for x and -14 for y in the inequality y ≥ -2x - 1 yields -14 ≥ -2(0) - 1, or -14 ≥ -1, which is not
true.
Choice C is incorrect. Substituting 0 for x and 14 for y in the inequality y ≤ x + 7 yields 14 ≤ 0 + 7, or 14 ≤ 7, which is not true.$qb$);
select seed_pool_question($qb$CB-620fe971$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A team of workers has been moving cargo off of a ship. The equation below models the approximate number of tons of cargo, y, that remains to
be moved x hours after the team started working.
The graph of this equation in the xy-plane is a line. What is the best interpretation of the x-intercept in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-620fe971.png$qb$, $qb$[{"label": "A", "body": "The team will have moved all the cargo in about 4.8 hours."}, {"label": "B", "body": "The team has been moving about 4.8 tons of cargo per hour."}, {"label": "C", "body": "The team has been moving about 25 tons of cargo per hour."}, {"label": "D", "body": "The team started with 120 tons of cargo to move."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The x-intercept of the line with equation y = 120 – 25x can be found by substituting 0 for y and finding the value of x. When y
= 0, x = 4.8, so the x-intercept is at (4.8, 0). Since y represents the number of tons of cargo remaining to be moved x hours after the team started
working, it follows that the x-intercept refers to the team having no cargo remaining to be moved after 4.8 hours. In other words, the team will
have moved all of the cargo after about 4.8 hours.
Choice B is incorrect and may result from incorrectly interpreting the value 4.8. Choices C and D are incorrect and may result from
misunderstanding the x-intercept. These statements are accurate but not directly relevant to the x-intercept.$qb$);
select seed_pool_question($qb$CB-6a87902f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 2x + 10
y = 2x - 1
At how many points do the graphs of the given equations intersect in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "Zero"}, {"label": "B", "body": "Exactly one"}, {"label": "C", "body": "Exactly two"}, {"label": "D", "body": "Infinitely many"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A system of two linear equations in two variables, x and y, has zero points of intersection if the lines represented by the
equations in the xy-plane are distinct and parallel. The graphs of two lines in the xy-plane represented by equations in slope-intercept form,
y = mx + b, are distinct if the y-coordinates of their y-intercepts, b, are different and are parallel if their slopes, m, are the same. For the two
equations in the given system, y = 2x + 10 and y = 2x - 1, the values of b are 10 and -1 , respectively, and the values of m are both 2. Since
the values of b are different, the graphs of these lines have different y-coordinates of the y-intercept and are distinct. Since the values of m are
the same, the graphs of these lines have the same slope and are parallel. Therefore, the graphs of the given equations are lines that intersect at
zero points in the xy-plane.
Choice B is incorrect. The graphs of a system of two linear equations have exactly one point of intersection if the lines represented by the
equations have different slopes. Since the given equations represent lines with the same slope, there is not exactly one intersection point.
Choice C is incorrect. The graphs of a system of two linear equations can never have exactly two intersection points.
Choice D is incorrect. The graphs of a system of two linear equations have infinitely many intersection points when the lines represented by the
equations have the same slope and the same y-coordinate of the y-intercept. Since the given equations represent lines with different y-
coordinates of their y-intercepts, there are not infinitely many intersection points.$qb$);
select seed_pool_question($qb$CB-b2845d88$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is an equation of the graph shown in the xy-plane above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b2845d88.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The slope of the line can be found by choosing any two points on the line, such as (4, –2) and (0, –1). Subtracting the y-
values results in –2 – (–1) = –1, the change in y. Subtracting the x-values results in 4 – 0 = 4, the change in x. Dividing the change in y by the
change in x yields , the slope. The line intersects the y-axis at (0, –1), so –1 is the y-coordinate of the y-intercept. This
information can be expressed in slope-intercept form as the equation .
Choice B is incorrect and may result from incorrectly calculating the slope and then misidentifying the slope as the y-intercept. Choice C is
incorrect and may result from misidentifying the slope as the y-intercept. Choice D is incorrect and may result from incorrectly calculating the
slope.$qb$);
select seed_pool_question($qb$CB-f75bd744$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$4x - 6y = 10y + 2
ty = 1/2 + 2x
In the given system of equations, t is a constant. If the system has no solution, what is the value of t?$qb$, null, null, null, array[$qb$8$qb$]::text[], $qb$The correct answer is 8. The given system of equations can be solved using the elimination method. Multiplying both sides of the second
equation in the given system by -2 yields -2ty = -1 - 4x, or -1 - 4x = -2ty. Adding this equation to the first equation in the given
system, 4x - 6y = 10y + 2, yields (4x - 6y) + (-1 - 4x) = , or -1 - 6y = 10y - 2ty + 2. Subtracting 10y from
(10y - (21t0yy++22))-+ (1(-0y2)ty)
both sides of this equation yields (-1 - 6y) - (10y) = , or -1 - 16y = -2ty + 2. If the given system has no
solution, then the equation -1 - 16y = -2ty + 2 has no solution. If this equation has no solution, the coefficients of y on each side of the
equation, -16 and -2t, must be equal, which yields the equation -16 = -2t. Dividing both sides of this equation by -2 yields 8 = t. Thus, if
the system has no solution, the value of t is 8.
Alternate approach: A system of two linear equations in two variables, x and y, has no solution if the lines represented by the equations in the xy-
plane are parallel and distinct. Lines represented by equations in the form Ax + By = C, where AB, , and C are constant terms, are parallel if
the ratio of the x-coefficients is equal to the ratio of the y-coefficients, and distinct if the ratio of the x-coefficients are not equal to the ratio of the
constant terms. Subtracting 10y from both sides of the first equation in the given system yields (4x - 6y) - ,
(2(x1)0=y) =(1/2(+102yx+) -2) -
or 4x - 16y = 2. Subtracting 2x from both sides of the second equation in the given system yields (ty) - (2-x()1t0/16y), or
-2x + ty = 1/2 . The ratio of the x-coefficients for these equations is - 2/4 , or - 1/2 . The ratio of the y-coefficients for these equations is .
The ratio of the constant terms for these equations is (1?2)/2 , or 1/4 . Since the ratio of the x-coefficients, - 1/2 , is not equal to the ratio of the
constants, 1/4 , the lines represented by the equations are distinct. Setting the ratio of the x-coefficients equal to the ratio of the y-coefficients
yields - 1/2 = - t/16 . Multiplying both sides of this equation by -16 yields (-1/2) (-16) = (-t/16) (-16) , or t = 8. Therefore, when t = 8, the
lines represented by these equations are parallel. Thus, if the system has no solution, the value of t is 8.$qb$);
select seed_pool_question($qb$CB-58c7daed$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the linear function h, h (0) = 0 and h (11) = 10. Which equation defines h?$qb$, null, $qb$[{"label": "A", "body": "h (x) = 1o/11 x"}, {"label": "B", "body": "h (x) = 1o/11 x + 10"}, {"label": "C", "body": "h (x) = 11/1o x"}, {"label": "D", "body": "h (x) = 11/1o x + 1 1"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since h is a linear function, it can be defined by an equation of the form h (x) = mx + b, where m and b are constants. It's
given that . Substituting 0 for x and 0 for h(x) in the equation yields 0 = 0m + b, or 0 = b. Substituting 0 for b in
h (h0)(x=) 0= mx + b h (h11()^(x)=) =10^(mx) + b
the equation yields h (x) = mx. It's also given that . Substituting 11 for x and 10 for h(x) in the equation h(x)
= mx yields 10 = 11m. Dividing both sides of this equation by 11 yields m = 10/11 . Substituting 10/11 for m in the equation h (x) = mx yields
h (x) = 10/11 x. Therefore, an equation that defines h is h (x) = 10/11 x.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d0e614a6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$3/5 x + 3/4 y = 7
Which table gives three values of x and their corresponding values of y for the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d0e614a6.png$qb$, $qb$[{"label": "A", "body": "x 1 |-|-|-|--???(-y)/113(-20)/(-101)20/(? 77/(-20) |)||| 2 4"}, {"label": "B", "body": "x 1 ||| ???(-y)/47(-5)/(-44)5/(38/(-5) |)||| 2 4"}, {"label": "C", "body": "x 1 |-|-|-|--???(-y)/148(-15)/(-136)15/(? 112/(-15) |)||| 2 4"}, {"label": "D", "body": "x 1 |-|-|-|--???(-y)/(-128)15/116(-15)/(? 92/(-15) |)||| 2 4"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Each of the tables gives the same three values of x: 1, 2, and 4. Substituting 1 for x in the given equation yields
(3/5) (1(4))/3
+ 3/4y = 7, or . Subtracting 3/5 from both sides of this equation yields 3/4 y = 32/5 . Multiplying both sides of this equation by
yields . Therefore, when x = 1, the corresponding value of y for the given equation is 128/15 . Substituting 2 for x in the given equation
y( (3=)/5 ) 128/(( (2145))/3)3/(+5) (+3)/4 3/y4=y =7 35/5
yields , or . Subtracting 6/5 from both sides of this equation yields 3/4 y = 29/5. Multiplying both sides of this
equation by  yields . Therefore, when x = 2, the corresponding value of y for the given equation is 116/15 . Substituting 4 for x in the
y( (=3)/5 ()4)/3116/(4^(15))6/(5+) (+3)/4 3/y4=y =7 35/5
given equation yields , or 12/5 + 3/4 y = 35/5 . Subtracting 12/5 from both sides of this equation yields 3/4 y = 23/5. Multiplying both
sides of this equation by  yields y = 92/15 . Therefore, when x = 4, the corresponding value of y for the given equation is 92/15 . The table in choice
D gives x-values of 1, 2, and 4 and corresponding y-values of 128/15 , 116/15, and 92/15 , respectively. Therefore, the table in choice D gives three values of
x and their corresponding values of y for the given equation.
Choice A is incorrect. This table gives three values of x and their corresponding values of y for the equation 3/5 x + 3/4 + y = 7.
Choice B is incorrect. This table gives three values of x and their corresponding values of y for the equation 3/5x + y = 10.
Choice C is incorrect. This table gives three values of x and their corresponding values of y for the equation 3/5 x + 3/4 y = 8.$qb$);
select seed_pool_question($qb$CB-17d80dc3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, line k has a slope of 5 and a y-intercept of (0, -35). What is the x-coordinate of the x-intercept of line k?$qb$, null, null, null, array[$qb$7$qb$]::text[], $qb$The correct answer is 7. An equation of a line in the xy-plane can be written in the form y = mx + b, where m is the slope of the line and (0, b)
is the y-intercept of the line. It’s given that line k has a slope of 5 and a y-intercept of (0, -35). Therefore, m = 5 and b = -35. Substituting 5
for m and -35 for b in the equation y = mx + b yields y = 5x - 35. The x-intercept of a line in the xy-plane is the point where the line
intersects the x-axis, which is a point with a y-coordinate of 0. Substituting 0 for y in the equation y = 5x - 35 yields 0 = 5x - 35. Adding 35
to both sides of this equation yields 35 = 5x. Dividing both sides of this equation by 5 yields 7 = x. Therefore, the x-coordinate of the x-
intercept of line k is 7.$qb$);
select seed_pool_question($qb$CB-1d18794b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A contract for a certain service requires a onetime activation cost of $35 and a monthly cost of $23. Which equation represents this situation,
where c is the total cost, in dollars, of this service contract for t months?$qb$, null, $qb$[{"label": "A", "body": "c = t/23 + 35"}, {"label": "B", "body": "c = t/35 + 23"}, {"label": "C", "body": "c = 23t + 35"}, {"label": "D", "body": "c = 35t + 23"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that this service contract requires a monthly cost of $23. A monthly cost of $23 for t months results in a cost of
$23t. It's also given that this service contract requires a onetime activation cost of $35. Adding the onetime activation cost to the monthly cost
of the service contract for t months yields the total cost c, in dollars, of this service contract for t months. Therefore, this situation can be
represented by the equation c = 23t + 35.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b450ab03$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$An employee at a restaurant prepares sandwiches and salads. It takes the employee 1·5 minutes to prepare a sandwich and 1·9 minutes to
prepare a salad. The employee spends a total of 46·1 minutes preparing x sandwiches and y salads. Which equation represents this situation?$qb$, null, $qb$[{"label": "A", "body": "1·9x + 1·5y = 46·1"}, {"label": "B", "body": "1·5x + 1·9y = 46·1"}, {"label": "C", "body": "x + y = 46·1"}, {"label": "D", "body": "30·7x + 24·3y = 46·1"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the employee takes 1·5 minutes to prepare a sandwich. Multiplying 1·5 by the number of sandwiches, x, yields
1·5x, the amount of time the employee spends preparing x sandwiches. It’s also given that the employee takes 1·9 minutes to prepare a salad.
Multiplying 1·9 by the number of salads, y, yields 1·9y, the amount of time the employee spends preparing y salads. It follows that the total
amount of time, in minutes, the employee spends preparing x sandwiches and y salads is 1·5x + 1·9y. It's given that the employee spends a
total of 46·1 minutes preparing x sandwiches and y salads. Thus, the equation 1·5x + 1·9y = 46·1 represents this situation.
Choice A is incorrect. This equation represents a situation where it takes the employee 1·9 minutes, rather than 1·5 minutes, to prepare a
sandwich and 1·5 minutes, rather than 1·9 minutes, to prepare a salad.
Choice C is incorrect. This equation represents a situation where it takes the employee 1 minute, rather than 1·5 minutes, to prepare a sandwich
and 1 minute, rather than 1·9 minutes, to prepare a salad.
Choice D is incorrect. This equation represents a situation where it takes the employee 30·7 minutes, rather than 1·5 minutes, to prepare a
sandwich and 24·3 minutes, rather than 1·9 minutes, to prepare a salad.$qb$);
select seed_pool_question($qb$CB-b3abf40f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$F (x) = 9/5 (x - 273·15) + 32
The function F gives the temperature, in degrees Fahrenheit, that corresponds to a temperature of x kelvins. If a temperature increased by 9·10
kelvins, by how much did the temperature increase, in degrees Fahrenheit?$qb$, null, $qb$[{"label": "A", "body": "16·38"}, {"label": "B", "body": "48·38"}, {"label": "C", "body": "475·29"}, {"label": "D", "body": "507·29"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the function F (x) = 9/5 (x - 273·15) + 32 gives the temperature, in degrees Fahrenheit, that corresponds to
a temperature of x kelvins. A temperature that increased by 9·10 kelvins means that the value of x increased by 9·10 kelvins. It follows that an
increase in x by 9·10 increases F(x) by 9/5 (9·10) , or 16·38. Therefore, if a temperature increased by 9·10 kelvins, the temperature increased by
16·38 degrees Fahrenheit.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6ac23de7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the equation above, what is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6ac23de7.png$qb$, $qb$[{"label": "A", "body": "25"}, {"label": "B", "body": "24"}, {"label": "C", "body": "16"}, {"label": "D", "body": "15"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Multiplying both sides of the equation by 5 results in . Dividing both sides of the resulting equation by 4 results in
.
Choice B is incorrect and may result from adding 20 and 4. Choice C is incorrect and may result from dividing 20 by 5 and then multiplying the
result by 4. Choice D is incorrect and may result from subtracting 5 from 20.$qb$);
select seed_pool_question($qb$CB-1c29bfd1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The pressure exerted on a scuba diver at sea level is 14· 70 P0undS Per Square inch (PSi). For each foot the scuba diver descends below
sea level, the pressure exerted on the scuba diver increases by 0·44PSi. What is the total pressure, in PSi, exerted on the scuba diver at 105 feet
below sea level?$qb$, null, $qb$[{"label": "A", "body": "60·90"}, {"label": "B", "body": "31·50"}, {"label": "C", "body": "14·70"}, {"label": "D", "body": "0·44"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the pressure exerted on a scuba diver at sea level is 14· 70 PoundS Per Square inch (PSi) . It's also given
that for each foot the scuba diver descends below sea level, the pressure exerted on the scuba diver increases by 0·44PSi. The total pressure, in
PSi, exerted on the scuba diver at x feet below sea level can be represented by the expression 0·44x + 14·70. Substituting 105 for x in this
expression yields 0·44(105) + 14·70, or 60·90. Therefore, the total pressure exerted on the scuba diver at 105 feet below sea level is
60·90PSi.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the pressure, in PSi, exerted on the scuba diver at sea level, not at 105 feet below sea level.
Choice D is incorrect. This is the rate by which the pressure, in PSi, exerted on the scuba diver increases for each foot the scuba diver descends
below sea level.$qb$);
select seed_pool_question($qb$CB-dd875c97$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A truck can haul a maximum weight of 5,630 pounds. During one trip, the truck will be used to haul a 190-pound piece of equipment as well as
several crates. Some of these crates weigh 25 pounds each and the others weigh 62 pounds each. Which inequality represents the possible
combinations of the number of 25-pound crates, x, and the number of 62-pound crates, y, the truck can haul during one trip if only the piece of
equipment and the crates are being hauled?$qb$, null, $qb$[{"label": "A", "body": "25x + 62y ≤ 5,440"}, {"label": "B", "body": "25x + 62y ≥ 5,440"}, {"label": "C", "body": "62x + 25y ≤ 5,630"}, {"label": "D", "body": "62x + 25y ≥ 5,630"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a truck can haul a maximum of 5,630 pounds. It's also given that during one trip, the truck will be used to haul
a 190-pound piece of equipment as well as several crates. It follows that the truck can haul at most 5,630 - 190, or 5,440, pounds of crates.
Since x represents the number of 25-pound crates, the expression 25x represents the weight of the 25-pound crates. Since y represents the
number of 62-pound crates, 62y represents the weight of the 62-pound crates. Therefore, 25x + 62y represents the total weight of the crates
the truck can haul. Since the truck can haul at most 5,440 pounds of crates, the total weight of the crates must be less than or equal to 5,440
pounds, or 25x + 62y ≤ 5,440.
Choice B is incorrect. This represents the possible combinations of the number of 25-pound crates, x, and the number of 62-pound crates, y, the
truck can haul during one trip if it can haul a minimum, not a maximum, of 5,630 pounds.
Choice C is incorrect. This represents the possible combinations of the number of 62-pound crates, x, and the number of 25-pound crates, y, the
truck can haul during one trip if only crates are being hauled.
Choice D is incorrect. This represents the possible combinations of the number of 62-pound crates, x, and the number of 25-pound crates, y, the
truck can haul during one trip if it can haul a minimum, not a maximum, weight of 5,630 pounds and only crates are being hauled.$qb$);
select seed_pool_question($qb$CB-6e6a3241$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Which of the following graphs in the xy-plane could be used to solve the system of equations above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6e6a3241.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The graph of a system of equations is the graph that shows the lines represented by each of the equations in the system.
The x-intercept of the graph of each given equation can be found by substituting 0 for y in each equation: , or , and
, or . The y-intercept of the graph of each equation can be found by substituting 0 for x in each equation: ,
or , and  or . Using these x- and y- intercept values, the line that has equation  passes through the
points  and , and the line that has equation  passes through the points  and . Only the lines in choice C
pass through these points and can be used to solve the given system of equations.
Choices A, B, and D are incorrect. In choices A and B, neither line passes through  and  or  and . In choice D, although
one line passes through  and  the other line doesn’t pass through  and .$qb$);
select seed_pool_question($qb$CB-30b1e186$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, which of the following does NOT contain any points that are part of the solution set to 5x - 7y > 35?$qb$, null, $qb$[{"label": "A", "body": "The x-axis"}, {"label": "B", "body": "The region where x > 0 and y > 0"}, {"label": "C", "body": "The region where x < 0 and y < 0"}, {"label": "D", "body": "The region where x < 0 and y > 0"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the solution set consists of points in the xy-plane where 5x - 7y > 35, which can also be written as 5x + (
-7y) > 35. If (x, y) is a point in the region where x < 0 and y > 0, then x is a negative number and y is a positive number. If x is a negative
number, then the value of 5x is a negative number. If y is a positive number, then the value of -7y is a negative number. It follows that the
expression 5x + (-7y) is the sum of two negative numbers and is therefore negative. If the value of 5x + (-7y) is negative, then the value of
5x + (-7y) cannot be greater than 35. Thus, the region where x < 0 and y > 0 does not contain any points that are part of the solution set to
5x - 7y > 35.
Choice A is incorrect. The x-axis contains the point (10, 0) , which is part of the solution set to 5x - 7y > 35, since 5(10) - 7(0) > 35, or 50
> 35, is true.
Choice B is incorrect. The region where x > 0 and y > 0 contains the point (10, 1) , which is part of the solution set to 5x - 7y > 35, since
5(10) - 7(1) > 35, or 43 > 35, is true.
Choice C is incorrect. The region where x < 0 and y < 0 contains the point (-1, -10) , which is part of the solution set to 5x - 7y > 35, since
5(-1) - 7(-10) > 35, or 65 > 35, is true.$qb$);
select seed_pool_question($qb$CB-e6cb2402$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$3(kx + 13) = 48/17x + 36
In the given equation, k is a constant. The equation has no solution. What is the value of k?$qb$, null, null, null, array[$qb$.9411$qb$, $qb$.9412$qb$, $qb$16/17$qb$]::text[], $qb$The correct answer is 16/17 . It's given that the equation 3(kx + 13) = 48/17x + 36 has no solution. A linear equation in the form ax + b = cx + d,
where a b c, , , and d are constants, has no solution only when the coefficients of x on each side of the equation are equal and the constant terms
aren't equal. Dividing both sides of the given equation by 3 yields , or kx + 13 = 16/17x + 12. Since the coefficients of x
kx + 13 (=16)/1748/51 x + 36/3
on each side of the equation must be equal, it follows that the value of k is . Note that 16/17, .9411, .9412, and 0.941 are examples of ways to
enter a correct answer.$qb$);
select seed_pool_question($qb$CB-e470e19d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 7x - 84. What is the x-intercept of the graph of y = f(x) in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e470e19d.png$qb$, $qb$[{"label": "A", "body": "(-12, 0)"}, {"label": "B", "body": "(-7, 0)"}, {"label": "C", "body": "(7, 0)"}, {"label": "D", "body": "(12, 0)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given function f is a linear function. Therefore, the graph of y = f(x) in the xy-plane has one x-intercept at the point
(k, 0) , where k is a constant. Substituting 0 for f(x) and k for x in the given function yields 0 = 7k - 84. Adding 84 to both sides of this
equation yields 84 = 7k. Dividing both sides of this equation by 7 yields 12 = k. Therefore, the x-intercept of the graph of y = f(x) in the xy-
plane is (12, 0) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-af711d1b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Average time
Distance (kilometers)
(minutes)
(0·56)/(|-0·68)|| |||(-/8|)/41/17|||
The table gives the average time t, in minutes, it takes Carly to travel a certain distance , in kilometers. Which equation could represent this
linear relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-af711d1b.png$qb$, $qb$[{"label": "A", "body": "t = 4d"}, {"label": "B", "body": "t = 1/25 d"}, {"label": "C", "body": "t = 25d"}, {"label": "D", "body": "t = 1/4 d"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The average time t, in minutes, it takes Carly to travel a certain distance d, in kilometers, is given in the table. This linear
relationship can be represented by an equation in the form t = ad+ b, where a and b are constants. The table shows that it takes Carly an
average time of 8 minutes to travel 0·32 kilometers. Substituting 8 for t and 0·32 for d in the equation t = ad + b yields 8 = 0·32a + b.
Subtracting 0·32a from both sides of this equation yields 8 - 0·32a = b. The table also shows that it takes Carly an average time of 14 minutes
to travel 0·56 kilometers. Substituting 14 for t and 0·56 for d in the equation t = ad + b yields 14 = 0·56a + b. Subtracting 0·56a from both
sides of this equation yields 14 - 0·56a = b. Substituting 8 - 0·32a for b in this equation yields 14 - 0·56a = 8 - 0·32a. Subtracting 8 from
both sides of this equation yields 6 - 0·56a = -0·32a. Adding 0·56a to both sides of this equation yields 6 = 0·24a. Dividing both sides of
this equation by 0·24 yields 25 = a. Substituting 25 for a in the equation 8 = 0·32a + b yields 8 = 0·32(25) + b, or 8 = 8 + b. Subtracting 8
from both sides of this equation yields 0 = b. Substituting 25 for a and 0 for b in the equation t = ad + b yields t = 25d + 0, or t = 25d.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f7e39fe9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-/(?-f(x) |)? |(-10)/-?? ||(-20)/(-|)|(-25)/(-|)|82 137 192 247
The table shows four values of x and their corresponding values of . There is a linear relationship between x and f(x) that is defined by the
equation f(x) = mx - 28, where m is a constant. What is the value of m?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f7e39fe9.png$qb$, null, null, array[$qb$11$qb$]::text[], $qb$The correct answer is 11 . It's given that f(x) is defined by the equation f(x) = mx - 28, where m is a constant. It's also given in the table that
when x = 10, f(x) = 82. Substituting 10 for x and 82 for f(x) in the equation f(x) = mx - 28 yields, 82 = m(10) - 28. Adding 28 to
both sides of this equation yields 110 = 10m. Dividing both sides of this equation by 10 yields 11 = m. Therefore, the value of m is 11.$qb$);
select seed_pool_question($qb$CB-4a090a46$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Julissa needs at least 100 hours of flight time to get her private pilot certification. If Julissa already has 86 hours of flight time, what is the
minimum number of additional hours of flight time Julissa needs to get her private pilot certification?$qb$, null, $qb$[{"label": "A", "body": "14"}, {"label": "B", "body": "76"}, {"label": "C", "body": "86"}, {"label": "D", "body": "186"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that Julissa already has 86 hours of flight time. Let x represent the number of additional hours of flight time
Julissa needs to get her private pilot certification. After completing x hours of flight time, Julissa will have completed a total of 86 + x hours of
flight time. It's given that Julissa needs at least 100 hours of flight time to get her private pilot certification. Therefore, 86 + x ≥ 100.
Subtracting 86 from both sides of this inequality yields x ≥ 14. Thus, 14 is the minimum number of additional hours of flight time Julissa needs
to get her private pilot certification.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the number of hours of flight time Julissa already has, rather than the minimum number of additional hours of flight
time Julissa needs.
Choice D is incorrect. This is the number of hours of flight time Julissa will have if she completes 100 more hours of flight time, rather than the
minimum number of additional hours of flight time Julissa needs.$qb$);
select seed_pool_question($qb$CB-415ab1d2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-/-| | | ?| 10|II2??80044662288 | | | | | | | x
The graph of the linear function y = f(x) + 19 is shown. If c and d are positive constants, which equation could define f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-415ab1d2.png$qb$, $qb$[{"label": "A", "body": "f(x) = -d - cx"}, {"label": "B", "body": "f(x) = d - cx"}, {"label": "C", "body": "f(x) = -d + cx"}, {"label": "D", "body": "f(x) = d + cx"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the graph of the linear function y = f(x) + 19 is shown. This means that the graph of y = f(x) + 19 can be
translated down 19 units to create the graph of  and the y-coordinate of every point on the graph of  can be decreased
yy == ff((xx))
by 19 to find the resulting point on the graph of . The y-intercept of the graph of is (0,(-y0,=136))f(^(x)) + 19. Translating the graph of y
y(0=, 3f-(^(x)1)9+) 19
= f(x) + 19 down 19 units results in a y-intercept of the graph of y = f(x) at the point , or . The graph of y= f(x)
+ 19 slants down from left to right, so the slope of the graph is negative. The translation of a linear graph changes its position, but does not
change its slope. It follows that the slope of the graph of y= f(x) is also negative. The equation of a linear function f can be written in the
form f(x) = b + mx, where b is the y-coordinate of the y-intercept and m is the slope of the graph of y= f(x) . It's given that c and d are
positive constants. Since the y-coordinate of the y-intercept and the slope of the graph of y= f(x) are both negative, it follows that f(x) = -d
- cx could define f.
Choice B is incorrect. This could define a linear function where its graph has a positive, not negative, y-intercept.
Choice C is incorrect. This could define a linear function where its graph has a positive, not negative, slope.
Choice D is incorrect. This could define a linear function where its graph has a positive, not negative, y-intercept and a positive, not negative,
slope.$qb$);
select seed_pool_question($qb$CB-aff28230$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x = 10
y = x + 21
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, $qb$[{"label": "A", "body": "2·1"}, {"label": "B", "body": "10"}, {"label": "C", "body": "21"}, {"label": "D", "body": "31"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given by the first equation in the given system of equations that x = 10. Substituting 10 for x in the second equation in
the given system yields y = 10 + 21 , or y = 31. Therefore, the value of y is 31 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of x, not the value of y.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f5929f7a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = - 1/9 x
y = 1/2 x
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "-9"}, {"label": "B", "body": "-7"}, {"label": "C", "body": "0"}, {"label": "D", "body": "2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given by the first equation in the system that . Substituting - 1/9 x for y in the second equation in the system
y2/2= - 1/9 x
yields - 1/9 x = 1/2 x. Multiplying the left-hand side of this equation by  and the right-hand side by 9/9 yields - 2/18 x = 9/18 x. Adding 2/18 x to both
sides of this equation yields 0 = 11/18 x. Multiplying both sides of this equation by 18/11 yields x = 0.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6c71f3ec$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A salesperson’s total earnings consist of a base salary of x dollars per year, plus commission earnings of 11% of the total sales the salesperson
makes during the year. This year, the salesperson has a goal for the total earnings to be at least 3 times and at most 4 times the base salary.
Which of the following inequalities represents all possible values of total sales s, in dollars, the salesperson can make this year in order to meet
that goal?$qb$, null, $qb$[{"label": "A", "body": "2x ≤ s ≤ 3x"}, {"label": "B", "body": "2/(0·11) x ≤ s ≤ 3/(0·11) x"}, {"label": "C", "body": "3x ≤ s ≤ 4x"}, {"label": "D", "body": "3/(0·11) x ≤ s ≤ 4/(0·11) x"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that a salesperson's total earnings consist of a base salary of x dollars per year plus commission earnings of 11%
of the total sales the salesperson makes during the year. If the salesperson makes s dollars in total sales this year, the salesperson’s total
earnings can be represented by the expression x + 0·11s. It’s also given that the salesperson has a goal for the total earnings to be at least 3
times and at most 4 times the base salary, which can be represented by the expressions 3x and 4x, respectively. Therefore, this situation can be
represented by the inequality . Subtracting x from each part of this inequality yields 2x ≤ 0·11s ≤ 3x. Dividing each
3x ≤ (x +2)/(o·11)0x· 1≤1ss≤≤4x
part of this inequality by 0·11 yields 3/(o·11) x. Therefore, the inequality 2/(0·11) x ≤ s ≤ 3/(0·11) x represents all possible values of total
sales s, in dollars, the salesperson can make this year in order to meet their goal.
Choice A is incorrect. This inequality represents a situation in which the total sales, rather than the total earnings, are at least 2 times and at
most 3 times, rather than at least 3 times and at most 4 times, the base salary.
Choice C is incorrect. This inequality represents a situation in which the total sales, rather than the total earnings, are at least 3 times and at
most 4 times the base salary.
Choice D is incorrect. This inequality represents a situation in which the total earnings are at least 4 times and at most 5 times, rather than at
least 3 times and at most 4 times, the base salary.$qb$);
select seed_pool_question($qb$CB-1a2a0f59$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A yoga studio is offering a deal where the first session is free, the second session is half off the regular price, and the remaining sessions are at
the regular price. If the regular price of a session is $25·40, which function f gives the total cost, in dollars, of purchasing x sessions using this
deal, where x ≥ 2?$qb$, null, $qb$[{"label": "A", "body": "f (x) = 25·40(x - 1) + 12·70"}, {"label": "B", "body": "f (x) = 25·40(x - 2) + 12·70"}, {"label": "C", "body": "f (x) = 25·40 (x - 1) + 12·70 (x - 2)"}, {"label": "D", "body": "f (x) = 25·40 (x - 2) + 12·70 (x - 1)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the regular price of a session at a yoga studio is $25·40. It's also given that the yoga studio is offering a deal
where the first session is free, or $0; that the second session is half off the regular price, or $25·40 - (1/2) ($25·40) , which is equal to $12·70;
and that the remaining sessions are at the regular price, $25·40. Since x represents the total number of sessions and two sessions have already
been accounted for, the number of remaining sessions can be represented by x - 2. The total cost, in dollars, of purchasing x sessions using
this deal can be represented by the function f(x) = 0 + 12·70 + 25·40(x - 2), or f(x) = 25·40(x - 2) + 12·70.
Choice A is incorrect. The function represents the total cost of purchasing x sessions when the first session is half off the regular price and the
remaining sessions are at the regular price.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e9908930$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
-/4-/19(- -5)/(? - 18/(-5) |)??? ||| |||
1
2
For the linear function f, the table shows three values of x and their corresponding values of f(x). If h(x) = f(x) - 13, which equation
defines h?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e9908930.png$qb$, $qb$[{"label": "A", "body": "h(x) = 5x - 4"}, {"label": "B", "body": "h(x) = 5x + 7"}, {"label": "C", "body": "h(x) = 5x + 9"}, {"label": "D", "body": "h(x) = 5x + 20"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. An equation that defines a linear function f can be written in the form f(x) = mx + b, where m and b are constants. It's
given in the table that when x = -4f(x) = 0, . Substituting -4 for x and 0 for f(x) in the equation f(x) = mx + b yields 0 = m(-4) + b,
or 0 = -4m + b. Adding 4m to both sides of this equation yields 4m = b. Substituting 4m for b in the equation f(x) = mx + b yields f(x)
= mx + 4m. It's also given in the table that when x = - 19/5 , f(x) = 1. Substituting  for x and 1 for f(x) in the equation f(x) = mx
- 19/55
+ 4m yields , or . Multiplying both sides of this equation by  yields m = 5. Substituting 5 for m in the equation
1 = m(-19/5f)(+xh)(4x=m) =5x5+1x=4+(1/(57^(5)))myields , or f(x) = 5x + 20. If h(x) = f(x) - 13, substituting 5x + 20 for f(x) in this equation yields
fh((^(x)x)) ==^(m)(5^(x)x ++ 42^(m)0) - 13
, or .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is an equation that defines the linear function f, not h.$qb$);
select seed_pool_question($qb$CB-7392dfc1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following is equivalent to  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7392dfc1.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Dividing each side of the original equation by  yields , which simplifies to .
Choice A is incorrect. Dividing each side of the original equation by  gives , which is not equivalent to . Choice B is
incorrect. Dividing each side of the original equation by  gives , which is not equivalent to . Choice C is incorrect.
Dividing each side of the original equation by  gives , which is not equivalent to .$qb$);
select seed_pool_question($qb$CB-d914abec$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$To complete a landscaping project, Adam charges a fee of $20·00 for his equipment and $9·50 per hour spent working on the project. To
complete this same landscaping project, Caroline charges a fee of $17·00 for her equipment and $10·00 per hour spent working on the project.
If x represents the number of hours spent working on the landscaping project, what are all the values of x for which Caroline's total charge is
greater than Adam's total charge?$qb$, null, $qb$[{"label": "A", "body": "5 ≤ x ≤ 6"}, {"label": "B", "body": "6 ≤ x ≤ 7"}, {"label": "C", "body": "x < 5"}, {"label": "D", "body": "x > 6"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that Adam charges a fee of $20·00 for his equipment and $9·50 per hour spent working on the project. For x hours
spent working on the project, it follows that Adam's total charge, in dollars, is 20·00 + 9·50x. It's also given that Caroline charges a fee of
$17·00 for her equipment and $10·00 per hour spent working on the project. For x hours spent working on the project, it follows that Caroline's
total charge, in dollars, is 17·00 + 10·00x. Therefore, if x represents the number of hours spent working on the landscaping project, then
Caroline's total charge is greater than Adam's total charge if 17·00 + 10·00x > 20·00 + 9·50x, or 17 + 10x > 20 + 9·5x. Subtracting 9·5x
from both sides of this inequality yields 17 + 0·5x > 20. Subtracting 17 from both sides of this inequality yields 0·5x > 3. Dividing both sides
of this inequality by 0·5 yields x > 6.
Choice A is incorrect. For example, if x = 5, then Caroline’s total charge, in dollars, would be 17·00 + 10·00(5) , or 67, and Adam’s total charge,
in dollars, would be 20·00 + 9·50(5) , or 67·50. Since Caroline’s total charge would be less than Adam’s total charge, 5 can’t be a possible value
of x.
Choice B is incorrect. For example, if x = 6, then Caroline’s total charge, in dollars, would be 17·00 + 10·00(6), or 77, and Adam’s total charge,
in dollars, would be 20·00 + 9·50(6) , or 77. Since Caroline’s total charge would be equal to Adam’s total charge, 6 can’t be a possible value of x.
Choice C is incorrect. For example, if x = 4, then Caroline’s total charge, in dollars, would be 17·00 + 10·00(4) , or 57, and Adam’s total charge,
in dollars, would be 20·00 + 9·50(4) , or 58. Since Caroline’s total charge would be less than Adam’s total charge, 4 can’t be a possible value of
x.$qb$);
select seed_pool_question($qb$CB-51568fb9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the slope of the graph of 10x - 5y = -12 in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "-2"}, {"label": "B", "body": "- 5/6"}, {"label": "C", "body": "5/6"}, {"label": "D", "body": "2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A linear equation can be written in the form y = mx + b, where m is the slope of the graph of the equation in the xy-plane
and (0, b) is the y-intercept. Subtracting 10x from each side of the given equation, 10x - 5y = -12, yields -5y = -10x - 12. Dividing each
side of this equation by -5 yields y = 2x + 12/5. This equation is in the form y = mx + b, where m = 2. Therefore, the slope of the graph of
the given equation in the xy-plane is 2.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ee1f63c0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f (x) = 6·2x. What is the value of f(x) when x = 10?$qb$, null, $qb$[{"label": "A", "body": "72"}, {"label": "B", "body": "62"}, {"label": "C", "body": "17·2"}, {"label": "D", "body": "16·2"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the function f is defined by f(x) = 6·2x. The value of f(x) when x = 10 can be found by substituting 10 for
x in f(x) = 6·2x, which yields f(10) = 6·2(10) , or f(10) = 62. Therefore, when x = 10, the value of f(x) is 62.
Choice A is incorrect. This is the value of f(10) + 10, not the value of f(x) when x = 10.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of 6·2 + 10, not the value of f(x) when x = 10.$qb$);
select seed_pool_question($qb$CB-9aaf7786$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, line p has a slope of - 5/3 and an x-intercept of (-6, 0) . What is the y-coordinate of the y-intercept of line p?$qb$, null, null, null, array[$qb$-10$qb$]::text[], $qb$The correct answer is -10. A line in the xy-plane can be represented by the equation y = mx + b, where m is the slope of the line and b is the y-
coordinate of the y-intercept. It's given that line p has a slope of - 5/3 . Therefore, m = - 5/3 . It's also given that line p has an x-intercept of
(-6, 0) . Therefore, when x = -6y = 0, . Substituting - 5/3 for m -6,  for x, and 0 for y in the equation y = mx + b yields 0 = (-5/3) (-6)
+ b, which is equivalent to 0 = 10 + b. Subtracting 10 from both sides of this equation yields -10 = b. Therefore, the y-coordinate of the y-
intercept of line p is -10.$qb$);
select seed_pool_question($qb$CB-ea8bd66f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 4x
5x - 3y = -14
The solution to the given system of equations is (x, y) . What is the value of x + y?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "6"}, {"label": "C", "body": "8"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The first equation in the given system is y = 4x. Substituting 4x for y in the second equation yields 5x - 3(4x) = -14,
which is equivalent to 5x - 12x = -14, or -7x = -14. Dividing both sides of this equation by -7 yields x = 2. Substituting 2 for x in the
equation y = 4x yields y = 4(2) , or y = 8. Substituting 2 for x and 8 for y in the expression x + y yields 2 + 8, or 10.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of y - x, not the value of x + y.
Choice C is incorrect. This is the value of y, not the value of x + y.$qb$);
select seed_pool_question($qb$CB-93954cfa$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$One pound of grapes costs $2. At this rate, how many dollars will c pounds of grapes cost?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-93954cfa.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. If one pound of grapes costs $2, two pounds of grapes will cost 2 times $2, three pounds of grapes will cost 3 times $2, and
so on. Therefore, c pounds of grapes will cost c times $2, which is 2c dollars.
Choice B is incorrect and may result from incorrectly adding instead of multiplying. Choice C is incorrect and may result from assuming that c
pounds cost $2, and then finding the cost per pound. Choice D is incorrect and could result from incorrectly assuming that 2 pounds cost $c, and
then finding the cost per pound.$qb$);
select seed_pool_question($qb$CB-5cf1bbc9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$44442222333355IIII0000000000555555555500000000000000000000??/(111 222 ?33 444 ?55 ?66 ?77 888 ?99 ?1100)| || || || || || || || || || || |x
The graph of the function f, where y = f(x), gives the total cost y, in dollars, for a certain video game system and x games. What is the best
interpretation of the slope of the graph in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5cf1bbc9.png$qb$, $qb$[{"label": "A", "body": "Each game costs ?25."}, {"label": "B", "body": "The video game system costs ?100."}, {"label": "C", "body": "The video game system costs ?25."}, {"label": "D", "body": "Each game costs ?100."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given graph is a line, and the slope of a line is defined as the change in the value of y for each increase in the value of x
by 1 . It’s given that y represents the total cost, in dollars, and that x represents the number of games. Therefore, the change in the value of y for
each increase in the value of x by 1 represents the change in total cost, in dollars, for each increase in the number of games by 1. In other words,
the slope represents the cost, in dollars, per game. The graph shows that when the value of x increases from 0 to 1, the value of y increases
from 100 to 125. It follows that the slope is 25, or the cost per game is $25. Thus, the best interpretation of the slope of the graph is that each
game costs $25.
Choice B is incorrect. This is an interpretation of the y-intercept of the graph rather than the slope of the graph.
Choice C is incorrect. The slope of the graph is the cost per game, not the cost of the video game system.
Choice D is incorrect. Each game costs $25, not $100.$qb$);
select seed_pool_question($qb$CB-114ae8a9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A train traveled 173 miles in the first 3 hours of a trip and traveled at an average speed of 53 miles per hour for the remainder of the trip. Which
equation gives the total number of miles, y, the train traveled if the trip was x hours long and x > 3?$qb$, null, $qb$[{"label": "A", "body": "y = 53x + 173"}, {"label": "B", "body": "y = 53x + 14"}, {"label": "C", "body": "y = 14x + 226"}, {"label": "D", "body": "y = 14x + 53"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that a train traveled 173 miles in the first 3 hours of a trip. It's also given that the train traveled at an average speed
of 53 miles per hour for the remainder of the trip. Since the trip was x hours long, it follows that the remainder of the trip was x - 3 hours.
Therefore, 53(x - 3) represents the distance, in miles, the train traveled for the remainder of the trip. Adding 173 to 53(x - 3) gives the total
number of miles, y, the train traveled if the trip was x hours long and x > 3. It follows that y = 173 + 53(x - 3) , which is equivalent to y
= 173 + 53x - 159, or y = 53x + 14.
Choice A is incorrect. This equation gives the total number of miles, y, the train traveled if the trip was x + 3, not x, hours long.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-74c03c21$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A bus traveled on the highway and on local roads to complete a trip of 160mi1eS. The trip took 4 h0urS. The bus traveled at an average speed
of 55miIeSPerh0ur (mPh) on the highway and an average speed of 25mPh on local roads. If x is the time, in hours, the bus traveled on
the highway and y is the time, in hours, it traveled on local roads, which system of equations represents this situation?$qb$, null, $qb$[{"label": "A", "body": "x55+xy+=251y6=04"}, {"label": "B", "body": "x55+xy+=254y = 160"}, {"label": "C", "body": "x25+xy+=551y6=04"}, {"label": "D", "body": "x25+xy+=554y = 160"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. If the bus traveled at an average speed of 55miIeSPerh0ur (mPh) on the highway for x hours, then the bus traveled
55x miles on the highway. If the bus traveled at an average speed of 25mPh on local roads for y hours, then the bus traveled 25y miles on
local roads. It's given that the trip was 160 miles. This can be represented by the equation 55x + 25y = 160. It's also given that the trip took 4
hours. This can be represented by the equation x + y = 4. Therefore, the system consisting of the equations 55x + 25y = 160 and
x + y = 4 represents this situation.
Choice A is incorrect. This system of equations represents a situation where the trip was 4 miles and took 160 hours.
Choice C is incorrect. This system of equations represents a situation where the trip was 4 miles and took 160 hours, and the bus traveled at an
average speed of 25mPh on the highway and 55mPh on local roads.
Choice D is incorrect. This system of equations represents a situation where the bus traveled at an average speed of 25mPh on the highway
and 55mPh on local roads.$qb$);
select seed_pool_question($qb$CB-b51c173d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For the linear function f, the graph of y= f(x) in the xy-plane has a slope of 2 and has a y-intercept at (0, -5) . Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 1/2 x - 5"}, {"label": "B", "body": "f(x) = - 1/2 x - 5"}, {"label": "C", "body": "f(x) = -2x - 5"}, {"label": "D", "body": "f(x) = 2x - 5"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. An equation defining the linear function f can be written in the form f(x) = mx + b, where m is the slope and (0, b) is the
y-intercept of the graph of y= f(x) in the xy-plane. It’s given that the graph of y = f(x) has a slope of 2. Therefore, m = 2. It’s also given that
the graph of y = f(x) has a y-intercept at (0, -5). Therefore, b = -5. Substituting 2 for m and -5 for b in the equation f(x) = mx + b
yields f(x) = 2x - 5. Thus, the equation that defines f is f(x) = 2x - 5.
Choice A is incorrect. For this function, the graph of y = f(x) in the xy-plane has a slope of 1/2 , not 2.
Choice B is incorrect. For this function, the graph of y= f(x) in the xy-plane has a slope of - 1/2 , not 2.
Choice C is incorrect. For this function, the graph of y = f(x) in the xy-plane has a slope of -2, not 2.$qb$);
select seed_pool_question($qb$CB-8383771a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x + y = 20
One of the two equations in a system of linear equations is given. The system has exactly one solution. Which equation could be the second
equation in the system?$qb$, null, $qb$[{"label": "A", "body": "3x + 3y = 60"}, {"label": "B", "body": "-x - y = 40"}, {"label": "C", "body": "3x + 3y = 14"}, {"label": "D", "body": "x - y = 20"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A system of two linear equations in two variables, x and y, has exactly one solution if the graphs of the lines represented by
the equations in the xy-plane have different slopes. In the xy-plane, the slope of a line defined by an equation in the form Ax + By = C, where
AB, , and C are constants, is . It’s given that one equation in the system is x + y = 20. It follows that for this equation, A = 1 and B = 1 .
--A/B1/1
Therefore, the value of - A/B is , or -1. For the equation in choice D, x - y = 20A = 1,  and B = -1. Therefore, the value of - A/B is
-1/(-1) , or 1. Since the slopes are different, it follows that the system of x + y = 20 and x - y = 20 has exactly one solution. Thus, the second
equation in the system could be x - y = 20.
Choice A is incorrect. The equation 3x + 3y = 60 can be rewritten as x + y = 20. Since x + y = 20 is the same as the given equation, the
system of 3x + 3y = 60 and x + y = 20 has infinitely many solutions rather than exactly one solution.
Choice B is incorrect. The equation -x - y = 40 can be rewritten as x + y = -40. The graph of this line has a slope of -1. Since the graphs
of the lines represented by the equations x + y = -40 and x + y = 20 have the same slope in the xy-plane and the equations aren't equivalent,
this system has no solution rather than exactly one solution.
Choice C is incorrect. The equation 3x + 3y = 14 can be rewritten as x + y = 14/3 . The graph of this line has a slope of -1 . Since the graphs of
the lines represented by the equations x + y = 14/3 and x + y = 20 have the same slope in the xy-plane and the equations aren't equivalent, this
system has no solution rather than exactly one solution.$qb$);
select seed_pool_question($qb$CB-68f2cbaf$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Ty set a goal to walk at least 24 kilometers every day to prepare for a multiday hike. On a certain day, Ty plans to walk at an average speed of 4
kilometers per hour. What is the minimum number of hours Ty must walk on that day to fulfill the daily goal?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "6"}, {"label": "C", "body": "20"}, {"label": "D", "body": "24"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that Ty plans to walk at an average speed of 4 kilometers per hour. The number of kilometers Ty will walk is
determined by the expression 4s, where s is the number of hours Ty walks. The given goal of at least 24 kilometers means that the inequality 4s
≥ 24 represents the situation. Dividing both sides of this inequality by 4 gives s ≥ 6 , which corresponds to a minimum of 6 hours Ty must
walk.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8abed0fb$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the solution  to the given system of equations?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8abed0fb.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since it’s given that , substituting 1 for x in the first equation yields . Simplifying the right-hand side of
this equation yields , or . Therefore, the ordered pair  is a solution to the given system of equations.
Choice A is incorrect and may result from a calculation error when substituting 1 for x in the first equation. Choices C and D are incorrect.
Because it’s given that , x cannot equal 2 as stated in these ordered pairs.$qb$);
select seed_pool_question($qb$CB-e1259a5a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A system of two linear equations is graphed in the xy-plane below.
Which of the following points is the solution to the system of equations?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e1259a5a.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The solution to this system of linear equations is the point that lies on both lines graphed, or the point of intersection of the
two lines. According to the graphs, the point of intersection occurs when  and , or at the point .
Choices B and D are incorrect. Each of these points lies on one line, but not on both lines in the xy-plane. Choice C is incorrect. This point doesn’t
lie on either of the lines graphed in the xy-plane.$qb$);
select seed_pool_question($qb$CB-c81f1c2f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = 45x + 600
The function f gives the monthly fee f(x) , in dollars, a facility charges to keep x crates in storage. What is the monthly fee, in dollars, the facility
charges to keep 50 crates in storage?$qb$, null, null, null, array[$qb$2850$qb$]::text[], $qb$The correct answer is 2,850. It’s given that the function  gives the monthly fee, in dollars, a facility charges to keep x crates
ff(5(0^(x))) == 4455(^(x)50+) 6+00600
in storage. Substituting 50 for x in this function yields , or f(50) = 2,850. Therefore, the monthly fee, in dollars, the
facility charges to keep 50 crates in storage is 2,850.$qb$);
select seed_pool_question($qb$CB-4047cfa7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a literature class, a student's essay needs to have no more than 5,000 words. If a student's essay already has 3,026 words, what is the
maximum number of additional words the student can include in the essay?$qb$, null, $qb$[{"label": "A", "body": "1,974"}, {"label": "B", "body": "3,026"}, {"label": "C", "body": "5,000"}, {"label": "D", "body": "8,026"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a student's essay needs to have no more than 5,000 words. It’s also given that the student’s essay already has
3,026 words. Let x represent the number of additional words the student includes in the essay. After including x additional words, the essay will
have a total of 3,026 + x words. Since the essay needs to have no more than 5,000 words, it follows that 3,026 + x ≤ 5,000. Subtracting
3,026 from both sides of this inequality yields x ≤ 1,974. Thus, the maximum number of additional words the student can include in the essay
is 1,974.
Choice B is incorrect. This is the number of words already in the student's essay, rather than the maximum number of additional words the
student can include.
Choice C is incorrect. This is the total number of words the essay can contain, rather than the maximum number of additional words the student
can include.
Choice D is incorrect. This is the number of words the essay would contain if the student added 5,000 more words, rather than the maximum
number of additional words the student can include.$qb$);
select seed_pool_question($qb$CB-4702da8f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 80 - 6x. What is the value of f(7) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4702da8f.png$qb$, $qb$[{"label": "A", "body": "13"}, {"label": "B", "body": "38"}, {"label": "C", "body": "74"}, {"label": "D", "body": "81"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that function f is defined by f(x) = 80 - 6x. The value of  can be found by substituting 7 for x in the given
f(7)f=(7)38
function, which yields f(7) = 80 - 6(7) , or f(7) = 80 - 42, which is equivalent to . Therefore, the value of f(7) is 38.
Choice A is incorrect. This is the value of 80 - 67, not 80 - 6(7).
Choice C is incorrect. This is the value of 80 - 6(1) , not 80 - 6(7).
Choice D is incorrect. This is the value of 80 - 6 + 7, not 80 - 6(7).$qb$);
select seed_pool_question($qb$CB-018a2704$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 46 = 16 + 2(x - 8) , what is the value of 2(x - 8) ?$qb$, null, $qb$[{"label": "A", "body": "16"}, {"label": "B", "body": "23"}, {"label": "C", "body": "30"}, {"label": "D", "body": "38"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Subtracting 16 from both sides of the given equation yields 30 = 2(x - 8) . Therefore, the value of 2(x - 8) is 30.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b988eeec$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The functions f and g are defined as f(x) = 1/4 x - 9 and g(x) = 3/4x + 21 . If the function h is defined as h(x) = f(x) + g(x) , what is the
x-coordinate of the x-intercept of the graph of y = h(x) in the xy-plane?$qb$, null, null, null, array[$qb$-12$qb$]::text[], $qb$The correct answer is -12. It's given that the functions f and g are defined as  and g(x) = 3/4x + 21 . If the function h is
f(x) = 1/(g4()xx)- 9
defined as h(x) = f(x) + g(x), then substituting for f(x) and 3/4x + 21 for in this function yields h(x) = 1/4 x - 9 + 3/4 x
+ 21. This can be rewritten as h(x) = 4/4x + 12y = 1/(h^(4))h(xx(x-) )9= x + 12, or . The x-intercept of a graph in the xy-plane is the point on the graph where
y = 0. The equation representing the graph of  is y = x + 12. Substituting 0 for y in this equation yields 0 = x + 12. Subtracting 12
from both sides of this equation yields -12 = x, or x = -12. Therefore, the x-coordinate of the x-intercept of the graph of y = h(x) in the xy-
plane is -12.$qb$);
select seed_pool_question($qb$CB-3d04de9c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A principal used a total of 25 flags that were either blue or yellow for field day. The principal used 20 blue flags. How many yellow flags were
used?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "20"}, {"label": "C", "body": "25"}, {"label": "D", "body": "30"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a principal used a total of 25 blue flags and yellow flags. It's also given that of the 25 flags used, 20 flags were
blue. Subtracting the number of blue flags used from the total number of flags used results in the number of yellow flags used. It follows that the
number of yellow flags used is 25 - 20, or 5.
Choice B is incorrect. This is the number of blue flags used.
Choice C is incorrect. This is the total number of flags used.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-70feb725$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$During a month, Morgan ran r miles at 5 miles per hour and biked b miles at 10 miles per hour. She ran and biked a total of 200 miles that month,
and she biked for twice as many hours as she ran. What is the total number of miles that Morgan biked during the month?$qb$, null, $qb$[{"label": "A", "body": "80"}, {"label": "B", "body": "100"}, {"label": "C", "body": "120"}, {"label": "D", "body": "160"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The number of hours Morgan spent running or biking can be calculated by dividing the distance she traveled during that
activity by her speed, in miles per hour, for that activity. So the number of hours she ran can be represented by the expression , and the
number of hours she biked can be represented by the expression . It’s given that she biked for twice as many hours as she ran, so this can
be represented by the equation , which can be rewritten as . It’s also given that she ran r miles and biked b miles, and
that she ran and biked a total of 200 miles. This can be represented by the equation . Substituting  for b in this equation yields
, or . Solving for r yields . Determining the number of miles she biked, b, can be found by substituting 40 for r in
, which yields . Solving for b yields .
Choices A, B, and C are incorrect because they don’t satisfy that Morgan biked for twice as many hours as she ran. In choice A, if she biked 80
miles, then she ran 120 miles, which means she biked for 8 hours and ran for 24 hours. In choice B, if she biked 100 miles, then she ran 100
miles, which means she biked for 10 hours and ran for 20 hours. In choice C, if she biked 120 miles, then she ran for 80 miles, which means she
biked for 12 hours and ran for 16 hours.$qb$);
select seed_pool_question($qb$CB-590d662d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$While walking on a trail, Mary stopped to read a trail sign. The graph shows the total distance y, in meters, Mary had walked on the trail x
minutes after leaving the trail sign.
y
900
800
700
600
500
|| | | | | | | | | | | ?
400
300
200
100
x
O 1 2 3 4 5 6 7 8 9 10
What distance, in meters, did Mary walk on the trail in the 10 minutes after leaving the trail sign?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-590d662d.png$qb$, null, null, array[$qb$500$qb$]::text[], $qb$The correct answer is 500. It’s given that the graph shows the total distance y, in meters, Mary had walked on the trail x minutes after leaving the
trail sign. The graph represents a linear relationship between time and distance, so the distance walked in a given time interval corresponds to
the change in the y-values over that interval. At x = 0, the graph shows a y-value of 150, and at x = 10, the graph shows a y-value of 650. The
distance Mary walked in the 10 minutes after leaving the trail sign is the difference between these y-values, which can be written as 650 - 150,
or 500. Therefore, the distance, in meters, Mary walked in the 10 minutes after leaving the trail sign is 500.$qb$);
select seed_pool_question($qb$CB-8a87c2c8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x + 3 = -2y + 5
x - 3 = 2y + 7
The solution to the given system of equations is (x, y) . What is the value of 2x?$qb$, null, $qb$[{"label": "A", "body": "-2"}, {"label": "B", "body": "6"}, {"label": "C", "body": "12"}, {"label": "D", "body": "24"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Adding the second equation in the given system to the first equation in the given system yields (x + 3) + (x - 3)
= (-2y + 5) + (2y + 7) . Adding like terms in this equation yields 2x = 12. Thus, the value of 2x is 12.
Choice A is incorrect. This is the value of y, not 2x.
Choice B is incorrect. This is the value of x, not 2x.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-60f71697$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$8x = 88
What value of x is the solution to the given equation?$qb$, null, $qb$[{"label": "A", "body": "11"}, {"label": "B", "body": "80"}, {"label": "C", "body": "96"}, {"label": "D", "body": "704"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Dividing both sides of the given equation by 8 yields x = 11. Therefore, 11 is the solution to the given equation.
Choice B is incorrect. This is the solution to the equation x + 8 = 88.
Choice C is incorrect. This is the solution to the equation x - 8 = 88.
Choice D is incorrect. This is the solution to the equation x/8 = 88.$qb$);
select seed_pool_question($qb$CB-9a216c0f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The combined original price for a mirror and a vase is $60. After a 25% discount to the mirror and a 45% discount to the vase are applied, the
combined sale price for the two items is $39. Which system of equations gives the original price m, in dollars, of the mirror and the original price
v, in dollars, of the vase?$qb$, null, $qb$[{"label": "A", "body": "m + v = 60 0·55m + 0·75v = 39"}, {"label": "B", "body": "m + v = 60 0·45m + 0·25v = 39"}, {"label": "C", "body": "m + v = 60 0·75m + 0·55v = 39"}, {"label": "D", "body": "m + v = 60 0·25m + 0·45v = 39"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that m represents the original price, in dollars, of the mirror, and v represents the original price, in dollars, of the
vase. It's also given that the combined original price for the mirror and the vase is $60. This can be represented by the equation m + v = 60.
After a 25% discount to the mirror is applied, the sale price of the mirror is 75% of its original price. This can be represented by the expression
0·75m. After a 45% discount to the vase is applied, the sale price of the vase is 55% of its original price. This can be represented by the
expression 0·55v. It’s given that the combined sale price for the two items is $39. This can be represented by the equation 0·75m + 0·55v
= 39. Therefore, the system of equations consisting of the equations m + v = 60 and 0·75m + 0·55v = 39 gives the original price m, in
dollars, of the mirror and the original price v, in dollars, of the vase.
Choice A is incorrect. The second equation in this system of equations represents a 45% discount to the mirror and a 25% discount to the vase.
Choice B is incorrect. The second equation in this system of equations represents a 55% discount to the mirror and a 75% discount to the vase.
Choice D is incorrect. The second equation in this system of equations represents a 75% discount to the mirror and a 55% discount to the vase.$qb$);
select seed_pool_question($qb$CB-13294295$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The graph shown models the number of candy bars a certain machine wraps with a label in x seconds.
fdbdnO?S?Caaappe??
????????222222IIIIIIII1100004444442040608066662222228888000000000000000000000000??/(222 444 666 888 101100)| || || || || || |x
b?m^(?)e?
?ime (SeCondS)
According to the graph, what is the estimated number of candy bars the machine wraps with a label per second?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-13294295.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "40"}, {"label": "C", "body": "78"}, {"label": "D", "body": "80"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. For the graph shown, the x-axis represents time, in seconds, and the y-axis represents the number of candy bars wrapped.
The slope of a line in the xy-plane is the change in y for each 1 -unit increase in x. It follows that the slope of the graph shown represents the
estimated number of candy bars the machine wraps with a label per second. The slope, m, of a line in the xy-plane can be found using any two
points, (x1 , y1 ) and (x2 , y2 ), on the line and the slope formula m = (y2-y1)/(x2 -x1) . The graph shown passes through the points (0, 0) and .
m = (8(02)/2 , 80)
Substituting these points for (x1 , y1 ) and (x2 , y2 ), respectively, in the slope formula yields , which is equivalent to , or
m = (8o-o)/(2-0)40
m = 40. Therefore, the estimated number of candy bars the machine wraps with a label per second is .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0d5495a6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$h(x) = x + b
For the linear function h, b is a constant and h(0) = 45. What is the value of b?$qb$, null, null, null, array[$qb$45$qb$]::text[], $qb$The correct answer is 45. It’s given that h(0) = 45. Therefore, for the given function h, when x = 0, h(x) = 45. Substituting 0 for x and 45 for
h(x) in the given function, h(x) = x + b, yields 45 = 0 + b, or 45 = b. Therefore, the value of b is 45.$qb$);
select seed_pool_question($qb$CB-fc4a0d2a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$g (x) = 3 (14x - 15)
What is the y-coordinate of the y-intercept of the graph of y = g (x) - 2 in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fc4a0d2a.png$qb$, $qb$[{"label": "A", "body": "-47"}, {"label": "B", "body": "-45"}, {"label": "C", "body": "-17"}, {"label": "D", "body": "-15"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that g(x) = 3(14x - 15) . Substituting 3 (14x - 15) for g(x) in the equation y = g(x) - 2 yields y = 3(14x
- 15) - 2. The y-intercept of the graph of a function in the xy-plane is the point where the function crosses the y-axis, which occurs when x
= 0. Substituting 0 for x in the equation yields . It follows that y = -45 - 2, or y = -47.
yy == g3((x14)x--215) - 2 y =(0,3-(1447()0) - 15) - 2
Therefore, the y-intercept of the graph of in the xy-plane is , and the y-coordinate of the y-intercept of the graph is -47.
Choice B is incorrect. This is the y-coordinate of the y-intercept of the graph of y = g(x) in the xy-plane, not y = g(x) - 2.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ed92fb68$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If the system of equations above has solution , what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ed92fb68.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "9"}, {"label": "C", "body": "18"}, {"label": "D", "body": "38"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Adding the given equations yields 9x + 9y = 162. Dividing each side of the equation 9x + 9y = 162 by 9 gives x + y = 18.
Choice A is incorrect and may result from incorrectly adding the equations. Choice B is incorrect and may result from conceptual or
computational errors. Choice D is incorrect. This value is equivalent to y – x.$qb$);
select seed_pool_question($qb$CB-6ba39da5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$2a + 8b = 198
2a + 4b = 98
The solution to the given system of equations is (a, b) . What is the value of b?$qb$, null, null, null, array[$qb$25$qb$]::text[], $qb$The correct answer is 25. Subtracting the second equation from the first equation in the given system of equations yields (2a - 2a)
+ (8b - 4b) = 198 - 98, which is equivalent to 0 + 4b = 100, or 4b = 100. Dividing each side of this equation by 4 yields b = 25.$qb$);
select seed_pool_question($qb$CB-33e4af6b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-/--/--/--/-(y-|)/-|?÷?÷÷864244662288 | | | | | | x
The graph of the function f is shown, where y= f(x) . What is the y-intercept of the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-33e4af6b.png$qb$, $qb$[{"label": "A", "body": "(0, -1)"}, {"label": "B", "body": "(0, -4)"}, {"label": "C", "body": "(0, 1)"}, {"label": "D", "body": "(0, 4)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The y-intercept of a graph is the point where the graph intersects the y-axis. The graph of function f shown intersects the y-
axis at the point (0, -4). Therefore, the y-intercept of the graph is (0, -4).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-bbb0359a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-/(|-^(y) ?)| ?(-1)/(-11 |)|(-2)/(-16 |)|(-3)/(-21 |)|
The table shows three values of x and their corresponding values of y. Which equation represents the linear relationship between x and y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bbb0359a.png$qb$, $qb$[{"label": "A", "body": "y = 5x + 6"}, {"label": "B", "body": "y = 5x + 11"}, {"label": "C", "body": "y = 6x + 5"}, {"label": "D", "body": "y = 6x + 11"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The linear relationship between x and y can be represented by the equation y = mx + b, where m is the slope of the line in
the xy-plane that represents the relationship, and b is the y-coordinate of the y-intercept. The slope can be computed using any two points on the
line. The slope of a line between any two points, (x1 , y1 ) and (x2 , y2 ) , on the line can be calculated using the slope formula, m = (y2-y1)/(x2 -xI) . In the
given table, each value of x and its corresponding value of y can be represented by a point (x, y) . In the given table, when the value of x is 1, the
corresponding value of y is 11 and when the value of x is 2, the corresponding value of y is 16. Therefore, the points  and (2, 16) are on
m = (16-(111)/(2-1), 1 1)
the line. Substituting (1, 11) and (2, 16) for (x1 , y1 ) and (x2 , y2 ) , respectively, in the slope formula yields , or m = 5. Substituting
5 for m in the equation y = mx + b yields y = 5x + b. Substituting the first value of x in the table, 1, and its corresponding value of y11, , for
x and y, respectively, in this equation yields 11 = 5(1) + b, or 11 = b + 5. Subtracting 5 from both sides of this equation yields 6 = b.
Substituting 6 for b in the equation y = 5x + b yields y = 5x + 6. Therefore, the equation y = 5x + 6 represents the linear relationship
between x and y.
Choice B is incorrect. For this relationship, when the value of x is 1, the corresponding value of y is 16, not 11.
Choice C is incorrect. For this relationship, when the value of x is 2, the corresponding value of y is 17, not 16.
Choice D is incorrect. For this relationship, when the value of x is 1 , the corresponding value of y is 17, not 11 .$qb$);
select seed_pool_question($qb$CB-606cdce7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x
-/6-/3-/3???? ||||(-y)/6556/38||||
The table shows four values of x and their corresponding values of y. There is a linear relationship between x and y. Which of the following
equations represents this relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-606cdce7.png$qb$, $qb$[{"label": "A", "body": "9x + 3y = 141"}, {"label": "B", "body": "9x + 3y = 3"}, {"label": "C", "body": "3x + 9y = 141"}, {"label": "D", "body": "3x + 9y = 3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. An equation representing the linear relationship between x and y can be written in slope-intercept form y = mx + b, where
m is the slope of the graph of the equation in the xy-plane and (0, b) is the y-intercept. The slope, m, can be calculated using two ordered pairs,
(x1 , y1 ) and (x2 , y2 ) , and the formula . Substituting the ordered pairs and (6, 29) from the table for (x1 , y1 ) and
m (=-(6-^(,)366)/125)
(x2 , y2 ) , respectively, in this formula yields m =m(y2-y1)/(x=2 -x1)(29-65)/(6-(-6())-6, 65), which is equivalent to , or m = -3. Substituting -3 for m in the formula y
= mx + b yields y = -3x + b. Substituting the point into this equation yields 65 = -3(-6) + b, or 65 = 18 + b. Subtracting 18
from both sides of this equation yields 47 = b. Substituting 47 for b in the equation y = -3x + b yields y = -3x + 47. Adding 3x to both
sides of this equation yields 3x + y = 47. Multiplying both sides of this equation by 3 yields 9x + 3y = 141 .
Choice B is incorrect. Substituting the point (-6, 65) from the table into this equation yields 9(-6) + 3(65) = 3, or 141 = 3, which is false.
Choice C is incorrect. Substituting the point (-6, 65) from the table into this equation yields 3(-6) + 9(65) = 141 , or 567 = 141, which is
false.
Choice D is incorrect. Substituting the point (-6, 65) from the table into this equation yields 3(-6) + 9(65) = 3, or 567 = 3, which is false.$qb$);
select seed_pool_question($qb$CB-8eb0e19e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(?II2468??44662288)/(-/--/--/-666 444 222÷÷÷642446622 222 ??? 666 888 10II00)|| || || || || ?|| | || || || || || || || || || || | x
The graph of the linear function f is shown, where y = f(x). Which equation defines function f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8eb0e19e.png$qb$, $qb$[{"label": "A", "body": "f (x) = -2x - 8"}, {"label": "B", "body": "f (x) = -2x + 8"}, {"label": "C", "body": "f (x) = 2x - 8"}, {"label": "D", "body": "f (x) = 2x + 8"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A linear function can be defined by the equation f (x) = mx + b, where m is the slope and (0, b) is the y-intercept of the
graph of in the xy-plane. The slope of a line that passes through the points and (x2 , y2 ) can be calculated using the equation
. The line shown passes through the points (4, 0) and (0, 8). Substituting(^(x)(4^(1),^(,)0y()0^(1)), 8) (x1, y1) for and (0, 8) for (x2 , y2 ) in the equation
mm ==8 (y2-yyI=)/(x2 -x1)(y2-yI)/(x2 -bx1) f (x )
yields , or m = -2. Since the line shown passes through the point , it follows that b = 8. Substituting -2 for m
m = (8-0)/(^(0)-f^(4)() x) = mx + b
and  for  in the equation yields f (x) = -2x + 8. Therefore, the equation f (x) = -2x + 8 defines function f.
Choice A is incorrect. This equation defines a linear function whose graph has a slope of -2 and a y-intercept of (0, -8) , not (0, 8) .
Choice C is incorrect. This equation defines a linear function whose graph has a slope of 2, not -2, and a y-intercept of (0, -8), not (0, 8) .
Choice D is incorrect. This equation defines a linear function whose graph has a slope of 2, not -2, and a y-intercept of (0, 8).$qb$);
select seed_pool_question($qb$CB-1a621af4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A number x is at most 2 less than 3 times the value of y. If the value of y is -4, what is the greatest possible value of x?$qb$, null, null, null, array[$qb$-14$qb$]::text[], $qb$The correct answer is -14. It's given that a number x is at most 2 less than 3 times the value of y. Therefore, x is less than or equal to 2 less
than 3 times the value of y. The expression 3y represents 3 times the value of y. The expression 3y - 2 represents 2 less than 3 times the value
of y. Therefore, x is less than or equal to 3y - 2. This can be shown by the inequality x ≤ 3y - 2. Substituting -4 for y in this inequality yields
x ≤ 3(-4) - 2 or, x ≤ -14. Therefore, if the value of y is -4, the greatest possible value of x is -14.$qb$);
select seed_pool_question($qb$CB-3e9eaffc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Caleb used juice to make popsicles. The function f(x) = -5x + 30 approximates the volume, in fluid ounces, of juice Caleb had remaining
after making x popsicles. Which statement is the best interpretation of the y-intercept of the graph of y = f(x) in the xy-plane in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3e9eaffc.png$qb$, $qb$[{"label": "A", "body": "Caleb used approximately 5 fluid ounces of juice for each popsicle."}, {"label": "B", "body": "Caleb had approximately 5 fluid ounces of juice when he began to make the popsicles."}, {"label": "C", "body": "Caleb had approximately 30 fluid ounces of juice when he began to make the popsicles."}, {"label": "D", "body": "Caleb used approximately 30 fluid ounces of juice for each popsicle."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. An equation that defines a linear function f can be written in the form f(x) = mx + b, where m represents the slope and b
represents the y-intercept, (0, b), of the line of y = f(x) in the xy-plane. The function is linear. Therefore, the graph of the
given function y = f(x) in the xy-plane has a y-intercept of (0, 30) . It’s given that (0,f3(0x)f)(x) = -5x + 30 gives the approximate volume, in fluid ounces, of juice
Caleb had remaining after making x popsicles. It follows that the y-intercept of  means that Caleb had approximately 30 fluid ounces of
juice remaining after making 0 popsicles. In other words, Caleb had approximately 30 fluid ounces of juice when he began to make the
popsicles.
Choice A is incorrect. This is an interpretation of the slope, rather than the y-intercept, of the graph of y = f(x) in the xy-plane.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-483d208d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$At a state fair, attendees can win tokens that are worth a different number of points depending on the shape. One attendee won S square tokens
and C circle tokens worth a total of 1,120 points. The equation 80S + 90C = 1,120 represents this situation. How many more points is a
circle token worth than a square token?$qb$, null, $qb$[{"label": "A", "body": "950"}, {"label": "B", "body": "90"}, {"label": "C", "body": "80"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the equation 80S + 90C = 1,120 represents this situation, where S is the number of square tokens won, C
is the number of circle tokens won, and 1,120 is the total number of points the tokens are worth. It follows that 80S represents the total number
of points the square tokens are worth. Therefore, each square token is worth 80 points. It also follows that 90C represents the total number of
points the circle tokens are worth. Therefore, each circle token is worth 90 points. Since a circle token is worth 90 points and a square token is
worth 80 points, then a circle token is worth 90 - 80, or 10, more points than a square token.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the number of points a circle token is worth.
Choice C is incorrect. This is the number of points a square token is worth.$qb$);
select seed_pool_question($qb$CB-af2ba762$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$According to data provided by the US Department of Energy, the average price per gallon of regular gasoline in the United States from September
1, 2014, to December 1, 2014, is modeled by the function F defined below, where  is the average price per gallon x months after September
1.
The constant 2.74 in this function estimates which of the following?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-af2ba762.png$qb$, $qb$[{"label": "A", "body": "The average monthly decrease in the price per gallon"}, {"label": "B", "body": "The difference in the average price per gallon from September 1, 2014, to December 1, 2014"}, {"label": "C", "body": "The average price per gallon on September 1, 2014"}, {"label": "D", "body": "The average price per gallon on December 1, 2014"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since 2.74 is a constant term, it represents an actual price of gas rather than a measure of change in gas price. To determine
what gas price it represents, find x such that F(x) = 2.74, or 2.74 = 2.74 – 0.19(x – 3). Subtracting 2.74 from both sides gives 0 = –0.19(x – 3).
Dividing both sides by –0.19 results in 0 = x – 3, or x = 3. Therefore, the average price of gas is $2.74 per gallon 3 months after September 1,
2014, which is December 1, 2014.
Choice A is incorrect. Since 2.74 is a constant, not a multiple of x, it cannot represent a rate of change in price. Choice B is incorrect. The
difference in the average price from September 1, 2014, to December 1, 2014, is F(3) – F(0) = 2.74 – 0.19(3 – 3) – (2.74 – 0.19(0 – 3)) = 2.74 –
(2.74 + 0.57) = –0.57, which is not 2.74. Choice C is incorrect. The average price per gallon on September 1, 2014, is F(0) = 2.74 – 0.19(0 – 3) =
2.74 + 0.57 = 3.31, which is not 2.74.$qb$);
select seed_pool_question($qb$CB-19fdf387$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, the graph of  intersects the graph of  at the point . What is the value of a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-19fdf387.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "6"}, {"label": "C", "body": "9"}, {"label": "D", "body": "12"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since the graph of  intersects the graph of  at the point , the ordered pair  is the solution
to the system of linear equations consisting of  and , and the value of a is the value of x in the solution of this system.
Since both and  are equal to y, it follows that . Subtracting x from and adding 6 to both sides of the equation
yields . Therefore, the value of a is 9.
Choices A and B are incorrect and may result from a calculation or conceptual error in solving the system of equations consisting of
and . Choice D is incorrect. This is the value of b, not a.$qb$);
select seed_pool_question($qb$CB-a775af14$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, the graph of the linear function f contains the points (0, 2) and (8, 34) . Which equation defines f, where y= f(x) ?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 2x + 42"}, {"label": "B", "body": "f(x) = 32x + 36"}, {"label": "C", "body": "f(x) = 4x + 2"}, {"label": "D", "body": "f(x) = 8x + 2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. In the xy-plane, the graph of a linear function can be written in the form f(x) = mx + b, where m represents the slope and
(0, b) represents the y-intercept of the graph of y= f(x) . It’s given that the graph of the linear function f, where , in the xy-plane
contains the point . Thus, b = 2. The slope of the graph of a line containing any two points (x1 , y1 ) and (^(x)(^(2)y8^(,),=y3^(2)4)f)(^(x)) can be found using the
m =(0(,y22-) y1)/(x2 -x1)
slope formula, . Since it’s given that the graph of the linear function f contains the points (0, 2) and , it follows that the slope
of the graph of the line containing these points is m = (34-2)/(8-o) , or m = 4. Substituting 4 for m and 2 for b in f(x) = mx + b yields f(x) = 4x
+ 2.
Choice A is incorrect. This function represents a graph with a slope of 2 and a y-intercept of (0, 42).
Choice B is incorrect. This function represents a graph with a slope of 32 and a y-intercept of (0, 36).
Choice D is incorrect. This function represents a graph with a slope of 8 and a y-intercept of (0, 2).$qb$);
select seed_pool_question($qb$CB-9551cd91$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Maximum number of
Number of cars
passengers and crew
(-/3| |)/5|| ||(--174 |)/284||
The table shows the linear relationship between the number of cars, c, on a commuter train and the maximum number of passengers and crew,
p, that the train can carry. Which equation represents the linear relationship between c and p?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9551cd91.png$qb$, $qb$[{"label": "A", "body": "55c - p = -9"}, {"label": "B", "body": "55c - p = 9"}, {"label": "C", "body": "55p - c = -9"}, {"label": "D", "body": "55p - c = 9"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that there is a linear relationship between the number of cars, c, on a commuter train and the maximum number of
passengers and crew, p, that the train can carry. It follows that this relationship can be represented by an equation of the form p = mc + b,
where m is the rate of change of p in this relationship and b is a constant. The rate of change of p in this relationship can be calculated by
dividing the difference in any two values of  by the difference in the corresponding values of c. Using two pairs of values given in the table, the
rate of change of  in this relationship is (28p4-174)/(5-3) , or 55. Substituting 55 for  in the equation p = mc + b yields p = 55c + b. The value of b
p m
can be found by substituting any value of c and its corresponding value of p for c and p, respectively, in this equation. Substituting 10 for c and
559 for p yields 559 = 55(10) + b, or 559 = 550 + b. Subtracting 550 from both sides of this equation yields 9 = b. Substituting 9 for b in the
equation p = 55c + b yields p = 55c + 9. Subtracting 9 from both sides of this equation yields p - 9 = 55c. Subtracting p from both sides of
this equation yields -9 = 55c - p, or 55c - p = -9.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-db0107df$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The y-intercept of the graph of 12x + 2y = 18 in the xy-plane is (0, y). What is the value of y?$qb$, null, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. It's given that the y-intercept of the graph of 12x + 2y = 18 in the xy-plane is (0, y) . Substituting 0 for x in the
equation 12x + 2y = 18 yields 12(0) + 2y = 18, or 2y = 18. Dividing both sides of this equation by 2 yields y = 9. Therefore, the value of y
is 9.$qb$);
select seed_pool_question($qb$CB-b8fa27db$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(10II?468004466??88 ? ?)/(-/--/--/-666 444 222 ÷÷÷642446622 222 444 666)|| || || ||?|| || | || || || || || || | x
Line j is shown in the xy-plane. Line k (not shown) is parallel to line j. What is the slope of line k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b8fa27db.png$qb$, null, null, array[$qb$4$qb$]::text[], $qb$The correct answer is 4. It's given that line k is parallel to line j. It follows that the slope of line k is equal to the slope of line j. Given two points
on a line in the xy-plane, (x1 , y1 ) and (x2 , y2 ) , the slope of the line can be calculated as . In the xy-plane shown, the points (0, 5) and
j(y2-y1)/(x2 -x1)
(1, 9) are on line j. It follows that the slope of line j is (9-5)/(1-o) , or 4. Since the slope of line  is equal to the slope of line k, the slope of line k is also
4.$qb$);
select seed_pool_question($qb$CB-b9835972$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, line ℓ passes through the point (0, 0) and is parallel to the line represented by the equation y = 8x + 2. If line ℓ also passes
through the point (3, d) , what is the value of d?$qb$, null, null, null, array[$qb$24$qb$]::text[], $qb$The correct answer is 24. A line in the xy-plane can be defined by the equation y = mx + b, where m is the slope of the line and b is the y-
coordinate of the y-intercept of the line. It's given that line ℓ passes through the point (0, 0) . Therefore, the y-coordinate of the y-intercept of line
ℓ is 0. It's given that line ℓ is parallel to the line represented by the equation y = 8x + 2. Since parallel lines have the same slope, it follows that
the slope of line ℓ is 8. Therefore, line ℓ can be defined by an equation in the form y = mx + b, where m = 8 and b = 0. Substituting 8 for m
and 0 for b in y = mx + b yields the equation y = 8x + 0, or y = 8x . If line ℓ passes through the point (3, d), then when x = 3y = d,  for
the equation y = 8x. Substituting 3 for x and d for y in the equation y = 8x yields d = 8(3), or d = 24.$qb$);
select seed_pool_question($qb$CB-7b17f86a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$f(x) = x + 8/11
The function f is defined by the given equation. What is the value of f(x) when x = 3/11 ?$qb$, null, null, null, array[$qb$1$qb$]::text[], $qb$The correct answer is 1 . It’s given that the function f is defined by . Substituting for x in the given function yields f(3/11)
f(x) =x =x (+3)/118/11 f( 3/(x1)1)
= 3/11 + 8/11 , which gives f( 3/11 ) = 11/11 , or f(3/11) = 1. Therefore, when , the value of  is 1 .$qb$);
select seed_pool_question($qb$CB-ebd457f4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Brian saves 2/5 of the $215 he earns each week from his job. If Brian continues to save at this rate, how much money, in dollars, will Brian save in
9 weeks?$qb$, null, null, null, array[$qb$774$qb$]::text[], $qb$The correct answer is 774. It's given that Brian saves  of the $215 he earns each week from his job. Therefore, Brian saves , or
2/5$86 774(2/5) ($215)
$86, per week. If Brian continues to save at this rate of  per week for 9 weeks, then he will save a total of (9)(86), or , dollars.$qb$);
select seed_pool_question($qb$CB-e0f59119$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the slope of the graph of y = 1/3 (29x + 10) + 5x in the xy-plane?$qb$, null, null, null, array[$qb$14.66$qb$, $qb$14.67$qb$, $qb$44/3$qb$]::text[], $qb$The correct answer is 44/3 . A linear equation can be written in the form y = mx + b, where m is the slope of the graph of the equation in the xy-
plane and (0, b) is the y-intercept. Distributing the 1/3 in the equation y = 1/3 (29x + 10) + 5x yields . Combining like
y = ym=x 29/(+3)bx + 10/3 + 5x
terms on the right-hand side of this equation yields y = 44/3 x + 10/3 . This equation is in the form , where m = 44/3 and b = 1o/3 .
Therefore, the slope of the graph of the given equation in the xy-plane is 44/3 . Note that 44/3, 14.66, and 14.67 are examples of ways to enter a
correct answer.$qb$);
select seed_pool_question($qb$CB-d1f50dbe$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$One gallon of stain will cover 170 square feet of a surface. A yard has a total fence area of w square feet. Which equation represents the total
amount of stain S, in gallons, needed to stain the fence in this yard twice?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d1f50dbe.png$qb$, $qb$[{"label": "A", "body": "S = w/170"}, {"label": "B", "body": "S = 170w"}, {"label": "C", "body": "S = 340w"}, {"label": "D", "body": "S = w/85"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that w represents the total fence area, in square feet. Since the fence will be stained twice, the amount of stain, in
gallons, will need to cover 2w square feet. It’s also given that one gallon of stain will cover 170 square feet. Dividing the total area, in square feet,
of the surface to be stained by the number of square feet covered by one gallon of stain gives the number of gallons of stain that will be needed.
Dividing 2w by 170 yields , or w/85 . Therefore, the equation that represents the total amount of stain S, in gallons, needed to stain the fence
S = w/852w/17o
of the yard twice is .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6c5c2a81$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the linear function h, the graph of y = h(x) in the xy-plane passes through the points (7, 21) and (9, 25) . Which equation defines h?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6c5c2a81.png$qb$, $qb$[{"label": "A", "body": "h(x) = 1/2 x - 7/2"}, {"label": "B", "body": "h(x) = 2x + 7"}, {"label": "C", "body": "h(x) = 7x + 21"}, {"label": "D", "body": "h(x) = 9x + 25"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the graph of the linear function h, where , passes through the points (7, 21) and (9, 25) in the xy-
y =y =h(xh)(x)
plane. An equation defining h can be written in the form y = mx + b, where , m represents the slope of the graph in the xy-plane, and
b represents the y-coordinate of the y-intercept of the graph. The slope can be found using any two points, (x1 , y1 ) and (x2 , y2 ) , and the
formula . Substituting (7, 21) and (9, 25) for (x1 , y1 ) and (x2 , y2 ) , respectively, in the slope formula yields , which is
21 = (2) (m7)=+ (25-21)/(b9-7)
equivalent to m = (y2-y1)/(m(x=21-4x41/2)), or m = 2. Substituting 2 for m and (7, 21) for (x, y) in the equation y = mx + b yields , or 21 = 14
+ b. Subtracting  from each side of this equation yields 7 = b. Substituting 2 for m and 7 for b in the equation y = mx + b yields y = 2x
+ 7. Since y = h(x) , it follows that the equation that defines h is h(x) = 2x + 7.
Choice A is incorrect. For this function, the graph of y = h(x) in the xy-plane would pass through (7, 0) , not (7, 21), and (9, 1) , not (9, 25) .
Choice C is incorrect. For this function, the graph of y = h(x) in the xy-plane would pass through (7, 70) , not (7, 21), and (9, 84) , not (9, 25).
Choice D is incorrect. For this function, the graph of y = h(x) in the xy-plane would pass through (7, 88) , not (7, 21) , and (9, 106) , not (9, 25) .$qb$);
select seed_pool_question($qb$CB-adf60b28$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$f(x) = 8x + 4
The function f gives the estimated height, in feet, of a willow tree x years after its height was first measured. Which statement is the best
interpretation of 4 in this context?$qb$, null, $qb$[{"label": "A", "body": "The tree will be measured each year for 4 years."}, {"label": "B", "body": "The tree is estimated to grow to a maximum height of 4 feet."}, {"label": "C", "body": "The estimated height of the tree increased by 4 feet each year."}, {"label": "D", "body": "The estimated height of the tree was 4 feet when it was first measured."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the function f(x) = 8x + 4 gives the estimated height, in feet, of a willow tree x years after its height was
first measured. For a function defined by an equation of the form f(x) = mx + b, where m and b are constants, b represents the value of f(x)
when x = 0. It follows that in the given function, 4 represents the value of f(x) when x = 0. Therefore, the best interpretation of 4 in this
context is that the estimated height of the tree was 4 feet when it was first measured.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-df32b09c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Tom scored 85, 78, and 98 on his first three exams in history class. Solving which inequality gives the score, G, on Tom’s fourth exam that will
result in a mean score on all four exams of at least 90 ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-df32b09c.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The mean of the four scores (G, 85, 78, and 98) can be expressed as . The inequality that expresses
the condition that the mean score is at least 90 can therefore be written as .
Choice A is incorrect. The sum of the scores (G, 85, 78, and 98) isn’t divided by 4 to express the mean. Choice B is incorrect and may be the result
of an algebraic error when multiplying both sides of the inequality by 4. Choice D is incorrect because it doesn’t include G in the mean with the
other three scores.$qb$);
select seed_pool_question($qb$CB-e1248a5c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the system of equations below, a and c are constants.
If the system of equations has an infinite number of solutions , what is the value of a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e1248a5c.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": "0"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A system of two linear equations has infinitely many solutions if one equation is equivalent to the other. This means that
when the two equations are written in the same form, each coefficient or constant in one equation is equal to the corresponding coefficient or
constant in the other equation multiplied by the same number. The equations in the given system of equations are written in the same form, with
x and y on the left-hand side and a constant on the right-hand side of the equation. The coefficient of y in the second equation is equal to the
coefficient of y in the first equation multiplied by 3. Therefore, a, the coefficient of x in the second equation, must be equal to 3 times the
coefficient of x in the first equation: , or .
Choices A, B, and C are incorrect. When , , or , the given system of equations has one solution.$qb$);
select seed_pool_question($qb$CB-b8cbe394$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Sean rents a tent at a cost of $11 per day plus a onetime insurance fee of $10. Which equation represents the total cost c, in dollars, to rent the
tent with insurance for d days?$qb$, null, $qb$[{"label": "A", "body": "c = 11(d + 10)"}, {"label": "B", "body": "c = 10(d + 11)"}, {"label": "C", "body": "c = 11d + 10"}, {"label": "D", "body": "c = 10d + 11"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the cost of renting a tent is $11 per day for ? days. Multiplying the rental cost by the number of days yields
$11d, which represents the cost of renting the tent for d days before the insurance is added. Adding the onetime insurance fee of $10 to the
rental cost of $11d gives the total cost c, in dollars, which can be represented by the equation c = 11d + 10.
Choice A is incorrect. This equation represents the total cost to rent the tent if the insurance fee was charged every day.
Choice B is incorrect. This equation represents the total cost to rent the tent if the daily fee was $(d + 11) for 10 days.
Choice D is incorrect. This equation represents the total cost to rent the tent if the daily fee was $10 and the onetime fee was $11.$qb$);
select seed_pool_question($qb$CB-05bb1af9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$- (10II?468004466??88)/(?10II-/--/--/--/--/-00 -888 -?66 -444 --222÷÷÷÷101186420044662288? 222 444 ?66 888 ?II00)||?|| || || || || || || || || | || || || || || || || || || || | x
The graph of y = f(x) + 14 is shown. Which equation defines function f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-05bb1af9.png$qb$, $qb$[{"label": "A", "body": "f(x) = -1/4x - 12"}, {"label": "B", "body": "f(x) = -1/4x + 16"}, {"label": "C", "body": "f(x) = -1/4x + 2"}, {"label": "D", "body": "f(x) = -1/4x - 14"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. An equation for the graph shown can be written in slope-intercept form y = mx + b, where m is the slope of the graph and
its y-intercept is (0, b). Since the y-intercept of the graph shown is (0, 2) , the value of b is 2. Since the graph also passes through the point
(4, 1) , the slope can be calculated as (1-2)/(4-0) , or - 1/4 . Therefore, the value of m is - 1/4. Substituting  for m and 2 for b in the equation
y = f(x) +-11/(4^(4))
y = mx + b yields y = - 1/4 x + 2. It’s given that an equation for the graph shown is . Substituting  for y in the
f(xf)(x=) -+11/44x - 12
equation y = - 1/4 x + 2 yields f(x) + 14 = -1/4x + 2. Subtracting 14 from both sides of this equation yields .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cc7ffe02$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Keenan made 32 cups of vegetable broth. Keenan then filled x small jars and y large jars with all the vegetable broth he made. The equation 3x
+ 5y = 32 represents this situation. Which is the best interpretation of 5y in this context?$qb$, null, $qb$[{"label": "A", "body": "The number of large jars Keenan filled"}, {"label": "B", "body": "The number of small jars Keenan filled"}, {"label": "C", "body": "The total number of cups of vegetable broth in the large jars"}, {"label": "D", "body": "The total number of cups of vegetable broth in the small jars"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the equation 3x + 5y = 32 represents the situation where Keenan filled x small jars and y large jars with all
the vegetable broth he made, which was 32 cups. Therefore, 3x represents the total number of cups of vegetable broth in the small jars and 5y
represents the total number of cups of vegetable broth in the large jars.
Choice A is incorrect. The number of large jars Keenan filled is represented by y, not 5y.
Choice B is incorrect. The number of small jars Keenan filled is represented by x, not 5y.
Choice D is incorrect. The total number of cups of vegetable broth in the small jars is represented by 3x, not 5y.$qb$);
select seed_pool_question($qb$CB-86f7483f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$During spring migration, a dragonfly traveled a minimum of 1,510 miles and a maximum of 4,130 miles between stopover locations. Which
inequality represents this situation, where d is a possible distance, in miles, this dragonfly traveled between stopover locations during spring
migration?$qb$, null, $qb$[{"label": "A", "body": "d ≤ 1,510"}, {"label": "B", "body": "1,510 ≤ d ≤ 4,130"}, {"label": "C", "body": "d ≥ 4,130"}, {"label": "D", "body": "4,130 ≤ d ≤ 5,640"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that during spring migration, a dragonfly traveled a minimum of 1,510 miles and a maximum of 4,130 miles
between stopover locations. It's also given that d represents a possible distance, in miles, this dragonfly traveled between stopover locations. It
follows that the inequality 1,510 ≤ d ≤ 4,130 represents this situation.
Choice A is incorrect. This inequality represents a situation in which a dragonfly traveled a maximum of 1,510 miles between stopover locations.
Choice C is incorrect. This inequality represents a situation in which a dragonfly traveled a minimum of 4,130 miles between stopover locations.
Choice D is incorrect. This inequality represents a situation in which a dragonfly traveled a minimum of 4,310 miles and a maximum of 5,640
miles between stopover locations.$qb$);
select seed_pool_question($qb$CB-dae126d7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The boiling point of water at sea level is 212 degrees Fahrenheit . For every 550 feet above sea level, the boiling point of water is lowered by
about . Which of the following equations can be used to find the boiling point B of water, in , x feet above sea level?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dae126d7.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the boiling point of water at sea level is 212°F and that for every 550 feet above sea level, the boiling point of
water is lowered by about 1°F. Therefore, the change in the boiling point of water x feet above sea level is represented by the expression
. Adding this expression to the boiling point of water at sea level gives the equation for the boiling point B of water, in °F, x feet above
sea level: , or .
Choices A and B are incorrect and may result from using the boiling point of water at sea level as the rate of change and the rate of change as
the initial boiling point of water at sea level. Choice C is incorrect and may result from representing the change in the boiling point of water as an
increase rather than a decrease.$qb$);
select seed_pool_question($qb$CB-bf5f80c6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y < -4x + 4
Which point (x, y) is a solution to the given inequality in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "(-40, )"}, {"label": "B", "body": "(0, 5)"}, {"label": "C", "body": "(2, 1)"}, {"label": "D", "body": "(2, -1)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice D is correct. For a point (x, y) to be a solution to the given inequality in the xy-plane, the value of the point’s y-coordinate must be less
than the value of -4x + 4, where x is the value of the x-coordinate of the point. This is true of the point (-4, 0) because 0 < -4(-4) + 4, or
0 < 20. Therefore, the point (-4, 0) is a solution to the given inequality.
Choices A, B, and C are incorrect. None of these points are a solution to the given inequality because each point’s y-coordinate is greater than the
value of -4x + 4 for the point’s x-coordinate.$qb$);
select seed_pool_question($qb$CB-5e9b6079$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y = 7x + 18
One of the equations in a system of two linear equations is given. The system has no solution. Which equation could be the second equation in
the system?$qb$, null, $qb$[{"label": "A", "body": "-21x + y = 54"}, {"label": "B", "body": "-21x + y = 18"}, {"label": "C", "body": "-7x + y = 21"}, {"label": "D", "body": "-7x + y = 18"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A system of two linear equations in two variables, x and y, has no solution if the graphs of the equations in the xy-plane are
two distinct and parallel lines, which don't intersect. Two lines in the xy-plane are distinct and parallel if their slopes are the same and the y-
coordinates of their y-intercepts are different. A linear equation can be written in slope-intercept form, y = mx + b, where m is the slope of the
line in the xy-plane and b is the y-coordinate of the y-intercept. Choice C can be written in slope-intercept form by adding 7x to both sides of the
equation, which gives y = 7x + 21. In the equations y = 7x + 18 and y = 7x + 21 , the values of m are each 7, and the values of b are 18
and 21, respectively. Since the slopes of these lines are the same and the y-coordinates of the y-intercepts are different, it follows that choice C
could be the second equation in the system.
Choice A is incorrect. Adding 21x to both sides of this equation gives y = 21x + 54. In the equations y = 7x + 18 and y = 21x + 54, the
values of m aren't equal, so the slopes of these lines are different. Therefore, these two lines intersect and the corresponding system of
equations has one solution.
Choice B is incorrect. Adding 21x to both sides of this equation gives y = 21x + 18. In the equations y = 7x + 18 and y = 21x + 18, the
values of m aren't equal, so the slopes of these lines are different. Therefore, these two lines intersect and the corresponding system of
equations has one solution.
Choice D is incorrect. Adding 7x to both sides of this equation gives y = 7x + 18. Since this equation is the same as the given equation, these
two lines are not distinct. Therefore, the corresponding system of equations has infinitely many solutions.$qb$);
select seed_pool_question($qb$CB-12983c1e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Some values of the linear function f are shown in the table above. Which of the following defines f ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-12983c1e.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Because f is a linear function of x, the equation , where m and b are constants, can be used to define the
relationship between x and f (x). In this equation, m represents the increase in the value of f (x) for every increase in the value of x by 1. From the
table, it can be determined that the value of f (x) increases by 8 for every increase in the value of x by 2. In other words, for the function f the
value of m is , or 4. The value of b can be found by substituting the values of x and f (x) from any row of the table and the value of m into the
equation  and solving for b. For example, using , , and  yields . Solving for b yields
. Therefore, the equation defining the function f can be written in the form .
Choices A, B, and D are incorrect. Any equation defining the linear function f must give values of f (x) for corresponding values of x, as shown in
each row of the table. According to the table, if , . However, substituting  into the equation given in choice A gives
, or , not 13. Similarly, substituting  into the equation given in choice B gives , or
, not 13.
Lastly, substituting  into the equation given in choice D gives , or , not 13. Therefore, the equations in choices A,
B, and D cannot define f.$qb$);
select seed_pool_question($qb$CB-aeaba0b6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$f(x) = 14 + 4x
The function f represents the total cost, in dollars, of attending an arcade when x games are played. How many games can be played for a total
cost of $58?$qb$, null, null, null, array[$qb$11$qb$]::text[], $qb$The correct answer is 11 . It’s given that the function f(x) = 14 + 4x represents the total cost, in dollars, of attending an arcade when x games
are played. Substituting 58 for f(x) in the given equation yields 58 = 14 + 4x. Subtracting 14 from each side of this equation yields 44 = 4x.
Dividing each side of this equation by 4 yields 11 = x. Therefore, 11 games can be played for a total cost of $58.$qb$);
select seed_pool_question($qb$CB-8368afd1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$f1mnOO^(S)e
10121416?20221111II11II246800004444666622228888??/(1II 222 333 444 555 666 777 888 999 10II00)| || || || || || || || || || || |x
dpnO^(S)?
?oundSo? tangerineS
The graph shows the possible combinations of the number of pounds of tangerines and lemons that could be purchased for $18 at a certain
store. If Melvin purchased lemons and 4 pounds of tangerines for a total of $18, how many pounds of lemons did he purchase?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8368afd1.png$qb$, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "10"}, {"label": "C", "body": "14"}, {"label": "D", "body": "16"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the graph shows the possible combinations of the number of pounds of tangerines, x, and the number of
pounds of lemons, y, that could be purchased for $18 at a certain store. If Melvin purchased lemons and 4 pounds of tangerines for a total of
$18, the number of pounds of lemons he purchased is represented by the y-coordinate of the point on the graph where x = 4. For the graph
shown, when x = 4y = 10, . Therefore, if Melvin purchased lemons and 4 pounds of tangerines for a total of $18, then he purchased 10 pounds
of lemons.
Choice A is incorrect. This is the number of pounds of tangerines Melvin purchased if he purchased tangerines and 4 pounds of lemons for a
total of $18.
Choice C is incorrect. This is the number of pounds of lemons Melvin purchased if he purchased lemons and 2 pounds of tangerines for a total
of $18.
Choice D is incorrect. This is the number of pounds of lemons Melvin purchased if he purchased lemons and 1 pound of tangerines for a total of
$18.$qb$);
select seed_pool_question($qb$CB-70d9516e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A bus is traveling at a constant speed along a straight portion of road. The equation d = 30t gives the distance d, in feet from a road marker,
that the bus will be t seconds after passing the marker. How many feet from the marker will the bus be 2 seconds after passing the marker?$qb$, null, $qb$[{"label": "A", "body": "30"}, {"label": "B", "body": "32"}, {"label": "C", "body": "60"}, {"label": "D", "body": "90"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that t represents the number of seconds after the bus passes the marker. Substituting 2 for t in the given equation
d = 30t yields d = 30(2), or d = 60. Therefore, the bus will be 60 feet from the marker 2 seconds after passing it.
Choice A is incorrect. This is the distance, in feet, the bus will be from the marker 1 second, not 2 seconds, after passing it.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the distance, in feet, the bus will be from the marker 3 seconds, not 2 seconds, after passing it.$qb$);
select seed_pool_question($qb$CB-1362ccde$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$4yy == 41^(x)5x+-18
The solution to the given system of equations is (x, y) . What is the value of x - y?$qb$, null, null, null, array[$qb$35$qb$]::text[], $qb$The correct answer is 35. The first equation in the given system of equations defines y as 4x + 1. Substituting 4x + 1 for y in the second
equation in the given system of equations yields 4(4x + 1) = 15x - 8. Applying the distributive property on the left-hand side of this equation
yields 16x + 4 = 15x - 8. Subtracting 15x from each side of this equation yields x + 4 = -8. Subtracting 4 from each side of this equation
yields x = -12. Substituting -12 for x in the first equation of the given system of equations yields y = 4(-12) + 1, or y = -47. Substituting
-12 for x and -47 for y into the expression x - y yields -12 - (-47) , or 35.$qb$);
select seed_pool_question($qb$CB-720e51ac$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The cost y, in dollars, for a manufacturer to make x rings is represented by the line shown.
?????222233II1100000050555555000000000000?-/(-10II00| 202200| 503300| 444000| 505500| 606600| 207700| 808800| ?9900| ?II00|)|?| | | | | | | | | | 00|x
What is the cost, in dollars, for the manufacturer to make 60 rings?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-720e51ac.png$qb$, $qb$[{"label": "A", "body": "100"}, {"label": "B", "body": "125"}, {"label": "C", "body": "175"}, {"label": "D", "body": "225"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The line shown represents the cost y, in dollars, for a manufacturer to make x rings. For the line shown, the x-axis represents
the number of rings made by the manufacturer and the y-axis represents the cost, in dollars. Therefore, the cost, in dollars, for the manufacturer
to make 60 rings is represented by the y-coordinate of the point on the line that has an x-coordinate of 60. The point on the line with an x-
coordinate of 60 has a y-coordinate of 175. Therefore, the cost, in dollars, for the manufacturer to make 60 rings is 175.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the cost, in dollars, for the manufacturer to make 20 rings.
Choice D is incorrect. This is the cost, in dollars, for the manufacturer to make 100 rings.$qb$);
select seed_pool_question($qb$CB-4de87c9a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$3 more than 8 times a number x is equal to 83. Which equation represents this situation?$qb$, null, $qb$[{"label": "A", "body": "(3)(8)x = 83"}, {"label": "B", "body": "8x = 83 + 3"}, {"label": "C", "body": "3x + 8 = 83"}, {"label": "D", "body": "8x + 3 = 83"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The given phrase “8 times a number x” can be represented by the expression 8x. The given phrase “3 more than” indicates
an increase of 3 to a quantity. Therefore “3 more than 8 times a number x” can be represented by the expression 8x + 3. Since it’s given that 3
more than 8 times a number x is equal to 83, it follows that 8x + 3 is equal to 83, or 8x + 3 = 83. Therefore, the equation that represents this
situation is 8x + 3 = 83.
Choice A is incorrect. This equation represents 3 times the quantity 8 times a number x is equal to 83.
Choice B is incorrect. This equation represents 8 times a number x is equal to 3 more than 83.
Choice C is incorrect. This equation represents 8 more than 3 times a number x is equal to 83.$qb$);
select seed_pool_question($qb$CB-52cb8ea4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If  is the solution to the system of equations above, what is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-52cb8ea4.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": "5"}, {"label": "D", "body": "13"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting the second equation, , from the first equation, , results in
, or . Combining like terms on the left-hand side of this equation yields
.
Choice A is incorrect and may result from miscalculating  as . Choice C is incorrect and may result from miscalculating  as 5.
Choice D is incorrect and may result from adding 9 to 4 instead of subtracting 9 from 4.$qb$);
select seed_pool_question($qb$CB-c307283c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$- 10121416II11II1124680044446666222288/(10II-/--/--/--/--/--/--/-(?- - - - ?-)/-00 888 ??? 444 ----222÷?÷?1614121011II1111??4200444466662222?? 222 444 ?66 888 10II00)||?|| || || ?| | || || || || || | x
What is an equation of the graph shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c307283c.png$qb$, $qb$[{"label": "A", "body": "y = -2x - 8"}, {"label": "B", "body": "y = x - 8"}, {"label": "C", "body": "y = -x - 8"}, {"label": "D", "body": "y = 2x - 8"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. An equation of a line can be written in the form y = mx + b, where m is the slope of the line and (0, b) is the y-intercept of
the line. The line shown passes through the point (0, -8), so b = -8. The line shown also passes through the point (-8, 0). The slope, m, of a
line passing through two points (x1 , y1 ) and (x2 , y2 ) can be calculated using the equation . For the points (0, -8) and (-8, 0),
m =y(y2-y1)/(x=2 -(x-1) 1 )x + (-8)
this gives m = ((-8)-0)/(0-(-8)) , or m = - 1 . Substituting -8 for b and -1 for m in y = mx + b yields , or y = -x - 8.
Therefore, an equation of the graph shown is y = -x - 8.
Choice A is incorrect. This is an equation of a line with a slope of -2, not -1.
Choice B is incorrect. This is an equation of a line with a slope of 1, not -1.
Choice D is incorrect. This is an equation of a line with a slope of 2, not -1.$qb$);
select seed_pool_question($qb$CB-4e97f862$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 3x - 8. What is the value of f(7) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4e97f862.png$qb$, $qb$[{"label": "A", "body": "29"}, {"label": "B", "body": "13"}, {"label": "C", "body": "-5"}, {"label": "D", "body": "-29"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the function  is defined by f(x) = 3x - 8. The value of  is the value of f(x) when x = 7. Substituting
f(7) = 3(7f) - 8 f(7f) (7) = 13
7 for x in the given equation yields , which is equivalent to f(7) = 21 - 8, or .
Choice A is incorrect. This is the value of f(7) when f(x) = 3x + 8, rather than f(x) = 3x - 8.
Choice C is incorrect. This is the value of f(1) , rather than f(7).
Choice D is incorrect. This is the value of f(-7) , rather than f(7) .$qb$);
select seed_pool_question($qb$CB-8adf1335$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A city’s total expense budget for one year was x million dollars. The city budgeted y million dollars for departmental expenses and
201 million dollars for all other expenses. Which of the following represents the relationship between x and y in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8adf1335.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Of the city’s total expense budget for one year, the city budgeted y million dollars for departmental expenses and 201 million
dollars for all other expenses. This means that the expression  represents the total expense budget, in millions of dollars, for one year.
It’s given that the total expense budget for one year is x million dollars. It follows then that the expression  is equivalent to x, or
. Subtracting y from both sides of this equation yields . By the symmetric property of equality, this is the same as
.
Choices A and C are incorrect. Because it’s given that the total expense budget for one year, x million dollars, is comprised of the departmental
expenses, y million dollars, and all other expenses, 201 million dollars, the expressions  and  both must be equivalent to a value
greater than 201 million dollars. Therefore, the equations and aren’t true. Choice D is incorrect. The value of x
must be greater than the value of y. Therefore,  can’t represent this relationship.$qb$);
select seed_pool_question($qb$CB-a0489274$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = - 1/5 x
y = 1/7 x
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "-5"}, {"label": "B", "body": "0"}, {"label": "C", "body": "2"}, {"label": "D", "body": "7"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given by the first equation in the system that y = - 1/5 x. Substituting - 1/5 x for y in the second equation in the system, y
, yields - 1/5 x = 1/7 x. Adding - 1/5 x to both sides of this equation yields 0 = 1/7 x + 1/5 x, which is equivalent to 0 = 5/35 x + 7/35 x, or 0
== 1/712x/35 x
. Multiplying both sides of this equation by 35/12 yields 0 = x. Therefore, the value of x is 0.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9db5b5c1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$4x = 20
-3x + y = -7
The solution to the given system of equations is (x, y) . What is the value of x + y?$qb$, null, $qb$[{"label": "A", "body": "-27"}, {"label": "B", "body": "-13"}, {"label": "C", "body": "13"}, {"label": "D", "body": "27"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that 4x = 20 and -3x + y = -7 is a system of equations with a solution (x, y) . Adding the second equation in
the given system to the first equation yields 4x + (-3x + y) = 20 + (-7) , which is equivalent to x + y = 13. Thus, the value of x + y is 13.
Choice A is incorrect. This represents the value of -2(x + y) - 1.
Choice B is incorrect. This represents the value of -(x + y).
Choice D is incorrect. This represents the value of 2(x + y) + 1.$qb$);
select seed_pool_question($qb$CB-3174f07d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?-(222| |?- | 222| | 444| | ???| | 888| | 10II00| | 12II22| | 14II44|)/--/-| ÷?12345678?447766??22883355|11II?| | | | | | | | | | | | | | | | x
The graph of the linear function f is shown, where y = f(x). What is the y-intercept of the graph of f?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3174f07d.png$qb$, $qb$[{"label": "A", "body": "(0, 0)"}, {"label": "B", "body": "(0, - 16/11 )"}, {"label": "C", "body": "(0, -8)"}, {"label": "D", "body": "(0, 8)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The y-intercept of a graph is the point where the graph intersects the y-axis. The graph of function f shown intersects the y-
axis at the point (0, 8). Therefore, the y-intercept of the graph of f is (0, 8) .
Choice A is incorrect. This is the point where the x-axis, not the graph of f, intersects the y-axis.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-80da233d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A certain elephant weighs 200 pounds at birth and gains more than 2 but less than 3 pounds per day during its first year. Which of the following
inequalities represents all possible weights w, in pounds, for the elephant 365 days after birth?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-80da233d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the elephant weighs 200 pounds at birth and gains more than 2 pounds but less than 3 pounds per day during
its first year. The inequality  represents this situation, where d is the number of days after birth. Substituting 365
for d in the inequality gives , or .
Choice A is incorrect and may result from solving the inequality . Choice B is incorrect and may result from solving the
inequality for a weight range of more than 1 pound but less than 2 pounds: . Choice C is incorrect and
may result from calculating the possible weight gained by the elephant during the first year without adding the 200 pounds the elephant weighed
at birth.$qb$);
select seed_pool_question($qb$CB-271f7e3f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the function f defined above, what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-271f7e3f.png$qb$, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "2"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The value of  can be calculated by finding the values of  and . The value of  can be found by
substituting 9 for x in the given function: . This equation can be rewritten as , or 4. Then, the value of  can
be found by substituting 1 for x in the given function: . This equation can be rewritten as , or 2. Therefore,
, which is equivalent to 2.
Choices A, C, and D are incorrect and may result from incorrectly substituting values of x in the given function or making computational errors.$qb$);
select seed_pool_question($qb$CB-70e29454$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the equation above, a and b are constants. If the equation has infinitely many solutions, what are the values of a and b ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-70e29454.png$qb$, $qb$[{"label": "A", "body": "and"}, {"label": "B", "body": "and"}, {"label": "C", "body": "and"}, {"label": "D", "body": "and"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Distributing the a on the left-hand side of the equation gives 3a – b – ax = –1 – 2x. Rearranging the terms in each side of the
equation yields –ax + 3a – b = –2x –1. Since the equation has infinitely many solutions, it follows that the coefficients of x and the free terms on
both sides must be equal. That is, –a = –2, or a = 2, and 3a – b = –1. Substituting 2 for a in the equation 3a – b = –1 gives 3(2) – b = –1, so b =
7.
Choice A is incorrect and may be the result of a conceptual error when finding the value of b. Choices C and D are incorrect and may result from
making a sign error when simplifying.$qb$);
select seed_pool_question($qb$CB-7866a908$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A sample of a certain alloy has a total mass of 50·0 grams and is 50·0% silicon by mass. The sample was created by combining two pieces of
different alloys. The first piece was 30·0% silicon by mass and the second piece was 80·0% silicon by mass. What was the mass, in grams, of
the silicon in the second piece?$qb$, null, $qb$[{"label": "A", "body": "9·0"}, {"label": "B", "body": "16·0"}, {"label": "C", "body": "20·0"}, {"label": "D", "body": "30·0"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Let x represent the total mass, in grams, of the first piece, and let y represent the total mass, in grams, of the second piece.
It's given that the sample has a total mass of 50·0 grams. Therefore, the equation x + y = 50·0 represents this situation. It's also given that the
sample is 50·0% silicon by mass. Therefore, the total mass of the silicon in the sample is 0·500(50·0) , or 25·0, grams. It's also given that the
first piece was 30·0% silicon by mass and the second piece was 80·0% silicon by mass. Therefore, the masses, in grams, of the silicon in the
first and second pieces can be represented by the expressions 0·300x and 0·800y, respectively. Since the sample was created by combining the
first and second pieces, and the total mass of the silicon in the sample is 25·0 grams, the equation 0·300x + 0·800y = 25·0 represents this
situation. Subtracting y from both sides of the equation x + y = 50·0 yields x = 50·0 - y. Substituting 50·0 - y for x in the equation 0·300x
+ 0·800y = 25·0 yields 0·300(50·0 - y) + 0·800y = 25·0. Distributing 0·300 on the left-hand side of this equation yields 15·0 - 0·300y
+ 0·800y = 25·0. Combining like terms on the left-hand side of this equation yields 15·0 + 0·500y = 25·0. Subtracting 15·0 from both sides
of this equation yields 0·500y = 10·0. Dividing both sides of this equation by 0·500 yields y = 20·0. Substituting 20·0 for y in the expression
representing the mass, in grams, of the silicon in the second piece, 0·800y, yields 0·800(20·0) , or 16·0. Therefore, the mass, in grams, of the
silicon in the second piece is 16·0.
Choice A is incorrect. This is the mass, in grams, of the silicon in the first piece, not the second piece.
Choice C is incorrect. This is the total mass, in grams, of the second piece, not the mass, in grams, of the silicon in the second piece.
Choice D is incorrect. This is the total mass, in grams, of the first piece, not the mass, in grams, of the silicon in the second piece.$qb$);
select seed_pool_question($qb$CB-12b04e68$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A total of 165 people contributed to a charity event as either a donor or a volunteer. 130 people contributed as a donor. How many people
contributed as a volunteer?$qb$, null, $qb$[{"label": "A", "body": "35"}, {"label": "B", "body": "130"}, {"label": "C", "body": "165"}, {"label": "D", "body": "330"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that a total of 165 people contributed to a charity event as either a donor or a volunteer. It’s also given that 130
people contributed as a donor. It follows that 165 - 130, or 35, people contributed as a volunteer.
Choice B is incorrect. This is the number of people who contributed as a donor, not a volunteer.
Choice C is incorrect. This is the total number of people who contributed as either a donor or a volunteer, not the number of people who
contributed as a volunteer.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e7b6f0d1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$4x + 6 = 18
Which equation has the same solution as the given equation?$qb$, null, $qb$[{"label": "A", "body": "4x = 108"}, {"label": "B", "body": "4x = 24"}, {"label": "C", "body": "4x = 12"}, {"label": "D", "body": "4x = 3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Subtracting 6 from both sides of the given equation yields 4x = 12, which is the equation given in choice C. Since this
equation is equivalent to the given equation, it has the same solution as the given equation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b78cd5df$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An event planner is planning a party. It costs the event planner a onetime fee of $35 to rent the venue and $10·25 per attendee. The event
planner has a budget of $300. What is the greatest number of attendees possible without exceeding the budget?$qb$, null, null, null, array[$qb$25$qb$]::text[], $qb$The correct answer is 25. The total cost of the party is found by adding the onetime fee of the venue to the cost per attendee times the number
of attendees. Let x be the number of attendees. The expression 35 + 10·25x thus represents the total cost of the party. It's given that the
budget is $300, so this situation can be represented by the inequality 35 + 10·25x ≤ 300. Subtracting 35 from both sides of this inequality
gives 10·25x ≤ 265. Dividing both sides of this inequality by 10·25 results in approximately x ≤ 25·854. Since the question is stated in terms
of attendees, rounding 25·854 down to the greatest whole number gives the greatest number of attendees possible, which is 25.$qb$);
select seed_pool_question($qb$CB-72a5fd28$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a party, 50 dinner rolls are needed. Dinner rolls are sold in packages of 12. What is the minimum number of packages that should be bought
for the party?$qb$, null, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. Let p represent the number of packages of dinner rolls that should be bought for the party. It's given that dinner rolls are
sold in packages of 12. Therefore, 12p represents the number of dinner rolls that should be bought for the party. It's also given that 50 dinner
rolls are needed; therefore, 12p ≥ 50. Dividing both sides of this inequality by 12 yields p ≥ 50/12 , or approximately p ≥ 4·17. Since the number
of packages of dinner rolls must be a whole number, the minimum number of packages that should be bought for the party is 5.$qb$);
select seed_pool_question($qb$CB-0b46bad5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the equation above, a and b are constants and . Which of the following could represent the graph of the equation in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0b46bad5.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The given equation  can be rewritten in slope-intercept form, , where m represents the slope of
the line represented by the equation, and k represents the y-coordinate of the y-intercept of the line. Subtracting ax from both sides of the
equation yields , and dividing both sides of this equation by b yields , or . With the
equation now in slope-intercept form, it shows that , which means the y-coordinate of the y-intercept is 1. It’s given that a and b are both
greater than 0 (positive) and that . Since , the slope of the line must be a value between  and 0. Choice C is the only graph
of a line that has a y-value of the y-intercept that is 1 and a slope that is between  and 0.
Choices A, B, and D are incorrect because the slopes of the lines in these graphs aren’t between  and 0.$qb$);
select seed_pool_question($qb$CB-b31c3117$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The Karvonen formula above shows the relationship between Alice’s target heart rate H, in beats per minute (bpm), and the intensity level p of
different activities. When , Alice has a resting heart rate. When , Alice has her maximum heart rate. It is recommended that p be
between 0.5 and 0.85 for Alice when she trains. Which of the following inequalities describes Alice’s target training heart rate?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b31c3117.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. When Alice trains, it’s recommended that p be between 0.5 and 0.85. Therefore, her target training heart rate is represented
by the values of H corresponding to . When , , or . When ,
, or . Therefore, the inequality that describes Alice’s target training heart rate is .
Choice B is incorrect. This inequality describes Alice’s target heart rate for . Choice C is incorrect. This inequality describes her
target heart rate for . Choice D is incorrect. This inequality describes her target heart rate for .$qb$);
select seed_pool_question($qb$CB-f79fffba$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function h is defined by h (x) = 3x - 7. What is the value of h(-2) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f79fffba.png$qb$, $qb$[{"label": "A", "body": "-13"}, {"label": "B", "body": "-10"}, {"label": "C", "body": "10"}, {"label": "D", "body": "13"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The value of can be found by substituting -2 for x in the equation defining h. Substituting -2 for x in h (x) = 3x
h (-h2)(-2) = -13
- 7 yields h (-2) = 3 (-2) - 7, or . Therefore, the value of h(-2) is -13.
Choice B is incorrect. This is the value of h(-1) , not h(-2).
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7d5d1b32$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$2 (kx - n) = - 28/15 x - 36/19
In the given equation, k and n are constants and n > 1 . The equation has no solution. What is the value of k?$qb$, null, null, null, array[$qb$-.9333$qb$, $qb$-14/15$qb$]::text[], $qb$The correct answer is - 14/15 . A linear equation in the form ax + b = cx + d has no solution only when the coefficients of x on each side of the
equation are equal and the constant terms are not equal. Dividing both sides of the given equation by 2 yields kx - n = - 28/30 x - 36/38 , or kx
- n = - 14/15 x - 18/19 . Since it’s given that the equation has no solution, the coefficient of x on both sides of this equation must be equal, and the
constant terms on both sides of this equation must not be equal. Since 18/19 < 1, and it's given that n > 1, the second condition is true. Thus, k
must be equal to - 14/15 . Note that -14/15, -.9333, and -0.933 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-e7343559$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = -4x + 40
Which table gives three values of x and their corresponding values of y for the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e7343559.png$qb$, $qb$[{"label": "A", "body": "0/1||| |||0/4-/(--^(8) ?)???"}, {"label": "B", "body": "(-x)/0||| |||(-y)/40???"}, {"label": "C", "body": "(-x)/0||| |||(-y)/4036/(-32 ?)???"}, {"label": "D", "body": "1/(|-2 |)||| |||0/4???"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Each of the given choices gives three values of x: 0, 1, and 2. Substituting 0 for x in the given equation yields y = -4(0)
+ 40, or y = 40. Therefore, when x = 0, the corresponding value of y for the given equation is 40. Substituting 1 for x in the given equation
yields y = -4(1) + 40, or y = 36. Therefore, when x = 1, the corresponding value of y for the given equation is 36. Substituting 2 for x in the
given equation yields y = -4(2) + 40, or y = 32. Therefore, when x = 2, the corresponding value of y for the given equation is 32. Choice C
gives three values of x, 0, 1 , and 2, and their corresponding values of y40, , 36, and 32, respectively, for the given equation.
Choice A is incorrect. This table gives three values of x and their corresponding values of y for the equation y = -4x.
Choice B is incorrect. This table gives three values of x and their corresponding values of y for the equation y = 4x + 40.
Choice D is incorrect. This table gives three values of x and their corresponding values of y for the equation y = 4x.$qb$);
select seed_pool_question($qb$CB-a9039591$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x
0/1??? |||(-f(x))/29/23/(-35 |)|||
For the linear function f, the table shows three values of x and their corresponding values of f(x). Which equation defines f(x) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a9039591.png$qb$, $qb$[{"label": "A", "body": "f(x) = 3x + 29"}, {"label": "B", "body": "f(x) = 29x + 32"}, {"label": "C", "body": "f(x) = 35x + 29"}, {"label": "D", "body": "f(x) = 32x + 35"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. An equation that defines a linear function f can be written in the form f(x) = mx + b, where m and b are constants. It's
given in the table that when x = 0, f(x) = 29. Substituting 0 for x and 29 for f(x) in the equation f(x) = mx + b yields 29 = m(0) + b, or
29 = b. Substituting 29 for b in the equation f(x) = mx + b yields f(x) = mx + 29. It's also given in the table that when x = 1 , f(x) = 32.
Substituting 1 for x and 32 for f(x) in the equation f(x) = mx + 29 yields 32 = m(1) + 29, or 32 = m + 29. Subtracting 29 from both
sides of this equation yields 3 = m. Substituting 3 for m in the equation f(x) = mx + 29 yields f(x) = 3x + 29.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ee7b1de1$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A small business owner budgets $2,200 to purchase candles. The owner must purchase a minimum of 200 candles to maintain the discounted
pricing. If the owner pays $4·90 per candle to purchase small candles and $11·60 per candle to purchase large candles, what is the maximum
number of large candles the owner can purchase to stay within the budget and maintain the discounted pricing?$qb$, null, null, null, array[$qb$182$qb$]::text[], $qb$The correct answer is 182. Let s represent the number of small candles the owner can purchase, and let ℓ represent the number of large candles
the owner can purchase. It’s given that the owner pays $4·90 per candle to purchase small candles and $11·60 per candle to purchase large
candles. Therefore, the owner pays 4·90s dollars for s small candles and 11·60ℓ dollars for ℓ large candles, which means the owner pays a
total of 4·90s + 11·60ℓ dollars to purchase candles. It’s given that the owner budgets $2,200 to purchase candles. Therefore, 4·90s + 11·60ℓ
≤ 2,200. It’s also given that the owner must purchase a minimum of 200 candles. Therefore, s + ℓ ≥ 200. The inequalities 4·90s + 11·60ℓ
≤ 2,200 and s + ℓ ≥ 200 can be combined into one compound inequality by rewriting the second inequality so that its left-hand side is
equivalent to the left-hand side of the first inequality. Subtracting ℓ from both sides of the inequality s + ℓ ≥ 200 yields s ≥ 200 - ℓ.
Multiplying both sides of this inequality by 4·90 yields 4·90s ≥ 4·90(200 - ℓ), or 4·90s ≥ 980 - 4·90ℓ. Adding 11·60ℓ to both sides of this
inequality yields 4·90s + 11·60ℓ ≥ 980 - 4·90ℓ + 11·60ℓ, or 4·90s + 11·60ℓ ≥ 980 + 6·70ℓ. This inequality can be combined with the
inequality 4·90s + 11·60ℓ ≤ 2,200, which yields the compound inequality 980 + 6·70ℓ ≤ 4·90s + 11·60ℓ ≤ 2,200. It follows that 980
+ 6·70ℓ ≤ 2,200. Subtracting 980 from both sides of this inequality yields 6·70ℓ ≤ 2,200. Dividing both sides of this inequality by 6·70 yields
approximately ℓ ≤ 182·09. Since the number of large candles the owner purchases must be a whole number, the maximum number of large
candles the owner can purchase is the largest whole number less than 182·09, which is 182.$qb$);
select seed_pool_question($qb$CB-bf749912$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$1/3 (x + 6) - 1/2 (x + 6) = -8
What value of x is the solution to the given equation?$qb$, null, null, null, array[$qb$42$qb$]::text[], $qb$The correct answer is 42. The expression  is a factor of both terms on the left-hand side of the given equation. Therefore, the given
(x + 6) (1/3 - ((1x)/2)+=6-) 8
equation can be written as , or . Multiplying each side of this equation by -6 yields x + 6 = 48.
x =(x42+ 6) (-1/6) = -8
Subtracting 6 from each side of this equation yields . Therefore, the value of x that is the solution to the given equation is 42.$qb$);
select seed_pool_question($qb$CB-c17d9ba9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A number x is at most 17 less than 5 times the value of y. If the value of y is 3, what is the greatest possible value of x?$qb$, null, null, null, array[$qb$-2$qb$]::text[], $qb$The correct answer is -2. It's given that a number x is at most 17 less than 5 times the value of y, or x ≤ 5y - 17. Substituting 3 for y in this
inequality yields x ≤ 5(3) - 17, or x ≤ -2. Thus, if the value of y is 3, the greatest possible value of x is -2.$qb$);
select seed_pool_question($qb$CB-d1042cf8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A food truck buys forks for $0·04 each and plates for $0·48 each. The total cost of x forks and y plates is $661·76. Which equation represents
this situation?$qb$, null, $qb$[{"label": "A", "body": "0·48x - 0·04y = 661·76"}, {"label": "B", "body": "0·04x - 0·48y = 661·76"}, {"label": "C", "body": "0·48x + 0·04y = 661·76"}, {"label": "D", "body": "0·04x + 0·48y = 661·76"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the food truck buys forks for $0·04 each. Therefore, the cost, in dollars, of x forks can be represented by the
expression 0·04x. It’s also given that the food truck buys plates for $0·48 each. Therefore, the cost, in dollars, of y plates can be represented by
the expression 0·48y. Since the total cost of x forks and y plates is $661·76, the equation 0·04x + 0·48y = 661·76 represents this situation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This equation represents a situation in which the food truck buys forks for $0·48 each and plates for $0·04 each.$qb$);
select seed_pool_question($qb$CB-768f3b7c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
-/2??? |||(-y)/24|||
-s
s
The table shows three values of x and their corresponding values of y, where s is a constant. There is a linear relationship between x and y.
Which of the following equations represents this relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-768f3b7c.png$qb$, $qb$[{"label": "A", "body": "sx + 3y = 18s"}, {"label": "B", "body": "3x + sy = 18s"}, {"label": "C", "body": "3x + sy = 18"}, {"label": "D", "body": "sx + 3y = 18"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The linear relationship between x and y can be represented by an equation of the form y - y1 = m(x - x1 ), where m is
the slope of the graph of the equation in the xy-plane and (x1 , y1 ) is a point on the graph. The slope of a line can be found using two points on
the line and the slope formula . Each value of x and its corresponding value of y in the table can be represented by a point (x, y) .
Substituting the points (-s, 21)m =- 3/s(y2-y1)/(x(2s-,x11)5) and  for (x1 , y1 ) and (x2 , y2 ) , respectively, in the slope formula yields , which gives m
y - y1 = m(x -mx=1 ) (15-21)/(s-(-s))
, or m = - 3/s . Substituting for m and the point (s, 15) for (x1 , y1 ) in the equation yields y- 15 =
. Distributing - 3/s on the right-hand side of this equation yields . Adding 15 to each side of this equation yields y
===- 3/(s/1)(-6)/(^(2)8(^(s))x3x/(s^(s))-+s)18 y - 15 = -3x/s3+x 3
. Multiplying each side of this equation by s yields sy = -3x + 18s. Adding  to each side of this equation yields 3x + sy
. Therefore, the equation 3x + sy = 18s represents this relationship.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-94b48cbf$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The graph of 7x + 2y = -31 in the xy-plane has an x-intercept at (a, 0) and a y-intercept at (0, b), where a and b are constants. What is the
value of b/a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-94b48cbf.png$qb$, $qb$[{"label": "A", "body": "- 7/2"}, {"label": "B", "body": "- 2/7"}, {"label": "C", "body": "2/7"}, {"label": "D", "body": "7/2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The x-coordinate a of the x-intercept (a, 0) can be found by substituting 0 for y in the given equation, which gives 7x + 2(0)
= -31, or 7x = -31 . Dividing both sides of this equation by 7 yields x = - 31/7 . Therefore, the value of a is - 31/7 . The y-coordinate b of the y-
intercept (0, b) can be found by substituting 0 for x in the given equation, which gives , or 2y = -31. Dividing both sides of
7(0) + 2y = (-- 3311/2)/(- 31/7)
this equation by 2 yields y = - 31/2 . Therefore, the value of b is - 31/2 . It follows that the value of b/a is , which is equivalent to ( 31/2 ) ( 7/31 ) , or
7/2 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8339793c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Nasir bought 9 storage bins that were each the same price. He used a coupon for $63 off the entire purchase. The cost for the entire purchase
after using the coupon was $27. What was the original price, in dollars, for 1 storage bin?$qb$, null, null, null, array[$qb$10$qb$]::text[], $qb$The correct answer is 10. It’s given that the cost for the entire purchase was $27 after a coupon was used for $63 off the entire purchase.
Adding the amount of the coupon to the purchase price yields 27 + 63 = 90. Thus, the cost for the entire purchase before using the coupon
was $90. It’s given that Nasir bought 9 storage bins. The original price for 1 storage bin can be found by dividing the total cost by 9. Therefore,
the original price, in dollars, for 1 storage bin is 90/9, or 10.$qb$);
select seed_pool_question($qb$CB-2e0290c3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$??mnOpa? 441020504050223355II0000000000?-/(-|10II00| |202200| |503300| |444000| |505500| |606600| |207700| |808800| |?9900| ?|II00|)|?| | | | | | | | | | | | | | | | | | | | 00|x
?omPan? ?
The graph shows the relationship between the number of shares of stock from Company A, x, and the number of shares of stock from Company
B, y, that Simone can purchase. Which equation could represent this relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2e0290c3.png$qb$, $qb$[{"label": "A", "body": "y = 8x + 12"}, {"label": "B", "body": "8x + 12y = 480"}, {"label": "C", "body": "y = 12x + 8"}, {"label": "D", "body": "12x + 8y = 480"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The graph shown is a line passing through the points (0, 40) and (60, 0). Since the relationship between x and y is linear, if
two points on the graph make a linear equation true, then the equation represents the relationship. Substituting 0 for x and 40 for y in the
equation in choice B, 8x + 12y = 480, yields , or 480 = 480, which is true. Substituting 60 for x and 0 for y in the
8(60) + 12(80()0)=+48102(40) = 480
equation 8x + 12y = 480 yields , or 480 = 480, which is true. Therefore, the equation 8x + 12y = 480 represents the
relationship between x and y.
Choice A is incorrect. The point (0, 40) is not on the graph of this equation, since 40 = 8(0) + 12, or 40 = 12, is not true.
Choice C is incorrect. The point (0, 40) is not on the graph of this equation, since 40 = 12(0) + 8, or 40 = 8, is not true.
Choice D is incorrect. The point (0, 40) is not on the graph of this equation, since 12(0) + 8(40) = 480, or 320 = 480, is not true.$qb$);
select seed_pool_question($qb$CB-dd797fe2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Mario purchased 4 binders that cost x dollars each and 3 notebooks that cost y dollars each. If the given equation represents this situation,
which of the following is the best interpretation of 24 in this context?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dd797fe2.png$qb$, $qb$[{"label": "A", "body": "The total cost, in dollars, for all binders purchased"}, {"label": "B", "body": "The total cost, in dollars, for all notebooks purchased"}, {"label": "C", "body": "The total cost, in dollars, for all binders and notebooks purchased"}, {"label": "D", "body": "The difference in the total cost, in dollars, between the number of binders and notebooks purchased"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since Mario purchased 4 binders that cost x dollars each, the expression  represents the total cost, in dollars, of the 4
binders he purchased. Since Mario purchased 3 notebooks that cost y dollars each, the expression  represents the total cost, in dollars, of the
3 notebooks he purchased. Therefore, the expression  represents the total cost, in dollars, for all binders and notebooks he purchased.
In the given equation, the expression  is equal to 24. Therefore, it follows that 24 is the total cost, in dollars, for all binders and
notebooks purchased.
Choice A is incorrect. This is represented by the expression  in the given equation. Choice B is incorrect. This is represented by the expression
in the given equation. Choice D is incorrect. This is represented by the expression .$qb$);
select seed_pool_question($qb$CB-45a534d0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$48x - 72y = 30y + 24
ry = 1/6 - 16x
In the given system of equations, r is a constant. If the system has no solution, what is the value of r?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-45a534d0.png$qb$, null, null, array[$qb$-34$qb$]::text[], $qb$The correct answer is -34. A system of two linear equations in two variables, x and y, has no solution if the lines represented by the equations
in the xy-plane are distinct and parallel. Two lines represented by equations in standard form Ax + By = C, where AB, , and C are constants,
are parallel if the coefficients for x and y in one equation are proportional to the corresponding coefficients in the other equation. The first
equation in the given system can be written in standard form by subtracting 30y from both sides of the equation to yield 48x - 102y = 24. The
second equation in the given system can be written in standard form by adding 16x to both sides of the equation to yield 16x + ry = 1/6 . The
coefficient of x in this second equation, 16, is 1/3 times the coefficient of x in the first equation, 48. For the lines to be parallel the coefficient of y
in the second equation, r, must also be 1/3 times the coefficient of y in the first equation, -102. Thus, r = 1/3 (-102) , or r = -34. Therefore, if
the given system has no solution, the value of r is -34.$qb$);
select seed_pool_question($qb$CB-550b352c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$How many solutions exist to the equation shown above?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-550b352c.png$qb$, $qb$[{"label": "A", "body": "None"}, {"label": "B", "body": "Exactly 1"}, {"label": "C", "body": "Exactly 3"}, {"label": "D", "body": "Infinitely many"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Subtracting 4 from each side of the given equation yields , or , so the equation has a unique solution of
.
Choice A is incorrect. Since 3 is a value of x that satisfies the given equation, the equation has at least 1 solution. Choice C is incorrect. Linear
equations can have 0, 1, or infinitely many solutions; no linear equation has exactly 3 solutions. Choice D is incorrect. If a linear equation has
infinitely many solutions, it can be reduced to . This equation reduces to , so there is only 1 solution.$qb$);
select seed_pool_question($qb$CB-a396ed75$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For a training program, Juan rides his bike at an average rate of 5·7 minutes per mile. Which function m models the number of minutes it will
take Juan to ride x miles at this rate?$qb$, null, $qb$[{"label": "A", "body": "m(x) = x/(5·7)"}, {"label": "B", "body": "m(x) = x + 5·7"}, {"label": "C", "body": "m(x) = x - 5 · 7"}, {"label": "D", "body": "m(x) = 5 · 7x"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It′s given that Juan rides his bike at an average rate of 5·7 minutes per mile. The number of minutes it will take Juan to ride x
miles can be determined by multiplying his average rate by the number of miles, x, which yields 5·7x. Therefore, the function m(x) = 5 · 7x
models the number of minutes it will take Juan to ride x miles.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-50f4cb9c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x
-/1??? |||(-f(x))/640/(-64 |)|||
For the linear function f, the table shows three values of x and their corresponding values of f(x). Function f is defined by f(x) = ax + b,
where a and b are constants. What is the value of a - b?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-50f4cb9c.png$qb$, $qb$[{"label": "A", "body": "-64"}, {"label": "B", "body": "62"}, {"label": "C", "body": "128"}, {"label": "D", "body": "192"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The table gives that f(x) = 0 when x = 2. Substituting 0 for f(x) and 2 for x into the equation f(x) = ax + b yields 0
= 2a + b. Subtracting 2a from both sides of this equation yields b = -2a. The table gives that f(x) = -64 when x = 1 . Substituting -2a for
b -64,  for f(x) , and 1 for x into the equation f(x) = ax + b yields . Combining like terms yields -64 = -a, or a
b-=64(-=2)^(a)((614))+ (-2^(a))
= 64. Since b = -2a, substituting 64 for a into this equation gives , which yields b = -128. Thus, the value of a - b can be
written as 64 - (-128) , which is 192.
Choice A is incorrect. This is the value of a + b, not a - b.
Choice B is incorrect. This is the value of a - 2, not a - b.
Choice C is incorrect. This is the value of 2a, not a - b.$qb$);
select seed_pool_question($qb$CB-87071893$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x + 40 = 95
What value of x is the solution to the given equation?$qb$, null, null, null, array[$qb$55$qb$]::text[], $qb$The correct answer is 55. Subtracting 40 from both sides of the given equation yields x = 55. Therefore, the value of x is 55.$qb$);
select seed_pool_question($qb$CB-b00ad7f2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y - 9x = 13
5x = 2y
What is the solution (x, y) to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(5/2 , 1)"}, {"label": "B", "body": "(1, 2/5)"}, {"label": "C", "body": "(-2, -5)"}, {"label": "D", "body": "(-5, -2)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Adding 9x to both sides of the first equation in the given system yields y = 9x + 13. Substituting the expression 9x + 13
for y in the second equation in the given system yields 5x = 2(9x + 13). Distributing the 2 on the right-hand side of this equation yields
5x = 18x + 26. Subtracting 18x from both sides of this equation yields -13x = 26. Dividing both sides of this equation by -13 yields
x = -2. Substituting -2 for x in the equation y = 9x + 13 yields y = 9(-2) + 13, or y = -5. Therefore, the solution (x, y) to the given
system of equations is (-2, -5).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the solution (y, x) , not (x, y), to the given system of equations.$qb$);
select seed_pool_question($qb$CB-ca9bb527$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y =y =4x1-99
What is the solution (x, y) to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(4, 19)"}, {"label": "B", "body": "(7, 19)"}, {"label": "C", "body": "(19, 4)"}, {"label": "D", "body": "(19, 7)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given by the second equation in the system that y = 19. Substituting 19 for y in the first equation yields 19 = 4x - 9.
Adding 9 to both sides of this equation yields 28 = 4x. Dividing both sides of this equation by 4 yields 7 = x. Therefore, since x = 7 and
y = 19, the solution (x, y) to the given system of equations is (7, 19) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-16889ef3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Oil and gas production in a certain area dropped from 4 million barrels in 2000 to 1.9 million barrels in 2013. Assuming that the oil and gas
production decreased at a constant rate, which of the following linear functions f best models the production, in millions of barrels, t years after
the year 2000?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-16889ef3.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It is assumed that the oil and gas production decreased at a constant rate. Therefore, the function f that best models the
production t years after the year 2000 can be written as a linear function, , where m is the rate of change of the oil and gas
production and b is the oil and gas production, in millions of barrels, in the year 2000. Since there were 4 million barrels of oil and gas produced
in 2000, . The rate of change, m, can be calculated as , which is equivalent to , the rate of change in
choice C.
Choices A and B are incorrect because each of these functions has a positive rate of change. Since the oil and gas production decreased over
time, the rate of change must be negative. Choice D is incorrect. This model may result from misinterpreting 1.9 million barrels as the amount by
which the production decreased.$qb$);
select seed_pool_question($qb$CB-c651cc56$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Some values of the linear function f are shown in the table above. What is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c651cc56.png$qb$, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "7"}, {"label": "C", "body": "8"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A linear function has a constant rate of change, and any two rows of the table shown can be used to calculate this rate. From
the first row to the second, the value of x is increased by 2 and the value of  is increased by . So the values of  increase
by 3 for every increase by 1 in the value of x. Since , it follows that . Therefore, .
Choice A is incorrect. This is the third x-value in the table, not . Choices C and D are incorrect and may result from errors when calculating
the function’s rate of change.$qb$);
select seed_pool_question($qb$CB-ecca0603$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y < x
x < 22
For which of the following tables are all the values of x and their corresponding values of y solutions to the given system of inequalities?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ecca0603.png$qb$, $qb$[{"label": "A", "body": "x (|--19)/20/(|-21 |)|| |||(-y)/18/19/(-20 ?)???"}, {"label": "B", "body": "x (|--19)/20|| |||(-y)/221/(-22 ?)???"}, {"label": "C", "body": "x (|--23)/42/(|-^(2)5 |)|| |||(-y)/223/(-24 ?)???"}, {"label": "D", "body": "x (|--23)/42/(|-25 |)|| |||(-y)/42/25/(-26 ?)???"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The inequality y < x indicates that for any solution to the given system of inequalities, the value of x must be greater than
the corresponding value of y. The inequality x < 22 indicates that for any solution to the given system of inequalities, the value of x must be
less than 22. Of the given choices, only choice A contains values of x that are each greater than the corresponding value of y and less than 22.
Therefore, for choice A, all the values of x and their corresponding values of y are solutions to the given system of inequalities.
Choice B is incorrect. The values in this table aren’t solutions to the inequality y < x.
Choice C is incorrect. The values in this table aren’t solutions to the inequality x < 22.
Choice D is incorrect. The values in this table aren’t solutions to the inequality y < x or the inequality x < 22.$qb$);
select seed_pool_question($qb$CB-79cf8505$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A line segment that has a length of 115 centimeterS (cm) is divided into three parts. One part is 47cm long. The other two parts have
lengths that are equal to each other. What is the length, in cm, of one of the other two parts of equal length?$qb$, null, null, null, array[$qb$34$qb$]::text[], $qb$The correct answer is 34. It’s given that a line segment has a length of 115cm and is divided into three parts, where one part is 47cm long and
the other two parts have lengths that are equal. If x represents the length, in cm, of each of the two parts of equal length, then the equation 47
+ x + x = 115, or 47 + 2x = 115, represents this situation. Subtracting 47 from each side of this equation yields 2x = 68. Dividing each side
of this equation by 2 yields x = 34. Therefore, the length, in cm, of one of the two parts of equal length is 34.$qb$);
select seed_pool_question($qb$CB-adb0c96c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$24x + y = 48
6x + y = 72
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, null, null, array[$qb$80$qb$]::text[], $qb$The correct answer is 80. Subtracting the second equation in the given system from the first equation yields (24x + y) - (6x + y) = 48
- 72, which is equivalent to 24x - 6x + y - y = -24, or 18x = -24. Dividing each side of this equation by 3 yields 6x = -8. Substituting
-8 for 6x in the second equation yields -8 + y = 72. Adding 8 to both sides of this equation yields y = 80.
Alternate approach: Multiplying each side of the second equation in the given system by 4 yields 24x + 4y = 288. Subtracting the first equation
in the given system from this equation yields (24x + 4y) - (24x + y) = 288 - 48, which is equivalent to 24x - 24x + 4y - y = 240, or
3y = 240. Dividing each side of this equation by 3 yields y = 80.$qb$);
select seed_pool_question($qb$CB-b4553284$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 2x = 12, what is the value of 9x?$qb$, null, null, null, array[$qb$54$qb$]::text[], $qb$The correct answer is 54. Dividing both sides of the given equation by 2 yields x = 6. Multiplying both sides of this equation by 9 yields 9x
= 54. Thus, the value of 9x is 54.$qb$);
select seed_pool_question($qb$CB-c22b5f25$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, the points  and  lie on the graph of which of the following linear functions?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c22b5f25.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. A linear function can be written in the form , where m is the slope and b is the y-coordinate of the y-
intercept of the line. The slope of the graph can be found using the formula . Substituting the values of the given points into
this formula yields  or , which simplifies to . Only choice C shows an equation with this slope.
Choices A, B, and D are incorrect and may result from computation errors or misinterpreting the given information.$qb$);
select seed_pool_question($qb$CB-e4a588ca$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 1/2 (x + 6). What is the value of f(4) ?$qb$, null, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "12"}, {"label": "C", "body": "10"}, {"label": "D", "body": "5"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the function f is defined by f(x) = 1/2 (x + 6) . Substituting 4 for x in the given function yields f(4)
= 1/2 (4 + 6) , or f(4) = 5. Therefore, the value of f(4) is 5.
Choice A is incorrect. This is the value of 2(4 + 6) , not 1/2 (4 + 6) .
Choice B is incorrect. This is the value of 2 + (4 + 6), not 1/2 (4 + 6).
Choice C is incorrect. This is the value of 4 + 6, not 1/2 (4 + 6) .$qb$);
select seed_pool_question($qb$CB-6cb9bf45$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y > 7x - 4
For which of the following tables are all the values of x and their corresponding values of y solutions to the given inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6cb9bf45.png$qb$, $qb$[{"label": "A", "body": "x 5/(|-8 |)||| |||(-y)/127/(-48 ?)???"}, {"label": "B", "body": "x 5/(|-8 |)||| |||17/13/(-52 ?)???"}, {"label": "C", "body": "x 5/(|-8 |)||| |||(-y)/2127/(-52 ?)???"}, {"label": "D", "body": "x 3/5||| |||(-y)/21???"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A solution (x, y) to the given inequality is a value of x and the corresponding value of y such that the value of y is greater
than the value of 7x - 4. All the tables in the choices have the same three values of x, so each of the three values of x can be substituted in the
given inequality to compare the corresponding values of y in each of the tables. Substituting 3 for x in the given inequality yields y > 7(3)
- 4, or y > 17. Substituting 5 for x in the given inequality yields y > 7(5) - 4, or y > 31 . Substituting 8 for x in the given inequality yields y
> 7(8) - 4, or y > 52. Therefore, when x = 3, x = 5, and x = 8, the corresponding values of y must be greater than 17, greater than 31 , and
greater than 52, respectively. In the table in choice D, when x = 3, the corresponding value of y is 21, which is greater than 17; when x = 5, the
corresponding value of y is 35, which is greater than 31 ; when x = 8, the corresponding value of y is 56, which is greater than 52. Of the given
choices, only choice D gives values of x and their corresponding values of y that are all solutions to the given inequality.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-11e1ab81$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The graph above shows the distance traveled d, in feet, by a product on a conveyor belt m minutes after the product is placed on the belt. Which
of the following equations correctly relates d and m ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-11e1ab81.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The line passes through the origin. Therefore, this is a relationship of the form , where k is a constant representing
the slope of the graph. To find the value of k, choose a point  on the graph of the line other than the origin and substitute the values of m
and d into the equation. For example, if the point  is chosen, then , and . Therefore, the equation of the line is .
Choice B is incorrect and may result from calculating the slope of the line as the change in time over the change in distance traveled instead of
the change in distance traveled over the change in time. Choices C and D are incorrect because each of these equations represents a line with a
d-intercept of 2. However, the graph shows a line with a d-intercept of 0.$qb$);
select seed_pool_question($qb$CB-771bd0ca$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$5(t + 3) - 7(t + 3) = 38
What value of t is the solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-771bd0ca.png$qb$, null, null, array[$qb$-22$qb$]::text[], $qb$The correct answer is -22. The given equation can be rewritten as -2(t + 3) = 38. Dividing both sides of this equation by -2 yields t + 3 =
-19. Subtracting 3 from both sides of this equation yields t = -22. Therefore, -22 is the value of t that is the solution to the given equation.$qb$);
select seed_pool_question($qb$CB-18ac8354$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$(| 101214IIIIII?46800444466??2288 |)/(?II44 ?II22 10II00 888 666 444 222)|| || ?|| || || || || || || || || || || || || | || | x
The graph of line g is shown in the xy-plane. Line k is defined by 165x + py = w, where p and w are constants. If line k is graphed in this xy-
plane, resulting in the graph of a system of two linear equations, the system of two linear equations will have infinitely many solutions. What is
the value of p + w?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-18ac8354.png$qb$, null, null, array[$qb$300$qb$]::text[], $qb$The correct answer is 300. It’s given that the graph of line g is shown in the xy-plane and that line k is defined by 165x + py = w, where p and
w are constants. It’s also given that if line k is graphed in this xy-plane, the resulting system of two linear equations will have infinitely many
solutions. A system of two linear equations has infinitely many solutions when the two linear equations are equivalent. Therefore, line g and line
k have the same slope and the same y-intercept. The slope of a line that passes through the points  and (x2 , y2 ) can be calculated
(^(x1)(^(,)0y,^(1)1))
using the formula . The graph shows that line  passes through the points (-10, 12) and . Substituting (-10, 12) and (0, 1)
(xm2 ,=y2(y2-yI)/()x2 -x1) m =g (y2-y1)/(x2 -x1)
for (x1 , y1 ) and , respectively, in the formula yields , or m = (-11)/1o . An equation representing a linear
m = (1-12)/(^(0)0-,(b-)^(10))
relationship can be written in the form y = mx + b, where m is the slope and  is the y-intercept of the line in the xy-plane. Since line g
passes through the point (0, 1) , it follows that b = 1 . Thus, the equation of line g is y = - 11/1o x + 1. For line k, the equation 165x + py = w
can be rewritten in y = mx + b form by isolating y. Subtracting 165x from both sides of this equation yields . Dividing both
k py =(0-, w1/p6)5x + w
sides of this equation by p yields y = (-165)/p x + w/p . It follows that in the xy-plane, line  has a slope of  and is the y-intercept. Since
w/p = (-165)/(1^(p))
line  and line k have the same slope and the same y-intercept, it follows that - 165/p = - 11/10 and . Multiplying both sides of
- 11g/1o 11 150 - 165/pw/pp+==w1
by -10p yields 1,650 = 11p. Dividing both sides of this equation by  yields 150 = p. Substituting  for p in the equation
yields . Multiplying both sides of this equation by 150 yields w = 150. Substituting 150 for p and 150 for w in the expression
w/(1^(1)55o0) += 1150
yields , which is equivalent to 300. Therefore, the value of p + w is 300.$qb$);
select seed_pool_question($qb$CB-df78b361$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Lily made 36 cups of jam. Lily then filled x small containers and y large containers with all the jam she made. The equation 4x + 6y = 36
represents this situation. Which is the best interpretation of 6y in this context?$qb$, null, $qb$[{"label": "A", "body": "The number of large containers Lily filled"}, {"label": "B", "body": "The number of small containers Lily filled"}, {"label": "C", "body": "The total number of cups of jam in the large containers"}, {"label": "D", "body": "The total number of cups of jam in the small containers"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the equation 4x + 6y = 36 represents the situation where Lily filled x small containers and y large containers
with all the jam she made, which was 36 cups. Therefore, 6y represents the total number of cups of jam in the large containers.
Choice A is incorrect. The number of large containers Lily filled is represented by y, not 6y.
Choice B is incorrect. The number of small containers Lily filled is represented by x, not 6y.
Choice D is incorrect. The total number of cups of jam in the small containers is represented by 4x, not 6y.$qb$);
select seed_pool_question($qb$CB-69f609b2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$How many solutions does the equation 12(x - 3) = -3(x + 12) have?$qb$, null, $qb$[{"label": "A", "body": "Exactly one"}, {"label": "B", "body": "Exactly two"}, {"label": "C", "body": "Infinitely many"}, {"label": "D", "body": "Zero"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Distributing 12 on the left-hand side and -3 on the right-hand side of the given equation yields 12x - 36 = -3x - 36.
Adding 3x to each side of this equation yields 15x - 36 = -36. Adding 36 to each side of this equation yields 15x = 0. Dividing each side of
this equation by 15 yields x = 0. This means that 0 is the only solution to the given equation. Therefore, the given equation has exactly one
solution.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0e926898$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Students and chaperones from a middle school are going on a field trip to a museum. Admission to the museum will cost $8·50 for each student
and $12 for each chaperone. It will cost a total of $730 for admission to the museum for all 83 people on the field trip. How many students are
going on the field trip?$qb$, null, $qb$[{"label": "A", "body": "31"}, {"label": "B", "body": "70"}, {"label": "C", "body": "76"}, {"label": "D", "body": "86"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that admission to the museum will cost $8·50 for each student and $12 for each chaperone. It's also given that it
will cost a total of $730 for admission to the museum for all 83 people on the field trip. Let x represent the number of students and y represent
the number of chaperones going on the field trip. Since there are a total of 83 people going on the field trip, it follows that x + y = 83. Since
admission to the museum for each student costs $8·50 and each chaperone costs $12, the total cost can be represented by the equation 8·50x
+ 12y = 730. The equations x + y = 83 and 8·50x + 12y = 730 form a system of equations. Subtracting x from both sides of the equation
x + y = 83 yields y = 83 - x. Substituting 83 - x for y in the equation 8·50x + 12y = 730 yields 8·50x + 12(83 - x) = 730, or -3·50x
+ 996 = 730. Subtracting 996 from both sides of this equation yields -3·50x = -266. Dividing both sides of this equation by -3·50 yields x
= 76. Therefore, 76 students are going on the field trip.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2e379126$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function g is defined by g(x) = 4x - 6. What is the value of g(-7) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2e379126.png$qb$, $qb$[{"label": "A", "body": "-34"}, {"label": "B", "body": "-22"}, {"label": "C", "body": "- 13/4"}, {"label": "D", "body": "- 1/4"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the function g is defined by g(x) = 4x - 6. Substituting -7 for x into the given equation yields g(-7)
= 4(-7) - 6, or g(-7) = -34.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of x for which g(x) = -7, not the value of g(-7).$qb$);
select seed_pool_question($qb$CB-80ae6851$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A producer is creating a video with a length of 70 minutes. The video will consist of segments that are 1 minute long and segments that are 3
minutes long. Which equation represents this situation, where x represents the number of 1 -minute segments and y represents the number of 3-
minute segments?$qb$, null, $qb$[{"label": "A", "body": "4xy = 70"}, {"label": "B", "body": "4(x + y) = 70"}, {"label": "C", "body": "3x + y = 70"}, {"label": "D", "body": "x + 3y = 70"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since x represents the number of 1-minute segments and y represents the number of 3-minute segments, the total length of
the video is 1 · x + 3 · y, or x + 3y, minutes. Since the video is 70 minutes long, the equation x + 3y = 70 represents this situation.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-979b0b8d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For the linear function f, the graph of y= f(x) in the xy-plane has a slope of 39 and passes through the point (0, 0). Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = -39x"}, {"label": "B", "body": "f(x) = 1/39 x"}, {"label": "C", "body": "f(x) = x - 39"}, {"label": "D", "body": "f(x) = 39x"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. An equation defining a linear function can be written in the form , where m is the slope and (0, b) is the y-
y = f(fx()x) = mx + b
intercept of the graph of y= f(x) in the xy-plane. It’s given that the graph of  has a slope of 39, so m = 39. It’s also given that the
graph of y = f(x) passes through the point , so b = 0. Substituting 39 for m and 0 for b in f(x) = mx + b yields f(x) = 39x + 0, or
(f0, 0)f(x) = 39x
f(x) = 39x. Thus, the equation that defines  is .
Choice A is incorrect. This equation defines a function whose graph has a slope of -39, not 39.
Choice B is incorrect. This equation defines a function whose graph has a slope of 1/39 , not 39.
Choice C is incorrect. This equation defines a function whose graph has a slope of 1, not 39, and passes through the point (0, -39) , not (0, 0) .$qb$);
select seed_pool_question($qb$CB-789975b7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A gardener buys two kinds of fertilizer. Fertilizer A contains 60% filler materials by weight and Fertilizer B contains 40% filler materials by weight.
Together, the fertilizers bought by the gardener contain a total of 240 pounds of filler materials. Which equation models this relationship, where x
is the number of pounds of Fertilizer A and y is the number of pounds of Fertilizer B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-789975b7.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since Fertilizer A contains 60% filler materials by weight, it follows that x pounds of Fertilizer A consists of 0.6x pounds of
filler materials. Similarly, y pounds of Fertilizer B consists of 0.4y pounds of filler materials. When x pounds of Fertilizer A and y pounds of
Fertilizer B are combined, the result is 240 pounds of filler materials. Therefore, the total amount, in pounds, of filler materials in a mixture of x
pounds of Fertilizer A and y pounds of Fertilizer B can be expressed as .
Choice A is incorrect. This choice transposes the percentages of filler materials for Fertilizer A and Fertilizer B. Fertilizer A consists of 0.6x
pounds of filler materials and Fertilizer B consists of 0.4y pounds of filler materials. Therefore,  is equal to 240, not
. Choice C is incorrect. This choice transposes the percentages of filler materials for Fertilizer A and Fertilizer B and incorrectly represents how to
take the percentage of a value mathematically. Choice D is incorrect. This choice incorrectly represents how to take the percentage of a value
mathematically. Fertilizer A consists of 0.6x pounds of filler materials, not 60x pounds of filler materials, and Fertilizer B consists of 0.4y pounds
of filler materials, not 40y pounds of filler materials.$qb$);
select seed_pool_question($qb$CB-a309803e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$One gallon of paint will cover 220 square feet of a surface. A room has a total wall area of w square feet. Which equation represents the total
amount of paint P, in gallons, needed to paint the walls of the room twice?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a309803e.png$qb$, $qb$[{"label": "A", "body": "P = w/110"}, {"label": "B", "body": "P = 440w"}, {"label": "C", "body": "P = w/220"}, {"label": "D", "body": "P = 220w"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that w represents the total wall area, in square feet. Since the walls of the room will be painted twice, the amount of
paint, in gallons, needs to cover 2w square feet. It’s also given that one gallon of paint will cover 220 square feet. Dividing the total area, in
square feet, of the surface to be painted by the number of square feet covered by one gallon of paint gives the number of gallons of paint that
will be needed. Dividing 2w by 220 yields , or w/110 . Therefore, the equation that represents the total amount of paint P, in gallons, needed to
P = w/1102w/22o
paint the walls of the room twice is .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from finding the amount of paint needed to paint the walls once rather than twice.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c41e5688$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-(??????66????)/(-/--/--/--/-888 666 444 222÷÷÷÷864244662288 ?22 ??? ?66 8??)|| || || || || ?||| || || | || || || || || || || || | x
The shaded region shown represents the solutions to which inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c41e5688.png$qb$, $qb$[{"label": "A", "body": "y < -1 + 3x"}, {"label": "B", "body": "y < -1 - 3x"}, {"label": "C", "body": "y > -1 + 3x"}, {"label": "D", "body": "y > -1 - 3x"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The equation for the line representing the boundary of the shaded region can be written in slope-intercept form y = b + mx,
where m is the slope and (0, b) is the y-intercept of the line. For the graph shown, the boundary line passes through the points  and
(1, -4) . Given two points on a line, (x1 , y1 ) and (x2 , y2 ) , the slope of the line can be calculated using the equation mm= (y2-y(10)/(=x?(--^(x)3)/11) , - 1 ). Substituting
the points (0, -1) and for (x1 , y1 ) and (x2 , y2 ) in this equation yields , which is equivalent to , or m = -3.
(0, -1)(1, -4) m = (-4-(-1))/(-31-0)
Since the point represents the y-intercept, it follows that b = -1. Substituting  for m and -1 for b in the equation y = b + mx
yields y = -1 - 3x as the equation of the boundary line. Since the shaded region represents all the points above this boundary line, it follows
that the shaded region shown represents the solutions to the inequality y > -1 - 3x.
Choice A is incorrect. This inequality represents a region below, not above, a boundary line with a slope of 3, not -3.
Choice B is incorrect. This inequality represents a region below, not above, the boundary line shown.
Choice C is incorrect. This inequality represents a region whose boundary line has a slope of 3, not -3.$qb$);
select seed_pool_question($qb$CB-55ea82f3$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A team hosting an event to raise money for new uniforms plans to sell at least 140 tickets before this event and at least 220 tickets during this
event to raise a total of at least $5,820 from all tickets sold. The price of a ticket during this event is $3 less than the price of a ticket before this
event. Which inequality represents this situation, where x is the price, in dollars, of a ticket sold during this event?$qb$, null, $qb$[{"label": "A", "body": "140(x + 3) + 220x ≤ 5,820"}, {"label": "B", "body": "140(x + 3) + 220x ≥ 5,820"}, {"label": "C", "body": "140(x - 3) + 220x ≤ 5,820"}, {"label": "D", "body": "140(x - 3) + 220x ≥ 5,820"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that a team plans to sell at least 140 tickets before an event and at least 220 tickets during the event to raise a
total of at least $5,820 from all tickets sold. It’s also given that the price of a ticket during the event is $3 less than the price of a ticket before
the event and that x represents the price, in dollars, of a ticket sold during the event. It follows that x + 3 represents the price, in dollars, of a
ticket sold before the event. The expression 140(x + 3) represents the planned revenue, in dollars, from the tickets sold before the event, and
the expression 220x represents the planned revenue, in dollars, from the tickets sold during the event. Thus, the expression 140(x + 3) + 220x
represents the planned revenue, in dollars, from all tickets sold. Since the team plans to raise a total of at least $5,820 from all tickets sold, the
total revenue must be at least $5,820. Therefore, the inequality 140(x + 3) + 220x ≥ 5,820 represents this situation.
Choice A is incorrect. This inequality represents a situation in which the team raises a total of at most $5,820 from all tickets sold.
Choice C is incorrect. This inequality represents a situation in which the price of a ticket before the event is $3 less, rather than $3 more, than the
price of a ticket during the event and the team raises a total of at most $5,820 from all tickets sold.
Choice D is incorrect. This inequality represents a situation in which the price of a ticket before the event is $3 less, rather than $3 more, than the
price of a ticket during the event.$qb$);
select seed_pool_question($qb$CB-cea27ab2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$7x - 4y = -84
For the given equation, which table gives three values of x and their corresponding values of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cea27ab2.png$qb$, $qb$[{"label": "A", "body": "x -/(|-^(y) |)| |(-0)/(-21 |)|(-4)/(-28 ?)?(-8)/(-35 |)|"}, {"label": "B", "body": "x -/(|-^(y) |)| |(-0)/(-35 |)|(-4)/(-28 ?)?(-8)/(-21 |)|"}, {"label": "C", "body": "x -/(|-y |)| |(-21)/(-0 |)|(-28)/(-4 ?)?(-35)/(-8 |)|"}, {"label": "D", "body": "x -/(|-^(y) |)| |(-21)/(-8 |)|(-28)/(-4 ?)?(-35)/(-0 |)|"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. To verify which table represents this linear relationship, the values in each table can be checked by substituting them into the
given equation. The table in choice A shows that when x = 0, y = 21 . Substituting these values into the given equation yields 7(0) - 4(21) =
-84, or -84 = -84, which is true. Additionally, the table in choice A shows that when x = 4y = 28, . Substituting these values into the given
equation yields 7(4) - 4(28) = -84, or -84 = -84, which is true. Finally, the table in choice A shows that when x = 8, y = 35. Substituting
these values into the given equation yields 7(8) - 4(35) = -84, or -84 = -84, which is true. Therefore, the table in choice A gives three
values of x and their corresponding values of y.
Choice B is incorrect. The table in choice B shows that when x = 0y = 35, . Substituting these values into the given equation yields 7(0)
- 4(35) = -84, or -140 = -84, which is not true.
Choice C is incorrect. The table in choice C shows that when x = 21 , y = 0. Substituting these values into the given equation yields 7(21)
- 4(0) = -84, or 147 = -84, which is not true.
Choice D is incorrect. The table in choice D shows that when x = 21 , y = 8. Substituting these values into the given equation yields 7(21)
- 4(8) = -84, or 115 = -84, which is not true.$qb$);
select seed_pool_question($qb$CB-a049f400$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y < 5x + 6
For which of the following tables are all the values of x and their corresponding values of y solutions to the given inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a049f400.png$qb$, $qb$[{"label": "A", "body": "x 5/(|-7 |)||| |||27/(-37 ?)???"}, {"label": "B", "body": "5/(|-7 |)||| |||35/(-37 ?)???"}, {"label": "C", "body": "x 5/(|-7 |)||| |||(-y)/235/(-45 ?)???"}, {"label": "D", "body": "x 3/5||| |||(-y)/21???"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Substituting 3 for x in the given inequality yields , or y < 21. Therefore, when x = 3, the corresponding value
of y is less than 21 . Substituting 5 for x in the given inequality yields yyy <<< 555(((357))) +++ 666, or y < 31 . Therefore, when x = 5, the corresponding value
of y is less than 31 . Substituting 7 for x in the given inequality yields , or y < 41 . Therefore, when x = 7, the corresponding value
of y is less than 41 . For the table in choice A, when x = 3, the corresponding value of y is 17, which is less than 21 ; when x = 5, the
corresponding value of y is 27, which is less than 31; and when x = 7, the corresponding value of y is 37, which is less than 41 . Therefore, the
table in choice A gives values of x and their corresponding values of y that are all solutions to the given inequality.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e006209c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A geologist needs to collect at least 67 samples of lava from a volcano. If the geologist has already collected 63 samples from the volcano, what
is the minimum number of additional samples the geologist needs to collect?$qb$, null, $qb$[{"label": "A", "body": "130"}, {"label": "B", "body": "63"}, {"label": "C", "body": "4"}, {"label": "D", "body": "0"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the geologist has already collected 63 samples from the volcano. Let x represent the number of additional
samples the geologist needs to collect. After collecting x additional samples, the geologist will have collected a total of 63 + x samples. It's
given that the geologist needs to collect at least 67 samples. Therefore, 63 + x ≥ 67. Subtracting 63 from each side of this inequality yields the
inequality x ≥ 4. Thus, the geologist needs to collect a minimum of 4 additional samples.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the number of samples the geologist has already collected, rather than the minimum number of additional samples
the geologist needs to collect.
Choice D is incorrect. If the geologist collects 0 additional samples, the geologist will have collected a total of 63 samples, which is less than 67
samples.$qb$);
select seed_pool_question($qb$CB-bf883fde$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For the function f, the graph of y = f(x) in the xy-plane has a slope of 3 and passes through the point (0, -8) . Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 3x"}, {"label": "B", "body": "f(x) = 3x - 8"}, {"label": "C", "body": "f(x) = 3x + 5"}, {"label": "D", "body": "f(x) = 3x + 11"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. An equation defining a linear function can be written in the form f(x) = mx + b, where m and b are constants, m is the
slope of the graph of y= f(x) in the xy-plane, and (0, b) is the y-intercept of the graph. It's given that for the function f, the graph of y = f(x)
in the xy-plane has a slope of 3. Therefore, m = 3. It's also given that this graph passes through the point (0, -8). Therefore, the y-intercept of
the graph is (0, -8) , and it follows that b = -8. Substituting 3 for m and -8 for b in the equation f(x) = mx + b yields f(x) = 3x - 8.
Thus, the equation that defines f is f(x) = 3x - 8.
Choice A is incorrect. For this function, the graph of y = f(x) in the xy-plane passes through the point (0, 0) , not (0, -8).
Choice C is incorrect. For this function, the graph of y = f(x) in the xy-plane passes through the point (0, 5) , not (0, -8).
Choice D is incorrect. For this function, the graph of y = f(x) in the xy-plane passes through the point (0, 11) , not (0, -8).$qb$);
select seed_pool_question($qb$CB-0d1b1e35$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A batch of banana milkshakes consists of 4 cups of ice cream and 2 bananas and has 1,114mi1IigramS (mg) of calcium. There is 276mg of
calcium in 1 cup of the ice cream used to make this batch of milkshakes. How much calcium, inmg, is in 1 banana?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "10"}, {"label": "C", "body": "419"}, {"label": "D", "body": "1,104"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that a batch of banana milkshakes consists of 4 cups of ice cream and 2 bananas and has 1,114 mg of calcium.
It’s also given that there is 276 mg of calcium in 1 cup of the ice cream used to make this batch of milkshakes. It follows that the total amount of
calcium in 4 cups of ice cream is 4(276) , or 1,104 mg. Let x represent the amount of calcium, in mg, in 1 banana. It follows that the total
amount of calcium in 2 bananas is 2x mg. Since the batch of banana milkshakes has 1,114 mg of calcium, the equation 1,104 + 2x = 1,114
represents this situation. Subtracting 1,104 from both sides of this equation yields 2x = 10. Dividing both sides of this equation by 2 yields x
= 5. Therefore, the amount of calcium in 1 banana is 5 mg.
Choice B is incorrect. This is the amount of calcium, in mg, in 2 bananas, not in 1 banana.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the amount of calcium, in mg, in 4 cups of ice cream, not in 1 banana.$qb$);
select seed_pool_question($qb$CB-2554b413$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the xy-plane, a line has a slope of 6 and passes through the point . Which of the following is an equation of this line?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2554b413.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The slope-intercept form of an equation for a line is , where m is the slope of the line and b is the y-coordinate
of the y-intercept of the line. It’s given that the slope is 6, so . It’s also given that the line passes through the point  on the y-axis, so
. Substituting  and  into the equation  gives .
Choices B, C, and D are incorrect and may result from misinterpreting the slope-intercept form of an equation of a line.$qb$);
select seed_pool_question($qb$CB-5bf5136d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The triangle inequality theorem states that the sum of any two sides of a triangle must be greater than the length of the third side. If a triangle
has side lengths of 6 and 12, which inequality represents the possible lengths, x, of the third side of the triangle?$qb$, null, $qb$[{"label": "A", "body": "x < 18"}, {"label": "B", "body": "x > 18"}, {"label": "C", "body": "6 < x < 18"}, {"label": "D", "body": "x < 6 or x > 18"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that a triangle has side lengths of 6 and 12, and x represents the length of the third side of the triangle. It’s also
given that the triangle inequality theorem states that the sum of any two sides of a triangle must be greater than the length of the third side.
Therefore, the inequalities 6 + x > 126 + 12 > x, , and 12 + x > 6 represent all possible values of x. Subtracting 6 from both sides of the
inequality 6 + x > 12 yields x > 12 - 6, or x > 6. Adding 6 and 12 in the inequality 6 + 12 > x yields 18 > x, or x < 18. Subtracting 12
from both sides of the inequality 12 + x > 6 yields x > 6 - 12, or x > -6. Since all x-values that satisfy the inequality x > 6 also satisfy the
inequality x > -6, it follows that the inequalities x > 6 and x < 18 represent the possible values of x. Therefore, the inequality 6 < x < 18
represents the possible lengths, x, of the third side of the triangle.
Choice A is incorrect. This inequality gives the upper bound for x but does not include its lower bound.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-79be5180$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 9x + 12
x + 7y = 20
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. It’s given that y = 9x + 12. Substituting 9x + 12 for y in the second equation in the system, x + 7y = 20, yields x
+ 7(9x + 12) = 20, which gives x + 63x + 84 = 20, or 64x + 84 = 20. Subtracting 84 from each side of this equation yields 64x = -64.
Dividing each side of this equation by 64 yields x = - 1. Substituting -1 for x in the first equation in the system, y = 9x + 12, yields y
= 9(-1) + 12, or y = 3. Therefore, the value of y is 3.$qb$);
select seed_pool_question($qb$CB-620abf36$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 5(x + 4) = 4(x + 4) + 29, what is the value of x + 4?$qb$, null, $qb$[{"label": "A", "body": "-4"}, {"label": "B", "body": "25"}, {"label": "C", "body": "29"}, {"label": "D", "body": "33"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Subtracting 4(x + 4) from both sides of the given equation yields 1(x + 4) = 29, or x + 4 = 29. Therefore, the value of
x + 4 is 29.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of x, not x + 4.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d62ad380$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An artist paints and sells square tiles. The selling price P, in dollars, of a painted tile is a linear function of the side length of the tile s, in inches, as
shown in the table below.
Side length, s (inches) Price, P (dollars)
3 8.00
||| ||| ???
6 18.00
9 28.00
Which of the following could define the relationship between s and P ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d62ad380.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The relationship between s and P can be modeled by a linear equation of the form P = ks + a, where k and a are constants.
The table shows that P increases by 10 when s increases by 3, so k = . To solve for a, substitute one of the given pairs of values for s and P:
when s = 3, P = 8, so , which yields a = –2. The solution is therefore .
Choice A is incorrect. When s = 3, P = 8, but 3(3) + 10 = 19 ≠︀ 8. Choice B is incorrect. This may result from using the first number given for P in
the table as the constant term a in the linear equation P = ks + a, which is true only when s = 0. Choice D is incorrect and may result from using
the reciprocal of the slope of the line.$qb$);
select seed_pool_question($qb$CB-2f34cd1c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f(x) = 55·20 - 0·16x gives the estimated surface water temperature f(x) , in degrees Celsius, of a body of water on the xth day
of the year, where 220 ≤ x ≤ 360. Based on the model, what is the estimated surface water temperature, in degrees Celsius, of this body of
water on the 326th day of the year?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2f34cd1c.png$qb$, $qb$[{"label": "A", "body": "55·20"}, {"label": "B", "body": "3·04"}, {"label": "C", "body": "-0·16"}, {"label": "D", "body": "-52·16"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the function f(x) = 55·20 - 0·16x gives the estimated surface water temperature, in degrees Celsius, of a
body of water on the xth day of the year. Substituting 326 for x in the given function yields f(326) = 55·20 - 0·16(326), which is equivalent
to f(326) = 55·20 - 52·16, or f(326) = 3·04. Therefore, the estimated surface water temperature, in degrees Celsius, of this body of water
on the 326th day of the year is 3·04.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the rate of change, in degrees Celsius per day, of the estimated surface water temperature.
Choice D is incorrect. This is the change, in degrees Celsius, in the estimated surface water temperature over 326 days.$qb$);
select seed_pool_question($qb$CB-ed18c4f7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Cathy has n CDs. Gerry has 3 more than twice the number of CDs that Cathy has. In terms of n, how many CDs does Gerry have?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ed18c4f7.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The term 2n represents twice the number of CDs that Cathy has, and adding 3 represents 3 more than that amount.
Choices A and B are incorrect. The expression 3n represents three times the number of CDs that Cathy has. Choice C is incorrect. Subtracting 3
represents 3 fewer than twice the number of CDs that Cathy has.$qb$);
select seed_pool_question($qb$CB-52a8ef85$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The equation 40x + 20y = 160 represents the number of sweaters, x, and number of shirts, y, that Yesenia purchased for $160. If Yesenia
purchased 2 sweaters, how many shirts did she purchase?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "4"}, {"label": "C", "body": "8"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the equation 40x + 20y = 160 represents the number of sweaters, x, and the number of shirts, y, that
Yesenia purchased for $160. If Yesenia purchased 2 sweaters, the number of shirts she purchased can be calculated by substituting 2 for x in
the given equation, which yields 40(2) + 20y = 160, or 80 + 20y = 160. Subtracting 80 from both sides of this equation yields 20y = 80.
Dividing both sides of this equation by 20 yields y = 4. Therefore, if Yesenia purchased 2 sweaters, she purchased 4 shirts.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the number of shirts Yesenia purchased if she purchased 0 sweaters.
Choice D is incorrect. This is the price, in dollars, for each sweater, not the number of shirts Yesenia purchased.$qb$);
select seed_pool_question($qb$CB-3462d850$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Marisol drove 3 hours from City A to City B. The equation below estimates the distance d, in miles, Marisol traveled after driving for t hours.
Which of the following does 45 represent in the equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3462d850.png$qb$, $qb$[{"label": "A", "body": "Marisol took 45 trips from City A to City B."}, {"label": "B", "body": "The distance between City A and City B is 45 miles."}, {"label": "C", "body": "Marisol drove at an average speed of about 45 miles per hour."}, {"label": "D", "body": "It took Marisol 45 hours to drive from City A to City B."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that d is the distance, in miles, Marisol traveled after driving for t hours. Therefore, 45 represents the distance in
miles traveled per hour, which is the speed she drove in miles per hour.
Choice A is incorrect and may result from misidentifying speed as the number of trips. Choice B is incorrect and may result from misidentifying
speed as the total distance. Choice D is incorrect and may result from misidentifying the speed as the time, in hours.$qb$);
select seed_pool_question($qb$CB-0d685865$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If x = 7, what is the value of x + 20?$qb$, null, $qb$[{"label": "A", "body": "13"}, {"label": "B", "body": "20"}, {"label": "C", "body": "27"}, {"label": "D", "body": "34"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that x = 7. Substituting 7 for x into the given expression x + 20 yields 7 + 20, which is equivalent to 27.
Choice A is incorrect. This is the value of x + 6.
Choice B is incorrect. This is the value of x + 13.
Choice D is incorrect. This is the value of x + 27.$qb$);
select seed_pool_question($qb$CB-fe6f9678$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For the linear function f, f(0) = 17 and f(1) = 17. Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 1/17"}, {"label": "B", "body": "f(x) = 1"}, {"label": "C", "body": "f(x) = 17"}, {"label": "D", "body": "f(x) = 34"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. An equation defining the linear function f can be written in the form f(x) = mx + b, where m is the slope and (0, b) is the
y-intercept of the graph of y= f(x) in the xy-plane. The slope of the graph of y= f(x) can be found using the formula m = (y2-y1)/(x2 -x1) , where
and  are any two points that the graph passes through. If f(0) = 17, it follows that the graph of  passes through the
(0y,=17f) (^(x))
point (^(x1,)(yx(^(1)02),, y172)) (^(x2)f^(,)(y1^(2)))= 17. If , it follows that the graph of y= f(x) passes through the point (1, 17) . Substituting  and (1, 17) for
y(=x1f, y(x1))
and , respectively, in the formula m = (y2-y1)/(x2 -x1) yields m = (17-17)/(1-0) , which is equivalent to m = 0/1 , or m = 0. Since the graph of
passes through (0, 17) , it follows that b = 17. Substituting 0 for m and 17 for b in the equation f(x) = mx + b yields f(x) = 0x + 17, or
f(x) = 17. Thus, the equation that defines f is f(x) = 17.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2493c767$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$s (x) = 133 - 4x
The function s shown gives the number of spoons, s (x) , remaining in a dispenser x minutes after the dispenser had been loaded with spoons.
Which statement is the best interpretation of s (3) = 121?$qb$, null, $qb$[{"label": "A", "body": "The number of spoons remaining in the dispenser decreased by a total of 3 spoons after 121 minutes."}, {"label": "B", "body": "There were 3 spoons remaining in the dispenser 121 minutes after the dispenser had been loaded with spoons."}, {"label": "C", "body": "There were 121 spoons remaining in the dispenser 3 minutes after the dispenser had been loaded with spoons."}, {"label": "D", "body": "The number of spoons remaining in the dispenser decreased by a total of 121 spoons after 3 minutes."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that s (x) is the number of spoons remaining in a dispenser x minutes after the dispenser had been loaded with
spoons. The expression s (3) represents the value of s (x) when x = 3. It follows that s (3) represents the number of spoons remaining in the
dispenser 3 minutes after it had been loaded with spoons. Therefore, the best interpretation of the equation s (3) = 121 is that there were 121
spoons remaining in the dispenser 3 minutes after it had been loaded with spoons.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect. This would be the best interpretation of s (121) = 3, not s (3) = 121.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-12255364$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A gym charges its members a onetime $36 enrollment fee and a membership fee of $19 per month. If there are no charges other than the
enrollment fee and the membership fee, after how many months will a member have been charged a total of $188 at the gym?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "5"}, {"label": "C", "body": "8"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that a gym charges its members a onetime $36 enrollment fee and a membership fee of $19 per month. Let x
represent the number of months at the gym after which a member will have been charged a total of $188. If there are no charges other than the
enrollment fee and the membership fee, the equation 36 + 19x = 188 can be used to represent this situation. Subtracting 36 from both sides
of this equation yields 19x = 152. Dividing both sides of this equation by 19 yields x = 8. Therefore, a member will have been charged a total
of $188 after 8 months at the gym.
Choice A is incorrect. A member will have been charged a total of $(36 + 19 ? 4) , or $112, after 4 months at the gym.
Choice B is incorrect. A member will have been charged a total of $(36 + 19 ? 5) , or $131, after 5 months at the gym.
Choice D is incorrect. A member will have been charged a total of $(36 + 19 ? 10), or $226, after 10 months at the gym.$qb$);
select seed_pool_question($qb$CB-b82a943c$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 7x = 28, what is the value of 8x?$qb$, null, $qb$[{"label": "A", "body": "21"}, {"label": "B", "body": "32"}, {"label": "C", "body": "168"}, {"label": "D", "body": "224"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Dividing both sides of the given equation 7x = 28 by 7 yields x = 4. Substituting 4 for x in the expression 8x yields 8(4) ,
which is equivalent to 32.
Choice A is incorrect. This is the value of 21/4 x.
Choice C is incorrect. This is the value of 42x.
Choice D is incorrect. This is the value of 56x.$qb$);
select seed_pool_question($qb$CB-092ad67d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x + 2y = 6
x - 2y = 4
The solution to the given system of equations is (x, y) . What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "2·5"}, {"label": "B", "body": "5"}, {"label": "C", "body": "6"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Adding the first equation to the second equation in the given system yields (x + 2y) + (x - 2y) = 6 + 4, or (x + x)
+ (2y - 2y) = 10. Combining like terms in this equation yields 2x = 10. Dividing both sides of this equation by 2 yields x = 5. Thus, the value
of x is 5.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of 2x, not x.$qb$);
select seed_pool_question($qb$CB-eac739b2$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 4x + 2 = 12, what is the value of 16x + 8?$qb$, null, $qb$[{"label": "A", "body": "40"}, {"label": "B", "body": "48"}, {"label": "C", "body": "56"}, {"label": "D", "body": "60"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Multiplying both sides of the given equation by 4 yields (4)(4x + 2) = (4)(12) , or 16x + 8 = 48. Therefore, the value of
16x + 8 is 48.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3122fc7b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A linear model estimates the population of a city from 1991 to 2015. The model estimates the population was 57 thousand in 1991 , 224
thousand in 2011, and x thousand in 2015. To the nearest whole number, what is the value of x?$qb$, null, null, null, array[$qb$257$qb$]::text[], $qb$The correct answer is 257. It’s given that a linear model estimates the population of a city from 1991 to 2015. Since the population can be
estimated using a linear model, it follows that there is a constant rate of change for the model. It’s also given that the model estimates the
population was 57 thousand in 1991, 224 thousand in 2011, and x thousand in 2015. The change in the population between 2011 and 1991 is
224 - 57, or 167, thousand. The change in the number of years between 2011 and 1991 is 2011 - 1991, or 20, years. Dividing 167 by 20 gives
167?20, or 8·35, thousand per year. Thus, the change in population per year from 1991 to 2015 estimated by the model is 8·35 thousand. The
change in the number of years between 2015 and 2011 is 2015 - 2011, or 4, years. Multiplying the change in population per year by the change
in number of years yields the increase in population from 2011 to 2015 estimated by the model: (8·35) (4), or 33·4, thousand. Adding the
change in population from 2011 to 2015 estimated by the model to the estimated population in 2011 yields the estimated population in 2015.
Thus, the estimated population in 2015 is 33·4 + 224, or 257·4, thousand. Therefore to the nearest whole number, the value of x is 257.$qb$);
select seed_pool_question($qb$CB-d9733ed9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y > 4x + 8
For which of the following tables are all the values of x and their corresponding values of y solutions to the given inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d9733ed9.png$qb$, $qb$[{"label": "A", "body": "x -/2||| |||(-y)/130/(-41 ?)???"}, {"label": "B", "body": "x 2/4||| |||(-y)/86/(-24 ?)???"}, {"label": "C", "body": "x -/2||| |||(-y)/13/18???"}, {"label": "D", "body": "x -/24/(|-6 |)||| |||(-y)/121/(-29 ?)???"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. In each choice, the values of x are 2, 4, and 6. Substituting the first value of x2, , for x in the given inequality yields y > 4(2)
+ 8, or y > 16. Therefore, when x = 2, the corresponding value of y must be greater than 16. Of the given choices, only choice A is a table
where the value of y corresponding to x = 2 is greater than 16. To confirm that the other values of x in this table and their corresponding values
of y are also solutions to the given inequality, the values of x and y in the table can be substituted for x and y in the given inequality. Substituting
4 for x and 30 for y in the given inequality yields 30 > 4(4) + 8, or 30 > 24, which is true. Substituting 6 for x and 41 for y in the given
inequality yields 41 > 4(6) + 8, or 41 > 32, which is true. It follows that for choice A, all the values of x and their corresponding values of y are
solutions to the given inequality.
Choice B is incorrect. Substituting 2 for x and 8 for y in the given inequality yields 8 > 4(2) + 8, or 8 > 16, which is false.
Choice C is incorrect. Substituting 2 for x and 13 for y in the given inequality yields 13 > 4(2) + 8, or 13 > 16, which is false.
Choice D is incorrect. Substituting 2 for x and 13 for y in the given inequality yields 13 > 4(2) + 8, or 13 > 16, which is false.$qb$);
select seed_pool_question($qb$CB-ba79f10f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x
0/1??? |||(-y)/18/13/(-8 |)|||
The table shows three values of x and their corresponding values of y. There is a linear relationship between x and y. Which of the following
equations represents this relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ba79f10f.png$qb$, $qb$[{"label": "A", "body": "y = 18x + 13"}, {"label": "B", "body": "y = 18x + 18"}, {"label": "C", "body": "y = -5x + 13"}, {"label": "D", "body": "y = -5x + 18"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A linear relationship can be represented by an equation of the form y = mx + b, where m and b are constants. It’s given in
the table that when x = 0y = 18, . Substituting 0 for x and 18 for y in y = mx + b yields 18 = m(0) + b, or 18 = b. Substituting 18 for b in
the equation y = mx + b yields y = mx + 18. It’s also given in the table that when x = 1y = 13, . Substituting 1 for x and 13 for y in the
equation y = mx + 18 yields 13 = m(1) + 18, or 13 = m + 18. Subtracting 18 from both sides of this equation yields -5 = m. Therefore,
the equation y = -5x + 18 represents the relationship between x and y.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-36fd6752$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$6 + 7r = pw
7r - 5w = 5w + 11
In the given system of equations, p is a constant. If the system has no solution, what is the value of p?$qb$, null, null, null, array[$qb$10$qb$]::text[], $qb$The correct answer is 10. Solving by substitution, the given system of equations, where p is a constant, can be written so that the left-hand side
of each equation is equal to 7r. Subtracting 6 from each side of the first equation in the given system, 6 + 7r = pw, yields 7r = pw - 6.
Adding 5w to each side of the second equation in the given system, 7r - 5w = 5w + 11 , yields 7r = 10w + 11 . Since the left-hand side of
each equation is equal to 7r, setting the the right-hand side of the equations equal to each other yields pw - 6 = 10w + 11 . A linear equation
in one variable, w, has no solution if and only if the equation is false; that is, when there's no value of w that produces a true statement. For the
equation pw - 6 = 10w + 11, there's no value of w that produces a true statement when pw = 10w. Therefore, for the equation
pw - 6 = 10w + 11, there's no value of w that produces a true statement when the value of p is 10. It follows that in the given system of
equations, the system has no solution when the value of p is 10.$qb$);
select seed_pool_question($qb$CB-2e98b1df$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$On the first day of a semester, a film club has 90 members. Each day after the first day of the semester, 10 new members join the film club. If no
members leave the film club, how many total members will the film club have 4 days after the first day of the semester?$qb$, null, $qb$[{"label": "A", "body": "400"}, {"label": "B", "body": "130"}, {"label": "C", "body": "94"}, {"label": "D", "body": "90"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that the film club has 90 members on the first day of a semester, and 10 new members join the film club each day
after the first day of the semester. This means that after 4 days, 4 ? 10, or 40, new members will have joined the club. Adding 40 members to
the original 90 club members yields 130 members. Thus, the film club will have 130 total members 4 days after the first day of the semester.
Choice A is incorrect. This is the number of members that will have joined the film club 4 days after the first day of the semester if 100 new
members, not 10, join the film club each day.
Choice C is incorrect. This is the number of members the film club will have 4 days after the first day of the semester if 1 new member, not 10,
joins the film club each day.
Choice D is incorrect. This is the number of members the film club has on the first day of the semester.$qb$);
select seed_pool_question($qb$CB-d9d83c02$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For what value of w does ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d9d83c02.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. To solve the equation, use the distributive property to multiply on the right-hand side of the equation which gives w – 10 = 2w
+ 10. Subtract w from both sides of the equation, which gives –10 = w + 10. Finally, subtract 10 from both sides of the equation, which gives –20
= w.
Choices A and B are incorrect and may result from making sign errors. Choice C is incorrect and may result from incompletely distributing the 2
in the expression 2(w + 5).$qb$);
select seed_pool_question($qb$CB-59a49431$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-246844662288/(-/--/--/--/-888 666 444 222÷÷÷÷864244662288 ?22 ??? ?66 8??)|| || || || || || || || | |?|| || || || || || || || | x
The shaded region shown represents solutions to an inequality. Which ordered pair (x, y) is a solution to this inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-59a49431.png$qb$, $qb$[{"label": "A", "body": "(0, -4)"}, {"label": "B", "body": "(0, 4)"}, {"label": "C", "body": "(-4, 0)"}, {"label": "D", "body": "(4, 0)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the shaded region shown represents solutions to an inequality, an ordered pair (x, y) is a solution to the inequality if
it's represented by a point in the shaded region. Of the given choices, only (4, 0) is represented by a point in the shaded region. Therefore, (4, 0)
is a solution to the inequality.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-23dedddd$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the linear function ff(0) = 8,  and f(1) = 12. Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 12x + 8"}, {"label": "B", "body": "f(x) = 4x"}, {"label": "C", "body": "f(x) = 4x + 12"}, {"label": "D", "body": "f(x) = 4x + 8"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since f is a linear function, it can be defined by an equation of the form f(x) = ax + b, where a and b are constants. It's
given that . Substituting 0 for x and 8 for f(x) in the equation f(x) = ax + b yields 8 = a(0) + b, or 8 = b. Substituting 8 for b in
the equation yields f(x) = ax + 8. It's given that f(1) = 12. Substituting 1 for x and 12 for f(x) in the equation f(x) = ax
f1(20f)=(^(x)=)af(8=(1x))^(a)+=^(x) +84xb+ 8
+ 8 yields , or 12 = a + 8. Subtracting 8 from both sides of this equation yields a = 4. Substituting 4 for a in the equation f(x)
= ax + 8 yields . Therefore, an equation that defines f is f(x) = 4x + 8.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c8fb6bcb$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$f(x) = 2x + 244
The given function f represents the perimeter, in centimeterS (cm), of a rectangle with a length of x cm and a fixed width. What is the width,
in cm, of the rectangle?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "122"}, {"label": "C", "body": "244"}, {"label": "D", "body": "488"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that f(x) = 2x + 244 represents the perimeter, in centimeterS (cm), of a rectangle with a length of xcm and a
fixed width. If w represents a fixed width, in cm, then the perimeter, in cm, of a rectangle with a length of xcm and a fixed width of wcm can be
given by the function f(x) = 2x + 2w. Therefore, 2x + 2w = 2x + 244. Subtracting 2x from both sides of this equation yields 2w = 244.
Dividing both sides of this equation by 2 yields w = 122. Therefore, the width, in cm, of the rectangle is 122.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d909cd31$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$-15x + 25y = 65
One of the two equations in a system of linear equations is given. The system has infinitely many solutions. Which of the following could be the
second equation in the system?$qb$, null, $qb$[{"label": "A", "body": "12x + 20y = 52"}, {"label": "B", "body": "12x + 20y = -52"}, {"label": "C", "body": "-12x + 20y = 52"}, {"label": "D", "body": "-12x + 20y = -52"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that the system has infinitely many solutions. A system of two linear equations has infinitely many solutions when
the two linear equations are equivalent. Dividing both sides of the given equation by 5 yields -3x + 5y = 13. Dividing both sides of choice C by
4 also yields -3x + 5y = 13, so choice C is equivalent to the given equation. Thus, choice C could be the second equation in the system.
Choice A is incorrect. The system consisting of this equation and the given equation has one solution, not infinitely many solutions.
Choice B is incorrect. The system consisting of this equation and the given equation has one solution, not infinitely many solutions.
Choice D is incorrect. The system consisting of this equation and the given equation has no solution, not infinitely many solutions.$qb$);
select seed_pool_question($qb$CB-a91a2b75$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = -9x + 9. What is the y-coordinate of the y-intercept of the graph of y= f(x) in the xy-plane?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a91a2b75.png$qb$, null, null, array[$qb$9$qb$]::text[], $qb$The correct answer is 9. The y-intercept of the graph of y = f(x) in the xy-plane is the point where the graph of crosses the y-axis,
y =f(fx()x)
which occurs at x = 0. It’s given that the function f is defined by f(x) = -9x + 9. Substituting 0 for x and y for  in this equation yields y
= -9(0) + 9, or y = 9. It follows that y = 9 when x = 0 and that the y-intercept of the graph of y= f(x) in the xy-plane is (0, 9). Therefore,
the y-coordinate of the y-intercept of the graph of y = f(x) in the xy-plane is 9.$qb$);
select seed_pool_question($qb$CB-98d3393a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Line  in the xy-plane is perpendicular to the line with equation . What is the slope of line ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-98d3393a.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": "The slope of line  is undefined."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It is given that line  is perpendicular to a line whose equation is x = 2. A line whose equation is a constant value of x is
vertical, so  must therefore be horizontal. Horizontal lines have a slope of 0, so  has a slope of 0.
Choice B is incorrect. A line with slope  is perpendicular to a line with slope 2. However, the line with equation x = 2 is vertical and has
undefined slope (not slope of 2). Choice C is incorrect. A line with slope –2 is perpendicular to a line with slope . However, the line with
equation x = 2 has undefined slope (not slope of ). Choice D is incorrect; this is the slope of the line x = 2 itself, not the slope of a line
perpendicular to it.$qb$);
select seed_pool_question($qb$CB-f88970cc$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x = 5
y = x - 8
Which of the following points (x, y) is the solution to the given system of equations in the xy-plane?$qb$, null, $qb$[{"label": "A", "body": "(0, 0)"}, {"label": "B", "body": "(5, -3)"}, {"label": "C", "body": "(5, -8)"}, {"label": "D", "body": "(5, 8)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A solution to a system of equations in the xy-plane is a point (x, y) that lies on the graph of each equation in the system. The
first equation given is x = 5. Substituting 5 for x in the second given equation yields y = 5 - 8, or y = -3. It follows that in the xy-plane, the
point lies on the graph of each equation in the system. Therefore, the solution to the given system of equations in the xy-plane is
(5, -3(5), -3)
.
Choice A is incorrect. The point (0, 0) doesn't lie on the graph of either equation in the given system.
Choice C is incorrect. The point (5, -8) doesn't lie on the graph of the second equation in the given system.
Choice D is incorrect. The point (5, 8) doesn't lie on the graph of the second equation in the given system.$qb$);
select seed_pool_question($qb$CB-340afb12$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Ellen bought two types of snack bags for a school event. Each box of chips Ellen bought contained 24 bags and cost $11. Each box of crackers
Ellen bought contained 16 bags and cost $9. It cost Ellen $497 before tax to buy 968 bags. If x is the number of boxes of chips and y is the
number of boxes of crackers that Ellen bought, which of the following systems of equations represents this situation?$qb$, null, $qb$[{"label": "A", "body": "11x + 16y = 968 24x + 9y = 497"}, {"label": "B", "body": "11x + 9y = 968 24x + 16y = 497"}, {"label": "C", "body": "11x + 9y = 497 24x + 16y = 968"}, {"label": "D", "body": "9x + 11y = 497 16x + 24y = 968"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that Ellen bought two types of snack bags: chips and crackers. It’s also given that each box of chips contains 24
bags. Thus, if Ellen bought x boxes of chips, the number of bags of chips is 24x. Additionally, it’s given that each box of chips costs $11. Thus, if
Ellen bought x boxes of chips, the cost for all the bags of chips is 11x. It’s also given that each box of crackers contains 16 bags. Thus, if Ellen
bought y boxes of crackers, the number of bags of crackers is 16y. Additionally, it’s given that each box of crackers costs $9. Thus, if Ellen
bought y boxes of crackers, the cost for all the bags of crackers is 9y. It’s given that it cost Ellen $497 to buy 968 bags. Since Ellen bought 24x
bags of chips and 16y bags of crackers, the total number of snack bags that Ellen bought can be represented by the equation 24x + 16y
= 968. Additionally, since the cost for all the bags of chips is 11x and the cost for all the bags of crackers is 9y, the total cost for all the snack
bags that Ellen bought can be represented by the equation 11x + 9y = 497. Therefore, the system consisting of the equations 11x + 9y
= 497 and 24x + 16y = 968 represents this situation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This system of equations represents a situation where the total cost is $968, not $497, and the total number of bags is
497, not 968.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-56dc8045$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$w(t) = 300 - 4t
The function w models the volume of liquid, in milliliters, in a container t seconds after it begins draining from a hole at the bottom. According to
the model, what is the predicted volume, in milliliters, draining from the container each second?$qb$, null, $qb$[{"label": "A", "body": "300"}, {"label": "B", "body": "296"}, {"label": "C", "body": "75"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the function w models the volume of liquid, in milliliters, in a container t seconds after it begins draining from a
hole at the bottom. The given function w(t) = 300 - 4t can be rewritten as w(t) = -4t + 300. Thus, for each increase of t by 1, the value of
w(t) decreases by 4(1), or 4. Therefore, the predicted volume, in milliliters, draining from the container each second is 4 milliliters.
Choice A is incorrect. This is the amount of liquid, in milliliters, in the container before the liquid begins draining.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-92aa3a94$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Line k is defined by y = 7x + 1/8 . Line j is perpendicular to line k in the xy-plane. What is the slope of line j?$qb$, null, $qb$[{"label": "A", "body": "-8"}, {"label": "B", "body": "- 1/7"}, {"label": "C", "body": "1/8"}, {"label": "D", "body": "7"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that line k is defined by y = 7x + 1/8 . For an equation in slope-intercept form y = mx + b m,  represents the slope
of the line defined by this equation in the xy-plane and b represents the y-coordinate of the y-intercept of this line. Therefore, the slope of line k is
7. It’s also given that line j is perpendicular to line k in the xy-plane. Therefore, the slope of line j is the opposite reciprocal of the slope of line k.
The opposite reciprocal of 7 is - 1/7 . Therefore, the slope of line j is - 1/7 .
Choice A is incorrect. This is the opposite reciprocal of the y-coordinate of the y-intercept, not the slope, of line k.
Choice C is incorrect. This is the y-coordinate of the y-intercept of line k, not the slope of line j.
Choice D is incorrect. This is the slope of a line that is parallel, not perpendicular, to line k.$qb$);
select seed_pool_question($qb$CB-da2e9202$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$16x + 30 = 190
Which equation has the same solution as the given equation?$qb$, null, $qb$[{"label": "A", "body": "16x = 30"}, {"label": "B", "body": "16x = 130"}, {"label": "C", "body": "16x = 160"}, {"label": "D", "body": "16x = 190"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that 16x + 30 = 190. Subtracting 30 from each side of this equation yields 16x = 160. Therefore, the equation
16x = 160 is equivalent to the given equation and has the same solution.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3c4ce699$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 6 + x = 9, what is the value of 18 + 3x?$qb$, null, null, null, array[$qb$27$qb$]::text[], $qb$The correct answer is 27. Multiplying both sides of the given equation by 3 yields 3 (6 + x) = 3 (9) , or 18 + 3x = 27. Therefore, the value of
18 + 3x is 27.$qb$);
select seed_pool_question($qb$CB-f2bbd43d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y > 14
4x + y < 18
The point (x, 53) is a solution to the system of inequalities in the xy-plane. Which of the following could be the value of x?$qb$, null, $qb$[{"label": "A", "body": "-9"}, {"label": "B", "body": "-5"}, {"label": "C", "body": "5"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the point (x, 53) is a solution to the given system of inequalities in the xy-plane. This means that the
coordinates of the point, when substituted for the variables x and y, make both of the inequalities in the system true. Substituting 53 for y in the
inequality y > 14 yields 53 > 14, which is true. Substituting 53 for y in the inequality 4x + y < 18 yields 4x + 53 < 18. Subtracting 53 from
both sides of this inequality yields 4x < -35. Dividing both sides of this inequality by 4 yields x < -8·75. Therefore, x must be a value less
than -8·75. Of the given choices, only -9 is less than -8·75.
Choice B is incorrect. Substituting -5 for x and 53 for y in the inequality 4x + y < 18 yields 4(-5) + 53 < 18, or 33 < 18, which is not true.
Choice C is incorrect. Substituting 5 for x and 53 for y in the inequality 4x + y < 18 yields 4(5) + 53 < 18, or 73 < 18, which is not true.
Choice D is incorrect. Substituting 9 for x and 53 for y in the inequality 4x + y < 18 yields 4(9) + 53 < 18, or 89 < 18, which is not true.$qb$);
select seed_pool_question($qb$CB-9fc31513$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The perimeter of an isosceles triangle is 36 feet. Each of the two congruent sides of the triangle has a length of 10 feet. What is the length, in
feet, of the third side?$qb$, null, $qb$[{"label": "A", "body": "10"}, {"label": "B", "body": "12"}, {"label": "C", "body": "16"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the perimeter of an isosceles triangle is 36 feet and that each of the two congruent sides has a length of 10
feet. The perimeter of a triangle is the sum of the lengths of its three sides. The equation 10 + 10 + x = 36 can be used to represent this
situation, where x is the length, in feet, of the third side. Combining like terms on the left-hand side of this equation yields 20 + x = 36.
Subtracting 20 from each side of this equation yields x = 16. Therefore, the length, in feet, of the third side is 16.
Choice A is incorrect. This would be the length, in feet, of the third side if the perimeter was 30 feet, not 36 feet.
Choice B is incorrect. This would be the length, in feet, of the third side if the perimeter was 32 feet, not 36 feet.
Choice D is incorrect. This would be the length, in feet, of the third side if the perimeter was 38 feet, not 36 feet.$qb$);
select seed_pool_question($qb$CB-ffb371f5$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$3x = 12
-3x + y = -6
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, $qb$[{"label": "A", "body": "-3"}, {"label": "B", "body": "6"}, {"label": "C", "body": "18"}, {"label": "D", "body": "30"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Adding the second equation in the given system to the first equation in the given system yields 3x + (-3x + y) = 12
+ (-6) , which is equivalent to y = 6.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0b0fa68b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For the function ff(cx) = x - 8,  for all values of x, where c is a positive constant. If f(2) = 35, what is the value of c?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0b0fa68b.png$qb$, null, null, array[$qb$.0465$qb$, $qb$2/43$qb$]::text[], $qb$The correct answer is . It's given that f(cx) = x - 8 for all values of x, where c is a positive constant, and f(2) = 35. Therefore, for the
f cx =2/423
given function , . Dividing both sides of this equation by c yields x = 2/c . Substituting  for x in the equation f(cx) = x - 8 yields
f(2) 2/c
f( 2c/c ) = 2/c - 8, or . Since it’s given that f(2) = 35, substituting 35 for  yields 35 = 2/c - 8. Adding 8 to both sides of this
43 =f(2()/c2) = 2/c - 8
equation yields . Multiplying both sides of this equation by c yields 43c = 2. Dividing both sides of this equation by 43 yields c = 2/43 .
Note that 2/43, .0465, 0.046, and 0.047 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-6989c80a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$F(x) = 9/5 (x - 273·15) + 32
The function F gives the temperature, in degrees Fahrenheit, that corresponds to a temperature of x kelvins. If a temperature increased by 2·10
kelvins, by how much did the temperature increase, in degrees Fahrenheit?$qb$, null, $qb$[{"label": "A", "body": "3·78"}, {"label": "B", "body": "35·78"}, {"label": "C", "body": "487·89"}, {"label": "D", "body": "519·89"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the function F(x) = 9/5 (x - 273·15) + 32 gives the temperature, in degrees Fahrenheit, that corresponds to
a temperature of x kelvins. A temperature that increased by 2·10 kelvins means that the value of x increased by 2·10 kelvins. It follows that an
increase in x by 2·10 increases F(x) by 9/5 (2·10) , or 3·78. Therefore, if a temperature increased by 2·10 kelvins, the temperature increased by
3·78 degrees Fahrenheit.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-bc638f2d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f defined by f(t) = 14t + 9 gives the estimated length, in inches, of a vine plant t months after Tavon purchased it. Which of the
following is the best interpretation of 9 in this context?$qb$, null, $qb$[{"label": "A", "body": "Tavon will keep the vine plant for 9 months."}, {"label": "B", "body": "The vine plant is expected to grow 9 inches each month."}, {"label": "C", "body": "The vine plant is expected to grow to a maximum length of 9 inches."}, {"label": "D", "body": "The estimated length of the vine plant was 9 inches when Tavon purchased it."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the function f defined by f(t) = 14t + 9 gives the estimated length, in inches, of a vine plant t months after
Tavon purchased it. For a function defined by an equation of the form f(t) = mt + b, where m and b are constants, b represents the value of
f(0) , or the value of f(t) when the value of t is 0. Therefore, for the function defined by f(t) = 14t + 9, 9 represents the value of f(t) when
the value of t is 0. This means that 0 months after the vine plant was purchased, the estimated length of the vine plant was 9 inches. Therefore,
the best interpretation of 9 in this context is the estimated length of the vine plant was 9 inches when Tavon purchased it.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. The vine plant is expected to grow 14 inches, not 9 inches, each month.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9d9fe1e6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In science class, Diego conducted an experiment to learn about evaporation. Diego measured the height of fluid in a beaker over a period of time.
The function f(x) = 39 - 0·18x gives the estimated height, in centimeterS (cm) , of the fluid in the beaker x days after the start of the
experiment. Which of the following is the best interpretation of 39 in this context?$qb$, null, $qb$[{"label": "A", "body": "The estimated height, in cm, of the fluid at the start of the experiment"}, {"label": "B", "body": "The estimated height, in cm, of the fluid at the end of the experiment"}, {"label": "C", "body": "The estimated change in the height, in cm, of the fluid each day"}, {"label": "D", "body": "The estimated number of days for all the fluid to evaporate"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the function f(x) = 39 - 0·18x gives the estimated height, in centimeters (cm), of the fluid in the beaker x
days after the start of the experiment. For a function defined by an equation of the form f(x) = b + mx, where m and b are constants, b
represents the value of f(x) when x = 0. It follows that in the given function, 39 represents the value of f(x) when x = 0. Since x = 0
represents the start of the experiment, then the best interpretation of 39 in this context is that the estimated height, in cm, of the fluid was 39 at
the start of the experiment.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect. The estimated change in the height, in cm, of the fluid each day is 0·18, not 39.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-c4d49134$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$s = 40 + 3t
The equation gives the speed s, in miles per hour, of a certain car t seconds after it began to accelerate. What is the speed, in miles per hour, of
the car 5 seconds after it began to accelerate?$qb$, null, $qb$[{"label": "A", "body": "40"}, {"label": "B", "body": "43"}, {"label": "C", "body": "45"}, {"label": "D", "body": "55"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. In the given equation, s is the speed, in miles per hour, of a certain car t seconds after it began to accelerate. Therefore, the
speed of the car, in miles per hour, 5 seconds after it began to accelerate can be found by substituting 5 for t in the given equation, which yields s
= 40 + 3(5) , or s = 55. Thus, the speed of the car 5 seconds after it began to accelerate is 55 miles per hour.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0cb57740$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Each side of a 30-sided polygon has one of three lengths. The number of sides with length 8 centimeterS (cm) is 5 times the number of sides
n with length 3 cm. There are 6 sides with length 4 cm. Which equation must be true for the value of n?$qb$, null, $qb$[{"label": "A", "body": "5n + 6 = 30"}, {"label": "B", "body": "6n + 6 = 30"}, {"label": "C", "body": "8n + 3n + 4n = 30"}, {"label": "D", "body": "8(5n) + 3n + 4(6) = 30"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that each side of a 30-sided polygon has one of three lengths. It's also given that the number of sides with length 8
ceutimeterS (cm) is 5 times the number of sides n with length 3 cm. Therefore, there are 5 ? n, or 5n, sides with length 8 cm. It’s also given
that there are 6 sides with length 4 cm. Therefore, the number of 3 cm 4 cm, , and 8 cm sides are n6, , and 5n, respectively. Since there are a
total of 30 sides, the equation n + 6 + 5n = 30 represents this situation. Combining like terms on the left-hand side of this equation yields 6n
+ 6 = 30. Therefore, the equation that must be true for the value of n is 6n + 6 = 30.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ece00725$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Connor has c dollars and Maria has m dollars. Connor has 4 times as many dollars as Maria, and together they have a total of $25·00. Which
system of equations represents this situation?$qb$, null, $qb$[{"label": "A", "body": "c = 4m c + m = 25"}, {"label": "B", "body": "m = 4c c + m = 25"}, {"label": "C", "body": "c = 25m c + m = 4"}, {"label": "D", "body": "m = 25c c + m = 4"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that Connor has c dollars, Maria has m dollars, and Connor has 4 times as many dollars as Maria. This can be
represented by the equation c = 4m. It’s also given that together, Connor and Maria have a total of $25·00, which can be represented by the
equation c+ m = 25. Therefore, the system consisting of the equations c = 4m and c + m = 25 represents this situation.
Choice B is incorrect. The equation m = 4c represents a situation where Maria has 4 times as many dollars as Connor, rather than the situation
where Connor has 4 times as many dollars as Maria.
Choice C is incorrect. The equation c = 25m represents a situation where Connor has 25 times, rather than 4 times, as many dollars as Maria.
The equation c + m = 4 represents a situation where Connor and Maria together have a total of $4·00, rather than $25·00.
Choice D is incorrect. The equation m = 25c represents a situation where Maria has 25 times as many dollars as Connor, rather than the
situation where Connor has 4 times as many dollars as Maria. The equation c + m = 4 represents a situation where Connor and Maria together
have a total of $4·00, rather than $25·00.$qb$);
select seed_pool_question($qb$CB-255996a6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the equation above, T represents Brittany’s total take-home pay, in dollars, for her first week of work, where h represents the number of hours
she worked that week and 1,000 represents a sign-on bonus. If Brittany’s total take-home pay was $1,576, for how many hours was Brittany paid
for her first week of work?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-255996a6.png$qb$, $qb$[{"label": "A", "body": "16"}, {"label": "B", "body": "32"}, {"label": "C", "body": "55"}, {"label": "D", "body": "88"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since Brittany’s total take-home pay was $1,576, the value 1,576 can be substituted for T in the given equation
to give . Subtracting 1,000 from both sides of this equation gives . Dividing both
sides of this equation by 18 gives . Therefore, Brittany was paid for 32 hours for her first week of work.
Choice A is incorrect. This is half the number of hours Brittany was paid for. Choice C is incorrect and may result from dividing 1,000 by 18.
Choice D is incorrect and may result from dividing 1,576 by 18.$qb$);
select seed_pool_question($qb$CB-a1696f3e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function is defined as , where a is a constant. If , what is the value of a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a1696f3e.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Substituting 4 for x in g(x) = 5x + a gives g(4) = 5(4) + a. Since g(4) = 31, the equation g(4) = 5(4) + a simplifies to 31 = 20 + a.
It follows that a = 11.
Choices A, B, and D are incorrect and may result from arithmetic errors.$qb$);
select seed_pool_question($qb$CB-c01f4a95$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$j(x) = mx + 144
For the linear function j, m is a constant and j(12) = 18. What is the value of j(10) ?$qb$, null, null, null, array[$qb$39$qb$]::text[], $qb$The correct answer is 39. It’s given that for the linear function jm,  is a constant and j(12) = 18. Substituting 12 for x and 18 for j(x) in the
given equation yields 18 = m(12) + 144. Subtracting 144 from both sides of this equation yields . Dividing both sides of this
equation by 12 yields -10·5 = m. Substituting -10·5 for m in the given equation, j(x) = mx + 144-126 =^(m)j((1x2j))(=10)-10·5x + 144, yields .
Substituting 10 for x in this equation yields j(10) = (-10·5)(10) + 144, or j(10) = 39. Therefore, the value of  is 39.$qb$);
select seed_pool_question($qb$CB-dfa45424$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Tony spends $80 per month on public transportation. A 10-ride pass costs $12.50, and a single-ride pass costs $1.50. If g represents the number
of 10-ride passes Tony buys in a month and t represents the number of single-ride passes Tony buys in a month, which of the following
equations best represents the relationship between g and t ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dfa45424.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since a 10-ride pass costs $12.50 and g is the number of 10-ride passes Tony buys in a month, the expression
represents the amount Tony spends on 10-ride passes in a month. Since a single-ride pass costs $1.50 and t is the number of single-ride passes
Tony buys in a month, the expression  represents the amount Tony spends on single-ride passes in a month. Therefore, the sum
represents the amount he spends on the two types of passes in a month. Since Tony spends a total of $80 on passes in a
month, this expression can be set equal to 80, producing .
Choices A and B are incorrect. The expression  represents the total number of the two types of passes Tony buys in a month, not the
amount Tony spends, which is equal to 80, nor the cost of one of each pass, which is equal to . Choice C is incorrect and may
result from reversing the cost for each type of pass Tony buys in a month.$qb$);
select seed_pool_question($qb$CB-2e8cc1c0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 4x = 3, what is the value of 24x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2e8cc1c0.png$qb$, $qb$[{"label": "A", "body": "9/2"}, {"label": "B", "body": "6"}, {"label": "C", "body": "18"}, {"label": "D", "body": "72"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that 4x = 3. Multiplying each side of this equation by 6 yields 24x = 18. Therefore, the value of 24x is 18.
Choice A is incorrect. This is the value of 6x, not 24x.
Choice B is incorrect. This is the value of 8x, not 24x.
Choice D is incorrect. This is the value of 96x, not 24x.$qb$);
select seed_pool_question($qb$CB-431c3038$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In an article about exercise, it is estimated that a 160-pound adult uses 200 calories for every 30 minutes of hiking and 150 calories for every
30 minutes of bicycling. An adult who weighs 160 pounds has completed 1 hour of bicycling. Based on the article, how many hours should the
adult hike to use a total of 1,900 calories from bicycling and hiking?$qb$, null, $qb$[{"label": "A", "body": "9.5"}, {"label": "B", "body": "8.75"}, {"label": "C", "body": "6"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since a 160-pound adult uses 200 calories for every 30 minutes of hiking, then the same adult uses  calories after
hiking for h 30-minute periods. Similarly, the same adult uses  calories after bicycling for b 30-minute periods. Therefore, the equation
represents the situation where a 160-pound adult uses a total of 1,900 calories from hiking for h 30-minute periods
and bicycling for b 30-minute periods. It’s given that the adult completes 1 hour, or 2 30-minute periods, of bicycling. Substituting 2 for b in the
equation  yields , or . Subtracting 300 from both sides of this
equation yields . Dividing both sides by 200 yields . Since h represents the number of 30-minute periods spent hiking and
there are 2 30-minute periods in every hour, it follows that the adult will need to hike for , or 4 hours to use a total of 1,900 calories from
bicycling and hiking.
Choice A is incorrect and may result from solving the equation . This represents 0 30-minute periods bicycling instead of 2.
Choice B is incorrect and may result from solving the equation . This represents 1 30-minute period of bicycling instead
of 2. Choice C is incorrect. This may result from determining that the number of 30-minute periods the adult should hike is 8, but then subtracting
2 from 8, rather than dividing 8 by 2, to find the number of hours the adult should hike.-$qb$);
select seed_pool_question($qb$CB-bd45df49$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 3x + 9
3y = 8x - 6
The solution to the given system of equations is (x, y) . What is the value of x - y?$qb$, null, $qb$[{"label": "A", "body": "-123"}, {"label": "B", "body": "-33"}, {"label": "C", "body": "3"}, {"label": "D", "body": "57"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The first equation in the given system of equations defines y as 3x + 9. Substituting 3x + 9 for y in the second equation in
the given system of equations yields 3(3x + 9) = 8x - 6. Applying the distributive property on the left-hand side of this equation yields 9x
+ 27 = 8x - 6. Subtracting 8x from both sides of this equation yields x + 27 = -6. Subtracting 27 from both sides of this equation yields x
= -33. Substituting -33 for x in the first equation of the given system of equations yields y = 3(-33) + 9, or y = -90. Substituting -33 for
x and -90 for y into the expression x - y yields -33 - (-90), or 57.
Choice A is incorrect. This is the value of x + y, not x - y.
Choice B is incorrect. This is the value of x, not x - y.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4b0c156b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the linear function hh(28) = 15, and h(26) = 22. Which equation defines h?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4b0c156b.png$qb$, $qb$[{"label": "A", "body": "h(x) = -2/7x + 23"}, {"label": "B", "body": "h(x) = -2/7x + 113"}, {"label": "C", "body": "h(x) = -7/2x + 23"}, {"label": "D", "body": "h(x) = -7/2x + 113"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. An equation defining h can be written in the form y = mx + b, where y = h(x) , m represents the slope of the graph of y
= h(x) in the xy-plane, and b represents the y-coordinate of the y-intercept of the graph. It’s given that h(28) = 15 and h(26) = 22. It follows
that the points (28, 15) and are on the graph of  in the xy-plane. The slope can be found by using any two points, (x1 , y1 )
(2m6, =22 ()y2-y1)/(x2 -x1) (y28=, 1h5()^(x))
and , and the formula . Substituting and (26, 22) for (x1 , y1 ) and (x2 , y2 ) , respectively, in the slope formula
yields , or m = - 7/2 . Substituting - 7/2 for m and (28, 15) for (x, y) in the equation y = mx + b yields 15 = (-7/2) (28) + b, or
15 =(x-ym29,=y=82-+)(22-15)/(267b/2-x28+) 1 13
. Adding 98 to both sides of this equation yields 113 = b. Substituting  for m and 113 for b in the equation y = mx + b
-h7/((2x) ) = -7/2x + 113
yields . Since y = h(x), it follows that the equation that defines h is .
Choice A is incorrect. For this function, h(26) = 109/7 , not h(26) = 22.
Choice B is incorrect. For this function, h(28) = 105, not h(28) = 15, and h(26) = 739/7 , not h(26) = 22.
Choice C is incorrect. For this function, h(28) = -75, not h(28) = 15, and h(26) = -68, not h(26) = 22.$qb$);
select seed_pool_question($qb$CB-868fc236$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table above gives the typical amounts of energy per gram, expressed in both food calories and kilojoules, of the three macronutrients in
food. If x food calories is equivalent to k kilojoules, of the following, which best represents the relationship between x and k ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-868fc236.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The relationship between x food calories and k kilojoules can be modeled as a proportional relationship. Let  and
represent the values in the first two rows in the table:  and . The rate of change, or , is
; therefore, the equation that best represents the relationship between x and k is .
Choice A is incorrect and may be the result of calculating the rate of change using . Choice C is incorrect because the number of
kilojoules is greater than the number of food calories. Choice D is incorrect and may be the result of an error when setting up the equation.$qb$);
select seed_pool_question($qb$CB-e0177f5f$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$x = 4
y = 5 - x
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, $qb$[{"label": "A", "body": "1"}, {"label": "B", "body": "4"}, {"label": "C", "body": "5"}, {"label": "D", "body": "9"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The first equation in the given system of equations is x = 4. Substituting 4 for x in the second equation in the given system
of equations yields y = 5 - 4, or y = 1.
Choice B is incorrect. This is the value of x in the solution to the given system of equations, not the value of y.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-79784c23$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$y = 6x + 3
One of the two equations in a system of linear equations is given. The system has infinitely many solutions. Which equation could be the second
equation in this system?$qb$, null, $qb$[{"label": "A", "body": "y = 2(6x) + 3"}, {"label": "B", "body": "y = 2(6x + 3)"}, {"label": "C", "body": "2(y) = 2(6x) + 3"}, {"label": "D", "body": "2(y) = 2(6x + 3)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the system has infinitely many solutions. A system of two linear equations has infinitely many solutions when
the two linear equations are equivalent. When one equation is a multiple of another equation, the two equations are equivalent. Multiplying each
side of the given equation by 2 yields 2(y) = 2(6x + 3). Thus, 2(y) = 2(6x + 3) is equivalent to the given equation and could be the second
equation in the system.
Choice A is incorrect. The system consisting of this equation and the given equation has one solution rather than infinitely many solutions.
Choice B is incorrect. The system consisting of this equation and the given equation has one solution rather than infinitely many solutions.
Choice C is incorrect. The system consisting of this equation and the given equation has no solutions rather than infinitely many solutions.$qb$);
select seed_pool_question($qb$CB-c7d7980e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$13x = 112 - x
What value of x is the solution to the given equation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c7d7980e.png$qb$, null, null, array[$qb$8$qb$]::text[], $qb$The correct answer is 8. Adding x to both sides of the given equation yields 14x = 112. Dividing both sides of this equation by 14 yields x = 8.$qb$);
select seed_pool_question($qb$CB-d8539e09$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y < 6x + 2
For which of the following tables are all the values of x and their corresponding values of y solutions to the given inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d8539e09.png$qb$, $qb$[{"label": "A", "body": "x 5/(|-7 |)||| |||(-y)/20/23/(-44 ?)???"}, {"label": "B", "body": "x 5/(|-7 |)||| |||(-y)/136/(-40 ?)???"}, {"label": "C", "body": "x 5/(|-7 |)||| |||(-y)/16/28/(-40 ?)???"}, {"label": "D", "body": "x 5/(|-7 |)||| |||(-y)/436/(-48 ?)???"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. All the tables in the choices have the same three values of x, so each of the three values of x can be substituted in the given
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
select seed_pool_question($qb$CB-ce314070$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If , what is the value of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ce314070.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Multiplying the given equation by 2 on each side yields . Applying the distributive property, this
equation can be rewritten as , or .
Choices A, B, and C are incorrect and may result from calculation errors in solving the given equation for  and then substituting that value of x
in the expression .$qb$);
select seed_pool_question($qb$CB-7e1bff94$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table gives the number of hours, h, of labor and a plumber’s total charge , in dollars, for two different jobs.
(-h)/1?? ||(f(h))/h(f( ))/155/(-285 |)||
There is a linear relationship between h and f(h) . Which equation represents this relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7e1bff94.png$qb$, $qb$[{"label": "A", "body": "f(h) = 25h + 130"}, {"label": "B", "body": "f(h) = 130h + 25"}, {"label": "C", "body": "f(h) = 65h + 90"}, {"label": "D", "body": "f(h) = 90h + 65"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that there is a linear relationship between a plumber's hours of labor, h, and the plumber's total charge f(h), in
dollars. It follows that the relationship can be represented by an equation of the form f(h) = mh + b, where m is the rate of change of the
function f and b is a constant. The rate of change of f can be calculated by dividing the difference in two values of f(h) by the difference in the
corresponding values of h. Based on the values given in the table, the rate of change of f is , or 65. Substituting 65 for m in the equation
(285-155)/(3-1h)
yields f(h) = 65h + b. The value of b can be found by substituting any value of  and its corresponding value of f(h) for h
f(h)f=(h)mh + b
and , respectively, in this equation. Substituting 1 for h and 155 for f(h) yields 155 = 65(1) + b, or 155 = 65 + b. Subtracting 65 from
both sides of this equation yields 90 = b. Substituting 90 for b in the equation f(h) = 65h + b yields f(h) = 65h + 90.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-946ab892$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$For the linear function g, the graph of y = g(x) in the xy-plane has a slope of 2 and passes through the point (1, 14) . Which equation defines g?$qb$, null, $qb$[{"label": "A", "body": "g(x) = 2x"}, {"label": "B", "body": "g(x) = 2x + 2"}, {"label": "C", "body": "g(x) = 2x + 12"}, {"label": "D", "body": "g(x) = 2x + 14"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. An equation defining a linear function can be written in the form , where m is the slope and (0, b) is the y-
intercept of the graph of y = g(x) in the xy-plane. It’s given that the graph of yx==g1(^(x)gg()(^(x)x)) ==^(m)14^(x) + b has a slope of 2. Therefore, m = 2. It’s also given that
the graph of y = g(x) passes through the point (1, 14) . It follows that when , . Substituting 1 for x, 14 for g(x), and 2 for m in
the equation g(x) = mx + b yields 14 = 2(1) + b, or 14 = 2 + b. Subtracting 2 from each side of this equation yields 12 = b. Therefore,
b = 12. Substituting 2 for m and 12 for b in the equation g(x) = mx + b yields g(x) = 2x + 12. Therefore, the equation that defines g is
g(x) = 2x + 12.
Choice A is incorrect. For this function, the graph of y = g(x) in the xy-plane passes through the point (1, 2) , not (1, 14).
Choice B is incorrect. For this function, the graph of y = g(x) in the xy-plane passes through the point (1, 4), not (1, 14) .
Choice D is incorrect. For this function, the graph of y = g(x) in the xy-plane passes through the point (1, 16) , not (1, 14).$qb$);
select seed_pool_question($qb$CB-a7e2859a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The cost of renting a large canopy tent for up to 10 days is $430 for the first day and $215 for each additional day. Which of the following
equations gives the cost y, in dollars, of renting the tent for x days, where x is a positive integer and x ≤ 10?$qb$, null, $qb$[{"label": "A", "body": "y = 215x + 215"}, {"label": "B", "body": "y = 430x - 215"}, {"label": "C", "body": "y = 430x + 215"}, {"label": "D", "body": "y = 215x + 430"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the cost of renting a large canopy tent is $430 for the first day and $215 for each additional day for up to 10
days. For x days of renting the tent, the cost includes $430 for the first day and $215 for each of the (x- 1) additional days. It follows that the
cost y, in dollars, of renting the tent can be expressed as y = 430 + 215(x - 1) , which is equivalent to y = 430 + 215x - 215, or y = 215x
+ 215. Therefore, the equation y = 215x + 215 gives the cost of renting the tent for x days, where x is a positive integer and x ≤ 10.
Choice B is incorrect. This equation represents a situation where the cost of renting the tent for the first day is $215, not $430, and the cost for
each additional day is $430, not $215.
Choice C is incorrect. This equation represents a situation where the cost of renting the tent for the first day is $645, not $430, and the cost for
each additional day is $430, not $215.
Choice D is incorrect. This equation represents a situation where the cost of renting the tent for the first day is $645, not $430.$qb$);
select seed_pool_question($qb$CB-feb78194$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A museum rents tablets to visitors. The museum earns revenue of $14 for each tablet rented for the day. On Wednesday, the museum earned
$406 in profit from renting tablets after paying daily expenses of $112. How many tablets did the museum rent on Wednesday?
(Pr0fit = t0ta1 reVenue - t0taI e?PenSeS)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-feb78194.png$qb$, null, null, array[$qb$37$qb$]::text[], $qb$The correct answer is 37. It's given that the museum earns revenue of $14 for each tablet rented for the day. It's also given that on Wednesday,
the museum earned $406 in profit from renting tablets after paying daily expenses of $112. Let x represent the number of tablets the museum
rented on Wednesday. It follows that the total revenue can be represented by the expression 14x. Because Pr0fit = totaI reVenue
- t0ta1 e?PenSeS, the equation 406 = 14x - 112 represents this situation. Adding 112 to both sides of this equation yields 14x = 518.
Dividing both sides of this equation by 14 yields x = 37. Therefore, the museum rented 37 tablets on Wednesday.$qb$);
select seed_pool_question($qb$CB-9f6f96ff$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A wire with a length of 106 inches is cut into two parts. One part has a length of x inches, and the other part has a length of y inches. The value
of x is 6 more than 4 times the value of y. What is the value of x?$qb$, null, $qb$[{"label": "A", "body": "25"}, {"label": "B", "body": "28"}, {"label": "C", "body": "56"}, {"label": "D", "body": "86"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that a wire with a length of 106 inches is cut into two parts. It's also given that one part has a length of x inches
and the other part has a length of y inches. This can be represented by the equation x + y = 106. It's also given that the value of x is 6 more
than 4 times the value of y. This can be represented by the equation x = 4y + 6. Substituting 4y + 6 for x in the equation x + y = 106 yields
4y + 6 + y = 106, or 5y+ 6 = 106. Subtracting 6 from each side of this equation yields 5y = 100. Dividing each side of this equation by 5
yields y = 20. Substituting 20 for y in the equation x = 4y + 6 yields x = 4(20) + 6, or x = 86.
Choice A is incorrect. This value represents less than half of the total length of 106 inches; however, x represents the length of the longer part of
the wire, since it's given that the value of x is 6 more than 4 times the value of y.
Choice B is incorrect. This value represents less than half of the total length of 106 inches; however, x represents the length of the longer part of
the wire, since it's given that the value of x is 6 more than 4 times the value of y.
Choice C is incorrect. This represents a part that is 6 more than the length of the other part, rather than 6 more than 4 times the length of the
other part.$qb$);
select seed_pool_question($qb$CB-48fb34c8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$y > 13x - 18
For which of the following tables are all the values of x and their corresponding values of y solutions to the given inequality?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-48fb34c8.png$qb$, $qb$[{"label": "A", "body": "x 5/(|-8 |)||| |||(-y)/217/(-86 ?)???"}, {"label": "B", "body": "x 5/(|-8 |)||| |||(-y)/26/42/(-86 ?)???"}, {"label": "C", "body": "x 5/(|-^(8) |)||| |||16/42/(-81 ?)???"}, {"label": "D", "body": "x 3/5||| |||(-y)/26/52???"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. All the tables in the choices have the same three values of x, so each of the three values of x can be substituted in the given
inequality to compare the corresponding values of y in each of the tables. Substituting 3 for x in the given inequality yields y > 13(3) - 18, or y
> 21. Therefore, when x = 3, the corresponding value of y is greater than 21. Substituting 5 for x in the given inequality yields y > 13(5)
- 18, or y > 47. Therefore, when x = 5, the corresponding value of y is greater than 47. Substituting 8 for x in the given inequality yields y
> 13(8) - 18, or y > 86. Therefore, when x = 8, the corresponding value of y is greater than 86. For the table in choice D, when x = 3, the
corresponding value of y is 26, which is greater than 21 ; when x = 5, the corresponding value of y is 52, which is greater than 47; when x = 8,
the corresponding value of y is 91, which is greater than 86. Therefore, the table in choice D gives values of x and their corresponding values of
y that are all solutions to the given inequality.
Choice A is incorrect. In the table for choice A, when x = 3, the corresponding value of y is 21 , which is not greater than 21 ; when x = 5, the
corresponding value of y is 47, which is not greater than 47; when x = 8, the corresponding value of y is 86, which is not greater than 86.
Choice B is incorrect. In the table for choice B, when x = 5, the corresponding value of y is 42, which is not greater than 47; when x = 8, the
corresponding value of y is 86, which is not greater than 86.
Choice C is incorrect. In the table for choice C, when x = 3, the corresponding value of y is 16, which is not greater than 21; when x = 5, the
corresponding value of y is 42, which is not greater than 47; when x = 8, the corresponding value of y is 81, which is not greater than 86.$qb$);
select seed_pool_question($qb$CB-343aaff6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$For the linear function f, the graph of y= f(x) in the xy-plane has a slope of 7 and passes through the point (0, 5) . Which equation defines f?$qb$, null, $qb$[{"label": "A", "body": "f(x) = 5x"}, {"label": "B", "body": "f(x) = 35x"}, {"label": "C", "body": "f(x) = 7x + 5"}, {"label": "D", "body": "f(x) = 12x + 5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. An equation that defines a linear function f can be written in the form f(x) = mx + b, where m is the slope of the graph of
y= f(x) in the xy-plane and (0, b) is the y-intercept of the graph. It’s given that for the linear function f, the graph of  in the xy-plane
y(0=, 5f)(^(x))
has a slope of 7. Therefore, m = 7. It’s also given that the graph of y= f(x) in the xy-plane passes through the point . Therefore, the y-
intercept of the graph is (0, 5) , and it follows that b = 5. Substituting 7 for m and 5 for b in the equation f(x) = mx + b yields f(x) = 7x
+ 5.
Choice A is incorrect. This equation defines a function whose graph has a slope of 5, not 7, and passes through the point (0, 0) , not (0, 5) .
Choice B is incorrect. This equation defines a function whose graph has a slope of 35, not 7, and passes through the point (0, 0), not (0, 5) .
Choice D is incorrect. This equation defines a function whose graph has a slope of 12, not 7.$qb$);
select seed_pool_question($qb$CB-f718c9cf$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$5x + 14y = 45
10x + 7y = 27
The solution to the given system of equations is (x, y) . What is the value of xy?$qb$, null, null, null, array[$qb$1.8$qb$, $qb$9/5$qb$]::text[], $qb$The correct answer is . Multiplying the first equation in the given system by 2 yields 10x + 28y = 90. Subtracting the second equation in the
10x + 9/75y = 27
given system, , from 10x + 28y = 90 yields (10x + 28y) - (10x + 7y) = 90 - 27, which is equivalent to 10x + 28y
- 10x - 7y = 63, or 21y = 63. Dividing both sides of this equation by 21 yields y = 3. The value of x can be found by substituting 3 for y in
either of the two given equations. Substituting 3 for y in the equation 10x + 7y = 27 yields 10x + 7(3) = 27, or . Subtracting
x =10 x3/5+ 21 = 27
21 from both sides of this equation yields 10x = 6. Dividing both sides of this equation by 10 yields x = 6/1o , or . Therefore, the value of
xy is (3/5)(3) , or 9/5 . Note that 9/5 and 1.8 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-6e50ce28$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The sum of a number x and 7 is twice as large as a number y. The number y is 3 less than the number x. Which system of equations describes
this situation?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6e50ce28.png$qb$, $qb$[{"label": "A", "body": "x + 7 = 2y y = x - 3"}, {"label": "B", "body": "x + 7 = 2y y = 3 - x"}, {"label": "C", "body": "2(x + 7) = y y = x - 3"}, {"label": "D", "body": "2(x + 7) = y y = 3 - x"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that the sum of a number x and 7 is twice as large as a number y. This can be described by the equation x + 7
= 2y. It’s also given that the number y is 3 less than the number x. This can be described by the equation y = x - 3. Therefore, the system
consisting of the equations x + 7 = 2y and y = x - 3 describes this situation.
Choice B is incorrect. The equation y = 3 - x describes a situation where the number y is x less than 3.
Choice C is incorrect. The equation 2(x + 7) = y describes a situation where the number y is twice the sum of a number x and 7.
Choice D is incorrect. The equation 2(x + 7) = y describes a situation where the number y is twice the sum of a number x and 7, and the
equation y = 3 - x describes a situation where a number y is x less than 3.$qb$);
select seed_pool_question($qb$CB-915463e0$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Normal body temperature for an adult is between  and , inclusive. If Kevin, an adult male, has a body temperature that is
considered to be normal, which of the following could be his body temperature?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-915463e0.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Normal body temperature must be greater than or equal to 97.8°F but less than or equal to 99°F. Of the given choices, 97.9°F
is the only temperature that fits these restrictions.
Choices A and B are incorrect. These temperatures are less than 97.8°F, so they don’t fit the given restrictions. Choice D is incorrect. This
temperature is greater than 99°F, so it doesn’t fit the given restrictions.$qb$);
select seed_pool_question($qb$CB-62ef6f73$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A total of 2 squares each have side length r. A total of 6 equilateral triangles each have side length t. None of these squares and triangles shares
a side. The sum of the perimeters of all these squares and triangles is 210. Which equation represents this situation?$qb$, null, $qb$[{"label": "A", "body": "6r + 24t = 210"}, {"label": "B", "body": "2r + 6t = 210"}, {"label": "C", "body": "8r + 18t = 210"}, {"label": "D", "body": "6r + 2t = 210"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that a total of 2 squares each have side length r. Therefore, each of the squares has perimeter 4r. Since there are a
total of 2 squares, the sum of the perimeters of these squares is 4r + 4r, which is equivalent to 2(4r), or 8r. It’s also given that a total of 6
equilateral triangles each have side length t. Therefore, each of the equilateral triangles has perimeter 3t. Since there are a total of 6 equilateral
triangles, the sum of the perimeters of these triangles is 3t + 3t + 3t + 3t + 3t + 3t, which is equivalent to 6(3t) , or 18t. Since the sum of the
perimeters of the squares is 8r and the sum of the perimeters of the triangles is 18t, the sum of the perimeters of all these squares and triangles
is 8r + 18t. It’s given that the sum of the perimeters of all these squares and triangles is 210. Therefore, the equation 8r + 18t = 210
represents this situation.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-cc3e9528$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The graph of 9x - 10y = 19 is translated down 4 units in the xy-plane. What is the x-coordinate of the x-intercept of the resulting graph?$qb$, null, null, null, array[$qb$59/9$qb$, $qb$6.555$qb$, $qb$6.556$qb$]::text[], $qb$The correct answer is 59/9 . When the graph of an equation in the form Ax + By = C, where AB, , and C are constants, is translated down k
units in the xy-plane, the resulting graph can be represented by the equation Ax + B(y + k) = C. It’s given that the graph of 9x - 10y = 19
is translated down 4 units in the xy-plane. Therefore, the resulting graph can be represented by the equation 9x - 10(y + 4) = 19, or 9x - 10y
- 40 = 19. Adding 40 to both sides of this equation yields 9x - 10y = 59. The x-coordinate of the x-intercept of the graph of an equation in
the xy-plane is the value of x in the equation when y = 0. Substituting 0 for y in the equation 9x - 10y = 59 yields 9x - 10(0) = 59, or
9x = 59. Dividing both sides of this equation by 9 yields x = 59/9 . Therefore, the x-coordinate of the x-intercept of the resulting graph is 59/9 .
Note that 59/9, 6.555, and 6.556 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-153ee763$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-3x + 21px = 84
In the given equation, p is a constant. The equation has no solution. What is the value of p?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-153ee763.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1/7"}, {"label": "C", "body": "4/3"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A linear equation in one variable has no solution if and only if the equation is false; that is, when there is no value of x that
produces a true statement. It's given that in the equation -3x + 21px = 84p,  is a constant and the equation has no solution for x. Therefore,
the value of the constant p is one that results in a false equation. Factoring out the common factor of -3x on the left-hand side of the given
equation yields . Dividing both sides of this equation by -3 yields x(1 - 7p) = -28. Dividing both sides of this equation
by (1 - 7p) yields -3xx(=1 (--72p8))/(1-7p) 7= 84. This equation is false if and only if 1 - 7p = 0. Adding 7p to both sides of 1 - 7p = 0 yields 1 = 7p. Dividing
both sides of this equation by  yields 1/7 = p. It follows that the equation x = (-28)/(1-7p) is false if and only if p = 1/7 . Therefore, the given equation
has no solution if and only if the value of p is 1/7 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-89541f9b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which of the following ordered pairs  satisfies the inequality  ?
1.
2.
3.$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-89541f9b.png$qb$, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II only"}, {"label": "D", "body": "I and III only"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Substituting  into the inequality gives , or , which is a true statement. Substituting  into
the inequality gives , or , which is a true statement. Substituting  into the inequality gives , or
, which is not a true statement. Therefore,  and  are the only ordered pairs shown that satisfy the given inequality.
Choice A is incorrect because the ordered pair  also satisfies the inequality. Choice B is incorrect because the ordered pair  also
satisfies the inequality. Choice D is incorrect because the ordered pair  does not satisfy the inequality.$qb$);
select seed_pool_question($qb$CB-2875ba81$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$62xx ++ 27yy == 2108
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2875ba81.png$qb$, $qb$[{"label": "A", "body": "-2"}, {"label": "B", "body": "7"}, {"label": "C", "body": "14"}, {"label": "D", "body": "18"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The given system of linear equations can be solved by the elimination method. Multiplying each side of the second equation
in the given system by 3 yields , or 6x + 6y = 30. Subtracting this equation from the first equation in the given
(6x + 7y) - (6x(2+^(x)6+y)2y=)((32)8=) -(1(03)0()3)
system yields , which is equivalent to (6x - 6x) + (7y - 6y) = 28 - 30, or y = -2.
Choice B is incorrect. This is the value of x, not the value of y.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0ef4a7b6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A particular botanist classifies a species of plant as tall if its typical height when fully grown is more than 100 centimeters. Each of the following
inequalities represents the possible heights h, in centimeters, for a specific plant species when fully grown. Which inequality represents the
possible heights h, in centimeters, for a tall plant species?$qb$, null, $qb$[{"label": "A", "body": "106 < h < 158"}, {"label": "B", "body": "80 < h < 100"}, {"label": "C", "body": "42 < h < 87"}, {"label": "D", "body": "17 < h < 85"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that a particular botanist classifies a species of plant as tall if its typical height when fully grown is more than 100
centimeters. The inequality 106 < h < 158 represents possible heights h, in centimeters, for a plant species when fully grown where h is
between 106 and 158 centimeters. Since all values of h in this inequality are greater than 100 centimeters, this inequality represents the
possible heights for a tall plant species.
Choice B is incorrect. This inequality represents possible heights h, in centimeters, for a plant species when fully grown where h is between 80
and 100 centimeters, not more than 100 centimeters.
Choice C is incorrect. This inequality represents possible heights h, in centimeters, for a plant species when fully grown where h is between 42
and 87 centimeters, not more than 100 centimeters.
Choice D is incorrect. This inequality represents possible heights h, in centimeters, for a plant species when fully grown where h is between 17
and 85 centimeters, not more than 100 centimeters.$qb$);
select seed_pool_question($qb$CB-6a12efbb$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The equation 46 = 2x + 2y gives the perimeter of a rectangular rug that has length x, in feet, and width y, in feet. The width of the rug is 8 feet.
What is the length, in feet, of the rug?$qb$, null, null, null, array[$qb$15$qb$]::text[], $qb$The correct answer is 15. It's given that the equation 46 = 2x + 2y gives the perimeter of a rectangular rug that has length x, in feet, and width
y, in feet. It's also given that the width of the rug is 8 feet. Substituting 8 for y in the equation 46 = 2x + 2y yields 46 = 2x + 2(8), or
46 = 2x + 16. Subtracting 16 from both sides of this equation yields 30 = 2x. Dividing both sides of this equation by 2 yields 15 = x. Since x
represents the length, in feet, of the rug, it follows that the length of the rug is 15 feet.$qb$);
select seed_pool_question($qb$CB-2ecce641$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?^(?)d11O?Sa
441020504050602080776622883355II0000000000000000??/(222 444 666 888 10II00)| || || || || || || || || || || |x
?b1?tnnnOaaCCaaCe?
?imeSinCeinitiaIdePoSit (monthS)
A bank account was opened with an initial deposit. Over the next several months, regular deposits were made into this account, and there were
no withdrawals made during this time. The graph of the function f shown, where y = f(x), estimates the account balance, in dollars, in this
bank account x months since the initial deposit. To the nearest whole dollar, what is the amount of the initial deposit estimated by the graph?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2ecce641.png$qb$, null, null, array[$qb$20$qb$]::text[], $qb$The correct answer is 20. For the graph shown, the x-axis represents the time since the initial deposit, in months, and the y-axis represents the
bank account balance, in dollars. The amount of the initial deposit is estimated by the y-coordinate of the point on the graph that represents 0
months since the initial deposit. Therefore, the amount of the initial deposit is estimated by the corresponding y-value for the point when x = 0.
When x = 0, it is estimated that y = 20. Thus, the amount of the initial deposit estimated by the graph, to the nearest whole dollar, is 20.$qb$);
select seed_pool_question($qb$CB-265f2a53$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$When line n is graphed in the xy-plane, it has an x-intercept of (-4, 0) and a y-intercept of (0, 86/3 ) . What is the slope of line n?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-265f2a53.png$qb$, $qb$[{"label": "A", "body": "3/344"}, {"label": "B", "body": "6/43"}, {"label": "C", "body": "43/6"}, {"label": "D", "body": "344/3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that when line n is graphed in the xy-plane, it has an x-intercept of (-4, 0) and a y-intercept of (0, 86/3 ) . The slope,
m, of a line can be found using any two points on the line, (x1 , y1 ) and (x2 , y2 ), and the slope formula m = (y2-y1)/(x2 -x1) . Substituting the points
(-4, 0) and (0, 86/3 ) for (x1 , y1 ) and (x2 , y2 ) , respectively, in the slope formula yields m = (86/3 -o)/(0-(-4)) , or m = 43/6 . Therefore, the slope of line n
is 43/6 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the slope of a line that has an x-intercept of ( 86/3 , 0) and a y-intercept of (0, -4).
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ee031767$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A dance teacher ordered outfits for students for a dance recital. Outfits for boys cost $26, and outfits for girls cost $35. The dance teacher
ordered a total of 28 outfits and spent $881. If b represents the number of outfits the dance teacher ordered for boys and g represents the
number of outfits the dance teacher ordered for girls, which of the following systems of equations can be solved to find b and g ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ee031767.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Outfits for boys cost $26 each and the teacher ordered b outfits for boys, so the teacher spent 26b dollars on outfits for
boys. Similarly, outfits for girls cost $35 each and the teacher ordered g outfits for girls, so the teacher spent 35g dollars on outfits for girls. Since
the teacher spent a total of $881 on outfits for boys and girls, the equation 26b + 35g = 881 must be true. And since the teacher ordered a total
of 28 outfits, the equation b + g = 28 must also be true.
Choice A is incorrect and may result from switching the constraint on the total number of outfits with the constraint on the cost of the outfits.
Choice C is incorrect and may result from switching the constraint on the total number of outfits with the constraint on the cost of the outfits, as
well as switching the cost of the outfits for boys with the cost of the outfits for girls. Choice D is incorrect and may result from switching the cost
of the outfits for boys with the cost of the outfits for girls.$qb$);
select seed_pool_question($qb$CB-4e400635$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$3x + 6 = 4y
3x + 4 = 2y
The solution to the given system of equations is (x, y) . What is the value of y?$qb$, null, null, null, array[$qb$1$qb$]::text[], $qb$The correct answer is 1 . Subtracting the second equation from the first equation in the given system of equations yields (3x - 3x) + (6 - 4)
= 4y - 2y, which is equivalent to 0 + 2 = 2y, or 2 = 2y. Dividing each side of this equation by 2 yields 1 = y.$qb$);
select seed_pool_question($qb$CB-dcc4886a$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$y = 2/7 x + 3
One of the two equations in a system of linear equations is given. The system has infinitely many solutions. If the second equation in the system
is y = mx + b, where m and b are constants, what is the value of b?$qb$, null, $qb$[{"label": "A", "body": "-3"}, {"label": "B", "body": "- 1/3"}, {"label": "C", "body": "1/3"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the system has infinitely many solutions. The graphs of two lines in the xy-plane represented by equations in
slope-intercept form, y = mx + b, where m and b are constants, have infinitely many solutions if their slopes, m, are the same and if their y-
coordinates of the y-intercepts, b, are also the same. The first equation in the given system is y = 2/7 x + 3. For this equation, the slope is 2/7 and
the y-coordinate of the y-intercept is 3. If the second equation is in the form y = mx + b, then for the two equations to be equivalent, the values
of m and b in the second equation must equal the corresponding values in the first equation. Therefore, the second equation must have a slope,
m, of 2/? , and a y-coordinate of the y-intercept, b, of 3. Thus, the value of b is 3.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-0cadb20e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = (x+15)/5 , and f(a) = 10, where a is a constant. What is the value of a?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "10"}, {"label": "C", "body": "35"}, {"label": "D", "body": "65"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that and f(a) = 10, where a is a constant. Therefore, for the given function f, when x = a f(x),
f(x)f(=x)(x+15)/5
= 10. Substituting a for x and 10 for in the given function f yields 10 = (a+15)/5 . Multiplying both sides of this equation by 5 yields 50 = a
+ 15. Subtracting 15 from both sides of this equation yields 35 = a. Therefore, the value of a is 35.
Choice A is incorrect. This is the value of a if f(a) = 4.
Choice B is incorrect. This is the value of a if f(a) = 5.
Choice D is incorrect. This is the value of a if f(a) = 16.$qb$);
select seed_pool_question($qb$CB-ce6b52d8$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If 2(3t - 10) + t = 40 + 4t, what is the value of 3t?$qb$, null, null, null, array[$qb$60$qb$]::text[], $qb$The correct answer is 60. Subtracting t from both sides of the given equation yields 2(3t - 10) = 40 + 3t. Applying the distributive property to
the left-hand side of this equation yields 6t - 20 = 40 + 3t. Adding 20 to both sides of this equation yields 6t = 60 + 3t. Subtracting 3t from
both sides of this equation yields 3t = 60. Therefore, the value of 3t is 60.$qb$);
select seed_pool_question($qb$CB-83fb222d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If 6n = 12, what is the value of n + 4?$qb$, null, null, null, array[$qb$6$qb$]::text[], $qb$The correct answer is 6. Dividing both sides of the equation 6n = 12 by 6 yields n = 2. Substituting 2 for n in the expression n + 4 yields 2
+ 4, or 6.$qb$);
select seed_pool_question($qb$CB-aee9fd2d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$hard$qb$::difficulty_level, null, $qb$If (x+6)/3 = (x+6)/13 , the value of x + 6 is between which of the following pairs of values?$qb$, null, $qb$[{"label": "A", "body": "-7 and -3"}, {"label": "B", "body": "-2 and 2"}, {"label": "C", "body": "2 and 7"}, {"label": "D", "body": "8 and 13"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Multiplying both sides of the given equation by (3)(13), or 39, yields (39) ((x+6)/3) = (39) ((x+6)/13) , or 13(x + 6)
= 3(x + 6) . Subtracting from both sides of this equation yields 10(x + 6) = 0. Dividing both sides of this equation by 10 yields x
(x+63)/3 (=x (+x+66))/13
+ 6 = 0. Therefore, if , then the value of x + 6 is 0. It follows that of the given choices, the value of x + 6 is between -2 and 2.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6daf8d70$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A city employee will plant two types of bushes, azaleas and boxwoods, in a park. There will be no more than 164 total bushes planted, and the
number of azaleas planted will be at most three times the number of boxwoods planted. Which of the following systems of inequalities best
represents this situation, where a is the number of azaleas that will be planted, and b is the number of boxwoods that will be planted?$qb$, null, $qb$[{"label": "A", "body": "a + b ≥ 164 3a ≥ b"}, {"label": "B", "body": "a + b ≥ 164 a ≤ 3b"}, {"label": "C", "body": "a + b ≤ 164 3a ≥ b"}, {"label": "D", "body": "a + b ≤ 164 a ≤ 3b"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that a city employee will plant azaleas and boxwoods in a park, where a is the number of azaleas that will be
planted and b is the number of boxwoods that will be planted. It’s also given that there will be no more than 164 total bushes planted, which can
be represented by the inequality a + b ≤ 164. It’s also given that the number of azaleas planted will be at most three times the number of
boxwoods planted, which can be represented by the inequality a ≤ 3b. Therefore, the system of inequalities containing a + b ≤ 164 and a
≤ 3b best represents this situation.
Choice A is incorrect. The inequality a + b ≥ 164 represents a situation where at least 164 total bushes will be planted, not that there will be no
more than 164 total bushes planted. Also, the inequality 3a ≥ b represents a situation where the number of boxwoods that will be planted is at
most three times the number of azaleas that will be planted, not that the number of azaleas planted will be at most three times the number of
boxwoods planted.
Choice B is incorrect. The inequality a + b ≥ 164 represents a situation where at least 164 total bushes will be planted, not that there will be no
more than 164 total bushes planted.
Choice C is incorrect. The inequality 3a ≥ b represents a situation where the number of boxwoods that will be planted is at most three times the
number of azaleas that will be planted, not that the number of azaleas planted will be at most three times the number of boxwoods planted.$qb$);
select seed_pool_question($qb$CB-84d0d07e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_inequalities_in_one_or_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A clothing store is having a sale on shirts and pants. During the sale, the cost of each shirt is $15 and the cost of each pair of pants is $25. Geoff
can spend at most $120 at the store. If Geoff buys s shirts and p pairs of pants, which of the following must be true?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-84d0d07e.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since the cost of each shirt is $15 and Geoff buys s shirts, the expression  represents the amount Geoff spends on
shirts. Since the cost of each pair of pants is $25 and Geoff buys p pairs of pants, the expression  represents the amount Geoff spends on
pants. Therefore, the sum  represents the total amount Geoff spends at the store. Since Geoff can spend at most $120 at the store,
the total amount he spends must be less than or equal to 120. Thus, .
Choice B is incorrect. This represents the situation in which Geoff spends at least, rather than at most, $120 at the store. Choice C is incorrect
and may result from reversing the cost of a shirt and that of a pair of paints. Choice D is incorrect and may result from both reversing the cost of
a shirt and that of a pair of pants and from representing a situation in which Geoff spends at least, rather than at most, $120 at the store.$qb$);
select seed_pool_question($qb$CB-7a987ae4$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$If , what is the value of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7a987ae4.png$qb$, $qb$[{"label": "A", "body": "24"}, {"label": "B", "body": "49"}, {"label": "C", "body": "50"}, {"label": "D", "body": "99"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Multiplying both sides of the given equation by 5 yields . Substituting 50 for  in the expression  yields
.
Alternate approach: Dividing both sides of  by 2 yields . Evaluating the expression  for  yields
.
Choice A is incorrect and may result from finding the value of  instead of . Choice C is incorrect and may result from finding the
value of  instead of . Choice D is incorrect and may result from finding the value of  instead of .$qb$);
select seed_pool_question($qb$CB-f81a0503$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, line k passes through the points (0, -5) and (1, -1) . Which equation defines line k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f81a0503.png$qb$, $qb$[{"label": "A", "body": "y = -x + 1/4"}, {"label": "B", "body": "y = 1/4 x - 5"}, {"label": "C", "body": "y = -x + 4"}, {"label": "D", "body": "y = 4x - 5"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. An equation defining a line in the xy-plane can be written in the form y = mx + b, where m represents the slope and (0, b)
represents the y-intercept of the line. It’s given that line k passes through the point ; therefore, b = -5. The slope, m, of a line can be
found using any two points on the line, (x1 , y1 ) and (x2 , y2 ) , and the slope formula (0m, -m=5=) (y2-y1)/(x24-x1) . Substituting the points (0, -5) and (1, -1)
for (x1 , y1 ) and (x2 , y2 ) , respectively, in the slope formula yields m = (-1-(-5))/(1-o) , or . Substituting 4 for m and -5 for b in the equation
y = mx + b yields y = 4x - 5.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1006cad7$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-(?10II?4?80044662288)/(-/--/-4 2 ÷?4?44?? 2 4 6 8 10)|| || ?|| || | || || || || || || || || || || | x
The graph of a system of linear equations is shown. What is the solution (x, y) to the system?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1006cad7.png$qb$, $qb$[{"label": "A", "body": "(0, 5)"}, {"label": "B", "body": "(2, 4)"}, {"label": "C", "body": "(5, 10)"}, {"label": "D", "body": "(10, 0)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A solution to a system of equations must be the solution to each equation in the system. It follows that if (x, y) is a solution
to the system, the point (x, y) lies on the graph in the xy-plane of each equation in the system. The point that lies on each graph of the system of
linear equations shown is their intersection point (2, 4) . Therefore, the solution to the system is (2, 4).
Choice A is incorrect. The point (0, 5) lies on one, but not both, of the graphs of the linear equations shown.
Choice C is incorrect. The point (5, 10) lies on one, but not both, of the graphs of the linear equations shown.
Choice D is incorrect. The point (10, 0) lies on one, but not both, of the graphs of the linear equations shown.$qb$);
select seed_pool_question($qb$CB-570b5a5d$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$medium$qb$::difficulty_level, null, $qb$7/2x + 6y = 25
5/2x + 6y = 23
The solution to the given system of equations is (x, y) . What is the value of 17/2x + 18y?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-570b5a5d.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "3"}, {"label": "C", "body": "48"}, {"label": "D", "body": "71"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Multiplying the second equation in the given system by 2 yields . Adding this equation to the first equation
10/2( x7/2+x +12 y10/2=x)46+
in the system yields , which is equivalent to (6y + 12y) = 25 + 46, or 17/2x + 18y
(7/2x + 6(y17))/2x++(10/(1^(2)8)yx + 12y) = 25 + 46
= 71. Therefore, the value of  is 71 .
Choice A is incorrect. This is the value of x, not the value of 17/2x + 18y.
Choice B is incorrect. This is the value of y, not the value of 17/2x + 18y.
Choice C is incorrect. This the value of (7/2x + 6y) + (5/2x + 6y) , or 6x + 12y, not the value of 17/2x + 18y.$qb$);
select seed_pool_question($qb$CB-56e1b09e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_one_variable$qb$, $qb$easy$qb$::difficulty_level, null, $qb$2·6 + x = 2·8
What value of x is the solution to the given equation?$qb$, null, null, null, array[$qb$0.2$qb$, $qb$1/5$qb$]::text[], $qb$The correct answer is ·2. Subtracting 2·6 from each side of the given equation yields x = 0·2. Therefore, the value of x that's the solution to the
given equation is 0·2. Note that .2 and 1/5 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-346d5c2e$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by f(x) = 9(2x + 3). For what value of x does f(x) = 63?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "5"}, {"label": "C", "body": "7"}, {"label": "D", "body": "30"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Substituting 63 for f(x) in the given function yields 63 = 9(2x + 3) . Dividing both sides of this equation by 9 yields 7
= 2x + 3. Subtracting 3 from both sides of this equation yields 4 = 2x. Dividing both sides of this equation by 2 yields 2 = x. Therefore, f(x)
= 63 when the value of x is 2.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-13909d78$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The function f is defined by the equation f (x) = 100x + 2. What is the value of f(x) when x = 9?$qb$, null, $qb$[{"label": "A", "body": "111"}, {"label": "B", "body": "118"}, {"label": "C", "body": "900"}, {"label": "D", "body": "902"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Substituting 9 for x in the given equation yields f (9) = 100 (9) + 2, or f (9) = 902. Therefore, the value of f(x) when x
= 9 is 902.
Choice A is incorrect. This is the value of f(x) when x = 1·09.
Choice B is incorrect. This is the value of f(x) when x = 1·16.
Choice C is incorrect. This is the value of f(x) when x = 8·98.$qb$);
select seed_pool_question($qb$CB-10c448d6$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A line in the xy-plane has a slope of 1/9 and passes through the point (0, 14). Which equation represents this line?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-10c448d6.png$qb$, $qb$[{"label": "A", "body": "y = - 1/9 x - 14"}, {"label": "B", "body": "y = -1/9x + 14"}, {"label": "C", "body": "y = 1/9 x - 14"}, {"label": "D", "body": "y = 1/9x + 14"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The equation of a line in the xy-plane can be written as , where m represents the slope of the line and (0, b)
represents the y-intercept of the line. It's given that the slope of the line is 1/(b^(9))y = mx + b. It follows that m = 1/9 . It's also given that the line passes through
the point (0, 14). It follows that b = 14. Substituting 1/9 for m and 14 for  in y = mx + b yields y = 1/9x + 14. Thus, the equation y = 1/9 x
+ 14 represents this line.
Choice A is incorrect. This equation represents a line with a slope of - 1/9 and a y-intercept of (0, -14) .
Choice B is incorrect. This equation represents a line with a slope of - 1/9 and a y-intercept of (0, 14).
Choice C is incorrect. This equation represents a line with a slope of 1/9 and a y-intercept of (0, -14) .$qb$);
select seed_pool_question($qb$CB-939fc21b$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$systems_of_two_linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$s + 7r = 27
r = 3
What is the solution (r, s) to the given system of equations?$qb$, null, $qb$[{"label": "A", "body": "(6, 3)"}, {"label": "B", "body": "(3, 6)"}, {"label": "C", "body": "(3, 27)"}, {"label": "D", "body": "(27, 3)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The second equation in the given system is r = 3. Substituting 3 for r in the first equation in the given system yields s
+ 7(3) = 27, or s + 21 = 27. Subtracting 21 from both sides of this equation yields s = 6. Therefore, the solution (r, s) to the given system
of equations is (3, 6).
Choice A is incorrect. This is the solution (s, r) , not (r, s), to the given system of equations.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-68f343c9$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_functions$qb$, $qb$medium$qb$::difficulty_level, null, $qb$If f(x) = x + 6 and g(x) = 6x, what is the value of 7f(2) - g(2)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-68f343c9.png$qb$, $qb$[{"label": "A", "body": "-4"}, {"label": "B", "body": "8"}, {"label": "C", "body": "42"}, {"label": "D", "body": "44"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that f(x) = x + 6. Substituting 2 for x in the function f yields f(2) = 2 + 6, or f(2) = 8. It's also given that
. Substituting 2 for x in the function g yields , or . Substituting 8 for f(2) and 12 for g(2) in the expression
g7f(^(x)(2) )=-6g^(x)(2) g(2) =7f(6(2))(2-) g(2g)(2) = 12
yields 7(8) - 12, or 44. Therefore, the value of  is 44.
Choice A is incorrect. This is the value of f(2) -g(2) , not 7f(2) - g(2).
Choice B is incorrect. This is the value of f(2) , not 7f(2) - g(2) .
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7038b587$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Vivian bought party hats and cupcakes for $71. Each package of party hats cost $3, and each cupcake cost $1 . If Vivian bought 10 packages of
party hats, how many cupcakes did she buy?$qb$, null, null, null, array[$qb$41$qb$]::text[], $qb$The correct answer is 41 . The number of cupcakes Vivian bought can be found by first finding the amount Vivian spent on cupcakes. The
amount Vivian spent on cupcakes can be found by subtracting the amount Vivian spent on party hats from the total amount Vivian spent. The
amount Vivian spent on party hats can be found by multiplying the cost per package of party hats by the number of packages of party hats,
which yields $3 · 10, or $30. Subtracting the amount Vivian spent on party hats, $30, from the total amount Vivian spent, $71, yields $71 - $30,
or $41. Since the amount Vivian spent on cupcakes was $41 and each cupcake cost $1 , it follows that Vivian bought 41 cupcakes.$qb$);
select seed_pool_question($qb$CB-4acd05cd$qb$, $qb$mathematics$qb$, $qb$algebra$qb$, $qb$linear_equations_in_two_variables$qb$, $qb$easy$qb$::difficulty_level, null, $qb$-10II24680044662288/(-/--/--/-888 666 444 222÷÷÷?42446622 ? ? ???? 444 666 888)|| || || || || || || || ?| || || || || || || || || | x
The graph shows the linear relationship between x and y. Which table gives three values of x and their corresponding values of y for this
relationship?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4acd05cd.png$qb$, $qb$[{"label": "A", "body": "x -/01/(|-^(2) |)||| |||(-y)/0-/(--^(9) ?)???"}, {"label": "B", "body": "x 0/1||| |||0/3-/(--^(1) ?)???"}, {"label": "C", "body": "x 1/(|-2 |)||| |||(-y)/5-/7-/(--^(9) ?)???"}, {"label": "D", "body": "x -/0|| ||(-y)/5-/(--^(3) ?)?? -/(|-|)| |-/(-?)? 2 -1"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the graph shows the linear relationship between x and y. The given graph passes through the points (0, -5) ,
(1, -3) , and (2, -1) . It follows that when x = 0, the corresponding value of y is -5, when x = 1, the corresponding value of y is -3, and
when x = 2, the corresponding value of y is -1. Of the given choices, only the table in choice D gives these three values of x and their
corresponding values of y for the relationship shown in the graph.
Choice A is incorrect. This table represents a relationship between x and y such that the graph passes through the points (0, 0), (1, -7), and
(2, -9) .
Choice B is incorrect. This table represents a relationship between x and y such that the graph passes through the points (0, 0) , (1, -3) , and
(2, -1) .
Choice C is incorrect. This table represents a linear relationship between x and y such that the graph passes through the points (0, -5) ,
(1, -7) , and (2, -9) .$qb$);
