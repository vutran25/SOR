n = 3;
A = [ 4 -1  0;
     -1  4 -1;
      0 -1  4];
B = [-1;
      4;
     -5];
XO = [0;
      0;
      0];
X = [0;
     0;
     0];
TOL = 1e-5;
N = 25;
W = 1.0333;

k = 1;
while k <= N
    for i = 1:n
        sum1 = 0;
        sum2 = 0;
        for j = 1:i-1
            sum1 = sum1 + A(i,j)* X(j);
        end
        for j = i+1:n
            sum2 = sum2 + A(i,j)* XO(j);
        end
        X(i) = (1-W)*XO(i) + (W/A(i,i))*(B(i) - sum1 - sum2);
    end
    C = abs(X- XO);
    max = 0;
    for i = 1:n
        if abs(C(i)) > max
            max = abs(C(i));
        end
    end
    if(max < TOL)
        X
        A*X
        B
        return
    end
    k = k + 1;
    XO = X;
end
OUTPUT