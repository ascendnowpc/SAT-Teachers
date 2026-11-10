-- ============================================================================
--  0096 — four tables are four options, not one picture
--
--  22 maths questions ask "which table gives three values of x…" or "which
--  graph represents the system?", and answer it with four tables or four
--  graphs. The import had nothing to read in those options and wrote down the
--  wreckage the decoder made of a table's rules — "x -/(|-h(x) |)| |(-1)/" —
--  which is what a student is shown today. Three of them it left blank.
--
--  Each option is a figure, so each option now has one (0095), cut from the
--  page by tools/questionbank/math_options.py and served from
--  apps/web/public/question-figures/cb. The body is emptied rather than
--  guessed at: these options have no wording, and the label is what the
--  student chooses.
--
--  THE QUESTION'S OWN PICTURE GOES. Every one of these carried one, and in
--  every case it was the four options cropped together as a single image —
--  the import's answer to a region it could not read. With each option
--  carrying its own, that picture would show the four tables twice. None of
--  the 22 has a stimulus of its own; the equations above the question are in
--  its stem, as text.
--
--  APPLY AFTER THE APP IS DEPLOYED with those figures in it, and after 0095.
--
--  Each update is guarded by what the database holds now — the option's own
--  wreckage, the question's own picture — so an option a teacher has
--  corrected since is left alone, and a second run changes nothing.
-- ============================================================================

update question_options o set body = '', image_url = '/question-figures/cb/CB-044c1cb7-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-044c1cb7' and o.label = 'A' and md5(o.body) = '3579a1c8a18e225fbf830c178d57cad0';
update question_options o set body = '', image_url = '/question-figures/cb/CB-044c1cb7-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-044c1cb7' and o.label = 'B' and md5(o.body) = '8be65ce2c9838c3d204d1ff45bc40a03';
update question_options o set body = '', image_url = '/question-figures/cb/CB-044c1cb7-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-044c1cb7' and o.label = 'C' and md5(o.body) = '8605ca5684b319c250d92a022949a5f4';
update question_options o set body = '', image_url = '/question-figures/cb/CB-044c1cb7-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-044c1cb7' and o.label = 'D' and md5(o.body) = 'b7ae2a15fe6720e52173acac2040739b';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-044c1cb7' and md5(coalesce(image_url, '')) = '77a3427ac19015a2db2289d8f8462e77';
update question_options o set body = '', image_url = '/question-figures/cb/CB-1efd8202-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-1efd8202' and o.label = 'A' and md5(o.body) = '4ca5ead23782e7b91246cf4900174d9c';
update question_options o set body = '', image_url = '/question-figures/cb/CB-1efd8202-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-1efd8202' and o.label = 'B' and md5(o.body) = '6629e35602213d30ea4fb9b4dbfd3788';
update question_options o set body = '', image_url = '/question-figures/cb/CB-1efd8202-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-1efd8202' and o.label = 'C' and md5(o.body) = 'b40c440c758f81e0d4bf401e15920c85';
update question_options o set body = '', image_url = '/question-figures/cb/CB-1efd8202-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-1efd8202' and o.label = 'D' and md5(o.body) = '2988ad36d0da7ed95adfc5eaf3c22fd3';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-1efd8202' and md5(coalesce(image_url, '')) = '89d35e6a940adefd5716cbf858ce29be';
update question_options o set body = '', image_url = '/question-figures/cb/CB-36f068e2-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-36f068e2' and o.label = 'A' and md5(o.body) = 'f18a7212cbb7ea39f545ca3724ab52bf';
update question_options o set body = '', image_url = '/question-figures/cb/CB-36f068e2-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-36f068e2' and o.label = 'B' and md5(o.body) = 'f18a7212cbb7ea39f545ca3724ab52bf';
update question_options o set body = '', image_url = '/question-figures/cb/CB-36f068e2-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-36f068e2' and o.label = 'C' and md5(o.body) = 'f18a7212cbb7ea39f545ca3724ab52bf';
update question_options o set body = '', image_url = '/question-figures/cb/CB-36f068e2-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-36f068e2' and o.label = 'D' and md5(o.body) = 'd41d8cd98f00b204e9800998ecf8427e';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-36f068e2' and md5(coalesce(image_url, '')) = 'd03d7e39a4e201db736ba2f5a427ca53';
update question_options o set body = '', image_url = '/question-figures/cb/CB-48fb34c8-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-48fb34c8' and o.label = 'A' and md5(o.body) = '2be90ce2bd66c3d99255361b12af5d70';
update question_options o set body = '', image_url = '/question-figures/cb/CB-48fb34c8-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-48fb34c8' and o.label = 'B' and md5(o.body) = '45acee03a6edc9365966a5b856b0631e';
update question_options o set body = '', image_url = '/question-figures/cb/CB-48fb34c8-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-48fb34c8' and o.label = 'C' and md5(o.body) = '2bcb6294bf4632ca95ef1bc23dd1f37f';
update question_options o set body = '', image_url = '/question-figures/cb/CB-48fb34c8-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-48fb34c8' and o.label = 'D' and md5(o.body) = '16f521df38976b62cf747fe2627088b5';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-48fb34c8' and md5(coalesce(image_url, '')) = '5b5f28ba12381e132593c14e47ac9f62';
update question_options o set body = '', image_url = '/question-figures/cb/CB-52f9a246-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-52f9a246' and o.label = 'A' and md5(o.body) = 'bf6fa8b0e427c8de5fbd3cb7da7a55c9';
update question_options o set body = '', image_url = '/question-figures/cb/CB-52f9a246-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-52f9a246' and o.label = 'B' and md5(o.body) = 'e4bbb2e4b86ad639260dcad82d085224';
update question_options o set body = '', image_url = '/question-figures/cb/CB-52f9a246-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-52f9a246' and o.label = 'C' and md5(o.body) = '6ebcdda00a88c1476dcdf3e1f57f4b1b';
update question_options o set body = '', image_url = '/question-figures/cb/CB-52f9a246-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-52f9a246' and o.label = 'D' and md5(o.body) = 'f57e52ee11b399411ef3f665c2285ff7';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-52f9a246' and md5(coalesce(image_url, '')) = '18b85b33d6a1b347409fbd81a0935142';
update question_options o set body = '', image_url = '/question-figures/cb/CB-6cb9bf45-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-6cb9bf45' and o.label = 'A' and md5(o.body) = 'cbf39dee0287b24b65c65c79b5a6ecf5';
update question_options o set body = '', image_url = '/question-figures/cb/CB-6cb9bf45-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-6cb9bf45' and o.label = 'B' and md5(o.body) = '1c1a7b3f188028220538ae6fc4e2fc5c';
update question_options o set body = '', image_url = '/question-figures/cb/CB-6cb9bf45-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-6cb9bf45' and o.label = 'C' and md5(o.body) = '20020e7c7093dee2d99794b12fa6eb1a';
update question_options o set body = '', image_url = '/question-figures/cb/CB-6cb9bf45-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-6cb9bf45' and o.label = 'D' and md5(o.body) = 'b8edd00b1aa687a2f0779b29e3470803';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-6cb9bf45' and md5(coalesce(image_url, '')) = '8da888742313073351a997af5d10eeb1';
update question_options o set body = '', image_url = '/question-figures/cb/CB-6ecdbcb4-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-6ecdbcb4' and o.label = 'A' and md5(o.body) = '6d73118204b5e3d58784b7830576cad3';
update question_options o set body = '', image_url = '/question-figures/cb/CB-6ecdbcb4-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-6ecdbcb4' and o.label = 'B' and md5(o.body) = '9ea80b086a3f2954ca35c3e93fd24f2a';
update question_options o set body = '', image_url = '/question-figures/cb/CB-6ecdbcb4-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-6ecdbcb4' and o.label = 'C' and md5(o.body) = 'afc3284e77312992255eabba2337d546';
update question_options o set body = '', image_url = '/question-figures/cb/CB-6ecdbcb4-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-6ecdbcb4' and o.label = 'D' and md5(o.body) = '1ec9165284061937671db946a0782682';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-6ecdbcb4' and md5(coalesce(image_url, '')) = '456ade21fdafce7867a31ff697ab27ca';
update question_options o set body = '', image_url = '/question-figures/cb/CB-75a32330-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-75a32330' and o.label = 'A' and md5(o.body) = 'e26261a2a38b0809553aaae26089fbd0';
update question_options o set body = '', image_url = '/question-figures/cb/CB-75a32330-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-75a32330' and o.label = 'B' and md5(o.body) = '01a475e279931580a0eccae272f946e2';
update question_options o set body = '', image_url = '/question-figures/cb/CB-75a32330-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-75a32330' and o.label = 'C' and md5(o.body) = 'd6473c31f870fc10f11160953592abee';
update question_options o set body = '', image_url = '/question-figures/cb/CB-75a32330-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-75a32330' and o.label = 'D' and md5(o.body) = 'd41d8cd98f00b204e9800998ecf8427e';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-75a32330' and md5(coalesce(image_url, '')) = 'ce8f4440022bf5d2f8989bfeb69f8531';
update question_options o set body = '', image_url = '/question-figures/cb/CB-83f2c3bf-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-83f2c3bf' and o.label = 'A' and md5(o.body) = '20868a1c84c02c727b63457cde422ba4';
update question_options o set body = '', image_url = '/question-figures/cb/CB-83f2c3bf-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-83f2c3bf' and o.label = 'B' and md5(o.body) = 'c36bafa6178c56ace2f20dcfc8b0a9cc';
update question_options o set body = '', image_url = '/question-figures/cb/CB-83f2c3bf-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-83f2c3bf' and o.label = 'C' and md5(o.body) = '5f21851e6e38e2bd865fa5deb3b57dec';
update question_options o set body = '', image_url = '/question-figures/cb/CB-83f2c3bf-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-83f2c3bf' and o.label = 'D' and md5(o.body) = '43e012335868b155842562396dcb3037';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-83f2c3bf' and md5(coalesce(image_url, '')) = 'd1f32975810706dcc17ffece94cc0633';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a049f400-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a049f400' and o.label = 'A' and md5(o.body) = 'e156fc4454d27e342594758e04b7e155';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a049f400-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a049f400' and o.label = 'B' and md5(o.body) = '8a7dbeb4eafc754699be8b37c8d42198';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a049f400-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a049f400' and o.label = 'C' and md5(o.body) = 'f08eab689ae97c677b4fe2e1c914b526';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a049f400-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a049f400' and o.label = 'D' and md5(o.body) = 'b8edd00b1aa687a2f0779b29e3470803';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-a049f400' and md5(coalesce(image_url, '')) = '332ee91cb9bef38f776ef2bf2c445bd8';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a130fcdc-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a130fcdc' and o.label = 'A' and md5(o.body) = '7002ba0913cb2573ba6f341e43d20834';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a130fcdc-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a130fcdc' and o.label = 'B' and md5(o.body) = 'dcbd1caaad8a9e961b854dd1495a6c25';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a130fcdc-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a130fcdc' and o.label = 'C' and md5(o.body) = '09c5e9798b3051e5a04fb24f3742e6ce';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a130fcdc-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a130fcdc' and o.label = 'D' and md5(o.body) = '3e5a8dd1282c043f6f0d5e8f130c44a9';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-a130fcdc' and md5(coalesce(image_url, '')) = '941ff578f95fee45821e4692f363198e';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a5834ea4-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a5834ea4' and o.label = 'A' and md5(o.body) = 'ed1c659033686badd639f509f30fdccd';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a5834ea4-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a5834ea4' and o.label = 'B' and md5(o.body) = 'd902cffedab43dfc94f7ab4719e486aa';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a5834ea4-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a5834ea4' and o.label = 'C' and md5(o.body) = '9d9586ab92dd54ef314890f8fd75e132';
update question_options o set body = '', image_url = '/question-figures/cb/CB-a5834ea4-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-a5834ea4' and o.label = 'D' and md5(o.body) = '0d0efdc2d6d941e53e98be2b9d4a9a93';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-a5834ea4' and md5(coalesce(image_url, '')) = '5f44d2ae6e8f08ff6d1c1a177f92a914';
update question_options o set body = '', image_url = '/question-figures/cb/CB-bf47ad54-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-bf47ad54' and o.label = 'A' and md5(o.body) = 'a3e778bedbc1e7b01511356b0bd2af3a';
update question_options o set body = '', image_url = '/question-figures/cb/CB-bf47ad54-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-bf47ad54' and o.label = 'B' and md5(o.body) = '6a5afaf799e1525658c0c5a918e7963d';
update question_options o set body = '', image_url = '/question-figures/cb/CB-bf47ad54-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-bf47ad54' and o.label = 'C' and md5(o.body) = '669141eed33ec2990c259531f3c90b25';
update question_options o set body = '', image_url = '/question-figures/cb/CB-bf47ad54-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-bf47ad54' and o.label = 'D' and md5(o.body) = 'b16fc808b03a0629e34f93e86f90894a';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-bf47ad54' and md5(coalesce(image_url, '')) = '2ea1d9f3df9be3db6b260523d719e6ba';
update question_options o set body = '', image_url = '/question-figures/cb/CB-cea27ab2-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-cea27ab2' and o.label = 'A' and md5(o.body) = '8bab60b56fbedd16dc50ddb5305d149e';
update question_options o set body = '', image_url = '/question-figures/cb/CB-cea27ab2-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-cea27ab2' and o.label = 'B' and md5(o.body) = '94f6f3a461aba133f91cde0484a4cbb3';
update question_options o set body = '', image_url = '/question-figures/cb/CB-cea27ab2-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-cea27ab2' and o.label = 'C' and md5(o.body) = '79ff59d657fa723d257a01a8110c0d39';
update question_options o set body = '', image_url = '/question-figures/cb/CB-cea27ab2-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-cea27ab2' and o.label = 'D' and md5(o.body) = '73429e73969f1cfa1510635af3a5913b';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-cea27ab2' and md5(coalesce(image_url, '')) = '16a67734322f7187a7057329b315b04d';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d0e614a6-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d0e614a6' and o.label = 'A' and md5(o.body) = 'bdb3b53d3dfc5c2605de630eabf13e9b';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d0e614a6-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d0e614a6' and o.label = 'B' and md5(o.body) = '42dc783ba91d6161131a6d8aa21e1a1f';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d0e614a6-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d0e614a6' and o.label = 'C' and md5(o.body) = '97b471597fea44f9287365d32f1ff9f7';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d0e614a6-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d0e614a6' and o.label = 'D' and md5(o.body) = '847ece64f4d166598dda91346e3dd2b2';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-d0e614a6' and md5(coalesce(image_url, '')) = '6a884c5cb34c5784f32da87d39b876f8';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d8539e09-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d8539e09' and o.label = 'A' and md5(o.body) = '87a17a9b6ff0c045b2e9f032d90d64df';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d8539e09-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d8539e09' and o.label = 'B' and md5(o.body) = '2f19e01d9afb346b37a7e35faa747541';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d8539e09-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d8539e09' and o.label = 'C' and md5(o.body) = '7d44824733e02cb345fe1d697f162c32';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d8539e09-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d8539e09' and o.label = 'D' and md5(o.body) = 'ab0d32d392e721280a096f5a63d96fc4';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-d8539e09' and md5(coalesce(image_url, '')) = '973382649df88f2d9e2987fadd268fe4';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d9733ed9-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d9733ed9' and o.label = 'A' and md5(o.body) = '67e64ffc7812d554e1a48be0d32dff1d';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d9733ed9-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d9733ed9' and o.label = 'B' and md5(o.body) = '9e3936d46ebc45248afa6be41c8e0b41';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d9733ed9-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d9733ed9' and o.label = 'C' and md5(o.body) = '711ce2b4e4a8bc34a27dbbb93a4d1cc2';
update question_options o set body = '', image_url = '/question-figures/cb/CB-d9733ed9-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-d9733ed9' and o.label = 'D' and md5(o.body) = '02455c2d49d34400d89dcd433527b0ff';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-d9733ed9' and md5(coalesce(image_url, '')) = '634f12a2c3420c137a819022a1f9bf8d';
update question_options o set body = '', image_url = '/question-figures/cb/CB-e723bd67-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-e723bd67' and o.label = 'A' and md5(o.body) = '8124f97dbfdee9fe190ae0834a6f763a';
update question_options o set body = '', image_url = '/question-figures/cb/CB-e723bd67-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-e723bd67' and o.label = 'B' and md5(o.body) = '8a5fab76c05e293fa54d95696e2d0340';
update question_options o set body = '', image_url = '/question-figures/cb/CB-e723bd67-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-e723bd67' and o.label = 'C' and md5(o.body) = 'cf7382648156d20c6e4e7b9063506d3c';
update question_options o set body = '', image_url = '/question-figures/cb/CB-e723bd67-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-e723bd67' and o.label = 'D' and md5(o.body) = '4e79613621f8565214c834ae2ffbe461';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-e723bd67' and md5(coalesce(image_url, '')) = '34c55dcc863f0affeabefaee72cc74fd';
update question_options o set body = '', image_url = '/question-figures/cb/CB-e7343559-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-e7343559' and o.label = 'A' and md5(o.body) = 'c193df7b36d700b2409f30dbbea5a262';
update question_options o set body = '', image_url = '/question-figures/cb/CB-e7343559-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-e7343559' and o.label = 'B' and md5(o.body) = 'cc1e78156a475244717215624c0e8fca';
update question_options o set body = '', image_url = '/question-figures/cb/CB-e7343559-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-e7343559' and o.label = 'C' and md5(o.body) = '0871664a511541c88f3e13ce25125771';
update question_options o set body = '', image_url = '/question-figures/cb/CB-e7343559-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-e7343559' and o.label = 'D' and md5(o.body) = 'daf55fd26f19445dffdde203510a8499';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-e7343559' and md5(coalesce(image_url, '')) = 'e5563c1e5690a0b372dc68c6d2d49beb';
update question_options o set body = '', image_url = '/question-figures/cb/CB-ecca0603-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-ecca0603' and o.label = 'A' and md5(o.body) = '05fddd3e648d37e0db3fb11480d88c3c';
update question_options o set body = '', image_url = '/question-figures/cb/CB-ecca0603-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-ecca0603' and o.label = 'B' and md5(o.body) = '6d312175186cff4b49f341484ea48f8e';
update question_options o set body = '', image_url = '/question-figures/cb/CB-ecca0603-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-ecca0603' and o.label = 'C' and md5(o.body) = '3fb0fc0c902c1cca8a8653d355dd40ac';
update question_options o set body = '', image_url = '/question-figures/cb/CB-ecca0603-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-ecca0603' and o.label = 'D' and md5(o.body) = '48aace92b5846a44fb6a3b7d085c7cf0';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-ecca0603' and md5(coalesce(image_url, '')) = '0a81ef8e25884f4486d7ad31f796393f';
update question_options o set body = '', image_url = '/question-figures/cb/CB-f28944ff-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-f28944ff' and o.label = 'A' and md5(o.body) = '894b6d8a8445a884019a1a79acc435b5';
update question_options o set body = '', image_url = '/question-figures/cb/CB-f28944ff-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-f28944ff' and o.label = 'B' and md5(o.body) = '163aaf451ffb4e8f8e859bdcb98e3d58';
update question_options o set body = '', image_url = '/question-figures/cb/CB-f28944ff-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-f28944ff' and o.label = 'C' and md5(o.body) = 'c222c766427bdb2e8f0f36c643bf07c3';
update question_options o set body = '', image_url = '/question-figures/cb/CB-f28944ff-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-f28944ff' and o.label = 'D' and md5(o.body) = '6b89fd8d54698b62bed233eea179018e';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-f28944ff' and md5(coalesce(image_url, '')) = 'dcbfd87c895076573f5f3c246e6fad7d';
update question_options o set body = '', image_url = '/question-figures/cb/CB-f8ff3249-A.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-f8ff3249' and o.label = 'A' and md5(o.body) = '87a17a9b6ff0c045b2e9f032d90d64df';
update question_options o set body = '', image_url = '/question-figures/cb/CB-f8ff3249-B.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-f8ff3249' and o.label = 'B' and md5(o.body) = '2f19e01d9afb346b37a7e35faa747541';
update question_options o set body = '', image_url = '/question-figures/cb/CB-f8ff3249-C.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-f8ff3249' and o.label = 'C' and md5(o.body) = '7d44824733e02cb345fe1d697f162c32';
update question_options o set body = '', image_url = '/question-figures/cb/CB-f8ff3249-D.png' from questions q where q.id = o.question_id and q.source_ref = 'CB-f8ff3249' and o.label = 'D' and md5(o.body) = 'ab0d32d392e721280a096f5a63d96fc4';
update questions set image_url = null, updated_at = now() where source_ref = 'CB-f8ff3249' and md5(coalesce(image_url, '')) = 'b2ce2ade5abbce3c16467e44331ed8a8';
