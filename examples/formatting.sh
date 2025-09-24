echo "select a from b join c on b.id = c.id where abc = 123 and def = N'whatêver' " | sqlformat

echo "SeleCT a,b,c as d, e, f from f join g on f.id = g.id where x = 1 and y = 2 and z = 3 group by 1,2,3,4,5,6" | sqlformat