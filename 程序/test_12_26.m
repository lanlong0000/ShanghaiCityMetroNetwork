%�Ϻ��������˽�ģ������main����
clear
close

fname='sh1';
Weight_Matrix=load([fname,'.txt']);

Row=zeros(length(Weight_Matrix(:,1))*2,1);
Row(1:end)=[Weight_Matrix(:,1);Weight_Matrix(:,2)];
Col=zeros(length(Weight_Matrix(:,1))*2,1);
Col(1:end)=[Weight_Matrix(:,2);Weight_Matrix(:,1)];
Weight=ones(length(Weight_Matrix(:,1))*2,1);

Topology_Nodes=spconvert([Row,Col,Weight]);

[Vertex_Component,Component_num]=IS_Connection(Topology_Nodes);%����ͨ�鼰��ͨ���� 
Comp_num=get_component_num(Vertex_Component,Component_num);
Select_ID=[1:76];


Shrink_Nodes=Shrink_Matrix(Topology_Nodes,Select_ID);

[Vertex_Component,Component_num]=IS_Connection(Shrink_Nodes);
Comp_num=get_component_num(Vertex_Component,Component_num);
Select_ID(Vertex_Component==2);

[E,L,D]=get_graph_efficiency_L(Shrink_Nodes);

[Distance,Predecessor,EdgeBC,VertexBC]=Get_Graph_BC(Shrink_Nodes);
[BC_Val,BC_ID]=sort(VertexBC);

N=length(Shrink_Nodes)%�ڵ���
L%ƽ��·������Vertex_Component
D%ֱ��

%max(max(Distance))
[a,b]=find(Distance==max(max(Distance)))
[Select_ID(a),Select_ID(b)]%ֱ���Ķ˵���

Comp_num
Select_ID(find(Vertex_Component==2))

Select_ID(BC_ID(end-2:end))
BC_Val(end-2:end)%BCֵǰ����վ��

%[E,L,D,Vertex_IC,Vertex_OP]=get_vertex_OP_IC(Shrink_Nodes,3);
%[IC_Val,IC_ID]=sort(Vertex_IC);

%Select_ID(IC_ID(end-2:end))
%IC_Val(end-2:end)

Degree=full(sum(Shrink_Nodes(1:end,:)));
[Degree_Val,Degree_ID]=sort(Degree);
Select_ID(Degree_ID(end-2:end))
Degree_Val(end-2:end)%��ǰ����վ��

figure
hold on
plot(Degree,VertexBC,'ro')
xlabel('degree')
ylabel('BC')

%������ȷֲ�
%Dg=zeros(8,1);
%for i=1:8
%   for j=1:299
%        if Degree_Val(j)==i 
%            Dg(i)=Dg(i)+1;
%        end
%    end
%end
%Dg=Dg./299;
%t=1:1:8;
%plot(t,Dg,'ro')


[cc,Node_CC,triangles]=get_clustering_coefficient_fast(Shrink_Nodes);
cc%����ľ���ϵ��
triangles%�����е�������

Write_Matrix(Shrink_Nodes,[fname,'_test'])