a=[22,28,-22;1,-2,-19;19,-2,-1;-6,12,6];
b=[-1,2,2;
    2,-1,2;
    2,2,-1];
c=[1,-3,3;3,-5,3;6,-6,4];

ata=a'*a;
%disp(ata);

%eig_val=eig(ata);
p=[-2,-1,-1;
    1,0,-1;
    1,1,-1];
[eig_vector, eig_value]=eig(b);  
c1=inv(p);
dig=c1*b*p
ata1=ata./504;
%k=adjoint(p)
k1=det(p);
%eig_value=eig(ata1);

[eig_vector,eig_value]=eig(ata1);