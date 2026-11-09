-- ============================================================================
--  0084 — College Board's Mathematics questions
--
--  244 questions from College Board's SAT Suite Question Bank, into the
--  Mathematics practice pool. Part 5 of 5.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

select seed_pool_question($qb$CB-502d9690$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Rectangle ABCD is similar to rectangle E?GH. The area of rectangle ABCD is 648 square inches, and the area of rectangle E?GH is 72
square inches. The length of the longest side of rectangle ABCD is 36 inches. What is the length, in inches, of the longest side of rectangle
E?GH?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-502d9690.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "9"}, {"label": "C", "body": "12"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that rectangle ABCD is similar to rectangle EFGH. Therefore, if the length of each side of rectangle ABCD is
k times the length of the corresponding side of rectangle EFGH, then the area of rectangle ABCD is k^(2) times the area of rectangle EFGH.
It’s given that the area of rectangle ABCD is 648 square inches and the area of rectangle EFGH is 72 square inches. It follows that k^(2)
= 648/72 , or k^(2) = 9. Taking the square root of each side of this equation yields k = √-9, or k = 3. It follows that the length of each side of
rectangle ABCD is 3 times the length of the corresponding side of rectangle EFGH. It’s given that the length of the longest side of rectangle
ABCD is 36 inches. Therefore, 36 inches is 3 times the length of the longest side of rectangle EFGH, and the longest side of rectangle
EFGH is equal to 36/3 , or 12, inches.
Choice A is incorrect. This is the length, in inches, of the longest side of a rectangle with side lengths that are 1/9 the corresponding side lengths
of rectangle ABCD, rather than a rectangle with an area that is 1/9 the area of rectangle ABCD.
Choice B is incorrect. This is the factor by which the area of rectangle ABCD is larger than the area of rectangle EFGH, not the length, in
inches, of the longest side of rectangle EFGH.
Choice D is incorrect. This is the length, in inches, of the longest side of rectangle ABCD, not rectangle EFGH.$qb$);
select seed_pool_question($qb$CB-2757549e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$ADB ??-X^(°) C ?
N0te: Figuren0t ?ra?ntoSCaIe·
In the figure,--BC is parallel to--DE. If the length of --DE is 147 and the length of--AE is 245, what is the value of tanx^(°)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2757549e.png$qb$, $qb$[{"label": "A", "body": "147/196"}, {"label": "B", "body": "147/245"}, {"label": "C", "body": "196/147"}, {"label": "D", "body": "245/147"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the length of --DE is 147, and the length of --AE is 245. Since angle D is a right angle, triangle ADE is a right
triangle with hypotenuse --AE and legs --AD and --DE. By the Pythagorean theorem, if a right triangle has a hypotenuse with length c and legs with
lengths a and b, then a2 + b2 = c2 . Substituting AD for a, 147 for b, and 245 for c in the equation a2 + b2 = c2 yields AD^(2) + 147^(2) = 245^(2).
Subtracting 147^(2) from both sides of this equation yields AD^(2) = 245^(2) - 147^(2) . Evaluating this difference yields AD^(2) = 60,025 - 21,609, or
. Taking the positive square root of both sides of this equation yields AD = 196. It's given that --BC is parallel to --DE, and --AE
AD2 =
intersects  and --DE. It follows that angle ACB is congruent to angle AED. Since angle A is common to triangles ABC and ADE, it
follows that triangle ABC is similar to triangle ADE. In triangle ABCtaux^(?),  is the ratio of the leg opposite angle ACB to the leg adjacent to
angle ACB, so tan x? = AB/BC . Since triangle ABC is similar to triangle ADE and similar triangles have proportional side lengths, it follows
that . Therefore, tan x°= AD/DE . Substituting 196 for AD and 147 for DE in this equation yields tan x?= 196/147 . Therefore, the value
taAB/nBCx?= AD/DE196/147
of  is .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of c0Sx^(?), not tanx^(°).
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c4a9c94d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$AB????? C
Note: FigurenotdraWnt0SCaIe·
In the figure, --ADand --BC intersect at point D. If the length of--BD is 5 and the tangent of angle CAD is 1·3, what is the length of --AD?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c4a9c94d.png$qb$, null, null, array[$qb$6.5$qb$, $qb$13/2$qb$]::text[], $qb$The correct answer is 6·5. The figure shows that △BAC is a right triangle. In the figure, --ADis perpendicular to --BC, which forms two
additional right triangles: △BDA and △ADC. If two pairs of corresponding angles in two triangles are congruent, then the triangles are
similar. △BDA shares angle B with △BAC and △ADC shares angle C with △BAC. Therefore, the figure contains three similar right
triangles: △BAC △BDA, , and △ADC. In similar triangles, the tangents of corresponding angles are equivalent. It's given that the tangent of
angle CAD is 1·3. Since angle CAD in △ADC corresponds to angle ABD in △BDA, it follows that the tangent of angle ABD is also 1·3.
The tangent of an acute angle in a right triangle is equal to the length of the leg opposite the angle divided by the length of the leg adjacent to the
angle. Therefore, . It's given that the length of --BD is 5. Substituting 5 for BD and 1·3 for tanABD in the equation
tan AB1D·3== AD/BDAD/5
tan ABD = AD/BD yields . Multiplying both sides of this equation by 5 yields 6·5 = AD. Therefore, the length of --ADis 6·5. Note
that 6.5 and 13/2 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-6b4707aa$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Circle A in the xy-plane has the equation (x + 5)^(2) + (y - 5)^(2) = 25. Circle B has the same center as circle A. The radius of circle B is two times
the radius of circle A. The equation defining circle B in the xy-plane is (x + 5)^(2) + (y - 5)^(2) = k, where k is a constant. What is the value of k?$qb$, null, null, null, array[$qb$100$qb$]::text[], $qb$The correct answer is 100. An equation of a circle in the xy-plane can be written as (x - t)2 + (y - u)2 = r2, where the center of the circle is
(t, u) , the radius of the circle is r, and where t, u, and r are constants. It’s given that the equation of circle A is (x + 5)^(2) + (y - 5)^(2) = 25,
which is equivalent to (x + 5)^(2) + (y - 5)^(2) = 5^(2). Therefore, the center of circle A is (-5, 5) and the radius of circle A is 5. It’s given that circle
B has the same center as circle A and that the radius of circle B is two times the radius of circle A. Therefore, the center of circle B is  and
the radius of circle B is 2(5), or 10. Substituting -5 for t, 5 for u, and 10 for r in the equation (x - t)2 + (y - u)2 = r2 yields ((xx ++(-55)5)22, 5)
, which is equivalent to (x + 5)^(2) + (y - 5)^(2) = 100. It follows that the equation of circle B in the xy-plane is
++ ((yy -- 55))^(2)2 == 11000^(2)
. It's also given that the equation defining circle B in the xy-plane is (x + 5)^(2) + (y - 5)^(2) = k, where ? is a constant.
Therefore, the value of k is 100.$qb$);
select seed_pool_question($qb$CB-4c95c7d4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A graphic designer is creating a logo for a company. The logo is shown in the figure above. The logo is in the shape of a trapezoid and consists
of three congruent equilateral triangles. If the perimeter of the logo is 20 centimeters, what is the combined area of the shaded regions, in square
centimeters, of the logo?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4c95c7d4.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": "16"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the logo is in the shape of a trapezoid that consists of three congruent equilateral triangles, and that the
perimeter of the trapezoid is 20 centimeters (cm). Since the perimeter of the trapezoid is the sum of the lengths of 5 of the sides of the triangles,
the length of each side of an equilateral triangle is . Dividing up one equilateral triangle into two right triangles yields a pair of
congruent 30°-60°-90° triangles. The shorter leg of each right triangle is half the length of the side of an equilateral triangle, or 2 cm. Using the
Pythagorean Theorem, , the height of the equilateral triangle can be found. Substituting  and  and solving for b yields
cm. The area of one equilateral triangle is , where  and . Therefore, the area of one
equilateral triangle is . The shaded area consists of two such triangles, so its area is .
Alternate approach: The area of a trapezoid can be found by evaluating the expression , where is the length of one base,
is the length of the other base, and h is the height of the trapezoid. Substituting , , and  yields the expression
, or , which gives an area of  for the trapezoid. Since two-thirds of the trapezoid is shaded, the
area of the shaded region is .
Choice A is incorrect. This is the height of the trapezoid. Choice B is incorrect. This is the area of one of the equilateral triangles, not two. Choice
D is incorrect and may result from using a height of 4 for each triangle rather than the height of .$qb$);
select seed_pool_question($qb$CB-b8a225ff$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Circle A in the xy-plane has the equation (x + 5)^(2) + (y - 5)^(2) = 4. Circle B has the same center as circle A. The radius of circle B is two times
the radius of circle A. The equation defining circle B in the xy-plane is (x + 5)^(2) + (y - 5)^(2) = k, where k is a constant. What is the value of k?$qb$, null, null, null, array[$qb$16$qb$]::text[], $qb$The correct answer is 16. An equation of a circle in the xy-plane can be written as (x - t)2 + (y - u)2 = r2, where the center of the circle is
(t, u) , the radius of the circle is r, and where t, u, and r are constants. It’s given that the equation of circle A is (x + 5)^(2) + (y - 5)^(2) = 4, which
is equivalent to (x + 5)^(2) + (y - 5)^(2) = 2^(2) . Therefore, the center of circle A is (-5, 5) and the radius of circle A is 2. It’s given that circle B has
the same center as circle A and that the radius of circle B is two times the radius of circle A. Therefore, the center of circle B is and the
(x(-+55, )52)
radius of circle B is 2(2), or 4. Substituting -5 for t, 5 for u, and 4 for r into the equation (x - t)2 + (y - u)2 = r2 yields
, which is equivalent to (x + 5)^(2) + (y - 5)^(2) = 16. It follows that the equation of circle B in the xy-plane is (x + 5)^(2)
++ ((yy -- 55))^(22) == 416^(2)
. Therefore, the value of k is 16.$qb$);
select seed_pool_question($qb$CB-b0a72bdc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$What is the diameter of the circle in the xy-plane with equation (x - 5)^(2) + (y - 3)^(2) = 16?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "8"}, {"label": "C", "body": "16"}, {"label": "D", "body": "32"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The standard form of an equation of a circle in the xy-plane is (x - h)^(2) + (y - k)^(2) = r^(2), where the coordinates of the
center of the circle are and the length of the radius of the circle is r. For the circle in the xy-plane with equation (x - 5)^(2) + (y - 3)^(2)
r2(=h, 1k6)
= 16, it follows that . Taking the square root of both sides of this equation yields r = 4 or r = -4. Because r represents the length of
the radius of the circle and this length must be positive, r = 4. Therefore, the radius of the circle is 4. The diameter of a circle is twice the length
of the radius of the circle. Thus, 2(4) yields 8. Therefore, the diameter of the circle is 8.
Choice A is incorrect. This is the radius of the circle.
Choice C is incorrect. This is the square of the radius of the circle.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-933fee1a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Triangles ABC and DEF are shown above. Which of the following is equal to the ratio ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-933fee1a.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In right triangle ABC, the measure of angle B must be 58° because the sum of the measure of angle A, which is 32°, and the
measure of angle B is 90°. Angle D in the right triangle DEF has measure 58°. Hence, triangles ABC and DEF are similar (by angle-angle
similarity). Since  is the side opposite to the angle with measure 32° and AB is the hypotenuse in right triangle ABC, the ratio  is equal
to .
Alternate approach: The trigonometric ratios can be used to answer this question. In right triangle ABC, the ratio . The angle
E in triangle DEF has measure 32° because . In triangle DEF, the ratio . Therefore,
.
Choice A is incorrect because  is the reciprocal of the ratio . Choice C is incorrect because , not . Choice D is
incorrect because , not .$qb$);
select seed_pool_question($qb$CB-f389569d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$What is the perimeter of an equilateral triangle with a height of 39√-3?$qb$, null, $qb$[{"label": "A", "body": "117"}, {"label": "B", "body": "117√-3"}, {"label": "C", "body": "234"}, {"label": "D", "body": "1,521√-3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the equilateral triangle has a height of 39√-3. In equilateral triangles, all three angles have a measure of 60^(°)
and the height is equal to the length of an altitude from one vertex to the midpoint of the side across from the vertex. Thus, an altitude in this
equilateral triangle has a length of 39√-3. The altitude divides the equilateral triangle into two congruent 30-60-90 right triangles, where the
altitude is the side across from the 60^(?) angle in each 30-60-90 right triangle. Since the altitude has a length of 39√-3, it follows from the
properties of 30-60-90 right triangles that the side across from each 30^(°) angle has a length of 39 and each hypotenuse has a length of 2(39), or
78. Therefore, each side of the equilateral triangle has a length of 78. In equilateral triangles, all three sides have equal length. Therefore, the
perimeter of this equilateral triangle is 78 + 78 + 78, or 234.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-64c1f044$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$easy$qb$::difficulty_level, null, $qb$? ??^(X°)
2?
N0te: FigurenotdraWnt0SCaIe·
In the triangle shown, what is the value of tan x^(?)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-64c1f044.png$qb$, $qb$[{"label": "A", "body": "1/26"}, {"label": "B", "body": "19/26"}, {"label": "C", "body": "26/7"}, {"label": "D", "body": "33/7"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The tangent of an acute angle in a right triangle is defined as the ratio of the length of the side opposite the angle to the
length of the shorter side adjacent to the angle. In the triangle shown, the length of the side opposite the angle with measure x^(?) is 26 units and
the length of the side adjacent to the angle with measure x^(°) is 7 units. Therefore, the value of tanx^(°) is 26/7.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-2f7c92ad$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A?B -???C?
N0te: Figuren0tdraWnt0SCaIe·
In the figure shown, triangle CAE is similar to triangle CBD. The measure of angle CBD is 57^(°), and AE = 26(BD) . What is the measure of
angle CAE?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2f7c92ad.png$qb$, $qb$[{"label": "A", "body": "(26 · 57)^(°)"}, {"label": "B", "body": "(26 + 57)^(°)"}, {"label": "C", "body": "57^(°)"}, {"label": "D", "body": "26^(?)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that triangle CAE is similar to triangle CBD. Corresponding angles in similar triangles have equal measure.
Angle BCD and angle ACE represent the same angle. It follows that angle BCD and angle ACE have equal measure and are corresponding
angles. It's given in the figure that angle BDC and angle AEC are right angles and therefore have equal measure. It follows that angle BDC
and angle AEC are corresponding angles. Therefore, angle CBD and angle CAE are corresponding angles and have equal measure. It's given
that the measure of angle CBD is 57^(°), so the measure of angle CAE is 57^(°).
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-c447367f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle in the xy-plane has its center at (19, 18) and has a radius of 9k. Which equation represents this circle?$qb$, null, $qb$[{"label": "A", "body": "(x - 19)^(2) + (y - 18)^(2) = 81k"}, {"label": "B", "body": "(x - 19)^(2) + (y - 18)^(2) = 81k^(2)"}, {"label": "C", "body": "(x - 19)^(2) + (y - 18)^(2) = 9k"}, {"label": "D", "body": "(x - 19)^(2) + (y - 18)^(2) = 9k^(2)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The equation of a circle in the xy-plane can be written as (x - h)^(2) + (y - k)^(2) = r^(2), where the center of the circle is (h, k)
and the radius of the circle is r. It’s given that this circle has a center at  and a radius of 9k. Substituting 19 for h, 18 for k, and 9k for r
in (x - h)^(2) + (y - k)^(2) = r^(2)(x - 19)2 + ((xy-- 1198))^(2)2 += (8y1-k218)^(2) = (9k)^(2)(19^(,) 18) yields , or (x - 19)^(2) + (y - 18)^(2) = 81k^(2). Therefore, the equation that
represents this circle is .
Choice A is incorrect. This equation represents a circle with radius 9√-?, not 9k.
Choice C is incorrect. This equation represents a circle with radius √-9k, not 9k.
Choice D is incorrect. This equation represents a circle with radius √-9k, not 9k.$qb$);
select seed_pool_question($qb$CB-b2528e6b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$1012II112468004466222288?-/(-| 222| | 444| | 666| | 888| | 10II00| | 12II22| | 14II44|)| | ?| | | | ??| | | | | | | | | |x
The three points shown define a circle. The circumference of this circle is kπ, where k is a constant. What is the value of k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b2528e6b.png$qb$, null, null, array[$qb$8$qb$]::text[], $qb$The correct answer is 8. It's given that the three points shown define a circle, so the center of that circle is an equal distance from each of the
three points. The point (6, 6) is halfway between the points (6, 2) and , and is a distance of 4 units from each of those two points. The
((66,,160))
point (6, 6) is also a distance of 4 units from (2, 6) . Because the point is the same distance from all three points shown, it must be the
center of the circle. Since that distance is 4, it follows that the radius of the circle is 4. The circumference of a circle with radius r is equal to 2πr.
It follows that the circumference of the given circle is 2π(4), or 8π. It's given that the circumference of the circle is kπ. Therefore, the value of k
is 8.$qb$);
select seed_pool_question($qb$CB-9fec9d49$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The floor of a ballroom has an area of 600 square meters. An architect creates a scale model of the floor of the ballroom, where the length of
each side of the model is 1/1o times the length of the corresponding side of the actual floor of the ballroom. What is the area, in square meters, of
the scale model?$qb$, null, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "10"}, {"label": "C", "body": "60"}, {"label": "D", "body": "150"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the length of each side of a scale model is 1/10 times the length of the corresponding side of the actual floor of
a ballroom. Therefore, the area of the scale model is ( 1/10 ) 2, or 1/10o , times the area of the actual floor of the ballroom. It’s given that the area of
the floor of the ballroom is 600 square meters. Therefore, the area, in square meters, of the scale model is (1/100) (600) , or 6.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ba8ca563$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A cube has a volume of 474,552 cubic units. What is the surface area, in square units, of the cube?$qb$, null, null, null, array[$qb$36504$qb$]::text[], $qb$The correct answer is 36,504. The volume of a cube can be found using the formula V = s3 , where s represents the edge length of a cube. It’s
given that this cube has a volume of 474,552 cubic units. Substituting 474,552 for V in V = s3 yields 474,552 = s^(3) . Taking the cube root of
both sides of this equation yields 78 = s. Thus, the edge length of the cube is 78 units. Since each face of a cube is a square, it follows that
each face has an edge length of 78 units. The area of a square can be found using the formula A = s2. Substituting 78 for s in this formula
yields A = 78^(2), or A = 6,084. Therefore, the area of one face of this cube is 6,084 square units. Since a cube has 6 faces, the surface area, in
square units, of this cube is 6(6,084) , or 36,504.$qb$);
select seed_pool_question($qb$CB-5011b039$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the radius of the circle in the xy-plane defined by (x + 2)^(2) + (y + 5)^(2) = 169?$qb$, null, null, null, array[$qb$13$qb$]::text[], $qb$The correct answer is 13. The equation of a circle in the xy-plane can be written in the form , where (h, k) is the
(^(x) - h)^(2) +(x(y+-2k)^(2))^(2)+=(y^(r2)+ 5)^(2) = 169
center of the circle and r is the radius of the circle. It’s given that the circle in the xy-plane is defined by . Therefore,
r^(2) = 169. Taking the positive square root of both sides of this equation yields r = 13. Thus, the radius of the circle is 13.$qb$);
select seed_pool_question($qb$CB-9d078710$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$ℓ
?
(?^(°))/(X^(°))(40^(°))/(?^(°) ?^(°))?
?
N0te: FigurenotdraWnt0SCa1e·
In the figure shown, line ℓ intersects lines j and k. Which additional piece of information is sufficient to prove that lines j and k are parallel?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9d078710.png$qb$, $qb$[{"label": "A", "body": "w = 40"}, {"label": "B", "body": "x = 140"}, {"label": "C", "body": "y = 40"}, {"label": "D", "body": "z = 140"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. In the figure shown, lines j and k are parallel if and only if a pair of corresponding angles are congruent. It's given that one
angle has a measure of 40^(°) and that the corresponding angle has a measure of w^(°). Therefore, w = 40 is sufficient to prove that lines j and k
are parallel.
Choice B is incorrect. The angle measuring x^(°) and the angle measuring 40^(°) are alternate interior angles. Thus, if lines j and k are parallel, x is
equal to 40, not 140.
Choice C is incorrect. The angle measuring y? and the angle measuring 40^(°) are vertical angles. Thus, y = 40, whether lines j and k are parallel
or not.
Choice D is incorrect. The angle measuring z^(?) is supplementary to the angle measuring 40^(°). Thus, z = 180 - 40, or z = 140, whether lines j
and k are parallel or not.$qb$);
select seed_pool_question($qb$CB-b1e1c2f5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In right triangle ABC, angle C is the right angle and BC = 162. Point D on side AB is connected by a line segment with point E on side AC
such that line segment DE is parallel to side BC and CE = 2AE. What is the length of line segment DE?$qb$, null, null, null, array[$qb$54$qb$]::text[], $qb$The correct answer is 54. It’s given that in triangle ABC, point D on side AB is connected by a line segment with point E on side AC such that
line segment DE is parallel to side BC. It follows that parallel segments DE and BC are intersected by sides AB and AC. If two parallel
segments are intersected by a third segment, corresponding angles are congruent. Thus, corresponding angles C and AED are congruent and
corresponding angles B and ADE are congruent. Since triangle ADE has two angles that are each congruent to an angle in triangle ABC,
triangle ADE is similar to triangle ABC by the angle-angle similarity postulate, where side DE corresponds to side BC, and side AE
corresponds to side AC. Since the lengths of corresponding sides in similar triangles are proportional, it follows that . Since point E
AE + C DE/(EBC=) =A AE/CAC
lies on side ACAE + CE = AC, . It's given that CE = 2AE. Substituting 2AE for CE in the equation  yields AE
+ 2AE = AC, or 3AE = AC. It’s given that BC = 162. Substituting 162 for BC and 3AE for AC in the equation  yields (?E)/162
DE/(D^(B)CE) = 5AE/A4C
= AE/3AE , or DE/162 = 1/3 . Multiplying both sides of this equation by 162 yields DE = 54. Thus, the length of line segment  is .$qb$);
select seed_pool_question($qb$CB-e3158182$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Acute angle P has a measure of p radians, and acute angle T has a measure of t radians. The function g is defined by g(x) = p(8)^(x) + 6t. If
Sinp = coSt, which of the following represents the value g(0) in terms of t?$qb$, null, $qb$[{"label": "A", "body": "6t + π"}, {"label": "B", "body": "6t"}, {"label": "C", "body": "5t + π"}, {"label": "D", "body": "5t + π/2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that acute angle P has a measure of p radians and that acute angle T has a measure of t radians. If Sinp = c0St,
it follows that , or . It’s also given that function g is defined by . To determine the value of  in
p + t = ?/(0^(2)) g(x) =g(p0()8=)^(x) + 6t g(((?0)/2)- t)(1)
terms of t, substituting  for g(p0)==?/2?/2?/2---ttt + 6tx and  for p in the equation g(x) = p(8)^(x) + 6t yields (?/2 - t) (8)o + 6t, or g(0) =
+ 6t. This is equivalent to , or g(0) = 5t + ?/2 . Therefore, 5t + π/2 represents the value of g(0) in terms of t.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-267f82b5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A circle in the xy-plane has the equation (x - 19)^(2) + (y - 17)^(2) = 64k^(2) , where k is a positive constant. Which of the following gives the center
of the circle and its radius?$qb$, null, $qb$[{"label": "A", "body": "The center is at (19, 17) , and the radius is 8."}, {"label": "B", "body": "The center is at (19, 17) , and the radius is 8k."}, {"label": "C", "body": "The center is at (19, 17) , and the radius is 64."}, {"label": "D", "body": "The center is at (19, 17) , and the radius is 64k."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The equation of a circle in the xy-plane can be written as , where the center of the circle is (h,p)
(^(x) - h)^(2) +(x(y--19p))^(22)+=(^(r)y^(2)- 17)^(2) = 64k^(2)
and the radius of the circle is r. It’s given that the circle in the xy-plane has the equation , where k is a positive
constant. It follows that h = 19p = 17, , and r2 = 64k2. Taking the positive square root of each side of r2 = 64k2 yields r = 8k. Therefore,
the center of the circle is at (19, 17) and the radius is 8k.
Choice A is incorrect. This circle has the equation (x - 19)^(2) + (y - 17)^(2) = 64, not (x - 19)^(2) + (y - 17)^(2) = 64k^(2) .
Choice C is incorrect. This circle has the equation (x - 19)^(2) + (y - 17)^(2) = 4,096, not (x - 19)^(2) + (y - 17)^(2) = 64k^(2).
Choice D is incorrect. This circle has the equation (x - 19)^(2) + (y - 17)^(2) = 4,096k^(2), not (x - 19)^(2) + (y - 17)^(2) = 64k^(2) .$qb$);
select seed_pool_question($qb$CB-0d43db90$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The perimeter of triangle ABC is 17 inches, the length of side AB is 4 inches, and the length of side AC is 7 inches. What is the length, in
inches, of side BC?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "6"}, {"label": "C", "body": "7"}, {"label": "D", "body": "11"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The perimeter of a triangle is the sum of the lengths of all three sides of the triangle. It’s given that the lengths of side AB
and side AC are 4 inches and 7 inches, respectively. Let x represent the length, in inches, of side BC. The sum of the lengths, in inches, of all
three sides of triangle ABC can be represented by the expression 4 + 7 + x. Since it’s given that the perimeter of triangle ABC is 17 inches, it
follows that 17 = 4 + 7 + x, or 17 = 11 + x. Subtracting 11 from both sides of this equation yields 6 = x. Therefore, the length, in inches, of
side BC is 6.
Choice A is incorrect. This is the length, in inches, of side AB.
Choice C is incorrect. This is the length, in inches, of side AC.
Choice D is incorrect. This is the sum of the lengths, in inches, of sides AB and AC.$qb$);
select seed_pool_question($qb$CB-62d39eb8$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the radius of the circle in the xy-plane defined by (x + 3)^(2) + (y + 5)^(2) = 289?$qb$, null, null, null, array[$qb$17$qb$]::text[], $qb$The correct answer is 17. The equation of a circle in the xy-plane can be written in the form , where (h, k) is the
(^(x) - h)^(2) +(x(y+-3k)^(2))^(2)+=(y^(r2)+ 5)^(2) = 289
center of the circle and r is the radius of the circle. It's given that the circle in the xy-plane is defined by . Therefore,
r^(2) = 289. Taking the positive square root of both sides of this equation yields r = 17. Thus, the radius of the circle is 17.$qb$);
select seed_pool_question($qb$CB-94f7c9e2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?N0tc: Figuren1ot8draWnt0SCaIe· ???
?
In triangle QRS shown, QR < RS. Which expression represents the length of --QS?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-94f7c9e2.png$qb$, $qb$[{"label": "A", "body": "18c0SQ"}, {"label": "B", "body": "18SinQ"}, {"label": "C", "body": "18/c08Q"}, {"label": "D", "body": "18/8inQ"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The figure shows that triangle QRS is a right triangle. Each of the given choices is an expression containing SinQ or coSQ.
For an acute angle in a right triangle, the sine of the angle is the length of the opposite leg divided by the length of the hypotenuse, and the cosine
of the angle is the length of the adjacent leg divided by the length of the hypotenuse. It follows that  and c0S Q = QR/QS , where QR
Sin Q = RS/QRSS
< RS. It's given in the figure that the length of side RS is 18. Since only the equation Sin Q = RS/QS contains , an expression representing
QS can be found by substituting 18 for RS in this equation, which yields Sin Q = 18/QS. Multiplying both sides of this equation by QS yields
-QSQS
· SinQ = 18. Dividing both sides of this equation by SinQ yields QS = 18/8inQ . Therefore, the expression 18/8inQ represents the length of .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e0874bc2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table gives the perimeters of similar triangles TUV and XYZ, where -TU corresponds to -XY. The length of -TU is 18.
Perimeter
Triangle 37
TUV/(|-XYZ |)|| || |?
Triangle 333
What is the length of -XY?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e0874bc2.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "18"}, {"label": "C", "body": "55"}, {"label": "D", "body": "162"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that triangle XYZ is similar to triangle ?UV. Therefore, each side of triangle XYZ is k times its corresponding
side of triangle TUV, where k is a constant. It follows that the perimeter of triangle XYZ is k times the perimeter of triangle TUV. It's also
given that --TU corresponds to --XY and the length of --TU is 18. Let x represent the length of --XY. It follows that x = 18k. The table shows that
the perimeters of triangles TUV and XYZ are 37 and 333, respectively. It follows that 333 = 37k, or 9 = k. Substituting 9 for k in the
equation x = 18k yields x = (18)(9) , or x = 162. Therefore, the length of --XY is 162.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the length of --TU, not the length of --XY.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a4bd60a3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The perimeter of an equilateral triangle is 624 centimeters. The height of this triangle is k√-3 centimeters, where k is a constant. What is the
value of k?$qb$, null, null, null, array[$qb$104$qb$]::text[], $qb$The correct answer is 104. An equilateral triangle is a triangle in which all three sides have the same length and all three angles have a measure
of 60^(°). The height of the triangle, k√-3, is the length of the altitude from one vertex. The altitude divides the equilateral triangle into two
congruent 30-60-90 right triangles, where the altitude is the side across from the 60^(°) angle in each 30-60-90 right triangle. Since the altitude has
a length of k√-3, it follows from the properties of 30-60-90 right triangles that the side across from each 30^(°) angle has a length of k and each
hypotenuse has a length of 2k. In this case, the hypotenuse of each 30-60-90 right triangle is a side of the equilateral triangle; therefore, each
side length of the equilateral triangle is 2k. The perimeter of a triangle is the sum of the lengths of each side. It's given that the perimeter of the
equilateral triangle is 624; therefore, 2k + 2k + 2k = 624, or 6k = 624. Dividing both sides of this equation by 6 yields k = 104.$qb$);
select seed_pool_question($qb$CB-899c6042$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right circular cone has a height of 22 centimeterS (cm) and a base with a diameter of 6 cm. The volume of this cone is nπ cm3 . What is
the value of n?$qb$, null, null, null, array[$qb$66$qb$]::text[], $qb$The correct answer is 66. It’s given that the right circular cone has a height of 22 centimeters  and a base with a diameter of 6 cm. Since
V in(cmcm) 3
the diameter of the base of the cone is 6 cm, the radius of the base is 3 cm. The volume , , of a right circular cone can be found using
the formula V = 1/3 πr2h, where h is the height, in cm, and r is the radius, in cm, of the base of the cone. Substituting 22 for h and 3 for r in
this formula yields V = 1/3π(3)2(22) , or V = 66π. Therefore, the volume of the cone is 66π cm3. It’s given that the volume of the cone is
nπ cm3. Therefore, the value of n is 66.$qb$);
select seed_pool_question($qb$CB-498d6795$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle ABC, angle B is a right angle. The length of side AB is 10√-37 and the length of side BC is 24√-37. What is the length of side
AC?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-498d6795.png$qb$, $qb$[{"label": "A", "body": "14√-37"}, {"label": "B", "body": "26√-37"}, {"label": "C", "body": "34√-37"}, {"label": "D", "body": "√-34 · 37"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The Pythagorean theorem states that for a right triangle, c2 = a2 + b2, where c represents the length of the hypotenuse and
a and b represent the lengths of the legs. It’s given that in triangle ABC, angle B is a right angle. Therefore, triangle ABC is a right triangle,
where the hypotenuse is side AC and the legs are sides AB and BC. It’s given that the lengths of sides AB and BC are 10√-37 and 24√-37,
respectively. Substituting these values for a and b in the formula c2 = a2 + b2 yields c2 = , which is equivalent to c2
(10√-37) 2c+= (±2246√√3(-7))/372
= 100(37) + 576(37), or c^(2) = 676(37) . Taking the square root of both sides of this equation yields . Since c represents the
length of the hypotenuse, side ACc,  must be positive. Therefore, the length of side AC is 26√-37.
Choice A is incorrect. This is the result of solving the equation c = 24√-37 - 10√-37, not c2 = (10√-37)^(2) + (24√-37)^(2).
Choice C is incorrect. This is the result of solving the equation c = 10√-37 + 24√-37, not c2 = (10√-37)^(2) + (24√-37)^(2) .
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-740bf79f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the figure above, what is the length of  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-740bf79f.png$qb$, $qb$[{"label": "A", "body": "2.2"}, {"label": "B", "body": "2.3"}, {"label": "C", "body": "2.4"}, {"label": "D", "body": "2.5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. First,  is the hypotenuse of right , whose legs have lengths 3 and 4. Therefore, , so
and . Second, because  corresponds to  and because  corresponds to ,
is similar to . The ratio of corresponding sides of similar triangles is constant, so . Since  and it’s
given that  and , . Solving for NQ results in , or 2.4.
Choices A, B, and D are incorrect and may result from setting up incorrect ratios.$qb$);
select seed_pool_question($qb$CB-0e40dfb0$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A rectangle has a length of 3 units and a width of 39 units. Which expression gives the area, in square units, of this rectangle?$qb$, null, $qb$[{"label": "A", "body": "2(3 + 39)"}, {"label": "B", "body": "2(3 · 39)"}, {"label": "C", "body": "3 + 39"}, {"label": "D", "body": "3 · 39"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area of a rectangle is given by ℓw, where ℓ is the length of the rectangle and w is the width of the rectangle. It's given
that a rectangle has a length of 3 units and a width of 39 units. It follows that the area of the rectangle is 3 · 39 square units. Therefore, the
expression that gives the area, in square units, of this rectangle, is 3 · 39.
Choice A is incorrect. This expression gives the perimeter, in units, of this rectangle.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-3b225698$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Triangle XYZ is similar to triangle RST such that XY, , and Z correspond to RS, , and T, respectively. The measure of ∠Z is 20^(°) and
2XY = RS. What is the measure of ∠T?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3b225698.png$qb$, $qb$[{"label": "A", "body": "2^(?)"}, {"label": "B", "body": "10^(°)"}, {"label": "C", "body": "20^(°)"}, {"label": "D", "body": "40^(°)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that triangle XYZ is similar to triangle RST, such that XY, , and Z correspond to RS, , and T, respectively.
Since corresponding angles of similar triangles are congruent, it follows that the measure of ∠Z is congruent to the measure of ∠T. It’s given
that the measure of ∠Z is 20^(°). Therefore, the measure of ∠T is 20^(°).
Choice A is incorrect and may result from a conceptual error.
Choice B is incorrect. This is half the measure of ∠Z.
Choice D is incorrect. This is twice the measure of ∠Z.$qb$);
select seed_pool_question($qb$CB-249d3f80$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Point O is the center of a circle. The measure of arc RS on this circle is 100^(?). What is the measure, in degrees, of its associated angle ROS?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-249d3f80.png$qb$, null, null, array[$qb$100$qb$]::text[], $qb$The correct answer is 100. It's given that point O is the center of a circle and the measure of arc RS on the circle is 100^(°). It follows that points
R and S lie on the circle. Therefore,--OR and--OS are radii of the circle. A central angle is an angle formed by two radii of a circle, with its vertex
at the center of the circle. Therefore, ∠ROS is a central angle. Because the degree measure of an arc is equal to the measure of its associated
central angle, it follows that the measure, in degrees, of ∠ROS is 100.$qb$);
select seed_pool_question($qb$CB-fc5ef8d3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The table gives the perimeters of similar triangles TUV and XYZ, where -TU corresponds to -XY. The length of -TU is 6.
Perimeter
Triangle 50
TUV/(|-XYZ |)|| || ||
Triangle 150
What is the length of -XY?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fc5ef8d3.png$qb$, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "6"}, {"label": "C", "body": "18"}, {"label": "D", "body": "56"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that triangle TUV is similar to triangle XYZ, and --?U corresponds to --XY. If two triangles are similar, then the
ratio of their perimeters is equal to the ratio of their corresponding sides. It’s given that the perimeter of triangle TUV is 50, the perimeter of
triangle XYZ is 150, and the length of --TU is 6. Let n represent the length of --XY. It follows that 50/150 = 6/n , or . Multiplying each side of
1/3
this equation by n yields n/3 = 6. Multiplying each side of this equation by 3 yields n = 18. Therefore, the length of  is 18.
Choice A is incorrect. This is the solution to 3/1 = 6/n , not 1/3 = 6/n .
Choice B is incorrect. This is the length of--TU, not--XY.
Choice D is incorrect. This is the sum of the length of--TU and the perimeter of triangle TUV, not the length of--XY.$qb$);
select seed_pool_question($qb$CB-a4c05a1b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$? ?
?
?| X^(?) | ?^(°)
Note: Figuren0tdraWntoSCa1e·
In the figure shown, lines r and s are parallel, and line m intersects both lines. If y < 65, which of the following must be true?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a4c05a1b.png$qb$, $qb$[{"label": "A", "body": "x < 115"}, {"label": "B", "body": "x > 115"}, {"label": "C", "body": "x + y < 180"}, {"label": "D", "body": "x + y > 180"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In the figure shown, the angle measuring y? is congruent to its vertical angle formed by lines s and m, so the measure of the
vertical angle is also y°. The vertical angle forms a same-side interior angle pair with the angle measuring x^(?). It's given that lines r and s are
parallel. Therefore, same-side interior angles in the figure are supplementary, which means the sum of the measure of the vertical angle and the
measure of the angle measuring x^(°) is 180^(?), or x + y = 180. Subtracting x from both sides of this equation yields y = 180 - x. Substituting
180 - x for y in the inequality y < 65 yields 180 - x < 65. Adding x to both sides of this inequality yields 180 < 65 + x. Subtracting 65 from
both sides of this inequality yields 115 < x, or x > 115. Thus, if y < 65, it must be true that x > 115.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. x + y must be equal to, not less than, 180.
Choice D is incorrect. x + y must be equal to, not greater than, 180.$qb$);
select seed_pool_question($qb$CB-38517165$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A circle has a circumference of 31π centimeters. What is the diameter, in centimeters, of the circle?$qb$, null, null, null, array[$qb$31$qb$]::text[], $qb$The correct answer is 31 . The circumference of a circle is equal to 2πr centimeters, where r represents the radius, in centimeters, of the circle,
and the diameter of the circle is equal to 2r centimeters. It's given that a circle has a circumference of 31π centimeters. Therefore, 31π = 2πr.
Dividing both sides of this equation by π yields 31 = 2r. Since the diameter of the circle is equal to 2r centimeters, it follows that the diameter,
in centimeters, of the circle is 31.$qb$);
select seed_pool_question($qb$CB-ebf3a962$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A right circular cylinder has a height of 16 inches and a volume of 3,136π cubic inches. What is the radius, in inches, of this cylinder?$qb$, null, null, null, array[$qb$14$qb$]::text[], $qb$The correct answer is 14. The volume, V, of a right circular cylinder is given by the formula V = πr2h, where r is the radius of the base of the
cylinder and h is the height of the cylinder. It’s given that the right circular cylinder has a height of 16 inches and a volume of 3,136π cubic
inches. Substituting 16 for h and  for V in the formula V = πr2h yields 3,136π = πr^(2) (16) , or 3,136π = 16πr^(2). Dividing both sides of
196 =3,r1236π
this equation by 16π yields . Since r represents the radius of the cylinder, the value of r is positive. Taking the positive square root of
both sides of this equation yields r = 14. Therefore, the radius, in inches, of the cylinder is 14.$qb$);
select seed_pool_question($qb$CB-98c12e38$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Circle K has a radius of 4mi1IimetcrS (mm) . Circle L has an area of 100πmm2 . What is the total area, in mm2, of circles K and L?$qb$, null, $qb$[{"label": "A", "body": "14π"}, {"label": "B", "body": "28π"}, {"label": "C", "body": "56π"}, {"label": "D", "body": "116π"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area, A, of a circle is given by the formula A = πr2 , where r represents the radius of the circle. It’s given that circle K
has a radius of 4miIIimcterS (mm) . Substituting 4 for r in the formula A = πr2 yields , or A = 16π. Therefore, the area of circle
Ai=nπm(m4)22
K is 16πmm2. It’s given that circle L has an area of 100πmm2. Therefore, the total area, , of circles K and L is 16π + 100π, or
116π.
Choice A is incorrect. This is the sum of the radii, in mm, of circles K and L multiplied by π, not the total area, in mm2, of the circles.
Choice B is incorrect. This is the sum of the diameters, in mm, of circles K and L multiplied by π, not the total area, in mm2, of the circles.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-aa2d36fe$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A circle in the xy-plane has the equation (x - 13)^(2) + (y - k)^(2) = 64. Which of the following gives the center of the circle and its radius?$qb$, null, $qb$[{"label": "A", "body": "The center is at (13, k) and the radius is 8."}, {"label": "B", "body": "The center is at (k, 13) and the radius is 8."}, {"label": "C", "body": "The center is at (k, 13) and the radius is 64."}, {"label": "D", "body": "The center is at (13, k) and the radius is 64."}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. For a circle in the xy-plane that has the equation (x - h)^(2) + (y - k)^(2) = r^(2), where h, k, and r are constants, (h, k) is the
center of the circle and the positive value of r is the radius of the circle. In the given equation, h = 13 and r2 = 64. Taking the square root of
each side of r2 = 64 yields r = ±8. Therefore, the center of the circle is at (13, k) and the radius is 8.
Choice B is incorrect. This gives the center and radius of a circle with equation (x - k)^(2) + (y - 13)^(2) = 64, not (x - 13)^(2) + (y - k)^(2) = 64.
Choice C is incorrect. This gives the center and radius of a circle with equation (x - k)^(2) + (y - 13)^(2) = 4,096, not (x - 13)^(2) + (y - k)^(2)
= 64.
Choice D is incorrect. This gives the center and radius of a circle with equation (x - 13)^(2) + (y - k)^(2) = 4,096, not (x - 13)^(2) + (y - k)^(2)
= 64.$qb$);
select seed_pool_question($qb$CB-d3fe472f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Triangle ABC is similar to triangle XYZ, such that AB, , and C correspond to XY, , and Z respectively. The length of each side of triangle
XYZ is 2 times the length of its corresponding side in triangle ABC. The measure of side AB is 16. What is the measure of side XY?$qb$, null, $qb$[{"label": "A", "body": "14"}, {"label": "B", "body": "16"}, {"label": "C", "body": "18"}, {"label": "D", "body": "32"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that triangle ABC is similar to triangle XYZ, such that AB, , and C correspond to XY, , and Z, respectively.
Therefore, side AB corresponds to side XY. Since the length of each side of triangle XYZ is 2 times the length of its corresponding side in
triangle ABC, it follows that the measure of side XY is 2 times the measure of side AB. Thus, since the measure of side AB is 16, then the
measure of side XY is 2(16), or 32.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the measure of side AB, not side XY.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f9d40000$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In △XYZ, the measure of ∠X is 23^(?) and the measure of ∠Y is 66^(?). What is the measure of ∠Z?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f9d40000.png$qb$, $qb$[{"label": "A", "body": "43^(°)"}, {"label": "B", "body": "89^(°)"}, {"label": "C", "body": "91^(°)"}, {"label": "D", "body": "179^(?)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The triangle angle sum theorem states that the sum of the measures of the interior angles of a triangle is 180^(°). It's given that
in △XYZ, the measure of ∠X is 23^(?) and the measure of ∠Y is 66^(?). It follows that the measure of ∠Z is (180 - 23 - 66)^(°), or 91^(°).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the sum of the measures of ∠X and ∠Y, not the measure of ∠Z.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0d3f51dc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$? ? ?
?^(X°) | | 33^(°)
Note: Figuren0tdraWntoSCa1e·
In the figure, line m is parallel to line n, and line t intersects both lines. What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0d3f51dc.png$qb$, $qb$[{"label": "A", "body": "33"}, {"label": "B", "body": "57"}, {"label": "C", "body": "123"}, {"label": "D", "body": "147"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that line m is parallel to line n, and line t intersects both lines. It follows that line t is a transversal. When two lines
are parallel and intersected by a transversal, exterior angles on the same side of the transversal are supplementary. Thus, x + 33 = 180.
Subtracting 33 from both sides of this equation yields x = 147. Therefore, the value of x is 147.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fd8745fc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In triangle JKL, the measures of ∠K and ∠L are each 48^(?). What is the measure of ∠J, in degrees? (Disregard the degree symbol when
entering your answer.)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fd8745fc.png$qb$, null, null, array[$qb$84$qb$]::text[], $qb$The correct answer is 84. The sum of the measures of the interior angles of a triangle is 180^(?). It's given that in triangle JKL, the measures of
∠Kand ∠L are each 48^(°). Adding the measures, in degrees, of ∠K and ∠L gives 48 + 48, or 96. Therefore, the measure of ∠J, in degrees, is
180 - 96, or 84.$qb$);
select seed_pool_question($qb$CB-179edb12$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right circular cone has a height of 22 centimeterS (cm) and a base with a diameter of 18cm. The volume of this cone is nπ cm3. What is
the value of n?$qb$, null, null, null, array[$qb$594$qb$]::text[], $qb$The correct answer is 594. It’s given that the right circular cone has a height of 22 cm and a base with a diameter of 18 cm. Since the diameter
of the base of the cone is 18 cm, the radius of the base is 9 cm. The volume V, in cm3, of a right circular cone can be found using the formula
V = 1/3 πr2h, where h is the height, in cm, of the cone and r is the radius, in cm, of the base of the cone. Substituting 22 for h and 9 for r in this
formula yields V = 1/3π(9)2 (22) , or V = 594π. Therefore, the volume of the cone is 594π cm3 . It’s given that the volume of the cone is
nπ cm3. Therefore, the value of n is 594.$qb$);
select seed_pool_question($qb$CB-b434e103$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In △RST, the measure of ∠R is 63^(°). Which of the following could be the measure, in degrees, of ∠S?$qb$, null, $qb$[{"label": "A", "body": "116"}, {"label": "B", "body": "118"}, {"label": "C", "body": "126"}, {"label": "D", "body": "180"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The sum of the measures of the angles of a triangle is 180^(?). Therefore, the sum of the measures of ∠R ∠S, , and ∠T is
180^(°). It's given that the measure of ∠R is 63^(°). It follows that the sum of the measures of ∠S and ∠T is (180 - 63)^(°), or 117^(°). Therefore, the
measure of ∠S, in degrees, must be less than 117. Of the given choices, only 116 is less than 117. Thus, the measure, in degrees, of ∠S could
be 116.
Choice B is incorrect. If the measure of ∠S is 118^(°), then the sum of the measures of the angles of the triangle is greater than, not equal to, 180^(°).
Choice C is incorrect. If the measure of ∠S is 126^(°), then the sum of the measures of the angles of the triangle is greater than, not equal to, 180
?.
Choice D is incorrect. This is the sum of the measures of the angles of a triangle, in degrees.$qb$);
select seed_pool_question($qb$CB-3e577e4a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle in the xy-plane has its center at (-4, -6). Line k is tangent to this circle at the point (-7, -7) . What is the slope of line k?$qb$, null, $qb$[{"label": "A", "body": "-3"}, {"label": "B", "body": "- 1/3"}, {"label": "C", "body": "1/3"}, {"label": "D", "body": "3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A line that's tangent to a circle is perpendicular to the radius of the circle at the point of tangency. It's given that the circle has
its center at  and line k is tangent to the circle at the point (-7, -7) . The slope of a radius defined by the points (q, r) and (s, t) can
(-4 (^(,)t--r6)/(s-q) )
be calculated as . The points  and (-4, -6) define the radius of the circle at the point of tangency. Therefore, the slope of this
((-6)-((--77))/((-4)-(-7)), -7)
radius can be calculated as , or 1/3 . If a line and a radius are perpendicular, the slope of the line must be the negative reciprocal of the
slope of the radius. The negative reciprocal of 1/3 is -3. Thus, the slope of line k is -3.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the slope of the radius of the circle at the point of tangency, not the slope of line k.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-b5d62bba$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?
L ?? ?
P
Note: Figuren0tdraWntoSCaIe·
In the figure, --LQ intersects --MP at point R, and--LM is parallel to--PQ. The lengths of--MR and--RP are 8 and 14 units, respectively. The area
of △LMR is 36 square units. What is the area of △PQR, in square units?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b5d62bba.png$qb$, $qb$[{"label": "A", "body": "576/49"}, {"label": "B", "body": "144/7"}, {"label": "C", "body": "63"}, {"label": "D", "body": "441/4"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The figure shows that ∠MRL and ∠PRQ are vertical angles. Since vertical angles are congruent, ∠MRL and ∠PRQ
are congruent. It’s given that --LM is parallel to --PQ. The figure also shows that --LQ intersects --LM and --PQ. If two parallel segments are
intersected by a third segment, alternate interior angles are congruent. Thus, ∠MLR and ∠PQR are congruent. Since △LMR and △PQR
have two pairs of congruent angles, the triangles are similar, where --MR in △LMR corresponds to --PR in △PQR. Since the areas of similar
triangles are proportional to the squares of the lengths of corresponding sides, it follows that (arcaof △PQR)/(arca9f △LMR) = ( RP/M1R4 ) 2 . It’s given that the
lengths of --MR and --RP are 8 and 14 units, respectively, and the area of △LMR is 36 square units. Substituting  for RP8,  for MR, and 36
for area of △ LMR in the equation (arcaof ?PQR)/(arcaof ?LMR) = ( RP/MR ) 2 yields , which is equivalent to ,
(area0f ??QR)/36△=P( 14/(Q^(8)R) )=2 36 ( 49/16 ) (area9f ?PQR)/(△ PQ^(3)R^(6) =)(44=1)/4 ( 7/4 ) 2
or . Multiplying each side of this equation by 36 yields area 0f , or area 0f .
(arcaof △PQR)/36 = 49/16△PQR
Therefore, the area of  is 441/4 square units.
Choice A is incorrect. This is the result of multiplying 36 by ( 8/14 ) 2 instead of by ( 14/8 ) 2 .
Choice B is incorrect. This is the result of multiplying 36 by 8/14 instead of by ( 14/8 ) 2.
?
Choice C is incorrect. This is the result of multiplying 36 by 14/8 instead of by ( 14/8 ) 2.$qb$);
select seed_pool_question($qb$CB-62ec6574$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right rectangular prism has a base area of 24t Square centimeterS (cm2 ) . The length of the base of the rectangular prism is 8/3 cm, and
the height of the rectangular prism is 15 cm. Which expression represents the surface area, in cm2 , of the right rectangular prism?$qb$, null, $qb$[{"label": "A", "body": "48t + 160"}, {"label": "B", "body": "318t + 80"}, {"label": "C", "body": "1,968t + 80"}, {"label": "D", "body": "360t"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the base area of the right rectangular prism is 24t cm2 and the length of the base is 8/3 cm. Dividing the base
area by the length yields the width: 24t/(8/3) , or (24t) (3/8) , or 9t cm. It's also given that the height of the prism is 15cm. A right rectangular prism
has two rectangular bases and four rectangular lateral faces. The total area of the two bases is 2(24t) , or 48t cm2 . The four lateral faces
include two with dimensions cm by 15cm and two with dimensions 9t cm by 15 cm. The total area of these four lateral faces is
c 8/m32
, which is equivalent to 80 + 270t cm2. Adding this to the total area of the two bases yields 48t + 270t + 80,
2(8/(3^(3))1)8(t1+5)8+0 2c(m9t2) (15)
or . Thus, the expression, which represents the surface area, in cm2, of the right rectangular prism is 318t + 80.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the volume, in cm3, not the surface area, in cm2.$qb$);
select seed_pool_question($qb$CB-b0dc920d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A manufacturer determined that right cylindrical containers with a height that is 4 inches longer than the radius offer the optimal number of
containers to be displayed on a shelf. Which of the following expresses the volume, V, in cubic inches, of such containers, where r is the radius, in
inches?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-b0dc920d.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The volume, V, of a right cylinder is given by the formula , where r represents the radius of the base of the cylinder
and h represents the height. Since the height is 4 inches longer than the radius, the expression  represents the height of each cylindrical
container. It follows that the volume of each container is represented by the equation . Distributing the expression  into
each term in the parentheses yields .
Choice A is incorrect and may result from representing the height as  instead of . Choice B is incorrect and may result from representing
the height as  instead of . Choice C is incorrect and may result from representing the volume of a right cylinder as  instead of
.$qb$);
select seed_pool_question($qb$CB-2085e10e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In triangle DEF, the measure of angle D is 47^(°) and the measure of angle E is 97^(?). In triangle RST, the measure of angle R is 47^(°) and the
measure of angle S is 97^(°). Which of the following additional pieces of information is needed to determine whether triangle DEF is similar to
triangle RST?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2085e10e.png$qb$, $qb$[{"label": "A", "body": "The measure of angle F"}, {"label": "B", "body": "The measure of angle T"}, {"label": "C", "body": "The measure of angle F and the measure of angle T"}, {"label": "D", "body": "No additional information is needed."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. When two angles of one triangle are congruent to two angles of another triangle, the triangles are similar. It's given that in
triangle DEF, the measure of angle D is 47^(°) and the measure of angle E is 97^(°). It's also given that in triangle RST, the measure of angle R is
47^(°) and the measure of angle S is 97^(?). It follows that angle D is congruent to angle R and that angle E is congruent to angle S. Therefore,
triangle DEF is similar to triangle RST and no additional information is needed.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-689abc2a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Rectangle P has an area of 72 square inches. If a rectangle with an area of 20 square inches is removed from rectangle P, what is the area, in
square inches, of the resulting figure?$qb$, null, $qb$[{"label": "A", "body": "92"}, {"label": "B", "body": "84"}, {"label": "C", "body": "80"}, {"label": "D", "body": "52"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that rectangle P has an area of 72 square inches. If a rectangle with an area of 20 square inches is removed from
rectangle P, the area, in square inches, of the resulting figure is 72 - 20, or 52.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-fa2771d5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Circle A has equation (x - 7)^(2) + (y + 3)^(2) = 1. In the xy-plane, circle B is obtained by translating circle A to the right 4 units. Which equation
represents circle B?$qb$, null, $qb$[{"label": "A", "body": "(x - 7)^(2) + (y + 7)^(2) = 1"}, {"label": "B", "body": "(x - 3)^(2) + (y + 3)^(2) = 1"}, {"label": "C", "body": "(x - 11)^(2) + (y + 3)^(2) = 1"}, {"label": "D", "body": "(x - 7)^(2) + (y - 1)^(2) = 1"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The equation of a circle in the xy-plane can be written as , where the center of the circle is
((x^(x)--7h))^(22)++((yy+-3k))^(22)== 1^(r2) (x - 7)2(+h, (ky)
and the radius of the circle is r units. It’s given that circle A has the equation , which can be written as
- (-3))^(2) = 1^(2). It follows that h = 7, k = -3, and r = 1 . Therefore, the center of circle A is (7, -3) and its radius is 1 unit. If circle A is
translated 4 units to the right, the x-coordinate of the center will increase by 4, while the y-coordinate and the radius of the circle will remain
unchanged. Translating the center of circle A to the right 4 units yields , or . Therefore, the center of circle B is .
(x - h)2 (+7 +(y4-, -k)32) = r(211, -3) ((1x1-, -131))2
Substituting 11 for h, -3 for k, and 1 for r into the equation yields (x - 11)^(2) + (y - (-3))^(2) = 1, or
+ (y + 3)^(2) = 1. Therefore, the equation (x - 11)^(2) + (y + 3)^(2) = 1 represents circle B.
Choice A is incorrect. This equation represents a circle obtained by shifting circle A down, rather than right, 4 units.
Choice B is incorrect. This equation represents a circle obtained by shifting circle A left, rather than right, 4 units.
Choice D is incorrect. This equation represents a circle obtained by shifting circle A up, rather than right, 4 units.$qb$);
select seed_pool_question($qb$CB-bbaac300$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Triangle ABC is similar to triangle DEF, where angle A corresponds to angle D, and angles C and F are right angles. If coS B = 1/22, what is
the value of c0SE?$qb$, null, $qb$[{"label": "A", "body": "1/22"}, {"label": "B", "body": "1/23"}, {"label": "C", "body": "21/22"}, {"label": "D", "body": "22/23"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The cosine of an acute angle in a right triangle is defined as the ratio of the length of the leg adjacent to that angle to the
length of the hypotenuse. It's given that angle C is a right angle in triangle ABC and that angle F is a right angle in triangle DEF. Therefore,
c0SB is equal to the ratio of the length of side BC to the length of side AB, and c0SE is equal to the ratio of the length of side EF to the
length of side DE. It’s also given that triangle ABC is similar to triangle DEF, where angle A corresponds to angle D. Since similar triangles
have proportional side lengths, BC/AB = EF/DE . Therefore, the value of c0SB is equal to the value of coSE. Since c0S B = 1/22 , the value of c0SE is
1/22 .
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-c7bed21d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Quadrilateral P^(?)Q^(?)R^(?)S^(?) is similar to quadrilateral PQRS, where PQ, , R, and S correspond to P^(?) , Q^(?), R^(?), and S^(?) , respectively. The measure
of angle P is 30^(°), the measure of angle Q is 50^(°), and the measure of angle R is 70^(°). The length of each side of P^(?)Q^(?)R^(?)S^(?) is 3 times the
length of each corresponding side of PQRS. What is the measure of angle P^(?) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c7bed21d.png$qb$, $qb$[{"label": "A", "body": "10^(?)"}, {"label": "B", "body": "30^(°)"}, {"label": "C", "body": "40^(°)"}, {"label": "D", "body": "90^(°)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that quadrilateral P^(?)Q^(?)R^(?)S^(?) is similar to quadrilateral PQRS, where PQ, , R, and S correspond to P^(?) , Q^(?) , R^(?) ,
and S^(?), respectively. Since corresponding angles of similar quadrilaterals are congruent, it follows that the measure of angle P is equal to the
measure of angle P^(?). It's given that the measure of angle P is 30^(°). Therefore, the measure of angle P^(?) is 30^(°).
Choice A is incorrect. This is 1/3 the measure of angle P^(?) .
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is 3 times the measure of angle P^(?).$qb$);
select seed_pool_question($qb$CB-fecc446d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A line intersects two parallel lines, forming four acute angles and four obtuse angles. The measure of one of these eight angles is (7x - 250)^(?).
The sum of the measures of four of the eight angles is k^(°). Which of the following could NOT be equivalent to k, for all values of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-fecc446d.png$qb$, $qb$[{"label": "A", "body": "-14x + 1,540"}, {"label": "B", "body": "14x - 320"}, {"label": "C", "body": "-28x + 1,720"}, {"label": "D", "body": "360"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that a line intersects two parallel lines, forming four acute angles and four obtuse angles. Since there are two
parallel lines intersected by a transversal, all four acute angles have the same measure and all four obtuse angles have the same measure.
Additionally, each acute angle is supplementary to each obtuse angle. It’s given that the measure of one of these eight angles is (7x - 250)^(°). It
follows that a supplementary angle has measure , or (-7x + 430)^(?). It’s also given that the sum of the measures of four
(180 - (7x - 2504)()7^(?)x - 250)
of the eight angles is k^(°). It follows that the possible values of k are ; (7x - 250) + 3(-7x + 430) ; 2(7x - 250) + 2(-7x
+ 430) ; 3(7x - 250) + (-7x + 430) ; and 4(-7x + 430). These values are equivalent to 28x - 1,000; -14x + 1,040; 360; 14x - 320;
and -28x + 1,720, respectively. It follows that of the given choices, only -14x + 1,540 could NOT be equivalent to k, for all values of x.
Choice B is incorrect. This is the sum of three angles with measure (7x - 250)^(°) and one angle with measure (-7x + 430)^(°).
Choice C is incorrect. This is the sum of four angles with measure (-7x + 430)^(°).
Choice D is incorrect. This is the sum of two angles with measure (7x - 250)^(°) and two angles with measure (-7x + 430)^(°).$qb$);
select seed_pool_question($qb$CB-69f4bbdc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$??1?^(°) ?°
N0te: FigurenotdraWnt0SCaIe·
In the right triangle shown, what is the value of a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-69f4bbdc.png$qb$, $qb$[{"label": "A", "body": "13"}, {"label": "B", "body": "77"}, {"label": "C", "body": "90"}, {"label": "D", "body": "103"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The triangle shown is a right triangle, where the interior angle shown with a right angle symbol has a measure of 90^(?). It's
shown that the other two interior angles measure 13^(°) and a^(°). The sum of the measures of the interior angles of a triangle is 180^(?); therefore, 90
+ 13 + a = 180. Combining like terms on the left-hand side of this equation yields 103 + a = 180. Subtracting 103 from both sides of this
equation yields a = 77.
Choice A is incorrect. This is the measure, in degrees, of the other acute interior angle of the right triangle, not the value of a.
Choice C is incorrect. This is the measure, in degrees, of the right angle of the right triangle, not the value of a.
Choice D is incorrect. This is the sum of the measures, in degrees, of the other two interior angles of the right triangle, not the value of a.$qb$);
select seed_pool_question($qb$CB-c41eb616$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Two lines intersect at exactly one point, forming two acute angles and two obtuse angles. The measure of one of these angles is (9x - 140)^(°).
Which of the following could NOT be the sum of the measures of any two of these angles?$qb$, null, $qb$[{"label": "A", "body": "(-18x + 280)^(°)"}, {"label": "B", "body": "(-18x + 640)^(°)"}, {"label": "C", "body": "(18x - 280)^(°)"}, {"label": "D", "body": "180^(°)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that two lines intersect at exactly one point, forming two acute angles and two obtuse angles. When two lines
intersect, opposite angles are congruent and adjacent angles are supplementary. It’s given that the measure of one of the angles is (9x - 140)^(°),
so the measure of the opposite angle is (9x - 140)^(°), and the measure of each adjacent angle is , or (-9x + 320)^(°). The
possible sums of the measures of any two of the angles are (9x - 140)^(°)+(9x - 140)^(°), or (-1(81x8x+(-12880208-)0°)(^(°)9^(x) - 140))^(°), (-9x + 320)^(°)+(-9x + 320)^(°), or
(-18x + 640)^(°), and (9x - 140)^(°)+(-9x + 320)^(°), or 180·^(°) Of the given choices, only  is not equivalent to any of these
expressions and could not be the sum of the measures of any two of the angles.
Choice B is incorrect. This is the sum of the measures of two angles that are adjacent to the given angle.
Choice C is incorrect. This is the sum of the measure of the given angle and the measure of its opposite angle.
Choice D is incorrect. This is the sum of the measure of the given angle and the measure of an angle adjacent to the given angle.$qb$);
select seed_pool_question($qb$CB-dfc420b2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the figure above,  intersects  at C. If , what is the value of y ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dfc420b2.png$qb$, $qb$[{"label": "A", "body": "100"}, {"label": "B", "body": "90"}, {"label": "C", "body": "80"}, {"label": "D", "body": "60"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that ; therefore, substituting 100 for x in triangle ABC gives two known angle measures for this triangle.
The sum of the measures of the interior angles of any triangle equals 180°. Subtracting the two known angle measures of triangle ABC from 180°
gives the third angle measure: . This is the measure of angle BCA. Since vertical angles are congruent, the
measure of angle DCE is also 60°. Subtracting the two known angle measures of triangle CDE from 180° gives the third angle measure:
. Therefore, the value of y is 80.
Choice A is incorrect and may result from a calculation error. Choice B is incorrect and may result from classifying angle CDE as a right angle.
Choice D is incorrect and may result from finding the measure of angle BCA or DCE instead of the measure of angle CDE.$qb$);
select seed_pool_question($qb$CB-c8ab85ad$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Which expression represents the area, in square inches, of a square with a side length of 35 inches?$qb$, null, $qb$[{"label": "A", "body": "√-35"}, {"label": "B", "body": "35 + 35"}, {"label": "C", "body": "(4)(35)"}, {"label": "D", "body": "35^(2)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area of a square is given by s2, where s is the length of each side of the square. It’s given that the length of each side of
a square is 35 inches. Substituting 35 for s in the expression s2 yields 35^(2) . Therefore, the expression that represents the area, in square inches,
of the square is 35^(2) .
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect. This expression represents the perimeter, in inches, of the square rather than the area, in square inches.$qb$);
select seed_pool_question($qb$CB-de550be0$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?2I ? ?
N0tc: Figureno?tdraWnt0SCaIe·
For the triangle shown, which expression represents the value of a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-de550be0.png$qb$, $qb$[{"label": "A", "body": "√-21^(2) - 6^(2)"}, {"label": "B", "body": "21^(2) - 6^(2)"}, {"label": "C", "body": "√-21 - 6"}, {"label": "D", "body": "21 - 6"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. For the right triangle shown, the lengths of the legs are a units and 6 units, and the length of the hypotenuse is 21 units. The
Pythagorean theorem states that in a right triangle, the sum of the squares of the lengths of the two legs is equal to the square of the length of
the hypotenuse. Therefore, a2 + 62 = 212 . Subtracting 6^(2) from both sides of this equation yields a2 = 212 - 62. Taking the square root of
both sides of this equation yields a = ±√-21^(2) - 6^(2). Since a is a length, a must be positive. Therefore, a = √-21^(2) - 6^(2). Thus, for the triangle
shown, √-21^(2) - 6^(2) represents the value of a.
Choice B is incorrect. For the triangle shown, this expression represents the value of a2 , not a.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-f2495de4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the value of coS 565π/6?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f2495de4.png$qb$, $qb$[{"label": "A", "body": "1/2"}, {"label": "B", "body": "1"}, {"label": "C", "body": "(√-3)/2"}, {"label": "D", "body": "√-3"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The cosine of an angle is equal to the cosine of  radians more than the angle, where n is an integer constant. Since
cn0(S2(π4)7(2π) + π/6)
is equivalent to 47(2π) + π/6 ,  can be rewritten as , which is equal to c0S ( π/6 ) . Therefore, the value of
565π/(co6S ()565π/6 ) cc0oSS( ((π)/6565π/()6) )
is equal to the value of , which is (√-3)/2 .
Alternate approach: A trigonometric ratio can be found using the unit circle, that is, a circle with radius 1 unit. The cosine of a number t is the x-
coordinate of the point resulting from traveling a distance of t counterclockwise from the point  around a unit circle centered at the origin
47((21π, 0))+ π/6
in the xy-plane. A unit circle has a circumference of 2π. It follows that since 565π/6 is equal to , traveling a distance of 565π/6
counterclockwise around a unit circle means traveling around the circle completely 47 times and then another π/6 beyond that. That is, traveling
565π/6 results in the same point as traveling π/6 . Traveling π/6 counterclockwise from the point (1, 0) around a unit circle centered at the origin in
the xy-plane results in the point ( (√-3)/2 , 1/2 ) . Thus, the value of coS 565π/6 is the x-coordinate of the point ( (√-3)/2 , 1/2 ) , which is (√-3)/2.
Choice A is incorrect. This is the value of Sin 565π/6 , not c0S 565π/6 .
Choice B is incorrect. This is the value of the cosine of a multiple of 2π, not 565π/6 .
Choice D is incorrect. This is the value of 1/(tan (?65π)/6) , not coS 565π/6 .$qb$);
select seed_pool_question($qb$CB-800e71b8$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$??? ? ?N?P
Points MN, , and P lie on the circle shown. On this circle, minor arc MN has a length of 39 centimeters and major arc MPN has a length of
195 centimeters. What is the circumference, in centimeters, of the circle shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-800e71b8.png$qb$, $qb$[{"label": "A", "body": "39"}, {"label": "B", "body": "156"}, {"label": "C", "body": "195"}, {"label": "D", "body": "234"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since the endpoints of minor arc MN and major arc MPN are the same, and the arcs together form a full circle, the sum
of the lengths of these two arcs is equal to the circumference of the circle. It's given that the length of minor arc MN is 39 centimeters and the
length of major arc MPN is 195 centimeters. Therefore, the circumference of the circle, in centimeters, is 39 + 195, or 234.
Choice A is incorrect. This is the length, in centimeters, of minor arc MN, not the circumference, in centimeters, of the circle.
Choice B is incorrect. This is the difference of the lengths of major arc MPN and minor arc MN, in centimeters.
Choice C is incorrect. This is the length, in centimeters, of major arc MPN, not the circumference, in centimeters, of the circle.$qb$);
select seed_pool_question($qb$CB-901e3285$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In triangle ABC, the measure of angle A is . If triangle ABC is isosceles, which of the following is NOT a possible measure of angle B ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-901e3285.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The sum of the three interior angles in a triangle is . It’s given that angle A measures . If angle B measured
, the measure of angle C would be . Thus, the measures of the angles in the triangle would be ,
, and . However, an isosceles triangle has two angles of equal measure. Therefore, angle B can’t measure .
Choice A is incorrect. If angle B has measure , then angle C would measure , and , , and
could be the angle measures of an isosceles triangle. Choice B is incorrect. If angle B has measure , then angle C would measure
, and , , and  could be the angle measures of an isosceles triangle. Choice C is incorrect. If angle B
has measure , then angle C would measure , and , , and  could be the angle measures of an
isosceles triangle.$qb$);
select seed_pool_question($qb$CB-bd7f6e30$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the figure above, . What is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bd7f6e30.png$qb$, $qb$[{"label": "A", "body": "72"}, {"label": "B", "body": "66"}, {"label": "C", "body": "64"}, {"label": "D", "body": "58"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since , it follows that  is an isosceles triangle with base RU. Therefore,  and  are the
base angles of an isosceles triangle and are congruent. Let the measures of both  and  be . According to the triangle sum
theorem, the sum of the measures of the three angles of a triangle is . Therefore, , so .
Note that  is the same angle as . Thus, the measure of  is . According to the triangle exterior angle theorem, an
external angle of a triangle is equal to the sum of the opposite interior angles. Therefore,  is equal to the sum of the measures of
and ; that is, . Thus, the value of x is 64.
Choice B is incorrect. This is the measure of , but  is not congruent to . Choices A and D are incorrect and may result
from a calculation error.$qb$);
select seed_pool_question($qb$CB-2adbf1b1$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?
?
(x^(°))/(-?^(?) ?^(°))?
?
N0te: FigurenotdraWnt0SCa1e·
In the figure, lines m and n are parallel. If x = 6k + 13 and y = 8k - 29, what is the value of z?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2adbf1b1.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "21"}, {"label": "C", "body": "41"}, {"label": "D", "body": "139"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Vertical angles, which are angles that are opposite each other when two lines intersect, are congruent. The figure shows that
lines t and m intersect. It follows that the angle with measure x^(°) and the angle with measure y° are vertical angles, so x = y. It's given that
x = 6k + 13 and y = 8k - 29. Substituting 6k + 13 for x and 8k - 29 for y in the equation x = y yields 6k + 13 = 8k - 29. Subtracting
6k from both sides of this equation yields 13 = 2k - 29. Adding 29 to both sides of this equation yields 42 = 2k, or 2k = 42. Dividing both
sides of this equation by 2 yields k = 21. It's given that lines m and n are parallel, and the figure shows that lines m and n are intersected by a
transversal, line t. If two parallel lines are intersected by a transversal, then the same-side interior angles are supplementary. It follows that the
same-side interior angles with measures y? and z^(°) are supplementary, so y + z = 180. Substituting 8k - 29 for y in this equation yields 8k
- 29 + z = 180. Substituting 21 for k in this equation yields 8 (21) - 29 + z = 180, or 139 + z = 180. Subtracting 139 from both sides of
this equation yields z = 41. Therefore, the value of z is 41.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of k, not z.
Choice D is incorrect. This is the value of x or y, not z.$qb$);
select seed_pool_question($qb$CB-6708546e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Parallelogram ABCD is similar to parallelogram PQRS. The length of each side of parallelogram PQRS is 2 times the length of its
corresponding side of parallelogram ABCD. The area of parallelogram ABCD is 5 square centimeters. What is the area, in square
centimeters, of parallelogram PQRS?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "10"}, {"label": "C", "body": "20"}, {"label": "D", "body": "25"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that parallelogram ABCD is similar to parallelogram PQRS. When two parallelograms are similar, if the scale
factor between their corresponding side lengths is k, the scale factor between their areas is k^(2). It’s given that the length of each side of
parallelogram PQRS is 2 times the length of its corresponding side of parallelogram ABCD, so the scale factor between their corresponding
side lengths is 2. It follows that the scale factor between their areas is 2^(2), or 4. It’s given that the area, in square centimeters, of parallelogram
ABCD is 5. It follows that the area, in square centimeters, of parallelogram PQRS is 5(4) , or 20.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ffe862a3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$An isosceles right triangle has a hypotenuse of length 58 inches. What is the perimeter, in inches, of this triangle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ffe862a3.png$qb$, $qb$[{"label": "A", "body": "29√-2"}, {"label": "B", "body": "58√-2"}, {"label": "C", "body": "58 + 58√-2"}, {"label": "D", "body": "58 + 116√-2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since the triangle is an isosceles right triangle, the two sides that form the right angle must be the same length. Let x be the
length, in inches, of each of those sides. The Pythagorean theorem states that in a right triangle, a2 + b2 = c2 , where c is the length of the
hypotenuse and a and b are the lengths of the other two sides. Substituting x for a x,  for b, and 58 for c in this equation yields x2 + x2 = 582,
or 2x2 = 582. Dividing each side of this equation by 2 yields x2 = (58^(2))/2 , or x2 = (2·58^(2))/4 . Taking the square root of each side of this equation
yields two solutions: x = (58?-2)/2 and x = - (58√-2)/2 . The value of x must be positive because it represents a side length. Therefore, x = (58√-2)/2 , or
x = 29√-2. The perimeter, in inches, of the triangle is 58 + x + x, or 58 + 2x. Substituting 29√-2 for x in this expression gives a perimeter, in
inches, of 58 + 2(29√-2) , or 58 + 58√-2.
Choice A is incorrect. This is the length, in inches, of each of the congruent sides of the triangle, not the perimeter, in inches, of the triangle.
Choice B is incorrect. This is the sum of the lengths, in inches, of the congruent sides of the triangle, not the perimeter, in inches, of the triangle.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-24cec8d1$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle has center O, and points R and S lie on the circle. In triangle ORS, the measure of ∠ROS is 88^(?). What is the measure of ∠RSO, in
degrees? (Disregard the degree symbol when entering your answer.)$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-24cec8d1.png$qb$, null, null, array[$qb$46$qb$]::text[], $qb$The correct answer is 46. It's given that O is the center of a circle and that points R and S lie on the circle. Therefore,--OR and--OS are radii of
the circle. It follows that OR = OS. If two sides of a triangle are congruent, then the angles opposite them are congruent. It follows that the
angles ∠RSO and ∠ORS, which are across from the sides of equal length, are congruent. Let x^(°) represent the measure of ∠RSO. It follows
that the measure of ∠ORS is also x^(°). It's given that the measure of ∠ROS is 88^(°). Because the sum of the measures of the interior angles of a
triangle is 180^(°), the equation x^(?)+x^(°)+88^(°)= 180^(°), or 2x + 88 = 180, can be used to find the measure of ∠RSO. Subtracting 88 from both
sides of this equation yields 2x = 92. Dividing both sides of this equation by 2 yields x = 46. Therefore, the measure of ∠RSO, in degrees, is
46.$qb$);
select seed_pool_question($qb$CB-8c1aa743$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Rectangles ABCD and E?GH are similar. The length of each side of E?GH is 6 times the length of the corresponding side of ABCD. The
area of ABCD is 54 square units. What is the area, in square units, of E?GH?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8c1aa743.png$qb$, $qb$[{"label": "A", "body": "9"}, {"label": "B", "body": "36"}, {"label": "C", "body": "324"}, {"label": "D", "body": "1,944"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area of a rectangle is given by bh, where b is the length of the base of the rectangle and h is its height. Let x represent
the length, in units, of the base of rectangle ABCD, and let y represent its height, in units. Substituting x for b and y for h in the formula bh
yields xy. Therefore, the area, in square units, of ABCD can be represented by the expression xy. It’s given that the length of each side of
E?GH is 6 times the length of the corresponding side of ABCD. Therefore, the length, in units, of the base of E?GH can be represented by
the expression 6x, and its height, in units, can be represented by the expression 6y. Substituting 6x for b and 6y for h in the formula bh yields
(6x)(6y) , which is equivalent to 36xy. Therefore, the area, in square units, of E?GH can be represented by the expression 36xy. It’s given that
the area of ABCD is 54 square units. Since xy represents the area, in square units, of ABCD, substituting 54 for xy in the expression 36xy
yields 36(54), or 1,944. Therefore, the area, in square units, of E?GH is 1,944.
Choice A is incorrect. This is the area of a rectangle where the length of each side of the rectangle is √(-1)/6, not 6, times the length of the
corresponding side of ABCD.
Choice B is incorrect. This is the area of a rectangle where the length of each side of the rectangle is √(-2)/3, not 6, times the length of the
corresponding side of ABCD.
Choice C is incorrect. This is the area of a rectangle where the length of each side of the rectangle is √-6, not 6, times the length of the
corresponding side of ABCD.$qb$);
select seed_pool_question($qb$CB-7268586c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
? ???? 1??^(°) X° ?
N0te: Figuren0t ?ra?ntoSCaIe·
In the triangle shown, PQ = QR. What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7268586c.png$qb$, $qb$[{"label": "A", "body": "156"}, {"label": "B", "body": "66"}, {"label": "C", "body": "48"}, {"label": "D", "body": "24"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The sum of the angle measures of a triangle is 180^(°). It’s given that the measure of angle Q is 132^(°), the measure of angle P
is 24^(°), and the measure of angle R is x^(?). It follows that x + 132 + 24 = 180, or x + 152 = 180. Subtracting 152 from both sides of this
equation yields x = 24.
Alternate approach: It’s given that in the triangle shown, PQ = QR. Thus, triangle PQR is an isosceles triangle. Since base angles of an
isosceles triangle are congruent, the measure of angle P is equal to the measure of angle R. Therefore, the measure of angle R is 24^(?), and the
value of x is 24.
Choice A is incorrect. This is the sum of the measures, in degrees, of angles Q and P, not the measure, in degrees, of angle R.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the sum of the measures, in degrees, of angles P and R, not the measure, in degrees, of angle R.$qb$);
select seed_pool_question($qb$CB-44b2b894$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A rectangle is inscribed in a circle, such that each vertex of the rectangle lies on the circumference of the circle. The diagonal of the rectangle is
twice the length of the shortest side of the rectangle. The area of the rectangle is 1,089√-3 square units. What is the length, in units, of the
diameter of the circle?$qb$, null, null, null, array[$qb$66$qb$]::text[], $qb$The correct answer is 66. It's given that each vertex of the rectangle lies on the circumference of the circle. Therefore, the length of the diameter
of the circle is equal to the length of the diagonal of the rectangle. The diagonal of a rectangle forms a right triangle with the shortest and
longest sides of the rectangle, where the shortest side and the longest side of the rectangle are the legs of the triangle and the diagonal of the
rectangle is the hypotenuse of the triangle. Let s represent the length, in units, of the shortest side of the rectangle. Since it's given that the
diagonal is twice the length of the shortest side, 2s represents the length, in units, of the diagonal of the rectangle. By the Pythagorean theorem,
if a right triangle has a hypotenuse with length c and legs with lengths a and b, then a2 + b2 = c2. Substituting s for a and 2s for c in this
equation yields s2 + b2 = (2s) 2, or s2 + b2 = 4s2 . Subtracting s2 from both sides of this equation yields b2 = 3s2 . Taking the positive square
root of both sides of this equation yields b = s√-3. Therefore, the length, in units, of the rectangle’s longest side is s√-3. The area of a rectangle
is the product of the length of the shortest side and the length of the longest side. The lengths, in units, of the shortest and longest sides of the
rectangle are represented by s and s√-3, and it’s given that the area of the rectangle is 1,089√-3 square units. It follows that 1,089√-3
= s(s√-3) , or 1,089√-3 = s^(2)√-3. Dividing both sides of this equation by √-3 yields 1,089 = s^(2). Taking the positive square root of both sides
of this equation yields 33 = s. Since the length, in units, of the diagonal is represented by 2s, it follows that the length, in units, of the diagonal is
2(33) , or 66. Since the length of the diameter of the circle is equal to the length of the diagonal of the rectangle, the length, in units, of the
diameter of the circle is 66.$qb$);
select seed_pool_question($qb$CB-7700d098$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$One leg of a right triangle has a length of 43·2 millimeters. The hypotenuse of the triangle has a length of 196·8 millimeters. What is the length
of the other leg of the triangle, in millimeters?$qb$, null, $qb$[{"label": "A", "body": "43·2"}, {"label": "B", "body": "120"}, {"label": "C", "body": "192"}, {"label": "D", "body": "201·5"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The Pythagorean theorem states that for a right triangle, the sum of the squares of the lengths of the two legs is equal to the
square of the length of the hypotenuse. It's given that one leg of a right triangle has a length of 43·2 millimeters. It's also given that the
hypotenuse of the triangle has a length of 196·8 millimeters. Let b represent the length of the other leg of the triangle, in millimeters. Therefore,
by the Pythagorean theorem, 43·2^(2) + b^(2) = 196·8^(2), or 1,866·24 + b^(2) = 38,730·24. Subtracting 1,866·24 from both sides of this equation
yields b^(2) = 36,864. Taking the positive square root of both sides of this equation yields b = 192. Therefore, the length of the other leg of the
triangle, in millimeters, is 192.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0837c3b9$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Triangle ABC and triangle DEF are similar triangles, where  and  are corresponding sides. If  and the perimeter of triangle
ABC is 20, what is the perimeter of triangle DEF ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0837c3b9.png$qb$, $qb$[{"label": "A", "body": "10"}, {"label": "B", "body": "40"}, {"label": "C", "body": "80"}, {"label": "D", "body": "120"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since triangles ABC and DEF are similar and , the length of each side of triangle DEF is two times the length of
its corresponding side in triangle ABC. Therefore, the perimeter of triangle DEF is two times the perimeter of triangle ABC. Since the perimeter of
triangle ABC is 20, the perimeter of triangle DEF is 40.
Choice A is incorrect. This is half, not two times, the perimeter of triangle ABC. Choice C is incorrect. This is two times the perimeter of triangle
DEF rather than two times the perimeter of triangle ABC. Choice D is incorrect. This is six times, not two times, the perimeter of triangle ABC.$qb$);
select seed_pool_question($qb$CB-9e44284b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, the graph of  is a circle. What is the radius of the circle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9e44284b.png$qb$, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "6.5"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. One way to find the radius of the circle is to rewrite the given equation in standard form, , where
is the center of the circle and the radius of the circle is r. To do this, divide the original equation, , by 2 to
make the leading coefficients of  and  each equal to 1: . Then complete the square to put the equation in
standard form. To do so, first rewrite  as .
Second, add 2.25 and 0.25 to both sides of the equation: . Since
, , and , it follows that . Therefore,
the radius of the circle is 5.
Choices B, C, and D are incorrect and may be the result of errors in manipulating the equation or of a misconception about the standard form of
the equation of a circle in the xy-plane.$qb$);
select seed_pool_question($qb$CB-4ddfa209$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The length of one side of an equilateral triangle is 28 inches. What is the perimeter, in inches, of this triangle?$qb$, null, $qb$[{"label": "A", "body": "28"}, {"label": "B", "body": "31"}, {"label": "C", "body": "84"}, {"label": "D", "body": "112"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The perimeter of a triangle is the sum of the lengths of the three sides of the triangle. It's given that the length of one side of
an equilateral triangle is 28 inches. Since the lengths of the three sides of an equilateral triangle are equal, it follows that the perimeter, in inches,
of this equilateral triangle is 28 + 28 + 28, or 84.
Choice A is incorrect. This is the length of one side, not the perimeter, of this equilateral triangle.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the perimeter of a square, not an equilateral triangle, with side lengths of 28 inches.$qb$);
select seed_pool_question($qb$CB-98e02472$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In right triangle XYZ, angles X and Z are acute angles. Point R lies on --XZ such that --YR is perpendicular to --XZ. The measure of ∠XZY is
a^(?), the measure of ∠XYR is b^(?), and the length of --XY is 19. If Sin a?= 12/13 , what is the value of taub^(?)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-98e02472.png$qb$, null, null, array[$qb$2.4$qb$, $qb$12/5$qb$]::text[], $qb$The correct answer is 12/5 . It's given that in right triangle XYZ ∠X,  and ∠Z are acute angles. It follows that ∠Y is a right angle. It's given that
point R lies on -XZ such that -YR is perpendicular to -XZ. Since ∠Y is a right angle and is comprised of ∠XYR and ∠ZYR, it follows that
the sum of the measures of ∠XYR and ∠ZYR is 90^(°). It's given that the measure of ∠XYR is b^(°). It follows that the measure of ∠ZYR is
(90 - b)^(°). Since -YR is perpendicular to -XZ, it follows that ∠XRY and ∠ZRY are right angles. It follows that ?XRY and ?ZRY are right
triangles. It's given that the measure of ∠XZY is a^(°). Because the sum of the measures of the interior angles of a triangle is 180^(°), it follows that
the measures of ∠ZRY ∠XZY, , and ∠ZYR have a sum of 180^(?). Since the measure of ∠ZRY is 90^(°), the measure of ∠YZR is a^(?), and the
measure of ∠ZYR is (90 - b)^(°), it follows that 90 + a + 90 - b = 180, or a - b + 180 = 180. Subtracting 180 from both sides of this
equation yields a - b = 0. Adding b to both sides of this equation yields a = b. It's given that Sin a° = 12/13 . Since a = b, it follows that Sinb^(?)
= 12/13 . In a right triangle, the sine of an acute angle is the ratio of the length of the leg opposite the angle to the length of the hypotenuse. It
follows that, for a positive constant k, 12k represents the length of the leg opposite ∠XYR and 13k represents the length of the hypotenuse of
△XRY. The Pythagorean theorem states that in a right triangle, the square of the length of the hypotenuse is equal to the sum of the squares
of the lengths of the other two sides. Let nk represent the length of the leg adjacent to ∠XYR. It follows that (13k)^(2) = (12k)^(2) + (nk)^(2), or
169k^(2) = 144k^(2) + n^(2)k^(2). Subtracting 144k^(2) from both sides of this equation yields 25k2 = n2k2. Taking the positive square root of both sides
of this equation yields 5k = nk. Therefore, the length of the leg adjacent to ∠XYR is 5k. In a right triangle, the tangent of an acute angle is the
ratio of the length of the leg opposite the angle to the length of the leg adjacent to the angle. It follows that tan b?= (12?)/(5?) , or tan b°= 12/5 . Note
that 12/5 and 2.4 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-e6c557f9$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The edge length, in inches, of cube Y is 3/88 the edge length, in inches, of cube X. The surface area, in square inches, of cube Y is n times the
surface area, in square inches, of cube X. What is the value of n?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e6c557f9.png$qb$, $qb$[{"label": "A", "body": "9/(7,744)"}, {"label": "B", "body": "27/(3,872)"}, {"label": "C", "body": "3/88"}, {"label": "D", "body": "9/44"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since all cubes are similar to each other, cube X and cube Y are similar figures. In similar figures, if lengths differ by a scale
factor of k, then areas differ by a scale factor of k^(2). It’s given that the edge length, in inches, of cube Y is 3/88 the edge length, in inches, of cube X.
It follows that the surface area, in square inches, of cube Y is ( 3/88 ) 2, or 9/(7,744) , times the surface area, in square inches, of cube X. Therefore, the
value of n is 9/(7,744) .
Alternate approach: The surface area of a cube is 6s2 , where s is the edge length. Let x represent the edge length, in inches, of cube X.
Substituting x for s in 6s2 yields 6x2 . Therefore, the surface area, in square inches, of cube X can be expressed as 6x2. It’s given that the edge
length, in inches, of cube Y is  the edge length, in inches, of cube X. Therefore, the edge length, in inches, of cube Y can be expressed as
3x/883/88
( 3/88 ) x, or 3x/88 . Substituting  for s in 6s2 yields 6 ( 3x/88 ) 2, which is equivalent to 6 ( 9x2/(7,744) ) , or (27x^(2))/(3,872). Therefore, the surface area, in square
inches, of cube Y can be expressed as . It’s given that the surface area, in square inches, of cube Y is n times the surface area, in square
(27x^(2))/(3,872) (27x^(2))/(=3,8n72() 6x2 )
inches, of cube X. It follows that . Dividing both sides of this equation by 6x2 yields (27x^(2))/(3,872(6x^(2))) = n, which is equivalent to
(27x^(2))/(23,232x^(2)) = n, or 9/(7,744) = n. Therefore, the value of n is 9/(7,744) .
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4a141e77$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
p
(X^(°))/(-72^(°))?
?
N0te: FigurenotdraWntoSCaIe·
In the figure, line p is parallel to line r, and line t intersects both lines. What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4a141e77.png$qb$, $qb$[{"label": "A", "body": "36"}, {"label": "B", "body": "72"}, {"label": "C", "body": "180"}, {"label": "D", "body": "252"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In the figure shown, the angles with measures x^(°) and 72^(°) are vertical angles. Vertical angles have equal measure, so the two
marked angles have equal measure. Therefore, the value of x is 72.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-58687a66$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$ℓ
?
--?x° 175^(°)
?
N0te: FigurenotdraWnt0SCa1e·
In the figure shown, line g is parallel to line h. Line -Math output error intersects both lines. What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-58687a66.png$qb$, null, null, array[$qb$175$qb$]::text[], $qb$The correct answer is 175. It's given that line g is parallel to line h. Since line -Math output error intersects both lines, it's a transversal. The angles
in the figure marked as 175^(°) and x^(?) are on the same side of the transversal, where one is an interior angle with line h as a side, and the other is
an exterior angle with line g as a side, respectively. Thus, the marked angles are corresponding angles. When two parallel lines are intersected by
a transversal, corresponding angles have equal measure. Therefore, the value of x is 175.$qb$);
select seed_pool_question($qb$CB-54df8076$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The perimeter of an equilateral triangle is 852 centimeters. The three vertices of the triangle lie on a circle. The radius of the circle is w√-3
centimeters. What is the value of w?$qb$, null, null, null, array[$qb$284/3$qb$, $qb$94.66$qb$, $qb$94.67$qb$]::text[], $qb$The correct answer is . Since the perimeter of a triangle is the sum of the lengths of its sides, and the given triangle is equilateral, the length
284/2384
of each side is 852/3 , or , centimeters (cm). Right triangle AMO can be formed, where M is the midpoint of one of the triangle’s sides, A is
one of this side’s endpoints, and O is the center of the circle. It follows that AM is 284/2, or 142, cm. Additionally, triangle AMO has angles
measuring 30^(°), 60^(°), and 90^(°), where the measure of angle OMA is 90^(°) and the measure of angle OAM is 30^(°). It follows that the length of side
MO is half the length of hypotenuse AO, and the length of side AM is √-3 times the length of side MO. It’s given that AO = w√-3 cm.
Therefore, MO = (w√-3)/2 cm and AM = (w√-3√-3)/2 cm, which is equivalent to AM = 3w/2 cm. Since AM = 142 cm, it follows that 3w/2 = 142.
Multiplying both sides of this equation by 2 yields 3w = 284. Dividing both sides of this equation by 3 yields w = 284/3 . Note that 284/3, 94.66,
and 94.67 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-014edcb7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$? ?
?? P
Note: FigurenotdraWnt0SCaIe·
In triangle PQR -QR, is extended to point S. The measure of ∠PQR is 132^(°), and the measure of ∠PRS is 163^(°). What is the measure of
∠QPR?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-014edcb7.png$qb$, $qb$[{"label": "A", "body": "48^(°)"}, {"label": "B", "body": "31^(°)"}, {"label": "C", "body": "24^(°)"}, {"label": "D", "body": "17^(?)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In the figure shown, since --QS is a line segment, the sum of the measures of ∠PRS and ∠PRQ is 180^(°). It's given that the
measure of ∠PRS is 163^(°). Thus, the measure of ∠PRQ is (180 - 163)^(°), or 17^(°). The sum of the measures of the interior angles of a triangle
is 180^(°). It's given that the measure of ∠PQR is 132^(?). Therefore, the measure of ∠QPR is (180 - 17 - 132)^(?), or 31^(°).
Choice A is incorrect. This is the measure of the supplement of ∠PQR, not the measure of ∠QPR.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the measure of ∠PRQ, not the measure of ∠QPR.$qb$);
select seed_pool_question($qb$CB-568d66a7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$An isosceles right triangle has a perimeter of 94 + 94√-2 inches. What is the length, in inches, of one leg of this triangle?$qb$, null, $qb$[{"label": "A", "body": "47"}, {"label": "B", "body": "47√-2"}, {"label": "C", "body": "94"}, {"label": "D", "body": "94√-2"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that the right triangle is isosceles. In an isosceles right triangle, the two legs have equal lengths, and the length of
the hypotenuse is √-2 times the length of one of the legs. Let ℓ represent the length, in inches, of each leg of the isosceles right triangle. It
follows that the length of the hypotenuse is ℓ√-2 inches. The perimeter of a figure is the sum of the lengths of the sides of the figure. Therefore,
the perimeter of the isosceles right triangle is ℓ + ℓ + ℓ√-2 inches. It's given that the perimeter of the triangle is inches. It follows
94 + 94√(-22 + √-2) ℓ = 94
that ℓ + ℓ + ℓ√-2 = 94 + 94√-2. Factoring the left-hand side of this equation yields (1 + 1 + √-2) ℓ = 94 + 94√-2, or
+ 94√-2. Dividing both sides of this equation by 2 + √-2 yields ℓ = (94+94√-2)/(2+√-2) . Rationalizing the denominator of the right-hand side of this
equation by multiplying the right-hand side of the equation by (2-√-2)/(2-√-2) yields . Applying the distributive property to the
ℓ = ((94+94√-2) (2-?-2))/(ℓ =(2+√-2) (2-√-2))(188-94√-2+188√-2-94√-4)/(474√-2√/2 -2+2√-2-√-4)
numerator and to the denominator of the right-hand side of this equation yields . This is equivalent to ℓ = (94√-2)/2 , or
ℓ = 47√-2. Therefore, the length, in inches, of one leg of the isosceles right triangle is .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the length, in inches, of the hypotenuse.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-322a6dfe$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Quadrilaterals PQRS and WXYZ are similar, where P, Q, and R correspond to WX, , and Y, respectively. The measure of ∠S is 135^(?),
PS = 45, and WZ = 9. What is the measure of ∠Z?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-322a6dfe.png$qb$, $qb$[{"label": "A", "body": "5^(?)"}, {"label": "B", "body": "27^(°)"}, {"label": "C", "body": "45^(°)"}, {"label": "D", "body": "135^(°)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Corresponding angles in similar figures have equal measure. It's given that quadrilaterals PQRS and WXYZ are similar
and that PQ, , and R correspond to WX, , and Y. It follows that ∠S corresponds to ∠Z. It's also given that the measure of ∠S is 135^(?).
Therefore, the measure of ∠Z is 135^(°).
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect. This is the supplement of the measure of ∠Z, not the measure of ∠Z.$qb$);
select seed_pool_question($qb$CB-0e709a29$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$RS = 440
S? = 384
TR = 584
The side lengths of right triangle RST are given. Triangle RST is similar to triangle UVW, where S corresponds to V and T corresponds to
W. What is the value of tanW?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0e709a29.png$qb$, $qb$[{"label": "A", "body": "48/73"}, {"label": "B", "body": "55/73"}, {"label": "C", "body": "48/55"}, {"label": "D", "body": "55/48"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The hypotenuse of triangle RST is the longest side and is across from the right angle. The longest side length given is 584,
which is the length of side TR. Therefore, the hypotenuse of triangle RST is side TR, so the right angle is angle S. The tangent of an acute
angle in a right triangle is the ratio of the length of the opposite side, which is the side across from the angle, to the length of the adjacent side,
which is the side closest to the angle that is not the hypotenuse. It follows that the opposite side of angle T is side RS and the adjacent side of
angle ? is side ST. Therefore, . Substituting 440 for RS and 384 for ST in this equation yields . This is equivalent
tan T =R RS/(SST^(T)) tan T = 440/384W
to . It’s given that triangle  is similar to triangle UVW, where S corresponds to V and T corresponds to . It follows that R
tan T = 55/48 U
corresponds to . Therefore, the hypotenuse of triangle UVW is side WU, which means . Since the lengths of corresponding
tan Wt=anUV/VWW= RS/(S?)
sides of similar triangles are proportional, RS/(S?) = UV/VW. Therefore, tan W = UV/VW is equivalent to , or tanW = tan ?. Thus,
tan W = 55/48 .
Choice A is incorrect. This is the value of c0SW, not tanW.
Choice B is incorrect. This is the value of SinW, not tanW.
Choice C is incorrect. This is the value of 1/tanW , not tanW.$qb$);
select seed_pool_question($qb$CB-a6097ec2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$easy$qb$::difficulty_level, null, $qb$??^(X°) ??
??
N0te: FigurenotdraWnt0SCaIe·
In the right triangle shown, what is the value of Sinx^(°)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a6097ec2.png$qb$, $qb$[{"label": "A", "body": "1/73"}, {"label": "B", "body": "1o/73"}, {"label": "C", "body": "63/73"}, {"label": "D", "body": "136/73"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The sine of an acute angle in a right triangle is the ratio of the length of the side opposite that angle to the length of the
hypotenuse. In the right triangle shown, it's given that the length of the side opposite the angle with measure x^(°) is 63 units and the length of the
hypotenuse is 73 units. Therefore, the value of Sinx^(°) is 63/73 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e570a99c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In △JKL, the measures of both ∠J and ∠K are equal and the measure of ∠L is 118^(°). What is the measure of ∠J?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e570a99c.png$qb$, $qb$[{"label": "A", "body": "31^(°)"}, {"label": "B", "body": "59^(°)"}, {"label": "C", "body": "62^(°)"}, {"label": "D", "body": "90^(?)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The sum of the measures of the three angles in a triangle is 180^(°). It's given that in △JKL, the measure of ∠L is 118^(°). Let
x represent the measure of ∠J. It's also given that the measures of ∠J and ∠K are equal, so x also represents the measure of ∠K. It follows
that x + x + 118 = 180, or 2x + 118 = 180. Subtracting 118 from both sides of this equation yields 2x = 62. Dividing both sides of this
equation by 2 yields x = 31 . Therefore, the measure of ∠J is 31^(?).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the sum of the measures of ∠J and ∠K, not the measure of ∠J.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5b2b8866$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A rectangular poster has an area of 360 square inches. A copy of the poster is made in which the length and width of the original poster are each
increased by 20%. What is the area of the copy, in square inches?$qb$, null, null, null, array[$qb$2592/5$qb$, $qb$518.4$qb$]::text[], $qb$The correct answer is 518·4. It's given that the area of the original poster is 360 square inches. Let ℓ represent the length, in inches, of the
original poster, and let w represent the width, in inches, of the original poster. Since the area of a rectangle is equal to its length times its width, it
follows that 360 = ℓw. It's also given that a copy of the poster is made in which the length and width of the original poster are each increased
by 20%. It follows that the length of the copy is the length of the original poster plus 20% of the length of the original poster, which is equivalent
to inches. This length can be rewritten as ℓ + 0·2ℓ inches, or 1·2ℓ inches. Similarly, the width of the copy is the width of the original
ℓ + 20/10oℓ20%
poster plus of the width of the original poster, which is equivalent to w + 20/1o0 w inches. This width can be rewritten as w + 0·2w inches, or
1·2w inches. Since the area of a rectangle is equal to its length times its width, it follows that the area, in square inches, of the copy is equal to
(1·2ℓ) (1·2w) , which can be rewritten as . Since 360 = ℓw, the area, in square inches, of the copy can be found by substituting
(1·2)(1·2)(ℓ(1w·2))(1·2)(ℓw)
360 for ℓw in the expression , which yields (1·2)(1·2)(360), or 518·4. Therefore, the area of the copy, in square inches, is
518·4.$qb$);
select seed_pool_question($qb$CB-fc8aa563$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the center of the circle in the xy-plane defined by the equation (x - 1)^(2) + (y + 7)^(2) = 1?$qb$, null, $qb$[{"label": "A", "body": "(-1, -7)"}, {"label": "B", "body": "(-1, 7)"}, {"label": "C", "body": "(1, -7)"}, {"label": "D", "body": "(1, 7)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The equation of a circle in the xy-plane can be written as , where the center of the circle is (h, k)
(^(x) - h)^(2) + (y - k()x^(2) -= 1^(r))^(22) + (y + 7)^(2) = 1
and the radius of the circle is r. It's given that the circle in the xy-plane is defined by the equation . This equation can
be written as . For this equation, it follows that h = 1 and k = -7. Therefore, the center of the circle in the xy-
(x - 1)^(2) + (y - (-7))^(2)(1=, -17)
plane defined by the given equation is .
Choice A is incorrect. This is the center of the circle in the xy-plane that is defined by the equation (x + 1)^(2) + (y + 7)^(2) = 1, not (x - 1)^(2) + (y
+ 7)^(2) = 1.
Choice B is incorrect. This is the center of the circle in the xy-plane that is defined by the equation (x + 1)^(2) + (y - 7)^(2) = 1 , not (x - 1)^(2) + (y
+ 7)^(2) = 1.
Choice D is incorrect. This is the center of the circle in the xy-plane that is defined by the equation (x - 1)^(2) + (y - 7)^(2) = 1, not (x - 1)^(2) + (y
+ 7)^(2) = 1.$qb$);
select seed_pool_question($qb$CB-9f934297$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right rectangular prism has a length of 28 centimeterS (cm), a width of 15cm, and a height of 16cm. What is the surface area, in cm2, of
the right rectangular prism?$qb$, null, null, null, array[$qb$2216$qb$]::text[], $qb$The correct answer is 2,216. The surface area of a prism is the sum of the areas of all its faces. A right rectangular prism consists of six
rectangular faces, where opposite faces are congruent. It's given that this prism has a length of 28cm, a width of 15cm, and a height of
16cm. Thus, for this prism, there are two faces with area (28) (15) cm2 , two faces with area cm2 , and two faces with area
2 (28) (1(52)8+) (216(2)8) (16) + 2 (15) (16)
(15) (16) cm2. Therefore, the surface area, in cm2 , of the right rectangular prism is , or 2,216.$qb$);
select seed_pool_question($qb$CB-2855cb58$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle in the xy-plane has its center at (16, 17) and has a radius of 7k. Which equation represents this circle?$qb$, null, $qb$[{"label": "A", "body": "(x - 16)^(2) + (y - 17)^(2) = 49k"}, {"label": "B", "body": "(x - 16)^(2) + (y - 17)^(2) = 49k^(2)"}, {"label": "C", "body": "(x - 16)^(2) + (y - 17)^(2) = 7k"}, {"label": "D", "body": "(x - 16)^(2) + (y - 17)^(2) = 7k^(2)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The equation of a circle in the xy-plane can be written as (x - h)^(2) + (y - k)^(2) = r^(2) , where the center of the circle is (h, k)
and the radius of the circle is r. It’s given that this circle has a center at  and a radius of 7k. Substituting 16 for h, 17 for k, and 7k for r
in (x - h)^(2) + (y - k)^(2) = r^(2)(x - 16)2 + ((xy-- 1167))^(2)2 += (4y9-k217)^(2) = (7k)^(2)(16^(,) 17) yields , or (x - 16)^(2) + (y - 17)^(2) = 49k^(2). Therefore, the equation that
represents this circle is .
Choice A is incorrect. This equation represents a circle with radius 7√-?, not 7k.
Choice C is incorrect. This equation represents a circle with radius √-7k, not 7k.
Choice D is incorrect. This equation represents a circle with radius √-7k, not 7k.$qb$);
select seed_pool_question($qb$CB-575f1e12$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the area, in square centimeters, of a rectangle with a length of 34 centimeterS (cm) and a width of 29cm?$qb$, null, null, null, array[$qb$986$qb$]::text[], $qb$The correct answer is 986. The area, A, of a rectangle is given by -Math output error, where -Math output error is the length of the rectangle and w
is its width. It’s given that the length of the rectangle is 34 centimeters (cm) and the width is 29 cm. Substituting 34 for -Math output error and 29
for w in the equation -Math output error yields A = (34) (29) , or A = 986. Therefore, the area, in square centimeters, of this rectangle is 986.$qb$);
select seed_pool_question($qb$CB-74d8b897$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An angle has a measure of 9π/20 radians. What is the measure of the angle in degrees?-$qb$, null, null, null, array[$qb$81$qb$]::text[], $qb$The correct answer is 81 . The measure of an angle, in degrees, can be found by multiplying its measure, in radians, by (180de?rcc8)/πradian8 . Multiplying the
given angle measure, 9π/2o radians, by 180degrccS/πradian8 yields ( 9π/20 radianS) ( 180dcgrce8/πradianS ) , which is equivalent to 81 degrees.$qb$);
select seed_pool_question($qb$CB-b4767bef$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The lengths of two sides of a triangle are 4 centimeters and 6 centimeters. If the perimeter of the triangle is 18 centimeters, what is the length, in
centimeters, of the third side of this triangle?$qb$, null, $qb$[{"label": "A", "body": "2"}, {"label": "B", "body": "8"}, {"label": "C", "body": "10"}, {"label": "D", "body": "24"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The perimeter of a triangle is the sum of the lengths of all three of its sides. It's given that the lengths of two sides of a
triangle are 4 centimeters and 6 centimeters. Let x represent the length, in centimeters, of the third side of this triangle. The sum of the lengths,
in centimeters, of all three sides of the triangle can be represented by the expression 4 + 6 + x. Since it’s given that the perimeter of the triangle
is 18 centimeters, it follows that 4 + 6 + x = 18, or 10 + x = 18. Subtracting 10 from both sides of this equation yields x = 8. Therefore, the
length, in centimeters, of the third side of this triangle is 8.
Choice A is incorrect. If the length of the third side of this triangle were 2 centimeters, the perimeter, in centimeters, of the triangle would be 4
+ 6 + 2, or 12, not 18.
Choice C is incorrect. If the length of the third side of this triangle were 10 centimeters, the perimeter, in centimeters, of the triangle would be 4
+ 6 + 10, or 20, not 18.
Choice D is incorrect. If the length of the third side of this triangle were 24 centimeters, the perimeter, in centimeters, of the triangle would be 4
+ 6 + 24, or 34, not 18.$qb$);
select seed_pool_question($qb$CB-ee540927$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$x2 + 58x + y2 = 0
In the xy-plane, the graph of the given equation is a circle. What are the coordinates (x, y) of the center of the circle?$qb$, null, $qb$[{"label": "A", "body": "(0, 29)"}, {"label": "B", "body": "(0, -29)"}, {"label": "C", "body": "(29, 0)"}, {"label": "D", "body": "(-29, 0)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that in the xy-plane, the graph of x2 + 58x + y2 = 0 is a circle. The equation of a circle in the xy-plane can be
written as (x - h)^(2) + (y - k)^(2) = r^(2), where the coordinates of the center of the circle are (h, k) and the radius of the circle is r. By completing
the square, the equation x2 + 58x + y2 = 0 can be rewritten as , or (x^(2) + 58x + 841) + y^(2)
((xx2-+(-582x9)+)2 (58/(+^(2)()y)2-) 0+)2y2==8401+ (58/2)2
= 841. This equation is equivalent to (x + 29)^(2) + y^(2) = 841 , or . Therefore, h is -29 and k is 0, and the
coordinates (x, y) of the center of the circle are (-29, 0) .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-dc71597b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right circular cone has a volume of cubic feet and a height of 9 feet. What is the radius, in feet, of the base of the cone?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-dc71597b.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": "3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The equation for the volume of a right circular cone is . It’s given that the volume of the right circular cone is
cubic feet and the height is 9 feet. Substituting these values for V and h, respectively, gives . Dividing both sides of
the equation by  gives . Dividing both sides of the equation by 9 gives . Taking the square root of both sides results in
two possible values for the radius,  or . Since the radius can’t have a negative value, that leaves  as the only
possibility. Applying the quotient property of square roots, , results in , or .
Choices B and C are incorrect and may result from incorrectly evaluating . Choice D is incorrect and may result from solving
instead of .$qb$);
select seed_pool_question($qb$CB-410bdbe6$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the triangle above, . What is the value of b ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-410bdbe6.png$qb$, $qb$[{"label": "A", "body": "52"}, {"label": "B", "body": "59"}, {"label": "C", "body": "76"}, {"label": "D", "body": "104"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The sum of the measures of the three interior angles of a triangle is 180°. Therefore, . Since it’s given
that , it follows that , or . Dividing both sides of this equation by 2 yields .
Choice B is incorrect and may result from a calculation error. Choice C is incorrect. This is the value of . Choice D is incorrect. This is the
value of .$qb$);
select seed_pool_question($qb$CB-a0cacec1$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$An angle has a measure of 16π/15 radians. What is the measure of the angle, in degrees?-$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a0cacec1.png$qb$, null, null, array[$qb$192$qb$]::text[], $qb$The correct answer is 192. The measure of an angle, in degrees, can be found by multiplying its measure, in radians, by (18odc?rce8)/πradianS. Multiplying
the given angle measure, 16π/15 radianS, by 180dcgrce8/πradian8 yields ( 16π/15 radianS) ( 180dcgrce8/(π radian8) ) , which simplifies to 192 degrees.$qb$);
select seed_pool_question($qb$CB-1b2b20b9$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-(??1012141111II2?6800444466222288)/(-/-888 666 444 222÷222 222 444 666 888)|| || || || || || || || | || || || || || || || || | x
Circle A shown is defined by the equation . Circle B (not shown) has the same radius but is translated 96 units to the right. If
(x - h)2 + (yx-^(2)k+)2(y=-a6)^(2) = 7
the equation of circle B is , where h, k, and a are constants, what is the value of 4a?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1b2b20b9.png$qb$, null, null, array[$qb$28$qb$]::text[], $qb$The correct answer is 28. The equation of a circle in the xy-plane can be written as , where the center of the circle is
(x -x2t+)2 (+y -(y6-)2s=)27= r2
(t, s) and the radius of the circle is r. It’s given that circle A is defined by the equation , which can be written as (x - 0)^(2)
+ (y - 6)^(2) = (√-7)^(2). It follows that r = √-7 and the radius of circle A is √-7. It’s also given that circle B has the same radius as circle A. If the
equation of circle B is , then a = r2 . Substituting √-7 for r in this equation yields a = (√-7)^(2) , or a = 7. It follows
4(x(7-) h)^(2) + (y - k)^(2) = a
that the value of 4a is , or 28.$qb$);
select seed_pool_question($qb$CB-7ce2e728$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For triangles ABC and FGH, angles B and G each measure 51^(°), the length of --AB is 6, and the length of --FG is 18. Which additional piece(s)
of information is(are) sufficient to prove that triangle ABC is similar to triangle FGH?
I. The measure of angle A is equal to the measure of angle F.
II. The measure of angle C is equal to the measure of angle H.
III. The length of--FH is 3 times the length of --AC.$qb$, null, $qb$[{"label": "A", "body": "I is sufficient, II is sufficient, and III is sufficient."}, {"label": "B", "body": "I is sufficient and II is sufficient, but III is not."}, {"label": "C", "body": "II is sufficient and III is sufficient, but I is not."}, {"label": "D", "body": "III is sufficient, but I is not and II is not."}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that in triangles ABC and FGH, angles B and G each measure 51^(?), the length of --ABis 6, and the length of
--FGis 18. For statement I, if the measure of angle A is equal to the measure of angle F, then triangles ABC and FGH have two pairs of
congruent angles, angles A and F and angles B and G. When 2 pairs of angles in 2 triangles are congruent, the triangles are similar, so
statement I is sufficient. For statement II, if the measure of angle C is equal to the measure of angle H, then triangles ABC and FGH have 2
pairs of congruent angles, angles C and H and angles B and G. When 2 pairs of angles in 2 triangles are congruent, the triangles are similar, so
statement II is sufficient. For statement III, if the length of --FHis 3 times the length of --AC, then the ratio of the length of --FHto the length of
--ACis 3. It’s given that the length of --FGis 18 and the length of --ABis 6. Therefore, the ratio of the length of --FG to the length of --ABis also 3,
so there are two pairs of sides in proportion. However, angle B isn’t between sides AB and AC, and angle G isn’t between sides FG and FH.
Since the given angle measures aren’t between the proportional sides, this information isn't sufficient to prove that the triangles are similar.
Therefore, statements I and II are each sufficient, but statement III isn't sufficient.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f811d345$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right triangle has legs with lengths of 24 centimeters and 21 centimeters. If the length of this triangle's hypotenuse, in centimeters, can be
written in the form 3√-d, where d is an integer, what is the value of d?$qb$, null, null, null, array[$qb$113$qb$]::text[], $qb$The correct answer is 113. It's given that the legs of a right triangle have lengths 24 centimeters and 21 centimeters. In a right triangle, the
square of the length of the hypotenuse is equal to the sum of the squares of the lengths of the two legs. It follows that if h represents the length,
in centimeters, of the hypotenuse of the right triangle, h^(2) = 24^(2) + 21^(2) . This equation is equivalent to . Taking the square root of
h =h2 √=-91·,√017/113
each side of this equation yields h = √-1,017. This equation can be rewritten as h = √-9 · 113, or . This equation is equivalent
to h = 3√-113. It's given that the length of the triangle's hypotenuse, in centimeters, can be written in the form 3√-d. It follows that the value of
d is 113.$qb$);
select seed_pool_question($qb$CB-c9931030$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$RS = 20
ST = 48
TR = 52
The side lengths of right triangle RST are given. Triangle RST is similar to triangle UVW, where S corresponds to V and T corresponds to
W. What is the value of tanW?$qb$, null, $qb$[{"label": "A", "body": "5/13"}, {"label": "B", "body": "5/12"}, {"label": "C", "body": "12/13"}, {"label": "D", "body": "12/5"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that right triangle RST is similar to triangle UVW, where S corresponds to V and T corresponds to W. It's given
that the side lengths of the right triangle RST are RS = 20, ST = 48, and TR = 52. Corresponding angles in similar triangles are equal. It
follows that the measure of angle T is equal to the measure of angle W. The hypotenuse of a right triangle is the longest side. It follows that the
hypotenuse of triangle RST is side TR. The hypotenuse of a right triangle is the side opposite the right angle. Therefore, angle S is a right
angle. The adjacent side of an acute angle in a right triangle is the side closest to the angle that is not the hypotenuse. It follows that the
adjacent side of angle T is side ST. The opposite side of an acute angle in a right triangle is the side across from the acute angle. It follows that
the opposite side of angle T is side RS. The tangent of an acute angle in a right triangle is the ratio of the length of the opposite side to the
length of the adjacent side. Therefore, tau T = RS/(S?) . Substituting 20 for RS and 48 for ST in this equation yields tan T = 20/48, or tan ?
= 5/12 . The tangents of two acute angles with equal measures are equal. Since the measure of angle T is equal to the measure of angle W, it
follows that tan T = tan W. Substituting 5/12 for tau T in this equation yields 5/12 = tan W. Therefore, the value of tan W is 5/12.
Choice A is incorrect. This is the value of Sin W.
Choice C is incorrect. This is the value of coS W.
Choice D is incorrect. This is the value of 1/(tan W) .$qb$);
select seed_pool_question($qb$CB-a456f28c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$??^(12)
Note: FigurenotdraWntoSCaIe·
In the figure, two lines intersect at a point. Angle 1 and angle 2 are vertical angles. The measure of angle 1 is 72^(°). What is the measure of angle
2?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a456f28c.png$qb$, $qb$[{"label": "A", "body": "72^(°)"}, {"label": "B", "body": "108^(°)"}, {"label": "C", "body": "144^(°)"}, {"label": "D", "body": "288^(?)"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that angle 1 and angle 2 are vertical angles, and the measure of angle 1 is 72^(°). Vertical angles have equal
measures. Therefore, the measure of angle 2 is 72^(°).
Choice B is incorrect. This is the measure of an angle that is supplementary, not congruent, to angle 1.
Choice C is incorrect. This is the sum of the measures of angle 1 and angle 2.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-9823f279$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$I5
?N0tc: Figuren1ot5draWnt0SCaIeX·^(°) ?
In the triangle shown, what is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-9823f279.png$qb$, null, null, array[$qb$45$qb$]::text[], $qb$The correct answer is 45. An isosceles right triangle has a right angle and two legs of equal length. In the triangle shown, one angle is a right
angle and the two legs each have a length of 15. Thus, the given triangle is an isosceles right triangle. In an isosceles right triangle, the measures
of the two non-right angles are 45^(°). It follows that the value of x is 45.$qb$);
select seed_pool_question($qb$CB-087cdcfd$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the figure, three lines intersect at point P. If  and , what is the value of z ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-087cdcfd.png$qb$, $qb$[{"label": "A", "body": "140"}, {"label": "B", "body": "80"}, {"label": "C", "body": "40"}, {"label": "D", "body": "20"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The angle that is shown as lying between the y° angle and the z° angle is a vertical angle with the x° angle. Since vertical
angles are congruent and , the angle between the y° angle and the z° angle measures 65°. Since the 65° angle, the y° angle, and the z°
angle are adjacent and form a straight angle, it follows that the sum of the measures of these three angles is 180°, which is represented by the
equation . It’s given that y = 75. Substituting 75 for y yields , which can be rewritten as
. Subtracting 140° from both sides of this equation yields . Therefore, .
Choice A is incorrect and may result from finding the value of  rather than z. Choices B and D are incorrect and may result from conceptual
or computational errors.$qb$);
select seed_pool_question($qb$CB-6ae1360d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A circle has a radius of 2·1 inches. The area of the circle is bπ square inches, where b is a constant. What is the value of b?$qb$, null, null, null, array[$qb$4.41$qb$, $qb$441/100$qb$]::text[], $qb$The correct answer is 4·41 . The area, A, of a circle is given by the formula A = πr2, where r is the radius of the circle. It's given that the area of
the circle is bπ square inches, where b is a constant, and the radius of the circle is 2·1 inches. Substituting bπ for A and 2·1 for r in the formula
A = πr2 yields bπ = π(2·1^(2)) . Dividing both sides of this equation by π yields b = 4·41. Therefore, the value of b is 4·41.$qb$);
select seed_pool_question($qb$CB-c88183f7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A rectangle has a length of 13 and a width of 6. What is the perimeter of the rectangle?$qb$, null, $qb$[{"label": "A", "body": "12"}, {"label": "B", "body": "26"}, {"label": "C", "body": "38"}, {"label": "D", "body": "52"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The perimeter of a quadrilateral is the sum of the lengths of its four sides. It's given that the rectangle has a length of 13 and
a width of 6. It follows that the rectangle has two sides with length 13 and two sides with length 6. Therefore, the perimeter of the rectangle is 13
+ 13 + 6 + 6, or 38.
Choice A is incorrect. This is the sum of the lengths of the two sides with length 6, not the sum of the lengths of all four sides of the rectangle.
Choice B is incorrect. This is the sum of the lengths of the two sides with length 13, not the sum of the lengths of all four sides of the rectangle.
Choice D is incorrect. This is the perimeter of a rectangle that has four sides with length 13, not two sides with length 13 and two sides with
length 6.$qb$);
select seed_pool_question($qb$CB-afa3c48b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$ℓ ? ?
?|^(X°) 26^(°) |
Note: Figuren0tdraWntoSCa1e·
In the figure shown, line m is parallel to line n. What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-afa3c48b.png$qb$, $qb$[{"label": "A", "body": "13"}, {"label": "B", "body": "26"}, {"label": "C", "body": "52"}, {"label": "D", "body": "154"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The sum of consecutive interior angles between two parallel lines and on the same side of the transversal is 180 degrees.
Since it's given that line m is parallel to line n, it follows that x + 26 = 180. Subtracting 26 from both sides of this equation yields 154.
Therefore, the value of x is 154.
Choice A is incorrect. This is half of the given angle measure.
Choice B is incorrect. This is the value of the given angle measure.
Choice C is incorrect. This is twice the value of the given angle measure.$qb$);
select seed_pool_question($qb$CB-9ec76b54$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A right triangle has legs with lengths of 28 centimeters and 20 centimeters. What is the length of this triangle's hypotenuse, in centimeters?$qb$, null, $qb$[{"label": "A", "body": "8√-6"}, {"label": "B", "body": "4√-74"}, {"label": "C", "body": "48"}, {"label": "D", "body": "1,184"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The Pythagorean theorem states that in a right triangle, the sum of the squares of the lengths of the two legs is equal to the
square of the length of the hypotenuse. It's given that the right triangle has legs with lengths of 28 centimeters and 20 centimeters. Let c
represent the length of this triangle's hypotenuse, in centimeters. Therefore, by the Pythagorean theorem, 28^(2) + 20^(2) = c^(2) , or 1,184 = c^(2) .
Taking the positive square root of both sides of this equation yields √-1,184 = c, or 4√-74 = c. Therefore, the length of this triangle's
hypotenuse, in centimeters, is 4√-74.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the square of the length of the triangle’s hypotenuse.$qb$);
select seed_pool_question($qb$CB-992f4e93$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the figure above, lines  and k are parallel. What is the value of a ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-992f4e93.png$qb$, $qb$[{"label": "A", "body": "26"}, {"label": "B", "body": "64"}, {"label": "C", "body": "116"}, {"label": "D", "body": "154"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since lines  and k are parallel, corresponding angles formed by the intersection of line j with lines  and k are congruent.
Therefore, the angle with measure a° must be the supplement of the angle with measure 64°. The sum of two supplementary angles is 180°, so a
= 180 – 64 = 116.
Choice A is incorrect and likely results from thinking the angle with measure a° is the complement of the angle with measure 64°. Choice B is
incorrect and likely results from thinking the angle with measure a° is congruent to the angle with measure 64°. Choice D is incorrect and likely
results from a conceptual or computational error.$qb$);
select seed_pool_question($qb$CB-f1747a6a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In triangle ABC, the measure of angle B is 52^(?) and the measure of angle C is 17^(°). What is the measure of angle A?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f1747a6a.png$qb$, $qb$[{"label": "A", "body": "21^(°)"}, {"label": "B", "body": "35^(°)"}, {"label": "C", "body": "69^(°)"}, {"label": "D", "body": "111^(?)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The sum of the angle measures of a triangle is 180^(°). Adding the measures of angles B and C gives 52 + 17 = 69^(?).
Therefore, the measure of angle A is 180 - 69 = 111^(°).
Choice A is incorrect and may result from subtracting the sum of the measures of angles B and C from 90^(°), instead of from 180^(°).
Choice B is incorrect and may result from subtracting the measure of angle C from the measure of angle B.
Choice C is incorrect and may result from adding the measures of angles B and C but not subtracting the result from 180^(°).$qb$);
select seed_pool_question($qb$CB-23c5fcce$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The circle above with center O has a circumference of 36. What is the length of minor arc ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-23c5fcce.png$qb$, $qb$[{"label": "A", "body": "9"}, {"label": "B", "body": "12"}, {"label": "C", "body": "18"}, {"label": "D", "body": "36"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A circle has 360 degrees of arc. In the circle shown, O is the center of the circle and  is a central angle of the circle.
From the figure, the two diameters that meet to form  are perpendicular, so the measure of  is . Therefore, the length of
minor arc  is  of the circumference of the circle. Since the circumference of the circle is 36, the length of minor arc  is
.
Choices B, C, and D are incorrect. The perpendicular diameters divide the circumference of the circle into four equal arcs; therefore, minor arc
is  of the circumference. However, the lengths in choices B and C are, respectively,  and  the circumference of the circle, and the
length in choice D is the length of the entire circumference. None of these lengths is  the circumference.$qb$);
select seed_pool_question($qb$CB-f1c1e971$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The measure of angle R is 2π/3 radians. The measure of angle T is 5π/12 radians greater than the measure of angle R. What is the measure of
angle T, in degrees?-$qb$, null, $qb$[{"label": "A", "body": "75"}, {"label": "B", "body": "120"}, {"label": "C", "body": "195"}, {"label": "D", "body": "390"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that the measure of angle R is  radians, and the measure of angle T is 5π/12 radians greater than the measure of
2π/3 +2π/35π/12
angle R. Therefore, the measure of angle ? is equal to  radians. Multiplying  by  to get a common denominator with 5π/12 yields 8π/12.
2π/3T 4/413π/12
Therefore, 2π/3 + 5π/12 is equivalent to 8π/12 + 5π/12 , or 13π/12 . Therefore, the measure of angle  is  radians. The measure of angle T, in degrees,
can be found by multiplying its measure, in radians, by 180/π . This yields 13π/12 ? 180/π , which is equivalent to 195 degrees. Therefore, the measure
of angle T is 195 degrees.
Choice A is incorrect. This is the number of degrees that the measure of angle T is greater than the measure of angle R.
Choice B is incorrect. This is the measure of angle R, in degrees.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6ab30ce3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Triangle ABC is similar to triangle DEF, where A corresponds to D and C corresponds to F. Angles C and F are right angles. If tan(A)
= √-3 and DF = 125, what is the length of--DE?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6ab30ce3.png$qb$, $qb$[{"label": "A", "body": "125(√-3)/3"}, {"label": "B", "body": "125(√-3)/2"}, {"label": "C", "body": "125√-3"}, {"label": "D", "body": "250"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Corresponding angles in similar triangles have equal measures. It's given that triangle ABC is similar to triangle DEF,
where A corresponds to D, so the measure of angle A is equal to the measure of angle D. Therefore, if tan(A) = √-3, then tan(D) = √-3. It's
given that angles C and F are right angles, so triangles ABC and DEF are right triangles. The adjacent side of an acute angle in a right
triangle is the side closest to the angle that is not the hypotenuse. It follows that the adjacent side of angle D is side DF. The opposite side of
an acute angle in a right triangle is the side across from the acute angle. It follows that the opposite side of angle D is side EF. The tangent of
an acute angle in a right triangle is the ratio of the length of the opposite side to the length of the adjacent side. Therefore, . If
tan(D) t=an(E(DF)/DF) = EF/DF
DF = 125, the length of side EF can be found by substituting √-3 for tan(D) and 125 for DF in the equation , which yields
√-3 = EF/125 . Multiplying both sides of this equation by 125 yields 125√-3 = EF. Since the length of side EF is √-3 times the length of side
DF, it follows that triangle DEF is a special right triangle with angle measures 30^(°), 60^(°), and 90^(°). Therefore, the length of the hypotenuse, --DE,
is 2 times the length of side DF, or . Substituting 125 for DF in this equation yields DE = 2(125) , or DE = 250. Thus, if
DE = 2
tau(A) = √-3 and DF = 125, the length of is 250.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the length of --EF, not --DE.$qb$);
select seed_pool_question($qb$CB-2d521ca9$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The measure of angle Z is 60^(°). What is the measure, in radians, of angle - Z?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-2d521ca9.png$qb$, $qb$[{"label": "A", "body": "1/6 π"}, {"label": "B", "body": "1/3 π"}, {"label": "C", "body": "2/3 π"}, {"label": "D", "body": "1π"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The measure of an angle, in radians, can be found by multiplying its measure, in degrees, by π/180 . It's given that the measure
of angle Z is 60^(°). It follows that the measure, in radians, of angle Z is 60(π/18o) , or 1/3 π.
Choice A is incorrect. This is the measure, in radians, of an angle whose measure is 30^(°), not 60^(°).
Choice C is incorrect. This is the measure, in radians, of an angle whose measure is 120^(?), not 60^(?).
Choice D is incorrect. This is the measure, in radians, of an angle whose measure is 180^(?), not 60^(?).$qb$);
select seed_pool_question($qb$CB-9acd101f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation x^(2) + (y - 1)^(2) = 49 represents circle A. Circle B is obtained by shifting circle A down 2 units in the xy-plane. Which of the
following equations represents circle B?$qb$, null, $qb$[{"label": "A", "body": "(x - 2)^(2) + (y - 1)^(2) = 49"}, {"label": "B", "body": "x^(2) + (y - 3)^(2) = 49"}, {"label": "C", "body": "(x + 2)^(2) + (y - 1)^(2) = 49"}, {"label": "D", "body": "x^(2) + (y + 1)^(2) = 49"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The graph in the xy-plane of an equation of the form (x - h)^(2) + (y - k)^(2) = r^(2) is a circle with center (h, k) and a radius of
length r. It's given that circle A is represented by x^(2) + (y - 1)^(2) = 49, which can be rewritten as x2 + (y - 1)2 = 72 . Therefore, circle A has
center (0, 1) and a radius of length 7. Shifting circle A down two units is a rigid vertical translation of circle A that does not change its size or
shape. Since circle B is obtained by shifting circle A down two units, it follows that circle B has the same radius as circle A, and for each point
(x, y) on circle A, the point (x, y - 2) lies on circle B. Moreover, if  is the center of circle A, then (h, k - 2) is the center of circle B.
(0,(1h-^(,) k2))
Therefore, circle B has a radius of 7 and the center of circle B is , or (0, -1). Thus, circle B can be represented by the equation x2
+ (y + 1)^(2) = 7^(2), or x^(2) + (y + 1)^(2) = 49.
Choice A is incorrect. This is the equation of a circle obtained by shifting circle A right 2 units.
Choice B is incorrect. This is the equation of a circle obtained by shifting circle A up 2 units.
Choice C is incorrect. This is the equation of a circle obtained by shifting circle A left 2 units.$qb$);
select seed_pool_question($qb$CB-e9c5bfb2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$12inB ? C
5i??n ? ??
A ? 10in
N0te: Figuren0tdraWnt0SCaIe·
Rectangles ABCD and QRST shown are similar, where ABC, , , and D correspond to Q, RS, , and ?, respectively. What is the length, in
inches (in) , of--AD?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e9c5bfb2.png$qb$, $qb$[{"label": "A", "body": "60"}, {"label": "B", "body": "24"}, {"label": "C", "body": "17"}, {"label": "D", "body": "10"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that rectangles ABCD and QRST are similar, where A, BC, , and D correspond to QR, , S, and T, respectively.
It follows that --AB corresponds to --QR and --AD corresponds to --QT. If two rectangles are similar, then the lengths of their corresponding sides
are proportional. It’s given in the figure that the length of --AB is 12 inches, the length of --QR is 5 inches, and the length of --QT is 10 inches. If x
is the length, in inches, of --AD, then  is equivalent to x/1o . Therefore, the value of x can be found using the equation 12/5 = x/1o . Multiplying each
12o/512/5= x
side of this equation by 10 yields , or 24 = x. Therefore, the length, in inches, of --ADis 24.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the length, in inches, of --QT, not --AD.$qb$);
select seed_pool_question($qb$CB-f3f06c3a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$X
? ?
N0te: Figuren0t ?ra?nt0SCa1e·
In the rectangle shown, x = 7 centimeters and y = 5 centimeters. What is the area, in square centimeters, of the rectangle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f3f06c3a.png$qb$, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "12"}, {"label": "C", "body": "35"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that x = 7 centimeters and y = 5 centimeters for the rectangle. The area, A, of a rectangle can be found using the
formula Math output error-, where Math output error represents the length and w represents the width. In this rectangle, x represents the length
--
and y represents the width. Substituting 7 for Math output error and 5 for w in the equation yields A = (7) (5) , or A = 35. Therefore, the area
of the rectangle is 35 square centimeters.
Choice A is incorrect. This is the length, not the area, of the rectangle.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-48fb6483$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle XYZ, angle Y is a right angle, point P lies on --XZ, and point Q lies on --YZ such that --PQ is parallel to--XY. If the measure of angle
XZY is 63^(°), what is the measure, in degrees, of angle XPQ?$qb$, null, null, null, array[$qb$153$qb$]::text[], $qb$The correct answer is 153. Since it's given that --PQ is parallel to --XY and angle Y is a right angle, angle ZQP is also a right angle. Angle ZPQ
is complementary to angle XZY, which means its measure, in degrees, is 90 - 63, or 27. Since angle XPQ is supplementary to angle ZPQ,
its measure, in degrees, is 180 - 27, or 153.$qb$);
select seed_pool_question($qb$CB-244ff6c4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$What is the value of tau 92π/3?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-244ff6c4.png$qb$, $qb$[{"label": "A", "body": "-√-3"}, {"label": "B", "body": "- (√-3)/3"}, {"label": "C", "body": "(√-3)/3"}, {"label": "D", "body": "√-3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. A trigonometric ratio can be found using the unit circle, that is, a circle with radius 1 unit. If a central angle of a unit circle in
the xy-plane centered at the origin has its starting side on the positive x-axis and its terminal side intersects the circle at a point (x, y) , then the
value of the tangent of the central angle is equal to the y-coordinate divided by the x-coordinate. There are 2π radians in a circle. Dividing 92π/3 by
2π yields 92/6 , which is equivalent to 15 + 2/3. It follows that on the unit circle centered at the origin in the xy-plane, the angle  is the result of
92π/392π/3
15 revolutions from its starting side on the positive x-axis followed by a rotation through 2π/3 radians. Therefore, the angles  and 2π/3 are
coterminal angles and tau ( 92π/3 ) is equal to . Since 2π/3 is greater than π/2 and less than π, it follows that the terminal side of the angle
6t0a°n ( 2π/3 )
is in quadrant II and forms an angle of π/3 , or , with the negative x-axis. Therefore, the terminal side of the angle intersects the unit circle at the
point (- 1/2 , (√-3)/2 ) . It follows that the value of tan ( 2π/3 ) is ((?-3)/2)/(- 1/2) , which is equivalent to -√-3. Therefore, the value of tan ( 92π/3 ) is -√-3.
Choice B is incorrect. This is the value of 1/(tan ( 92π/3 )) , not tan ( 92π/3 ) .
Choice C is incorrect. This is the value of 1/(tan ( π/3 )) , not tan ( 92π/3 ) .
Choice D is incorrect. This is the value of tan ( π/3 ) , not tan ( 92π/3 ) .$qb$);
select seed_pool_question($qb$CB-a5ff1a96$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, circle M is the graph of the equation (x - 4)^(2) + (y - 5)^(2) = 9. Circle P has the same center as circle M but has a radius that is
twice the radius of circle M. Which equation represents circle P?$qb$, null, $qb$[{"label": "A", "body": "(x - 4)^(2) + (y - 5)^(2) = 18"}, {"label": "B", "body": "(x - 4)^(2) + (y - 5)^(2) = 36"}, {"label": "C", "body": "(x - 8)^(2) + (y - 10)^(2) = 9"}, {"label": "D", "body": "(x - 8)^(2) + (y - 10)^(2) = 18"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. An equation of a circle in the xy-plane can be written as , where (h, k) is the center and r is the
(x(-x4-)2h+)^(2) (+y (-y5-)2k)=^(2)9= r^(2)
radius. It’s given that in the xy-plane, circle M is the graph of the equation , which is equivalent to (x - 4)^(2)
+ (y - 5)^(2) = 3^(2). Therefore, the center of circle M is (4, 5) and the radius of circle M is 3. It’s given that circle P has the same center as circle M
but has a radius that is twice the radius of circle M. Therefore, the center of circle P is  and the radius of circle P is 2(3) , or 6. Substituting 4
(x - 4)2 +(4,(5y)- 5)2 = 62
for h, 5 for k, and 6 for r in the equation (x - h)^(2) + (y - k)^(2) = r^(2) yields , which can be rewritten as (x - 4)^(2)
+ (y - 5)^(2) = 36.
Choice A is incorrect. The graph of this equation has a radius of √-2(3) , not 2(3).
Choice C is incorrect. The graph of this equation has center (8, 10) , not (4, 5), and a radius of 3, not 2(3).
Choice D is incorrect. The graph of this equation has center (8, 10) , not (4, 5), and a radius of √-2(3) , not 2(3) .$qb$);
select seed_pool_question($qb$CB-010243e6$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Triangles PQR and LMN are graphed in the xy-plane. Triangle PQR has vertices P, Q, and R at (4, 5) , (4, 7), and (6, 5), respectively.
Triangle LMN has vertices L, M, and N at (4, 5), (4, 7 + k), and (6 + k, 5) , respectively, where k is a positive constant. If the measure of
∠Q is t^(°), what is the measure of ∠N?$qb$, null, $qb$[{"label": "A", "body": "(90 - (t - k))^(°)"}, {"label": "B", "body": "(90 - (t + k))^(°)"}, {"label": "C", "body": "(90 - t)^(°)"}, {"label": "D", "body": "(90 + k)^(°)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Since P = (4, 5) and Q = (4, 7) , side PQ is parallel to the y-axis and has a length of 2. Since P = (4, 5) and R = (6, 5),
side PR is parallel to the x-axis and has a length of 2. Therefore, triangle PQR is a right isosceles triangle, where ∠P has measure 90^(°) and
∠Q and ∠R each have measure 45^(°). It follows that if the measure of ∠Q is t^(?), then t = 45. Since L = (4, 5) and M = (4, 7 + k), side LM
is parallel to the y-axis and has a length of k + 2. Since L = (4, 5) and N = (6 + k, 5), side LN is parallel to the x-axis and has a length of
k + 2. Therefore, triangle LMN is a right isosceles triangle, where ∠L has measure 90^(°) and ∠M and ∠N each have measure 45^(°). Of the
given choices, only (90 - t)^(?) is equal to 45^(?), so the measure of ∠N is (90 - t)^(?).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-08b7a3f5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A triangular prism has a height of 8 centimeterS (cm) and a volume of 216cm3. What is the area, in cm2, of the base of the prism? (The
volume of a triangular prism is equal to Bh, where B is the area of the base and h is the height of the prism.)$qb$, null, null, null, array[$qb$27$qb$]::text[], $qb$The correct answer is 27. It's given that a triangular prism has a volume of 216 cubic centimcterS (cm3) and the volume of a triangular prism
is equal to Bh, where B is the area of the base and h is the height of the prism. Therefore, 216 = Bh. It's also given that the triangular prism
has a height of 8 cm. Therefore, h = 8. Substituting 8 for h in the equation 216 = Bh yields 216 = B(8) . Dividing both sides of this equation
by 8 yields 27 = B. Therefore, the area, in cm2 , of the base of the prism is 27.$qb$);
select seed_pool_question($qb$CB-1318dfea$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Y
???° ? ?° Z
X
N0te: Figuren0tdraWnt0SCaIe·
In the figure shown, --WZ and --XY intersect at point Q, YQ = 21 , WQ = 70, WX = 60, and XQ = 120. What is the length of --YZ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1318dfea.png$qb$, $qb$[{"label": "A", "body": "18"}, {"label": "B", "body": "36"}, {"label": "C", "body": "120"}, {"label": "D", "body": "200"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that -WZ and -XY intersect at point Q. It follows that ∠WQX and ∠YQZ are vertical angles, which means they
are congruent to each other. The figure shows that ∠W and ∠Y both have a measure of a^(°), so they are congruent to each other. Therefore,
△QWX and △QYZ are similar triangles, where  corresponds to -YQ and -WX corresponds to -YZ. Since the lengths of corresponding
sides in similar triangles are proportional, it follows that YWZ/YQ-Q=YZ/YQ(WX=)/WQ WX/WQ . It's given that , WQ = 70, and WX = 60. Substituting 21 for
YYZQ/21 == 26/71
YQ, 70 for WQ, and 60 for WX in the equation  yields YZ/21 = 60/70 , or . Multiplying each side of this equation by 21 yields
YZ = 18. Therefore, the length of -YZ is 18.
Choice B is incorrect. This is the length of -QZ, not -YZ.
Choice C is incorrect. This is the length of -XQ, not -YZ.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-5733ce30$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the given figure,  extends to point D. If the measure of  is equal to the measure of , what is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5733ce30.png$qb$, $qb$[{"label": "A", "body": "110"}, {"label": "B", "body": "70"}, {"label": "C", "body": "55"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Since  and  form a linear pair of angles, their measures sum to 180°. It’s given that the measure of
is 110°. Therefore, . Subtracting 110° from both sides of this equation gives the measure of  as
70°. It’s also given that the measure of  is equal to the measure of . Thus, the measure of  is also 70°. The measures
of the interior angles of a triangle sum to 180°. Thus, . Combining like terms on the left-hand side of this equation
yields . Subtracting 140° from both sides of this equation yields , or .
Choice A is incorrect. This is the value of the measure of . Choice B is incorrect. This is the value of the measure of each of the other
two interior angles,  and . Choice C is incorrect and may result from an error made when identifying the relationship between
the exterior angle of a triangle and the interior angles of the triangle.$qb$);
select seed_pool_question($qb$CB-0acfddb5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle has center G, and points M and N lie on the circle. Line segments MH and NH are tangent to the circle at points M and N,
respectively. If the radius of the circle is 168 millimeters and the perimeter of quadrilateral GMHN is 3,856 millimeters, what is the distance, in
millimeters, between points G and H?$qb$, null, $qb$[{"label": "A", "body": "168"}, {"label": "B", "body": "1,752"}, {"label": "C", "body": "1,760"}, {"label": "D", "body": "1,768"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that the radius of the circle is 168 millimeters. Since points M and N both lie on the circle, segments GM and
GN are both radii. Therefore, segments GM and GN each have length 168 millimeters. Two segments that are tangent to a circle and have a
common exterior endpoint have equal length. Therefore, segment MH and segment NH have equal length. Let x represent the length of
segment MH. Then x also represents the length of segment NH. It's given that the perimeter of quadrilateral GMHN is 3,856 millimeters.
Since the perimeter of a quadrilateral is equal to the sum of the lengths of the sides of the quadrilateral, 3,856 = 168 + 168 + x + x, or 3,856
= 336 + 2x. Subtracting 336 from both sides of this equation yields 3,520 = 2x, and dividing both sides of this equation by 2 yields
1,760 = x. Therefore, the length of segment MH is 1,760 millimeters. A line segment that's tangent to a circle is perpendicular to the radius of
the circle at the point of tangency. Therefore, segment GM is perpendicular to segment MH. Since perpendicular segments form right angles,
angle GMH is a right angle. Therefore, triangle GMH is a right triangle with legs of length 1,760 millimeters and 168 millimeters, and
hypotenuse GH. By the Pythagorean theorem, if a right triangle has a hypotenuse with length c and legs with lengths a and b, then
a2 + b2 = c2. Substituting 1,760 for a and 168 for b in this equation yields 1,760^(2) + 168^(2) = c^(2), or 3,125,824 = c^(2). Taking the square root
of both sides of this equation yields ?1,768 = c. Since c represents a length, which must be positive, the value of c is 1,768. Therefore, the
length of segment GH is 1,768 millimeters, so the distance between points G and H is 1,768 millimeters.
Choice A is incorrect. This is the distance between points G and M and between points G and N, not the distance between points G and H.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the distance between points M and H and between points N and H, not the distance between points G and H.$qb$);
select seed_pool_question($qb$CB-7a8ad237$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Triangles ABC and DEF are congruent, where A corresponds to D, and B and E are right angles. The measure of angle A is 69^(°). What is the
measure, in degrees, of angle F?$qb$, null, null, null, array[$qb$21$qb$]::text[], $qb$The correct answer is 21 . It's given that triangles ABC and DEF are congruent with angle A corresponding to angle D. Corresponding angles
of congruent triangles are congruent and, therefore, have equal measure. It's given that the measure of angle A is 69^(°). It follows that the
measure of angle D is also 69^(?). It's given that angle E is a right angle. Therefore, the measure of angle E is 90^(°). Let x represent the measure, in
degrees, of angle F. Since the measures of the angles in a triangle sum to 180^(?), it follows that 69 + 90 + x = 180, or 159 + x = 180.
Subtracting 159 from both sides of this equation yields x = 21. Therefore, the measure, in degrees, of angle F is 21.$qb$);
select seed_pool_question($qb$CB-186fdbca$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A circle has a diameter of 12·6 centimeters. What is the radius of the circle, in centimeters?$qb$, null, null, null, array[$qb$6.3$qb$, $qb$63/10$qb$]::text[], $qb$The correct answer is 6·3. The diameter of a circle is equal to 2r, where r represents the radius of the circle. It’s given that a circle has a
diameter of 12·6 centimeters. Therefore, 12·6 = 2r. Dividing both sides of this equation by 2 yields 6·3 = r. It follows that the radius of the
circle, in centimeters, is 6·3. Note that 6.3 and 63/10 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-50774285$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Each base of a right rectangular prism has a length of 19 inches and a width of 8 inches. The prism has a volume of 2,736 cubic inches. What is
the height, in inches, of the prism?$qb$, null, $qb$[{"label": "A", "body": "18"}, {"label": "B", "body": "27"}, {"label": "C", "body": "144"}, {"label": "D", "body": "152"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The volume, V, of a rectangular prism is given by the formula V = ℓwh, where ℓ is the length of the base, w is the width of
the base, and h is the height of the prism. It’s given that each base of a right rectangular prism has a length of 19 inches and a width of 8 inches,
and that the prism has a volume of 2,736 cubic inches. Substituting 19 for ℓ8,  for w, and 2,736 for V in the formula V = ℓwh gives 2,736
= (19)(8)(h) , or 2,736 = 152h. Dividing each side of this equation by 152 yields 18 = h. Therefore, the height, in inches, of the prism is 18.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the area, in square inches, of the base of the prism, not the height, in inches, of the prism.$qb$);
select seed_pool_question($qb$CB-3b4b5b1e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
?
--?X^(°) I33^(°)
?
Note: Figuren0tdraWntoSCa1e·
In the figure, line j is parallel to line k. What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3b4b5b1e.png$qb$, null, null, array[$qb$47$qb$]::text[], $qb$The correct answer is 47. Based on the figure, the angle with measure x^(?) and the angle with measure 133^(?) together form a straight line.
Therefore, these two angles are supplementary, so the sum of their measures is 180^(°). It follows that x + 133 = 180. Subtracting 133 from
both sides of this equation yields x = 47.$qb$);
select seed_pool_question($qb$CB-73e1b793$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Right rectangular prism P is similar to right rectangular prism Q. The volume of prism P is 972 cubic centimeterS (cm3) , and the volume of
prism Q is 36cm3. One edge of prism P has a length of 12cm. What is the length, in cm, of the corresponding edge of prism Q?$qb$, null, null, null, array[$qb$4$qb$]::text[], $qb$The correct answer is 4. It’s given that right rectangular prism P is similar to right rectangular prism Q. Therefore, there is a positive constant k
such that the length of each edge of prism P is k times the length of the corresponding edge of prism Q and the volume of prism P is k^(3) times
the volume of prism Q. It’s given that the volume of prism P is 972cm3 and the volume of prism Q is 36cm3 . It follows that 972 = 36k^(3).
Dividing both sides of this equation by 36 yields , or k3 = 27. Taking the cube root of both sides of this equation yields k = 3. It
972/336 = k3
follows that the length of each edge of prism P is  times the length of the corresponding edge of prism Q. It’s given that one edge of prism P
has a length of 12cm. It follows that 12cm is 3 times the length of the corresponding edge of prism Q. Thus, the length, in cm, of the edge of
prism Q corresponding to the edge of prism P with a length of 12cm is 12/3 , or 4.$qb$);
select seed_pool_question($qb$CB-29e9b28c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?zx y
Note: FigurenotdraWntoSCaIe·
The triangle shown has a perimeter of 22 units. If x = 9 units and y = 7 units, what is the value of z, in units?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-29e9b28c.png$qb$, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "7"}, {"label": "C", "body": "9"}, {"label": "D", "body": "16"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The perimeter of a triangle is the sum of the lengths of its three sides. The triangle shown has side lengths x, y, and z. It's
given that the triangle has a perimeter of 22 units. Therefore, x + y + z = 22. If x = 9 units and y = 7 units, the value of z, in units, can be
found by substituting 9 for x and 7 for y in the equation x + y + z = 22, which yields 9 + 7 + z = 22, or 16 + z = 22. Subtracting 16 from
both sides of this equation yields z = 6. Therefore, if x = 9 units and y = 7 units, the value of z, in units, is 6.
Choice B is incorrect. This is the value of y, in units, not the value of z, in units.
Choice C is incorrect. This is the value of x, in units, not the value of z, in units.
Choice D is incorrect. This is the value of x + y, in units, not the value of z, in units.$qb$);
select seed_pool_question($qb$CB-5b4757df$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle RST, angle T is a right angle, point L lies on --RS, point K lies on --ST, and --LK is parallel to --RT. If the length of--RT is 72 units, the
length of --LK is 24 units, and the area of triangle RS? is 792 square units, what is the length of --KT, in units?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5b4757df.png$qb$, null, null, array[$qb$14.66$qb$, $qb$14.67$qb$, $qb$44/3$qb$]::text[], $qb$The correct answer is 44/3 . It's given that in triangle RS?, angle T is a right angle. The area of a right triangle can be found using the formula A
= 1/2 ℓ1 ℓ2, where A represents the area of the right triangle, ℓ1 represents the length of one leg of the triangle, and ℓ2 represents the length of
the other leg of the triangle. In triangle RST, the two legs are --RT and --ST. Therefore, if the length of --RT is 72 and the area of triangle RST is
792, then 792 = 1/2 (72)(ST) , or . Dividing both sides of this equation by 36 yields 22 = ST. Therefore, the length of --S? is
79 36)(ST)
22. It's also given that point L lies on , point K lies on--ST, and--LK is parallel to--RT. It follows that angle LKS is a right angle. Since
triangles RST and LSK share angle S and have right angles T and K, respectively, triangles RST and LSK are similar triangles. Therefore,
the ratio of the length of--RT to the length of--LK is equal to the ratio of the length of--ST to the length of--SK. If the length of--RT is 72 and the
length of--LK is 24, it follows that the ratio of the length of--R? to the length of--LK is , or 3, so the ratio of the length of--ST to the length of
--SK is 3. Therefore, 22/SK = 3. Multiplying both sides of this equation by SK yields 22 72/(=24)(3)(SK)/KT-. Dividing both sides of this equation by 3
yields 22/3 = SK. Since the length of --ST22, , is the sum of the length of --SK 22/3, , and the length of , it follows that the length of--KT is 22
- 22/3 , or 44/3 . Note that 44/3, 14.66, and 14.67 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-ca2235f6$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle has center O, and points A and B lie on the circle. The measure of arc AB is 45^(?) and the length of arc AB is 3 inches. What is the
circumference, in inches, of the circle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ca2235f6.png$qb$, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "6"}, {"label": "C", "body": "9"}, {"label": "D", "body": "24"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the measure of arc AB is 45^(°) and the length of arc AB is 3 incheS. The arc measure of the full circle is 360^(°).
If x represents the circumference, in inches, of the circle, it follows that . This equation is equivalent to , or 1/8 = 3/x .
x =(45^(°))/(36204^(°)) = (3 iuche8)/(x inchcS) 45/36024=in3/(^(x)c)heS
Multiplying both sides of this equation by 8x yields 1(x) = 3(8) , or . Therefore, the circumference of the circle is .
Choice A is incorrect. This is the length of arc AB.
Choice B is incorrect and may result from multiplying the length of arc AB by 2.
Choice C is incorrect and may result from squaring the length of arc AB.$qb$);
select seed_pool_question($qb$CB-cab8f907$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?N0tc: Figureno?tdraWnt0SCaIe· ? 4
The figure shows the lengths, in units, of two sides of a triangle. What is the area, in square units, of the triangle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cab8f907.png$qb$, $qb$[{"label": "A", "body": "18"}, {"label": "B", "body": "13"}, {"label": "C", "body": "9"}, {"label": "D", "body": "4"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The area, A, of a triangle is given by the formula A = 1/2bh, where b is the length of the base of the triangle and h is the
height of the triangle. In the right triangle shown, the length of the base of the triangle is 9 units, and its height is 4 units. Substituting 9 for b and
4 for h in the formula A = 1/2bh yields A = 1/2 (9) (4) , or A = 18. Therefore, the area of the triangle, in square units, is 18.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the length of the base of the triangle, in units, not the area of the triangle, in square units.
Choice D is incorrect. This is the height of the triangle, in units, not the area of the triangle, in square units.$qb$);
select seed_pool_question($qb$CB-856372ca$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, a circle with radius 5 has center . Which of the following is an equation of the circle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-856372ca.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. An equation of a circle is , where the center of the circle is  and the radius is r. It’s given that
the center of this circle is  and the radius is 5. Substituting these values into the equation gives , or
.
Choice A is incorrect. This is an equation of a circle that has center . Choice C is incorrect. This is an equation of a circle that has center
and radius . Choice D is incorrect. This is an equation of a circle that has radius .$qb$);
select seed_pool_question($qb$CB-cf0d3050$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$c
?
--?1Io^(?X°)
?
Note: Figuren0tdraWntoSCa1e·
In the figure shown, line c intersects parallel lines s and t. What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cf0d3050.png$qb$, null, null, array[$qb$70$qb$]::text[], $qb$The correct answer is 70. Based on the figure, the angle with measure 110^(°) and the angle vertical to the angle with measure x^(?) are same side
interior angles. Since vertical angles are congruent, the angle vertical to the angle with measure x^(°) also has measure x^(°). It’s given that lines s
and t are parallel. Therefore, same side interior angles between lines s and t are supplementary. It follows that x + 110 = 180. Subtracting 110
from both sides of this equation yields x = 70.$qb$);
select seed_pool_question($qb$CB-0bb39de4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Triangles ABC and DEF are congruent, where A corresponds to D, and B and E are right angles. The measure of angle A is 18^(°). What is the
measure of angle F?$qb$, null, $qb$[{"label": "A", "body": "18^(°)"}, {"label": "B", "body": "72^(°)"}, {"label": "C", "body": "90^(°)"}, {"label": "D", "body": "162^(°)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that triangle ABC is congruent to triangle DEF. Corresponding angles of congruent triangles are congruent and,
therefore, have equal measure. It’s given that angle A corresponds to angle D, and that the measure of angle A is 18^(?). It's also given that the
measures of angles B and E are 90^(°). Since these angles have equal measure, they are corresponding angles. It follows that angle C
corresponds to angle F. Let x^(°) represent the measure of angle C. Since the sum of the measures of the interior angles of a triangle is 180^(°), it
follows that 18^(?)+90^(°)+x^(°)= 180^(°), or 108^(?)+x^(?)= 180^(°). Subtracting 108^(°) from both sides of this equation yields x^(°)= 72^(°). Therefore, the
measure of angle C is 72^(°). Since angle C corresponds to angle F, it follows that the measure of angle F is also 72^(°).
Choice A is incorrect. This is the measure of angle D, not the measure of angle F.
Choice C is incorrect. This is the measure of angle E, not the measure of angle F.
Choice D is incorrect. This is the sum of the measures of angles E and F, not the measure of angle F.$qb$);
select seed_pool_question($qb$CB-1be8b6b2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right circular cone has a volume of 71,148π cubic centimeters and the area of its base is 5,929π square centimeters. What is the slant height,
in centimeters, of this cone?$qb$, null, $qb$[{"label": "A", "body": "12"}, {"label": "B", "body": "36"}, {"label": "C", "body": "77"}, {"label": "D", "body": "85"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The volume, V, of a right circular cone is given by the formula V = 1/3 πr2h, where πr2 is the area of the circular base of the
cone and h is the height. It’s given that this right circular cone has a volume of 71,148π cubic centimeters and the area of its base is 5,929π
square centimeters. Substituting 71,148π for V and 5,929π for πr2 in the formula V = 1/3 πr2h yields 71,148π = (1/3) (5,929π)(h). Dividing
each side of this equation by 5,929π yields 12 = h/3 . Multiplying each side of this equation by 3 yields 36 = h. Let s represent the slant height,
in centimeters, of this cone. A right triangle is formed by the radius, r, height, h, and slant height, s, of this cone, where r and h are the legs of the
triangle and s is the hypotenuse. Using the Pythagorean theorem, the equation r2 + h2 = s2 represents this relationship. Because 5,929π is
the area of the base and the area of the base is πr2 , it follows that . Dividing both sides of this equation by π yields 5,929 = r^(2) .
r2 + h2 = s52,929π = πr2
Substituting 5,929 for r2 and 36 for h in the equation  yields 5,929 + 36^(2) = s^(2), which is equivalent to 5,929 + 1,296 = s^(2), or
7,225 = s^(2). Taking the positive square root of both sides of this equation yields 85 = s. Therefore, the slant height of the cone is 85
centimeters.
Choice A is incorrect. This is one-third of the height, in centimeters, not the slant height, in centimeters, of this cone.
Choice B is incorrect. This is the height, in centimeters, not the slant height, in centimeters, of this cone.
Choice C is incorrect. This is the radius, in centimeters, of the base, not the slant height, in centimeters, of this cone.$qb$);
select seed_pool_question($qb$CB-9c0a0eca$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A triangle has a base length of 10 centimeters and a corresponding height of 70 centimeters. What is the area, in square centimeters, of the
triangle?$qb$, null, $qb$[{"label": "A", "body": "700"}, {"label": "B", "body": "350"}, {"label": "C", "body": "175"}, {"label": "D", "body": "80"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The area, A, of a triangle is given by A = (1/2)bh, where b is the length of a base of the triangle and h is the corresponding
height of the triangle. It's given that a triangle has a base length of 10 centimeters and a corresponding height of 70 centimeters. Substituting 10
for b and 70 for h in the formula A = (1/2)bh yields A = (1/2) (10)(70) , or A = 350. Therefore, the area, in square centimeters, of the triangle
is 350.
Choice A is incorrect. This is the product of the given base and height of the triangle, not its area.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the sum of the given base and height of the triangle, not its area.$qb$);
select seed_pool_question($qb$CB-9d159400$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following equations represents a circle in the xy-plane that intersects the y-axis at exactly one point?$qb$, null, $qb$[{"label": "A", "body": "(x - 8)^(2) + (y - 8)^(2) = 16"}, {"label": "B", "body": "(x - 8)^(2) + (y - 4)^(2) = 16"}, {"label": "C", "body": "(x - 4)^(2) + (y - 9)^(2) = 16"}, {"label": "D", "body": "x^(2) + (y - 9)^(2) = 16"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The graph of the equation (x - h)^(2) + (y - k)^(2) = r^(2) in the xy-plane is a circle with center (h, k) and a radius of length r.
The radius of a circle is the distance from the center of the circle to any point on the circle. If a circle in the xy-plane intersects the y-axis at
exactly one point, then the perpendicular distance from the center of the circle to this point on the y-axis must be equal to the length of the
circle's radius. It follows that the x-coordinate of the circle's center must be equivalent to the length of the circle's radius. In other words, if the
graph of  is a circle that intersects the y-axis at exactly one point, then  must be true. The equation in choice
(x -(^(x)4)-^(2) +h)(^(2)y+-(9y)-^(2) =k)1^(2)6=^(r2) (x -^(r)h=)^(2) |+h| (y - k)^(2) = r^(2)
C is , or (x - 4)^(2) + (y - 9)^(2) = 4^(2) . This equation is in the form , where h = 4, k = 9,
and r = 4, and represents a circle in the xy-plane with center (4, 9) and radius of length 4. Substituting 4 for r and 4 for h in the equation r
= ?h| yields 4 = |4|, or 4 = 4, which is true. Therefore, the equation in choice C represents a circle in the xy-plane that intersects the y-axis at
exactly one point.
Choice A is incorrect. This is the equation of a circle that does not intersect the y-axis at any point.
Choice B is incorrect. This is an equation of a circle that intersects the x-axis, not the y-axis, at exactly one point.
Choice D is incorrect. This is the equation of a circle with the center located on the y-axis and thus intersects the y-axis at exactly two points, not
exactly one point.$qb$);
select seed_pool_question($qb$CB-9fdc4eaa$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right square pyramid has a total surface area of 70,560 square inches, and the combined surface area of the four lateral faces of this pyramid
is 38,160 square inches. What is the height, in inches, of this pyramid?$qb$, null, $qb$[{"label": "A", "body": "56"}, {"label": "B", "body": "90"}, {"label": "C", "body": "106"}, {"label": "D", "body": "180"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The total surface area of a right square pyramid is the sum of the combined surface area of its four lateral faces and the area
of its square base. It’s given that the right square pyramid has a total surface area of 70,560 square inches, and the combined surface area of
the four lateral faces of this pyramid is 38,160 square inches. It follows that the area of the square base is the difference between the total
surface area and the combined surface area of the four lateral faces, or (70,560 - 38,160) square inches, which is equal to 32,400 square
inches. The area, B, of the base of a square pyramid is given by the equation B = s2 , where s is the side length of the base. Substituting 32,400
for B in this equation yields 32,400 = s^(2) . Taking the positive square root of both sides of this equation yields 180 = s. The four lateral faces of
a square pyramid are congruent triangles. It follows that the area of each lateral face is (38,16o)/4 , or 9,540, square inches. The area, A, of each
lateral face of a square pyramid is given by the equation Math output error-, where s is the side length of the pyramid’s base and Math output error
--
is the pyramid’s slant height. Substituting 9,540 for A and 180 for s in this equation yields Math output error-, or Math output error. Dividing both
sides of this equation by 90 yields Math output error-. In the right square pyramid, a right triangle can be drawn, where the lengths of the legs
correspond to the pyramid's height, h, and half the side length of its base, 1/2 s, and the length of the hypotenuse corresponds to the pyramid's
slant height, Math output error-. It follows that the relationship between hs, , and Math output error is given by the equation -Math output error.
h2 +-((1/2) (180))2 = (106)2
Substituting 180 for s and 106 for Math output error- in this equation yields , or h^(2) + 8,100 = 11,236.
Subtracting 8,100 from both sides of this equation yields h^(2) = 3,136. Taking the positive square root of both sides of the equation yields h
= 56. Therefore, the height, in inches, of this pyramid is 56.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the pyramid's slant height, not its height, in inches.
Choice D is incorrect. This is the side length of the pyramid's base, not its height, in inches.$qb$);
select seed_pool_question($qb$CB-379ffefb$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A right triangle has legs with lengths of 11 centimeters and 9 centimeters. What is the length of this triangle's hypotenuse, in centimeters?$qb$, null, $qb$[{"label": "A", "body": "√-40"}, {"label": "B", "body": "√-202"}, {"label": "C", "body": "20"}, {"label": "D", "body": "202"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The Pythagorean theorem states that for a right triangle, c2 = a2 + b2, where c represents the length of the hypotenuse and
a and b represent the lengths of the legs. It’s given that a right triangle has legs with lengths of 11 centimeters and 9 centimeters. Substituting
11 for a and 9 for b in the formula c2 = a2 + b2 yields c2 = 112 + 92, which is equivalent to c^(2) = 121 + 81, or c^(2) = 202. Taking the square
root of each side of this equation yields c = ?√-202. Since c represents a length, c must be positive. Therefore, the length of the triangle’s
hypotenuse, in centimeters, is √-202.
Choice A is incorrect. This is the result of solving the equation c^(2) = 11 (2) + 9 (2) , not c2 = 112 + 92 .
Choice C is incorrect. This is the result of solving the equation c (2) = 11 (2) + 9 (2), not c2 = 112 + 92.
Choice D is incorrect. This is the result of solving the equation c = 11^(2) + 9^(2), not c2 = 112 + 92 .$qb$);
select seed_pool_question($qb$CB-bf8d843e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In  above, what is the length of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-bf8d843e.png$qb$, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "6"}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Triangles ADB and CDB are both  triangles and share  . Therefore, triangles ADB and CDB are
congruent by the angle-side-angle postulate. Using the properties of  triangles, the length of  is half the length of
hypotenuse  . Since the triangles are congruent, . So the length of  is .
Alternate approach: Since angle CBD has a measure of , angle ABC must have a measure of . It follows that triangle ABC is equilateral,
so side AC also has length 12. It also follows that the altitude BD is also a median, and therefore the length of AD is half of the length of AC,
which is 6.
Choice A is incorrect. If the length of  were 4, then the length of  would be 8. However, this is incorrect because  is congruent to
, which has a length of 12. Choices C and D are also incorrect. Following the same procedures as used to test choice A gives  a length
of  for choice C and  for choice D. However, these results cannot be true because  is congruent to , which has a length
of 12.$qb$);
select seed_pool_question($qb$CB-3453aafc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the area, in square centimeters, of a rectangle with a length of 36 centimeters and a width of 34 centimeters?$qb$, null, $qb$[{"label": "A", "body": "70"}, {"label": "B", "body": "140"}, {"label": "C", "body": "1,156"}, {"label": "D", "body": "1,224"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area A, in square centimeters, of a rectangle can be found using the formula A = ℓw, where ℓ is the length, in
centimeters, of the rectangle and w is its width, in centimeters. It's given that the rectangle has a length of 36 centimeters and a width of 34
centimeters. Substituting 36 for ℓ and 34 for w in the formula A = ℓw yields A = 36(34) , or A = 1,224. Therefore, the area, in square
centimeters, of this rectangle is 1,224.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the perimeter, in centimeters, not the area, in square centimeters, of the rectangle.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f6ca90cc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right prism has a square base with side lengths of 10 inches. The height of the prism is 58 inches. What is the volume, in cubic inches, of the
prism?$qb$, null, null, null, array[$qb$5800$qb$]::text[], $qb$The correct answer is 5,800. The volume, V, of a right prism with a square base is given by the formula V = s2h, where s is the side length of
the square base and h is the height of the prism. It’s given that a right prism has a square base with side lengths of 10 inches. It's also given that
the height of the prism is 58 inches. Substituting 10 for s and 58 for h in the formula V = s2h yields V = (10)^(2) (58) , or V = 5,800.
Therefore, the volume, in cubic inches, of the prism is 5,800.$qb$);
select seed_pool_question($qb$CB-aef4fd8a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The length of each side of a square is 94 centimeters (cm). Which expression gives the area, in cm2, of the square?$qb$, null, $qb$[{"label": "A", "body": "2 · 94"}, {"label": "B", "body": "2 · 94 · 94"}, {"label": "C", "body": "4 · 94"}, {"label": "D", "body": "94 · 94"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area of a square is given by s2, where s is the length of each side of the square. It's given that the length of each side of
a square is 94cm. It follows that the area, in cm2 , of the square is (94)^(2) , or 94 · 94. Therefore, the expression that gives the area, in cm2 , of the
square is 94 · 94.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect. This expression gives the perimeter, in cm, of the square.$qb$);
select seed_pool_question($qb$CB-43236565$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
?
(-X^(°))/(I45^(°))?
?
N0te: FigurenotdraWnt0SCaIe·
In the figure, line m is parallel to line n, and line k intersects both lines. Which of the following statements is true?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-43236565.png$qb$, $qb$[{"label": "A", "body": "The value of x is less than 145."}, {"label": "B", "body": "The value of x is greater than 145."}, {"label": "C", "body": "The value of x is equal to 145."}, {"label": "D", "body": "The value of x cannot be determined."}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Vertical angles, or angles that are opposite each other when two lines intersect, are congruent. It’s given that line k intersects
line n. Based on the figure, the angle with measure x^(°) and the angle with measure 145^(°) are vertical angles. Therefore, the value of x is equal to
145.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-981275d2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, the graph of the equation above is a circle. Point P is on the circle and has coordinates . If  is a diameter of the
circle, what are the coordinates of point Q ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-981275d2.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The standard form for the equation of a circle is , where  are the coordinates of the center
and r is the length of the radius. According to the given equation, the center of the circle is . Let  represent the coordinates of
point Q. Since point P  and point Q  are the endpoints of a diameter of the circle, the center  lies on the diameter,
halfway between P and Q. Therefore, the following relationships hold:  and . Solving the equations for
and , respectively, yields  and . Therefore, the coordinates of point Q are .
Alternate approach: Since point P  on the circle and the center of the circle  have the same y-coordinate, it follows that the
radius of the circle is . In addition, the opposite end of the diameter  must have the same y-coordinate as P and be 4 units away
from the center. Hence, the coordinates of point Q must be .
Choices B and D are incorrect because the points given in these choices lie on a diameter that is perpendicular to the diameter . If either of
these points were point Q, then  would not be the diameter of the circle. Choice C is incorrect because  is the center of the circle
and does not lie on the circle.$qb$);
select seed_pool_question($qb$CB-d71550d0$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$???^(°) ?^(?)
Note: FigurenotdraWntoSCaIe·
In the figure, two lines intersect at a point. If r = 53, what is the value of s?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d71550d0.png$qb$, $qb$[{"label": "A", "body": "37"}, {"label": "B", "body": "53"}, {"label": "C", "body": "143"}, {"label": "D", "body": "233"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It's given that two lines intersect at a point. The angles with measures of r^(°) and s^(?) are vertical angles, so it follows that they
are equal in measure. Therefore, s = r. If r = 53, it follows that s = 53.
Choice A is incorrect. This is the measure, in degrees, of the complement of an angle with a measure of 53^(?), not the value of s.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7a11ceea$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?A ?B ???C? D m
N0te: Figuren0t ?ra?nt0SCa1e·
In the figure, segment AD and segment BE intersect at point C. Segment AD is perpendicular to line ℓ at point A. Which of the following
additional pieces of information is(are) sufficient to determine that triangle ABC is congruent to triangle DEC?
I. Segment AD is perpendicular to line m at point D.
II. AC = 13 and DC = 13$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-7a11ceea.png$qb$, $qb$[{"label": "A", "body": "I is sufficient by itself, but II is not."}, {"label": "B", "body": "II is sufficient by itself, but I is not."}, {"label": "C", "body": "I is sufficient by itself, and II is sufficient by itself."}, {"label": "D", "body": "Neither I nor II is sufficient by itself."}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. In the figure, it’s given that segment AD is perpendicular to line ℓ at point A. Statement I is that segment AD is
perpendicular to line m at point D. It follows that angles BAC and EDC are right angles. Therefore, triangles ABC and DEC are right
triangles. At least one pair of congruent corresponding sides is needed to determine triangle congruence by the side-angle-side (SAS) condition
or the angle-side-angle (ASA) condition, so statement I is not sufficient to determine that triangle ABC is congruent to triangle DEC.
Statement II is that AC = 13 and DC = 13. It follows that triangles ABC and DEC share one pair of congruent corresponding sides. Two
additional pairs of congruent corresponding parts are needed to determine triangle congruence by SAS condition, ASA condition, or side-side-
side (SSS) condition, so statement II is not sufficient to determine that triangle ABC is congruent to triangle DEC. Therefore, neither I nor II is
sufficient by itself to determine that triangle ABC is congruent to triangle DEC.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-25cc5327$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The base of a right rectangular pyramid has a length of 27 centimeters and a width of 2 centimeters. The height of this pyramid is 7 centimeters.
What is the volume, in cubic centimeters, of this pyramid?$qb$, null, null, null, array[$qb$126$qb$]::text[], $qb$The correct answer is 126. It’s given that the base of the right rectangular pyramid has a length of 27 centimeters and a width of 2 centimeters
and that the height of the pyramid is 7 centimeters. The volume, V, of a right rectangular pyramid is given by the formula V = 1/3 ℓwh, where ℓ
and w are the length and width, respectively, of the pyramid’s base and h is the height of the pyramid. Substituting 27 for ℓ2,  for w, and 7 for h
in this formula yields V = 1/3 (27) (2) (7) , or V = 126. Therefore, the volume, in cubic centimeters, of the pyramid is 126.$qb$);
select seed_pool_question($qb$CB-89661424$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle in the xy-plane has its center at (-5, 2) and has a radius of 9. An equation of this circle is x2 + y2 + ax + by + c = 0, where ab, , and
c are constants. What is the value of c?$qb$, null, null, null, array[$qb$-52$qb$]::text[], $qb$The correct answer is -52. The equation of a circle in the xy-plane with its center at (h, k) and a radius of r can be written in the form (x - h)^(2)
+ (y - k)2 = r2 . It's given that a circle in the xy-plane has its center at and has a radius of 9. Substituting -5 for h2,  for k, and 9 for r
(x - (-5))^(2) + (y -(2-)5^(2,)=2)9^(2)
in the equation yields , or . It's also given that an
(^(x) - h)2x+2 +(yy-2 +k)a2x=+^(r)b2y + c = 0 (x + 5)^(2) +(x(y+-52))2^(2)+=(y81- 2)2 = 81
equation of this circle is , where ab, , and c are constants. Therefore, can be rewritten
in the form x2 + y2 + ax + by + c = 0. The equation (x + 5)^(2) + (y - 2)^(2) = 81, or (x + 5)(x + 5) + (y - 2)(y - 2) = 81, can be
rewritten as x^(2) + 5x + 5x + 25 + y^(2) - 2y - 2y + 4 = 81. Combining like terms on the left-hand side of this equation yields
xx22++yy22++1100xx
- 4y + 29 = 81 . Subtracting 81 from both sides of this equation yields x^(2) + y^(2) + 10x - 4y - 52 = 0, which is equivalent to
+ (-4)y + (-52) = 0. This equation is in the form x2 + y2 + ax + by + c = 0. Therefore, the value of c is -52.$qb$);
select seed_pool_question($qb$CB-858809e7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A B
?
(-?? -xx^(°)° ??x? C)/C
?
?
N0te: Figuren0tdraWnt0SCaIe·
In the figure, --EG and --AD intersect at point F, and line -Math output error is parallel to line j. If EF = 0·5CD and FG = 2·25CD, which of
the following must be true?
I. AB = 2·25EF
II. FG = 0·5AB
III. EF/FG = AF/FD$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-858809e7.png$qb$, $qb$[{"label": "A", "body": "I only"}, {"label": "B", "body": "II only"}, {"label": "C", "body": "I and II"}, {"label": "D", "body": "II and III"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In the figure, --AE intersects line Math output error- and --EG, and alternate interior angles are both marked x^(°). It follows that
--EG is parallel to line -Math output error. It’s given that line Math output error- is parallel to line j, so --EG is also parallel to line j. Thus, the
following angles also have measure x^(?): ∠EFA ∠ACD ∠BAD, , , and ∠GFD. Triangles AEF and ACD each have two angles with
measure x^(°), so triangles AEF and ACD are similar. It’s also given that EF = 0·5CD, so AF = 0·5AD. It follows that AF = FD.
Triangles DFG and DAB each have one angle with measure x^(?) and share ∠FDG, so triangles DFG and DAB are similar. Since AF
= FD, it follows that AD = 2FD, so AB = 2FG. Substituting 2FG for AB in statement I yields 2FG = 2·25EF. It's given that FG
= 2·25CD. Substituting 2·25CD for FG and 0·5CD for EF in the equation 2FG = 2·25EF yields , or
2F(2G·2=5C0D·5)A=B2·25(0·5CD)
4·5CD = 1·125CD. Thus, statement I is not true. Since AB = 2FG, it follows that 0·5AB = FG, or . Therefore, statement II
must be true. Substituting 0·5CD for EF2·25CD,  for FG, and FD for AF in statement III yields (o·5CD)/(2·25CD) = FD/FD , or 2/9 = 1. Thus, statement
III is not true. Therefore, statement II only must be true.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-196e8e6e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, a circle has center C with coordinates . Points A and B lie on the circle. Point A has coordinates (h + 1, k + √-102) ,
h, k)
and ∠ACB is a right angle. What is the length of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-196e8e6e.png$qb$, $qb$[{"label": "A", "body": "√-206"}, {"label": "B", "body": "2√-102"}, {"label": "C", "body": "103√-2"}, {"label": "D", "body": "103√-3"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that points A and B lie on the circle with center C. Therefore,--AC and--BC are both radii of the circle. Since all
radii of a circle are congruent,--AC is congruent to--BC. The length of--AC, or the distance from point A to point C, can be found using the
distance formula, which gives the distance between two points, (x1 , y1 ) and (x2 , y2 ), as √-(C^(x1) (-h,^(x)k^(2)))^(2) + (y^(1) - y^(2))^(2). Substituting the given
coordinates of point A, , for  and the given coordinates of point , , for (x2 , y2 ) in the distance formula
yields √-103√(h + 1, k + √-102)/((h + 1 - h)2 + √-102 - k) 2), or(√x1(, y1))/(1^(2) + A(√C-1B02)^(2)), which is equivalent to √-1 + 102, or √-103. Therefore, the length of--AC is
and the length of  is √-103. It's given that angle  is a right angle. Therefore, triangle ACB is a right triangle with legs--AC and
--BC and hypotenuse--AB. By the Pythagorean theorem, if a right triangle has a hypotenuse with length c and legs with lengths a and b, then
a2 + b2 = c2. Substituting √-103 for a and b in this equation yields , or 103 + 103 = c^(2), which is equivalent to
(√-103) 2√+((√)/206 -=103c) 2 = c2
206 = c^(2). Taking the positive square root of both sides of this equation yields . Therefore, the length of --AB is √-206.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This would be the length of--AB if the length of--AC were 103, not √-103.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-d03e29f1$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$(x - 6)^(2) + (y - 3)^(2) = 81
The graph of the given equation in the xy-plane is a circle. What is the length of the radius of this circle?$qb$, null, $qb$[{"label": "A", "body": "3"}, {"label": "B", "body": "6"}, {"label": "C", "body": "9"}, {"label": "D", "body": "81"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The equation of a circle in the xy-plane can be written as , where the center of the circle is (h, k)
(x - 6)2 + ((xy-- h3))^(2)2 += (8y1- k)^(2) = r^(2)
and the radius of the circle is r. The graph of the given equation, , is a circle in the xy-plane. This equation can be
written as (x - 6)^(2) + (y - 3)^(2) = 9^(2) , where h = 6, k = 3, and r = 9. Therefore, the radius of this circle is 9.
Choice A is incorrect. This is the y-coordinate of the center, not the radius, of the circle defined by the given equation.
Choice B is incorrect. This is the x-coordinate of the center, not the radius, of the circle defined by the given equation.
Choice D is incorrect. This is the value of the radius squared, not the radius, of the circle defined by the given equation.$qb$);
select seed_pool_question($qb$CB-de9148c4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?^(c) ?
?
I2
N0tc: FigurenotdraWnt0SCaIe·
Which equation shows the relationship between the side lengths of the triangle shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-de9148c4.png$qb$, $qb$[{"label": "A", "body": "12 · 3 = c"}, {"label": "B", "body": "12 + 3 = c"}, {"label": "C", "body": "122 + 32 = c2"}, {"label": "D", "body": "122 - 32 = c2"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The Pythagorean theorem states that for a right triangle, a2 + b2 = c2, where a and b represent the lengths of the legs and c
represents the length of the hypotenuse. It’s given that the right triangle shown has legs with lengths 12 and 3 and a hypotenuse with length c.
Substituting 12 for a and 3 for b in the formula a2 + b2 = c2 yields 122 + 32 = c2 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-7c25b0dc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The length of a rectangle’s diagonal is 3√-17, and the length of the rectangle’s shorter side is 3. What is the length of the rectangle’s longer side?$qb$, null, null, null, array[$qb$12$qb$]::text[], $qb$The correct answer is 12. The diagonal of a rectangle forms a right triangle, where the shorter side and the longer side of the rectangle are the
legs of the triangle and the diagonal of the rectangle is the hypotenuse of the triangle. It's given that the length of the rectangle's diagonal is
3√-17 and the length of the rectangle's shorter side is 3. Thus, the length of the hypotenuse of the right triangle formed by the diagonal is 3√-17
and the length of one of the legs is 3. By the Pythagorean theorem, if a right triangle has a hypotenuse with length c and legs with lengths a and
b, then a2 + b2 = c2. Substituting 3√-17 for c and 3 for b in this equation yields a^(2) + (3)^(2) = (3√-17)^(2), or a^(2) + 9 = 153. Subtracting 9 from
both sides of this equation yields a^(2) = 144. Taking the square root of both sides of this equation yields a = ?√-144, or a = ±12. Since a
represents a length, which must be positive, the value of a is 12. Thus, the length of the rectangle's longer side is 12.$qb$);
select seed_pool_question($qb$CB-36661021$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$easy$qb$::difficulty_level, null, $qb$? ??^(C)
?
N0te: FigurenotdraWnt0SCaIe·
In the right triangle shown, which of the following is closest to the value of c?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-36661021.png$qb$, $qb$[{"label": "A", "body": "7·5"}, {"label": "B", "body": "10·8"}, {"label": "C", "body": "15"}, {"label": "D", "body": "58·5"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. By the Pythagorean theorem, if a right triangle has a hypotenuse with length t and legs with lengths r and s, then r2 + s2
= t2. It's given in the right triangle shown that the legs have lengths of 9 and 6 and the hypotenuse has a length of c. Substituting 9 for r6,  for s,
and c for t in r2 + s2 = t2 yields 92 + 62 = c2 , or 117 = c^(2). Taking the square root of both sides of this equation yields ?√-117 = c. Since
the length of a side of a triangle must be positive, the value of c is √-117, which is approximately equal to 10·8167. Of the choices, 10·8 is the
closest to the value of c.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-e80d62c6$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The equation x^(2) + (y - 2)^(2) = 36 represents circle A. Circle B is obtained by shifting circle A down 4 units in the xy-plane. Which of the
following equations represents circle B?$qb$, null, $qb$[{"label": "A", "body": "x^(2) + (y + 2)^(2) = 36"}, {"label": "B", "body": "x^(2) + (y - 6)^(2) = 36"}, {"label": "C", "body": "(x - 4)^(2) + (y - 2)^(2) = 36"}, {"label": "D", "body": "(x + 4)^(2) + (y - 2)^(2) = 36"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The standard form of an equation of a circle in the xy-plane is , where the coordinates of the
(x - h)^(2) + (y -xk2)+^(2) =(yr-^(2) 2)2 = 36
center of the circle are and the length of the radius of the circle is r. The equation of circle A, , can be rewritten as
(x - 0)2 + (y - 2)2 =(h6, k2 )
. Therefore, the center of circle A is at (0, 2) and the length of the radius of circle A is 6. If circle A is shifted down 4
units, the y-coordinate of its center will decrease by 4; the radius of the circle and the x-coordinate of its center will not change. Therefore, the
center of circle B is at , or , and its radius is 6. Substituting 0 for h, -2 for k, and 6 for r in the equation (x - h)^(2) + (y - k)^(2)
(x - 0)2 +(0,(2y -- 4(-) 2))(20=, -(26))2
= r2 yields , or x^(2) + (y + 2)^(2) = 36. Therefore, the equation x^(2) + (y + 2)^(2) = 36 represents circle B.
Choice B is incorrect. This equation represents a circle obtained by shifting circle A up, rather than down, 4 units.
Choice C is incorrect. This equation represents a circle obtained by shifting circle A right, rather than down, 4 units.
Choice D is incorrect. This equation represents a circle obtained by shifting circle A left, rather than down, 4 units.$qb$);
select seed_pool_question($qb$CB-4fb972f2$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In right triangle QRS, the length of hypotenuse SQ is 4√-82 and the length of side QR is 4. What is the length of side RS?$qb$, null, null, null, array[$qb$36$qb$]::text[], $qb$The correct answer is 36. It’s given that side SQ is the hypotenuse of right triangle QRS. It’s also given that the length of side SQ is 4√-82 and
the length of side QR is 4. It follows that sides QR and RS are the legs of triangle QRS. The Pythagorean theorem states that for a right
triangle, the sum of the squares of the lengths of the two legs is equal to the square of the length of the hypotenuse. Let b represent the length of
side RS. By the Pythagorean theorem, 4^(2) + b^(2) = (4√-82)^(2), or 16 + b^(2) = 1,312. Subtracting 16 from both sides of this equation yields b^(2)
= 1,296. Taking the positive square root of both sides of this equation yields b = 36. Therefore, the length of side RS is 36.$qb$);
select seed_pool_question($qb$CB-f243c383$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Two identical rectangular prisms each have a height of 90 centimeterS (cm) . The base of each prism is a square, and the surface area of each
prism is Kcm2 . If the prisms are glued together along a square base, the resulting prism has a surface area of 92/47 K cm2 . What is the side
length, in cm, of each square base?$qb$, null, $qb$[{"label": "A", "body": "4"}, {"label": "B", "body": "8"}, {"label": "C", "body": "9"}, {"label": "D", "body": "16"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Let x represent the side length, in cm, of each square base. If the two prisms are glued together along a square base, the
resulting prism has a surface area equal to twice the surface area of one of the prisms, minus the area of the two square bases that are being
glued together, which yields 2K - 2x2 cm2 . It’s given that this resulting surface area is equal to 92/47 K cm2, so .
2K - 2x2 = 92/427KK
Subtracting from both sides of this equation yields . This equation can be rewritten by multiplying  on the left-
92/4747/47K
hand side by , which yields K = 24K7(2-)/x472 92/K47-K2-x22=x20= 0, or . Adding 2x2 to both sides of this equation yields 2/47 K = 2x2.
94/47 K - 92/47K47/2 - 2x2 = 0
Multiplying both sides of this equation by  yields . The surface area K, in cm2 , of each rectangular prism is equivalent to the sum
of the areas of the two square bases and the areas of the four lateral faces. Since the height of each rectangular prism is 90cm and the side
length of each square base is x cm, it follows that the area of each square base is x2 cm2 and the area of each lateral face is 90x cm2.
Therefore, the surface area of each rectangular prism can be represented by the expression 2x^(2) + 4(90x) , or 2x^(2) + 360x. Substituting this
expression for K in the equation K = 47x^(2) yields 2x^(2) + 360x = 47x^(2). Subtracting 2x2 and 360x from both sides of this equation yields 0
= 45x^(2) - 360x. Factoring x from the right-hand side of this equation yields 0 = x(45x - 360). Applying the zero product property, it follows
that x = 0 and 45x - 360 = 0. Adding 360 to both sides of the equation 45x - 360 = 0 yields 45x = 360. Dividing both sides of this
equation by 45 yields x = 8. Since a side length of a rectangular prism can’t be 0, the length of each square base is 8cm.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-95ba2d09$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane above, points P, Q, R, and T lie on the circle with center O. The degree measures of angles  and  are each 30°. What is
the radian measure of angle -  ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-95ba2d09.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. Because points T, O, and P all lie on the x-axis, they form a line. Since the angles on a line add up to , and it’s given that
angles POQ and ROT each measure , it follows that the measure of angle QOR is . Since the arc of a
complete circle is  or  radians, a proportion can be set up to convert the measure of angle QOR from degrees to radians:
, where x is the radian measure of angle QOR. Multiplying each side of the proportion by  gives
. Solving for x gives , or .
Choice A is incorrect and may result from subtracting only angle POQ from to get a value of and then finding the radian measure
equivalent to that value. Choice B is incorrect and may result from a calculation error. Choice D is incorrect and may result from calculating the
sum of the angle measures, in radians, of angles POQ and ROT.$qb$);
select seed_pool_question($qb$CB-adae6543$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?
L ?? ?
P
Note: FigurenotdraWntoSCaIe·
In the figure, intersects--MP at point R, and--LM is parallel to--PQ. The lengths of--MR--LR, , and--RP are 67, , and 11 , respectively. What is
the length of ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-adae6543.png$qb$, $qb$[{"label": "A", "body": "119/11"}, {"label": "B", "body": "77/6"}, {"label": "C", "body": "113/6"}, {"label": "D", "body": "119/6"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The figure shows that angle MRL and angle  are vertical angles. Since vertical angles are congruent, angle MRL
PR/PQ- Q
and angle PRQ are congruent. It’s given that --LM is parallel to . The figure also shows that --LQ intersects --LM and --PQ. If two parallel
segments are intersected by a third segment, alternate interior angles are congruent. Thus, alternate interior angles MLR and PQR are
congruent. Since triangles LMR and PQR have two pairs of congruent angles, the triangles are similar. Sides LR and MR in triangle LMR
correspond to sides  and RP, respectively, in triangle PQR. Since the lengths of corresponding sides in similar triangles are proportional, it
follows that . It's given that the lengths of --MR--LR, , and --RP are 67, , and 11 , respectively. Substituting 6 for MR7,  for LR, and 11
RQ/LR = RQ/LR = RP/MRR
for RP in the equation  yields . Multiplying each side of this equation by 7 yields RQ = (11/6) (7) , or . It's given
LQ R=Q7=+ 77/677/6
that  intersects  at point , so L11Q9/6RQ/(=7) L=R11/(+6) RQ. Substituting 7 for LR and 77/6 for RQ in this equation yields , or LQ
= (--11L9)/6Q
. Therefore, the length of --LQ is .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the length of --RQ, not --LQ.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-6dd463ca$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the figure above, segments AE and BD are parallel. If angle BDC measures 58° and angle ACE measures 62°, what is the measure of angle CAE
?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6dd463ca.png$qb$, $qb$[{"label": "A", "body": "58°"}, {"label": "B", "body": "60°"}, {"label": "C", "body": "62°"}, {"label": "D", "body": "120°"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that angle ACE measures . Since segments AE and BD are parallel, angles BDC and CEA are congruent.
Therefore, angle CEA measures . The sum of the measures of angles ACE, CEA, and CAE is  since the sum of the interior angles of
triangle ACE is equal to . Let the measure of angle CAE be . Therefore, , which simplifies to . Thus, the
measure of angle CAE is .
Choice A is incorrect. This is the measure of angle AEC, not that of angle CAE. Choice C is incorrect. This is the measure of angle ACE, not that of
CAE. Choice D is incorrect. This is the sum of the measures of angles ACE and CEA.$qb$);
select seed_pool_question($qb$CB-0815a5af$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?P???O ??
N0te: Figuren0tdraWnt0SCaIe·
The circle shown has center O, circumference 144π, and diameters --PR and --QS. The length of arc PS is twice the length of arc PQ. What is
the length of arc QR?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0815a5af.png$qb$, $qb$[{"label": "A", "body": "24π"}, {"label": "B", "body": "48π"}, {"label": "C", "body": "72π"}, {"label": "D", "body": "96π"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since--PR and--QS are diameters of the circle shown,--OS--OR--OP, , , and --OQ are radii of the circle and are therefore
congruent. Since ∠SOP and ∠ROQ are vertical angles, they are congruent. Therefore, arc PS and arc QR are formed by congruent radii and
have the same angle measure, so they are congruent arcs. Similarly, ∠SOR and ∠POQ are vertical angles, so they are congruent. Therefore,
arc SR and arc PQ are formed by congruent radii and have the same angle measure, so they are congruent arcs. Let x represent the length of
arc SR. Since arc SR and arc PQ are congruent arcs, the length of arc PQ can also be represented by x. It’s given that the length of arc PS is
twice the length of arc PQ. Therefore, the length of arc PS can be represented by the expression 2x. Since arc PS and arc QR are congruent
arcs, the length of arc QR can also be represented by 2x. This gives the expression x + x + 2x + 2x. Since it's given that the circumference is
144π, the expression x + x + 2x + 2x is equal to 144π. Thus x + x + 2x + 2x = 144π, or 6x = 144π. Dividing both sides of this equation
by 6 yields x = 24π. Therefore, the length of arc QR is 2(24π) , or 48π.
Choice A is incorrect. This is the length of arc PQ, not arc QR.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f731d88b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In convex pentagon ABCDE, segment AB is parallel to segment DE. The measure of angle B is 139 degrees, and the measure of angle D is
174 degrees. What is the measure, in degrees, of angle C?$qb$, null, null, null, array[$qb$47$qb$]::text[], $qb$The correct answer is 47. It's given that the measure of angle B is 139 degrees. Therefore, the exterior angle formed by extending segment AB
at point B has measure 180 - 139, or 41, degrees. It's given that segment AB is parallel to segment DE. Extending segment BC at point C
and extending segment DE at point D until the two segments intersect results in a transversal that intersects two parallel line segments. One
of these intersection points is point B, and let the other intersection point be point X. Since segment AB is parallel to segment DE, alternate
interior angles are congruent. Angle CXD and the exterior angle formed by extending segment AB at point B are alternate interior angles.
Therefore, the measure of angle CXD is 41 degrees. It's given that the measure of angle D in pentagon ABCDE is 174 degrees. Therefore,
angle CDX has measure 180 - 174, or 6, degrees. Since angle C in pentagon ABCDE is an exterior angle of triangle CDX, it follows that
the measure of angle C is the sum of the measures of angles CDX and CXD. Therefore, the measure, in degrees, of angle C is 6 + 41, or 47.
Alternate approach: A line can be created that's perpendicular to segments AB and DE and passes through point C. Extending segments AB
and DE at points B and D, respectively, until they intersect this line yields two right triangles. Let these intersection points be point X and point
Y, and the two right triangles be triangle BXC and triangle DYC. It's given that the measure of angle B is 139 degrees. Therefore, angle
CBX has measure 180 - 139, or 41, degrees. Since the measure of angle CBX is 41 degrees and the measure of angle BXC is 90 degrees,
it follows that the measure of angle XCB is 180 - 90 - 41 , or 49, degrees. It's given that the measure of angle D is 174 degrees. Therefore,
angle YDC has measure 180 - 174, or 6, degrees. Since the measure of angle YDC is 6 degrees and the measure of angle CYD is 90
degrees, it follows that the measure of angle DCY is 180 - 90 - 6, or 84, degrees. Since angles XCBDCY, , and angle C in pentagon
ABCDE form segment XY, it follows that the sum of the measures of those angles is 180 degrees. Therefore, the measure, in degrees, of
angle C is 180 - 49 - 84, or 47.$qb$);
select seed_pool_question($qb$CB-93de3f84$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The volume of right circular cylinder A is 22 cubic centimeters. What is the volume, in cubic centimeters, of a right circular cylinder with twice the
radius and half the height of cylinder A?$qb$, null, $qb$[{"label": "A", "body": "11"}, {"label": "B", "body": "22"}, {"label": "C", "body": "44"}, {"label": "D", "body": "66"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The volume of right circular cylinder A is given by the expression , where r is the radius of its circular base and h is its
height. The volume of a cylinder with twice the radius and half the height of cylinder A is given by , which is equivalent to
. Therefore, the volume is twice the volume of cylinder A, or .
Choice A is incorrect and likely results from not multiplying the radius of cylinder A by 2. Choice B is incorrect and likely results from not squaring
the 2 in 2r when applying the volume formula. Choice D is incorrect and likely results from a conceptual error.$qb$);
select seed_pool_question($qb$CB-d21270da$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
?
--?24X^(°)°
?
N0te: FigurenotdraWnt0SCaIe·
In the figure, line t intersects lines r and s. Which additional piece of information is sufficient to prove that lines r and s are parallel?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d21270da.png$qb$, $qb$[{"label": "A", "body": "x < 24"}, {"label": "B", "body": "x = 24"}, {"label": "C", "body": "x > 24"}, {"label": "D", "body": "x - 24 = 360"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. In the figure shown, transversal t intersects lines r and s. Two lines intersected by a transversal are parallel if and only if a
pair of alternate interior angles have equal measure. The angle marked 24^(?) and the angle marked x^(°) form a pair of alternate interior angles.
Therefore, x = 24 is sufficient to prove that lines r and s are parallel.
Choice A is incorrect and may result from conceptual errors.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-16d66178$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Which of the following expressions is equivalent to (Sin24^(°)) (c0S66^(°)) + (coS24^(°)) (Sin66^(?)) ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-16d66178.png$qb$, $qb$[{"label": "A", "body": "2(c0S66^(?)) (Sin24^(?))"}, {"label": "B", "body": "2(c0S66^(?)) + 2(c0S24^(?))"}, {"label": "C", "body": "(c0S66^(?)) 2 + (c0S24^(?)) 2"}, {"label": "D", "body": "(coS66^(°))^(2) + (Sin24^(°))^(2)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The sine of an angle is equal to the cosine of its complementary angle. Since angles with measures 24^(°) and 66^(°) are
complementary to each other, Sin24^(°) is equal to coS66^(?) and Sin66^(°) is equal to c0S24^(?). Substituting coS66^(°) for Sin24^(°) and coS24^(°) for
Sin66^(°) in the given expression yields (c0S66^(°)) (c0S66^(?)) + (c0S24^(°)) (c0S24^(°)), or (coS66^(?)) 2 + (coS24^(?)) 2.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f1251f35$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Z ?N0tc: Figu5r?e55no?t0draWnt0SCaIe· ?YX?5
In triangle XYZ c0S Z = 560/c, . What is the value of c?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-f1251f35.png$qb$, null, null, array[$qb$565$qb$]::text[], $qb$The correct answer is 565. In triangle XYZ, angle Y is a right angle. Therefore, triangle XYZ is a right triangle. The cosine of an acute angle in
a right triangle is the ratio of the length of the side adjacent to that angle to the length of the hypotenuse. In right triangle XYZ, side YZ is the
side adjacent to angle Z and side XZ is the hypotenuse. It’s given that the length of side YZ is 560 and the length of side XZ is 565.
Therefore, c0S Z = 560/565 . It's also given that c0S Z = 56o/c . It follows that 560/c = 56o/565 . Therefore, c = 565.$qb$);
select seed_pool_question($qb$CB-5b918ebb$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
?
--?X° I62^(°)
?
N0te: FigurenotdraWnt0SCa1e·
In the figure, line n intersects lines r and s. Line r is parallel to line s. What is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-5b918ebb.png$qb$, null, null, array[$qb$162$qb$]::text[], $qb$The correct answer is 162. It's given that line r is parallel to line s. Since line n intersects both lines r and s, it's a transversal. The angles in the
figure marked as 162^(?) and x^(?) are on the same side of the transversal, where one is an interior angle with line s as a side, and the other is an
exterior angle with line r as a side. Thus, the marked angles are corresponding angles. When two parallel lines are intersected by a transversal,
corresponding angles are congruent and, therefore, have equal measure. It follows that the value of x is 162.$qb$);
select seed_pool_question($qb$CB-c9f8d1e9$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$easy$qb$::difficulty_level, null, $qb$??^(C)
?
b
N0te: FigurenotdraWnt0SCaIe·
For the right triangle shown, a = 4 and b = 5. Which expression represents the value of c?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-c9f8d1e9.png$qb$, $qb$[{"label": "A", "body": "4 + 5"}, {"label": "B", "body": "√-(^(4))(^(5))"}, {"label": "C", "body": "√-4 + 5"}, {"label": "D", "body": "√-4^(2) + 5^(2)"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. By the Pythagorean theorem, if a right triangle has a hypotenuse with length c and legs with lengths a and b, then c2 = a2
+ b^(2). In the right triangle shown, the hypotenuse has length c and the legs have lengths a and b. It's given that a = 4 and b = 5. Substituting 4
for a and 5 for b in the Pythagorean theorem yields c2 = 42 + 52. Taking the square root of both sides of this equation yields c = ±√-4^(2) + 5^(2).
Since the length of a side of a triangle must be positive, the value of c is √-4^(2) + 5^(2).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f60bb551$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The area of a rectangle is 630 square inches. The length of the rectangle is 70 inches. What is the width, in inches, of this rectangle?$qb$, null, $qb$[{"label": "A", "body": "9"}, {"label": "B", "body": "70"}, {"label": "C", "body": "315"}, {"label": "D", "body": "560"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The area A, in square inches, of a rectangle is the product of its length ℓ, in inches, and its width w, in inches; thus, A = ℓw.
It's given that the area of a rectangle is 630 square inches and the length of the rectangle is 70 inches. Substituting 630 for A and 70 for ℓ in the
equation A = ℓw yields 630 = 70w. Dividing both sides of this equation by 70 yields 9 = w. Therefore, the width, in inches, of this rectangle is
9.
Choice B is incorrect. This is the length, not the width, in inches, of the rectangle.
Choice C is incorrect. This is half the area, in square inches, not the width, in inches, of the rectangle.
Choice D is incorrect. This is the difference between the area, in square inches, and the length, in inches, of the rectangle, not the width, in inches,
of the rectangle.$qb$);
select seed_pool_question($qb$CB-d2047497$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the area of a rectangle with a length of 17 centimcterS (cm) and a width of 7 cm?$qb$, null, $qb$[{"label": "A", "body": "24 cm2"}, {"label": "B", "body": "48 cm2"}, {"label": "C", "body": "119cm^(2)"}, {"label": "D", "body": "576cm^(2)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The area of a rectangle with length ? and width w can be found using the formula A = ?w. It’s given that the rectangle has a
length of 17cm and a width of 7 cm. Therefore, the area of this rectangle is A = 17(7) , or 119cm^(2) .
Choice A is incorrect. This is the sum of the length and width of the rectangle, not the area.
Choice B is incorrect. This is the perimeter of the rectangle, not the area.
Choice D is incorrect. This is the sum of the length and width of the rectangle squared, not the area.$qb$);
select seed_pool_question($qb$CB-a71617d3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?N0tc: Figuren?ot2draWnt0SCaIeX·^(°) ? ? 2
In the triangle shown, what is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a71617d3.png$qb$, null, null, array[$qb$45$qb$]::text[], $qb$The correct answer is 45. An isosceles right triangle has a right angle and two legs of equal length. In the triangle shown, one angle is a right
angle and the two legs each have a length of 32. Thus, the given triangle is an isosceles right triangle. In an isosceles right triangle, the measures
of the two non-right angles are 45^(°). It follows that the value of x is 45.$qb$);
select seed_pool_question($qb$CB-149021da$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle has center P, and points A and B lie on the circle. The measure of arc AB is 45^(°) and the length of arc AB is 4π units. What is the
length, in units, of the radius of the circle?$qb$, null, null, null, array[$qb$16$qb$]::text[], $qb$The correct answer is 16. It’s given that the measure of arc AB is 45^(?) and the length of arc AB is 4π units. In a circle, the circumference
corresponds to an arc measure of 360^(°). Therefore, the ratio of the measure of arc AB to 360^(°) is equal to the ratio of the length of arc AB to the
circumference. Since the circumference of a circle is 2πr, it follows that 45/360 = 4π/2πr . This equation can be rewritten as 1/8 = 2/r. Multiplying both
sides of this equation by 8r yields 1(r) = 2(8) , or r = 16. Therefore, the length, in units, of the radius of the circle is 16.$qb$);
select seed_pool_question($qb$CB-a5aee181$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The length of a rectangle’s diagonal is 5√-17, and the length of the rectangle’s shorter side is 5. What is the length of the rectangle’s longer side?$qb$, null, $qb$[{"label": "A", "body": "√-17"}, {"label": "B", "body": "20"}, {"label": "C", "body": "15√-2"}, {"label": "D", "body": "400"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. A rectangle’s diagonal divides a rectangle into two congruent right triangles, where the diagonal is the hypotenuse of both
triangles. It’s given that the length of the diagonal is 5√-17 and the length of the rectangle’s shorter side is 5. Therefore, each of the two right
triangles formed by the rectangle’s diagonal has a hypotenuse with length 5√-17, and a shorter leg with length 5. To calculate the length of the
longer leg of each right triangle, the Pythagorean theorem, a2 + b2 = c2 , can be used, where a and b are the lengths of the legs and c is the
length of the hypotenuse of the triangle. Substituting 5 for a and 5√-17 for c in the equation a2 + b2 = c2 yields 5^(2) + b^(2) = (5√-17)^(2) , which
is equivalent to 25 + b^(2) = 25(17) , or 25 + b^(2) = 425. Subtracting 25 from each side of this equation yields b^(2) = 400. Taking the positive
square root of each side of this equation yields b = 20. Therefore, the length of the longer leg of each right triangle formed by the diagonal of the
rectangle is 20. It follows that the length of the rectangle’s longer side is 20.
Choice A is incorrect and may result from dividing the length of the rectangle’s diagonal by the length of the rectangle’s shorter side, rather than
substituting these values into the Pythagorean theorem.
Choice C is incorrect and may result from using the length of the rectangle’s diagonal as the length of a leg of the right triangle, rather than the
length of the hypotenuse.
Choice D is incorrect. This is the square of the length of the rectangle’s longer side.$qb$);
select seed_pool_question($qb$CB-11301fb6$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The difference between the measure of angle A and the measure of angle B is - 5/6 π radians. Which expression shows the difference between
the measure of angle A and the measure of angle B, in degrees?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-11301fb6.png$qb$, $qb$[{"label": "A", "body": "- 5/6 π · (36o^(°))/π"}, {"label": "B", "body": "- 5/6 π · (18o^(°))/π"}, {"label": "C", "body": "- 5/6 π · π/(18o^(°))"}, {"label": "D", "body": "- 5/6 · (180^(°))/π"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. Since π radians = 180^(?), the measure of an angle, in degrees, can be found by multiplying its measure, in radians, by .
(180^(°))/(-π)5/6 π
It’s given that the difference between the measure of angle A and the measure of angle B is - 5/6 π radians. It follows that the expression
· (18o^(°))/π shows the difference between the measure of angle A and the measure of angle B, in degrees.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-4efea6a3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The area of a rectangle is 57 square inches. The length of the longest side of the rectangle is 19 inches. What is the length, in inches, of the
shortest side of this rectangle?$qb$, null, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. The area of a rectangle can be calculated by multiplying the length of its longest side by the length of its shortest side.
It’s given that the area of the rectangle is 57 square inches and the length of the longest side of the rectangle is 19 inches. Let x represent the
length, in inches, of the shortest side of this rectangle. It follows that 57 = 19x. Dividing both sides of this equation by 19 yields 3 = x.
Therefore, the length, in inches, of the shortest side of the rectangle is 3.$qb$);
select seed_pool_question($qb$CB-697b3954$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A ??? C ???
?
B ?
Note: FigurenotdraWntoSCaIe·
In the figure shown, △ABC is congruent to △BDE. If r = 54 and s = 26, what is the length of -CD?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-697b3954.png$qb$, $qb$[{"label": "A", "body": "26"}, {"label": "B", "body": "27"}, {"label": "C", "body": "28"}, {"label": "D", "body": "54"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that △ABC is congruent to △BDE. Corresponding sides of congruent triangles are equal in length. It’s given
that r, which represents the length of --AB, is equal to 54 and s, which represents the length of --DE, is equal to 26. Since --AB and --DE aren’t
equal in length, it follows that --AB corresponds to --BD and --BC corresponds to --DE. Therefore, the length of --BD is 54 and the length of --BC is
26. The points B, C, and D lie on a straight line, so the length of --BD can be expressed as the sum of the lengths of --BC and --CD. This
relationship can be written as BD = BC + CD. Substituting 54 for BD and 26 for BC in this equation yields 54 = 26 + CD. Subtracting
26 from both sides of this equation yields CD = 28. Therefore, the length of --CD is 28.
Choice A is incorrect. This is the length of--BC, not--CD.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the length of--BD, not--CD.$qb$);
select seed_pool_question($qb$CB-ae041e52$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A square is inscribed in a circle. The radius of the circle is (20√-2)/2 inches. What is the side length, in inches, of the square?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ae041e52.png$qb$, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "(20√-2)/2"}, {"label": "C", "body": "20√-2"}, {"label": "D", "body": "40"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. When a square is inscribed in a circle, a diagonal of the square is a diameter of the circle. It's given that a square is inscribed
in a circle and the length of a radius of the circle is (2o√-2)/2 inches. Therefore, the length of a diameter of the circle is 2 ((2o√-2)/2) inches, or 20√-2
inches. It follows that the length of a diagonal of the square is 20√-2 inches. A diagonal of a square separates the square into two right triangles
in which the legs are the sides of the square and the hypotenuse is a diagonal. Since a square has 4 congruent sides, each of these two right
triangles has congruent legs and a hypotenuse of length 20√-2 inches. Since each of these two right triangles has congruent legs, they are both
454590- - triangles. In a 454590- - triangle, the length of the hypotenuse is √-2 times the length of a leg. Let s represent the length of a leg of one
of these 454590- - triangles. It follows that 20√-2 = √-2(s) . Dividing both sides of this equation by √-2 yields 20 = s. Therefore, the length of a
leg of one of these 454590- - triangles is 20 inches. Since the legs of these two 454590- - triangles are the sides of the square, it follows that the
side length of the square is 20 inches.
Choice B is incorrect. This is the length of a radius, in inches, of the circle.
Choice C is incorrect. This is the length of a diameter, in inches, of the circle.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-c6dff223$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Triangle ABC is similar to triangle DEF, where angle A corresponds to angle D and angles C and F are right angles. The length of--AB is 2·9
times the length of--DE. If tan A = 21/2o , what is the value of SinD?$qb$, null, null, null, array[$qb$.7241$qb$, $qb$21/29$qb$]::text[], $qb$The correct answer is 21/29 . It's given that triangle ABC is similar to triangle DEF, where angle A corresponds to angle D and angles C and F
are right angles. In similar triangles, the tangents of corresponding angles are equal. Therefore, if tan A = 21/20, then tan D = 21/20 . In a right
triangle, the tangent of an acute angle is the ratio of the length of the leg opposite the angle to the length of the leg adjacent to the angle.
Therefore, in triangle DEF, if tan D = 21/2o , the ratio of the length of --EF to the length of--DF is 21/20 . If the lengths of --EF and--DF are 21 and
20, respectively, then the ratio of the length of--EF to the length of--DF is 21/20 . In a right triangle, the sine of an acute angle is the ratio of the
length of the leg opposite the angle to the length of the hypotenuse. Therefore, the value of SinD is the ratio of the length of--EF to the length
of--DE. The length of--DE can be calculated using the Pythagorean theorem, which states that if the lengths of the legs of a right triangle are a
and b and the length of the hypotenuse is c, then a2 + b2 = c2 . Therefore, if the lengths of --EF and--DF are 21 and 20, respectively, then (21)^(2)
, or 841 = (DE)^(2). Taking the positive square root of both sides of this equation yields 29 = DE. Therefore, if the lengths
+(20)/EF-2 = )2
of and are 21 and 20, respectively, then the length of --DE is 29 and the ratio of the length of --EF to the length of --DE is 21/29 . Thus, if
tan A = 21/20 , the value of SinD is 21/29 . Note that 21/29, .7241, and 0.724 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-eb70d2d0$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-(? 10II123456789004477669922883355II ?)/(-/--/--/--/-(?- - -22 -II ?- II 22)/-555 444 333 2 ÷÷÷÷?15432?44223355II 1 2 333 444? 555 666 777)|| || || || || | || || || || || || || | x
What is the area, in square units, of the triangle formed by connecting the three points shown?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-eb70d2d0.png$qb$, null, null, array[$qb$24.5$qb$, $qb$49/2$qb$]::text[], $qb$The correct answer is 24·5. It's given that a triangle is formed by connecting the three points shown, which are (-3, 4), (5, 3) , and (4, -3) . Let
this triangle be triangle A. The area of triangle A can be found by calculating the area of the rectangle that circumscribes it and subtracting the
areas of the three triangles that are inside the rectangle but outside triangle A. The rectangle formed by the points (-3, 4) , (5, 4), , and
(5,(-5,34))
circumscribes triangle A. The width, in units, of this rectangle can be found by calculating the distance between the points  and
((5-,3-, 3-)3)
. This distance is 4- (-3) , or 7. The length, in units, of this rectangle can be found by calculating the distance between the points
(5, 4) and (-3, 4). This distance is 5 - (-3), or 8. It follows that the area, in square units, of the rectangle is (7)(8) , or 56. One of the triangles
that lies inside the rectangle but outside triangle A is formed by the points , , and (5, 3) . The length, in units, of a base of this
(5, 4)(-3^(,)(45), 3(5)^(,) 4)
triangle can be found by calculating the distance between the points  and . This distance is 4 - 3, or 1. The corresponding height, in
units, of this triangle can be found by calculating the distance between the points (5, 4) and (-3, 4) . This distance is 5 - (-3) , or 8. It follows
that the area, in square units, of this triangle is 1/2(8)(1) , or 4. A second triangle that lies inside the rectangle but outside triangle A is formed by
the points , , and (5, -3) . The length, in units, of a base of this triangle can be found by calculating the distance between the
(5, 3(4) , -3)(5(,5-, 33))
points  and . This distance is  , or 6. The corresponding height, in units, of this triangle can be found by calculating the
(43,--3(-) 3)
distance between the points (5, -3) and . This distance is 5 - 4, or 1 . It follows that the area, in square units, of this triangle is
1/2(1)(6) , or 3. The third triangle that lies inside the rectangle but outside triangle A is formed by the points , (-3, -3), and (4, -3) . The
(4, -3(-) 3^(,) 4)(-3, -3)
length, in units, of a base of this triangle can be found by calculating the distance between the points  and . This distance is 4
- (-3) , or 7. The corresponding height, in units, of this triangle can be found by calculating the distance between the points (-3, 4) and
(-3, -3) . This distance is 4- (-3) , or 7. It follows that the area, in square units, of this triangle is 1/2(7)(7) , or 24·5. Thus, the area, in square
units, of the triangle formed by connecting the three points shown is 56 - 4 - 3 - 24·5, or 24·5. Note that 24.5 and 49/2 are examples of ways
to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-4757123b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Trapezoid A and trapezoid B are similar. The length of each side of trapezoid A is 41 times the length of the corresponding side of trapezoid B.
The area of trapezoid A is how many times as large as the area of trapezoid B?$qb$, null, null, null, array[$qb$1681$qb$]::text[], $qb$The correct answer is 1,681 . It’s given that trapezoid A and trapezoid B are similar. When two trapezoids are similar, the scale factor between
their corresponding side lengths is k, and the scale factor between their areas is k^(2). It’s given that the length of each side of trapezoid A is 41
times the length of the corresponding side of trapezoid B, so the scale factor between their corresponding side lengths is 41. It follows that the
scale factor between the areas is 41^(2) , or 1,681 . Therefore, the area of trapezoid A is 1,681 times as large as the area of trapezoid B.$qb$);
select seed_pool_question($qb$CB-64d1f49f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$??z?°^(°)
Note: Figuren0tdraWntoSCaIe·
In the figure, two lines intersect at a point. If w = 136, what is the value of z?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-64d1f49f.png$qb$, $qb$[{"label": "A", "body": "36"}, {"label": "B", "body": "44"}, {"label": "C", "body": "68"}, {"label": "D", "body": "136"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. In the figure shown, the angles with measures w^(°) and z^(°) are vertical angles. Since vertical angles are congruent, w = z.
Therefore, if w = 136, the value of z is 136.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the measure, in degrees, of an angle that's supplementary, not congruent, to the angle with measure w^(?).
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-f329442c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Circle A has a radius of 3n and circle B has a radius of 129n, where n is a positive constant. The area of circle B is how many times the area of
circle A?$qb$, null, $qb$[{"label": "A", "body": "43"}, {"label": "B", "body": "86"}, {"label": "C", "body": "129"}, {"label": "D", "body": "1,849"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area of a circle can be found by using the formula A = πr2, where A is the area and r is the radius of the circle. It’s
given that the radius of circle A is 3n. Substituting this value for r into the formula A = πr2 gives A = π(3n)^(2), or 9πn2 . It’s also given that the
radius of circle B is 129n. Substituting this value for r into the formula A = πr2 gives A = π(129n)^(2), or 16,641πn^(2). Dividing the area of circle
B by the area of circle A gives (16,641πn^(2))/9πn2 , which simplifies to 1,849. Therefore, the area of circle B is 1,849 times the area of circle A.
Choice A is incorrect. This is how many times greater the radius of circle B is than the radius of circle A.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the coefficient on the term that describes the radius of circle B.$qb$);
select seed_pool_question($qb$CB-f39f88b7$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A triangle has a base length of 40 centimeters and a height of 90 centimeters. What is the area, in square centimeters, of the triangle?$qb$, null, null, null, array[$qb$1800$qb$]::text[], $qb$The correct answer is 1,800. The area, A, of a triangle can be found using the formula A = 1/2bh, where b is the base length of the triangle and
h is the height of the triangle. It’s given that the triangle has a base length of 40 centimeters and a height of 90 centimeters. Substituting 40 for b
and 90 for h in the formula A = 1/2bh yields A = 1/2 (40)(90) , or A = 1,800. Therefore, the area, in square centimeters, of the triangle is
1,800.$qb$);
select seed_pool_question($qb$CB-92eb236a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In a right triangle, the tangent of one of the two acute angles is . What is the tangent of the other acute angle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-92eb236a.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The tangent of a nonright angle in a right triangle is defined as the ratio of the length of the leg opposite the angle to the
length of the leg adjacent to the angle. Using that definition for tangent, in a right triangle with legs that have lengths a and b, the tangent of one
acute angle is  and the tangent for the other acute angle is . It follows that the tangents of the acute angles in a right triangle are
reciprocals of each other. Therefore, the tangent of the other acute angle in the given triangle is the reciprocal of  or .
Choice A is incorrect and may result from assuming that the tangent of the other acute angle is the negative of the tangent of the angle
described. Choice B is incorrect and may result from assuming that the tangent of the other acute angle is the negative of the reciprocal of the
tangent of the angle described. Choice C is incorrect and may result from interpreting the tangent of the other acute angle as equal to the
tangent of the angle described.$qb$);
select seed_pool_question($qb$CB-ae33e0a1$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A right circular cylinder has a base diameter of 22 centimeters and a height of 6 centimeters. What is the volume, in cubic centimeters, of the
cylinder?$qb$, null, $qb$[{"label": "A", "body": "132π"}, {"label": "B", "body": "264π"}, {"label": "C", "body": "726π"}, {"label": "D", "body": "2,904π"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The volume, V, of a right circular cylinder is given by the formula V = πr2h, where r is the radius of the base of the cylinder
and h is the height of the cylinder. It's given that a right circular cylinder has a height of 6 centimeters. Therefore, h = 6. It's also given that the
cylinder has a base diameter of 22 centimeters. The radius of a circle is half the diameter of the circle. Since the base of a right circular cylinder
is a circle, it follows that the radius of the base of the right circular cylinder is 22/2 , or 11, centimeters. Therefore, r = 11. Substituting 11 for r
and 6 for h in the formula V = πr2h yields V = π(11)^(2)(6) , which is equivalent to V = π(121)(6), or V = 726π. Therefore, the volume, in
cubic centimeters, of the cylinder is 726π.
Choice A is incorrect. This is the volume of a right circular cylinder that has a base diameter of 2√-22, not 22, centimeters and a height of 6
centimeters.
Choice B is incorrect. This is the volume of a right circular cylinder that has a base diameter of 4√-11, not 22, centimeters and a height of 6
centimeters.
Choice D is incorrect. This is the volume of a right circular cylinder that has a base diameter of 44, not 22, centimeters and a height of 6
centimeters.$qb$);
select seed_pool_question($qb$CB-76670c80$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$Each side of a square has a length of 45. What is the perimeter of this square?$qb$, null, null, null, array[$qb$180$qb$]::text[], $qb$The correct answer is 180. The perimeter of a polygon is equal to the sum of the lengths of the sides of the polygon. It’s given that each side of
the square has a length of 45. Since a square is a polygon with 4 sides, the perimeter of this square is 45 + 45 + 45 + 45, or 180.$qb$);
select seed_pool_question($qb$CB-17912810$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$q? --???b° ?? ? ??? ??
N0te: Figuren0tdraWnt0SCaIe·
In the figure, parallel lines q and t are intersected by lines r and s. If a = 43 and b = 122, what is the value of w?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-17912810.png$qb$, null, null, array[$qb$101/2$qb$, $qb$50.5$qb$]::text[], $qb$The correct answer is 101/2 . In the figure, lines qr, , and s form a triangle. One interior angle of this triangle is vertical to the angle marked a^(?);
therefore, the interior angle also has measure a^(°). It's given that a = 43. Therefore, the interior angle of the triangle has measure 43^(°). A second
interior angle of the triangle forms a straight line, q, with the angle marked b^(°). Therefore, the sum of the measures of these two angles is 180^(°).
It's given that b = 122. Therefore, the angle marked b^(?) has measure 122^(°) and the second interior angle of the triangle has measure
, or 58^(°). The sum of the interior angles of a triangle is 180^(°). Therefore, the measure of the third interior angle of the triangle is
((118800 -- 41322-)^(°)58)^(?)
, or 79^(°). It's given that parallel lines q and t are intersected by line r. It follows that the triangle's interior angle with measure
79^(°) is congruent to the same side interior angle between lines q and t formed by lines t and r. Since this angle is supplementary to the two
angles marked w^(?), the sum of 79^(?), w^(?), and w^(°) is 180^(?). It follows that 79 + w + w = 180, or 79 + 2w = 180. Subtracting 79 from both sides
of this equation yields 2w = 101. Dividing both sides of this equation by 2 yields w = 1o1/2 . Note that 101/2 and 50.5 are examples of ways to
enter a correct answer.$qb$);
select seed_pool_question($qb$CB-4420e500$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the area of a rectangle with a length of 4 centimeterS (cm) and a width of 2 cm?$qb$, null, $qb$[{"label": "A", "body": "6 cm2"}, {"label": "B", "body": "8 cm2"}, {"label": "C", "body": "12 cm2"}, {"label": "D", "body": "36 cm2"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The area of a rectangle with length ℓ and width w can be found using the formula A = ℓw. It’s given that the rectangle has
a length of 4 cm and a width of 2 cm. Therefore, the area of this rectangle is (4cm)(2cm), or 8 cm2.
Choice A is incorrect. This is the sum, in cm, of the length and width of the rectangle, not the area, in cm2.
Choice C is incorrect. This is the perimeter, in cm, of the rectangle, not the area, in cm2.
Choice D is incorrect. This is the sum of the length and width of the rectangle squared, not the area.$qb$);
select seed_pool_question($qb$CB-099526fc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-(??10121416IIIIIIII246?0044446666222288 ?)/(?888 -666 -444 -222 ? 222 444 666 888)|| || || || || || || || | || || || || || || || || |x
The line segment shown in the xy-plane represents one of the legs of a right triangle. The area of this triangle is 36√-13 square units. What is the
length, in units, of the other leg of this triangle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-099526fc.png$qb$, $qb$[{"label": "A", "body": "12"}, {"label": "B", "body": "24"}, {"label": "C", "body": "3√-13"}, {"label": "D", "body": "18√-13"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The length of a segment in the xy-plane can be found using the distance formula, , where
(x1 , y1 ) and (x2 , y2 ) are the endpoints of the segment. The segment shown has endpoints at √((-6, 4√) (^(x2))/((3 - (-6))^(2) + (10 - 4)^(2))-(-3,x110))2 + (y2 - y1)2 and . Substituting (-6, 4) and
(3, 10) for  and (x2 , y2 ) , respectively, in the distance formula yields , or √-9^(2) + 6^(2), which is equivalent to
(x1√, (y1))/117
√-81 + 36, or . Let x represent the length, in units, of the other leg of this triangle. The area, A, of a right triangle can be calculated using
the formula , where b and h are the lengths of the legs of the triangle. It's given that the area of the triangle is 36√-13 square units.
A36=√(1/2)/13bh
Substituting  for A, √-117 for b, and x for h in the formula A = 1/2bh yields . Multiplying both sides of this
36√-13 (=721/(√^(2))(/13)/(√-117)√=-11x7) (x)
equation by 2 yields 72√-13 = x√-117. Dividing both sides of this equation by √-117 yields . Multiplying the numerator and
denominator on the left-hand side of this equation by √-117 yields (72√-1,521)/117 = x, or (72(39))/117 = x, which is equivalent to (2,808)/117 = x, or 24 = x.
Therefore, the length, in units, of the other leg of this triangle is 24.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. 3√-13 is equivalent to √-117, which is the length, in units, of the line segment shown in the xy-plane, not the length, in
units, of the other leg of the triangle.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-ffc39dc5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?
???x° y°
C ?
Note: FigurenotdraWntoSCaIe·
In the figure shown, CD = EF and FC = DE. If x = 65 and y = 30, what is the measure of ∠CDE?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-ffc39dc5.png$qb$, $qb$[{"label": "A", "body": "30^(°)"}, {"label": "B", "body": "65^(°)"}, {"label": "C", "body": "95^(?)"}, {"label": "D", "body": "130^(°)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It’s given that CD = EF and FC = DE, and the figure shows that --DF is a side of both △CDF and △EFD. Since
△CDF and △EFD have three pairs of congruent sides, the triangles are congruent, where ∠CFD corresponds to ∠EDF and ∠CDF
corresponds to ∠EFD. It’s given that the measure of ∠EDF is 65^(°) and the measure of ∠EFD is 30^(°). Since corresponding angles of
congruent triangles are congruent, ∠CFD is congruent to ∠EDF and ∠CDF is congruent to ∠EFD. Therefore, the measure of ∠CFD is
65^(°) and the measure of ∠CDF is 30^(°). Since ∠CDE is made up of ∠CDF and ∠EDF, it follows that the measure of ∠CDE is equal to
the sum of the measures of ∠CDF and ∠EDF. Therefore, the measure of ∠CDE is equal to (30 + 65)^(°), or 95^(°).
Choice A is incorrect. This is the measure of ∠CDF, not the measure of ∠CDE.
Choice B is incorrect. This is the measure of ∠CFD, not the measure of ∠CDE.
Choice D is incorrect. This is the sum of the measures of ∠CFD and ∠EDF, not ∠CDF and ∠EDF.$qb$);
select seed_pool_question($qb$CB-8364487a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$T
V ?25^(°) ? ?
??
N0tc: FigurenotdraWnt0SCaIe·
Triangle TUV is dilated by a scale factor of  to obtain triangle T^(?)U^(?)V^(?) (not shown), where T corresponds to T^(?) and U corresponds to U^(?) .
V?1/2
What is the measure, in degrees, of angle ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-8364487a.png$qb$, $qb$[{"label": "A", "body": "25"}, {"label": "B", "body": "38"}, {"label": "C", "body": "50"}, {"label": "D", "body": "76"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that triangle TUV is dilated by a scale factor of 1/2 to obtain triangle T^(?)U^(?)V^(?), where T corresponds to T^(?) and U
corresponds to U^(?) . A dilation is a transformation that multiplies all side lengths by the same scale factor while preserving angle measures.
Therefore, corresponding angles in triangles TUV and T^(?)U^(?)V^(?) are equal. Since V corresponds to V^(?), the measure of angle V^(?) is equal to the
measure of angle V. The figure shows that the measure of angle V is 25^(°), so it follows that the measure of angle V^(?) is also 25^(°).
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the length of--VU, not the measure, in degrees, of angle V^(?) .$qb$);
select seed_pool_question($qb$CB-17049054$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The length of a side of square X is 9 centimeters. The area of rectangle Y is 32 square centimeters. What is the total area, in square centimeters,
of square X and rectangle Y?$qb$, null, $qb$[{"label": "A", "body": "145"}, {"label": "B", "body": "113"}, {"label": "C", "body": "82"}, {"label": "D", "body": "81"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The area of a square is s2, where s is the side length of the square. It’s given that the length of a side of square X is 9
centimeters. It follows that the area of square X is 9^(2) , or 81 square centimeters. It’s also given that the area of rectangle Y is 32 square
centimeters. Therefore, the total area, in square centimeters, of square X and rectangle Y is 81 + 32, or 113.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the area of square X, not the total area of square X and rectangle Y, in square centimeters.$qb$);
select seed_pool_question($qb$CB-c4e5e23c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The length of one side of square M is 6 times the length of one side of square N. The area of square N is 49 square feet. What is the area, in
square feet, of square M?$qb$, null, $qb$[{"label": "A", "body": "1,764"}, {"label": "B", "body": "504"}, {"label": "C", "body": "294"}, {"label": "D", "body": "252"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The area, A, of a square is given by the equation A = s2, where s is the length of one side of the square. Let x represent the
length, in feet, of one side of square N. It's given that the area of square N is 49 square feet; therefore, it follows that 49 = x2. It’s also given that
the length of one side of square M is 6 times the length of one side of square N. Therefore, the length of one side of square M can be
represented by the expression 6x. Substituting 6x for s in the equation A = s2 yields A = (6x)^(2), or A = 36x^(2). Since 49 = x2, substituting
49 for x2 in the equation A = 36x^(2) yields A = 36(49) , or A = 1,764. Therefore, the area, in square feet, of square M is 1,764.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-42155bac$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The area of one of the bases of a right circular cylinder is 81 square centimeters, and the volume of the cylinder is 2,187 cubic centimeters.
What is the height, in centimeters, of the cylinder?$qb$, null, $qb$[{"label": "A", "body": "27"}, {"label": "B", "body": "2,025"}, {"label": "C", "body": "2,106"}, {"label": "D", "body": "177,147"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The volume, V, of a right circular cylinder is given by the formula V = πr2h, where πr2 is the area of one of the bases of the
cylinder and h is the height. It’s given that the area of one of the bases of the cylinder is 81 square centimeters and that the volume of the
cylinder is 2,187 cubic centimeters. Substituting 2,187 for V and 81 for πr2 in the formula V = πr2h yields 2,187 = 81h. Dividing both sides
of this equation by 81 yields 27 = h. Therefore, the height, in centimeters, of the cylinder is 27.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a67b9f88$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$? ?5? ??^(?)
N0tc: FigurenotdraWnt0SCaIe·
In the triangle shown, RS = √-105. What is the value of SinR?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a67b9f88.png$qb$, null, null, array[$qb$.9811$qb$, $qb$52/53$qb$]::text[], $qb$The correct answer is 52/53 . In a right triangle, the square of the length of the hypotenuse is equal to the sum of the squares of the lengths of the
two legs. The length of the hypotenuse of the right triangle shown is 53. It’s given that RS = √-105. Therefore, the length of one of the legs of
the triangle shown is √-105. Let x represent TS, the length of the other leg of the triangle shown. Therefore, 53^(2) = (√-105)^(2) + x^(2), or 2,809
= 105 + x^(2) . Subtracting 105 from both sides of this equation yields 2,704 = x^(2). Taking the positive square root of both sides of this equation
yields 52 = x. Therefore, ?S, the length of the other leg of the triangle shown, is 52. The sine of an acute angle in a right triangle is defined as
the ratio of the length of the leg opposite the angle to the length of the hypotenuse. The length of the leg opposite angle R is 52, and the length
of the hypotenuse is 53. Therefore, the value of SinR is 52/53 . Note that 52/53 or .9811 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-165c30c4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A rectangle has a length of 64 inches and a width of 32 inches. What is the area, in square inches, of the rectangle?$qb$, null, null, null, array[$qb$2048$qb$]::text[], $qb$The correct answer is 2,048. The area A, in square inches, of a rectangle is equal to the product of its length ℓ, in inches, and its width w, in
inches, or A = ℓw. It's given that the rectangle has a length of 64 inches and a width of 32 inches. Substituting 64 for ℓ and 32 for w in the
equation A = ℓw yields A = (64)(32) , or A = 2,048. Therefore, the area, in square inches, of the rectangle is 2,048.$qb$);
select seed_pool_question($qb$CB-694b7fce$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A ??BC| ???
Note: FigurenotdraWntoSCaIe·
In the figure shown, AB = √-34 units, AC = 3 units, and CE = 21 units. What is the area, in square units, of triangle ADE?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-694b7fce.png$qb$, null, null, array[$qb$480$qb$]::text[], $qb$The correct answer is 480. It's given in the figure that angle ACB and angle AED are right angles. It follows that angle ACB is congruent to
angle AED. It's also given that angle BAC and angle DAE are the same angle. It follows that angle BAC is congruent to angle DAE. Since
triangles ABC and ADE have two pairs of congruent angles, the triangles are similar. Sides AB and AC in triangle ABC correspond to sides
AD and AE, respectively, in triangle ADE. Corresponding sides in similar triangles are proportional. Therefore, . It's given that AC
AD/AABC= 2AE/A4C
= 3 units and CE = 21 units. Therefore, AE = 24 units. It’s also given that AB = √-34 units. Substituting 3 for ,  for AE, and √-34 for
AB in the equation AD/AB = AE/AC yields AD/(√-34) = 24/3 , or AD/(√-34) = 8. Multiplying each side of this equation by √-34 yields AD = 8√-34. By the
Pythagorean theorem, if a right triangle has a hypotenuse with length c and legs with lengths a and b, then a2 + b2 = c2. Since triangle ADE is
a right triangle, it follows that AD represents the length of the hypotenuse, c, and DE and AE represent the lengths of the legs, a and b.
Substituting 24 for b and 8√-34 for c in the equation a2 + b2 = c2 yields , which is equivalent to a^(2) + 576 = 64(34) ,
a^(2) +a(224=)^(2)1=,60(08√-34)^(2)
or a^(2) + 576 = 2,176. Subtracting 576 from both sides of this equation yields . Taking the square root of both sides of this equation
yields a = ?40. Since a represents a length, which must be positive, the value of a is 40. Therefore, DE = 40. Since DE and AE represent
the lengths of the legs of triangle ADE, it follows that DE and AE can be used to calculate the area, in square units, of the triangle as
1/2 (40)(24) , or 480. Therefore, the area, in square units, of triangle ADE is 480.$qb$);
select seed_pool_question($qb$CB-585a9138$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Triangles ABC and DEF are congruent, where A corresponds to D, and B and E are right angles. The measure of angle A is 27^(°). What is the
measure, in degrees, of angle F?$qb$, null, null, null, array[$qb$63$qb$]::text[], $qb$The correct answer is 63. It's given that triangles ABC and DEF are congruent with angle A corresponding to angle D. Corresponding angles
of congruent triangles are congruent and, therefore, have equal measure. It's given that the measure of angle A is 27^(°). It follows that the
measure of angle D is also 27^(?). It's given that angle E is a right angle. Therefore, the measure of angle E is 90^(°). Let x represent the measure, in
degrees, of angle F. Since the measures of the angles in a triangle sum to 180^(?), it follows that 27 + 90 + x = 180, or 117 + x = 180.
Subtracting 117 from both sides of this equation yields x = 63. Therefore, the measure, in degrees, of angle F is 63.$qb$);
select seed_pool_question($qb$CB-2be01bd9$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Triangle ABC is similar to triangle DEF, where angle A corresponds to angle D and angle C corresponds to angle F. Angles C and F are
right angles. If tan(A) = 5o/7 , what is the value of tan(E) ?$qb$, null, null, null, array[$qb$.14$qb$, $qb$7/50$qb$]::text[], $qb$The correct answer is . It's given that triangle ABC is similar to triangle DEF, where angle A corresponds to angle D and angle C
7/F50
corresponds to angle . In similar triangles, the tangents of corresponding angles are equal. Since angle A and angle D are corresponding
angles, if tan(A) = 50/7 , then tan(D) = 50/7 . It's also given that angles C and F are right angles. It follows that triangle DEF is a right triangle
with acute angles D and E. The tangent of one acute angle in a right triangle is the inverse of the tangent of the other acute angle in the triangle.
Therefore, tan(E) = 1/(tan(D)) . Substituting 50/7 for tan(D) in this equation yields tan(E) = 1/((?0)/7), or tan(E) = 7/50 . Thus, if tan(A) = 50/7 , the
value of tan(E) is 7/50 . Note that 7/50 and .14 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-3828f53d$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the figure above, lines m and n are parallel. What is the value of b ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3828f53d.png$qb$, $qb$[{"label": "A", "body": "40"}, {"label": "B", "body": "50"}, {"label": "C", "body": "65"}, {"label": "D", "body": "80"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Given that lines m and n are parallel, the angle marked 130° must be supplementary to the leftmost angle marked a° because
they are same-side interior angles. Therefore, 130° + a° = 180°, which yields a = 50°. Lines  and m intersect at a right angle, so lines j, , and m
form a right triangle where the two acute angles are a° and b°. The acute angles of a right triangle are complementary, so a° + b° = 90°, which
yields 50° + b° = 90°, and b = 40.
Choice B is incorrect. This is the value of a, not b. Choice C is incorrect and may be the result of dividing 130° by 2. Choice D is incorrect and may
be the result of multiplying b by 2.$qb$);
select seed_pool_question($qb$CB-a38c0183$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$-/(- - - O-)/((- -)/??????462)||??6|| ?||?4|| || ?2|| ||??62 | || ?2|| || ?x
Circle A (shown) is defined by the equation (x + 2)^(2) + y^(2) = 9. Circle B (not shown) is the result of shifting circle A down 6 units and increasing
the radius so that the radius of circle B is 2 times the radius of circle A. Which equation defines circle B?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a38c0183.png$qb$, $qb$[{"label": "A", "body": "(x + 2)^(2) + (y + 6)^(2) = (4)(9)"}, {"label": "B", "body": "2(x + 2)^(2) + 2(y + 6)^(2) = 9"}, {"label": "C", "body": "(x + 2)^(2) + (y - 6)^(2) = (4)(9)"}, {"label": "D", "body": "2(x + 2)^(2) + 2(y - 6)^(2) = 9"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. According to the graph, the center of circle A has coordinates (-2, 0), and the radius of circle A is 3. It’s given that circle B is
the result of shifting circle A down 6 units and increasing the radius so that the radius of circle B is 2 times the radius of circle A. It follows that
the center of circle B is 6 units below the center of circle A. The point that's 6 units below (-2, 0) has the same x-coordinate as  and has
(-2, 0 - 6)(-2^(,) 0)
a y-coordinate that is 6 less than the y-coordinate of (-2, 0) . Therefore, the coordinates of the center of circle B are , or (-2, -6).
Since the radius of circle B is 2 times the radius of circle A, the radius of circle B is (2)(3) . A circle in the xy-plane can be defined by an equation
of the form , where the coordinates of the center of the circle are (h, k) and the radius of the circle is r. Substituting
-2+ (y + 6)-2(6=x -(2h)2)^(2)(3+)2((2y)-(3)k)^(2) = r^(2) for h,  for k, and  for r in this equation yields , which is equivalent to (x + 2)^(2)
(x + 2)^(2) + (y + 6)^(2) = (4)(9()^(x) - (-2))^(2) + (y - (-6()x)^(2)+=2)(^(2)(2+)((3y))+^(2)6)^(2) = (4)(9)
, or . Therefore, the equation  defines circle B.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This equation defines a circle that’s the result of shifting circle A up, not down, by 6 units and increasing the radius.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-739f1bbc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In triangle ABCAB = 4,680miIIimeterS, (mm) and BC = 4,680mm. Which statement is sufficient to prove that triangle ABC is
equilateral?$qb$, null, $qb$[{"label": "A", "body": "AC = 4,680mm"}, {"label": "B", "body": "AC = 468mm"}, {"label": "C", "body": "AC = 46·8mm"}, {"label": "D", "body": "AC = 4·68mm"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. In an equilateral triangle, all three sides have the same length. It’s given that in triangle ABCAB = 4,680mm,  and BC
= 4,680mm. Therefore, if AC = 4,680mm, then all three sides of triangle ABC have the same length, so triangle ABC is equilateral.
Therefore, AC = 4,680mm is sufficient to prove that triangle ABC is equilateral.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1b687ae3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The area of a triangle is 36 square units. If the height of this triangle is 2 units, what is the length, in units, of the base of this triangle?$qb$, null, null, null, array[$qb$36$qb$]::text[], $qb$The correct answer is 36. The area, A, of a triangle is given by the formula A = 1/2bh, where b represents the length of the base of the triangle
and h represents its height. It’s given that the triangle has an area of 36 square units and a height of 2 units. Substituting 36 for A and 2 for h in
the formula A = 1/2bh yields 36 = 1/2b(2) , or 36 = b. Thus, the length, in units, of the base of this triangle is 36.$qb$);
select seed_pool_question($qb$CB-c984f1a5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A hemisphere is half of a sphere. If a hemisphere has a radius of 27 inches, which of the following is closest to the volume, in cubic inches, of
this hemisphere?$qb$, null, $qb$[{"label": "A", "body": "1,500"}, {"label": "B", "body": "6,100"}, {"label": "C", "body": "30,900"}, {"label": "D", "body": "41,200"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The volume, V, of a sphere is given by , where r is the radius of the sphere. Since a hemisphere is half of a
V = 4/3Vπ=r3
sphere, it follows that the volume, V, of a hemisphere is given by ( 1/2 ) ( 4/3 ) πr3 , or V = 2/3 πr3 . Substituting 27 for r in this formula yields
V = 2/3π(27)3 , which gives V = 13,122π, or V is approximately equal to 41,223·98. Therefore, the choice that is closest to the volume, in
cubic inches, of this hemisphere is 41,200.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-0013adbd$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?
?
(?^(°))/(134^(°))(X^(°) ?^(°))/(?^(°))?
?
N0te: FigurenotdraWnt0SCaIe·
In the figure, line t intersects lines j and k. Which additional piece of information is sufficient to prove that lines j and k are parallel?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-0013adbd.png$qb$, $qb$[{"label": "A", "body": "x = 46"}, {"label": "B", "body": "y = 46"}, {"label": "C", "body": "w = 134"}, {"label": "D", "body": "z = 134"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. In the figure shown, line t, which is a transversal, intersects lines j and k. If two lines are intersected by a transversal and the
measures of a pair of same-side interior angles sum to 180^(°), then the lines are parallel. In the figure, the angle measuring 134^(?) and the angle
measuring x^(?) are a pair of same-side interior angles. If x = 46, (134 + x)^(°)= (134 + 46)^(°), or (134 + x)^(°)= 180^(?). Therefore, x = 46 is
sufficient to prove that lines j and k are parallel.
Choice B is incorrect. The angle measuring y? and the angle measuring 134^(°) are alternate interior angles. If y = 46 rather than y = 134, then
lines j and k would not be parallel.
Choice C is incorrect. The angle measuring w^(°) and the angle measuring 134^(?) are vertical angles. Thus, w = 134 whether lines j and k are
parallel or not.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-acd30391$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle in the xy-plane has equation . Which of the following points does NOT lie in the interior of the circle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-acd30391.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The circle with equation  has center  and radius 5. For a point to be inside of the circle,
the distance from that point to the center must be less than the radius, 5. The distance between  and  is
, which is greater than 5. Therefore,  does NOT lie in the interior of the circle.
Choice A is incorrect. The distance between  and  is , which is less
than 5, and therefore  lies in the interior of the circle. Choice B is incorrect because it is the center of the circle. Choice C is incorrect
because the distance between  and  is , which is less than 5, and therefore
in the interior of the circle.$qb$);
select seed_pool_question($qb$CB-4ff7b652$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$Right triangles LMN and PQR are similar, where L and M correspond to P and Q, respectively. Angle M has a measure of 53^(°). What is the
measure of angle Q?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-4ff7b652.png$qb$, $qb$[{"label": "A", "body": "37^(°)"}, {"label": "B", "body": "53^(°)"}, {"label": "C", "body": "127^(?)"}, {"label": "D", "body": "143^(°)"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. It’s given that triangle LMN is similar to triangle PQR. Corresponding angles of similar triangles are congruent. Since
angle M and angle Q correspond to each other, they must be congruent. Therefore, if the measure of angle M is 53^(?), then the measure of angle
Q is also 53^(°).
Choice A is incorrect and may result from concluding that angle M and angle Q are complementary rather than congruent.
Choice C is incorrect and may result from concluding that angle M and angle Q are supplementary rather than congruent.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-053e5e9f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$?N0tc: Figuren2ot5draWnt0SCaIe· ???
?
In triangle QRS shown, QR < RS. Which expression represents the length of --QS?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-053e5e9f.png$qb$, $qb$[{"label": "A", "body": "25c0SQ"}, {"label": "B", "body": "25SinQ"}, {"label": "C", "body": "25/c08Q"}, {"label": "D", "body": "25/8inQ"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The figure shows that triangle QRS is a right triangle. Each of the given choices is an expression containing SinQ or coSQ.
For an acute angle in a right triangle, the sine of the angle is the length of the opposite leg divided by the length of the hypotenuse, and the cosine
of the angle is the length of the adjacent leg divided by the length of the hypotenuse. It follows that and c0S Q = QR/QS , where QR
Sin Q = RS/QRSS
< RS. It's given in the figure that the length of side RS is 25. Since only the equation Sin Q = RS/QS contains , an expression representing
QS can be found by substituting 25 for RS in this equation, which yields Sin Q = 25/QS. Multiplying both sides of this equation by QS yields QS
· SinQ = 25. Dividing both sides of this equation by SinQ yields QS = 25/8inQ . Therefore, the expression 25/8inQ represents the length of--QS.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-8027db3f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle JKL c0S(K) = 24/51,  and angle J is a right angle. What is the value of coS(L) ?$qb$, null, null, null, array[$qb$.8823$qb$, $qb$.8824$qb$, $qb$15/17$qb$]::text[], $qb$The correct answer is 15/17 . It's given that angle J is the right angle in triangle JKL. Therefore, the acute angles of triangle JKL are angle K
and angle L. The hypotenuse of a right triangle is the side opposite its right angle. Therefore, the hypotenuse of triangle JKL is side KL. The
cosine of an acute angle in a right triangle is the ratio of the length of the side adjacent to the angle to the length of the hypotenuse. It's given
that c0S(K) = 24/51 . This can be written as c0S(K) = 8/17 . Since the cosine of angle K is a ratio, it follows that the length of the side adjacent to
angle K is 8n and the length of the hypotenuse is 17n, where n is a constant. Therefore, JK = 8n and KL = 17n. The Pythagorean theorem
states that in a right triangle, the square of the length of the hypotenuse is equal to the sum of the squares of the lengths of the other two sides.
For triangle JKL, it follows that . Substituting 8n for JK and 17n for KL yields . This
(JK)^(2) + (JL)^(2) = (6K4nL2)^(2) (JL)2 = 22(85nn)2^(2) + (JL)^(2) = (17n)^(2)
is equivalent to 64n^(2) + (JL)^(2) = 289n^(2) . Subtracting from each side of this equation yields . Taking the square root of
each side of this equation yields JL = 15n. Since c0S(L) = JL/KL , it follows that c0S(L) = 15n/17n , which can be rewritten as c0S(L) = 15/17 . Note
that 15/17, .8824, .8823, and 0.882 are examples of ways to enter a correct answer.$qb$);
select seed_pool_question($qb$CB-e0d2e21a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A ??60° B X ? Y
C
Z
N0te: FigureSn0tdraWnt0SCaIe·
For the triangles shown, triangle ABC is dilated by a scale factor of 3 to obtain triangle XYZ, where d = 16. What is the measure, in degrees,
of angle X?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-e0d2e21a.png$qb$, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "57"}, {"label": "C", "body": "60"}, {"label": "D", "body": "63"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that triangle XYZ is obtained by a dilation of triangle ABC. It follows that triangle ABC is similar to triangle
XYZ, where A corresponds to X. Since corresponding angles in similar triangles have the same measure and the measure of angle A is 60
degrees, it follows that the measure of angle X is also 60 degrees.
Choice A is incorrect and may result from conceptual errors.
Choice B is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-1dacfb94$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$B
?D?0O/(?°)| ?
A F C
N0te: Figuren0t ?ra?nt0SCa1e·
In triangle ABCAB = BC, . Points D and E lie on line segments AB and BC, respectively, such that line segments DE and AC are parallel.
Point O is the midpoint of line segment DE, and the measure of ∠OAC is 30^(?). Point F lies on line segment AC, and line segment BF
passes through point O. If AB = 81 and AO = BO, what is the length of line segment BE?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1dacfb94.png$qb$, null, null, array[$qb$54$qb$]::text[], $qb$The correct answer is 54. It's given that AB = BC, so triangle ABC is isosceles. It's also given that line segments DE and AC are parallel.
Since line segments DE and AC are parallel, triangle BDE is similar to triangle BAC, which means triangle BDE is also isosceles. It’s given
that point O is the midpoint of line segment DE. Since triangle BDE is isosceles, line segment BO splits triangle BDE into two congruent
triangles, where ∠BOD is a right angle. Therefore, ∠BFA is also a right angle. The figure shows that the measure of ∠OAF is 30^(°). It follows
that triangle AOF is a 30-60-90 triangle, where the measure of ∠AOF is 60^(°). In a 30-60-90 triangle, the side opposite the 30^(?) angle is half the
length of the side opposite the 90^(°) angle. Let x represent the length of line segment OF and let 2x represent the length of line segment AO. It's
given that AO = BO. Since AO = BO, the length of line segment BO is also 2x. It follows that the length of line segment BF is BO + OF,
which is 2x + x, or 3x. Since triangle BDE is similar to triangle BAC, the ratio of corresponding side lengths is equal to the ratio of the
heights of the triangles. This means that . Substituting 2x for BO and 3x for BF in this equation yields , or BE/BC = 2/3 . It’s
BE/(B^(B)CC) == BO/8B1F BE/81 = BE/(B2/3C) = 2x/3x
given that AB = 81 and AB = BC, so . Substituting 81 for BC in the equation BE/BC = 2/3 yields . Multiplying both sides of
this equation by 81 yields BE = 2/3 (81) , or BE = 54.$qb$);
select seed_pool_question($qb$CB-cecbdeba$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A right circular cylinder has a volume of 432 cubic centimeters. The area of the base of the cylinder is 24 square centimeters. What is the height,
in centimeters, of the cylinder?$qb$, null, $qb$[{"label": "A", "body": "18"}, {"label": "B", "body": "24"}, {"label": "C", "body": "216"}, {"label": "D", "body": "10,368"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The volume, V, of a right circular cylinder is given by the formula V = πr2h, where πr2 is the area of the base of the
cylinder and h is the height. It’s given that a right circular cylinder has a volume of 432 cubic centimeters and the area of the base is 24 square
centimeters. Substituting 432 for V and 24 for πr2 in the formula V = πr2h yields 432 = 24h. Dividing both sides of this equation by 24
yields 18 = h. Therefore, the height of the cylinder, in centimeters, is 18.
Choice B is incorrect. This is the area of the base, in square centimeters, not the height, in centimeters, of the cylinder.
Choice C is incorrect. This is the height, in centimeters, of a cylinder if its volume is 432 cubic centimeters and the area of its base is 2, not 24,
cubic centimeters.
Choice D is incorrect. This is the height, in centimeters, of a cylinder if its volume is 432 cubic centimeters and the area of its base is 1/24 , not 24,
cubic centimeters.$qb$);
select seed_pool_question($qb$CB-10e059a6$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The measure of angle A is π/216 radians. The measure of angle B is 36 times the measure of angle A. What is the value of coSB?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-10e059a6.png$qb$, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1/2"}, {"label": "C", "body": "(√-2)/2"}, {"label": "D", "body": "(√-3)/2"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the measure of angle A is π/216 radians and the measure of angle B is 36 times the measure of angle A.
Therefore, the measure of angle B is 36(π/216) radians, or π/6 radians. A trigonometric ratio can be found using the unit circle, or a circle with
radius 1 unit. For a unit circle centered at the origin in the xy-plane, the cosine of π/6 radians is the x-coordinate of the point resulting from
traveling a distance of π/6 counterclockwise from the point (1, 0) . This results in the point ( (√-3)/2 , 1/2 ) . Therefore, the value of coSB is (√-3)/2 .
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect. This is the value of SinB, not coSB.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-42b4493b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In a right triangle, the measure of one of the acute angles is 51^(?). What is the measure, in degrees, of the other acute angle?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-42b4493b.png$qb$, $qb$[{"label": "A", "body": "6"}, {"label": "B", "body": "39"}, {"label": "C", "body": "49"}, {"label": "D", "body": "51"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The sum of the measures of the interior angles of a triangle is 180 degrees. Since the triangle is a right triangle, it has one
angle that measures 90 degrees. Therefore, the sum of the measures, in degrees, of the remaining two angles is 180 - 90, or 90. It’s given that
the measure of one of the acute angles in the triangle is 51 degrees. Therefore, the measure, in degrees, of the other acute angle is 90 - 51 , or
39.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the measure, in degrees, of the acute angle whose measure is given.$qb$);
select seed_pool_question($qb$CB-9f9112ab$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$The measure of angle L is 60 degrees. If the measure of angle L is π/n -radians, where n is a constant, what is the value of n?$qb$, null, null, null, array[$qb$3$qb$]::text[], $qb$The correct answer is 3. The measure of an angle in radians is equal to the measure of the angle in degrees multiplied by . It’s given that the
measure of angle L is 60 degrees. Multiplying 60 by  yields 6oπ/18o, or π/3 . It’s also given that the measure of angle n/1 = 3/1π/nπ/180L is  radians, so π/n = π/3 .
1/n = π/(118/3 0)
Dividing both sides of this equation by π yields . Taking the reciprocal of both sides of this equation yields , or n = 3. Therefore,
the value of n is 3.$qb$);
select seed_pool_question($qb$CB-d683a9cc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The figure shows the lengths, in centimeters (cm), of the edges of a right rectangular prism. The volume V of a right rectangular prism is ,
where  is the length of the prism, w is the width of the prism, and h is the height of the prism. What is the volume, in cubic centimeters, of the
prism?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-d683a9cc.png$qb$, $qb$[{"label": "A", "body": "36"}, {"label": "B", "body": "24"}, {"label": "C", "body": "12"}, {"label": "D", "body": "11"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It’s given that the volume of a right rectangular prism is . The prism shown has a length of 6 cm, a width of 2 cm, and a
height of 3 cm. Thus, , or 36 cubic centimeters.
Choice B is incorrect. This is the volume of a rectangular prism with edge lengths of 6, 2, and 2. Choice C is incorrect and may result from only
finding the product of the length and width of the base of the prism. Choice D is incorrect and may result from finding the sum, not the product,
of the edge lengths of the prism.$qb$);
select seed_pool_question($qb$CB-6c67dd47$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Z
X ??| Y
Note: FigurenotdraWntoSCaIe·
In the figure shown, the measure of angle X is 54^(°). The length of -XY is 26 units and the length of -XZ is 19 units. What is the area, in square
units, of triangle XYZ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6c67dd47.png$qb$, $qb$[{"label": "A", "body": "247"}, {"label": "B", "body": "494"}, {"label": "C", "body": "247Sin54^(?)"}, {"label": "D", "body": "494Sin54^(°)"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The area, A, of a triangle is given by the formula A = 1/2bh, where b is the length of a base of the triangle and h is its
corresponding height. It’s given that the length of--XYis 26 units. This length represents a base of the triangle, so b = 26. Let h represent its
corresponding height. It's given that the measure of angle X is 54^(°) and the length of --XZis 19 units. It follows that Sin 54°= h/19 . Multiplying
both sides of this equation by 19 yields 19Sin54^(°)= h. Substituting 26 for b and 19Sin54^(°) for h in the formula A = 1/2bh yields A
= 1/2 (26) (19 Sin 54°) , or A = 247Sin54^(°). Therefore, the area, in square units, of triangle XYZ is 247Sin54^(?).
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-1bf809b5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$11 ??^(X°) 28
N0te: FigurenotdraWnt0SCaIe·
In the triangle shown, what is the value of c0Sx^(?)?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-1bf809b5.png$qb$, null, null, array[$qb$.3928$qb$, $qb$.3929$qb$, $qb$11/28$qb$]::text[], $qb$The correct answer is 11/28 . The cosine of an acute angle in a right triangle is defined as the ratio of the length of the leg adjacent to the angle to
the length of the hypotenuse. In the triangle shown, the length of the leg adjacent to the angle with measure x^(°) is 11 units and the length of the
hypotenuse is 28 units. Therefore, the value of c0Sx^(°) is 11/28 . Note that 11/28, .3928, .3929, 0.392, and 0.393 are examples of ways to enter a
correct answer.$qb$);
select seed_pool_question($qb$CB-27f1db42$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In the xy-plane, circle F is defined by the equation (x + 8)^(2) + (y + 8)^(2) = 25. Circle G has the same center as circle F, and the radius of circle
G is 2 units greater than the radius of circle F. Circle G is defined by the equation (x + 8)^(2) + (y + 8)^(2) = p, where p is a constant. What is the
value of p?$qb$, null, null, null, array[$qb$49$qb$]::text[], $qb$The correct answer is 49. An equation of a circle in the xy-plane can be written as (x - h)^(2) + (y - k)^(2) = r^(2), where the center of the circle is
(h, k) and the radius of the circle is r. It’s given that in the xy-plane, circle F is defined by the equation (x + 8)^(2) + (y + 8)^(2) = 25, which can
be rewritten as (x - (-8))^(2) + (y - (-8))^(2) = 5^(2) . It follows that h = -8, k = -8, and r = 5. Therefore, the center of circle F is (-8,
-8) and the radius of circle F is 5. It’s given that circle G has the same center as circle F, and the radius of circle G is 2 units greater than the
radius of circle F. Therefore, the center of circle G is  and the radius of circle G is 5 + 2, or 7. Substituting -8 for ,  for k, and 7
(x + 8)^(2) + (y +h -8)8^(2) = 49
for r into the equation (x - h)^(2) + (y - k)^(2) = r^(2)(x + 8(-)28+(^(,)x-(+y8)+8)8^(2))+2 =(y4+98)^(2) = 7^(2) yields , which is equivalent to . It
follows that circle G is defined by the equation ; therefore, the value of p is 49.$qb$);
select seed_pool_question($qb$CB-14e7c1f4$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$For two acute angles, ∠Q and ∠RcoS(Q) = Sin(R), . The measures, in degrees, of ∠Q and ∠R are x + 61 and 4x + 4, respectively. What is
the value of x?$qb$, null, $qb$[{"label": "A", "body": "5"}, {"label": "B", "body": "19"}, {"label": "C", "body": "23"}, {"label": "D", "body": "29"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. It's given that for two acute angles, ∠Q and ∠Rc0S(Q) = Sin(R), . For two acute angles, if the sine of one angle is equal
to the cosine of the other angle, the angles are complementary. It follows that ∠Q and ∠R are complementary. That is, the sum of the
measures of the angles is 90 degrees. It's given that the measure of ∠Q is x + 61 degrees and the measure of ∠R is 4x + 4 degrees. It
follows that (x + 61) + (4x + 4) = 90. By combining like terms, this equation can be rewritten as 5x + 65 = 90. Subtracting 65 from each
side of this equation yields 5x = 25. Dividing each side of this equation by 5 yields x = 5.
Choice B is incorrect. This would be the value of x if c0S(Q) = c0S(R) rather than coS(Q) = Sin(R).
Choice C is incorrect. This would be the value of x if c0S(Q) = - c0S(R) rather than coS(Q) = Sin(R) and if ∠R were obtuse rather than
acute.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-a2e76b60$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A cylindrical can containing pieces of fruit is filled to the top with syrup before being sealed. The base of the can has an area of , and
the height of the can is 10 cm. If  of syrup is needed to fill the can to the top, which of the following is closest to the total volume of
the pieces of fruit in the can?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-a2e76b60.png$qb$, $qb$[{"label": "A", "body": ""}, {"label": "B", "body": ""}, {"label": "C", "body": ""}, {"label": "D", "body": ""}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The total volume of the cylindrical can is found by multiplying the area of the base of the can, , by the height of the
can, 10 cm, which yields . If the syrup needed to fill the can has a volume of , then the remaining volume for the pieces of
fruit is .
Choice A is incorrect because if the fruit had a volume of , there would be  of syrup needed to fill the can
to the top. Choice B is incorrect because if the fruit had a volume of , there would be  of syrup needed to
fill the can to the top. Choice D is incorrect because it is the total volume of the can, not just of the pieces of fruit.$qb$);
select seed_pool_question($qb$CB-468613c0$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A triangle has a base length of 56 centimeters and a height of 112 centimeters. What is the area, in square centimeters, of the triangle?$qb$, null, $qb$[{"label": "A", "body": "168"}, {"label": "B", "body": "1,568"}, {"label": "C", "body": "3,136"}, {"label": "D", "body": "6,272"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The area, A, of a triangle is given by the formula , where b is the base length and h is the height of the triangle. It’s
A =1 1/(1^(2)2)bh
given that a triangle has a base length of 56 centimeters and a height of  centimeters. Substituting 56 for b and 112 for h in the formula A
= 1/2 bh yields A = (1/2) (56) (112) , or A = 3,136. Therefore, the area, in square centimeters, of the triangle is 3,136.
Choice A is incorrect. This is the value of 56 + 112, not (1/2) (56) (112) .
Choice B is incorrect. This is the value of (1/4) (56) (112) , not (1/2) (56) (112) .
Choice D is incorrect. This is the value of (56)(112) , not (1/2) (56) (112) .$qb$);
select seed_pool_question($qb$CB-145337bc$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$medium$qb$::difficulty_level, null, $qb$?45° 4?5^(°) 24
N0tc: FigurenoXtdraWnt0SCaIe·
In the triangle shown, what is the value of x?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-145337bc.png$qb$, $qb$[{"label": "A", "body": "24"}, {"label": "B", "body": "45"}, {"label": "C", "body": "48"}, {"label": "D", "body": "69"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. Since the two acute angles have the same measure and the third angle is a right angle, the triangle shown is an isosceles
right triangle. In an isosceles right triangle, the two legs have the same length. The figure shows that the length of one leg of the triangle is 24
and the length of the other leg of the triangle is x. It follows that the value of x is 24.
Choice B is incorrect. This is the measure, in degrees, of one of the angles shown.
Choice C is incorrect and may result from conceptual errors.
Choice D is incorrect and may result from conceptual errors.$qb$);
select seed_pool_question($qb$CB-36200a38$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$In the figure above, two sides of a triangle are extended. What is the value of x ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-36200a38.png$qb$, $qb$[{"label": "A", "body": "110"}, {"label": "B", "body": "120"}, {"label": "C", "body": "130"}, {"label": "D", "body": "140"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The sum of the interior angles of a triangle is 180°. The measures of the two interior angles of the given triangle are shown.
Therefore, the measure of the third interior angle is 180° – 70° – 50° = 60°. The angles of measures x° and 60° are supplementary, so their sum is
180°. Therefore, x = 180 – 60 = 120.
Choice A is incorrect and may be the result of misinterpreting x° as supplementary to 70°. Choice C is incorrect and may be the result of
misinterpreting x° as supplementary to 50°. Choice D is incorrect and may be the result of a calculation error.$qb$);
select seed_pool_question($qb$CB-a490003a$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$The width of a rectangle is 7 centimeters. The length of the rectangle is 40 centimeters longer than the width. What is the area, in square
centimeters, of this rectangle?$qb$, null, $qb$[{"label": "A", "body": "7"}, {"label": "B", "body": "14"}, {"label": "C", "body": "54"}, {"label": "D", "body": "329"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It’s given that the width of this rectangle is 7 centimeters and that the length of this rectangle is 40 centimeters longer than
the width. Therefore, the length of this rectangle is 7 + 40, or 47, centimeters. The area of a rectangle can be found by multiplying its length and
its width. Therefore the area, in square centimeters, of this rectangle is (7) (47) , or 329.
Choice A is incorrect. This is the width, in centimeters, not the area, in square centimeters, of this rectangle.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-95ca2683$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In triangle ABC, the measure of angle A is 54^(?), the measure of angle B is 90^(?), and the measure of angle C is ( ?/2 ) °. What is the value of k?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-95ca2683.png$qb$, $qb$[{"label": "A", "body": "36"}, {"label": "B", "body": "45"}, {"label": "C", "body": "72"}, {"label": "D", "body": "108"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The sum of the interior angles of a triangle is 180^(?). It's given that the interior angles of triangle ABC are 54^(?), 90^(?), and (k/2)
°. It follows that 54 + 90 + ?/2 = 180, or 144 + ?/2 = 180. Subtracting 144 from each side of this equation yields ?/2 = 36. Multiplying each
side of this equation by 2 yields k = 72. Therefore, the value of k is 72.
Choice A is incorrect. This is the value of k/2 , not k.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-306264ab$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A right triangle has sides of length 2√-26√-2, , and √-80 units. What is the area of the triangle, in square units?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-306264ab.png$qb$, $qb$[{"label": "A", "body": "8√-2 + √-80"}, {"label": "B", "body": "12"}, {"label": "C", "body": "24√-80"}, {"label": "D", "body": "24"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The area, A, of a triangle can be found using the formula A = 1/2bh, where b is the length of the base of the triangle and h is
the height of the triangle. It's given that the triangle is a right triangle. Therefore, its base and height can be represented by the two legs. It’s also
given that the triangle has sides of length 2√-26√-2, , and √-80 units. Since √-80 units is the greatest of these lengths, it's the length of the
hypotenuse. Therefore, the two legs have lengths 2√-2 and 6√-2 units. Substituting these values for b and h in the formula A = 1/2bh gives A
= 1/2 (2√-2) (6√-2) , which is equivalent to A = 6√-4 square units, or A = 12 square units.
Choice A is incorrect. This expression represents the perimeter, rather than the area, of the triangle.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-37dde49f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$The glass pictured above can hold a maximum volume of 473 cubic centimeters, which is approximately 16 fluid ounces. What is the value of k,
in centimeters?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-37dde49f.png$qb$, $qb$[{"label": "A", "body": "2.52"}, {"label": "B", "body": "7.67"}, {"label": "C", "body": "7.79"}, {"label": "D", "body": "10.11"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. Using the volume formula  and the given information that the volume of the glass is 473 cubic centimeters, the
value of k can be found as follows:
Therefore, the value of k is approximately 10.11 centimeters.
Choices A, B, and C are incorrect. Substituting the values of k from these choices in the formula results in volumes of approximately 7 cubic
centimeters, 207 cubic centimeters, and 217 cubic centimeters, respectively, all of which contradict the given information that the volume of the
glass is 473 cubic centimeters.$qb$);
select seed_pool_question($qb$CB-f67255ea$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A line intersects two parallel lines, forming four acute angles and four obtuse angles. The measure of one of the acute angles is (9x - 560)^(°).
The sum of the measures of one of the acute angles and three of the obtuse angles is (-18x + w)^(°). What is the value of w?$qb$, null, null, null, array[$qb$1660$qb$]::text[], $qb$The correct answer is 1,660. It’s given that a line intersects two parallel lines, forming four acute angles and four obtuse angles. When two
parallel lines are intersected by a transversal line, the angles formed have the following properties: two adjacent angles are supplementary, and
alternate interior angles are congruent. Therefore, each of the four acute angles have the same measure, and each of the four obtuse angles
have the same measure. It’s also given that the measure of one of the acute angles is (9x - 560)^(°). If two angles are supplementary, then the
sum of their measures is 180^(°). Therefore, the measure of the obtuse angle adjacent to any of the acute angles is (180 - (9x - 560))^(?), or
, which is equivalent to . It’s given that the sum of the measures of one of the acute angles and three of the
(180 - 9x + 56(0-)^(?)18x + w)° (-9(9^(x)x+-754600))^(°) + 3(-9x + 740) = (-18x + w)
obtuse angles is . It follows that , which is equivalent to 9x - 560 - 27x
+ 2,220 = -18x + w, or -18x + 1,660 = -18x + w. Adding 18x to both sides of this equation yields 1,660 = w.$qb$);
select seed_pool_question($qb$CB-02b02213$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$What is the perimeter, in inches, of a rectangle with a length of 4 inches and a width of 9 inches?$qb$, null, $qb$[{"label": "A", "body": "13"}, {"label": "B", "body": "17"}, {"label": "C", "body": "22"}, {"label": "D", "body": "26"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The perimeter of a figure is equal to the sum of the measurements of the sides of the figure. It’s given that the rectangle has
a length of 4 inches and a width of 9 inches. Since a rectangle has 4 sides, of which opposite sides are parallel and equal, it follows that the
rectangle has two sides with a length of 4 inches and two sides with a width of 9 inches. Therefore, the perimeter of this rectangle is 4 + 4 + 9
+ 9, or 26 inches.
Choice A is incorrect. This is the sum, in inches, of the length and the width of the rectangle.
Choice B is incorrect. This is the sum, in inches, of the two lengths and the width of the rectangle.
Choice C is incorrect. This is the sum, in inches, of the length and the two widths of the rectangle.$qb$);
select seed_pool_question($qb$CB-82c8325f$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$A circle in the xy-plane has its center at (-4, 5) and the point (-8, 8) lies on the circle. Which equation represents this circle?$qb$, null, $qb$[{"label": "A", "body": "(x - 4)^(2) + (y + 5)^(2) = 5"}, {"label": "B", "body": "(x + 4)^(2) + (y - 5)^(2) = 5"}, {"label": "C", "body": "(x - 4)^(2) + (y + 5)^(2) = 25"}, {"label": "D", "body": "(x + 4)^(2) + (y - 5)^(2) = 25"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. A circle in the xy-plane can be represented by an equation of the form , where (h, k) is the center
of the circle and r is the length of a radius of the circle. It's given that the circle has its center at(x - ((x--4)(h))/22+4+, 5(y)(y--5)k2)2==r2r2. Therefore, h = -4 and k = 5.
Substituting -4 for h and 5 for k in the equation (x - h)^(2) + (y - k)^(2) = r^(2) yields , or
= r2. It's also given that the point lies on the circle. Substituting -8 for x and 8 for y in the equation (x + 4)2 +(x(r+y2-4)5^(2))+2 =(yr-25)^(2) yields
, or (((-)/((x)48)+,284+))2(3+)2(y=-r25)2 = 25, which is equivalent to 16 + 9 = r^(2), or 25 = r2 . Substituting 25 for  in the equation
((x-8++4)42)+^(2) +(y(8--5)52)=^(2) =r2r^(2)
yields . Thus, the equation (x + 4)^(2) + (y - 5)^(2) = 25 represents the circle.
Choice A is incorrect. The circle represented by this equation has its center at (4, -5) , not (-4, 5) , and the point (-8, 8) doesn't lie on the
circle.
Choice B is incorrect. The point (-8, 8) doesn't lie on the circle represented by this equation.
Choice C is incorrect. The circle represented by this equation has its center at (4, -5) , not (-4, 5) , and the point (-8, 8) doesn't lie on the
circle.$qb$);
select seed_pool_question($qb$CB-c0b53183$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A circle has center O, and points A and U lie on the circle. Line segments AE and UE are tangent to the circle at points A and U, respectively.
The distance between point O and point E is 510 centimeters and the distance between point O and point U is 78 centimeters. What is the
area, in square centimeters, of quadrilateral OAEU?$qb$, null, null, null, array[$qb$39312$qb$]::text[], $qb$The correct answer is 39,312. It's given that the circle has center O and points A and U lie on the circle. It follows that segments OA and OU
are radii of the circle and therefore congruent. It's also given that line segments AE and UE are tangent to the circle at points A and U,
respectively. Since line segments AE and UE are tangent to the circle from a common external point, point E, line segments AE and UE are
congruent and form right angles with radii OA and OU, respectively. Therefore, quadrilateral OAEU consists of two congruent right triangles:
triangle OAE and triangle OUE. It's given that the distance between point O and point E is 510 centimeters and the distance between point
O and point U is 78 centimeters. It follows that the area of triangle OUE can be found by first using the Pythagorean theorem to calculate the
distance between point U and point E. For right triangle OUE, where angle U is a right angle, the Pythagorean theorem states that (OU)^(2)
+ (UE)^(2) = (OE)^(2). Substituting 78 for OU and 510 for OE in this equation yields 78^(2) + (UE)^(2) = 510^(2), or 6,084 + (UE)^(2) = 260,100.
Subtracting 6,084 from both sides of this equation yields (UE)^(2) = 254,016. Taking the positive square root of both sides of this equation
yields UE = 504. Thus, triangle OUE is a right triangle with legs of length 78 centimeters and 504 centimeters. It follows that the area of
triangle OUE is square centimeters, or 19,656 square centimeters. Since triangle OAE is congruent to triangle OUE, the
O(1/(A^(2))E) (78) (51094,)656
area of triangle is also square centimeters. Therefore, the area of quadrilateral OAEU is 19,656 + 19,656 square centimeters,
or 39,312 square centimeters.$qb$);
select seed_pool_question($qb$CB-459dd6c5$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$Triangles ABC and DEFare similar. Each side length of triangle ABC is 4 times the corresponding side length of triangle DEF. The area of
triangle ABC is 270 square inches. What is the area, in square inches, of triangle DEF?$qb$, null, null, null, array[$qb$135/8$qb$, $qb$16.87$qb$, $qb$16.88$qb$]::text[], $qb$The correct answer is 135/8 . It's given that triangles ABC and DEF are similar and each side length of triangle ABC is 4 times the
corresponding side length of triangle DEF. For two similar triangles, if each side length of the first triangle is k times the corresponding side
length of the second triangle, then the area of the first triangle is k^(2) times the area of the second triangle. Therefore, the area of triangle ABC is
4^(2), or 16, times the area of triangle DEF. It's given that the area of triangle ABC is 270 square inches. Let a represent the area, in square
inches, of triangle DEF. It follows that 270 is 16 times a, or 270 = 16a. Dividing both sides of this equation by 16 yields 270/16 = a, which is
equivalent to 135/8 = a. Thus, the area, in square inches, of triangle DEF is 135/8 . Note that 135/8, 16.87, and 16.88 are examples of ways to
enter a correct answer.$qb$);
select seed_pool_question($qb$CB-44d67c6c$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x2 + y2 - 10x - 8y - 14n = 0
The given equation represents circle A in the xy-plane, where n is a constant. Point (11, 8) lies on circle B, which has the same center but twice
the diameter as circle A. What is the value of n?$qb$, null, null, null, array[$qb$-2$qb$]::text[], $qb$The correct answer is -2. It’s given that x2 + y2 - 10x - 8y - 14n = 0 represents circle A in the xy-plane, where n is a constant. The
equation of a circle in the xy-plane can be written in the form (x - h)^(2) + (y - k)^(2) = r^(2), where  is the center of the circle and r is its
radius. By completing the square, the equation x2 + y2 - 10x - 8y - 14n = 0(x2 - 10x + 25) + (y2 - 8y +(1h6,)k()=x214-n1+0x2+5 +((-1o)/(1^(2)6))2) can be rewritten as + (y^(2) - 8y
. This is equivalent to , which can be written
+ (((-8)/(x2-))25))2=+1(4yn-+4)((-10)/(2 =2))142 n++((-8)/(4^(2)1))2
as . It follows that  is the center of circle A and √-14n + 41 is its radius. It’s given that circle B has the
same center as circle A. Therefore, the center of circle B is (5^(,) 4()5^(,) 4√) -14n + 41. It's also given that circle B has twice the diameter as circle A. Therefore, circle
B has twice the radius as circle A. Since the radius of circle A is , it follows that the radius of circle B is 2√-14n + 41. Substituting 5
for h4,  for k, and 2√-14n + 41 for r in the equation (x - h)^(2) + (y - k)^(2) = r^(2) yields (x - 5)^(2) + (y - 4)^(2) = (2√-14n + 41)^(2), or (x - 5)^(2)
, which represents an equation for circle B. It’s given that the point  lies on circle B. Substituting 11 for x
+ (y - 4)^(2) = 4(14^(n) + 4(1x) - 5)^(2) + (y - 4)^(2) = 4(14n + 41)
and 8 for y in the equation  yields (11 - 5)^(2) + (183-=41)^(2)4(n1=1+^(,)48(4)114n + 41) , which gives 6^(2) + 4^(2)
= 4(14n + 41) , or 52 = 4(14n + 41) . Dividing both sides of this equation by 4 yields . Subtracting 41 from both sides of this
equation yields -28 = 14n. Dividing both sides of this equation by 14 yields -2 = n. Therefore, the value of n is -2.$qb$);
select seed_pool_question($qb$CB-603c18ad$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$right_triangles_and_trigonometry$qb$, $qb$hard$qb$::difficulty_level, null, $qb$In triangle XYZ, the measure of angle X is 90^(°). Point W lies on segment YZ, and segment WX is perpendicular to segment YZ. The length
of segment WY is 572, and the length of segment WX is 429. What is the value of tanZ?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-603c18ad.png$qb$, $qb$[{"label": "A", "body": "3/5"}, {"label": "B", "body": "3/4"}, {"label": "C", "body": "4/5"}, {"label": "D", "body": "4/3"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. It's given that in triangle XYZ, the measure of angle X is 90^(°), so triangle XYZ is a right triangle. It’s also given that point
W lies on segment YZ, and segment WX is perpendicular to segment YZ. It follows that triangle WYX is a right triangle. Triangle WYX
and triangle XYZ are right triangles with the same interior angle measure at point Y. It follows that triangle WYX and triangle XYZ are
similar, where angles WY, , and X in triangle WYX correspond to angles XY, , and Z, respectively, in triangle XYZ. Since corresponding
angles in similar triangles are congruent, their tangents have equal value. Thus, the tangent of angle Z is equal to the tangent of angle X in
triangle WYX. The opposite side of angle X in triangle WYX is segment WY, and the adjacent side is segment WX. It’s given that the
length of segment WY is 572 and the length of segment WX is 429. It follows that the tangent of angle X in triangle WYX is 572/429 , or 4/3 .
Therefore, the value of tanZ is 4/3 .
Choice A is incorrect. This is the value of c0SZ, not tanZ.
Choice B is incorrect. This is the value of tanY, not tanZ.
Choice C is incorrect. This is the value of SinZ, not tanZ.$qb$);
select seed_pool_question($qb$CB-6585d841$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$hard$qb$::difficulty_level, null, $qb$x^(2) + 14x + y^(2) = 6y + 109
In the xy-plane, the graph of the given equation is a circle. What is the length of the circle's radius?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-6585d841.png$qb$, $qb$[{"label": "A", "body": "√-109"}, {"label": "B", "body": "√-149"}, {"label": "C", "body": "√-167"}, {"label": "D", "body": "√-341"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. It's given that in the xy-plane, the graph of the given equation is a circle. The equation of a circle in the xy-plane can be written
in the form , where (h, k) is the center of the circle and r is the length of the circle's radius. Subtracting 6y from both
sides of the equation yields . By completing the square, this equation can be rewritten
= 10x92++(1144/2x)2++y2((--6)/26)y2 = 109
as + ((yx22r-+=61y√(4x(+x-+9))/167h()214/(=2)x+1)0229(+)y++-144(kx9y)++22 =-9y26r=y2 (+x6y+((+-61)/(^(2)7)))2029+) (y - 3)2 = 167 . This equation can be rewritten as (x^(2) + 14x + 49)
, or . Therefore, r^(2) = 167. Taking the square root of both sides of this equation
yields and r = -√-167. Since r is the length of the circle's radius, r must be positive. Therefore, the length of the circle's radius is
√-167.
Choice A is incorrect and may result from conceptual or calculation errors.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-3b44439b$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$lines_angles_and_triangles$qb$, $qb$easy$qb$::difficulty_level, null, $qb$?
p
--?X^(°) 142^(°)
q
N0te: FigurenotdraWntoSCaIe·
In the figure, line p is parallel to line q, and line t intersects both lines. What is the value of x + 142?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-3b44439b.png$qb$, $qb$[{"label": "A", "body": "52"}, {"label": "B", "body": "90"}, {"label": "C", "body": "142"}, {"label": "D", "body": "180"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. In the figure shown, the angle marked x^(°) and the angle marked 142^(?) form a linear pair of angles. If two angles form a linear
pair of angles, the sum of the measures of the angles is 180^(°). Therefore, the value of x + 142 is 180.
Choice A is incorrect. This is 90 less than 142, not the sum of x and 142.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect. This is the measure, in degrees, of one of the angles shown.$qb$);
select seed_pool_question($qb$CB-1efd7ef3$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$What is the value of Sin42π?$qb$, null, $qb$[{"label": "A", "body": "0"}, {"label": "B", "body": "1/2"}, {"label": "C", "body": "(√-2)/2"}, {"label": "D", "body": "1"}]$qb$::jsonb, 'A'::answer_option, null, $qb$Choice A is correct. The sine of a number t is the y-coordinate of the point arrived at by traveling a distance of t units counterclockwise around
the unit circle from the starting point (1, 0). Since the unit circle has a circumference of 2π units, it follows that one full rotation around the circle
is equal to a distance of 2π units. Therefore, a distance of 42π units around the circle from the starting point (1, 0) would result in exactly 21 full
rotations, arriving back at the point (1, 0) . So, Sin42π is equal to the y-coordinate of the point (1, 0) , which is 0.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.
Choice D is incorrect. This is the value of c0S42π, not Sin42π.$qb$);
select seed_pool_question($qb$CB-9d2e7037$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$easy$qb$::difficulty_level, null, $qb$A rectangle has a length of 56 inches and a width of 28 inches. What is the area, in square inches, of the rectangle?$qb$, null, $qb$[{"label": "A", "body": "28"}, {"label": "B", "body": "84"}, {"label": "C", "body": "168"}, {"label": "D", "body": "1,568"}]$qb$::jsonb, 'D'::answer_option, null, $qb$Choice D is correct. The area, A, of a rectangle can be found using the formula A = ℓw, where ℓ represents the length and w represents the
width of the rectangle. It’s given that a rectangle has a length of 56 inches and a width of 28 inches. Substituting 56 for ℓ and 28 for w in the
formula A = ℓw yields A = (56)(28) , or A = 1,568. Therefore, the area, in square inches, of the rectangle is 1,568.
Choice A is incorrect. This is the width, in inches, not the area, in square inches, of the rectangle.
Choice B is incorrect and may result from conceptual or calculation errors.
Choice C is incorrect and may result from conceptual or calculation errors.$qb$);
select seed_pool_question($qb$CB-310c87fe$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$hard$qb$::difficulty_level, null, $qb$A cube has a surface area of 54 square meters. What is the volume, in cubic meters, of the cube?$qb$, null, $qb$[{"label": "A", "body": "18"}, {"label": "B", "body": "27"}, {"label": "C", "body": "36"}, {"label": "D", "body": "81"}]$qb$::jsonb, 'B'::answer_option, null, $qb$Choice B is correct. The surface area of a cube with side length s is equal to . Since the surface area is given as 54 square meters, the
equation  can be used to solve for s. Dividing both sides of the equation by 6 yields . Taking the square root of both sides of
this equation yields  and . Since the side length of a cube must be a positive value,  can be discarded as a possible
solution, leaving . The volume of a cube with side length s is equal to . Therefore, the volume of this cube, in cubic meters, is , or 27.
Choices A, C, and D are incorrect and may result from calculation errors.$qb$);
select seed_pool_question($qb$CB-cf53cb56$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$area_and_volume$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane shown, square ABCD has its diagonals on the x- and y-axes. What is the area, in square units, of the square?$qb$, $qb$https://nsvaeqcsrlrvsmynwfft.supabase.co/storage/v1/object/public/question-images/CB-cf53cb56.png$qb$, $qb$[{"label": "A", "body": "20"}, {"label": "B", "body": "25"}, {"label": "C", "body": "50"}, {"label": "D", "body": "100"}]$qb$::jsonb, 'C'::answer_option, null, $qb$Choice C is correct. The two diagonals of square ABCD divide the square into 4 congruent right triangles, where each triangle has a vertex at the
origin of the graph shown. The formula for the area of a triangle is , where b is the base length of the triangle and h is the height of
the triangle. Each of the 4 congruent right triangles has a height of 5 units and a base length of 5 units. Therefore, the area of each triangle is
, or 12.5 square units. Since the 4 right triangles are congruent, the area of each is  of the area of square ABCD. It follows
that the area of the square ABCD is equal to , or 50 square units.
Choices A and D are incorrect and may result from using 5 or 25, respectively, as the area of one of the 4 congruent right triangles formed by
diagonals of square ABCD. However, the area of these triangles is 12.5. Choice B is incorrect and may result from using 5 as the length of one
side of square ABCD. However, the length of a side of square ABCD is .$qb$);
select seed_pool_question($qb$CB-b96ff36e$qb$, $qb$mathematics$qb$, $qb$geometry_and_trigonometry$qb$, $qb$circles$qb$, $qb$medium$qb$::difficulty_level, null, $qb$In the xy-plane, the graph of the equation (x - 3)^(2) + (y - 5)^(2) = 9 is a circle. The point (6, c), where c is a constant, lies on this circle. What is
the value of c?$qb$, null, null, null, array[$qb$5$qb$]::text[], $qb$The correct answer is 5. It's given that in the xy-plane, the graph of the equation (x - 3)^(2) + (y - 5)^(2) = 9 is a circle. It’s also given that the
point (6, c) , where c is a constant, lies on this circle. It follows that the ordered pair (6, c) makes the equation (x - 3)^(2) + (y - 5)^(2) = 9 true.
Substituting 6 for x and c for y in this equation yields (6 - 3)^(2) + (c - 5)^(2) = 9, or 9 + (c - 5)^(2) = 9. Subtracting 9 from each side of this
equation yields (c - 5)^(2) = 0. It follows that the value of c is 5.$qb$);
