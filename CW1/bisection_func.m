function p_vec = bisection_func(f,a,b,Nmax)
%BISECTION_FUNC   Bisection Method 
%   p_vec = BISECTION_FUNC(f,a,b,Nmax)
%    computes the vector of approximations p_vec
%    obtained by the bisection method
%    applied to function f, 
%    using Nmax iterations,
%    and interval [a,b].


% Write your code here
for n=1:Nmax
    %bisect
    p=(a+b)/2;
    if f(p)*f(a)>0
        a=p;
        p_x(n)=p;
    else
        b=p;
        p_x(n)=p;
    end
end
p_vec=p_x'%transfer the row vector to column vector
end

    
