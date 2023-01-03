% ����ͼ����ģ��
% By�������Ŀ����ճ�

%% ����׼��
% ��ȡ����
load mae; % ��������mae��mae�а���78*3�ľ���A

% �������ϵ��x����
x = 0.1:0.1:1;

% �ֱ��岻ͬ�����ϵ��y����
samp1 = A(2:11,3);
samp2 = A(15:24,3);
samp3 = A(28:37,3);
samp4 = A(41:50,3);
samp5 = A(54:63,3);

%% ��ɫ����
% addcolor������ȡ��ʽ��
% ���ںź�̨�ظ���morecolor
C1 = addcolor(1);
C2 = addcolor(98);
C3 = addcolor(135);
C4 = addcolor(214);
C5 = addcolor(215);

%% ͼƬ�ߴ����ã���λ�����ף�
figureUnits = 'centimeters';
figureWidth = 12;
figureHeight = 8;

%% ��������
figureHandle = figure;
set(gcf, 'Units', figureUnits, 'Position', [0 0 figureWidth figureHeight]); 
hold on

% �ֱ����ֱ��
Line1 = line(x,samp1);
Line2 = line(x,samp2);
Line3 = line(x,samp3);
Line4 = line(x,samp4);
Line5 = line(x,samp5);

%% ϸ�ڵ���
% �������͡���Ƿ��š��߿����ɫ
% ������������������������������������������
% ���� |   -   |    --   |    :   |   :.  |
% ������������������������������������������
% ˵�� |  ʵ�� |  ˫����  |  ����  | �㻮��|
% ������������������������������������������

% ����������������������������������������������������������������������������������������������������������������
% ��Ƿ� |   +   |     o    |    *   |    .   |   x   |   s   |    d   |   ^    |    v   |     >   |    <   |
% ����������������������������������������������������������������������������������������������������������������
%  ˵��  |  �Ӻ� |   ����Բ  |  �Ǻ�  | ʵ��Բ |  ��� | ������ |  ����  | ������ | ������  |  ������ | ������ |  
% ����������������������������������������������������������������������������������������������������������������
set(Line1, 'LineStyle', '--','Marker', 'd','LineWidth', 1,  'Color', C1)
set(Line2, 'LineStyle', '--','Marker', 'o','LineWidth', 1,  'Color', C2)
set(Line3, 'LineStyle', '--','Marker', '^','LineWidth', 1,  'Color', C3)
set(Line4, 'LineStyle', '--','Marker', 'v','LineWidth', 1,  'Color', C4)
set(Line5, 'LineStyle', '--','Marker', 'd','LineWidth', 1,  'Color', C5)

% ����������
set(gca, 'Box', 'off', ...                                % �߿�
         'XGrid', 'off', 'YGrid', 'on', ...               % ����
         'TickDir', 'out', 'TickLength', [.01 .01], ...   % �̶�
         'XMinorTick', 'off', 'YMinorTick', 'off', ...    % С�̶�
         'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1],...  % ��������ɫ
         'XTick', 0:0.1:1.2,  'YTick', 0:0.05:0.5,...     % �̶�λ�á����
         'Xlim' ,[0 1.1],'Ylim' ,[0.1 0.35], ...          % �����᷶Χ
         'Xticklabel',{[0:0.1:1.2]},...                   % X������̶ȱ�ǩ
         'Yticklabel',{[0:0.05:0.5]})                     % Y������̶ȱ�ǩ

% X��Y���ǩ��Legend
hXLabel = xlabel('Point spacing (m)');
hYLabel = ylabel('MAE (m)');
hLegend = legend([Line1,Line2,Line3,Line4,Line5], ...
                 'samp1', 'samp2','samp3','samp4','samp5', ...
                 'Location', 'northwest');

% �̶ȱ�ǩ������ֺ�
set(gca, 'FontName', 'Times', 'FontSize', 9)
% X��Y���ǩ��Legend�������ֺ� 
set([hXLabel, hYLabel,hLegend], 'FontName',  'Helvetica')
set([hXLabel, hYLabel,hLegend], 'FontSize', 10)

% ������ɫ
set(gca,'Color',[1 1 1])

%% ͼƬ���
figW = figureWidth;
figH = figureHeight;
set(figureHandle,'PaperUnits',figureUnits);
set(figureHandle,'PaperPosition',[0 0 figW figH]);
fileout = 'eg';
print(figureHandle,[fileout,'.png'],'-r300','-dpng');

