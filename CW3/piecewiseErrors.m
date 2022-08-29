function E=piecewiseErrors(a,b,P,N,f)
%For the result of (a),the piecewise errors almost all decease when the
%polynomial degree grows up. The piecewise errors also decrease as the width h
%decreses in the same degree. Because from the lecture note
%max(abs(piecewiseerror))<=max(abs(f"(k))*h^2/8(since error become smaller as p becomes higher),
%here 'k' is in [a,b].So as h tends to 0,then the piecewise error also tends to 0.
%The conclusion from the result of (b) is almost same.Although
%there is still some small oscillation in some points, the piecewise errors
%decrease almost as the degree increases.In the same degree, the relationship 
%between the width h and the error is very similar to (a), which is the smaller 
%the width h the smaller the piecewise error.
%Hence,campared with the result in Q3, we can conclude that if we want to eliminate the
%oscillation of Q3(b), we could use the piecewise interpolation.
h=(b-a)./N;%Get the set of h
xhat=linspace(a,b,2000);%Evaluate the error for 2000 equally spaced points over [a,b]
figure
for l=1:length(P);
    for m=1:length(N);
        p_interp = piecewiseInterpolation(a,b,P(l),N(m),xhat,f);%Use the piecewiseInterpolation to get the piecewise interpolant 
        E(m,l)=max(abs(p_interp-f(xhat)));
    end
    loglog(h,E(:,l),'-o','DisplayName',['Polynomial Degree ',num2str(P(l))]);
    hold on;
end
hold off;
legend;
xlabel('Width of interval h');
ylabel('Piecewise Error E');%Add appropriate labels and legends
end
  