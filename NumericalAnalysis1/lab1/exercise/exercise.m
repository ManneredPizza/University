%1.a
format short
x = 1,253

x =

     1


ans =

   253

x = 1.253

x =

    1.2530

1/(sqrt(2*pi))*exp(-0.5*x*x)

ans =

    0.1820

x*atan(x)-0.5*log(1+x^2)

ans =

    0.6523

((5+cos(4*x))^(1/3))/abs(sin(3*x))

ans =

    3.0107

sin(sin(pi*x))

ans =

   -0.6547

(sin(pi*x))^2

ans =

    0.5094

exp(sin(x))/sqrt(x^2+1)

ans =

    1.6128

%1.b
cleat
{Unrecognized function or variable 'cleat'.
} 
clear
tot = 50

tot =

    50

cost = 3.35

cost =

    3.3500

number_items = floor(tot/cost)

number_items =

    14

rest = mod(tot, cost)

rest =

    3.1000

14*cost + rest

ans =

    50

%2.a
clear
piapp = 355/113

piapp =

    3.1416

abs(pi - piapp)

ans =

   2.6676e-07

format long
abs(pi - piapp)

ans =

     2.667641894049666e-07

%2.b
clear
exp(i*pi) == -1

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   0

exp(i*pi)

ans =

 -1.000000000000000 + 0.000000000000000i

exp(i*pi) == -1 + 0*i

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   0

minus_one = -1 + o*i
{Unrecognized function or variable 'o'.
} 
minus_one = -1 + 0*i

minus_one =

    -1

real(exp(i*pi)) == -1

ans =

  <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a>

   1

%2.c
clear
z = 4+3*i

z =

  4.000000000000000 + 3.000000000000000i

modulo = norm(z)

modulo =

     5

arg = atan2(real(z), imag(z))

arg =

   0.927295218001612

arg = atan2(imag(z), real(z))

arg =

   0.643501108793284

%3.1
%3.a
clear
sysms a
{Unrecognized function or variable 'sysms'.
} 
sysms a
{Unrecognized function or variable 'sysms'.
} 
syms a
f = 10/(x^3+1)-4+2x
 f = 10/(x^3+1)-4+2x
                   ↑
{Invalid expression. Check for missing multiplication operator, missing or unbalanced delimiters, or other syntax error. To
construct matrices, use brackets instead of parentheses.
} 
f = 10/(x^3+1)-4+2*x
{Unrecognized function or variable 'x'.
} 
f = 10/(a^3+1)-4+2*a
 
f =
 
2*a + 10/(a^3 + 1) - 4
 
diff(f)
 
ans =
 
2 - (30*a^2)/(a^3 + 1)^2
 
%3.b
help int
--- help for <strong>sym/int</strong> ---

 <strong>int</strong>    Integrate
 <strong>int</strong>    Integrate
    <strong>int</strong>(S) is the indefinite integral of S with respect to its symbolic
      variable as defined by SYMVAR. S is a SYM (matrix or scalar).
      If S is a constant, the integral is with respect to 'x'.
 
    <strong>int</strong>(S,v) is the indefinite integral of S with respect to v. v is a
      scalar SYM.
 
    <strong>int</strong>(S,a,b) is the definite integral of S with respect to its
      symbolic variable from a to b. a and b are each double or
      symbolic scalars. The integration interval can also be specified
      using a row or a column vector with two elements, i.e., valid
      calls are also <strong>int</strong>(S,[a,b]) or <strong>int</strong>(S,[a b]) and <strong>int</strong>(S,[a;b]).
 
    <strong>int</strong>(S,v,a,b) is the definite integral of S with respect to v
      from a to b. The integration interval can also be specified
      using a row or a column vector with two elements, i.e., valid
      calls are also <strong>int</strong>(S,v,[a,b]) or <strong>int</strong>(S,v,[a b]) and
      <strong>int</strong>(S,v,[a;b]).
 
    <strong>int</strong>(...,'IgnoreAnalyticConstraints',VAL) controls the level of
      mathematical rigor to use on the analytical constraints of the
      solution  (branch cuts, division by zero, etc). The options for
      VAL are TRUE or FALSE. Specify TRUE to relax the level of
      mathematical rigor in finding integrals. The default is FALSE.
 
    <strong>int</strong>(...,'IgnoreSpecialCases',VAL) controls how detailed answers
      are with respect to special parameter values/ The options for
      VAL are TRUE or FALSE. Specify TRUE to ignore special cases of
      parameter values. The default is FALSE.
 
    <strong>int</strong>(...,'PrincipalValue',VAL) is used to request a Cauchy principal
      value of a definite integral. (The option is ignored for indefinite
      integration.) The possible values for VAL are TRUE and FALSE,
      the default is FALSE.
 
    <strong>int</strong>(...,'Hold',VAL) returns a symbolic call to <strong>int</strong>, even if the result 
      could be computed. Use RELEASE on the result to undo this. 
      The possible values for VAL are TRUE and FALSE,
      the default is FALSE.

    <a href="matlab:doc sym/int">Documentation for sym/int</a>

int(f,0,1)
 
ans =
 
(10*log(2))/3 + (10*pi*3^(1/2))/9 - 3
 
%3.c
eval(diff(f), 0)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('sym/eval')" style="font-weight:bold">sym/eval</a>
Too many input arguments.
} 
doc eval
eval(f)
 
ans =
 
2*a + 10/(a^3 + 1) - 4
 
f
 
f =
 
2*a + 10/(a^3 + 1) - 4
 
eval(f(2))
{Index exceeds the number of array elements. Index must not exceed 1.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('sym/subsref', 'F:\MATLAB\toolbox\symbolic\symbolic\@sym\sym.m', 997)" style="font-weight:bold">sym/subsref</a> (<a href="matlab: opentoline('F:\MATLAB\toolbox\symbolic\symbolic\@sym\sym.m',997,0)">line 997</a>)
            R_tilde = builtin('subsref',L_tilde,Idx);
} 
eval(diff(f,2))
 
ans =
 
(180*a^4)/(a^3 + 1)^3 - (60*a)/(a^3 + 1)^2
 
diff(f,a,2)
 
ans =
 
(180*a^4)/(a^3 + 1)^3 - (60*a)/(a^3 + 1)^2
 
diff(f,a)
 
ans =
 
2 - (30*a^2)/(a^3 + 1)^2
 
subs(diff(f,a),2)
 
ans =
 
14/27
 
eval(subs(diff(f,a),2))

ans =

   0.518518518518518

%4.1
%4.a
clear
a1 = [100:100:500]

a1 =

   100   200   300   400   500

a2 = [9:-2:-3]

a2 =

     9     7     5     3     1    -1    -3

a3 = [2:*2:32]
 a3 = [2:*2:32]
         ↑
{Invalid use of operator.
} 
a3_1 = [1:5]

a3_1 =

     1     2     3     4     5

a3 = 2^a3_1
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('mpower', 'F:\MATLAB\toolbox\matlab\matfun\mpower.m', 52)" style="font-weight:bold"> ^ </a> (<a href="matlab: opentoline('F:\MATLAB\toolbox\matlab\matfun\mpower.m',52,0)">line 52</a>)
Incorrect dimensions for raising a matrix to a power. Check that the matrix is square and the power is a scalar. To perform
elementwise matrix powers, use '.^'.
} 
a3 = 2.^a3_1

a3 =

     2     4     8    16    32

a4 = ones(7)

a4 =

     1     1     1     1     1     1     1
     1     1     1     1     1     1     1
     1     1     1     1     1     1     1
     1     1     1     1     1     1     1
     1     1     1     1     1     1     1
     1     1     1     1     1     1     1
     1     1     1     1     1     1     1

a4 = ones(7,1)

a4 =

     1
     1
     1
     1
     1
     1
     1

a4 = ones(1,7)

a4 =

     1     1     1     1     1     1     1

a4 = 3.*a4

a4 =

     3     3     3     3     3     3     3

%4.b
diary off
