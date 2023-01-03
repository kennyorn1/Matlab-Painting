% 渐变三维柱状图绘制模板
% 公众号：阿昆的科研日常

%% 数据准备
% 读取数据
load BostonTemp.mat
yearIdx = 16;
TempData6Years = Temperatures(yearIdx:yearIdx+5,:);

%% 颜色定义
% addcolorplus函数获取方式：
% 公众号后台回复：配色强化
map = addcolorplus(300);
% map = flipud(map);

%% 绘制渐变三维柱状图
figureHandle = figure;
b = bar3(TempData6Years,0.5);
hTitle = title(sprintf('Average Monthly Temperatures from %d to %d',Year(yearIdx),Year(yearIdx+5)));
hXLabel = xlabel('Month');
hYLabel = ylabel('Year');
hZLabel = zlabel('Temperature (\circF)');

%% 细节优化
% 赋色
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
colormap(map)

% 坐标区调整
set(gca, 'Box', 'off', ...                                                          % 边框
         'LineWidth', 1, 'GridLineStyle', '-',...                                   % 坐标轴线宽
         'XGrid', 'off', 'YGrid', 'off','ZGrid', 'on', ...                          % 网格
         'TickDir', 'out', 'TickLength', [.015 .015], ...                           % 刻度
         'XMinorTick', 'off', 'YMinorTick', 'off',  'ZMinorTick', 'off',...         % 小刻度
         'XColor', [.1 .1 .1],  'YColor', [.1 .1 .1], 'ZColor', [.1 .1 .1],...      % 坐标轴颜色
         'Xticklabel',Months,...                                                    % X坐标轴刻度标签
         'Yticklabel',Year(yearIdx):Year(yearIdx+5))       

% 字体和字号
set(gca, 'FontName', 'Helvetica')
set([hXLabel, hYLabel,hZLabel], 'FontName', 'AvantGarde')
set(gca, 'FontSize', 10)
set([hXLabel, hYLabel,hZLabel], 'FontSize', 12)
set(hTitle, 'FontSize', 12, 'FontWeight' , 'bold')


% 背景颜色
set(gcf,'Color',[1 1 1])

%% 图片输出
print(figureHandle,'eg1.png','-r300','-dpng');