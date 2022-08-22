using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ZedGraph;
using System.Drawing;

/// <summary>
/// Summary description for graph.
/// </summary>
public partial class _Default : System.Web.UI.Page
   {

    protected void Page_Load(object sender, EventArgs e)
    {

    }


      #region Web Form Designer generated code
      override protected void OnInit( EventArgs e )
      {
         //
         // CODEGEN: This call is required by the ASP.NET Web Form Designer.
         //
         InitializeComponent();
         base.OnInit( e );
      }

      /// <summary>
      /// Required method for Designer support - do not modify
      /// the contents of this method with the code editor.
      /// </summary>
      private void InitializeComponent()
      {
         this.ZedGraphWeb1.RenderGraph += new ZedGraph.Web.ZedGraphWebControlEventHandler( this.OnRenderGraph1 );
         //this.ZedGraphWeb2.RenderGraph += new ZedGraph.Web.ZedGraphWebControlEventHandler( this.OnRenderGraph2 );
      }
      #endregion

      private void OnRenderGraph1(ZedGraph.Web.ZedGraphWeb z, System.Drawing.Graphics g, ZedGraph.MasterPane masterPane)
    {
        // Get the GraphPane so we can work with it
        GraphPane myPane = masterPane[0];

        // Set the title and axis labels        
        myPane.XAxis.Title.Text = "X-Axis";
        myPane.YAxis.Title.Text = "Y-Axis";


        // Make up some data points
        string[] labels = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
        double[] xAxis = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
        double[] x = { 10, 60, 50, 60,50, 90, 50, 90, 70, 80, 50, 30 };
        double[] x2 = { 30, 40, 20, 30, 30, 60, 90, 90, 50, 80, 30, 70 };
        double[] x3 = { 60, 60, 20, 20, 90, 30, 80, 60, 50, 80, 70, 0 };
        double[] x4 = { 80, 50, 20, 20, 90, 80,30, 50, 60, 30, 80, 70 };
        double[] x5 = { 90, 10, 20, 20, 20, 20, 50, 30, 90, 60, 70, 80 };
        

        // Declare a BarItem:- Bar Item is used for creating a bar     
        BarItem myCurve;
        // Declare a LineItem:- LineItem is used for creating a line     
        LineItem oLineItem;
        switch (cboGraphType.SelectedValue)
        {
            case "Clustered Column":
            case "Stacked":
                // Generate a blue bar with "Completed" in the legend
                myCurve = myPane.AddBar("Completed", null, x4, Color.Blue);
                // Fill the bar with a Blue-white-Blue color gradient for a 3d look
                myCurve.Bar.Fill = new Fill(Color.Blue, Color.White, Color.Blue, 0f);

                // Generate a red bar with "Identified" in the legend
                myCurve = myPane.AddBar("Identified", null, x3, Color.Red);
                // Fill the bar with a red-white-red color gradient for a 3d look
                myCurve.Bar.Fill = new Fill(Color.Red, Color.White, Color.Red, 0f);

                break;
            case "Clustered Bar":
            case "Stacked Bar":
                // Generate a blue bar with "Completed" in the legend
                myCurve = myPane.AddBar("Completed", x4, null, Color.Blue);
                // Fill the bar with a Blue-white-Blue color gradient for a 3d look
                myCurve.Bar.Fill = new Fill(Color.Blue, Color.White, Color.Blue, 0f);

                // Generate a red bar with "Identified" in the legend
                myCurve = myPane.AddBar("Identified", x3, null, Color.FromArgb(132, 33, 99));
                // Fill the bar with a red-white-red color gradient for a 3d look
                myCurve.Bar.Fill = new Fill(Color.Red, Color.White, Color.Red, 0f);

                break;


            case "Pie":
                // Fill the pane background with a color gradient
                myPane.Fill = new Fill(Color.White, Color.Goldenrod, 45.0f);
                // No fill for the chart background
                myPane.Chart.Fill.Type = FillType.None;
                // Set the legend to an arbitrary location
                myPane.Legend.Position = LegendPos.Float;
                myPane.Legend.Location = new Location(0.95f, 0.15f, CoordType.PaneFraction, AlignH.Right, AlignV.Top);
                myPane.Legend.FontSpec.Size = 10f;
                // IsHStack is use the create the legend items horizontally
                myPane.Legend.IsHStack = false;

                // Add some pie slices
                PieItem segment1 = myPane.AddPieSlice(x4[0], Color.Navy, Color.White, 45f, 0, "Jan");
                PieItem segment2 = myPane.AddPieSlice(x4[1], Color.Purple, Color.White, 45f, 0, "Feb");
                PieItem segment3 = myPane.AddPieSlice(x4[2], Color.LimeGreen, Color.White, 45f, 0, "Mar");
                PieItem segment4 = myPane.AddPieSlice(x4[3], Color.SandyBrown, Color.White, 45f, 0, "Apr");
                PieItem segment5 = myPane.AddPieSlice(x4[4], Color.Red, Color.White, 45f, 0, "May");
                PieItem segment6 = myPane.AddPieSlice(x4[5], Color.Blue, Color.White, 45f, 0, "Jun");
                PieItem segment7 = myPane.AddPieSlice(x4[6], Color.Green, Color.White, 45f, 0, "Jul");
                PieItem segment8 = myPane.AddPieSlice(x4[7], Color.Yellow, Color.White, 45f, 0, "Aug");
                PieItem segment9 = myPane.AddPieSlice(x4[8], Color.YellowGreen, Color.White, 45f, 0, "Sep");
                PieItem segment10 = myPane.AddPieSlice(x4[9], Color.AliceBlue, Color.White, 45f, 0, "Oct");
                PieItem segment11 = myPane.AddPieSlice(x4[10], Color.AntiqueWhite, Color.White, 45f, 0, "Nov");
                PieItem segment12 = myPane.AddPieSlice(x4[11], Color.Aqua, Color.White, 45f, 0, "Dec");
                // Calculate the Axis Scale Ranges
                //There is no obligation to call AxisChange() for manually scaled axes. AxisChange() is only intended to handle auto scaling operations. Call this function anytime you change, add, or remove curve data to insure that the scale range of the axes are appropriate for the data range. This method calculates a scale minimum, maximum, and step size for each axis based on the current curve data. Only the axis attributes (min, max, step) that are set to auto-range (MinAuto, MaxAuto, MajorStepAuto) will be modified. You must call Invalidate()() after calling AxisChange to make sure the display gets updated. This overload of AxisChange just uses the default Graphics instance for the screen. If you have a Graphics instance available from your Windows Form, you should use the AxisChange(Graphics) overload instead.
                masterPane.AxisChange(g);
                // There is no need for pie chart to adjust X and Y axis. So the rest of the code is irrelavent with regard to Pie Chart
                return;
                break;
            case "Line":
                oLineItem = myPane.AddCurve("Completed", xAxis, x4, Color.Blue, SymbolType.None);
                oLineItem = myPane.AddCurve("Identified", xAxis, x3, Color.FromArgb(132, 33, 99), SymbolType.None);
                break;


        }


        switch (cboGraphType.SelectedValue)
        {
            case "Clustered Column":
            case "Stacked":

                // Set the XAxis labels
                myPane.XAxis.Scale.TextLabels = labels;
                // Set the XAxis to Text type
                myPane.XAxis.Type = AxisType.Text;
                // Make the bars Vertical by setting the BarBase to "X"
                myPane.BarSettings.Base = BarBase.X;
                break;
            case "Clustered Bar":
            case "Stacked Bar":
                // Set the YAxis labels
                myPane.YAxis.Scale.TextLabels = labels;
                // Set the YAxis to Text type
                myPane.YAxis.Type = AxisType.Text;
                // Make the bars horizontal by setting the BarBase to "Y"
                myPane.BarSettings.Base = BarBase.Y;
                break;
            case "Line":
                // Set the XAxis labels
                myPane.XAxis.Scale.TextLabels = labels;
                // Set the YAxis to Text type
                myPane.XAxis.Type = AxisType.Text;
                // Draw the X tics at the labels
                myPane.XAxis.MajorTic.IsBetweenLabels = false;
                break;

        }

        switch (cboGraphType.SelectedValue)
        {
            case "Clustered Column":
            case "Clustered Bar":
                // Set the bar type to stack, which stacks the bars by automatically accumulating the values
                myPane.BarSettings.Type = BarType.Cluster;
                break;
            case "Stacked":
            case "Stacked Bar":
                // Set the bar type to stack, which stacks the bars by automatically accumulating the values
                myPane.BarSettings.Type = BarType.Stack;
                break;
       }

        // Fill the axis background with a color gradient
        myPane.Chart.Fill = new Fill(Color.White,Color.FromArgb(255, 255, 166), 45.0F);

        masterPane.AxisChange(g);
    }
      
   }

