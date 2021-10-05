x=[5 3 4 -3 7 7 7 4]

x =

     5     3     4    -3     7     7     7     4

sum(x)/numel(x)

ans =

    4.2500

mean(x)

ans =

    4.2500

median(x)

ans =

    4.5000

sort(x)

ans =

    -3     3     4     4     5     7     7     7

y = [x 8]

y =

     5     3     4    -3     7     7     7     4     8

median(y)

ans =

     5

mode(x)

ans =

     7


f=@(x) x.^2-3

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)x.^2-3

help inline
 <strong>inline</strong> Construct <strong>inline</strong> object.
 
    <strong>inline</strong> will be removed in a future release. Use anonymous
    functions instead.
 
    <strong>inline</strong>(EXPR) constructs an inline function object from the
    MATLAB expression contained in the string EXPR.  The input
    arguments are automatically determined by searching EXPR
    for variable names (see SYMVAR). If no variable exists, 'x'
    is used.
 
    <strong>inline</strong>(EXPR, ARG1, ARG2, ...) constructs an inline
    function whose input arguments are specified by the
    strings ARG1, ARG2, ...  Multicharacter symbol names may
    be used.
 
    <strong>inline</strong>(EXPR, N), where N is a scalar, constructs an
    inline function whose input arguments are 'x', 'P1',
    'P2', ..., 'PN'.
 
    Examples:
      g = inline('t^2')
      g = inline('sin(2*pi*f + theta)')
      g = inline('sin(2*pi*f + theta)', 'f', 'theta')
      g = inline('x^P1', 1)
 
    See also <a href="matlab:help inline/symvar -displayBanner">symvar</a>, <a href="matlab:help function_handle -displayBanner">function_handle</a>.

    <a href="matlab:doc inline">Documentation for inline</a>

f([1 2 3])

ans =

    -2     1     6


g = @(x) exp(x-2);
g([2 2 1])

ans =

    1.0000    1.0000    0.3679

phi = @(x) f(x).*g(x)

phi =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)f(x).*g(x)

phi(0)

ans =

   -0.4060

phi(2)

ans =

     1

psi = @(x,y) (f(x)+2).*(g(y)-3)

psi =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x,y)(f(x)+2).*(g(y)-3)

psi(2,1)

ans =

   -7.8964

psi(1,2)

ans =

     0

a=2; b=7;
p=@(x)=a*x+sin(b*x)
 p=@(x)=a*x+sin(b*x)
       ↑
{Incorrect use of '=' operator. Assign a value to a variable using '=' and compare values for
equality using '=='.
} 
p=@(x) a*x+sin(b*x)

p =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)a*x+sin(b*x)

p(4)

ans =

    8.2709

a = 0

a =

     0

b = 0

b =

     0

p(2)

ans =

    4.9906

p=@(x) a*x+sin(b*x)

p =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)a*x+sin(b*x)

p(2)

ans =

     0

doc anonymous function
%inline fcnchk - alternative obsolete



clear

clc
a = [1 2 3; 4:6]

a =

     1     2     3
     4     5     6

numel(A
 numel(A
        ↑
{Invalid expression. When calling a function or indexing a variable, use parentheses. Otherwise,
check for mismatched delimiters.
} 
numel(a)

ans =

     6


length(a)

ans =

     3

size(a)

ans =

     2     3

%length = max(size)

b = ones(2,3)

b =

     1     1     1
     1     1     1

a+b

ans =

     2     3     4
     5     6     7

c = a+b

c =

     2     3     4
     5     6     7

d = a-b

d =

     0     1     2
     3     4     5

s = b(1, 2) + b(2, 3)

s =

     2

bt = b'

bt =

     1     1
     1     1
     1     1

a*bt

ans =

     6     6
    15    15

a'*b

ans =

     5     5     5
     7     7     7
     9     9     9

zeros(5)

ans =

     0     0     0     0     0
     0     0     0     0     0
     0     0     0     0     0
     0     0     0     0     0
     0     0     0     0     0

zeros(5,2)

ans =

     0     0
     0     0
     0     0
     0     0
     0     0

a = [1:2:7]

a =

     1     3     5     7

b = [2:2+ù8]
 b = [2:2+ù8]
          ↑
{Error: Invalid text character. Check for unsupported symbol, invisible character, or pasting of
non-ASCII characters.
} 
+
 +
  ↑
{Error: Invalid expression. Check for missing or extra characters.
} 
b = [2:2:8]

b =

     2     4     6     8

c = [a;b]

c =

     1     3     5     7
     2     4     6     8

d = [a' b']

d =

     1     2
     3     4
     5     6
     7     8

a*b'

ans =

   100

b*a'

ans =

   100

a'*b

ans =

     2     4     6     8
     6    12    18    24
    10    20    30    40
    14    28    42    56

100*ans

ans =

         200         400         600         800
         600        1200        1800        2400
        1000        2000        3000        4000
        1400        2800        4200        5600

a./b

ans =

    0.5000    0.7500    0.8333    0.8750

a.*b

ans =

     2    12    30    56

a.^b

ans =

           1          81       15625     5764801

c

c =

     1     3     5     7
     2     4     6     8

c.^2

ans =

     1     9    25    49
     4    16    36    64

c*c'

ans =

    84   100
   100   120

eye(4)

ans =

     1     0     0     0
     0     1     0     0
     0     0     1     0
     0     0     0     1

hilb(5)

ans =

    1.0000    0.5000    0.3333    0.2500    0.2000
    0.5000    0.3333    0.2500    0.2000    0.1667
    0.3333    0.2500    0.2000    0.1667    0.1429
    0.2500    0.2000    0.1667    0.1429    0.1250
    0.2000    0.1667    0.1429    0.1250    0.1111


vander([2 3 4 5])

ans =

     8     4     2     1
    27     9     3     1
    64    16     4     1
   125    25     5     1


%interpolaziome Vamdermonde
rand(3)

ans =

    0.8147    0.9134    0.2785
    0.9058    0.6324    0.5469
    0.1270    0.0975    0.9575

pascal(4)

ans =

     1     1     1     1
     1     2     3     4
     1     3     6    10
     1     4    10    20

%da leggere in diagomale +

%da leggere in diagonale da basso sx a alto dx

a=eye(4)

a =

     1     0     0     0
     0     1     0     0
     0     0     1     0
     0     0     0     1

b = hilb(2)

b =

    1.0000    0.5000
    0.5000    0.3333

a(3:4, 3:4)

ans =

     1     0
     0     1

a(3:4, 3:4)=b

a =

    1.0000         0         0         0
         0    1.0000         0         0
         0         0    1.0000    0.5000
         0         0    0.5000    0.3333

%per sostituire solo degli elementi

a([2 4], [1 3])=99

a =

    1.0000         0         0         0
   99.0000    1.0000   99.0000         0
         0         0    1.0000    0.5000
   99.0000         0   99.0000    0.3333

aa = a(2,:)

aa =

    99     1    99     0

c = [a b]
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('horzcat')" style="font-weight:bold">horzcat</a>
Dimensions of arrays being concatenated are not consistent.
} 
c = [a []ˆ]
 c = [a []ˆ]
          ↑
{Error: Invalid text character. Check for unsupported symbol, invisible character, or pasting of
non-ASCII characters.
} 
c = [a [b;b]]

c =

    1.0000         0         0         0    1.0000    0.5000
   99.0000    1.0000   99.0000         0    0.5000    0.3333
         0         0    1.0000    0.5000    1.0000    0.5000
   99.0000         0   99.0000    0.3333    0.5000    0.3333

c = [c(:,1:3) [1:4]' ]

c =

     1     0     0     1
    99     1    99     2
     0     0     1     3
    99     0    99     4

a(2,3)*2

ans =

   198

a

a =

    1.0000         0         0         0
   99.0000    1.0000   99.0000         0
         0         0    1.0000    0.5000
   99.0000         0   99.0000    0.3333

a(2,2) = 22

a =

    1.0000         0         0         0
   99.0000   22.0000   99.0000         0
         0         0    1.0000    0.5000
   99.0000         0   99.0000    0.3333

a(3,3) = 33

a =

    1.0000         0         0         0
   99.0000   22.0000   99.0000         0
         0         0   33.0000    0.5000
   99.0000         0   99.0000    0.3333

a(1,4) = 18

a =

    1.0000         0         0   18.0000
   99.0000   22.0000   99.0000         0
         0         0   33.0000    0.5000
   99.0000         0   99.0000    0.3333

diag(a)

ans =

    1.0000
   22.0000
   33.0000
    0.3333

diag([2 4 5 7])

ans =

     2     0     0     0
     0     4     0     0
     0     0     5     0
     0     0     0     7

diag(diag(a))

ans =

    1.0000         0         0         0
         0   22.0000         0         0
         0         0   33.0000         0
         0         0         0    0.3333

sum(a)

ans =

  199.0000   22.0000  231.0000   18.8333


prod(a)+
 prod(a)+
         ↑
{Error: Invalid expression. Check for missing or extra characters.
} 
prod(a)

ans =

     0     0     0     0

max(a)

ans =

    99    22    99    18

min(a)

ans =

     0     0     0     0

max(max(a))

ans =

    99

sort(a)

ans =

         0         0         0         0
    1.0000         0   33.0000    0.3333
   99.0000         0   99.0000    0.5000
   99.0000   22.0000   99.0000   18.0000

det(a)

ans =

    -1294579

inv(a)

ans =

    0.0007   -0.0000   -0.0303    0.0101
    0.0008    0.0455    0.0000   -0.0455
   -0.0008         0    0.0303    0.0000
    0.0555         0    0.0017   -0.0006

eig(a)

ans =

   22.0000
  -41.8828
   44.9816
   31.2345

[v, d] = eig(a)

v =

         0    0.3305   -0.1841    0.1675
    1.0000   -0.5203   -0.8738    0.9415
         0    0.0053   -0.0188   -0.0797
         0   -0.7874   -0.4498    0.2814


d =

   22.0000         0         0         0
         0  -41.8828         0         0
         0         0   44.9816         0
         0         0         0   31.2345

doc eig

a*v(1)

ans =

     0     0     0     0
     0     0     0     0
     0     0     0     0
     0     0     0     0

v(1)

ans =

     0

v(1, :)

ans =

         0    0.3305   -0.1841    0.1675

v(: ,1)

ans =

     0
     1
     0
     0

a*v(:,1)

ans =

     0
    22
     0
     0

h = hilb(5)

h =

    1.0000    0.5000    0.3333    0.2500    0.2000
    0.5000    0.3333    0.2500    0.2000    0.1667
    0.3333    0.2500    0.2000    0.1667    0.1429
    0.2500    0.2000    0.1667    0.1429    0.1250
    0.2000    0.1667    0.1429    0.1250    0.1111

diag(h)

ans =

    1.0000
    0.3333
    0.2000
    0.1429
    0.1111

tril(h)

ans =

    1.0000         0         0         0         0
    0.5000    0.3333         0         0         0
    0.3333    0.2500    0.2000         0         0
    0.2500    0.2000    0.1667    0.1429         0
    0.2000    0.1667    0.1429    0.1250    0.1111

tril(h,-2)

ans =

         0         0         0         0         0
         0         0         0         0         0
    0.3333         0         0         0         0
    0.2500    0.2000         0         0         0
    0.2000    0.1667    0.1429         0         0

triu(u,-1)
{Unrecognized function or variable 'u'.
} 
triu(h,-1)

ans =

    1.0000    0.5000    0.3333    0.2500    0.2000
    0.5000    0.3333    0.2500    0.2000    0.1667
         0    0.2500    0.2000    0.1667    0.1429
         0         0    0.1667    0.1429    0.1250
         0         0         0    0.1250    0.1111

a=3; b=2; c=6;

c == a*b

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   1

a>c

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   0

a<=b

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   0

ge(a,b)

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   1

doc ge

a ~=b
{Unrecognized function or variable 'a'.
} 
a ~= b

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   1

ne(a,b)

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   1

media2233
inserisci numero di elementi=3
m2

m2 =

    4.6667

m3

m3 =

    12

media2233
inserisci numero di elementi=3
{Unrecognized function or variable 't2'.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('media2233', '/Users/jacopoperoni/Desktop/University/NumericalAnalysis1/lab2/media2233.m', 18)" style="font-weight:bold">media2233</a> (<a href="matlab: opentoline('/Users/jacopoperoni/Desktop/University/NumericalAnalysis1/lab2/media2233.m',18,0)">line 18</a>)
    t3 = t3+x3(i);
} 
media2233
inserisci numero di elementi=4
costr_matr_for
dimensione della matrice=5
a

a =

   10.0000   -1.0000   -1.0000   -1.0000   -1.0000
    0.6667   10.0000   -1.0000   -1.0000   -1.0000
    1.0000    0.7500   10.0000   -1.0000   -1.0000
    1.3333    1.0000    0.8000   10.0000   -1.0000
    1.6667    1.2500    1.0000    0.8333   10.0000

form long
{Unrecognized function or variable 'form'.
} 
format long
a

a =

  Columns 1 through 4

  10.000000000000000  -1.000000000000000  -1.000000000000000  -1.000000000000000
   0.666666666666667  10.000000000000000  -1.000000000000000  -1.000000000000000
   1.000000000000000   0.750000000000000  10.000000000000000  -1.000000000000000
   1.333333333333333   1.000000000000000   0.800000000000000  10.000000000000000
   1.666666666666667   1.250000000000000   1.000000000000000   0.833333333333333

  Column 5

  -1.000000000000000
  -1.000000000000000
  -1.000000000000000
  -1.000000000000000
  10.000000000000000

format short

diary off
