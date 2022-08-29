function interp=polyInterpolation(a,b,p,xhat,f)
%POLYINTERPOLATION    Polynomial Interpolant obtained by Lagrange Interpolating Polynomials
%   interp=polyInterpolation(a,b,p,xhat,f) performs the pth order
%   polynomial interpolant of a function f is obtained given the
%   input:[a,b] is the interval of nodal points xi
%          p is the max index of nodal points xi  where i  is [0:p]
%          xhat is the set of evaluation points
%          f is the function to be interpolated
%   output:interp is the pth order polynomial interpolant of f
x=linspace(a,b,p+1);%get the set of nodal points
n=length(xhat);%get the number of xhat
[L,errorFlag]=lagrangePoly(p,x,n,xhat);%call lagrangePoly to get L
interp=f(x)*L;%get the interpolation
end

