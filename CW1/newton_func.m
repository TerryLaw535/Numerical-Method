% The function is used to find the root of the function f by Newton's
% method
function p_vec = newton_func(f,dfdx,p0,Nmax )
for n=1:Nmax
    if n==1
        p(n)=p0-f(p0)/dfdx(p0);
    else
        p(n)=p(n-1)-f(p(n-1))/dfdx(p(n-1));
    end
end
p_vec=p';%transfer the row vector to column vector
end
