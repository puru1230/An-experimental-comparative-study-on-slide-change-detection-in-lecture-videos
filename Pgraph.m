function Pgraph(Parent1, xvector1, ymatrix1)
%CREATEAXES(PARENT1, XVECTOR1, YMATRIX1)
%  PARENT1:  axes parent
%  XVECTOR1:  bar xvector
%  YMATRIX1:  bar matrix data

%  Auto-generated by MATLAB on 31-Aug-2017 17:47:06

% Create axes
axes1 = axes('Parent',Parent1,'YTick',[0 20 40 60 80 100],'XTick',[1 2],...
    'FontWeight','bold',...
    'FontSize',16);
box(axes1,'on');
hold(axes1,'on');

% Create multiple lines using matrix input to bar
bar1 = bar(xvector1,ymatrix1,'Parent',axes1);
set(bar1(5),'DisplayName','CH');
set(bar1(4),'DisplayName','GPD');
set(bar1(3),'DisplayName','CC');
set(bar1(2),'DisplayName','SIFT');
set(bar1(1),'DisplayName','DPD');

% Create xlabel
xlabel('Type of Video');

% Create ylabel
ylabel('Precision');
