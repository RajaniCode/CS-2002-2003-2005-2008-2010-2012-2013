   M S B A M L   `   `   `  ????|  xSystem.Windows.Controls.DataVisualization.Toolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35?{clr-namespace:System.Windows.Controls.DataVisualization.Charting;assembly=System.Windows.Controls.DataVisualization.Toolkit2System.Windows.Controls.DataVisualization.Charting  5   	     WFP40_COMInterop_Enhancement4   .WFP40_COMInterop_Enhancement.Window_SalesGraph   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   ?chartingToolkit{clr-namespace:System.Windows.Controls.DataVisualization.Charting;assembly=System.Windows.Controls.DataVisualization.Toolkit     5   	   -   5          ? Title$  Window_SalesGraph??5   	   $	??635??6#   $
??1029??60    ? 	Resources 5         CompanyNameTemplate??%U   &	        ?? 5   
   .R?5      ?? ??6   ?? *CompanyName+67   5	      5
      .??5      ?  ? RowDefinitions 5   
   ?? 5      $	??65* ?6   ?? 5      $
??262* ?6   .+?5   
   ?? -   5        $??
textBlock1??5   (   $??55??5      $
??Left=?6    $??
230,17,0,0q?5      $$??Company Wise Sales Inforamtion??5      $	??Top=?5      $	??589??6,    ?? TextAlignment$ Center=?5      $??30(?6,   
???  ??$??	ExtraBold"?5   &   $??2??6=   ?? 5   
   -   5        $??lstCompanyName??5      $??1??5      $??23??6    $
??Left=?6,   $??
125,26,0,0q?6G   $	??Top=?5   )   $	??120??6A   #??[  5      ??5   M   ?? 5   H   ?? 5   
   -   5        $??
textBlock2??5      $??1??5      $??23??6!   $
??Left=?6-   $??	12,26,0,0q?6H   $??CompanyName??5   &   $	??Top=?69   $??94??6Q   >   8System.Windows.Controls.DataVisualization.Charting.Chart  5   
   -   5        $??
chartSales??5   !   $	??450??5   !   $
??Left=?6.   $??
338,16,0,0q?6I      Title$ Company wise Sales??5   !   $	??Top=?6<   $	??600??6T   $??1??6`      Series 5      B   <System.Windows.Controls.DataVisualization.Charting.PieSeries  -   5          Name$ 	pieSeries??5   ,   H   BSystem.Windows.Controls.DataVisualization.Charting.DataPointSeries   DependentValuePath$ Value??6?      IndependentValuePath$	 Key??6Z   5"      ?? 5#   
   -   5        $??btnGenerateExcelreport??5%      $??Generate Excel??5#      $??1??5$      $??23??6   $
??Left=?6*   $??
31,160,0,0q?6E   $	??Top=?5%   /   $	??274??6G   5&      5'      5(      