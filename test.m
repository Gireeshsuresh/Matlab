k12=[];
x=randi([1,5],1,10);
for k=1:1:10
    
    k12=cat(2,k12,k);
    k1=mod(k,2);
    if (k1)==0
        op=['K value is even #',num2str(k)];    
        disp(op)
    elseif (k1)~=0
        disp('K is odd')
    end
end
plot(x,k12);

