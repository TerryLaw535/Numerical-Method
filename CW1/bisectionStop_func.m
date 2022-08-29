%This function is used to find the root of the function f by Bisection method
function p_vec = bisectionStop_func (f ,a ,b , Nmax , TOL )

for n=1:Nmax
    p=(a+b)/2;
    if f(p)*f(a)>0
        a=p;
        p_x(n)=p;
    else
        b=p;
        p_x(n)=p;
    end
    if n>=2
        if abs(p_x(n)-p_x(n-1))<TOL  
          break % when the abs(p(n)-p(n-1)<TOL,stop the for loop
        end
    end
end
p_vec=p_x';%transfer the row vector to column vector
end
