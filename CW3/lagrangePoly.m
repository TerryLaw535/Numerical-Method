function [L,errorFlag]=lagrangePoly(p,x,n,xhat)
%LAGRANGEPOLY   Lagrange Interpolating Polynomials
%   [L,errorLlag]=LAGRANGEPOLY(p,x,n,xthat) performs
%   the Lagrange Interpolating Polynomials to obtain
%   a (p+1)*n matrix called L and a check errorFlag 
%   which is used to nake sure  that nadal points xi 
%   are distinct.
%   where p is the max index of nodal points xi and i is [0:p]
%         x is the set of nodal points
%         n is the number of the evaluation points(xhat)
%         xhat is the set of evaluation points
%   Output: L is a (p+1)*n matrix where the ijth entry of the matrix is
%           L_i-1(xhat) here L_i is the lagrange interpolating polynomials given
%           p+1 distinct points x_i
%           errorFlag is used to check whether the nodal points x_i are
%           distinct. If the points are distinct,then errorFlag=0,
%           otherwise errorFlag=0.(Here the tolerant error is 10^(-8))
errorFlag=0;%set the initial errorFlag
for i=1:p+1
    for j=1:n
        y=[x(1:i-1),x(i+1:p+1)];%make a set that not include x(i)
        for k=1:p
            if abs(y(k)-x(i))<=1.0e-8;
                errorFlag=1;%If nodal points are not different then errorFlag=1 and the tolerant error here is 10^(-8).
            end
        end
        L(i,j)=prod(xhat(j)-y)/prod(x(i)-y);%apply the Lagrange interpolating polynomials
    end 
end
end

    
    
    
    
    
    
    

