function [m_vec,k_vec,p]=findSystemSizes_func(Nmax,TOL,mMax)
i=1;%the count of the element in m_vec and k_vec
for m=2:mMax
    [A,b]=someMatrixAndVector_func(m);%Obtain the A and b
    n=m^3;%get the n
    x0=ones(n,1);
    x_mat=jacobi_func(A,b,x0,Nmax);%using the jacobi method to get the set of x(k).
    x=3*ones(n,1);
    for k=1:Nmax
        v=x-x_mat(:,k);%get the vector which is x-x(k)
        if norm(v,2)<=TOL
            m_vec(i)=m;
            k_vec(i)=k-1;
            i=i+1;
            break
        end
    end
end
n_vec=m_vec.^3;%get the set of n
fun=inline('a(1)*x.^a(2)','a','x');%Construct a function in the form of a(1)*x.^a(2)
P=lsqcurvefit(fun,[1,1],n_vec,k_vec);%fit the n_vec and k_vec in the form of a(1)*x.^a(2) and the initial value of a(1) and a(2) are 1.
p=P(2);
%I could have used the method which is let y=log(k_vec) and
%x=log(n_vec).Because k=C*n^p,so log(k)=p*log(n)+log(C).Here we just need
%to fit x and y and then figure out the slope which is p here. However this
%approach reduces accuracy, especially when the data is small. So I search
%online and find the function in matlab called inline and lsqcurvefit to
%increase the accuracy of the result.
p=vpa(p,2);%estimate p with 2 significant figures.
end
