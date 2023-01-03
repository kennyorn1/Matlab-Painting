% ��״ͼ����ģ��
% By�������Ŀ����ճ�

%% ����׼��
% ��ȡ����
% datasetΪ5*3�ľ���һ��3��Ϊһ�飬��5��
dataset = [0.241,0.393,0.294;
           0.219,0.254,0.238;
           0.238,0.262,0.272;
           0.198,0.329,0.287;
           0.201,0.197,0.185]; 

%% ��ɫ����
% addcolor������ȡ��ʽ��
% ���ںź�̨�ظ���morecolor
C1 = addcolor(185);
C2 = 'k';
C3 = addcolor(178);

%% ͼƬ�ߴ����ã���λ�����ף�
figureUnits = 'centimeters';
figureWidth = 12;
figureHeight = 8;

%% ��״ͼ����
%��������
figureHandle = figure;
set(gcf, 'Units', figureUnits, 'Position', [0 0 figureWidth figureHeight]); % define the new figure dimensions
hold on

% ������ͼ
% 1-���������
GO = bar(dataset,1,'EdgeColor','k');

% ��ɫ
GO(1).FaceColor = C1;
GO(2).FaceColor = C2;
GO(3).FaceColor = C3;

% ����ע�ͣ�����Ҫ��ɾ
for ii=1:5
    text(ii-0.24,dataset(ii,1)+0.005,num2str(dataset(ii,1)),...
         'ROtation',90,'color',C1,'FontSize',10,'FontName',  'Helvetica');
    text(ii,dataset(ii,2)+0.01,num2str(dataset(ii,2)),...
         'ROtation',90,'color',C2,'FontSize',10,'FontName',  'Helvetica');     
    text(ii+0.22,dataset(ii,3)+0.01,num2str(dataset(ii,3)),...
         'ROtation',90,'color',C3,'FontSize',10,'FontName',  'Helvetica');  
end

% ����������
set(gca, 'Box', 'off', ...                                         % �߿�
         'XGrid', 'off', 'YGrid', 'on', ...                        % ����
         'TickDir', 'out', 'TickLength', [.01 .01], ...            % �̶�
         'XMinorTick', 'off', 'YMinorTick', 'off', ...             % С�̶�
         'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1],...           % ��������ɫ
         'YTick', 0:0.1:1,...                                      % �̶�λ�á����
         'Ylim' , [0 0.6], ...                                     % �����᷶Χ
         'Xticklabel',{'samp1' 'samp2' 'samp3' 'samp4' 'samp5'},...% X������̶ȱ�ǩ
         'Yticklabel',{[0:0.1:1]})                                 % Y������̶ȱ�ǩ

% ��ǩ��Legend ����    
hYLabel = ylabel('RMSE (m)');
hLegend = legend([GO(1),GO(2),GO(3)], ...
                 'A', 'B', 'C', ...
                 'Location', 'northeast');
% Legendλ��΢�� 
P = hLegend.Position;
hLegend.Position = P + [0.015 0.03 0 0];

% �̶ȱ�ǩ������ֺ�
set(gca, 'FontName', 'Helvetica', 'FontSize', 9)
% ��ǩ��Legend�������ֺ� 
set([hYLabel,hLegend], 'FontName',  'Helvetica')
set([hYLabel,hLegend], 'FontSize', 10)

% ������ɫ
set(gca,'Color',[1 1 1])

%% ͼƬ���
figW = figureWidth;
figH = figureHeight;
set(figureHandle,'PaperUnits',figureUnits);
set(figureHandle,'PaperPosition',[0 0 figW figH]);
fileout = 'eg';
print(figureHandle,[fileout,'.png'],'-r300','-dpng');