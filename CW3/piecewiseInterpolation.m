function p_interp = piecewiseInterpolation(a,b,p,n,xhat,f)
%PIECEWISEINTERPOLATION  Piecewise Polynomial Interpolation
%   p_interp=PIECEWISEINTERPOLATION(a,b,p,n,xhat) performs
%   how to get Piecewise Polynomial Interpolation of the function f in
%   interval [a,b]
%   input: [a,b] is the given interval to compute the piecewise polynomial
%                interpolant
%          p is the order polynomial interpolant
%          n is the number of uniformly paced subintervals of width h.
%          xhat is the evaluation (in the interval [a,b])
%          f is the function which the interpolant get from
%   output: p_interp is the set which hold the interpolant values
x=linspace(a,b,n+1);%to get n uniformly spaced subintervals
for i=1:length(xhat)
    for j=1:n
        if xhat(i)>=x(j)&&xhat(i)<=x(j+1)
            p_interp(i)=polyInterpolation(x(j),x(j+1),p,xhat(i),f);%make use of polyInterpolation to get interpolation in each subinterval 
        end
    end
end
end
