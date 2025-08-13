# flutter_ui
Flutter Future UI Show

Show how to create flutter ui , material google ui , apple ui and hottest flutter dev pack ui.

## Create Part

command : flutter create --org com.future --description "Flutter Future UI Show" --platforms=ios,android flutter_ui

## AI Plan
阶段 1：基础 & 布局（P0）

文本 Text/RichText，按钮 Filled/Elevated/Outlined/IconButton

布局 Row/Column/Stack/Align/Expanded/Flex/Wrap

输入 TextField/Form、开关/滑块/单选复选

列表 ListView/GridView（含 ListTile 变体）

导航：NavigationBar(M3)、TabBar、Drawer、Dialog/BottomSheet/SnackBar

主题：Material 3 的 ColorScheme、动态色（示例切换主题）

阶段 2：动画（P0→P1）

隐式动画：AnimatedContainer、AnimatedOpacity、TweenAnimationBuilder

显式动画：AnimationController、CurvedAnimation、AnimatedBuilder

过渡：Hero、PageRouteBuilder 自定义转场

物理动画：AnimatedPhysicalModel、弹簧/阻尼（基于 SpringSimulation）

自绘：CustomPainter + 动画（进度环、波浪、粒子）

阶段 3：高级滚动 & Sliver（P1）

CustomScrollView、SliverAppBar（折叠效果）、SliverList/Grid

粘性头 SliverPersistentHeader

下拉刷新（原生 + 插件对比）

阶段 4：视觉与特效（P1）

毛玻璃 BackdropFilter、ImageFilter.blur

ShaderMask/BlendMode、霓虹/渐变文字

Skeleton/占位：shimmer 或 skeletonizer

玻璃拟态、卡片海拔与阴影对比

阶段 5：热门插件 UI 组件（P1→P2）

动画：lottie, rive

图表：fl_chart（折线/柱状/饼图交互）

轮播：carousel_slider

弹窗/底部面板：modal_bottom_sheet

下拉刷新：pull_to_refresh 或 flutter_refresh

富文本/编辑：flutter_markdown（展示/编辑）

其他：sliding_up_panel、flutter_staggered_grid_view、animations 官方包

阶段 6：iOS 风格复刻（P2）

CupertinoNavigationBar/TabScaffold/SliverNavigationBar

iOS 风格 Switch/SegmentedControl/ActionSheet/DatePicker

交互细节：回弹滚动、过场动效速度曲线、Large Title 渐隐

阶段 7：Android 最新（Material 3 深入，P2）

NavigationBar vs NavigationRail 响应式切换

SearchBar/SearchAnchor、Filled/Outlined TextField 对比

M3 动效参数（Easing/Duration）与动效示例

动态色取色流程（运行时切换预设色板）