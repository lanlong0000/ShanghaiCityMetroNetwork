function q=enqueue(q,v)
%����к�����q=[0,0]˵��Ϊ�ն���
%��v���뵽����q��.
%Input:q:n*2���󣬺���n��Ԫ�أ�[s1,t1;s2,t2;...;sn,tn]
%      v:1*2�����¼����Ԫ��
%Output:q:(n+1)*2����,[s1,t1;s2,t2;...;sn,tn;v]
%Writed by rong zhihai on 04/02/06

%test
%q=[0,0];
%v=[1,2];

%[m,n]=size(find(q(1:end,1))>0);
[m,n]=size(q);

if q(1,:)==[0,0]%�ն���
    q(1,:)=v(1,:);
else
    q(m+1,:)=v(1,:);
end

return;