function B = forwElimPP_func(A)
%FORWELIMPP_FUNC   Forward Elimination with the Partial Pivoting Strategy
%  B=forwElimPP_func(A)
%   computes the new matrix B (in echelon form)
%   obtained by forward elimination with the partial pivoting strategy
%   applied to an augmented matrix A.

n=size(A,1);%Get the number of rows
for i=1:n-1
    C=find(abs(A(i:n,i))==max(abs(A(i:n,i))));
    p=C(1)+i-1;% Find smallest p(i<=p<=n),such that abs(A(p,i))=max(A(j,i)),here i<=j<=n
    A([i,p],:)=A([p,i],:);%swap Ei and Ep(The step above is parial pivoting)
    for j=i+1:n
        mij=A(j,i)/A(i,i);%Compute multiplier
        A(j,i)=0;
        for k=i+1:n+1
            A(j,k)=A(j,k)-mij*A(i,k);% Replace Ej by Ej-mij*Ei
        end
    end
end
B=A;;
end
    
       