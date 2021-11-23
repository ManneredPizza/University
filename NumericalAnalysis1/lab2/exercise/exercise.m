%1
%a
a1 = [100:100:500]

a1 =

   100   200   300   400   500

a2 = [9:-2:-3]

a2 =

     9     7     5     3     1    -1    -3

a3 = 2.*ones(1,5)

a3 =

     2     2     2     2     2

a3 = a3.^[1:5]

a3 =

     2     4     8    16    32

a4 = 3.*ones(1,7)

a4 =

     3     3     3     3     3     3     3

%A, B non hanno senso perché alcune righe sono da 5 el altre da 7 el
A = [a1;a2;a3;a4]
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('vertcat')" style="font-weight:bold">vertcat</a>
Dimensions of arrays being concatenated are not consistent.
} 
%di conseguenza neanche C e D sono def
%1.b
clear
M = [1 2 3 4]*[1;1;1;1]

M =

    10

M = [1;2;3;4]*[1 1 1 1]

M =

     1     1     1     1
     2     2     2     2
     3     3     3     3
     4     4     4     4

M = M'

M =

     1     2     3     4
     1     2     3     4
     1     2     3     4
     1     2     3     4

M = [1;1;1;1]*[1 2 3 4]

M =

     1     2     3     4
     1     2     3     4
     1     2     3     4
     1     2     3     4

%1.c
b = M(:,3)

b =

     3
     3
     3
     3

size(b)

ans =

     4     1

C = M(:,[1,3])

C =

     1     3
     1     3
     1     3
     1     3

size(C)

ans =

     4     2

d = M(1,:).+M(4,:)
 d = M(1,:).+M(4,:)
            ↑
{Invalid use of operator.
} 
d = M(1,:)+M(4,:)

d =

     2     4     6     8

b+d

ans =

     5     7     9    11
     5     7     9    11
     5     7     9    11
     5     7     9    11

%1.d
B = 3*eye(10);
b

b =

     3
     3
     3
     3

B

B =

     3     0     0     0     0     0     0     0     0     0
     0     3     0     0     0     0     0     0     0     0
     0     0     3     0     0     0     0     0     0     0
     0     0     0     3     0     0     0     0     0     0
     0     0     0     0     3     0     0     0     0     0
     0     0     0     0     0     3     0     0     0     0
     0     0     0     0     0     0     3     0     0     0
     0     0     0     0     0     0     0     3     0     0
     0     0     0     0     0     0     0     0     3     0
     0     0     0     0     0     0     0     0     0     3

B([1:9], [2:10]) = -1

B =

     3    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0     0     0     0     0     0     0     0     0     3

B([1:9], [2:10]) = -1

B =

     3    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0    -1    -1    -1    -1    -1    -1    -1    -1    -1
     0     0     0     0     0     0     0     0     0     3

B = 3*eye(10)

B =

     3     0     0     0     0     0     0     0     0     0
     0     3     0     0     0     0     0     0     0     0
     0     0     3     0     0     0     0     0     0     0
     0     0     0     3     0     0     0     0     0     0
     0     0     0     0     3     0     0     0     0     0
     0     0     0     0     0     3     0     0     0     0
     0     0     0     0     0     0     3     0     0     0
     0     0     0     0     0     0     0     3     0     0
     0     0     0     0     0     0     0     0     3     0
     0     0     0     0     0     0     0     0     0     3

C = [zeros(10,1),[-1*diag(9); zeros(1,9)]]
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('vertcat')" style="font-weight:bold">vertcat</a>
Dimensions of arrays being concatenated are not consistent.
} 
[-1*diag(9); zeros(1,9)]
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('vertcat')" style="font-weight:bold">vertcat</a>
Dimensions of arrays being concatenated are not consistent.
} 
C = [zeros(10,1),[-1*eye(9); zeros(1,9)]]

C =

     0    -1     0     0     0     0     0     0     0     0
     0     0    -1     0     0     0     0     0     0     0
     0     0     0    -1     0     0     0     0     0     0
     0     0     0     0    -1     0     0     0     0     0
     0     0     0     0     0    -1     0     0     0     0
     0     0     0     0     0     0    -1     0     0     0
     0     0     0     0     0     0     0    -1     0     0
     0     0     0     0     0     0     0     0    -1     0
     0     0     0     0     0     0     0     0     0    -1
     0     0     0     0     0     0     0     0     0     0

B = B + C + C'

B =

     3    -1     0     0     0     0     0     0     0     0
    -1     3    -1     0     0     0     0     0     0     0
     0    -1     3    -1     0     0     0     0     0     0
     0     0    -1     3    -1     0     0     0     0     0
     0     0     0    -1     3    -1     0     0     0     0
     0     0     0     0    -1     3    -1     0     0     0
     0     0     0     0     0    -1     3    -1     0     0
     0     0     0     0     0     0    -1     3    -1     0
     0     0     0     0     0     0     0    -1     3    -1
     0     0     0     0     0     0     0     0    -1     3

C = [zeros(9,1),[-1*eye(8); zeros(1,8)]]

C =

     0    -1     0     0     0     0     0     0     0
     0     0    -1     0     0     0     0     0     0
     0     0     0    -1     0     0     0     0     0
     0     0     0     0    -1     0     0     0     0
     0     0     0     0     0    -1     0     0     0
     0     0     0     0     0     0    -1     0     0
     0     0     0     0     0     0     0    -1     0
     0     0     0     0     0     0     0     0    -1
     0     0     0     0     0     0     0     0     0

C = [zeros(9,1),[2*eye(8); zeros(1,8)]]

C =

     0     2     0     0     0     0     0     0     0
     0     0     2     0     0     0     0     0     0
     0     0     0     2     0     0     0     0     0
     0     0     0     0     2     0     0     0     0
     0     0     0     0     0     2     0     0     0
     0     0     0     0     0     0     2     0     0
     0     0     0     0     0     0     0     2     0
     0     0     0     0     0     0     0     0     2
     0     0     0     0     0     0     0     0     0

B = B + C + C'
{Arrays have incompatible sizes for this operation.

<a href="matlab:helpview('matlab','error_sizeDimensionsMustMatch')" style="font-weight:bold">Related documentation</a>
} 
C = [zeros(10,1),[-1*eye(8); zeros(2,8)]]

C =

     0    -1     0     0     0     0     0     0     0
     0     0    -1     0     0     0     0     0     0
     0     0     0    -1     0     0     0     0     0
     0     0     0     0    -1     0     0     0     0
     0     0     0     0     0    -1     0     0     0
     0     0     0     0     0     0    -1     0     0
     0     0     0     0     0     0     0    -1     0
     0     0     0     0     0     0     0     0    -1
     0     0     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0     0

B = B + C + C'
{Arrays have incompatible sizes for this operation.

<a href="matlab:helpview('matlab','error_sizeDimensionsMustMatch')" style="font-weight:bold">Related documentation</a>
} 
C = [zeros(10,2),[2*eye(8); zeros(2,8)]]

C =

     0     0     2     0     0     0     0     0     0     0
     0     0     0     2     0     0     0     0     0     0
     0     0     0     0     2     0     0     0     0     0
     0     0     0     0     0     2     0     0     0     0
     0     0     0     0     0     0     2     0     0     0
     0     0     0     0     0     0     0     2     0     0
     0     0     0     0     0     0     0     0     2     0
     0     0     0     0     0     0     0     0     0     2
     0     0     0     0     0     0     0     0     0     0
     0     0     0     0     0     0     0     0     0     0

B = B + C + C'

B =

     3    -1     2     0     0     0     0     0     0     0
    -1     3    -1     2     0     0     0     0     0     0
     2    -1     3    -1     2     0     0     0     0     0
     0     2    -1     3    -1     2     0     0     0     0
     0     0     2    -1     3    -1     2     0     0     0
     0     0     0     2    -1     3    -1     2     0     0
     0     0     0     0     2    -1     3    -1     2     0
     0     0     0     0     0     2    -1     3    -1     2
     0     0     0     0     0     0     2    -1     3    -1
     0     0     0     0     0     0     0     2    -1     3

%1.e
inv(D)
{Unrecognized function or variable 'D'.
} 
inv(B)

ans =

    0.4788    0.1091   -0.1636   -0.0061   -0.1818   -0.2727    0.2970    0.4727   -0.1636   -0.3697
    0.1091    0.2182   -0.0545    0.2000    0.1818   -0.4545   -0.3455    0.4000    0.3091   -0.1636
   -0.1636   -0.0545    0.2182    0.1091    0.3636    0.1818   -0.6182   -0.5091    0.4000    0.4727
   -0.0061    0.2000    0.1091   -0.2485   -0.1818    0.6364    0.3576   -0.6182   -0.3455    0.2970
   -0.1818    0.1818    0.3636   -0.1818   -0.3636    0.0909    0.6364    0.1818   -0.4545   -0.2727
   -0.2727   -0.4545    0.1818    0.6364    0.0909   -0.3636   -0.1818    0.3636    0.1818   -0.1818
    0.2970   -0.3455   -0.6182    0.3576    0.6364   -0.1818   -0.2485    0.1091    0.2000   -0.0061
    0.4727    0.4000   -0.5091   -0.6182    0.1818    0.3636    0.1091    0.2182   -0.0545   -0.1636
   -0.1636    0.3091    0.4000   -0.3455   -0.4545    0.1818    0.2000   -0.0545    0.2182    0.1091
   -0.3697   -0.1636    0.4727    0.2970   -0.2727   -0.1818   -0.0061   -0.1636    0.1091    0.4788

B*inv(B)

ans =

    1.0000   -0.0000   -0.0000   -0.0000    0.0000    0.0000   -0.0000   -0.0000   -0.0000   -0.0000
   -0.0000    1.0000    0.0000    0.0000   -0.0000         0    0.0000         0    0.0000         0
   -0.0000   -0.0000    1.0000    0.0000    0.0000   -0.0000   -0.0000   -0.0000   -0.0000    0.0000
    0.0000         0   -0.0000    1.0000    0.0000    0.0000    0.0000   -0.0000    0.0000   -0.0000
   -0.0000   -0.0000    0.0000    0.0000    1.0000   -0.0000   -0.0000   -0.0000    0.0000    0.0000
         0         0         0         0   -0.0000    1.0000    0.0000         0    0.0000    0.0000
   -0.0000    0.0000   -0.0000    0.0000    0.0000   -0.0000    1.0000   -0.0000    0.0000    0.0000
   -0.0000   -0.0000    0.0000   -0.0000   -0.0000    0.0000   -0.0000    1.0000    0.0000    0.0000
   -0.0000         0   -0.0000    0.0000    0.0000   -0.0000   -0.0000    0.0000    1.0000         0
   -0.0000         0    0.0000   -0.0000         0   -0.0000   -0.0000    0.0000    0.0000    1.0000

%2
clear
v = [-1,52,-10,0,2,4,7]

v =

    -1    52   -10     0     2     4     7

%a
sum(v > 0 & v < 3)

ans =

     1

v > 0

ans =

  1×7 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   0   1   0   0   1   1   1

v < 3

ans =

  1×7 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   1   0   1   1   1   0   0

v = [-1,5,2,-10,0,2,4,7]

v =

    -1     5     2   -10     0     2     4     7

sum(v > 0 & v < 3)

ans =

     2

%b
count(v <= 1 || v > 4)
{Operands to the logical and (&&) and or (||) operators must be convertible to logical scalar values.
} 
count(v <= 1 || v > 4)
{Operands to the logical and (&&) and or (||) operators must be convertible to logical scalar values.
} 
count(le(v,1) || v > 4)
{Operands to the logical and (&&) and or (||) operators must be convertible to logical scalar values.
} 
le(v,1)

ans =

  1×8 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   1   0   0   1   1   0   0   0

v> 4

ans =

  1×8 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   0   1   0   0   0   0   0   1

diary off
v = [-1,2,5,-10,0,2,4,7]

v =

    -1     2     5   -10     0     2     4     7

le(v,1)

ans =

  1×8 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   1   0   0   1   1   0   0   0

gr(v,4)
{Unrecognized function or variable 'gr'.
} 
gt(v,4)

ans =

  1×8 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

   0   0   1   0   0   0   0   1

count(le(v,1).+v > 4)
 count(le(v,1).+v > 4)
               ↑
{Invalid use of operator.
} 
count(le(v,1)+v > 4)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('count')" style="font-weight:bold">count</a>
Not enough input arguments.
} 
count(le(v,1)+gt(v,4))
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('count')" style="font-weight:bold">count</a>
Not enough input arguments.
} 
le(v,1)+gt(v,4)

ans =

     1     0     1     1     1     0     0     1

s = le(v,1)+gt(v,4)

s =

     1     0     1     1     1     0     0     1

count(s)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('count')" style="font-weight:bold">count</a>
Not enough input arguments.
} 
help count
 <strong>count</strong> Returns the number of occurrences of a pattern in text.
    C = <strong>count</strong>(STR,PAT) returns the number of occurrences of PAT in
    STR.
 
    STR must be text, which means it can be a string array, a character
    vector, or a cell array of character vectors. PAT can be text or a
    pattern array. PAT and STR need not have the same size. <strong>count</strong> returns
    the number of occurrences of all elements of PAT in STR. If STR is a 
    string array or cell array, then C is a double array that is the same
    size.
  
    C = <strong>count</strong>(STR,PAT,'IgnoreCase',IGNORE) ignores case when searching 
    for PAT in STR if IGNORE is true. The default value of IGNORE is false.
  
    Examples:
        STR = "data.tar.gz";
        PAT = "tar";
        <strong>count</strong>(STR,PAT)
 
         % returns  1
 
        STR = ["abstracts.docx","data.tar.gz"];
        PAT = 'tar';
        <strong>count</strong>(STR,PAT)
 
        % returns  [0 1]
 
        STR = "music.mp3";
        PAT = lettersPattern(1);
        <strong>count</strong>(STR,PAT)
 
        % returns  7
 
        STR = "data.tar.gz";
        PAT = {'docx','tar'};
        <strong>count</strong>(STR,PAT)
 
        % returns  1
 
        STR = {'DATA.TAR.GZ','SUMMARY.PPT'};
        PAT = "tar";
        <strong>count</strong>(STR,PAT,'IgnoreCase',true)
 
        % returns  [1 0]
 
    See also <a href="matlab:help endsWith -displayBanner">endsWith</a>, <a href="matlab:help startsWith -displayBanner">startsWith</a>, <a href="matlab:help contains -displayBanner">contains</a>, <a href="matlab:help pattern -displayBanner">pattern</a>, <a href="matlab:help lettersPattern -displayBanner">lettersPattern</a>.

    <a href="matlab:doc count">Documentation for count</a>
    <a href="matlab:matlab.internal.language.introspective.overloads.displayOverloads('count')">Other functions named count</a>

sum(le(v,1)||gt(v,4))
{Operands to the logical and (&&) and or (||) operators must be convertible to logical scalar values.
} 
sum(le(v,1)+gt(v,4))

ans =

     5

%3.a
f = @(x) (x+2)*(ge(x,0)&le(x,1)) + x*(gt(x,1)&le(x,3)) + 2*gt(x,3)

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)(x+2)*(ge(x,0)&le(x,1))+x*(gt(x,1)&le(x,3))+2*gt(x,3)

I = [0:0.01:5]

I =

  Columns 1 through 13

         0    0.0100    0.0200    0.0300    0.0400    0.0500    0.0600    0.0700    0.0800    0.0900    0.1000    0.1100    0.1200

  Columns 14 through 26

    0.1300    0.1400    0.1500    0.1600    0.1700    0.1800    0.1900    0.2000    0.2100    0.2200    0.2300    0.2400    0.2500

  Columns 27 through 39

    0.2600    0.2700    0.2800    0.2900    0.3000    0.3100    0.3200    0.3300    0.3400    0.3500    0.3600    0.3700    0.3800

  Columns 40 through 52

    0.3900    0.4000    0.4100    0.4200    0.4300    0.4400    0.4500    0.4600    0.4700    0.4800    0.4900    0.5000    0.5100

  Columns 53 through 65

    0.5200    0.5300    0.5400    0.5500    0.5600    0.5700    0.5800    0.5900    0.6000    0.6100    0.6200    0.6300    0.6400

  Columns 66 through 78

    0.6500    0.6600    0.6700    0.6800    0.6900    0.7000    0.7100    0.7200    0.7300    0.7400    0.7500    0.7600    0.7700

  Columns 79 through 91

    0.7800    0.7900    0.8000    0.8100    0.8200    0.8300    0.8400    0.8500    0.8600    0.8700    0.8800    0.8900    0.9000

  Columns 92 through 104

    0.9100    0.9200    0.9300    0.9400    0.9500    0.9600    0.9700    0.9800    0.9900    1.0000    1.0100    1.0200    1.0300

  Columns 105 through 117

    1.0400    1.0500    1.0600    1.0700    1.0800    1.0900    1.1000    1.1100    1.1200    1.1300    1.1400    1.1500    1.1600

  Columns 118 through 130

    1.1700    1.1800    1.1900    1.2000    1.2100    1.2200    1.2300    1.2400    1.2500    1.2600    1.2700    1.2800    1.2900

  Columns 131 through 143

    1.3000    1.3100    1.3200    1.3300    1.3400    1.3500    1.3600    1.3700    1.3800    1.3900    1.4000    1.4100    1.4200

  Columns 144 through 156

    1.4300    1.4400    1.4500    1.4600    1.4700    1.4800    1.4900    1.5000    1.5100    1.5200    1.5300    1.5400    1.5500

  Columns 157 through 169

    1.5600    1.5700    1.5800    1.5900    1.6000    1.6100    1.6200    1.6300    1.6400    1.6500    1.6600    1.6700    1.6800

  Columns 170 through 182

    1.6900    1.7000    1.7100    1.7200    1.7300    1.7400    1.7500    1.7600    1.7700    1.7800    1.7900    1.8000    1.8100

  Columns 183 through 195

    1.8200    1.8300    1.8400    1.8500    1.8600    1.8700    1.8800    1.8900    1.9000    1.9100    1.9200    1.9300    1.9400

  Columns 196 through 208

    1.9500    1.9600    1.9700    1.9800    1.9900    2.0000    2.0100    2.0200    2.0300    2.0400    2.0500    2.0600    2.0700

  Columns 209 through 221

    2.0800    2.0900    2.1000    2.1100    2.1200    2.1300    2.1400    2.1500    2.1600    2.1700    2.1800    2.1900    2.2000

  Columns 222 through 234

    2.2100    2.2200    2.2300    2.2400    2.2500    2.2600    2.2700    2.2800    2.2900    2.3000    2.3100    2.3200    2.3300

  Columns 235 through 247

    2.3400    2.3500    2.3600    2.3700    2.3800    2.3900    2.4000    2.4100    2.4200    2.4300    2.4400    2.4500    2.4600

  Columns 248 through 260

    2.4700    2.4800    2.4900    2.5000    2.5100    2.5200    2.5300    2.5400    2.5500    2.5600    2.5700    2.5800    2.5900

  Columns 261 through 273

    2.6000    2.6100    2.6200    2.6300    2.6400    2.6500    2.6600    2.6700    2.6800    2.6900    2.7000    2.7100    2.7200

  Columns 274 through 286

    2.7300    2.7400    2.7500    2.7600    2.7700    2.7800    2.7900    2.8000    2.8100    2.8200    2.8300    2.8400    2.8500

  Columns 287 through 299

    2.8600    2.8700    2.8800    2.8900    2.9000    2.9100    2.9200    2.9300    2.9400    2.9500    2.9600    2.9700    2.9800

  Columns 300 through 312

    2.9900    3.0000    3.0100    3.0200    3.0300    3.0400    3.0500    3.0600    3.0700    3.0800    3.0900    3.1000    3.1100

  Columns 313 through 325

    3.1200    3.1300    3.1400    3.1500    3.1600    3.1700    3.1800    3.1900    3.2000    3.2100    3.2200    3.2300    3.2400

  Columns 326 through 338

    3.2500    3.2600    3.2700    3.2800    3.2900    3.3000    3.3100    3.3200    3.3300    3.3400    3.3500    3.3600    3.3700

  Columns 339 through 351

    3.3800    3.3900    3.4000    3.4100    3.4200    3.4300    3.4400    3.4500    3.4600    3.4700    3.4800    3.4900    3.5000

  Columns 352 through 364

    3.5100    3.5200    3.5300    3.5400    3.5500    3.5600    3.5700    3.5800    3.5900    3.6000    3.6100    3.6200    3.6300

  Columns 365 through 377

    3.6400    3.6500    3.6600    3.6700    3.6800    3.6900    3.7000    3.7100    3.7200    3.7300    3.7400    3.7500    3.7600

  Columns 378 through 390

    3.7700    3.7800    3.7900    3.8000    3.8100    3.8200    3.8300    3.8400    3.8500    3.8600    3.8700    3.8800    3.8900

  Columns 391 through 403

    3.9000    3.9100    3.9200    3.9300    3.9400    3.9500    3.9600    3.9700    3.9800    3.9900    4.0000    4.0100    4.0200

  Columns 404 through 416

    4.0300    4.0400    4.0500    4.0600    4.0700    4.0800    4.0900    4.1000    4.1100    4.1200    4.1300    4.1400    4.1500

  Columns 417 through 429

    4.1600    4.1700    4.1800    4.1900    4.2000    4.2100    4.2200    4.2300    4.2400    4.2500    4.2600    4.2700    4.2800

  Columns 430 through 442

    4.2900    4.3000    4.3100    4.3200    4.3300    4.3400    4.3500    4.3600    4.3700    4.3800    4.3900    4.4000    4.4100

  Columns 443 through 455

    4.4200    4.4300    4.4400    4.4500    4.4600    4.4700    4.4800    4.4900    4.5000    4.5100    4.5200    4.5300    4.5400

  Columns 456 through 468

    4.5500    4.5600    4.5700    4.5800    4.5900    4.6000    4.6100    4.6200    4.6300    4.6400    4.6500    4.6600    4.6700

  Columns 469 through 481

    4.6800    4.6900    4.7000    4.7100    4.7200    4.7300    4.7400    4.7500    4.7600    4.7700    4.7800    4.7900    4.8000

  Columns 482 through 494

    4.8100    4.8200    4.8300    4.8400    4.8500    4.8600    4.8700    4.8800    4.8900    4.9000    4.9100    4.9200    4.9300

  Columns 495 through 501

    4.9400    4.9500    4.9600    4.9700    4.9800    4.9900    5.0000

y = f(x);
{Unrecognized function or variable 'x'.
} 
y = f(I);
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('mtimes')" style="font-weight:bold"> * </a>
Incorrect dimensions for matrix multiplication. Check that the number of columns in the first matrix matches the number of rows in
the second matrix. To perform elementwise multiplication, use '.*'.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('@(x)(x+2)*(ge(x,0)&le(x,1))+x*(gt(x,1)&le(x,3))+2*gt(x,3)')" style="font-weight:bold">@(x)(x+2)*(ge(x,0)&le(x,1))+x*(gt(x,1)&le(x,3))+2*gt(x,3)</a>

<a href="matlab:helpview('matlab','error_innerdim')" style="font-weight:bold">Related documentation</a>
} 
f = @(x) (x+2).*(ge(x,0)&le(x,1)) + x.*(gt(x,1)&le(x,3)) + 2.*gt(x,3)

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)(x+2).*(ge(x,0)&le(x,1))+x.*(gt(x,1)&le(x,3))+2.*gt(x,3)

y = f(x);
{Unrecognized function or variable 'x'.
} 
y = f(I);
plot(x,y)
{Unrecognized function or variable 'x'.
} 
plot(I,y)
%3.b
p = @(x) 2*x.^3 - 3

p =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)2*x.^3-3

clear
x = [-1:0.01:3];
p = @(x) 2*x.^3-3

p =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)2*x.^3-3

doc polyval
p = [2 0 0 -3]

p =

     2     0     0    -3

roots(p)

ans =

  -0.5724 + 0.9914i
  -0.5724 - 0.9914i
   1.1447 + 0.0000i

x = linspace(-1,3);
y = polyval(p,x);
plot(x,y)
f = @(x) 2*x.^3-3

f =

  <a href="matlab:helpPopup function_handle" style="font-weight:bold">function_handle</a> with value:

    @(x)2*x.^3-3

plot(x,f(x))
plot(x,f(x))
%4.a
clear
tic
toc
Elapsed time is 8.695399 seconds.
N = 500

N =

   500

tic
for i = 1:500
tic
for i = 1:N
x = []

x =

     []

tic
for i = 1:N
x = [x, (-1)^(i+1)/(2*i-1)];
end
toc
Elapsed time is 47.352754 seconds.
tic for i = 1:N x = [x, (-1)^(i+1)/(2*i-1)] end toc
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('tic')" style="font-weight:bold">tic</a>
Too many input arguments.
} 
tic for i = 1:N x = [x, (-1)^(i+1)/(2*i-1)] end toc
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('tic')" style="font-weight:bold">tic</a>
Too many input arguments.
} 

tic
for i = 1:N x = [x, (-1)^(i+1)/(2*i-1)] end toc
 for i = 1:N x = [x, (-1)^(i+1)/(2*i-1)] end toc
                                         ↑
{Error: Illegal use of reserved keyword "end".
} 
toc
Elapsed time is 6.692782 seconds.
toc
Elapsed time is 10.663773 seconds.
toc
Elapsed time is 12.243685 seconds.
for i = 1:N
tic
x = [x, (-1)^(i+1)/(2*i-1)];
toc
end
Elapsed time is 0.000182 seconds.
Elapsed time is 0.000067 seconds.
Elapsed time is 0.000206 seconds.
Elapsed time is 0.000065 seconds.
Elapsed time is 0.000467 seconds.
Elapsed time is 0.000007 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000007 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000013 seconds.
Elapsed time is 0.000010 seconds.
Elapsed time is 0.000007 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000008 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000007 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000008 seconds.
Elapsed time is 0.000007 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
x = (-1*ones(1,N)).ù
 x = (-1*ones(1,N)).ù
                   ↑
{Invalid use of operator.
} 
x1 = (-1*ones(1,N)).^([2:N+1])./(2*[1:N]-1);
x-x1
{Arrays have incompatible sizes for this operation.

<a href="matlab:helpview('matlab','error_sizeDimensionsMustMatch')" style="font-weight:bold">Related documentation</a>
} 
x.-x1
 x.-x1
   ↑
{Invalid use of operator.
} 
x = []

x =

     []

for i = 1:N
tic
x = [x, (-1)^(i+1)/(2*i-1)];
toc
end
Elapsed time is 0.000698 seconds.
Elapsed time is 0.000401 seconds.
Elapsed time is 0.000008 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000007 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000009 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000002 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000007 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000008 seconds.
Elapsed time is 0.000008 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000004 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000005 seconds.
Elapsed time is 0.000003 seconds.
Elapsed time is 0.000003 seconds.
x == x1

ans =

  1×500 <a href="matlab:helpPopup logical" style="font-weight:bold">logical</a> array

  Columns 1 through 32

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 33 through 64

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 65 through 96

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 97 through 128

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 129 through 160

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 161 through 192

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 193 through 224

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 225 through 256

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 257 through 288

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 289 through 320

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 321 through 352

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 353 through 384

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 385 through 416

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 417 through 448

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 449 through 480

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

  Columns 481 through 500

   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1

x1 = (-1*ones(1,N)).^([2:N+1])./(2*[1:N]-1);
tic
x1 = (-1*ones(1,N)).^([2:N+1])./(2*[1:N]-1);
toc
Elapsed time is 1.984924 seconds.
tic x1 = (-1*ones(1,N)).^([2:N+1])./(2*[1:N]-1); toc
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('tic')" style="font-weight:bold">tic</a>
Too many input arguments.
} 
doc tic
clear
cls
{Unrecognized function or variable 'cls'.
} 
clr
{Unrecognized function or variable 'clr'.
} 
doc clear
clc
diff_compilazione_x_4a
Elapsed time is 0.001506 seconds.
Elapsed time is 0.000837 seconds.
doc randi
randi(10)

ans =

     9

indovina_numero_4b
{Error: <a href="matlab: opentoline('C:\Users\Peron\Desktop\University\NumericalAnalysis1\lab2\exercise\indovina_numero_4b.m',5,1)">File: indovina_numero_4b.m Line: 5 Column: 1</a>
At least one END is missing. The statement beginning here does not have a matching end.
} 
indovina_numero_4b
Indovina il numero: 5
Sarai più fortunato la prossima volta
clear
indovina_numero_4b
Indovina il numero: 6
Sarai più fortunato la prossima volta
indovina_numero_4b
Indovina il numero: 2
Sarai più fortunato la prossima volta
indovina_numero_4b
Indovina il numero: 1
Sarai più fortunato la prossima volta
indovina_numero_4b

n =

     1

Indovina il numero: 1
Congratulazioni, hai indovinato!
clear
clc
n = [1:10000];
s = mod(n,37);
s

s =

  Columns 1 through 22

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 23 through 44

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 45 through 66

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 67 through 88

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 89 through 110

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 111 through 132

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 133 through 154

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 155 through 176

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 177 through 198

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 199 through 220

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 221 through 242

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 243 through 264

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 265 through 286

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 287 through 308

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 309 through 330

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 331 through 352

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 353 through 374

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 375 through 396

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 397 through 418

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 419 through 440

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 441 through 462

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 463 through 484

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 485 through 506

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 507 through 528

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 529 through 550

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 551 through 572

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 573 through 594

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 595 through 616

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 617 through 638

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 639 through 660

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 661 through 682

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 683 through 704

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 705 through 726

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 727 through 748

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 749 through 770

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 771 through 792

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 793 through 814

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 815 through 836

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 837 through 858

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 859 through 880

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 881 through 902

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 903 through 924

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 925 through 946

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 947 through 968

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 969 through 990

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 991 through 1.012

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 1.013 through 1.034

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 1.035 through 1.056

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 1.057 through 1.078

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 1.079 through 1.100

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 1.101 through 1.122

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 1.123 through 1.144

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 1.145 through 1.166

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 1.167 through 1.188

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 1.189 through 1.210

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 1.211 through 1.232

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 1.233 through 1.254

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 1.255 through 1.276

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 1.277 through 1.298

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 1.299 through 1.320

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 1.321 through 1.342

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 1.343 through 1.364

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 1.365 through 1.386

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 1.387 through 1.408

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 1.409 through 1.430

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 1.431 through 1.452

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 1.453 through 1.474

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 1.475 through 1.496

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 1.497 through 1.518

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 1.519 through 1.540

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 1.541 through 1.562

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 1.563 through 1.584

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 1.585 through 1.606

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 1.607 through 1.628

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 1.629 through 1.650

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 1.651 through 1.672

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 1.673 through 1.694

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 1.695 through 1.716

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 1.717 through 1.738

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 1.739 through 1.760

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 1.761 through 1.782

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 1.783 through 1.804

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 1.805 through 1.826

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 1.827 through 1.848

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 1.849 through 1.870

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 1.871 through 1.892

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 1.893 through 1.914

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 1.915 through 1.936

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 1.937 through 1.958

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 1.959 through 1.980

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 1.981 through 2.002

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 2.003 through 2.024

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 2.025 through 2.046

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 2.047 through 2.068

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 2.069 through 2.090

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 2.091 through 2.112

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 2.113 through 2.134

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 2.135 through 2.156

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 2.157 through 2.178

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 2.179 through 2.200

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 2.201 through 2.222

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 2.223 through 2.244

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 2.245 through 2.266

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 2.267 through 2.288

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 2.289 through 2.310

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 2.311 through 2.332

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 2.333 through 2.354

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 2.355 through 2.376

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 2.377 through 2.398

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 2.399 through 2.420

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 2.421 through 2.442

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 2.443 through 2.464

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 2.465 through 2.486

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 2.487 through 2.508

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 2.509 through 2.530

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 2.531 through 2.552

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 2.553 through 2.574

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 2.575 through 2.596

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 2.597 through 2.618

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 2.619 through 2.640

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 2.641 through 2.662

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 2.663 through 2.684

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 2.685 through 2.706

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 2.707 through 2.728

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 2.729 through 2.750

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 2.751 through 2.772

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 2.773 through 2.794

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 2.795 through 2.816

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 2.817 through 2.838

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 2.839 through 2.860

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 2.861 through 2.882

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 2.883 through 2.904

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 2.905 through 2.926

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 2.927 through 2.948

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 2.949 through 2.970

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 2.971 through 2.992

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 2.993 through 3.014

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 3.015 through 3.036

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 3.037 through 3.058

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 3.059 through 3.080

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 3.081 through 3.102

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 3.103 through 3.124

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 3.125 through 3.146

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 3.147 through 3.168

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 3.169 through 3.190

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 3.191 through 3.212

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 3.213 through 3.234

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 3.235 through 3.256

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 3.257 through 3.278

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 3.279 through 3.300

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 3.301 through 3.322

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 3.323 through 3.344

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 3.345 through 3.366

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 3.367 through 3.388

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 3.389 through 3.410

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 3.411 through 3.432

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 3.433 through 3.454

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 3.455 through 3.476

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 3.477 through 3.498

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 3.499 through 3.520

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 3.521 through 3.542

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 3.543 through 3.564

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 3.565 through 3.586

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 3.587 through 3.608

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 3.609 through 3.630

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 3.631 through 3.652

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 3.653 through 3.674

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 3.675 through 3.696

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 3.697 through 3.718

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 3.719 through 3.740

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 3.741 through 3.762

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 3.763 through 3.784

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 3.785 through 3.806

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 3.807 through 3.828

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 3.829 through 3.850

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 3.851 through 3.872

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 3.873 through 3.894

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 3.895 through 3.916

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 3.917 through 3.938

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 3.939 through 3.960

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 3.961 through 3.982

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 3.983 through 4.004

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 4.005 through 4.026

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 4.027 through 4.048

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 4.049 through 4.070

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 4.071 through 4.092

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 4.093 through 4.114

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 4.115 through 4.136

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 4.137 through 4.158

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 4.159 through 4.180

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 4.181 through 4.202

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 4.203 through 4.224

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 4.225 through 4.246

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 4.247 through 4.268

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 4.269 through 4.290

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 4.291 through 4.312

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 4.313 through 4.334

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 4.335 through 4.356

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 4.357 through 4.378

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 4.379 through 4.400

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 4.401 through 4.422

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 4.423 through 4.444

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 4.445 through 4.466

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 4.467 through 4.488

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 4.489 through 4.510

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 4.511 through 4.532

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 4.533 through 4.554

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 4.555 through 4.576

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 4.577 through 4.598

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 4.599 through 4.620

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 4.621 through 4.642

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 4.643 through 4.664

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 4.665 through 4.686

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 4.687 through 4.708

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 4.709 through 4.730

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 4.731 through 4.752

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 4.753 through 4.774

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 4.775 through 4.796

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 4.797 through 4.818

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 4.819 through 4.840

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 4.841 through 4.862

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 4.863 through 4.884

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 4.885 through 4.906

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 4.907 through 4.928

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 4.929 through 4.950

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 4.951 through 4.972

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 4.973 through 4.994

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 4.995 through 5.016

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 5.017 through 5.038

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 5.039 through 5.060

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 5.061 through 5.082

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 5.083 through 5.104

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 5.105 through 5.126

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 5.127 through 5.148

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 5.149 through 5.170

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 5.171 through 5.192

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 5.193 through 5.214

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 5.215 through 5.236

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 5.237 through 5.258

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 5.259 through 5.280

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 5.281 through 5.302

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 5.303 through 5.324

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 5.325 through 5.346

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 5.347 through 5.368

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 5.369 through 5.390

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 5.391 through 5.412

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 5.413 through 5.434

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 5.435 through 5.456

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 5.457 through 5.478

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 5.479 through 5.500

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 5.501 through 5.522

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 5.523 through 5.544

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 5.545 through 5.566

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 5.567 through 5.588

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 5.589 through 5.610

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 5.611 through 5.632

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 5.633 through 5.654

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 5.655 through 5.676

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 5.677 through 5.698

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 5.699 through 5.720

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 5.721 through 5.742

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 5.743 through 5.764

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 5.765 through 5.786

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 5.787 through 5.808

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 5.809 through 5.830

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 5.831 through 5.852

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 5.853 through 5.874

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 5.875 through 5.896

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 5.897 through 5.918

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 5.919 through 5.940

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 5.941 through 5.962

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 5.963 through 5.984

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 5.985 through 6.006

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 6.007 through 6.028

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 6.029 through 6.050

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 6.051 through 6.072

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 6.073 through 6.094

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 6.095 through 6.116

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 6.117 through 6.138

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 6.139 through 6.160

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 6.161 through 6.182

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 6.183 through 6.204

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 6.205 through 6.226

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 6.227 through 6.248

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 6.249 through 6.270

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 6.271 through 6.292

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 6.293 through 6.314

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 6.315 through 6.336

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 6.337 through 6.358

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 6.359 through 6.380

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 6.381 through 6.402

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 6.403 through 6.424

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 6.425 through 6.446

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 6.447 through 6.468

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 6.469 through 6.490

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 6.491 through 6.512

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 6.513 through 6.534

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 6.535 through 6.556

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 6.557 through 6.578

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 6.579 through 6.600

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 6.601 through 6.622

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 6.623 through 6.644

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 6.645 through 6.666

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 6.667 through 6.688

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 6.689 through 6.710

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 6.711 through 6.732

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 6.733 through 6.754

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 6.755 through 6.776

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 6.777 through 6.798

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 6.799 through 6.820

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 6.821 through 6.842

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 6.843 through 6.864

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 6.865 through 6.886

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 6.887 through 6.908

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 6.909 through 6.930

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 6.931 through 6.952

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 6.953 through 6.974

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 6.975 through 6.996

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 6.997 through 7.018

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 7.019 through 7.040

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 7.041 through 7.062

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 7.063 through 7.084

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 7.085 through 7.106

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 7.107 through 7.128

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 7.129 through 7.150

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 7.151 through 7.172

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 7.173 through 7.194

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 7.195 through 7.216

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 7.217 through 7.238

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 7.239 through 7.260

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 7.261 through 7.282

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 7.283 through 7.304

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 7.305 through 7.326

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 7.327 through 7.348

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 7.349 through 7.370

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 7.371 through 7.392

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 7.393 through 7.414

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 7.415 through 7.436

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 7.437 through 7.458

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 7.459 through 7.480

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 7.481 through 7.502

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 7.503 through 7.524

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 7.525 through 7.546

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 7.547 through 7.568

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 7.569 through 7.590

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 7.591 through 7.612

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 7.613 through 7.634

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 7.635 through 7.656

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 7.657 through 7.678

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 7.679 through 7.700

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 7.701 through 7.722

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 7.723 through 7.744

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 7.745 through 7.766

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 7.767 through 7.788

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 7.789 through 7.810

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 7.811 through 7.832

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 7.833 through 7.854

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 7.855 through 7.876

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 7.877 through 7.898

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 7.899 through 7.920

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 7.921 through 7.942

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 7.943 through 7.964

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 7.965 through 7.986

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 7.987 through 8.008

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 8.009 through 8.030

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 8.031 through 8.052

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 8.053 through 8.074

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 8.075 through 8.096

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 8.097 through 8.118

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 8.119 through 8.140

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 8.141 through 8.162

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 8.163 through 8.184

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 8.185 through 8.206

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 8.207 through 8.228

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 8.229 through 8.250

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 8.251 through 8.272

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 8.273 through 8.294

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 8.295 through 8.316

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 8.317 through 8.338

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 8.339 through 8.360

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 8.361 through 8.382

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 8.383 through 8.404

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 8.405 through 8.426

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 8.427 through 8.448

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 8.449 through 8.470

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 8.471 through 8.492

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 8.493 through 8.514

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 8.515 through 8.536

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 8.537 through 8.558

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 8.559 through 8.580

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 8.581 through 8.602

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 8.603 through 8.624

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 8.625 through 8.646

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 8.647 through 8.668

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 8.669 through 8.690

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 8.691 through 8.712

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 8.713 through 8.734

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 8.735 through 8.756

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 8.757 through 8.778

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 8.779 through 8.800

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 8.801 through 8.822

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 8.823 through 8.844

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 8.845 through 8.866

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 8.867 through 8.888

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 8.889 through 8.910

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 8.911 through 8.932

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 8.933 through 8.954

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 8.955 through 8.976

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 8.977 through 8.998

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 8.999 through 9.020

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 9.021 through 9.042

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 9.043 through 9.064

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 9.065 through 9.086

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 9.087 through 9.108

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 9.109 through 9.130

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 9.131 through 9.152

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 9.153 through 9.174

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 9.175 through 9.196

    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20

  Columns 9.197 through 9.218

    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5

  Columns 9.219 through 9.240

     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27

  Columns 9.241 through 9.262

    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12

  Columns 9.263 through 9.284

    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34

  Columns 9.285 through 9.306

    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19

  Columns 9.307 through 9.328

    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4

  Columns 9.329 through 9.350

     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26

  Columns 9.351 through 9.372

    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11

  Columns 9.373 through 9.394

    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33

  Columns 9.395 through 9.416

    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18

  Columns 9.417 through 9.438

    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3

  Columns 9.439 through 9.460

     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25

  Columns 9.461 through 9.482

    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10

  Columns 9.483 through 9.504

    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32

  Columns 9.505 through 9.526

    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17

  Columns 9.527 through 9.548

    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2

  Columns 9.549 through 9.570

     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24

  Columns 9.571 through 9.592

    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9

  Columns 9.593 through 9.614

    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31

  Columns 9.615 through 9.636

    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16

  Columns 9.637 through 9.658

    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1

  Columns 9.659 through 9.680

     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23

  Columns 9.681 through 9.702

    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8

  Columns 9.703 through 9.724

     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30

  Columns 9.725 through 9.746

    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15

  Columns 9.747 through 9.768

    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0

  Columns 9.769 through 9.790

     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22

  Columns 9.791 through 9.812

    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7

  Columns 9.813 through 9.834

     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29

  Columns 9.835 through 9.856

    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14

  Columns 9.857 through 9.878

    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36

  Columns 9.879 through 9.900

     0     1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21

  Columns 9.901 through 9.922

    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6

  Columns 9.923 through 9.944

     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28

  Columns 9.945 through 9.966

    29    30    31    32    33    34    35    36     0     1     2     3     4     5     6     7     8     9    10    11    12    13

  Columns 9.967 through 9.988

    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35

  Columns 9.989 through 10.000

    36     0     1     2     3     4     5     6     7     8     9    10

n*(s==0)
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('mtimes')" style="font-weight:bold"> * </a>
Incorrect dimensions for matrix multiplication. Check that the number of columns in the first matrix matches the number of rows in
the second matrix. To perform elementwise multiplication, use '.*'.

<a href="matlab:helpview('matlab','error_innerdim')" style="font-weight:bold">Related documentation</a>
} 
res = n.*(s==0)

res =

  Columns 1 through 10

           0           0           0           0           0           0           0           0           0           0

  Columns 11 through 20

           0           0           0           0           0           0           0           0           0           0

  Columns 21 through 30

           0           0           0           0           0           0           0           0           0           0

  Columns 31 through 40

           0           0           0           0           0           0          37           0           0           0

  Columns 41 through 50

           0           0           0           0           0           0           0           0           0           0

  Columns 51 through 60

           0           0           0           0           0           0           0           0           0           0

  Columns 61 through 70

           0           0           0           0           0           0           0           0           0           0

  Columns 71 through 80

           0           0           0          74           0           0           0           0           0           0

  Columns 81 through 90

           0           0           0           0           0           0           0           0           0           0

  Columns 91 through 100

           0           0           0           0           0           0           0           0           0           0

  Columns 101 through 110

           0           0           0           0           0           0           0           0           0           0

  Columns 111 through 120

         111           0           0           0           0           0           0           0           0           0

  Columns 121 through 130

           0           0           0           0           0           0           0           0           0           0

  Columns 131 through 140

           0           0           0           0           0           0           0           0           0           0

  Columns 141 through 150

           0           0           0           0           0           0           0         148           0           0

  Columns 151 through 160

           0           0           0           0           0           0           0           0           0           0

  Columns 161 through 170

           0           0           0           0           0           0           0           0           0           0

  Columns 171 through 180

           0           0           0           0           0           0           0           0           0           0

  Columns 181 through 190

           0           0           0           0         185           0           0           0           0           0

  Columns 191 through 200

           0           0           0           0           0           0           0           0           0           0

  Columns 201 through 210

           0           0           0           0           0           0           0           0           0           0

  Columns 211 through 220

           0           0           0           0           0           0           0           0           0           0

  Columns 221 through 230

           0         222           0           0           0           0           0           0           0           0

  Columns 231 through 240

           0           0           0           0           0           0           0           0           0           0

  Columns 241 through 250

           0           0           0           0           0           0           0           0           0           0

  Columns 251 through 260

           0           0           0           0           0           0           0           0         259           0

  Columns 261 through 270

           0           0           0           0           0           0           0           0           0           0

  Columns 271 through 280

           0           0           0           0           0           0           0           0           0           0

  Columns 281 through 290

           0           0           0           0           0           0           0           0           0           0

  Columns 291 through 300

           0           0           0           0           0         296           0           0           0           0

  Columns 301 through 310

           0           0           0           0           0           0           0           0           0           0

  Columns 311 through 320

           0           0           0           0           0           0           0           0           0           0

  Columns 321 through 330

           0           0           0           0           0           0           0           0           0           0

  Columns 331 through 340

           0           0         333           0           0           0           0           0           0           0

  Columns 341 through 350

           0           0           0           0           0           0           0           0           0           0

  Columns 351 through 360

           0           0           0           0           0           0           0           0           0           0

  Columns 361 through 370

           0           0           0           0           0           0           0           0           0         370

  Columns 371 through 380

           0           0           0           0           0           0           0           0           0           0

  Columns 381 through 390

           0           0           0           0           0           0           0           0           0           0

  Columns 391 through 400

           0           0           0           0           0           0           0           0           0           0

  Columns 401 through 410

           0           0           0           0           0           0         407           0           0           0

  Columns 411 through 420

           0           0           0           0           0           0           0           0           0           0

  Columns 421 through 430

           0           0           0           0           0           0           0           0           0           0

  Columns 431 through 440

           0           0           0           0           0           0           0           0           0           0

  Columns 441 through 450

           0           0           0         444           0           0           0           0           0           0

  Columns 451 through 460

           0           0           0           0           0           0           0           0           0           0

  Columns 461 through 470

           0           0           0           0           0           0           0           0           0           0

  Columns 471 through 480

           0           0           0           0           0           0           0           0           0           0

  Columns 481 through 490

         481           0           0           0           0           0           0           0           0           0

  Columns 491 through 500

           0           0           0           0           0           0           0           0           0           0

  Columns 501 through 510

           0           0           0           0           0           0           0           0           0           0

  Columns 511 through 520

           0           0           0           0           0           0           0         518           0           0

  Columns 521 through 530

           0           0           0           0           0           0           0           0           0           0

  Columns 531 through 540

           0           0           0           0           0           0           0           0           0           0

  Columns 541 through 550

           0           0           0           0           0           0           0           0           0           0

  Columns 551 through 560

           0           0           0           0         555           0           0           0           0           0

  Columns 561 through 570

           0           0           0           0           0           0           0           0           0           0

  Columns 571 through 580

           0           0           0           0           0           0           0           0           0           0

  Columns 581 through 590

           0           0           0           0           0           0           0           0           0           0

  Columns 591 through 600

           0         592           0           0           0           0           0           0           0           0

  Columns 601 through 610

           0           0           0           0           0           0           0           0           0           0

  Columns 611 through 620

           0           0           0           0           0           0           0           0           0           0

  Columns 621 through 630

           0           0           0           0           0           0           0           0         629           0

  Columns 631 through 640

           0           0           0           0           0           0           0           0           0           0

  Columns 641 through 650

           0           0           0           0           0           0           0           0           0           0

  Columns 651 through 660

           0           0           0           0           0           0           0           0           0           0

  Columns 661 through 670

           0           0           0           0           0         666           0           0           0           0

  Columns 671 through 680

           0           0           0           0           0           0           0           0           0           0

  Columns 681 through 690

           0           0           0           0           0           0           0           0           0           0

  Columns 691 through 700

           0           0           0           0           0           0           0           0           0           0

  Columns 701 through 710

           0           0         703           0           0           0           0           0           0           0

  Columns 711 through 720

           0           0           0           0           0           0           0           0           0           0

  Columns 721 through 730

           0           0           0           0           0           0           0           0           0           0

  Columns 731 through 740

           0           0           0           0           0           0           0           0           0         740

  Columns 741 through 750

           0           0           0           0           0           0           0           0           0           0

  Columns 751 through 760

           0           0           0           0           0           0           0           0           0           0

  Columns 761 through 770

           0           0           0           0           0           0           0           0           0           0

  Columns 771 through 780

           0           0           0           0           0           0         777           0           0           0

  Columns 781 through 790

           0           0           0           0           0           0           0           0           0           0

  Columns 791 through 800

           0           0           0           0           0           0           0           0           0           0

  Columns 801 through 810

           0           0           0           0           0           0           0           0           0           0

  Columns 811 through 820

           0           0           0         814           0           0           0           0           0           0

  Columns 821 through 830

           0           0           0           0           0           0           0           0           0           0

  Columns 831 through 840

           0           0           0           0           0           0           0           0           0           0

  Columns 841 through 850

           0           0           0           0           0           0           0           0           0           0

  Columns 851 through 860

         851           0           0           0           0           0           0           0           0           0

  Columns 861 through 870

           0           0           0           0           0           0           0           0           0           0

  Columns 871 through 880

           0           0           0           0           0           0           0           0           0           0

  Columns 881 through 890

           0           0           0           0           0           0           0         888           0           0

  Columns 891 through 900

           0           0           0           0           0           0           0           0           0           0

  Columns 901 through 910

           0           0           0           0           0           0           0           0           0           0

  Columns 911 through 920

           0           0           0           0           0           0           0           0           0           0

  Columns 921 through 930

           0           0           0           0         925           0           0           0           0           0

  Columns 931 through 940

           0           0           0           0           0           0           0           0           0           0

  Columns 941 through 950

           0           0           0           0           0           0           0           0           0           0

  Columns 951 through 960

           0           0           0           0           0           0           0           0           0           0

  Columns 961 through 970

           0         962           0           0           0           0           0           0           0           0

  Columns 971 through 980

           0           0           0           0           0           0           0           0           0           0

  Columns 981 through 990

           0           0           0           0           0           0           0           0           0           0

  Columns 991 through 1.000

           0           0           0           0           0           0           0           0         999           0

  Columns 1.001 through 1.010

           0           0           0           0           0           0           0           0           0           0

  Columns 1.011 through 1.020

           0           0           0           0           0           0           0           0           0           0

  Columns 1.021 through 1.030

           0           0           0           0           0           0           0           0           0           0

  Columns 1.031 through 1.040

           0           0           0           0           0        1036           0           0           0           0

  Columns 1.041 through 1.050

           0           0           0           0           0           0           0           0           0           0

  Columns 1.051 through 1.060

           0           0           0           0           0           0           0           0           0           0

  Columns 1.061 through 1.070

           0           0           0           0           0           0           0           0           0           0

  Columns 1.071 through 1.080

           0           0        1073           0           0           0           0           0           0           0

  Columns 1.081 through 1.090

           0           0           0           0           0           0           0           0           0           0

  Columns 1.091 through 1.100

           0           0           0           0           0           0           0           0           0           0

  Columns 1.101 through 1.110

           0           0           0           0           0           0           0           0           0        1110

  Columns 1.111 through 1.120

           0           0           0           0           0           0           0           0           0           0

  Columns 1.121 through 1.130

           0           0           0           0           0           0           0           0           0           0

  Columns 1.131 through 1.140

           0           0           0           0           0           0           0           0           0           0

  Columns 1.141 through 1.150

           0           0           0           0           0           0        1147           0           0           0

  Columns 1.151 through 1.160

           0           0           0           0           0           0           0           0           0           0

  Columns 1.161 through 1.170

           0           0           0           0           0           0           0           0           0           0

  Columns 1.171 through 1.180

           0           0           0           0           0           0           0           0           0           0

  Columns 1.181 through 1.190

           0           0           0        1184           0           0           0           0           0           0

  Columns 1.191 through 1.200

           0           0           0           0           0           0           0           0           0           0

  Columns 1.201 through 1.210

           0           0           0           0           0           0           0           0           0           0

  Columns 1.211 through 1.220

           0           0           0           0           0           0           0           0           0           0

  Columns 1.221 through 1.230

        1221           0           0           0           0           0           0           0           0           0

  Columns 1.231 through 1.240

           0           0           0           0           0           0           0           0           0           0

  Columns 1.241 through 1.250

           0           0           0           0           0           0           0           0           0           0

  Columns 1.251 through 1.260

           0           0           0           0           0           0           0        1258           0           0

  Columns 1.261 through 1.270

           0           0           0           0           0           0           0           0           0           0

  Columns 1.271 through 1.280

           0           0           0           0           0           0           0           0           0           0

  Columns 1.281 through 1.290

           0           0           0           0           0           0           0           0           0           0

  Columns 1.291 through 1.300

           0           0           0           0        1295           0           0           0           0           0

  Columns 1.301 through 1.310

           0           0           0           0           0           0           0           0           0           0

  Columns 1.311 through 1.320

           0           0           0           0           0           0           0           0           0           0

  Columns 1.321 through 1.330

           0           0           0           0           0           0           0           0           0           0

  Columns 1.331 through 1.340

           0        1332           0           0           0           0           0           0           0           0

  Columns 1.341 through 1.350

           0           0           0           0           0           0           0           0           0           0

  Columns 1.351 through 1.360

           0           0           0           0           0           0           0           0           0           0

  Columns 1.361 through 1.370

           0           0           0           0           0           0           0           0        1369           0

  Columns 1.371 through 1.380

           0           0           0           0           0           0           0           0           0           0

  Columns 1.381 through 1.390

           0           0           0           0           0           0           0           0           0           0

  Columns 1.391 through 1.400

           0           0           0           0           0           0           0           0           0           0

  Columns 1.401 through 1.410

           0           0           0           0           0        1406           0           0           0           0

  Columns 1.411 through 1.420

           0           0           0           0           0           0           0           0           0           0

  Columns 1.421 through 1.430

           0           0           0           0           0           0           0           0           0           0

  Columns 1.431 through 1.440

           0           0           0           0           0           0           0           0           0           0

  Columns 1.441 through 1.450

           0           0        1443           0           0           0           0           0           0           0

  Columns 1.451 through 1.460

           0           0           0           0           0           0           0           0           0           0

  Columns 1.461 through 1.470

           0           0           0           0           0           0           0           0           0           0

  Columns 1.471 through 1.480

           0           0           0           0           0           0           0           0           0        1480

  Columns 1.481 through 1.490

           0           0           0           0           0           0           0           0           0           0

  Columns 1.491 through 1.500

           0           0           0           0           0           0           0           0           0           0

  Columns 1.501 through 1.510

           0           0           0           0           0           0           0           0           0           0

  Columns 1.511 through 1.520

           0           0           0           0           0           0        1517           0           0           0

  Columns 1.521 through 1.530

           0           0           0           0           0           0           0           0           0           0

  Columns 1.531 through 1.540

           0           0           0           0           0           0           0           0           0           0

  Columns 1.541 through 1.550

           0           0           0           0           0           0           0           0           0           0

  Columns 1.551 through 1.560

           0           0           0        1554           0           0           0           0           0           0

  Columns 1.561 through 1.570

           0           0           0           0           0           0           0           0           0           0

  Columns 1.571 through 1.580

           0           0           0           0           0           0           0           0           0           0

  Columns 1.581 through 1.590

           0           0           0           0           0           0           0           0           0           0

  Columns 1.591 through 1.600

        1591           0           0           0           0           0           0           0           0           0

  Columns 1.601 through 1.610

           0           0           0           0           0           0           0           0           0           0

  Columns 1.611 through 1.620

           0           0           0           0           0           0           0           0           0           0

  Columns 1.621 through 1.630

           0           0           0           0           0           0           0        1628           0           0

  Columns 1.631 through 1.640

           0           0           0           0           0           0           0           0           0           0

  Columns 1.641 through 1.650

           0           0           0           0           0           0           0           0           0           0

  Columns 1.651 through 1.660

           0           0           0           0           0           0           0           0           0           0

  Columns 1.661 through 1.670

           0           0           0           0        1665           0           0           0           0           0

  Columns 1.671 through 1.680

           0           0           0           0           0           0           0           0           0           0

  Columns 1.681 through 1.690

           0           0           0           0           0           0           0           0           0           0

  Columns 1.691 through 1.700

           0           0           0           0           0           0           0           0           0           0

  Columns 1.701 through 1.710

           0        1702           0           0           0           0           0           0           0           0

  Columns 1.711 through 1.720

           0           0           0           0           0           0           0           0           0           0

  Columns 1.721 through 1.730

           0           0           0           0           0           0           0           0           0           0

  Columns 1.731 through 1.740

           0           0           0           0           0           0           0           0        1739           0

  Columns 1.741 through 1.750

           0           0           0           0           0           0           0           0           0           0

  Columns 1.751 through 1.760

           0           0           0           0           0           0           0           0           0           0

  Columns 1.761 through 1.770

           0           0           0           0           0           0           0           0           0           0

  Columns 1.771 through 1.780

           0           0           0           0           0        1776           0           0           0           0

  Columns 1.781 through 1.790

           0           0           0           0           0           0           0           0           0           0

  Columns 1.791 through 1.800

           0           0           0           0           0           0           0           0           0           0

  Columns 1.801 through 1.810

           0           0           0           0           0           0           0           0           0           0

  Columns 1.811 through 1.820

           0           0        1813           0           0           0           0           0           0           0

  Columns 1.821 through 1.830

           0           0           0           0           0           0           0           0           0           0

  Columns 1.831 through 1.840

           0           0           0           0           0           0           0           0           0           0

  Columns 1.841 through 1.850

           0           0           0           0           0           0           0           0           0        1850

  Columns 1.851 through 1.860

           0           0           0           0           0           0           0           0           0           0

  Columns 1.861 through 1.870

           0           0           0           0           0           0           0           0           0           0

  Columns 1.871 through 1.880

           0           0           0           0           0           0           0           0           0           0

  Columns 1.881 through 1.890

           0           0           0           0           0           0        1887           0           0           0

  Columns 1.891 through 1.900

           0           0           0           0           0           0           0           0           0           0

  Columns 1.901 through 1.910

           0           0           0           0           0           0           0           0           0           0

  Columns 1.911 through 1.920

           0           0           0           0           0           0           0           0           0           0

  Columns 1.921 through 1.930

           0           0           0        1924           0           0           0           0           0           0

  Columns 1.931 through 1.940

           0           0           0           0           0           0           0           0           0           0

  Columns 1.941 through 1.950

           0           0           0           0           0           0           0           0           0           0

  Columns 1.951 through 1.960

           0           0           0           0           0           0           0           0           0           0

  Columns 1.961 through 1.970

        1961           0           0           0           0           0           0           0           0           0

  Columns 1.971 through 1.980

           0           0           0           0           0           0           0           0           0           0

  Columns 1.981 through 1.990

           0           0           0           0           0           0           0           0           0           0

  Columns 1.991 through 2.000

           0           0           0           0           0           0           0        1998           0           0

  Columns 2.001 through 2.010

           0           0           0           0           0           0           0           0           0           0

  Columns 2.011 through 2.020

           0           0           0           0           0           0           0           0           0           0

  Columns 2.021 through 2.030

           0           0           0           0           0           0           0           0           0           0

  Columns 2.031 through 2.040

           0           0           0           0        2035           0           0           0           0           0

  Columns 2.041 through 2.050

           0           0           0           0           0           0           0           0           0           0

  Columns 2.051 through 2.060

           0           0           0           0           0           0           0           0           0           0

  Columns 2.061 through 2.070

           0           0           0           0           0           0           0           0           0           0

  Columns 2.071 through 2.080

           0        2072           0           0           0           0           0           0           0           0

  Columns 2.081 through 2.090

           0           0           0           0           0           0           0           0           0           0

  Columns 2.091 through 2.100

           0           0           0           0           0           0           0           0           0           0

  Columns 2.101 through 2.110

           0           0           0           0           0           0           0           0        2109           0

  Columns 2.111 through 2.120

           0           0           0           0           0           0           0           0           0           0

  Columns 2.121 through 2.130

           0           0           0           0           0           0           0           0           0           0

  Columns 2.131 through 2.140

           0           0           0           0           0           0           0           0           0           0

  Columns 2.141 through 2.150

           0           0           0           0           0        2146           0           0           0           0

  Columns 2.151 through 2.160

           0           0           0           0           0           0           0           0           0           0

  Columns 2.161 through 2.170

           0           0           0           0           0           0           0           0           0           0

  Columns 2.171 through 2.180

           0           0           0           0           0           0           0           0           0           0

  Columns 2.181 through 2.190

           0           0        2183           0           0           0           0           0           0           0

  Columns 2.191 through 2.200

           0           0           0           0           0           0           0           0           0           0

  Columns 2.201 through 2.210

           0           0           0           0           0           0           0           0           0           0

  Columns 2.211 through 2.220

           0           0           0           0           0           0           0           0           0        2220

  Columns 2.221 through 2.230

           0           0           0           0           0           0           0           0           0           0

  Columns 2.231 through 2.240

           0           0           0           0           0           0           0           0           0           0

  Columns 2.241 through 2.250

           0           0           0           0           0           0           0           0           0           0

  Columns 2.251 through 2.260

           0           0           0           0           0           0        2257           0           0           0

  Columns 2.261 through 2.270

           0           0           0           0           0           0           0           0           0           0

  Columns 2.271 through 2.280

           0           0           0           0           0           0           0           0           0           0

  Columns 2.281 through 2.290

           0           0           0           0           0           0           0           0           0           0

  Columns 2.291 through 2.300

           0           0           0        2294           0           0           0           0           0           0

  Columns 2.301 through 2.310

           0           0           0           0           0           0           0           0           0           0

  Columns 2.311 through 2.320

           0           0           0           0           0           0           0           0           0           0

  Columns 2.321 through 2.330

           0           0           0           0           0           0           0           0           0           0

  Columns 2.331 through 2.340

        2331           0           0           0           0           0           0           0           0           0

  Columns 2.341 through 2.350

           0           0           0           0           0           0           0           0           0           0

  Columns 2.351 through 2.360

           0           0           0           0           0           0           0           0           0           0

  Columns 2.361 through 2.370

           0           0           0           0           0           0           0        2368           0           0

  Columns 2.371 through 2.380

           0           0           0           0           0           0           0           0           0           0

  Columns 2.381 through 2.390

           0           0           0           0           0           0           0           0           0           0

  Columns 2.391 through 2.400

           0           0           0           0           0           0           0           0           0           0

  Columns 2.401 through 2.410

           0           0           0           0        2405           0           0           0           0           0

  Columns 2.411 through 2.420

           0           0           0           0           0           0           0           0           0           0

  Columns 2.421 through 2.430

           0           0           0           0           0           0           0           0           0           0

  Columns 2.431 through 2.440

           0           0           0           0           0           0           0           0           0           0

  Columns 2.441 through 2.450

           0        2442           0           0           0           0           0           0           0           0

  Columns 2.451 through 2.460

           0           0           0           0           0           0           0           0           0           0

  Columns 2.461 through 2.470

           0           0           0           0           0           0           0           0           0           0

  Columns 2.471 through 2.480

           0           0           0           0           0           0           0           0        2479           0

  Columns 2.481 through 2.490

           0           0           0           0           0           0           0           0           0           0

  Columns 2.491 through 2.500

           0           0           0           0           0           0           0           0           0           0

  Columns 2.501 through 2.510

           0           0           0           0           0           0           0           0           0           0

  Columns 2.511 through 2.520

           0           0           0           0           0        2516           0           0           0           0

  Columns 2.521 through 2.530

           0           0           0           0           0           0           0           0           0           0

  Columns 2.531 through 2.540

           0           0           0           0           0           0           0           0           0           0

  Columns 2.541 through 2.550

           0           0           0           0           0           0           0           0           0           0

  Columns 2.551 through 2.560

           0           0        2553           0           0           0           0           0           0           0

  Columns 2.561 through 2.570

           0           0           0           0           0           0           0           0           0           0

  Columns 2.571 through 2.580

           0           0           0           0           0           0           0           0           0           0

  Columns 2.581 through 2.590

           0           0           0           0           0           0           0           0           0        2590

  Columns 2.591 through 2.600

           0           0           0           0           0           0           0           0           0           0

  Columns 2.601 through 2.610

           0           0           0           0           0           0           0           0           0           0

  Columns 2.611 through 2.620

           0           0           0           0           0           0           0           0           0           0

  Columns 2.621 through 2.630

           0           0           0           0           0           0        2627           0           0           0

  Columns 2.631 through 2.640

           0           0           0           0           0           0           0           0           0           0

  Columns 2.641 through 2.650

           0           0           0           0           0           0           0           0           0           0

  Columns 2.651 through 2.660

           0           0           0           0           0           0           0           0           0           0

  Columns 2.661 through 2.670

           0           0           0        2664           0           0           0           0           0           0

  Columns 2.671 through 2.680

           0           0           0           0           0           0           0           0           0           0

  Columns 2.681 through 2.690

           0           0           0           0           0           0           0           0           0           0

  Columns 2.691 through 2.700

           0           0           0           0           0           0           0           0           0           0

  Columns 2.701 through 2.710

        2701           0           0           0           0           0           0           0           0           0

  Columns 2.711 through 2.720

           0           0           0           0           0           0           0           0           0           0

  Columns 2.721 through 2.730

           0           0           0           0           0           0           0           0           0           0

  Columns 2.731 through 2.740

           0           0           0           0           0           0           0        2738           0           0

  Columns 2.741 through 2.750

           0           0           0           0           0           0           0           0           0           0

  Columns 2.751 through 2.760

           0           0           0           0           0           0           0           0           0           0

  Columns 2.761 through 2.770

           0           0           0           0           0           0           0           0           0           0

  Columns 2.771 through 2.780

           0           0           0           0        2775           0           0           0           0           0

  Columns 2.781 through 2.790

           0           0           0           0           0           0           0           0           0           0

  Columns 2.791 through 2.800

           0           0           0           0           0           0           0           0           0           0

  Columns 2.801 through 2.810

           0           0           0           0           0           0           0           0           0           0

  Columns 2.811 through 2.820

           0        2812           0           0           0           0           0           0           0           0

  Columns 2.821 through 2.830

           0           0           0           0           0           0           0           0           0           0

  Columns 2.831 through 2.840

           0           0           0           0           0           0           0           0           0           0

  Columns 2.841 through 2.850

           0           0           0           0           0           0           0           0        2849           0

  Columns 2.851 through 2.860

           0           0           0           0           0           0           0           0           0           0

  Columns 2.861 through 2.870

           0           0           0           0           0           0           0           0           0           0

  Columns 2.871 through 2.880

           0           0           0           0           0           0           0           0           0           0

  Columns 2.881 through 2.890

           0           0           0           0           0        2886           0           0           0           0

  Columns 2.891 through 2.900

           0           0           0           0           0           0           0           0           0           0

  Columns 2.901 through 2.910

           0           0           0           0           0           0           0           0           0           0

  Columns 2.911 through 2.920

           0           0           0           0           0           0           0           0           0           0

  Columns 2.921 through 2.930

           0           0        2923           0           0           0           0           0           0           0

  Columns 2.931 through 2.940

           0           0           0           0           0           0           0           0           0           0

  Columns 2.941 through 2.950

           0           0           0           0           0           0           0           0           0           0

  Columns 2.951 through 2.960

           0           0           0           0           0           0           0           0           0        2960

  Columns 2.961 through 2.970

           0           0           0           0           0           0           0           0           0           0

  Columns 2.971 through 2.980

           0           0           0           0           0           0           0           0           0           0

  Columns 2.981 through 2.990

           0           0           0           0           0           0           0           0           0           0

  Columns 2.991 through 3.000

           0           0           0           0           0           0        2997           0           0           0

  Columns 3.001 through 3.010

           0           0           0           0           0           0           0           0           0           0

  Columns 3.011 through 3.020

           0           0           0           0           0           0           0           0           0           0

  Columns 3.021 through 3.030

           0           0           0           0           0           0           0           0           0           0

  Columns 3.031 through 3.040

           0           0           0        3034           0           0           0           0           0           0

  Columns 3.041 through 3.050

           0           0           0           0           0           0           0           0           0           0

  Columns 3.051 through 3.060

           0           0           0           0           0           0           0           0           0           0

  Columns 3.061 through 3.070

           0           0           0           0           0           0           0           0           0           0

  Columns 3.071 through 3.080

        3071           0           0           0           0           0           0           0           0           0

  Columns 3.081 through 3.090

           0           0           0           0           0           0           0           0           0           0

  Columns 3.091 through 3.100

           0           0           0           0           0           0           0           0           0           0

  Columns 3.101 through 3.110

           0           0           0           0           0           0           0        3108           0           0

  Columns 3.111 through 3.120

           0           0           0           0           0           0           0           0           0           0

  Columns 3.121 through 3.130

           0           0           0           0           0           0           0           0           0           0

  Columns 3.131 through 3.140

           0           0           0           0           0           0           0           0           0           0

  Columns 3.141 through 3.150

           0           0           0           0        3145           0           0           0           0           0

  Columns 3.151 through 3.160

           0           0           0           0           0           0           0           0           0           0

  Columns 3.161 through 3.170

           0           0           0           0           0           0           0           0           0           0

  Columns 3.171 through 3.180

           0           0           0           0           0           0           0           0           0           0

  Columns 3.181 through 3.190

           0        3182           0           0           0           0           0           0           0           0

  Columns 3.191 through 3.200

           0           0           0           0           0           0           0           0           0           0

  Columns 3.201 through 3.210

           0           0           0           0           0           0           0           0           0           0

  Columns 3.211 through 3.220

           0           0           0           0           0           0           0           0        3219           0

  Columns 3.221 through 3.230

           0           0           0           0           0           0           0           0           0           0

  Columns 3.231 through 3.240

           0           0           0           0           0           0           0           0           0           0

  Columns 3.241 through 3.250

           0           0           0           0           0           0           0           0           0           0

  Columns 3.251 through 3.260

           0           0           0           0           0        3256           0           0           0           0

  Columns 3.261 through 3.270

           0           0           0           0           0           0           0           0           0           0

  Columns 3.271 through 3.280

           0           0           0           0           0           0           0           0           0           0

  Columns 3.281 through 3.290

           0           0           0           0           0           0           0           0           0           0

  Columns 3.291 through 3.300

           0           0        3293           0           0           0           0           0           0           0

  Columns 3.301 through 3.310

           0           0           0           0           0           0           0           0           0           0

  Columns 3.311 through 3.320

           0           0           0           0           0           0           0           0           0           0

  Columns 3.321 through 3.330

           0           0           0           0           0           0           0           0           0        3330

  Columns 3.331 through 3.340

           0           0           0           0           0           0           0           0           0           0

  Columns 3.341 through 3.350

           0           0           0           0           0           0           0           0           0           0

  Columns 3.351 through 3.360

           0           0           0           0           0           0           0           0           0           0

  Columns 3.361 through 3.370

           0           0           0           0           0           0        3367           0           0           0

  Columns 3.371 through 3.380

           0           0           0           0           0           0           0           0           0           0

  Columns 3.381 through 3.390

           0           0           0           0           0           0           0           0           0           0

  Columns 3.391 through 3.400

           0           0           0           0           0           0           0           0           0           0

  Columns 3.401 through 3.410

           0           0           0        3404           0           0           0           0           0           0

  Columns 3.411 through 3.420

           0           0           0           0           0           0           0           0           0           0

  Columns 3.421 through 3.430

           0           0           0           0           0           0           0           0           0           0

  Columns 3.431 through 3.440

           0           0           0           0           0           0           0           0           0           0

  Columns 3.441 through 3.450

        3441           0           0           0           0           0           0           0           0           0

  Columns 3.451 through 3.460

           0           0           0           0           0           0           0           0           0           0

  Columns 3.461 through 3.470

           0           0           0           0           0           0           0           0           0           0

  Columns 3.471 through 3.480

           0           0           0           0           0           0           0        3478           0           0

  Columns 3.481 through 3.490

           0           0           0           0           0           0           0           0           0           0

  Columns 3.491 through 3.500

           0           0           0           0           0           0           0           0           0           0

  Columns 3.501 through 3.510

           0           0           0           0           0           0           0           0           0           0

  Columns 3.511 through 3.520

           0           0           0           0        3515           0           0           0           0           0

  Columns 3.521 through 3.530

           0           0           0           0           0           0           0           0           0           0

  Columns 3.531 through 3.540

           0           0           0           0           0           0           0           0           0           0

  Columns 3.541 through 3.550

           0           0           0           0           0           0           0           0           0           0

  Columns 3.551 through 3.560

           0        3552           0           0           0           0           0           0           0           0

  Columns 3.561 through 3.570

           0           0           0           0           0           0           0           0           0           0

  Columns 3.571 through 3.580

           0           0           0           0           0           0           0           0           0           0

  Columns 3.581 through 3.590

           0           0           0           0           0           0           0           0        3589           0

  Columns 3.591 through 3.600

           0           0           0           0           0           0           0           0           0           0

  Columns 3.601 through 3.610

           0           0           0           0           0           0           0           0           0           0

  Columns 3.611 through 3.620

           0           0           0           0           0           0           0           0           0           0

  Columns 3.621 through 3.630

           0           0           0           0           0        3626           0           0           0           0

  Columns 3.631 through 3.640

           0           0           0           0           0           0           0           0           0           0

  Columns 3.641 through 3.650

           0           0           0           0           0           0           0           0           0           0

  Columns 3.651 through 3.660

           0           0           0           0           0           0           0           0           0           0

  Columns 3.661 through 3.670

           0           0        3663           0           0           0           0           0           0           0

  Columns 3.671 through 3.680

           0           0           0           0           0           0           0           0           0           0

  Columns 3.681 through 3.690

           0           0           0           0           0           0           0           0           0           0

  Columns 3.691 through 3.700

           0           0           0           0           0           0           0           0           0        3700

  Columns 3.701 through 3.710

           0           0           0           0           0           0           0           0           0           0

  Columns 3.711 through 3.720

           0           0           0           0           0           0           0           0           0           0

  Columns 3.721 through 3.730

           0           0           0           0           0           0           0           0           0           0

  Columns 3.731 through 3.740

           0           0           0           0           0           0        3737           0           0           0

  Columns 3.741 through 3.750

           0           0           0           0           0           0           0           0           0           0

  Columns 3.751 through 3.760

           0           0           0           0           0           0           0           0           0           0

  Columns 3.761 through 3.770

           0           0           0           0           0           0           0           0           0           0

  Columns 3.771 through 3.780

           0           0           0        3774           0           0           0           0           0           0

  Columns 3.781 through 3.790

           0           0           0           0           0           0           0           0           0           0

  Columns 3.791 through 3.800

           0           0           0           0           0           0           0           0           0           0

  Columns 3.801 through 3.810

           0           0           0           0           0           0           0           0           0           0

  Columns 3.811 through 3.820

        3811           0           0           0           0           0           0           0           0           0

  Columns 3.821 through 3.830

           0           0           0           0           0           0           0           0           0           0

  Columns 3.831 through 3.840

           0           0           0           0           0           0           0           0           0           0

  Columns 3.841 through 3.850

           0           0           0           0           0           0           0        3848           0           0

  Columns 3.851 through 3.860

           0           0           0           0           0           0           0           0           0           0

  Columns 3.861 through 3.870

           0           0           0           0           0           0           0           0           0           0

  Columns 3.871 through 3.880

           0           0           0           0           0           0           0           0           0           0

  Columns 3.881 through 3.890

           0           0           0           0        3885           0           0           0           0           0

  Columns 3.891 through 3.900

           0           0           0           0           0           0           0           0           0           0

  Columns 3.901 through 3.910

           0           0           0           0           0           0           0           0           0           0

  Columns 3.911 through 3.920

           0           0           0           0           0           0           0           0           0           0

  Columns 3.921 through 3.930

           0        3922           0           0           0           0           0           0           0           0

  Columns 3.931 through 3.940

           0           0           0           0           0           0           0           0           0           0

  Columns 3.941 through 3.950

           0           0           0           0           0           0           0           0           0           0

  Columns 3.951 through 3.960

           0           0           0           0           0           0           0           0        3959           0

  Columns 3.961 through 3.970

           0           0           0           0           0           0           0           0           0           0

  Columns 3.971 through 3.980

           0           0           0           0           0           0           0           0           0           0

  Columns 3.981 through 3.990

           0           0           0           0           0           0           0           0           0           0

  Columns 3.991 through 4.000

           0           0           0           0           0        3996           0           0           0           0

  Columns 4.001 through 4.010

           0           0           0           0           0           0           0           0           0           0

  Columns 4.011 through 4.020

           0           0           0           0           0           0           0           0           0           0

  Columns 4.021 through 4.030

           0           0           0           0           0           0           0           0           0           0

  Columns 4.031 through 4.040

           0           0        4033           0           0           0           0           0           0           0

  Columns 4.041 through 4.050

           0           0           0           0           0           0           0           0           0           0

  Columns 4.051 through 4.060

           0           0           0           0           0           0           0           0           0           0

  Columns 4.061 through 4.070

           0           0           0           0           0           0           0           0           0        4070

  Columns 4.071 through 4.080

           0           0           0           0           0           0           0           0           0           0

  Columns 4.081 through 4.090

           0           0           0           0           0           0           0           0           0           0

  Columns 4.091 through 4.100

           0           0           0           0           0           0           0           0           0           0

  Columns 4.101 through 4.110

           0           0           0           0           0           0        4107           0           0           0

  Columns 4.111 through 4.120

           0           0           0           0           0           0           0           0           0           0

  Columns 4.121 through 4.130

           0           0           0           0           0           0           0           0           0           0

  Columns 4.131 through 4.140

           0           0           0           0           0           0           0           0           0           0

  Columns 4.141 through 4.150

           0           0           0        4144           0           0           0           0           0           0

  Columns 4.151 through 4.160

           0           0           0           0           0           0           0           0           0           0

  Columns 4.161 through 4.170

           0           0           0           0           0           0           0           0           0           0

  Columns 4.171 through 4.180

           0           0           0           0           0           0           0           0           0           0

  Columns 4.181 through 4.190

        4181           0           0           0           0           0           0           0           0           0

  Columns 4.191 through 4.200

           0           0           0           0           0           0           0           0           0           0

  Columns 4.201 through 4.210

           0           0           0           0           0           0           0           0           0           0

  Columns 4.211 through 4.220

           0           0           0           0           0           0           0        4218           0           0

  Columns 4.221 through 4.230

           0           0           0           0           0           0           0           0           0           0

  Columns 4.231 through 4.240

           0           0           0           0           0           0           0           0           0           0

  Columns 4.241 through 4.250

           0           0           0           0           0           0           0           0           0           0

  Columns 4.251 through 4.260

           0           0           0           0        4255           0           0           0           0           0

  Columns 4.261 through 4.270

           0           0           0           0           0           0           0           0           0           0

  Columns 4.271 through 4.280

           0           0           0           0           0           0           0           0           0           0

  Columns 4.281 through 4.290

           0           0           0           0           0           0           0           0           0           0

  Columns 4.291 through 4.300

           0        4292           0           0           0           0           0           0           0           0

  Columns 4.301 through 4.310

           0           0           0           0           0           0           0           0           0           0

  Columns 4.311 through 4.320

           0           0           0           0           0           0           0           0           0           0

  Columns 4.321 through 4.330

           0           0           0           0           0           0           0           0        4329           0

  Columns 4.331 through 4.340

           0           0           0           0           0           0           0           0           0           0

  Columns 4.341 through 4.350

           0           0           0           0           0           0           0           0           0           0

  Columns 4.351 through 4.360

           0           0           0           0           0           0           0           0           0           0

  Columns 4.361 through 4.370

           0           0           0           0           0        4366           0           0           0           0

  Columns 4.371 through 4.380

           0           0           0           0           0           0           0           0           0           0

  Columns 4.381 through 4.390

           0           0           0           0           0           0           0           0           0           0

  Columns 4.391 through 4.400

           0           0           0           0           0           0           0           0           0           0

  Columns 4.401 through 4.410

           0           0        4403           0           0           0           0           0           0           0

  Columns 4.411 through 4.420

           0           0           0           0           0           0           0           0           0           0

  Columns 4.421 through 4.430

           0           0           0           0           0           0           0           0           0           0

  Columns 4.431 through 4.440

           0           0           0           0           0           0           0           0           0        4440

  Columns 4.441 through 4.450

           0           0           0           0           0           0           0           0           0           0

  Columns 4.451 through 4.460

           0           0           0           0           0           0           0           0           0           0

  Columns 4.461 through 4.470

           0           0           0           0           0           0           0           0           0           0

  Columns 4.471 through 4.480

           0           0           0           0           0           0        4477           0           0           0

  Columns 4.481 through 4.490

           0           0           0           0           0           0           0           0           0           0

  Columns 4.491 through 4.500

           0           0           0           0           0           0           0           0           0           0

  Columns 4.501 through 4.510

           0           0           0           0           0           0           0           0           0           0

  Columns 4.511 through 4.520

           0           0           0        4514           0           0           0           0           0           0

  Columns 4.521 through 4.530

           0           0           0           0           0           0           0           0           0           0

  Columns 4.531 through 4.540

           0           0           0           0           0           0           0           0           0           0

  Columns 4.541 through 4.550

           0           0           0           0           0           0           0           0           0           0

  Columns 4.551 through 4.560

        4551           0           0           0           0           0           0           0           0           0

  Columns 4.561 through 4.570

           0           0           0           0           0           0           0           0           0           0

  Columns 4.571 through 4.580

           0           0           0           0           0           0           0           0           0           0

  Columns 4.581 through 4.590

           0           0           0           0           0           0           0        4588           0           0

  Columns 4.591 through 4.600

           0           0           0           0           0           0           0           0           0           0

  Columns 4.601 through 4.610

           0           0           0           0           0           0           0           0           0           0

  Columns 4.611 through 4.620

           0           0           0           0           0           0           0           0           0           0

  Columns 4.621 through 4.630

           0           0           0           0        4625           0           0           0           0           0

  Columns 4.631 through 4.640

           0           0           0           0           0           0           0           0           0           0

  Columns 4.641 through 4.650

           0           0           0           0           0           0           0           0           0           0

  Columns 4.651 through 4.660

           0           0           0           0           0           0           0           0           0           0

  Columns 4.661 through 4.670

           0        4662           0           0           0           0           0           0           0           0

  Columns 4.671 through 4.680

           0           0           0           0           0           0           0           0           0           0

  Columns 4.681 through 4.690

           0           0           0           0           0           0           0           0           0           0

  Columns 4.691 through 4.700

           0           0           0           0           0           0           0           0        4699           0

  Columns 4.701 through 4.710

           0           0           0           0           0           0           0           0           0           0

  Columns 4.711 through 4.720

           0           0           0           0           0           0           0           0           0           0

  Columns 4.721 through 4.730

           0           0           0           0           0           0           0           0           0           0

  Columns 4.731 through 4.740

           0           0           0           0           0        4736           0           0           0           0

  Columns 4.741 through 4.750

           0           0           0           0           0           0           0           0           0           0

  Columns 4.751 through 4.760

           0           0           0           0           0           0           0           0           0           0

  Columns 4.761 through 4.770

           0           0           0           0           0           0           0           0           0           0

  Columns 4.771 through 4.780

           0           0        4773           0           0           0           0           0           0           0

  Columns 4.781 through 4.790

           0           0           0           0           0           0           0           0           0           0

  Columns 4.791 through 4.800

           0           0           0           0           0           0           0           0           0           0

  Columns 4.801 through 4.810

           0           0           0           0           0           0           0           0           0        4810

  Columns 4.811 through 4.820

           0           0           0           0           0           0           0           0           0           0

  Columns 4.821 through 4.830

           0           0           0           0           0           0           0           0           0           0

  Columns 4.831 through 4.840

           0           0           0           0           0           0           0           0           0           0

  Columns 4.841 through 4.850

           0           0           0           0           0           0        4847           0           0           0

  Columns 4.851 through 4.860

           0           0           0           0           0           0           0           0           0           0

  Columns 4.861 through 4.870

           0           0           0           0           0           0           0           0           0           0

  Columns 4.871 through 4.880

           0           0           0           0           0           0           0           0           0           0

  Columns 4.881 through 4.890

           0           0           0        4884           0           0           0           0           0           0

  Columns 4.891 through 4.900

           0           0           0           0           0           0           0           0           0           0

  Columns 4.901 through 4.910

           0           0           0           0           0           0           0           0           0           0

  Columns 4.911 through 4.920

           0           0           0           0           0           0           0           0           0           0

  Columns 4.921 through 4.930

        4921           0           0           0           0           0           0           0           0           0

  Columns 4.931 through 4.940

           0           0           0           0           0           0           0           0           0           0

  Columns 4.941 through 4.950

           0           0           0           0           0           0           0           0           0           0

  Columns 4.951 through 4.960

           0           0           0           0           0           0           0        4958           0           0

  Columns 4.961 through 4.970

           0           0           0           0           0           0           0           0           0           0

  Columns 4.971 through 4.980

           0           0           0           0           0           0           0           0           0           0

  Columns 4.981 through 4.990

           0           0           0           0           0           0           0           0           0           0

  Columns 4.991 through 5.000

           0           0           0           0        4995           0           0           0           0           0

  Columns 5.001 through 5.010

           0           0           0           0           0           0           0           0           0           0

  Columns 5.011 through 5.020

           0           0           0           0           0           0           0           0           0           0

  Columns 5.021 through 5.030

           0           0           0           0           0           0           0           0           0           0

  Columns 5.031 through 5.040

           0        5032           0           0           0           0           0           0           0           0

  Columns 5.041 through 5.050

           0           0           0           0           0           0           0           0           0           0

  Columns 5.051 through 5.060

           0           0           0           0           0           0           0           0           0           0

  Columns 5.061 through 5.070

           0           0           0           0           0           0           0           0        5069           0

  Columns 5.071 through 5.080

           0           0           0           0           0           0           0           0           0           0

  Columns 5.081 through 5.090

           0           0           0           0           0           0           0           0           0           0

  Columns 5.091 through 5.100

           0           0           0           0           0           0           0           0           0           0

  Columns 5.101 through 5.110

           0           0           0           0           0        5106           0           0           0           0

  Columns 5.111 through 5.120

           0           0           0           0           0           0           0           0           0           0

  Columns 5.121 through 5.130

           0           0           0           0           0           0           0           0           0           0

  Columns 5.131 through 5.140

           0           0           0           0           0           0           0           0           0           0

  Columns 5.141 through 5.150

           0           0        5143           0           0           0           0           0           0           0

  Columns 5.151 through 5.160

           0           0           0           0           0           0           0           0           0           0

  Columns 5.161 through 5.170

           0           0           0           0           0           0           0           0           0           0

  Columns 5.171 through 5.180

           0           0           0           0           0           0           0           0           0        5180

  Columns 5.181 through 5.190

           0           0           0           0           0           0           0           0           0           0

  Columns 5.191 through 5.200

           0           0           0           0           0           0           0           0           0           0

  Columns 5.201 through 5.210

           0           0           0           0           0           0           0           0           0           0

  Columns 5.211 through 5.220

           0           0           0           0           0           0        5217           0           0           0

  Columns 5.221 through 5.230

           0           0           0           0           0           0           0           0           0           0

  Columns 5.231 through 5.240

           0           0           0           0           0           0           0           0           0           0

  Columns 5.241 through 5.250

           0           0           0           0           0           0           0           0           0           0

  Columns 5.251 through 5.260

           0           0           0        5254           0           0           0           0           0           0

  Columns 5.261 through 5.270

           0           0           0           0           0           0           0           0           0           0

  Columns 5.271 through 5.280

           0           0           0           0           0           0           0           0           0           0

  Columns 5.281 through 5.290

           0           0           0           0           0           0           0           0           0           0

  Columns 5.291 through 5.300

        5291           0           0           0           0           0           0           0           0           0

  Columns 5.301 through 5.310

           0           0           0           0           0           0           0           0           0           0

  Columns 5.311 through 5.320

           0           0           0           0           0           0           0           0           0           0

  Columns 5.321 through 5.330

           0           0           0           0           0           0           0        5328           0           0

  Columns 5.331 through 5.340

           0           0           0           0           0           0           0           0           0           0

  Columns 5.341 through 5.350

           0           0           0           0           0           0           0           0           0           0

  Columns 5.351 through 5.360

           0           0           0           0           0           0           0           0           0           0

  Columns 5.361 through 5.370

           0           0           0           0        5365           0           0           0           0           0

  Columns 5.371 through 5.380

           0           0           0           0           0           0           0           0           0           0

  Columns 5.381 through 5.390

           0           0           0           0           0           0           0           0           0           0

  Columns 5.391 through 5.400

           0           0           0           0           0           0           0           0           0           0

  Columns 5.401 through 5.410

           0        5402           0           0           0           0           0           0           0           0

  Columns 5.411 through 5.420

           0           0           0           0           0           0           0           0           0           0

  Columns 5.421 through 5.430

           0           0           0           0           0           0           0           0           0           0

  Columns 5.431 through 5.440

           0           0           0           0           0           0           0           0        5439           0

  Columns 5.441 through 5.450

           0           0           0           0           0           0           0           0           0           0

  Columns 5.451 through 5.460

           0           0           0           0           0           0           0           0           0           0

  Columns 5.461 through 5.470

           0           0           0           0           0           0           0           0           0           0

  Columns 5.471 through 5.480

           0           0           0           0           0        5476           0           0           0           0

  Columns 5.481 through 5.490

           0           0           0           0           0           0           0           0           0           0

  Columns 5.491 through 5.500

           0           0           0           0           0           0           0           0           0           0

  Columns 5.501 through 5.510

           0           0           0           0           0           0           0           0           0           0

  Columns 5.511 through 5.520

           0           0        5513           0           0           0           0           0           0           0

  Columns 5.521 through 5.530

           0           0           0           0           0           0           0           0           0           0

  Columns 5.531 through 5.540

           0           0           0           0           0           0           0           0           0           0

  Columns 5.541 through 5.550

           0           0           0           0           0           0           0           0           0        5550

  Columns 5.551 through 5.560

           0           0           0           0           0           0           0           0           0           0

  Columns 5.561 through 5.570

           0           0           0           0           0           0           0           0           0           0

  Columns 5.571 through 5.580

           0           0           0           0           0           0           0           0           0           0

  Columns 5.581 through 5.590

           0           0           0           0           0           0        5587           0           0           0

  Columns 5.591 through 5.600

           0           0           0           0           0           0           0           0           0           0

  Columns 5.601 through 5.610

           0           0           0           0           0           0           0           0           0           0

  Columns 5.611 through 5.620

           0           0           0           0           0           0           0           0           0           0

  Columns 5.621 through 5.630

           0           0           0        5624           0           0           0           0           0           0

  Columns 5.631 through 5.640

           0           0           0           0           0           0           0           0           0           0

  Columns 5.641 through 5.650

           0           0           0           0           0           0           0           0           0           0

  Columns 5.651 through 5.660

           0           0           0           0           0           0           0           0           0           0

  Columns 5.661 through 5.670

        5661           0           0           0           0           0           0           0           0           0

  Columns 5.671 through 5.680

           0           0           0           0           0           0           0           0           0           0

  Columns 5.681 through 5.690

           0           0           0           0           0           0           0           0           0           0

  Columns 5.691 through 5.700

           0           0           0           0           0           0           0        5698           0           0

  Columns 5.701 through 5.710

           0           0           0           0           0           0           0           0           0           0

  Columns 5.711 through 5.720

           0           0           0           0           0           0           0           0           0           0

  Columns 5.721 through 5.730

           0           0           0           0           0           0           0           0           0           0

  Columns 5.731 through 5.740

           0           0           0           0        5735           0           0           0           0           0

  Columns 5.741 through 5.750

           0           0           0           0           0           0           0           0           0           0

  Columns 5.751 through 5.760

           0           0           0           0           0           0           0           0           0           0

  Columns 5.761 through 5.770

           0           0           0           0           0           0           0           0           0           0

  Columns 5.771 through 5.780

           0        5772           0           0           0           0           0           0           0           0

  Columns 5.781 through 5.790

           0           0           0           0           0           0           0           0           0           0

  Columns 5.791 through 5.800

           0           0           0           0           0           0           0           0           0           0

  Columns 5.801 through 5.810

           0           0           0           0           0           0           0           0        5809           0

  Columns 5.811 through 5.820

           0           0           0           0           0           0           0           0           0           0

  Columns 5.821 through 5.830

           0           0           0           0           0           0           0           0           0           0

  Columns 5.831 through 5.840

           0           0           0           0           0           0           0           0           0           0

  Columns 5.841 through 5.850

           0           0           0           0           0        5846           0           0           0           0

  Columns 5.851 through 5.860

           0           0           0           0           0           0           0           0           0           0

  Columns 5.861 through 5.870

           0           0           0           0           0           0           0           0           0           0

  Columns 5.871 through 5.880

           0           0           0           0           0           0           0           0           0           0

  Columns 5.881 through 5.890

           0           0        5883           0           0           0           0           0           0           0

  Columns 5.891 through 5.900

           0           0           0           0           0           0           0           0           0           0

  Columns 5.901 through 5.910

           0           0           0           0           0           0           0           0           0           0

  Columns 5.911 through 5.920

           0           0           0           0           0           0           0           0           0        5920

  Columns 5.921 through 5.930

           0           0           0           0           0           0           0           0           0           0

  Columns 5.931 through 5.940

           0           0           0           0           0           0           0           0           0           0

  Columns 5.941 through 5.950

           0           0           0           0           0           0           0           0           0           0

  Columns 5.951 through 5.960

           0           0           0           0           0           0        5957           0           0           0

  Columns 5.961 through 5.970

           0           0           0           0           0           0           0           0           0           0

  Columns 5.971 through 5.980

           0           0           0           0           0           0           0           0           0           0

  Columns 5.981 through 5.990

           0           0           0           0           0           0           0           0           0           0

  Columns 5.991 through 6.000

           0           0           0        5994           0           0           0           0           0           0

  Columns 6.001 through 6.010

           0           0           0           0           0           0           0           0           0           0

  Columns 6.011 through 6.020

           0           0           0           0           0           0           0           0           0           0

  Columns 6.021 through 6.030

           0           0           0           0           0           0           0           0           0           0

  Columns 6.031 through 6.040

        6031           0           0           0           0           0           0           0           0           0

  Columns 6.041 through 6.050

           0           0           0           0           0           0           0           0           0           0

  Columns 6.051 through 6.060

           0           0           0           0           0           0           0           0           0           0

  Columns 6.061 through 6.070

           0           0           0           0           0           0           0        6068           0           0

  Columns 6.071 through 6.080

           0           0           0           0           0           0           0           0           0           0

  Columns 6.081 through 6.090

           0           0           0           0           0           0           0           0           0           0

  Columns 6.091 through 6.100

           0           0           0           0           0           0           0           0           0           0

  Columns 6.101 through 6.110

           0           0           0           0        6105           0           0           0           0           0

  Columns 6.111 through 6.120

           0           0           0           0           0           0           0           0           0           0

  Columns 6.121 through 6.130

           0           0           0           0           0           0           0           0           0           0

  Columns 6.131 through 6.140

           0           0           0           0           0           0           0           0           0           0

  Columns 6.141 through 6.150

           0        6142           0           0           0           0           0           0           0           0

  Columns 6.151 through 6.160

           0           0           0           0           0           0           0           0           0           0

  Columns 6.161 through 6.170

           0           0           0           0           0           0           0           0           0           0

  Columns 6.171 through 6.180

           0           0           0           0           0           0           0           0        6179           0

  Columns 6.181 through 6.190

           0           0           0           0           0           0           0           0           0           0

  Columns 6.191 through 6.200

           0           0           0           0           0           0           0           0           0           0

  Columns 6.201 through 6.210

           0           0           0           0           0           0           0           0           0           0

  Columns 6.211 through 6.220

           0           0           0           0           0        6216           0           0           0           0

  Columns 6.221 through 6.230

           0           0           0           0           0           0           0           0           0           0

  Columns 6.231 through 6.240

           0           0           0           0           0           0           0           0           0           0

  Columns 6.241 through 6.250

           0           0           0           0           0           0           0           0           0           0

  Columns 6.251 through 6.260

           0           0        6253           0           0           0           0           0           0           0

  Columns 6.261 through 6.270

           0           0           0           0           0           0           0           0           0           0

  Columns 6.271 through 6.280

           0           0           0           0           0           0           0           0           0           0

  Columns 6.281 through 6.290

           0           0           0           0           0           0           0           0           0        6290

  Columns 6.291 through 6.300

           0           0           0           0           0           0           0           0           0           0

  Columns 6.301 through 6.310

           0           0           0           0           0           0           0           0           0           0

  Columns 6.311 through 6.320

           0           0           0           0           0           0           0           0           0           0

  Columns 6.321 through 6.330

           0           0           0           0           0           0        6327           0           0           0

  Columns 6.331 through 6.340

           0           0           0           0           0           0           0           0           0           0

  Columns 6.341 through 6.350

           0           0           0           0           0           0           0           0           0           0

  Columns 6.351 through 6.360

           0           0           0           0           0           0           0           0           0           0

  Columns 6.361 through 6.370

           0           0           0        6364           0           0           0           0           0           0

  Columns 6.371 through 6.380

           0           0           0           0           0           0           0           0           0           0

  Columns 6.381 through 6.390

           0           0           0           0           0           0           0           0           0           0

  Columns 6.391 through 6.400

           0           0           0           0           0           0           0           0           0           0

  Columns 6.401 through 6.410

        6401           0           0           0           0           0           0           0           0           0

  Columns 6.411 through 6.420

           0           0           0           0           0           0           0           0           0           0

  Columns 6.421 through 6.430

           0           0           0           0           0           0           0           0           0           0

  Columns 6.431 through 6.440

           0           0           0           0           0           0           0        6438           0           0

  Columns 6.441 through 6.450

           0           0           0           0           0           0           0           0           0           0

  Columns 6.451 through 6.460

           0           0           0           0           0           0           0           0           0           0

  Columns 6.461 through 6.470

           0           0           0           0           0           0           0           0           0           0

  Columns 6.471 through 6.480

           0           0           0           0        6475           0           0           0           0           0

  Columns 6.481 through 6.490

           0           0           0           0           0           0           0           0           0           0

  Columns 6.491 through 6.500

           0           0           0           0           0           0           0           0           0           0

  Columns 6.501 through 6.510

           0           0           0           0           0           0           0           0           0           0

  Columns 6.511 through 6.520

           0        6512           0           0           0           0           0           0           0           0

  Columns 6.521 through 6.530

           0           0           0           0           0           0           0           0           0           0

  Columns 6.531 through 6.540

           0           0           0           0           0           0           0           0           0           0

  Columns 6.541 through 6.550

           0           0           0           0           0           0           0           0        6549           0

  Columns 6.551 through 6.560

           0           0           0           0           0           0           0           0           0           0

  Columns 6.561 through 6.570

           0           0           0           0           0           0           0           0           0           0

  Columns 6.571 through 6.580

           0           0           0           0           0           0           0           0           0           0

  Columns 6.581 through 6.590

           0           0           0           0           0        6586           0           0           0           0

  Columns 6.591 through 6.600

           0           0           0           0           0           0           0           0           0           0

  Columns 6.601 through 6.610

           0           0           0           0           0           0           0           0           0           0

  Columns 6.611 through 6.620

           0           0           0           0           0           0           0           0           0           0

  Columns 6.621 through 6.630

           0           0        6623           0           0           0           0           0           0           0

  Columns 6.631 through 6.640

           0           0           0           0           0           0           0           0           0           0

  Columns 6.641 through 6.650

           0           0           0           0           0           0           0           0           0           0

  Columns 6.651 through 6.660

           0           0           0           0           0           0           0           0           0        6660

  Columns 6.661 through 6.670

           0           0           0           0           0           0           0           0           0           0

  Columns 6.671 through 6.680

           0           0           0           0           0           0           0           0           0           0

  Columns 6.681 through 6.690

           0           0           0           0           0           0           0           0           0           0

  Columns 6.691 through 6.700

           0           0           0           0           0           0        6697           0           0           0

  Columns 6.701 through 6.710

           0           0           0           0           0           0           0           0           0           0

  Columns 6.711 through 6.720

           0           0           0           0           0           0           0           0           0           0

  Columns 6.721 through 6.730

           0           0           0           0           0           0           0           0           0           0

  Columns 6.731 through 6.740

           0           0           0        6734           0           0           0           0           0           0

  Columns 6.741 through 6.750

           0           0           0           0           0           0           0           0           0           0

  Columns 6.751 through 6.760

           0           0           0           0           0           0           0           0           0           0

  Columns 6.761 through 6.770

           0           0           0           0           0           0           0           0           0           0

  Columns 6.771 through 6.780

        6771           0           0           0           0           0           0           0           0           0

  Columns 6.781 through 6.790

           0           0           0           0           0           0           0           0           0           0

  Columns 6.791 through 6.800

           0           0           0           0           0           0           0           0           0           0

  Columns 6.801 through 6.810

           0           0           0           0           0           0           0        6808           0           0

  Columns 6.811 through 6.820

           0           0           0           0           0           0           0           0           0           0

  Columns 6.821 through 6.830

           0           0           0           0           0           0           0           0           0           0

  Columns 6.831 through 6.840

           0           0           0           0           0           0           0           0           0           0

  Columns 6.841 through 6.850

           0           0           0           0        6845           0           0           0           0           0

  Columns 6.851 through 6.860

           0           0           0           0           0           0           0           0           0           0

  Columns 6.861 through 6.870

           0           0           0           0           0           0           0           0           0           0

  Columns 6.871 through 6.880

           0           0           0           0           0           0           0           0           0           0

  Columns 6.881 through 6.890

           0        6882           0           0           0           0           0           0           0           0

  Columns 6.891 through 6.900

           0           0           0           0           0           0           0           0           0           0

  Columns 6.901 through 6.910

           0           0           0           0           0           0           0           0           0           0

  Columns 6.911 through 6.920

           0           0           0           0           0           0           0           0        6919           0

  Columns 6.921 through 6.930

           0           0           0           0           0           0           0           0           0           0

  Columns 6.931 through 6.940

           0           0           0           0           0           0           0           0           0           0

  Columns 6.941 through 6.950

           0           0           0           0           0           0           0           0           0           0

  Columns 6.951 through 6.960

           0           0           0           0           0        6956           0           0           0           0

  Columns 6.961 through 6.970

           0           0           0           0           0           0           0           0           0           0

  Columns 6.971 through 6.980

           0           0           0           0           0           0           0           0           0           0

  Columns 6.981 through 6.990

           0           0           0           0           0           0           0           0           0           0

  Columns 6.991 through 7.000

           0           0        6993           0           0           0           0           0           0           0

  Columns 7.001 through 7.010

           0           0           0           0           0           0           0           0           0           0

  Columns 7.011 through 7.020

           0           0           0           0           0           0           0           0           0           0

  Columns 7.021 through 7.030

           0           0           0           0           0           0           0           0           0        7030

  Columns 7.031 through 7.040

           0           0           0           0           0           0           0           0           0           0

  Columns 7.041 through 7.050

           0           0           0           0           0           0           0           0           0           0

  Columns 7.051 through 7.060

           0           0           0           0           0           0           0           0           0           0

  Columns 7.061 through 7.070

           0           0           0           0           0           0        7067           0           0           0

  Columns 7.071 through 7.080

           0           0           0           0           0           0           0           0           0           0

  Columns 7.081 through 7.090

           0           0           0           0           0           0           0           0           0           0

  Columns 7.091 through 7.100

           0           0           0           0           0           0           0           0           0           0

  Columns 7.101 through 7.110

           0           0           0        7104           0           0           0           0           0           0

  Columns 7.111 through 7.120

           0           0           0           0           0           0           0           0           0           0

  Columns 7.121 through 7.130

           0           0           0           0           0           0           0           0           0           0

  Columns 7.131 through 7.140

           0           0           0           0           0           0           0           0           0           0

  Columns 7.141 through 7.150

        7141           0           0           0           0           0           0           0           0           0

  Columns 7.151 through 7.160

           0           0           0           0           0           0           0           0           0           0

  Columns 7.161 through 7.170

           0           0           0           0           0           0           0           0           0           0

  Columns 7.171 through 7.180

           0           0           0           0           0           0           0        7178           0           0

  Columns 7.181 through 7.190

           0           0           0           0           0           0           0           0           0           0

  Columns 7.191 through 7.200

           0           0           0           0           0           0           0           0           0           0

  Columns 7.201 through 7.210

           0           0           0           0           0           0           0           0           0           0

  Columns 7.211 through 7.220

           0           0           0           0        7215           0           0           0           0           0

  Columns 7.221 through 7.230

           0           0           0           0           0           0           0           0           0           0

  Columns 7.231 through 7.240

           0           0           0           0           0           0           0           0           0           0

  Columns 7.241 through 7.250

           0           0           0           0           0           0           0           0           0           0

  Columns 7.251 through 7.260

           0        7252           0           0           0           0           0           0           0           0

  Columns 7.261 through 7.270

           0           0           0           0           0           0           0           0           0           0

  Columns 7.271 through 7.280

           0           0           0           0           0           0           0           0           0           0

  Columns 7.281 through 7.290

           0           0           0           0           0           0           0           0        7289           0

  Columns 7.291 through 7.300

           0           0           0           0           0           0           0           0           0           0

  Columns 7.301 through 7.310

           0           0           0           0           0           0           0           0           0           0

  Columns 7.311 through 7.320

           0           0           0           0           0           0           0           0           0           0

  Columns 7.321 through 7.330

           0           0           0           0           0        7326           0           0           0           0

  Columns 7.331 through 7.340

           0           0           0           0           0           0           0           0           0           0

  Columns 7.341 through 7.350

           0           0           0           0           0           0           0           0           0           0

  Columns 7.351 through 7.360

           0           0           0           0           0           0           0           0           0           0

  Columns 7.361 through 7.370

           0           0        7363           0           0           0           0           0           0           0

  Columns 7.371 through 7.380

           0           0           0           0           0           0           0           0           0           0

  Columns 7.381 through 7.390

           0           0           0           0           0           0           0           0           0           0

  Columns 7.391 through 7.400

           0           0           0           0           0           0           0           0           0        7400

  Columns 7.401 through 7.410

           0           0           0           0           0           0           0           0           0           0

  Columns 7.411 through 7.420

           0           0           0           0           0           0           0           0           0           0

  Columns 7.421 through 7.430

           0           0           0           0           0           0           0           0           0           0

  Columns 7.431 through 7.440

           0           0           0           0           0           0        7437           0           0           0

  Columns 7.441 through 7.450

           0           0           0           0           0           0           0           0           0           0

  Columns 7.451 through 7.460

           0           0           0           0           0           0           0           0           0           0

  Columns 7.461 through 7.470

           0           0           0           0           0           0           0           0           0           0

  Columns 7.471 through 7.480

           0           0           0        7474           0           0           0           0           0           0

  Columns 7.481 through 7.490

           0           0           0           0           0           0           0           0           0           0

  Columns 7.491 through 7.500

           0           0           0           0           0           0           0           0           0           0

  Columns 7.501 through 7.510

           0           0           0           0           0           0           0           0           0           0

  Columns 7.511 through 7.520

        7511           0           0           0           0           0           0           0           0           0

  Columns 7.521 through 7.530

           0           0           0           0           0           0           0           0           0           0

  Columns 7.531 through 7.540

           0           0           0           0           0           0           0           0           0           0

  Columns 7.541 through 7.550

           0           0           0           0           0           0           0        7548           0           0

  Columns 7.551 through 7.560

           0           0           0           0           0           0           0           0           0           0

  Columns 7.561 through 7.570

           0           0           0           0           0           0           0           0           0           0

  Columns 7.571 through 7.580

           0           0           0           0           0           0           0           0           0           0

  Columns 7.581 through 7.590

           0           0           0           0        7585           0           0           0           0           0

  Columns 7.591 through 7.600

           0           0           0           0           0           0           0           0           0           0

  Columns 7.601 through 7.610

           0           0           0           0           0           0           0           0           0           0

  Columns 7.611 through 7.620

           0           0           0           0           0           0           0           0           0           0

  Columns 7.621 through 7.630

           0        7622           0           0           0           0           0           0           0           0

  Columns 7.631 through 7.640

           0           0           0           0           0           0           0           0           0           0

  Columns 7.641 through 7.650

           0           0           0           0           0           0           0           0           0           0

  Columns 7.651 through 7.660

           0           0           0           0           0           0           0           0        7659           0

  Columns 7.661 through 7.670

           0           0           0           0           0           0           0           0           0           0

  Columns 7.671 through 7.680

           0           0           0           0           0           0           0           0           0           0

  Columns 7.681 through 7.690

           0           0           0           0           0           0           0           0           0           0

  Columns 7.691 through 7.700

           0           0           0           0           0        7696           0           0           0           0

  Columns 7.701 through 7.710

           0           0           0           0           0           0           0           0           0           0

  Columns 7.711 through 7.720

           0           0           0           0           0           0           0           0           0           0

  Columns 7.721 through 7.730

           0           0           0           0           0           0           0           0           0           0

  Columns 7.731 through 7.740

           0           0        7733           0           0           0           0           0           0           0

  Columns 7.741 through 7.750

           0           0           0           0           0           0           0           0           0           0

  Columns 7.751 through 7.760

           0           0           0           0           0           0           0           0           0           0

  Columns 7.761 through 7.770

           0           0           0           0           0           0           0           0           0        7770

  Columns 7.771 through 7.780

           0           0           0           0           0           0           0           0           0           0

  Columns 7.781 through 7.790

           0           0           0           0           0           0           0           0           0           0

  Columns 7.791 through 7.800

           0           0           0           0           0           0           0           0           0           0

  Columns 7.801 through 7.810

           0           0           0           0           0           0        7807           0           0           0

  Columns 7.811 through 7.820

           0           0           0           0           0           0           0           0           0           0

  Columns 7.821 through 7.830

           0           0           0           0           0           0           0           0           0           0

  Columns 7.831 through 7.840

           0           0           0           0           0           0           0           0           0           0

  Columns 7.841 through 7.850

           0           0           0        7844           0           0           0           0           0           0

  Columns 7.851 through 7.860

           0           0           0           0           0           0           0           0           0           0

  Columns 7.861 through 7.870

           0           0           0           0           0           0           0           0           0           0

  Columns 7.871 through 7.880

           0           0           0           0           0           0           0           0           0           0

  Columns 7.881 through 7.890

        7881           0           0           0           0           0           0           0           0           0

  Columns 7.891 through 7.900

           0           0           0           0           0           0           0           0           0           0

  Columns 7.901 through 7.910

           0           0           0           0           0           0           0           0           0           0

  Columns 7.911 through 7.920

           0           0           0           0           0           0           0        7918           0           0

  Columns 7.921 through 7.930

           0           0           0           0           0           0           0           0           0           0

  Columns 7.931 through 7.940

           0           0           0           0           0           0           0           0           0           0

  Columns 7.941 through 7.950

           0           0           0           0           0           0           0           0           0           0

  Columns 7.951 through 7.960

           0           0           0           0        7955           0           0           0           0           0

  Columns 7.961 through 7.970

           0           0           0           0           0           0           0           0           0           0

  Columns 7.971 through 7.980

           0           0           0           0           0           0           0           0           0           0

  Columns 7.981 through 7.990

           0           0           0           0           0           0           0           0           0           0

  Columns 7.991 through 8.000

           0        7992           0           0           0           0           0           0           0           0

  Columns 8.001 through 8.010

           0           0           0           0           0           0           0           0           0           0

  Columns 8.011 through 8.020

           0           0           0           0           0           0           0           0           0           0

  Columns 8.021 through 8.030

           0           0           0           0           0           0           0           0        8029           0

  Columns 8.031 through 8.040

           0           0           0           0           0           0           0           0           0           0

  Columns 8.041 through 8.050

           0           0           0           0           0           0           0           0           0           0

  Columns 8.051 through 8.060

           0           0           0           0           0           0           0           0           0           0

  Columns 8.061 through 8.070

           0           0           0           0           0        8066           0           0           0           0

  Columns 8.071 through 8.080

           0           0           0           0           0           0           0           0           0           0

  Columns 8.081 through 8.090

           0           0           0           0           0           0           0           0           0           0

  Columns 8.091 through 8.100

           0           0           0           0           0           0           0           0           0           0

  Columns 8.101 through 8.110

           0           0        8103           0           0           0           0           0           0           0

  Columns 8.111 through 8.120

           0           0           0           0           0           0           0           0           0           0

  Columns 8.121 through 8.130

           0           0           0           0           0           0           0           0           0           0

  Columns 8.131 through 8.140

           0           0           0           0           0           0           0           0           0        8140

  Columns 8.141 through 8.150

           0           0           0           0           0           0           0           0           0           0

  Columns 8.151 through 8.160

           0           0           0           0           0           0           0           0           0           0

  Columns 8.161 through 8.170

           0           0           0           0           0           0           0           0           0           0

  Columns 8.171 through 8.180

           0           0           0           0           0           0        8177           0           0           0

  Columns 8.181 through 8.190

           0           0           0           0           0           0           0           0           0           0

  Columns 8.191 through 8.200

           0           0           0           0           0           0           0           0           0           0

  Columns 8.201 through 8.210

           0           0           0           0           0           0           0           0           0           0

  Columns 8.211 through 8.220

           0           0           0        8214           0           0           0           0           0           0

  Columns 8.221 through 8.230

           0           0           0           0           0           0           0           0           0           0

  Columns 8.231 through 8.240

           0           0           0           0           0           0           0           0           0           0

  Columns 8.241 through 8.250

           0           0           0           0           0           0           0           0           0           0

  Columns 8.251 through 8.260

        8251           0           0           0           0           0           0           0           0           0

  Columns 8.261 through 8.270

           0           0           0           0           0           0           0           0           0           0

  Columns 8.271 through 8.280

           0           0           0           0           0           0           0           0           0           0

  Columns 8.281 through 8.290

           0           0           0           0           0           0           0        8288           0           0

  Columns 8.291 through 8.300

           0           0           0           0           0           0           0           0           0           0

  Columns 8.301 through 8.310

           0           0           0           0           0           0           0           0           0           0

  Columns 8.311 through 8.320

           0           0           0           0           0           0           0           0           0           0

  Columns 8.321 through 8.330

           0           0           0           0        8325           0           0           0           0           0

  Columns 8.331 through 8.340

           0           0           0           0           0           0           0           0           0           0

  Columns 8.341 through 8.350

           0           0           0           0           0           0           0           0           0           0

  Columns 8.351 through 8.360

           0           0           0           0           0           0           0           0           0           0

  Columns 8.361 through 8.370

           0        8362           0           0           0           0           0           0           0           0

  Columns 8.371 through 8.380

           0           0           0           0           0           0           0           0           0           0

  Columns 8.381 through 8.390

           0           0           0           0           0           0           0           0           0           0

  Columns 8.391 through 8.400

           0           0           0           0           0           0           0           0        8399           0

  Columns 8.401 through 8.410

           0           0           0           0           0           0           0           0           0           0

  Columns 8.411 through 8.420

           0           0           0           0           0           0           0           0           0           0

  Columns 8.421 through 8.430

           0           0           0           0           0           0           0           0           0           0

  Columns 8.431 through 8.440

           0           0           0           0           0        8436           0           0           0           0

  Columns 8.441 through 8.450

           0           0           0           0           0           0           0           0           0           0

  Columns 8.451 through 8.460

           0           0           0           0           0           0           0           0           0           0

  Columns 8.461 through 8.470

           0           0           0           0           0           0           0           0           0           0

  Columns 8.471 through 8.480

           0           0        8473           0           0           0           0           0           0           0

  Columns 8.481 through 8.490

           0           0           0           0           0           0           0           0           0           0

  Columns 8.491 through 8.500

           0           0           0           0           0           0           0           0           0           0

  Columns 8.501 through 8.510

           0           0           0           0           0           0           0           0           0        8510

  Columns 8.511 through 8.520

           0           0           0           0           0           0           0           0           0           0

  Columns 8.521 through 8.530

           0           0           0           0           0           0           0           0           0           0

  Columns 8.531 through 8.540

           0           0           0           0           0           0           0           0           0           0

  Columns 8.541 through 8.550

           0           0           0           0           0           0        8547           0           0           0

  Columns 8.551 through 8.560

           0           0           0           0           0           0           0           0           0           0

  Columns 8.561 through 8.570

           0           0           0           0           0           0           0           0           0           0

  Columns 8.571 through 8.580

           0           0           0           0           0           0           0           0           0           0

  Columns 8.581 through 8.590

           0           0           0        8584           0           0           0           0           0           0

  Columns 8.591 through 8.600

           0           0           0           0           0           0           0           0           0           0

  Columns 8.601 through 8.610

           0           0           0           0           0           0           0           0           0           0

  Columns 8.611 through 8.620

           0           0           0           0           0           0           0           0           0           0

  Columns 8.621 through 8.630

        8621           0           0           0           0           0           0           0           0           0

  Columns 8.631 through 8.640

           0           0           0           0           0           0           0           0           0           0

  Columns 8.641 through 8.650

           0           0           0           0           0           0           0           0           0           0

  Columns 8.651 through 8.660

           0           0           0           0           0           0           0        8658           0           0

  Columns 8.661 through 8.670

           0           0           0           0           0           0           0           0           0           0

  Columns 8.671 through 8.680

           0           0           0           0           0           0           0           0           0           0

  Columns 8.681 through 8.690

           0           0           0           0           0           0           0           0           0           0

  Columns 8.691 through 8.700

           0           0           0           0        8695           0           0           0           0           0

  Columns 8.701 through 8.710

           0           0           0           0           0           0           0           0           0           0

  Columns 8.711 through 8.720

           0           0           0           0           0           0           0           0           0           0

  Columns 8.721 through 8.730

           0           0           0           0           0           0           0           0           0           0

  Columns 8.731 through 8.740

           0        8732           0           0           0           0           0           0           0           0

  Columns 8.741 through 8.750

           0           0           0           0           0           0           0           0           0           0

  Columns 8.751 through 8.760

           0           0           0           0           0           0           0           0           0           0

  Columns 8.761 through 8.770

           0           0           0           0           0           0           0           0        8769           0

  Columns 8.771 through 8.780

           0           0           0           0           0           0           0           0           0           0

  Columns 8.781 through 8.790

           0           0           0           0           0           0           0           0           0           0

  Columns 8.791 through 8.800

           0           0           0           0           0           0           0           0           0           0

  Columns 8.801 through 8.810

           0           0           0           0           0        8806           0           0           0           0

  Columns 8.811 through 8.820

           0           0           0           0           0           0           0           0           0           0

  Columns 8.821 through 8.830

           0           0           0           0           0           0           0           0           0           0

  Columns 8.831 through 8.840

           0           0           0           0           0           0           0           0           0           0

  Columns 8.841 through 8.850

           0           0        8843           0           0           0           0           0           0           0

  Columns 8.851 through 8.860

           0           0           0           0           0           0           0           0           0           0

  Columns 8.861 through 8.870

           0           0           0           0           0           0           0           0           0           0

  Columns 8.871 through 8.880

           0           0           0           0           0           0           0           0           0        8880

  Columns 8.881 through 8.890

           0           0           0           0           0           0           0           0           0           0

  Columns 8.891 through 8.900

           0           0           0           0           0           0           0           0           0           0

  Columns 8.901 through 8.910

           0           0           0           0           0           0           0           0           0           0

  Columns 8.911 through 8.920

           0           0           0           0           0           0        8917           0           0           0

  Columns 8.921 through 8.930

           0           0           0           0           0           0           0           0           0           0

  Columns 8.931 through 8.940

           0           0           0           0           0           0           0           0           0           0

  Columns 8.941 through 8.950

           0           0           0           0           0           0           0           0           0           0

  Columns 8.951 through 8.960

           0           0           0        8954           0           0           0           0           0           0

  Columns 8.961 through 8.970

           0           0           0           0           0           0           0           0           0           0

  Columns 8.971 through 8.980

           0           0           0           0           0           0           0           0           0           0

  Columns 8.981 through 8.990

           0           0           0           0           0           0           0           0           0           0

  Columns 8.991 through 9.000

        8991           0           0           0           0           0           0           0           0           0

  Columns 9.001 through 9.010

           0           0           0           0           0           0           0           0           0           0

  Columns 9.011 through 9.020

           0           0           0           0           0           0           0           0           0           0

  Columns 9.021 through 9.030

           0           0           0           0           0           0           0        9028           0           0

  Columns 9.031 through 9.040

           0           0           0           0           0           0           0           0           0           0

  Columns 9.041 through 9.050

           0           0           0           0           0           0           0           0           0           0

  Columns 9.051 through 9.060

           0           0           0           0           0           0           0           0           0           0

  Columns 9.061 through 9.070

           0           0           0           0        9065           0           0           0           0           0

  Columns 9.071 through 9.080

           0           0           0           0           0           0           0           0           0           0

  Columns 9.081 through 9.090

           0           0           0           0           0           0           0           0           0           0

  Columns 9.091 through 9.100

           0           0           0           0           0           0           0           0           0           0

  Columns 9.101 through 9.110

           0        9102           0           0           0           0           0           0           0           0

  Columns 9.111 through 9.120

           0           0           0           0           0           0           0           0           0           0

  Columns 9.121 through 9.130

           0           0           0           0           0           0           0           0           0           0

  Columns 9.131 through 9.140

           0           0           0           0           0           0           0           0        9139           0

  Columns 9.141 through 9.150

           0           0           0           0           0           0           0           0           0           0

  Columns 9.151 through 9.160

           0           0           0           0           0           0           0           0           0           0

  Columns 9.161 through 9.170

           0           0           0           0           0           0           0           0           0           0

  Columns 9.171 through 9.180

           0           0           0           0           0        9176           0           0           0           0

  Columns 9.181 through 9.190

           0           0           0           0           0           0           0           0           0           0

  Columns 9.191 through 9.200

           0           0           0           0           0           0           0           0           0           0

  Columns 9.201 through 9.210

           0           0           0           0           0           0           0           0           0           0

  Columns 9.211 through 9.220

           0           0        9213           0           0           0           0           0           0           0

  Columns 9.221 through 9.230

           0           0           0           0           0           0           0           0           0           0

  Columns 9.231 through 9.240

           0           0           0           0           0           0           0           0           0           0

  Columns 9.241 through 9.250

           0           0           0           0           0           0           0           0           0        9250

  Columns 9.251 through 9.260

           0           0           0           0           0           0           0           0           0           0

  Columns 9.261 through 9.270

           0           0           0           0           0           0           0           0           0           0

  Columns 9.271 through 9.280

           0           0           0           0           0           0           0           0           0           0

  Columns 9.281 through 9.290

           0           0           0           0           0           0        9287           0           0           0

  Columns 9.291 through 9.300

           0           0           0           0           0           0           0           0           0           0

  Columns 9.301 through 9.310

           0           0           0           0           0           0           0           0           0           0

  Columns 9.311 through 9.320

           0           0           0           0           0           0           0           0           0           0

  Columns 9.321 through 9.330

           0           0           0        9324           0           0           0           0           0           0

  Columns 9.331 through 9.340

           0           0           0           0           0           0           0           0           0           0

  Columns 9.341 through 9.350

           0           0           0           0           0           0           0           0           0           0

  Columns 9.351 through 9.360

           0           0           0           0           0           0           0           0           0           0

  Columns 9.361 through 9.370

        9361           0           0           0           0           0           0           0           0           0

  Columns 9.371 through 9.380

           0           0           0           0           0           0           0           0           0           0

  Columns 9.381 through 9.390

           0           0           0           0           0           0           0           0           0           0

  Columns 9.391 through 9.400

           0           0           0           0           0           0           0        9398           0           0

  Columns 9.401 through 9.410

           0           0           0           0           0           0           0           0           0           0

  Columns 9.411 through 9.420

           0           0           0           0           0           0           0           0           0           0

  Columns 9.421 through 9.430

           0           0           0           0           0           0           0           0           0           0

  Columns 9.431 through 9.440

           0           0           0           0        9435           0           0           0           0           0

  Columns 9.441 through 9.450

           0           0           0           0           0           0           0           0           0           0

  Columns 9.451 through 9.460

           0           0           0           0           0           0           0           0           0           0

  Columns 9.461 through 9.470

           0           0           0           0           0           0           0           0           0           0

  Columns 9.471 through 9.480

           0        9472           0           0           0           0           0           0           0           0

  Columns 9.481 through 9.490

           0           0           0           0           0           0           0           0           0           0

  Columns 9.491 through 9.500

           0           0           0           0           0           0           0           0           0           0

  Columns 9.501 through 9.510

           0           0           0           0           0           0           0           0        9509           0

  Columns 9.511 through 9.520

           0           0           0           0           0           0           0           0           0           0

  Columns 9.521 through 9.530

           0           0           0           0           0           0           0           0           0           0

  Columns 9.531 through 9.540

           0           0           0           0           0           0           0           0           0           0

  Columns 9.541 through 9.550

           0           0           0           0           0        9546           0           0           0           0

  Columns 9.551 through 9.560

           0           0           0           0           0           0           0           0           0           0

  Columns 9.561 through 9.570

           0           0           0           0           0           0           0           0           0           0

  Columns 9.571 through 9.580

           0           0           0           0           0           0           0           0           0           0

  Columns 9.581 through 9.590

           0           0        9583           0           0           0           0           0           0           0

  Columns 9.591 through 9.600

           0           0           0           0           0           0           0           0           0           0

  Columns 9.601 through 9.610

           0           0           0           0           0           0           0           0           0           0

  Columns 9.611 through 9.620

           0           0           0           0           0           0           0           0           0        9620

  Columns 9.621 through 9.630

           0           0           0           0           0           0           0           0           0           0

  Columns 9.631 through 9.640

           0           0           0           0           0           0           0           0           0           0

  Columns 9.641 through 9.650

           0           0           0           0           0           0           0           0           0           0

  Columns 9.651 through 9.660

           0           0           0           0           0           0        9657           0           0           0

  Columns 9.661 through 9.670

           0           0           0           0           0           0           0           0           0           0

  Columns 9.671 through 9.680

           0           0           0           0           0           0           0           0           0           0

  Columns 9.681 through 9.690

           0           0           0           0           0           0           0           0           0           0

  Columns 9.691 through 9.700

           0           0           0        9694           0           0           0           0           0           0

  Columns 9.701 through 9.710

           0           0           0           0           0           0           0           0           0           0

  Columns 9.711 through 9.720

           0           0           0           0           0           0           0           0           0           0

  Columns 9.721 through 9.730

           0           0           0           0           0           0           0           0           0           0

  Columns 9.731 through 9.740

        9731           0           0           0           0           0           0           0           0           0

  Columns 9.741 through 9.750

           0           0           0           0           0           0           0           0           0           0

  Columns 9.751 through 9.760

           0           0           0           0           0           0           0           0           0           0

  Columns 9.761 through 9.770

           0           0           0           0           0           0           0        9768           0           0

  Columns 9.771 through 9.780

           0           0           0           0           0           0           0           0           0           0

  Columns 9.781 through 9.790

           0           0           0           0           0           0           0           0           0           0

  Columns 9.791 through 9.800

           0           0           0           0           0           0           0           0           0           0

  Columns 9.801 through 9.810

           0           0           0           0        9805           0           0           0           0           0

  Columns 9.811 through 9.820

           0           0           0           0           0           0           0           0           0           0

  Columns 9.821 through 9.830

           0           0           0           0           0           0           0           0           0           0

  Columns 9.831 through 9.840

           0           0           0           0           0           0           0           0           0           0

  Columns 9.841 through 9.850

           0        9842           0           0           0           0           0           0           0           0

  Columns 9.851 through 9.860

           0           0           0           0           0           0           0           0           0           0

  Columns 9.861 through 9.870

           0           0           0           0           0           0           0           0           0           0

  Columns 9.871 through 9.880

           0           0           0           0           0           0           0           0        9879           0

  Columns 9.881 through 9.890

           0           0           0           0           0           0           0           0           0           0

  Columns 9.891 through 9.900

           0           0           0           0           0           0           0           0           0           0

  Columns 9.901 through 9.910

           0           0           0           0           0           0           0           0           0           0

  Columns 9.911 through 9.920

           0           0           0           0           0        9916           0           0           0           0

  Columns 9.921 through 9.930

           0           0           0           0           0           0           0           0           0           0

  Columns 9.931 through 9.940

           0           0           0           0           0           0           0           0           0           0

  Columns 9.941 through 9.950

           0           0           0           0           0           0           0           0           0           0

  Columns 9.951 through 9.960

           0           0        9953           0           0           0           0           0           0           0

  Columns 9.961 through 9.970

           0           0           0           0           0           0           0           0           0           0

  Columns 9.971 through 9.980

           0           0           0           0           0           0           0           0           0           0

  Columns 9.981 through 9.990

           0           0           0           0           0           0           0           0           0        9990

  Columns 9.991 through 10.000

           0           0           0           0           0           0           0           0           0           0

res = [1:10000].*(mod([1:10000], 37) == 0);
doc nonzeros
d = res(res~=0)

d =

  Columns 1 through 10

          37          74         111         148         185         222         259         296         333         370

  Columns 11 through 20

         407         444         481         518         555         592         629         666         703         740

  Columns 21 through 30

         777         814         851         888         925         962         999        1036        1073        1110

  Columns 31 through 40

        1147        1184        1221        1258        1295        1332        1369        1406        1443        1480

  Columns 41 through 50

        1517        1554        1591        1628        1665        1702        1739        1776        1813        1850

  Columns 51 through 60

        1887        1924        1961        1998        2035        2072        2109        2146        2183        2220

  Columns 61 through 70

        2257        2294        2331        2368        2405        2442        2479        2516        2553        2590

  Columns 71 through 80

        2627        2664        2701        2738        2775        2812        2849        2886        2923        2960

  Columns 81 through 90

        2997        3034        3071        3108        3145        3182        3219        3256        3293        3330

  Columns 91 through 100

        3367        3404        3441        3478        3515        3552        3589        3626        3663        3700

  Columns 101 through 110

        3737        3774        3811        3848        3885        3922        3959        3996        4033        4070

  Columns 111 through 120

        4107        4144        4181        4218        4255        4292        4329        4366        4403        4440

  Columns 121 through 130

        4477        4514        4551        4588        4625        4662        4699        4736        4773        4810

  Columns 131 through 140

        4847        4884        4921        4958        4995        5032        5069        5106        5143        5180

  Columns 141 through 150

        5217        5254        5291        5328        5365        5402        5439        5476        5513        5550

  Columns 151 through 160

        5587        5624        5661        5698        5735        5772        5809        5846        5883        5920

  Columns 161 through 170

        5957        5994        6031        6068        6105        6142        6179        6216        6253        6290

  Columns 171 through 180

        6327        6364        6401        6438        6475        6512        6549        6586        6623        6660

  Columns 181 through 190

        6697        6734        6771        6808        6845        6882        6919        6956        6993        7030

  Columns 191 through 200

        7067        7104        7141        7178        7215        7252        7289        7326        7363        7400

  Columns 201 through 210

        7437        7474        7511        7548        7585        7622        7659        7696        7733        7770

  Columns 211 through 220

        7807        7844        7881        7918        7955        7992        8029        8066        8103        8140

  Columns 221 through 230

        8177        8214        8251        8288        8325        8362        8399        8436        8473        8510

  Columns 231 through 240

        8547        8584        8621        8658        8695        8732        8769        8806        8843        8880

  Columns 241 through 250

        8917        8954        8991        9028        9065        9102        9139        9176        9213        9250

  Columns 251 through 260

        9287        9324        9361        9398        9435        9472        9509        9546        9583        9620

  Columns 261 through 270

        9657        9694        9731        9768        9805        9842        9879        9916        9953        9990

clear
res = [1:10000].*(mod([1:10000], 37) == 0);
res = res(res ~= 0);
for i = 1:10000
re2 = []

re2 =

     []

for i=1:10000
if mod(i,37)==0
re2 = [re2, i];
end
end
%4.d
clearf
{Unrecognized function or variable 'clearf'.
} 
clear
clc
s = [1,1]

s =

     1     1

for i=1:1000
s = [s, s(end-1)+s(end)];
end
s

s =

  1.0e+209 *

  Columns 1 through 13

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 14 through 26

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 27 through 39

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 40 through 52

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 53 through 65

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 66 through 78

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 79 through 91

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 92 through 104

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 105 through 117

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 118 through 130

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 131 through 143

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 144 through 156

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 157 through 169

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 170 through 182

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 183 through 195

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 196 through 208

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 209 through 221

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 222 through 234

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 235 through 247

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 248 through 260

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 261 through 273

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 274 through 286

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 287 through 299

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 300 through 312

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 313 through 325

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 326 through 338

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 339 through 351

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 352 through 364

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 365 through 377

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 378 through 390

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 391 through 403

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 404 through 416

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 417 through 429

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 430 through 442

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 443 through 455

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 456 through 468

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 469 through 481

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 482 through 494

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 495 through 507

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 508 through 520

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 521 through 533

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 534 through 546

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 547 through 559

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 560 through 572

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 573 through 585

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 586 through 598

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 599 through 611

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 612 through 624

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 625 through 637

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 638 through 650

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 651 through 663

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 664 through 676

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 677 through 689

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 690 through 702

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 703 through 715

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 716 through 728

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 729 through 741

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 742 through 754

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 755 through 767

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 768 through 780

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 781 through 793

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 794 through 806

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 807 through 819

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 820 through 832

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 833 through 845

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 846 through 858

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 859 through 871

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 872 through 884

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 885 through 897

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 898 through 910

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 911 through 923

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 924 through 936

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 937 through 949

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 950 through 962

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 963 through 975

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000

  Columns 976 through 988

    0.0000    0.0000    0.0000    0.0000    0.0000    0.0000    0.0001    0.0001    0.0002    0.0003    0.0005    0.0008    0.0013

  Columns 989 through 1.001

    0.0022    0.0035    0.0057    0.0093    0.0150    0.0242    0.0392    0.0634    0.1026    0.1660    0.2686    0.4347    0.7033

  Column 1.002

    1.1380

s (3)

ans =

     2

s(5)

ans =

     5

s(7)

ans =

    13

phi = (1+sqrt(5))/2;
t = phi*ones(1,1002);
x = [1:1002];
plot(x,s,x,t)
s2 = s(1, 2:end);
s1 = s(1, 1:end-1);
sf = s2./s1;
t = phi*ones(1,1001);
x = [1:1001];
plot(x, sf, 'b', x, t, 'g')
plot(x, sf, 'b', x, t, 'g:')
plot(x, sf, 'r', x, t, 'g:')
%5
clear
clc
m, n = 4 ,5
{Unrecognized function or variable 'm'.
} 
m = 5

m =

     5

n = 4;
A = rand(m,n) < 0.5;
spy(A)
Ab = [A zeros(m,1)]

Ab =

     1     0     1     1     0
     0     0     0     0     0
     0     1     0     0     0
     0     0     0     0     0
     1     1     0     0     0

Ab=[Ab; zeros(1,n+1)]

Ab =

     1     0     1     1     0
     0     0     0     0     0
     0     1     0     0     0
     0     0     0     0     0
     1     1     0     0     0
     0     0     0     0     0

figure, pcolor(ab), set(gca, 'YDir', 'reverse')
{Unrecognized function or variable 'ab'.
} 
figure, pcolor(Ab), set(gca, 'YDir', 'reverse')
clear
n = 10

n =

    10

m = 20;
A = rand(n,m) < 0.5;
A_covered = [zeros(n, 1), A, zeros(n, 1)]

A_covered =

  Columns 1 through 21

     0     0     0     1     0     0     1     0     0     1     0     1     0     1     1     0     0     1     0     0     1
     0     1     1     0     1     1     1     0     1     0     0     1     0     1     0     0     0     0     0     0     1
     0     0     0     0     0     1     0     1     1     0     1     1     0     1     1     0     0     0     0     0     1
     0     1     1     0     1     1     1     0     1     0     1     0     1     1     1     1     1     1     0     0     1
     0     0     1     1     0     0     1     1     1     1     1     1     0     1     0     1     0     0     0     1     1
     0     1     1     0     1     1     0     1     0     1     0     0     0     1     1     1     1     0     1     1     0
     0     1     0     0     0     0     0     0     1     1     1     1     1     0     1     0     0     1     0     1     1
     0     1     0     1     0     1     0     0     0     0     0     1     0     0     1     1     1     1     0     1     1
     0     1     1     1     0     0     0     0     1     1     0     1     1     1     1     1     0     1     1     0     0
     0     0     1     1     0     1     1     1     0     0     0     1     1     1     1     1     1     1     0     1     0

  Column 22

     0
     0
     0
     0
     0
     0
     0
     0
     0
     0

A_covered = [zeros(1, m); zeros(n, 1), A, zeros(n, 1); zeros(1,m)]
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('vertcat')" style="font-weight:bold">vertcat</a>
Dimensions of arrays being concatenated are not consistent.
} 
A_covered = [zeros(1, m+2); zeros(n, 1), A, zeros(n, 1); zeros(1,m+2)]

A_covered =

  Columns 1 through 21

     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
     0     0     0     1     0     0     1     0     0     1     0     1     0     1     1     0     0     1     0     0     1
     0     1     1     0     1     1     1     0     1     0     0     1     0     1     0     0     0     0     0     0     1
     0     0     0     0     0     1     0     1     1     0     1     1     0     1     1     0     0     0     0     0     1
     0     1     1     0     1     1     1     0     1     0     1     0     1     1     1     1     1     1     0     0     1
     0     0     1     1     0     0     1     1     1     1     1     1     0     1     0     1     0     0     0     1     1
     0     1     1     0     1     1     0     1     0     1     0     0     0     1     1     1     1     0     1     1     0
     0     1     0     0     0     0     0     0     1     1     1     1     1     0     1     0     0     1     0     1     1
     0     1     0     1     0     1     0     0     0     0     0     1     0     0     1     1     1     1     0     1     1
     0     1     1     1     0     0     0     0     1     1     0     1     1     1     1     1     0     1     1     0     0
     0     0     1     1     0     1     1     1     0     0     0     1     1     1     1     1     1     1     0     1     0
     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0

  Column 22

     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0
     0

clear
bugs.m
{Unable to resolve the name bugs.m.
} 
bugs
{Index in position 2 exceeds array bounds. Index must not exceed 3.

Error in <a href="matlab:matlab.internal.language.introspective.errorDocCallback('bugs', 'C:\Users\Peron\Desktop\University\NumericalAnalysis1\lab2\exercise\bugs.m', 15)" style="font-weight:bold">bugs</a> (<a href="matlab: opentoline('C:\Users\Peron\Desktop\University\NumericalAnalysis1\lab2\exercise\bugs.m',15,0)">line 15</a>)
        R(i-1,j-1) = T(i-1,j) + T(i,j-1) + T(i,j+1) + T(i+1,j);
} 
bugs
Ab = [A zeros(m,1)]
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('horzcat')" style="font-weight:bold">horzcat</a>
Dimensions of arrays being concatenated are not consistent.
} 
spy(a)
{Unrecognized function or variable 'a'.
} 
spy(A)
hold on
spy(R)
clear
bugs

media =

    3.8919

bugs

media =

    3.1429

spy(a)
{Unrecognized function or variable 'a'.
} 
spy(A)
Ab = [A zeros(m,1)]
{Error using <a href="matlab:matlab.internal.language.introspective.errorDocCallback('horzcat')" style="font-weight:bold">horzcat</a>
Dimensions of arrays being concatenated are not consistent.
} 
Ab = [A zeros(n,1)]

Ab =

     0     1     1     0
     0     1     0     0
     1     0     0     0
     0     1     1     0
     0     1     0     0

Ab=[Ab; zeros(1,m+1)]

Ab =

     0     1     1     0
     0     1     0     0
     1     0     0     0
     0     1     1     0
     0     1     0     0
     0     0     0     0

figure, pcolor(ab), set(gca, 'YDir', 'reverse')
{Unrecognized function or variable 'ab'.
} 
figure, pcolor(Ab), set(gca, 'YDir', 'reverse')
bugs

media =

    1.5000

Ab = [A zeros(n,1)]

Ab =

     0     1     0     0
     1     0     1     0
     1     1     0     0
     1     1     1     0
     0     0     0     0

Ab=[Ab; zeros(1,m+1)]

Ab =

     0     1     0     0
     1     0     1     0
     1     1     0     0
     1     1     1     0
     0     0     0     0
     0     0     0     0

figure, pcolor(Ab), set(gca, 'YDir', 'reverse')
