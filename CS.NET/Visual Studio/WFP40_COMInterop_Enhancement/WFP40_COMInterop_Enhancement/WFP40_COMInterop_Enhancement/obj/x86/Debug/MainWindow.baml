   M S B A M L   `   `   `  ????|  xSystem.Windows.Controls.DataVisualization.Toolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35?{clr-namespace:System.Windows.Controls.DataVisualization.Charting;assembly=System.Windows.Controls.DataVisualization.Toolkit2System.Windows.Controls.DataVisualization.Charting  5   	     WFP40_COMInterop_Enhancement-   'WFP40_COMInterop_Enhancement.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   6my-http://schemas.microsoft.com/wpf/2008/toolkit  5   6   ?chartingToolkit{clr-namespace:System.Windows.Controls.DataVisualization.Charting;assembly=System.Windows.Controls.DataVisualization.Toolkit  5   	   -   5          ? Title$  
MainWindow??5   	   $	??710??6   $
??1051??6)    ? WindowState$ 	Maximized=?5   
   .??5      ? .+?5   
   &   System.Windows.Controls.DataGrid  -   5        $??	dgProcess??5	         AutoGenerateColumns .  $	??242??5   /   $
??Left=?6<   $??	29,57,0,0q?6W   $	??Top=?5	   $   $	??330??6<      Columns 5
      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Process Name??6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   ?? *ProcessName+6]     5      $ Memory Usage??6%    6;   ?? *MemoryUsage+6]   5      >   8System.Windows.Controls.DataVisualization.Charting.Chart  5   
   -   5        $??chartProcess??5   ]   $	??450??6!   $
??Left=?6.   $??
48,321,0,0q?6I      Title$ Process-Memory Chart??5   !   $	??Top=?6>   $
??1200??6V      Series 5      B   <System.Windows.Controls.DataVisualization.Charting.PieSeries  H   BSystem.Windows.Controls.DataVisualization.Charting.DataPointSeries   IndependentValueBinding 6(   ?? 	 ?? Path$	 ProcessName?
   DependentValueBinding
 5   ,   ?? $	 MemoryUsage?   ItemsSource 6_   ?? 5      ?? 5   
   -   5        $??	btnExport??5   ^   $??Export??6   $??23??6"   $
??Left=?6.   $??495,138,0,0q?6I   $	??Top=?6o   $	??233??6?   6?   5      5      