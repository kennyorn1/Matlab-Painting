% ˫������+��״ͼ����ģ��
% ���ںţ������Ŀ����ճ�

clear
%% ����׼��
% ��ȡ����
A = load('1.txt');

% �Ա���x
x = A(:,1);

% ����-��״ͼ�������bar1
bar1(:,1) = A(:,2);
bar1(:,2) = A(:,5);
bar1 = flipud(bar1); % ���ݷ�ת����ɾ

% ����-����ͼ�������y1��y2
y1 = A(:,3);
y2 = A(:,6);

%% ͼƬ�ߴ����ã���λ�����ף�
figureUnits = 'centimeters';
figureWidth = 14;
figureHeight = 8;

%% ��������
figureHandle = figure;
set(gcf, 'Units', figureUnits, 'Position', [0 0 figureWidth figureHeight]); 
hold on

%% ��ɫ����
% colorplus������ȡ��ʽ��
% ���ں�(�����Ŀ����ճ�)��̨�ظ���450
C1 = colorplus(361);
C2 = colorplus(441);

%% ����������״ͼ
yyaxis left
GO = bar(bar1,1,'EdgeColor','k');
GO(1).FaceColor = C1;
GO(2).FaceColor = C2;
hYLabel1 = ylabel('Number of points');
set(gca,  'YColor', [.1 .1 .1],...         % ��������ɫ
          'YTick', 0:5000:25000,...        % �̶�λ�á����
          'Ylim' ,[0 25000],...            % �����᷶Χ
          'Yticklabel',{[0:5000:25000]})   % Y������̶ȱ�ǩ

%% ������������ͼ
yyaxis right
Ag = line(x,y1);
Ao = line(x,y2);
set(Ag, 'LineStyle', '-','LineWidth', 1,  'Color', C1)
set(Ao, 'LineStyle', '--','LineWidth', 1,  'Color', C2)
hYLabel2 = ylabel('Accuracy (%)');
set(gca, 'YColor', [.1 .1 .1],... 
         'YTick', 0:10:100, ...
         'Ylim' ,[50 100], ...
         'Yticklabel',{[0:10:100]})

     
%% X��������ϸ�ڵ���
hXLabel1 = xlabel('cr (m)');
set(gca, 'Box', 'off', ...                                         % �߿�
         'XGrid', 'off', 'YGrid', 'on', ...                        % ����
         'TickDir', 'out', 'TickLength', [.01 .01], ...            % �̶�
         'XMinorTick', 'off', 'YMinorTick', 'off', ...             % С�̶�
         'XColor', [.1 .1 .1],...                                  % ��������ɫ
         'XDir','reverse')                                         % X�ᷭת����ɾ��
     
hLegend = legend([GO(1),GO(2),Ag,Ao], ...
    'Ground', 'Object', 'Pg','Po', ...
    'Location', 'southoutside','orientation','horizontal');

% �̶ȱ�ǩ������ֺ�
set(gca, 'FontName', 'Helvetica', 'FontSize', 10)

figW = figureWidth;
figH = figureHeight;
set(figureHandle,'PaperUnits',figureUnits);
set(figureHandle,'PaperPosition',[0 0 figW figH]);
fileout = 'test';
print(figureHandle,[fileout,'.png'],'-r600','-dpng');