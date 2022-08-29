%The function is used to find the root of the function f by Fixed_point
%iteration
function p_vec = fpiter_func (f ,c , p0 , Nmax )
g=@(x)x-c.*f(x);%define the function g(x)
for n=1:Nmax
    if n==1
        p(n)=g(p0);        
    else
        p(n)=g(p(n-1));
    end
end
p_vec=p';%transfer the row vector to column vector
end

   
