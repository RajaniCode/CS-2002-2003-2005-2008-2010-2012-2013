   M S B A M L   `   `   `  ????  WPF_ADONET_EF_Commanding4    .WPF_ADONET_EF_Commanding.AllEmployeeByDeptName   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      .??5      ? $	??335??6   .+?5	   
   ?? -   5        $??lstDname??5	   N   $??43??6   $
??Left=?6   $??
259,12,0,0q?6:   $	??Top=?6^   $	??302??6v   ?? 5
   
   -   5        $??
textBlock1??5
   N   $??43??6   $
??Left=?6    $??	45,12,0,0q?6;   $??Department Name??6`   $	??Top=?6w   $	??196??6?   &   System.Windows.Controls.DataGrid  5   
   -   5        $??
dgEmployee??5   j       AutoGenerateColumns  .  $	??239??6/   $
??Left=?6<   $??	30,84,0,0q?6W   $	??Top=?6|   $	??601??6?      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ EmpNo??6?   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   ?? *EmpNo+6?     5      $ EmpName??6A    6%   ?? *	EmpName+6A     5      $ DeptNo??6@    6%   ?? *DeptNo+6@     5      $ Salary??6@    6%   ?? *Salary+6@   5      5      5      