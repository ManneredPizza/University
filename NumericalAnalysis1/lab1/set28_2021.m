help
--- help for <strong>diary</strong> ---

 <strong>diary</strong> Save text of MATLAB session.
    <strong>diary</strong> FILENAME causes a copy of all subsequent command window input
    and most of the resulting command window output to be appended to the
    named file.  If no file is specified, the file 'diary' is used.
 
    <strong>diary</strong> OFF suspends it. 
    <strong>diary</strong> ON turns it back on.
    <strong>diary</strong>, by itself, toggles the diary state.
 
    Use the functional form of <strong>diary</strong>, such as <strong>diary</strong>('file'),
    when the file name is stored in a string.
 
    See also <a href="matlab:help save -displayBanner">save</a>.

    <a href="matlab:doc diary">Documentation for diary</a>

help sin
 <strong>sin</strong>    Sine of argument in radians.
    <strong>sin</strong>(X) is the sine of the elements of X.
 
    See also <a href="matlab:help asin -displayBanner">asin</a>, <a href="matlab:help sind -displayBanner">sind</a>, <a href="matlab:help sinpi -displayBanner">sinpi</a>.

    <a href="matlab:doc sin">Documentation for sin</a>

help -a

-a not found.

Use the Help browser search field to <a href="matlab:docsearch -a">search the documentation</a>, or
type "<a href="matlab:help help">help help</a>" for help command options, such as help for methods.

hel
{Unrecognized function or variable 'hel'.
} 
doc sin
doc sin
3+4

ans =

     7

4+7

ans =

    11

ans

ans =

    11

a = 3+4

a =

     7

exist()
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('exist')" style="font-weight:bold">exist</a>
Not enough input arguments.
} 

exist('elena')

ans =

     0

exist('sum')

ans =

     5

help exist
 <strong>exist</strong>  Check existence of variable, script, function, folder, or class
    <strong>exist</strong>(NAME) returns:
      0 if NAME does not exist
      1 if NAME is a variable in the workspace
      2 if NAME is a file with extension .m, .mlx, .mlapp, or .sfx, or NAME
        is the name of a file with a non-registered file extension 
        (.mat, .fig, .txt).
      3 if NAME is a MEX-file on the MATLAB search path
      4 if NAME is a Simulink model or library file on the MATLAB search path
      5 if NAME is a built-in MATLAB function. This does not include classes
      6 if NAME is a P-code file on the MATLAB search path
      7 if NAME is a folder
      8 if NAME is a class (<strong>exist</strong> returns 0 for Java classes if you
        start MATLAB with the -nojvm option.)
 
    <strong>exist</strong>('NAME','builtin') checks only for built-in functions.
    <strong>exist</strong>('NAME','class') checks only for classes.
    <strong>exist</strong>('NAME','dir') checks only for folders.
    <strong>exist</strong>('NAME','file') checks for files or folders.
    <strong>exist</strong>('NAME','var') checks only for variables.
 
    NAME can include a partial path, but must be in a folder on the search
    path, or in the current folder. Otherwise, name must include a full path.
 
    If NAME specifies a file with a non-registered file extension 
    (.mat, .fig, .txt), include the extension.
 
    NAME is case insensitive on Windows systems, and case sensitive for 
    files and folder on UNIX systems.
 
    MATLAB does not examine the contents or internal structure of a file 
    and relies solely on the file extension for classification.
 
    See also <a href="matlab:help dir -displayBanner">dir</a>, <a href="matlab:help what -displayBanner">what</a>, <a href="matlab:help isempty -displayBanner">isempty</a>, <a href="matlab:help partialpath -displayBanner">partialpath</a>.

    <a href="matlab:doc exist">Documentation for exist</a>
    <a href="matlab:matlab.internal.language.introspective.overloads.displayOverloads('exist')">Other functions named exist</a>

home
3/5

ans =

    0.6000

3\5

ans =

    1.6667

clc
4*4

ans =

    16

-6*2

ans =

   -12

-6^2

ans =

   -36

(-6)^2

ans =

    36

Pi
{Unrecognized function or variable 'Pi'.
} 
pipi
{Unrecognized function or variable 'pipi'.
} 
pi

ans =

    3.1416

format long
pi

ans =

   3.141592653589793

format short
pi

ans =

    3.1416

eps

ans =

   2.2204e-16

i

ans =

   0.0000 + 1.0000i

3a
 3a
  ↑
{Invalid expression. Check for missing multiplication operator, missing or unbalanced
delimiters, or other syntax error. To construct matrices, use brackets instead of parentheses.
} 
3*a

ans =

    21








j

ans =

   0.0000 + 1.0000i

i = 4

i =

     4

i

i =

     4

i=sqrt(-1)

i =

   0.0000 + 1.0000i

acos(-3)

ans =

   3.1416 - 1.7627i

4/0

ans =

   Inf

help elfun
  Elementary math functions.
 
  Trigonometric.
    <a href="matlab:help sin -displayBanner">sin</a>         - Sine.
    <a href="matlab:help sind -displayBanner">sind</a>        - Sine of argument in degrees.
    <a href="matlab:help sinh -displayBanner">sinh</a>        - Hyperbolic sine.
    <a href="matlab:help asin -displayBanner">asin</a>        - Inverse sine.
    <a href="matlab:help asind -displayBanner">asind</a>       - Inverse sine, result in degrees.
    <a href="matlab:help asinh -displayBanner">asinh</a>       - Inverse hyperbolic sine.
    <a href="matlab:help cos -displayBanner">cos</a>         - Cosine.
    <a href="matlab:help cosd -displayBanner">cosd</a>        - Cosine of argument in degrees.
    <a href="matlab:help cosh -displayBanner">cosh</a>        - Hyperbolic cosine.
    <a href="matlab:help acos -displayBanner">acos</a>        - Inverse cosine.
    <a href="matlab:help acosd -displayBanner">acosd</a>       - Inverse cosine, result in degrees.
    <a href="matlab:help acosh -displayBanner">acosh</a>       - Inverse hyperbolic cosine.
    <a href="matlab:help tan -displayBanner">tan</a>         - Tangent.
    <a href="matlab:help tand -displayBanner">tand</a>        - Tangent of argument in degrees.
    <a href="matlab:help tanh -displayBanner">tanh</a>        - Hyperbolic tangent.
    <a href="matlab:help atan -displayBanner">atan</a>        - Inverse tangent.
    <a href="matlab:help atand -displayBanner">atand</a>       - Inverse tangent, result in degrees.
    <a href="matlab:help atan2 -displayBanner">atan2</a>       - Four quadrant inverse tangent.
    <a href="matlab:help atan2d -displayBanner">atan2d</a>      - Four quadrant inverse tangent, result in degrees.
    <a href="matlab:help atanh -displayBanner">atanh</a>       - Inverse hyperbolic tangent.
    <a href="matlab:help sec -displayBanner">sec</a>         - Secant.
    <a href="matlab:help secd -displayBanner">secd</a>        - Secant of argument in degrees.
    <a href="matlab:help sech -displayBanner">sech</a>        - Hyperbolic secant.
    <a href="matlab:help asec -displayBanner">asec</a>        - Inverse secant.
    <a href="matlab:help asecd -displayBanner">asecd</a>       - Inverse secant, result in degrees.
    <a href="matlab:help asech -displayBanner">asech</a>       - Inverse hyperbolic secant.
    <a href="matlab:help csc -displayBanner">csc</a>         - Cosecant.
    <a href="matlab:help cscd -displayBanner">cscd</a>        - Cosecant of argument in degrees.
    <a href="matlab:help csch -displayBanner">csch</a>        - Hyperbolic cosecant.
    <a href="matlab:help acsc -displayBanner">acsc</a>        - Inverse cosecant.
    <a href="matlab:help acscd -displayBanner">acscd</a>       - Inverse cosecant, result in degrees.
    <a href="matlab:help acsch -displayBanner">acsch</a>       - Inverse hyperbolic cosecant.
    <a href="matlab:help cot -displayBanner">cot</a>         - Cotangent.
    <a href="matlab:help cotd -displayBanner">cotd</a>        - Cotangent of argument in degrees.
    <a href="matlab:help coth -displayBanner">coth</a>        - Hyperbolic cotangent.
    <a href="matlab:help acot -displayBanner">acot</a>        - Inverse cotangent.
    <a href="matlab:help acotd -displayBanner">acotd</a>       - Inverse cotangent, result in degrees.
    <a href="matlab:help acoth -displayBanner">acoth</a>       - Inverse hyperbolic cotangent.
    <a href="matlab:help hypot -displayBanner">hypot</a>       - Square root of sum of squares.
    <a href="matlab:help deg2rad -displayBanner">deg2rad</a>     - Convert angles from degrees to radians.
    <a href="matlab:help rad2deg -displayBanner">rad2deg</a>     - Convert angles from radians to degrees.
 
  Exponential.
    <a href="matlab:help exp -displayBanner">exp</a>         - Exponential.
    <a href="matlab:help expm1 -displayBanner">expm1</a>       - Compute exp(x)-1 accurately.
    <a href="matlab:help log -displayBanner">log</a>         - Natural logarithm.
    <a href="matlab:help log1p -displayBanner">log1p</a>       - Compute log(1+x) accurately.
    <a href="matlab:help log10 -displayBanner">log10</a>       - Common (base 10) logarithm.
    <a href="matlab:help log2 -displayBanner">log2</a>        - Base 2 logarithm and dissect floating point number.
    <a href="matlab:help pow2 -displayBanner">pow2</a>        - Base 2 power and scale floating point number.
    <a href="matlab:help realpow -displayBanner">realpow</a>     - Power that will error out on complex result.
    <a href="matlab:help reallog -displayBanner">reallog</a>     - Natural logarithm of real number.
    <a href="matlab:help realsqrt -displayBanner">realsqrt</a>    - Square root of number greater than or equal to zero.
    <a href="matlab:help sqrt -displayBanner">sqrt</a>        - Square root.
    <a href="matlab:help nthroot -displayBanner">nthroot</a>     - Real n-th root of real numbers.
    <a href="matlab:help nextpow2 -displayBanner">nextpow2</a>    - Next higher power of 2.
 
  Complex.
    <a href="matlab:help abs -displayBanner">abs</a>         - Absolute value.
    <a href="matlab:help angle -displayBanner">angle</a>       - Phase angle.
    <a href="matlab:help complex -displayBanner">complex</a>     - Construct complex data from real and imaginary parts.
    <a href="matlab:help conj -displayBanner">conj</a>        - Complex conjugate.
    <a href="matlab:help imag -displayBanner">imag</a>        - Complex imaginary part.
    <a href="matlab:help real -displayBanner">real</a>        - Complex real part.
    <a href="matlab:help unwrap -displayBanner">unwrap</a>      - Unwrap phase angle.
    <a href="matlab:help isreal -displayBanner">isreal</a>      - True for real array.
    <a href="matlab:help cplxpair -displayBanner">cplxpair</a>    - Sort numbers into complex conjugate pairs.
 
  Rounding and remainder.
    <a href="matlab:help fix -displayBanner">fix</a>         - Round towards zero.
    <a href="matlab:help floor -displayBanner">floor</a>       - Round towards minus infinity.
    <a href="matlab:help ceil -displayBanner">ceil</a>        - Round towards plus infinity.
    <a href="matlab:help round -displayBanner">round</a>       - Round towards nearest integer.
    <a href="matlab:help mod -displayBanner">mod</a>         - Modulus (signed remainder after division).
    <a href="matlab:help rem -displayBanner">rem</a>         - Remainder after division.
    <a href="matlab:help sign -displayBanner">sign</a>        - Signum.

log(2.7)

ans =

    0.9933

log10(100000(
 log10(100000(
             ↑
{Invalid expression. When calling a function or indexing a variable, use parentheses. Otherwise,
check for mismatched delimiters.
} 
log10(100000)

ans =

     5

log2(1/32)

ans =

    -5

3+4i

ans =

   3.0000 + 4.0000i

z = 3+4i

z =

   3.0000 + 4.0000i

y = 4 -5i

y =

   4.0000 - 5.0000i


z+y

ans =

   7.0000 - 1.0000i

z*y

ans =

  32.0000 + 1.0000i

r = (-8)^(1/3);
r

r =

   1.0000 + 1.7321i

nthroot(-8, 3)

ans =

    -2

real(r)

ans =

     1

imag(r)

ans =

    1.7321

abs(r)

ans =

    2.0000

y = -y

y =

  -4.0000 + 5.0000i

atan(imag(y)/real(z))

ans =

    1.0304

atan2(imag(y), real(z))

ans =

    1.0304

zz = -3 -4i

zz =

  -3.0000 - 4.0000i

theta = atan2(imag(zz), real(zz))

theta =

   -2.2143

atan(imag(zz)/real(zz))

ans =

    0.9273

sign(4)

ans =

     1

sign(-5)

ans =

    -1

sign(0)

ans =

     0

mod(43,6)

ans =

     1

help rem
 <strong>rem</strong>    Remainder after division.
    <strong>rem</strong>(x,y) returns x - fix(x./y).*y if y ~= 0, carefully computed to
    avoid rounding error. If y is not an integer and the quotient x./y is
    within roundoff error of an integer, then n is that integer. The inputs
    x and y must be real and have compatible sizes. In the simplest cases,
    they can be the same size or one can be a scalar. Two inputs have
    compatible sizes if, for every dimension, the dimension sizes of the
    inputs are either the same or one of them is 1.
 
    By convention:
       <strong>rem</strong>(x,0) is NaN.
       <strong>rem</strong>(x,x), for x~=0, is 0.
       <strong>rem</strong>(x,y), for x~=y and y~=0, has the same sign as x.
 
    Note: MOD(x,y), for x~=y and y~=0, has the same sign as y.
    <strong>rem</strong>(x,y) and MOD(x,y) are equal if x and y have the same sign, but
    differ by y if x and y have different signs.
 
    See also <a href="matlab:help mod -displayBanner">mod</a>.

    <a href="matlab:doc rem">Documentation for rem</a>

rem(43,6)

ans =

     1

rem(43,-6)

ans =

     1

rem(43,0)

ans =

   NaN

mod(43,0)

ans =

    43

syms a b
{'syms' requires <a href="matlab:matlab.internal.addons.launchers.showExplorer('ErrorRecovery', 'identifier', 'SM', 'focused', 'syms');">Symbolic Math Toolbox</a>.
} 
matlab.internal.addons.launchers.showExplorer('ErrorRecovery', 'identifier', 'SM', 'focused', 'syms');
matlab.internal.addons.launchers.showExplorer('ErrorRecovery', 'identifier', 'SM', 'focused', 'syms');
syms a b
diary off
a*b+5*a
 
ans =
 
5*a + a*b
 
3a*b-6*a
 3a*b-6*a
  ↑
{Invalid expression. Check for missing multiplication operator, missing or unbalanced delimiters,
or other syntax error. To construct matrices, use brackets instead of parentheses.
} 
3*a*b-6*a
 
ans =
 
3*a*b - 6*a
 
p1 = a*b+5*a
 
p1 =
 
5*a + a*b
 
p2 = 3*a*b-6*a
 
p2 =
 
3*a*b - 6*a
 
p1 + p2
 
ans =
 
4*a*b - a
 

ceil(3.3)

ans =

     4

floor(3.6)

ans =

     3

cls
{Unrecognized function or variable 'cls'.
} 
clc
clear
clc
w=[1 2 4]

w =

     1     2     4

w = [1,2,4]

w =

     1     2     4

w = [6-5, 12/6, 2^2]

w =

     1     2     4

w.'

ans =

     1
     2
     4

w=[3; 5; -4]

w =

     3
     5
    -4

numel(w)

ans =

     3

length(w)

ans =

     3

size(w)

ans =

     3     1

w'

ans =

     3     5    -4

a=[1:6]

a =

     1     2     3     4     5     6

a = linspace(0,1)

a =

  Columns 1 through 9

         0    0.0101    0.0202    0.0303    0.0404    0.0505    0.0606    0.0707    0.0808

  Columns 10 through 18

    0.0909    0.1010    0.1111    0.1212    0.1313    0.1414    0.1515    0.1616    0.1717

  Columns 19 through 27

    0.1818    0.1919    0.2020    0.2121    0.2222    0.2323    0.2424    0.2525    0.2626

  Columns 28 through 36

    0.2727    0.2828    0.2929    0.3030    0.3131    0.3232    0.3333    0.3434    0.3535

  Columns 37 through 45

    0.3636    0.3737    0.3838    0.3939    0.4040    0.4141    0.4242    0.4343    0.4444

  Columns 46 through 54

    0.4545    0.4646    0.4747    0.4848    0.4949    0.5051    0.5152    0.5253    0.5354

  Columns 55 through 63

    0.5455    0.5556    0.5657    0.5758    0.5859    0.5960    0.6061    0.6162    0.6263

  Columns 64 through 72

    0.6364    0.6465    0.6566    0.6667    0.6768    0.6869    0.6970    0.7071    0.7172

  Columns 73 through 81

    0.7273    0.7374    0.7475    0.7576    0.7677    0.7778    0.7879    0.7980    0.8081

  Columns 82 through 90

    0.8182    0.8283    0.8384    0.8485    0.8586    0.8687    0.8788    0.8889    0.8990

  Columns 91 through 99

    0.9091    0.9192    0.9293    0.9394    0.9495    0.9596    0.9697    0.9798    0.9899

  Column 100

    1.0000

a = linspace(0,1,11)

a =

  Columns 1 through 9

         0    0.1000    0.2000    0.3000    0.4000    0.5000    0.6000    0.7000    0.8000

  Columns 10 through 11

    0.9000    1.0000

help linspace
 <strong>linspace</strong> Linearly spaced vector.
    <strong>linspace</strong>(X1, X2) generates a row vector of 100 linearly
    equally spaced points between X1 and X2.
 
    <strong>linspace</strong>(X1, X2, N) generates N points between X1 and X2.
    For N = 1, <strong>linspace</strong> returns X2.
 
    Class support for inputs X1,X2:
       float: double, single
 
    See also <a href="matlab:help logspace -displayBanner">logspace</a>, <a href="matlab:help colon -displayBanner">colon</a>.

    <a href="matlab:doc linspace">Documentation for linspace</a>
    <a href="matlab:matlab.internal.language.introspective.overloads.displayOverloads('linspace')">Other functions named linspace</a>

rand(5)

ans =

    0.8147    0.0975    0.1576    0.1419    0.6557
    0.9058    0.2785    0.9706    0.4218    0.0357
    0.1270    0.5469    0.9572    0.9157    0.8491
    0.9134    0.9575    0.4854    0.7922    0.9340
    0.6324    0.9649    0.8003    0.9595    0.6787

rand(5)

ans =

    0.7577    0.7060    0.8235    0.4387    0.4898
    0.7431    0.0318    0.6948    0.3816    0.4456
    0.3922    0.2769    0.3171    0.7655    0.6463
    0.6555    0.0462    0.9502    0.7952    0.7094
    0.1712    0.0971    0.0344    0.1869    0.7547

rand(1,4)

ans =

    0.2760    0.6797    0.6551    0.1626

a = linspace(0,1,11)

a =

  Columns 1 through 9

         0    0.1000    0.2000    0.3000    0.4000    0.5000    0.6000    0.7000    0.8000

  Columns 10 through 11

    0.9000    1.0000

a(end)

ans =

     1

a(end-2)

ans =

    0.8000

a(0)
{Array indices must be positive integers or logical values.
} 
zeros(3,1)

ans =

     0
     0
     0

ones(5,1)

ans =

     1
     1
     1
     1
     1

clear
a = [1:3]

a =

     1     2     3



b =[3:5]

b =

     3     4     5

a+b

ans =

     4     6     8

a*b
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('mtimes')" style="font-weight:bold"> * </a>
Incorrect dimensions for matrix multiplication. Check that the number of columns in the first
matrix matches the number of rows in the second matrix. To perform elementwise multiplication,
use '.*'.

<a href="matlab:helpview('matlab','error_innerdim')" style="font-weight:bold">Related documentation</a>
} 
a.*b

ans =

     3     8    15

a.^b

ans =

     1    16   243

sum(a)

ans =

     6

sum(b)

ans =

    12

sum(a.*b)

ans =

    26

dot(a,b)

ans =

    26

cross(a,b)

ans =

    -2     4    -2

doc cross
max(b)

ans =

     5

min(b)

ans =

     3

a=[3,1,6,5
a=[3,1,6,5]

a =

     3     1     6     5

sort(a)

ans =

     1     3     5     6

sort(a,'descend')

ans =

     6     5     3     1

v=[a(1:3) b(2) 223 [10:20:60]]

v =

     3     1     6     4   223    10    30    50


v=[a(1:3) b(2) 223 [10:20:60]']
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('horzcat')" style="font-weight:bold">horzcat</a>
Dimensions of arrays being concatenated are not consistent.
} 
v(3:5) = []

v =

     3     1    10    30    50

diff(v)

ans =

    -2     9    20    20

3.^[1:5]

ans =

     3     9    27    81   243


sin(v)

ans =

    0.1411    0.8415   -0.5440   -0.9880   -0.2624

exp(v)

ans =

   1.0e+21 *

    0.0000    0.0000    0.0000    0.0000    5.1847

ee = exp(v)

ee =

   1.0e+21 *

    0.0000    0.0000    0.0000    0.0000    5.1847

ee(3)

ans =

   2.2026e+04

ee(1)

ans =

   20.0855

norm([2 4 6])

ans =

    7.4833

sqrt(sum([2 4 6].^2))

ans =

    7.4833

norm([2 4 6], 1)

ans =

    12

norm([2 4 -6], 1)

ans =

    12

norm([2 4 -6], 3)

ans =

    6.6039

norm([2 4 -6], inf)

ans =

     6

norm([2 4 -6], -+inf)

ans =

     2

norm([2 4 -6], -inf)

ans =

     2

p = [2 -5 3]

p =

     2    -5     3

p1 = polyder(p)

p1 =

     4    -5

roots(p)

ans =

    1.5000
    1.0000



roots(p1)

ans =

    1.2500

r = roots(p)

r =

    1.5000
    1.0000

ppp = poly(r)

ppp =

    1.0000   -2.5000    1.5000

polyval(p,2)

ans =

     1

polyint(p)

ans =

    0.6667   -2.5000    3.0000         0

polyint(p, 123)

ans =

    0.6667   -2.5000    3.0000  123.0000

conv(p, p1)

ans =

     8   -30    37   -15

[qq, rr] = decov(ans, [1 3])
{Unrecognized function or variable 'decov'.
} 
[qq, rr] = deconv(ans, [1 3])

qq =

     8   -54   199


rr =

     0     0     0  -612

x = [0:0.05:4*pi];
y = sin(x);
z = cos(x);
plot(x,y,z
 plot(x,y,z
           ↑
{Invalid expression. When calling a function or indexing a variable, use parentheses. Otherwise,
check for mismatched delimiters.
} 
plot(x,y,z)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('plot')" style="font-weight:bold">plot</a>
Data must be a single input of y-values or one or more pairs of x- and y-values.
} 
plot(x,y,'r--',x,z,'b:')
legend('sin', 'cos')
[Warning: Ignoring extra legend entries.] 
[> In <a href="matlab:matlab.internal.language.introspective.errorDocCallback('legend>process_inputs', '/Applications/MATLAB_R2021a.app/toolbox/matlab/scribe/legend.m', 587)" style="font-weight:bold">legend>process_inputs</a> (<a href="matlab: opentoline('/Applications/MATLAB_R2021a.app/toolbox/matlab/scribe/legend.m',587,0)">line 587</a>)
In <a href="matlab:matlab.internal.language.introspective.errorDocCallback('legend>make_legend', '/Applications/MATLAB_R2021a.app/toolbox/matlab/scribe/legend.m', 315)" style="font-weight:bold">legend>make_legend</a> (<a href="matlab: opentoline('/Applications/MATLAB_R2021a.app/toolbox/matlab/scribe/legend.m',315,0)">line 315</a>)
In <a href="matlab:matlab.internal.language.introspective.errorDocCallback('legend', '/Applications/MATLAB_R2021a.app/toolbox/matlab/scribe/legend.m', 259)" style="font-weight:bold">legend</a> (<a href="matlab: opentoline('/Applications/MATLAB_R2021a.app/toolbox/matlab/scribe/legend.m',259,0)">line 259</a>)] 
x = [0:0.05:4*pi];
y=sin(x);
z=cos(x);
plot(x,y,'r--',x,z,'b:')
legend('sin', 'cos')
diary close
