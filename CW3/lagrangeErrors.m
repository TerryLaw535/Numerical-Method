function E=lagrangeErrors(a,b,P,f)
%From the result of (a), we find that the lagrange interpolation error
%decreases when the  polynomial degree grows up. That is because according to  
%the inequation,max|p_p(x)-f(x)|<=(2^(p+1)*e^2)/(p+1)!
%By analysing,(2^(p+1)/(p+1)!)*e^2 tends to 0 as p tends to infinite, therefore, 
%error also tend to 0 as p tends to infinite.
%However from the result of (b),we find that there is oscillation around 
%the nodal points. In this case,the error does not decrease as the degree
%increases.Because in this function, as the degree of polynomial increases,
%the error could tend to infinitely large.That is the reason of oscillation.
xhat=linspace(a,b,2000);%get the evaluation points xhat
for j=1:length(P)
    interp=polyInterpolation(a,b,P(j),xhat,f);%make use of polyInterpolation to get the correspond order polynomial interpolant of function f
    E(j)=max(abs(interp-f(xhat)));%get the errors
end
figure
semilogy(P,E,'--ok','MarkerFaceColor','r');
xlabel('Polynomial Degree Pj');
ylabel('Error Ej');
legend('Lagrange Errors');%add appropriate labels and legends
end

