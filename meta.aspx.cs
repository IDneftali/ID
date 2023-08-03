using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using OperativoBO;
using OperativoEntities;
using OperativoUI.Utilerias;
using DevExpress.Web.ASPxGridView;

public partial class ReportesGlobal_Comisiones_Operacion_Meta : System.Web.UI.Page
{
    Reporte_Mtto objReporte_Mtto;
    Reporte_MttoBO objReporte_MttoBO;
    VetecUtils objUtils;

    protected void Page_Load(object sender, EventArgs e)
    {
        objUtils = new VetecUtils();
        objReporte_Mtto = new Reporte_Mtto();
        objReporte_MttoBO = new Reporte_MttoBO();

        if (!IsPostBack)
        {

        }
        llenarGrid(ASPxTabAdmin.ActiveTabIndex);
    }

    private void llenarGrid(Int32 p_intTab)
    {
        Int32 intTipo = 0;
        if (radLineas.Checked)
        {
            intTipo = 0;
            WebChartControl1.Series[0].Name = "Proyección";
            WebChartControl1.Series[1].Name = "Acumulado";
            WebChartControl1.Series[2].Name = "Meta";
        }
        if (radDepto.Checked)
        {
            intTipo = 1;
            WebChartControl1.Series[0].Name = "Proyección";
            WebChartControl1.Series[1].Name = "Acumulado";
            WebChartControl1.Series[2].Name = "Meta";
        }

        Int32 intMostrar = 1;
        //if (radTotal.Checked)
        //    intMostrar = 1;
        //if (radCantidad.Checked)
        //    intMostrar = 2;

        if (rad3Dsi.Checked)
        {
            if (radPie.Checked)
            {
                WebChartControl1.Series[0].ChangeView(DevExpress.XtraCharts.ViewType.Pie3D);
                WebChartControl1.Series[1].ChangeView(DevExpress.XtraCharts.ViewType.Pie3D);
                WebChartControl1.Series[2].ChangeView(DevExpress.XtraCharts.ViewType.Pie3D);
            }
            if (radBar.Checked)
            {
                WebChartControl1.Series[0].ChangeView(DevExpress.XtraCharts.ViewType.Bar3D);
                WebChartControl1.Series[1].ChangeView(DevExpress.XtraCharts.ViewType.Bar3D);
                WebChartControl1.Series[2].ChangeView(DevExpress.XtraCharts.ViewType.Bar3D);
            }
            if (radLine.Checked)
            {
                WebChartControl1.Series[0].ChangeView(DevExpress.XtraCharts.ViewType.Line3D);
                WebChartControl1.Series[1].ChangeView(DevExpress.XtraCharts.ViewType.Line3D);
                WebChartControl1.Series[2].ChangeView(DevExpress.XtraCharts.ViewType.Line3D);
            }
        }

        if (rad3Dno.Checked)
        {
            if (radPie.Checked)
            {
                WebChartControl1.Series[0].ChangeView(DevExpress.XtraCharts.ViewType.Pie);
                WebChartControl1.Series[1].ChangeView(DevExpress.XtraCharts.ViewType.Pie);
                WebChartControl1.Series[2].ChangeView(DevExpress.XtraCharts.ViewType.Pie);
            }
            if (radBar.Checked)
            {
                WebChartControl1.Series[0].ChangeView(DevExpress.XtraCharts.ViewType.Bar);
                WebChartControl1.Series[1].ChangeView(DevExpress.XtraCharts.ViewType.StackedBar);
                WebChartControl1.Series[2].ChangeView(DevExpress.XtraCharts.ViewType.Line);
            }
            if (radLine.Checked)
            {
                WebChartControl1.Series[0].ChangeView(DevExpress.XtraCharts.ViewType.Line);
                WebChartControl1.Series[1].ChangeView(DevExpress.XtraCharts.ViewType.Line);
                WebChartControl1.Series[2].ChangeView(DevExpress.XtraCharts.ViewType.Line);
            }
        }


        //Formato de Números
        if (intMostrar == 1)
        {
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[1]).PropertiesTextEdit.DisplayFormatString = "{0:c}";
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[2]).PropertiesTextEdit.DisplayFormatString = "{0:c}";
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[3]).PropertiesTextEdit.DisplayFormatString = "{0:c}";
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[4]).PropertiesTextEdit.DisplayFormatString = "{0:c}";
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[5]).PropertiesTextEdit.DisplayFormatString = "{0:c}";
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[6]).PropertiesTextEdit.DisplayFormatString = "{0:c}";
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[7]).PropertiesTextEdit.DisplayFormatString = "{0:c}";
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[8]).PropertiesTextEdit.DisplayFormatString = "{0:c}";
            ASPxGridView2.TotalSummary[0].DisplayFormat = "{0:c}";
            ASPxGridView2.TotalSummary[1].DisplayFormat = "{0:c}";
            ASPxGridView2.TotalSummary[2].DisplayFormat = "{0:c}";
            ASPxGridView2.TotalSummary[3].DisplayFormat = "{0:c}";
            WebChartControl1.Series[0].LegendPointOptions.ValueNumericOptions.Format = DevExpress.XtraCharts.NumericFormat.Currency;
            WebChartControl1.Series[1].LegendPointOptions.ValueNumericOptions.Format = DevExpress.XtraCharts.NumericFormat.Currency;
            WebChartControl1.Series[2].LegendPointOptions.ValueNumericOptions.Format = DevExpress.XtraCharts.NumericFormat.Currency;
            //WebChartControl1.Series[1].LegendPointOptions.ValueNumericOptions.Format = DevExpress.XtraCharts.NumericFormat.Currency;
        }
        if (intMostrar == 2)
        {
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[1]).PropertiesTextEdit.DisplayFormatString = "{0:0.00}";
            WebChartControl1.Series[0].LegendPointOptions.ValueNumericOptions.Format = DevExpress.XtraCharts.NumericFormat.Number;
            WebChartControl1.Series[1].LegendPointOptions.ValueNumericOptions.Format = DevExpress.XtraCharts.NumericFormat.Number;
            WebChartControl1.Series[2].LegendPointOptions.ValueNumericOptions.Format = DevExpress.XtraCharts.NumericFormat.Number;
            ASPxGridView2.TotalSummary[0].DisplayFormat = "{0:0.00}";
            ASPxGridView2.TotalSummary[1].DisplayFormat = "{0:c}";
            ASPxGridView2.TotalSummary[2].DisplayFormat = "{0:c}";
            ASPxGridView2.TotalSummary[3].DisplayFormat = "{0:c}";
        }
        //Fecha
        if (intTipo == 2)
        {
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[0]).PropertiesTextEdit.DisplayFormatString = "{0:dd/MM/yyyy}";
            WebChartControl1.Series[0].ArgumentScaleType = DevExpress.XtraCharts.ScaleType.DateTime;
            WebChartControl1.Series[0].PointOptions.ArgumentDateTimeOptions.FormatString = "dd/MM/yyyy";
        }
        else
        {
            ((DevExpress.Web.ASPxGridView.GridViewDataTextColumn)ASPxGridView2.Columns[0]).PropertiesTextEdit.DisplayFormatString = "";
            WebChartControl1.Series[0].ArgumentScaleType = DevExpress.XtraCharts.ScaleType.Qualitative;
            WebChartControl1.Series[1].ArgumentScaleType = DevExpress.XtraCharts.ScaleType.Qualitative;
            WebChartControl1.Series[2].ArgumentScaleType = DevExpress.XtraCharts.ScaleType.Qualitative;
        }

        WebChartControl1.DataSource = objReporte_MttoBO.ConsultaResumen_ReporteMtto(System.Int32.Parse("4"), System.Int32.Parse("0"), intTipo, System.Int32.Parse("0"), System.Int32.Parse("0"), System.Int32.Parse("1"), intMostrar);
        WebChartControl1.DataBind();
        ASPxGridView2.DataSource = WebChartControl1.DataSource;
        ASPxGridView2.DataBind();
        WebChartControl1.Visible = true;
        ASPxGridView1.Visible = false;
        ASPxGridView2.Visible = true;
    }

    protected void btnPreview_ServerClick(object sender, EventArgs e)
    {
    }
    protected void btnList_ServerClick(object sender, EventArgs e)
    {
        llenarGrid(ASPxTabAdmin.ActiveTab.Index);
    }

    protected void btnEmail_ServerClick(object sender, EventArgs e)
    {

    }
    protected void btnPrefactura_ServerClick(object sender, EventArgs e)
    {

    }
    protected void ASPxTabAdmin_TabClick(object source, DevExpress.Web.ASPxTabControl.TabControlCancelEventArgs e)
    {
        llenarGrid(e.Tab.Index);
    }

    protected void btnPrint_ServerClick(object sender, EventArgs e)
    {
    }
}
