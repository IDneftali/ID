<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Meta.aspx.cs" Inherits="ReportesGlobal_Comisiones_Operacion_Meta" %>

<%@ Register Assembly="DevExpress.XtraCharts.v8.3.Web" Namespace="DevExpress.XtraCharts.Web"
    TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.3" Namespace="DevExpress.XtraCharts"
    TagPrefix="cc2" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Src="../../../WebControl/Toolbar.ascx" TagName="Toolbar" TagPrefix="uc1" %>
<%@ Register TagPrefix="igtbl" Namespace="Infragistics.WebUI.UltraWebGrid" Assembly="Infragistics.WebUI.UltraWebGrid.v6.1, Version=6.1.20061.28, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
<%@ Register TagPrefix="igsch" Namespace="Infragistics.WebUI.WebSchedule" Assembly="Infragistics.WebUI.WebDateChooser.v6.1, Version=6.1.20061.28, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.3.Web, Version=8.3.4.0, Culture=neutral, PublicKeyToken=5377c8e3b72b4073"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v8.3, Version=8.3.4.0, Culture=neutral, PublicKeyToken=5377c8e3b72b4073"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v8.3, Version=8.3.4.0, Culture=neutral, PublicKeyToken=5377c8e3b72b4073"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.3, Version=8.3.4.0, Culture=neutral, PublicKeyToken=5377c8e3b72b4073"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.3, Version=8.3.4.0, Culture=neutral, PublicKeyToken=5377c8e3b72b4073"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<%@ Register assembly="DevExpress.Web.v8.3" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dxtc" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
   
    <title>Administrar Facturas</title>
    <script type="text/javascript" language="javascript" src="../../../js/VetecFiles.js"></script>

<link href="../../../StylesOperativo.css" type="text/css" rel="stylesheet" />
</head>
<body leftmargin="0" topmargin="0">
		<form id="Form1" method="post" runat="server">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td class="tHead">&nbsp;Ventas y Metas</td>
							</tr>
                            <tr>
                                <td>
            <input id="btnPrint" type="button" value="Imprimir"  runat="server" onserverclick="btnPrint_ServerClick" visible="true" />
            <input id="btnPreview" type="button" value="Preview" onserverclick="btnPreview_ServerClick" runat="server" />
                                    <input id="btnList" type="button" value="Listado" onserverclick="btnList_ServerClick" runat="server" />
            <input id="btnNew" type="button" value="Nuevo" />
            
            <input id="btnEmail" type="button" value="Email"  runat="server" />
                                    <uc1:Toolbar ID="Toolbar1" runat="server" />
                                </td>
                            </tr>
						</table>
			<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
				<tr>
					<td vAlign="top" style="width: 952px">
						<table cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td  colSpan="2">
                                    <asp:Panel ID="Panel2" runat="server" class="tdNormal" GroupingText="Resumen" Width="100%">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 171px; height: 29px">
                                                    Graficar en 3D</td>
                                                <td style="height: 29px">
                                                    <asp:RadioButton ID="rad3Dsi" runat="server" CssClass="tLetra" GroupName="3D" Text="Si"/>
                                                    <asp:RadioButton ID="rad3Dno" runat="server" Checked="True" CssClass="tLetra" GroupName="3D" Text="No"/>
                                               </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 171px">
                                                    &nbsp;Mostrar</td>
                                                <td>
                                                    <asp:RadioButton ID="radLineas" runat="server" CssClass="tLetra" GroupName="Ordenamiento" Text="Clínicas" />
                                                    <asp:RadioButton ID="radDepto" runat="server" Checked="True" CssClass="tLetra" GroupName="Ordenamiento" Text="Zonas" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 171px; height: 29px">
                                                    Gráfica</td>
                                                <td style="height: 29px">
                                                    <asp:RadioButton ID="radPie" runat="server" CssClass="tLetra" GroupName="Grafica" />
                                                    <img alt="Pie" height="24" src="../../../Imagenes/Pie_Chart.png" width="24" />
                                                    <asp:RadioButton ID="radBar" runat="server" Checked="True" CssClass="tLetra" GroupName="Grafica" />
                                                    <img alt="Bar" height="24" src="../../../Imagenes/Bar_Chart.png" width="24" />
                                                    <asp:RadioButton ID="radLine" runat="server" CssClass="tLetra" GroupName="Grafica" />
                                                    <img alt="Line" height="24" src="../../../Imagenes/Line_Chart.png" width="24" /></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left">
                                                <dxtc:ASPxTabControl ID="ASPxTabAdmin" runat="server" ActiveTabIndex="0" CssFilePath="~/App_Themes/Soft Orange/{0}/styles.css"
                                                    CssPostfix="Soft_Orange" OnTabClick="ASPxTabAdmin_TabClick" TabSpacing="2px"
                                                    Width="100%">
                                                    <Paddings Padding="4px" />
                                                    <Tabs>
                                                        <dxtc:Tab Text="Detalle">
                                                        </dxtc:Tab>
                                                        <dxtc:Tab Text="Graficos">
                                                        </dxtc:Tab>
                                                    </Tabs>
                                                </dxtc:ASPxTabControl>
                                            </td>
                                        </tr>
                                    </table>
                                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Font-Size="XX-Small"
                                        Width="100%">
                                        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                                        </Styles>
                                        <SettingsLoadingPanel Text="" />
                                        <Images ImageFolder="~/App_Themes/Aqua/{0}/">
                                            <CollapsedButton Height="15px" Url="~/App_Themes/Aqua/GridView/gvCollapsedButton.png"
                                                Width="15px" />
                                            <ExpandedButton Height="15px" Url="~/App_Themes/Aqua/GridView/gvExpandedButton.png"
                                                Width="15px" />
                                            <DetailCollapsedButton Height="15px" Url="~/App_Themes/Aqua/GridView/gvDetailCollapsedButton.png"
                                                Width="15px" />
                                            <DetailExpandedButton Height="15px" Url="~/App_Themes/Aqua/GridView/gvDetailExpandedButton.png"
                                                Width="15px" />
                                            <HeaderFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilter.png" Width="19px" />
                                            <HeaderActiveFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilterActive.png"
                                                Width="19px" />
                                            <HeaderSortDown Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortDown.png"
                                                Width="7px" />
                                            <HeaderSortUp Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortUp.png" Width="7px" />
                                            <FilterRowButton Height="13px" Width="13px" />
                                            <WindowResizer Height="13px" Url="~/App_Themes/Aqua/GridView/WindowResizer.png" Width="13px" />
                                        </Images>
                                        <SettingsPager PageSize="25">
                                            <AllButton>
                                                <Image Height="19px" Width="27px" />
                                            </AllButton>
                                            <FirstPageButton>
                                                <Image Height="19px" Width="23px" />
                                            </FirstPageButton>
                                            <LastPageButton>
                                                <Image Height="19px" Width="23px" />
                                            </LastPageButton>
                                            <NextPageButton>
                                                <Image Height="19px" Width="19px" />
                                            </NextPageButton>
                                            <PrevPageButton>
                                                <Image Height="19px" Width="19px" />
                                            </PrevPageButton>
                                        </SettingsPager>
                                        <ImagesEditors>
                                            <CalendarFastNavPrevYear Height="19px" Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png"
                                                Width="19px" />
                                            <CalendarFastNavNextYear Height="19px" Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png"
                                                Width="19px" />
                                            <DropDownEditDropDown Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png"
                                                UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png"
                                                Width="9px" />
                                        </ImagesEditors>
                                        <Columns>
                                             <dxwgv:GridViewDataTextColumn Caption="Reporte" FieldName="intReporte" VisibleIndex="0">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Empresa" FieldName="strNombreEmpresa" VisibleIndex="1">
                                            </dxwgv:GridViewDataTextColumn>
                                             <dxwgv:GridViewDataTextColumn Caption="Clínica" FieldName="strNombreClinica" VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Clasificación" FieldName="strNombreClasificacion" VisibleIndex="3">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Necesario" FieldName="strAsistir" VisibleIndex="4">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Categoría" FieldName="strNombreTipo" VisibleIndex="5">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Tipo" FieldName="strNombreSubTipo" VisibleIndex="6">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Descripción" FieldName="strComentario" VisibleIndex="7">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Estatus" FieldName="strNombreEstatus" VisibleIndex="8">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Resuelto" FieldName="datFechaResuelto" VisibleIndex="9">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Total" FieldName="dblTotal" VisibleIndex="10">
                                                <PropertiesTextEdit DisplayFormatString="{0:c}">
                                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            
                                        </Columns>
                                        <SettingsText EmptyDataRow=" " />
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="Total {0:c}" FieldName="dblTotal" ShowInColumn="Total"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>
                                        <Settings ShowFilterRow="True" ShowFooter="True" />
                                    </dxwgv:ASPxGridView>
								</td>
							</tr>
						</table>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="2"><dxchartsui:WebChartControl ID="WebChartControl1" runat="server" Height="300px"
                                        Width="900px">
                                        <SeriesSerializable>
                                            <cc2:Series ArgumentDataMember="strResumen" LabelTypeName="PieSeriesLabel"  Name="Series0"
                                                PointOptionsTypeName="PiePointOptions" SeriesViewTypeName="PieSeriesView" SynchronizePointOptions="False"
                                                ValueDataMembersSerializable="dblProyeccion">
                                                <view hiddenserializablestring="to be serialized" runtimeexploding="False"></view><label hiddenserializablestring="to be serialized" linevisible="True" overlappingoptionstypename="OverlappingOptions">
                                                    <fillstyle filloptionstypename="SolidFillOptions">
<Options HiddenSerializableString="to be serialized"></Options>
</fillstyle>
                                                </label>
                                                <pointoptions hiddenserializablestring="to be serialized" pointview="Argument"></pointoptions>
                                                <legendpointoptions hiddenserializablestring="to be serialized" percentoptions-valueaspercent="False">
<ValueNumericOptions Format="Currency" Precision="0"></ValueNumericOptions>
</legendpointoptions>
                                                <topnoptions count="50" enabled="True"></topnoptions>
                                            </cc2:Series>
                                            <cc2:Series ArgumentDataMember="strResumen" LabelTypeName="PieSeriesLabel" Name="Series1"
                                                PointOptionsTypeName="PiePointOptions" SeriesViewTypeName="PieSeriesView" SynchronizePointOptions="False"
                                                ValueDataMembersSerializable="dblAcumulado">
                                                <view hiddenserializablestring="to be serialized" runtimeexploding="False"></view><label visible="False" hiddenserializablestring="to be serialized" linevisible="False" overlappingoptionstypename="OverlappingOptions">
                                                    <fillstyle filloptionstypename="SolidFillOptions">
<Options HiddenSerializableString="to be serialized"></Options>
</fillstyle>
                                                </label>
                                                <pointoptions hiddenserializablestring="to be serialized" pointview="Argument"></pointoptions>
                                                <legendpointoptions hiddenserializablestring="to be serialized"></legendpointoptions>
                                                <topnoptions count="50" enabled="True"></topnoptions>
                                            </cc2:Series>
                                            <cc2:Series ArgumentDataMember="strResumen" LabelTypeName="PieSeriesLabel" Name="Series2"
                                                PointOptionsTypeName="PiePointOptions" SeriesViewTypeName="PieSeriesView" SynchronizePointOptions="False"
                                                ValueDataMembersSerializable="dblMeta">
                                                <view hiddenserializablestring="to be serialized" runtimeexploding="False"></view><label visible="False" hiddenserializablestring="to be serialized" linevisible="False" overlappingoptionstypename="OverlappingOptions">
                                                    <fillstyle filloptionstypename="SolidFillOptions">
<Options HiddenSerializableString="to be serialized"></Options>
</fillstyle>
                                                </label>
                                                <pointoptions hiddenserializablestring="to be serialized" pointview="Argument"></pointoptions>
                                                <legendpointoptions hiddenserializablestring="to be serialized"></legendpointoptions>
                                                <topnoptions count="50" enabled="True"></topnoptions>
                                            </cc2:Series>
                                        </SeriesSerializable>
                                        <SeriesTemplate LabelTypeName="SideBySideBarSeriesLabel" PointOptionsTypeName="PointOptions"
                                            SeriesViewTypeName="SideBySideBarSeriesView">
                                            <View HiddenSerializableString="to be serialized">
                                            </View>
                                            <Label HiddenSerializableString="to be serialized" LineVisible="True" OverlappingOptionsTypeName="OverlappingOptions">
                                                <FillStyle FillOptionsTypeName="SolidFillOptions">
                                                    <Options HiddenSerializableString="to be serialized" />
                                                </FillStyle>
                                            </Label>
                                            <PointOptions HiddenSerializableString="to be serialized">
                                            </PointOptions>
                                            <LegendPointOptions HiddenSerializableString="to be serialized">
                                            </LegendPointOptions>
                                        </SeriesTemplate>
                                        <FillStyle FillOptionsTypeName="SolidFillOptions">
                                            <Options HiddenSerializableString="to be serialized" />
                                        </FillStyle>
                                        <Legend AlignmentHorizontal="Center" AlignmentVertical="TopOutside" Direction="LeftToRight">
                                        </Legend>
                                    </dxchartsui:WebChartControl></td>
                            </tr>
                            <tr>
                                <td  colspan="2" valign="top">
                                    <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False"
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Visible="False"
                                        Width="100%">
                                        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="Descripci&#243;n" FieldName="strResumen2" VisibleIndex="0">
                                <PropertiesTextEdit EncodeHtml="False">
                                    <Style HorizontalAlign="Left"></Style>
                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Venta Hoy." FieldName="dblVentaHOY" VisibleIndex="1">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Venta Ayer" FieldName="dblVentaAYER" VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>

                                            <dxwgv:GridViewDataTextColumn Caption="Proyeccin" FieldName="dblProyeccion" VisibleIndex="3">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Acumulado" FieldName="dblAcumulado" VisibleIndex="4">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="dblMeta" VisibleIndex="5">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Venta Alivio" FieldName="dblVentaAlivio" VisibleIndex="6">
                                            </dxwgv:GridViewDataTextColumn>


                                            <dxwgv:GridViewDataTextColumn Caption="V. Alivio Hoy" FieldName="dblVentaAlivioHOY" VisibleIndex="7">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="V. Alivio Ayer" FieldName="dblVentaAlivioAYER" VisibleIndex="8">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsLoadingPanel Text="" />
                                        <Images ImageFolder="~/App_Themes/Aqua/{0}/">
                                            <CollapsedButton Height="15px" Url="~/App_Themes/Aqua/GridView/gvCollapsedButton.png"
                                                Width="15px" />
                                            <ExpandedButton Height="15px" Url="~/App_Themes/Aqua/GridView/gvExpandedButton.png"
                                                Width="15px" />
                                            <DetailCollapsedButton Height="15px" Url="~/App_Themes/Aqua/GridView/gvDetailCollapsedButton.png"
                                                Width="15px" />
                                            <DetailExpandedButton Height="15px" Url="~/App_Themes/Aqua/GridView/gvDetailExpandedButton.png"
                                                Width="15px" />
                                            <HeaderFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilter.png" Width="19px" />
                                            <HeaderActiveFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilterActive.png"
                                                Width="19px" />
                                            <HeaderSortDown Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortDown.png"
                                                Width="7px" />
                                            <HeaderSortUp Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortUp.png" Width="7px" />
                                            <FilterRowButton Height="13px" Width="13px" />
                                            <WindowResizer Height="13px" Url="~/App_Themes/Aqua/GridView/WindowResizer.png" Width="13px" />
                                        </Images>
                                        <SettingsPager Position="TopAndBottom" PageSize="50" >
                                            <AllButton>
                                                <Image Height="19px" Width="27px" />
                                            </AllButton>
                                            <FirstPageButton>
                                                <Image Height="19px" Width="23px" />
                                            </FirstPageButton>
                                            <LastPageButton>
                                                <Image Height="19px" Width="23px" />
                                            </LastPageButton>
                                            <NextPageButton>
                                                <Image Height="19px" Width="19px" />
                                            </NextPageButton>
                                            <PrevPageButton>
                                                <Image Height="19px" Width="19px" />
                                            </PrevPageButton>
                                        </SettingsPager>
                                        <ImagesEditors>
                                            <CalendarFastNavPrevYear Height="19px" Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png"
                                                Width="19px" />
                                            <CalendarFastNavNextYear Height="19px" Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png"
                                                Width="19px" />
                                            <DropDownEditDropDown Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png"
                                                UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png"
                                                Width="9px" />
                                        </ImagesEditors>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="dblAcumulado" ShowInColumn="dblAcumulado"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="dblProyeccion" ShowInColumn="dblProyeccion"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="dblMeta" ShowInColumn="dblMeta"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="dblVentaAlivio" ShowInColumn="dblVentaAlivio"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>
                                        
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="dblVentaHOY" ShowInColumn="dblVentaHOY"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="dblVentaAYER" ShowInColumn="dblVentaAYER"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="dblVentaAlivioHOY" ShowInColumn="dblVentaAlivioHOY"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="dblVentaAlivioAYER" ShowInColumn="dblVentaAlivioAYER"
                                                ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                                        </TotalSummary>   
                                        <Settings ShowFooter="True" />
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
						
						<BR>
					</td>
				</tr>
			</table>
			</form>
			<script type="TEXT/JAVASCRIPT" language="javascript">
			    var objUtils=new VetecUtils();
			    
				if(document.getElementById("btnNew")!=null)
    		        document.getElementById("btnNew").onclick=new Function("window.location=window.location;")
                
			</script>
	</body>
</html>


