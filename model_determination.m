% rdemo1:20141202:model_determination.m:exercise 8.2 of homework 11
% usage: determines the best polynomial fit given a set of (x,y) data

%% a

x=[1.0000,2.0000,3.0000,4.0000,5.0000,6.0000,7.0000,8.0000]';
y=[3.1400,3.1600,4.0600,5.8400,8.5000,12.0400,16.4600,21.7600]';

for k=1:4
    p{k}=polyfit(x,y,k);
    yfit{k} = polyval(p{k},x);
    yresid{k} = y - yfit{k};
    n_resid{k}=norm(yresid{k});
    SSresid{k} = sum(yresid{k}.^2);
    SStotal = (length(y)-1)*var(y);
    rsq(k) = 1 - SSresid{k}/SStotal;
end

hold on
scatter(x,y,'k')
plot(fit(x,y,'poly1', 'Normalize', 'on' ),'b')
plot(fit(x,y,'poly2', 'Normalize', 'on' ),'g')
plot(fit(x,y,'poly3', 'Normalize', 'on' ),'r--')
plot(fit(x,y,'poly4', 'Normalize', 'on' ),'m--')
xlabel('x')
ylabel('y')
legend('Data','PolyFit Degree 1','PolyFit Degree 2','PolyFit Degree 3','PolyFit Degree 4','Location','SouthEast')
title('Data with Polynomial Fits Up to Degree 4')
hold off

%% b
format shortEng;
labels={'PolyDegree','Resid_Norm','Resid_Var','R_Sq'};

degree=1:4;
n_resids=cell2mat(n_resid);
var_yresids=[var(yresid{1}),var(yresid{2}),var(yresid{3}),var(yresid{4})];
cell_output={degree',n_resids',var_yresids',rsq'};
mat_output=cell2mat(cell_output);
disp(labels)
disp(mat_output)

%% c
[best_fit, index] = max(rsq);
str1 = ['The best fit polynomial is of degree ',num2str(index)];
disp(str1)