function [q,d]=enqueue_s_bc(s,q,d,row,col)
%��ͼrow-col���붥��s�����ı߷������q,����v_in_q�б�ʾ
%ע������е�����!

s_t=find(col>=s & col<s+1);
[s_t_m,s_t_n]=size(s_t);
for i=1:s_t_m
    if d(row(s_t(i)))<0
        q=enqueue(q,[s,row(s_t(i))]);
        d(row(s_t(i)))=d(s)+1;
    elseif d(row(s_t(i))) == d(s)+1
        q=enqueue(q,[s,row(s_t(i))]);
    end
end

return;