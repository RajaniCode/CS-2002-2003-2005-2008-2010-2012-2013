   M S B A M L   `   `   `  ????|  xSystem.Windows.Controls.DataVisualization.Toolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35?{clr-namespace:System.Windows.Controls.DataVisualization.Charting;assembly=System.Windows.Controls.DataVisualization.Toolkit2System.Windows.Controls.DataVisualization.Charting  5   	    WPF_RESTCLient   WPF_RESTCLient.Window1   5   	   \ XPresentationFramework, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35U QWPFToolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      8x,http://schemas.microsoft.com/winfx/2006/xaml    5      ?chartingToolkit{clr-namespace:System.Windows.Controls.DataVisualization.Charting;assembly=System.Windows.Controls.DataVisualization.Toolkit    5   	     ? Title$  Window1??5      $	??700??6   $	??700??6"    ? 	Resources 5         EmployeeDataTemplate ?? Orientation ?? 
TargetType ?? Triggers P? Property P? Value ?? Property ?? Value??%x  &	        '?? ?    ?? 5   
   .R?5      ?? 
???  ??$??2q?6'   $??1q?62   $??Center=?6F   ._?5	      ?? $ 
Horizontal=?6   .+?5
      ?? $	??100??6    ??6,   ?? *EmpNo+6E   ?? 5      $	??150??6    ??6,   ?? *	EmpName+6G   ?? 5      $	??100??6    ??6,   ?? *Salary+6F   ?? 5      $	??100??6    ??6,   ?? *DeptNo+6F   5      5      5      ?? 5   
   " ??6    5      P? 5       ?@J?IsMouseOver . . ?5      ??  ? ??
 ?  ??6A   ?? 5       ? ??$ 20(?61   6>   ?? 5       ? ??$
 Bold"?63   6B   5      5      5      .??5      ? 	 ? ShowGridLines	 . ??6   ?? 
 ?? Path$
 ActualHeight???60   ?? $
 ActualWidht? ? RowDefinitions 5   
   ?? 5      $	??350 ?6   6+   ?? 5      $	??350 ?6   6+    ? ColumnDefinitions 5    
   ?? 5!      $	??350 ?6   6-   ?? 5"      $	??350 ?6   6-   .+?5$   
   ? -   5         ?Name$ grdEmp??5$      $??1??6    5%      ?? 5&      $??30 ?6    6.   ?? 5'      $	??320 ?6    6/   .+?5)      ?? $??Employee Information??6    ?? TextAlignment$ Center=?64   $??0??6K   $	??350??6X   $
??Wrap=?6d   
????  ?$??Times New Roman)?5*   +   $??25(?6H   $
??Bold"?6V   $??Italic$?6h   
??? ???5+   -   ?? 5-      -   5        $??
lstEmpData??5.      $??1??5-      #??[  5.   <   ??6$   ?? 5/      50      ? 51   
   -   5        $ grdQtewiseChart??51   ,   $??0??6   $??0??6    52      ?? 53      $??30 ?6    6.   ?? 54      $	??320 ?6    6/   .+?56      ?? $ ??Quarter Wise Sales Statics??6   $ Center=?6:   $??0??6Q   $	??350??6^   $
??Wrap=?6j   
????  ?$??Times New Roman)?57   +   $??25(?6H   $
??Bold"?6V   $??Italic$?6h   
??? ???58   -   >   8System.Windows.Controls.DataVisualization.Charting.Chart  5;      -   5        $??chartQtrwiseSalesColumn??5<       $??1??5;   $      Series 5>      E   ?System.Windows.Controls.DataVisualization.Charting.ColumnSeries  -   5          Name$ columnQtrWiseSalesChart??5>   3   H   BSystem.Windows.Controls.DataVisualization.Charting.DataPointSeries   DependentValuePath$ Value??5?   3      IndependentValuePath$	 Key??5@   3      IsSelectionEnabled . 5B      5D      5E      ? 5F   
   -   5        $ grdSalesDataChart??5F   ,   $??1??6   $??0??6    5G      ?? 5H      $??30 ?6    6.   ?? 5I      $	??320 ?6    6/   .+?5K      ?? $??Itemwise Sales Statics??6   $ Center=?66   $??0??6M   $	??350??6Z   $
??Wrap=?6f   
????  ?$??Times New Roman)?5L   +   $??25(?6H   $
??Bold"?6V   $??Italic$?6h   
??? ???5M   -     5O      -   5        $??chartSalesDataColumn??5P       $??1??5O   $   $	??350??5P   <    5R      C   =System.Windows.Controls.DataVisualization.Charting.LineSeries  -   5          Name$ lineSalesDataChart??5R   1   $ Value??5S   3   $	 Key??5T   3    . 5V      5X      5Y      ? 5Z   
   -	   5        $ grdStatewiseSales??5Z   ,   $??1??6   $??1??6    5[      ?? 5\      $??30 ?6    6.   ?? 5]      $	??320 ?6    6/   .+?5_      ?? $??State Sales Statics??6   $ Center=?63   $??0??6J   $	??350??6W   $
??Wrap=?6c   
????  ?$??Times New Roman)?5`   +   $??25(?6H   $
??Bold"?6V   $??Italic$?6h   
??? ???5a   -     5b      -
   5        $??chartStatewiseSalesColumn??5c       $??1??5b   $   $	??350??5c   A    5e      B   <System.Windows.Controls.DataVisualization.Charting.PieSeries  -   5          Name$ pieStateSalesChart??5e   0   $ Value??5f   3   $	 Key??5g   3    . 5i      5k      5l      5m      5n      