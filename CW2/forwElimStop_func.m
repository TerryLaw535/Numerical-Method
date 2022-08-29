function B=forwElimStop_func(A,r,s)
%FORWELIMSTOP_FUNC   Forward Elimination Method
%  B=forwElimStop_func(A,r,s)
%   computes the new matrix B (in echelon form)
%   obtained by the forward elimination mathod
%   applied to an augmented matrix A,
%   using the number of forward elimination rounds to be completed r
%   and the number of row replacements to be done in the last round.

n=size(A,1);% Get the number of rows
for i=1:r+1% if s!=0, then the elimination will stop in (r+1)th round
    if i<=r% because r elimination rounds will be completed, the first r elimination rounds will run normally 
        for j=i+1:n
            mij=A(j,i)/A(i,i);% Compute multiplier
            A(j,i)=0;
            for k=i+1:n+1
                A(j,k)=A(j,k)-mij*A(i,k);% Replace Ej by Ej-mij*Ei
            end
        end
    else
        for j=i+1:i+s %in the last round((r+1)th round), s row  replacements to be done.
                      %if s=0(i+1>i+s), the for loop will not run.
            mij=A(j,i)/A(i,i);
            A(j,i)=0;
            for k=i+1:n+1
                A(j,k)=A(j,k)-mij*A(i,k);
            end
        end
    end
end
B=A;
end
        
        
