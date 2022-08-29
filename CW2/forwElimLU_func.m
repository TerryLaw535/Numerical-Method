function [L,U]=forwElimLU_func(A)
%FORWELIMLU_FUNC   LU Factorisation (general form provided in theorem 6.19)
%  [L,U]=forwElimLU_func(A)
%  computes the final echelon form (an upper triangular matrix)
%  and the corresponding lower-triangular matrix
%  obtianed by forward elimination (without row exchanges and the elimination must stop when abs(aii)<1e-8)
%  applied to an n*n matrix A

n=size(A,1);%get the size of the n*n matrix
B=eye(n,n);%The initial state of the L matrix
for i=1:n-1
    if abs(A(i,i))<1e-8%if abs(A(i,i)) is very close to 0 then  break the for loop
        break
    else
        for j=i+1:n
            mij=A(j,i)/A(i,i);%Compute multiplier
            B(j,i)=mij;
            A(j,i)=0;
            for k=i+1:n
                A(j,k)=A(j,k)-mij*A(i,k);%Replace Ej by Ej-mij*Ei
            end
        end
    end
end
U=A;
L=B;
end