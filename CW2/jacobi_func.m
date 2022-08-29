function x_mat=jacobi_func(A,b,x0,Nmax)
%JACOBI_FUNC    Jacobi's Method
%  x_mat=jacobi_func(A,b,x0,Nmax)
%   computes the matrix x_mat that stores all approximation vector x(k)
%    obtained by jacobi's method
%    applied to an n*n matrix A,
%    and an n*1 vector b,
%    using Nmax iterations,
%    and initial guess x0.

L=-tril(A,-1);
U=-triu(A,1);
D=diag(diag(A));% get the L,U and D
x=x0;%the first column of x_mat should be x0
D_inv=inv(D);
for k=1:Nmax
    x(:,k+1)=D_inv*(L+U)*x(:,k)+D_inv*b;%using the jacobi method
end
x_mat=x;%output the x_mat
end
