%This function is used to find the opyimal value of parameter c in
%fixed-point iteration such that the root can be found in the least amount
%of iteration.
function [c_opt,N_opt]=optParamFPiter_func(f,p0,p,TOL,Nmax )
c=[0.001:0.001:1];% put all of the c in a set with a order
N(1:length(c))=Nmax;% At the and of all iteration, the amount of iteration of those that the absolute value of the error does not reach the TOL is Nmax
for i=1:length(c)
    g=@(x)x-c(i).*f(x);
    for n=1:Nmax
        if n==1
            p_x(n)=g(p0);
        else
            p_x(n)=g(p_x(n-1));
        end
        if abs(p_x(n)-p)<TOL;
            N(i)=n;% If the error reaches the TOL at (n)th iteration, then the amount of the iteration is n.
            break
        end
    end
end
N_opt=min(N);%The iteration number should be the minimun if c is optimal
N_pos=find(N==N_opt);%To find the positon of the minimun of the iteration numbers in the set N
c_opt=c(N_pos);%According to the position of the minimun of the iteration numbers in the set N, the optimal c can be found in the set c
