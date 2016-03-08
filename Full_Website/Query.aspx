<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Query.aspx.cs" Inherits="Full_Website.Query" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:ListBox ID="ListBox1" runat="server" style="z-index: 1; left: 74px; top: 190px; position: absolute; height: 200px; width: 250px;" DataSourceID="SqlDataSource1" DataTextField="PRJ_NAME" DataValueField="PRJ_ID" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
    <asp:ListBox ID="ListBox2" runat="server" Style="z-index: 1; left: 376px; top: 190px; position: absolute; height: 200px; width: 250px;" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MLOC_NAME" DataValueField="MLOC_ID" Enabled="False" OnSelectedIndexChanged="ListBox2_SelectedIndexChanged"></asp:ListBox>
    <asp:ListBox ID="ListBox3" runat="server" Style="z-index: 1; left: 675px; top: 190px; position: absolute; height: 200px; width: 250px;" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="PARAM_NAME" DataValueField="PARAM_ID" Enabled="False"></asp:ListBox>
    
    <asp:Label ID="Label2" runat="server" Text="Projects" Style="z-index: 1; font-size: 16pt; left: 82px; top: 155px; position: absolute; height: 20px; width: 250px;" Font-Bold="True" Font-Names="Calibri"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Monitoring Locations" style="z-index: 1; font-size: 16pt; left: 375px; top: 155px; position: absolute; height: 20px; width: 250px;" Font-Bold="True" Font-Names="Calibri"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="Parameters" style="z-index: 1; font-size: 16pt; left: 675px; top: 155px; position: absolute; height: 20px; width: 250px;" Font-Bold="True" Font-Names="Calibri"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" SelectCommand="SELECT [PRJ_ID], [PRJ_NAME] FROM [PROJECT]"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                &nbsp;<img src=".gif/ajax-loader.gif" Style="z-index: 1; left: 475px; top: 490px; position: absolute; height: 50px; width: 50px;" />
            </ProgressTemplate>
        </asp:UpdateProgress>
    <br />
    <br />
    <br />
    <br />
    <br />
        
    <br />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource3_Selecting" SelectCommand="spParamDropDownFromMloc" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="MLOC_ID" SessionField="MLOC_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="spMlocDropDownFromProj" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="PRJ_ID" SessionField="PRJ_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        </ContentTemplate>
        </asp:UpdatePanel>
    <br />
    <br />
    <br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <asp:Button ID="backmonth" runat="server" Text="&lt;" style="z-index: 1; font-size: 12pt; left: 325px; top: 430px; position: absolute; height: 30px; width: 75px;" Font-Names="Calibri" OnClick="backmonth_Click" />
    <asp:Button ID="addmonth" runat="server" Text="&gt;" style="z-index: 1; font-size: 12pt; left: 400px; top: 430px; position: absolute; height: 30px; width: 75px;" Font-Names="Calibri" OnClick="addmonth_Click" />
    <br />
    <asp:Button ID="backweek" runat="server" Text="&lt;" style="z-index: 1; font-size: 12pt; left: 575px; top: 430px; position: absolute; height: 30px; width: 75px;" Font-Names="Calibri" OnClick="backweek_Click" />
    <asp:Button ID="addweek" runat="server" Text="&gt;" style="z-index: 1; font-size: 12pt; left: 650px; top: 430px; position: absolute; height: 30px; width: 75px;" Font-Names="Calibri" OnClick="addweek_Click"/>
    <br />
    <asp:Button ID="Year" runat="server" OnClick="Year_Click" Text="Select by Year" style="z-index: 1; font-size: 12pt; left: 75px; top: 400px; position: absolute; height: 30px; width: 150px;" Font-Names="Calibri" />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Month" runat="server" Text="Select By Month" style="z-index: 1; font-size: 12pt; left: 325px; top: 400px; position: absolute; height: 30px; width: 150px;" Font-Names="Calibri" OnClick="Month_Click"  />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Week" runat="server" Text="Select By Week" style="z-index: 1; font-size: 12pt; left: 575px; top: 400px; position: absolute; height: 30px; width: 150px;" Font-Names="Calibri" OnClick="Week_Click" />
    <asp:Button ID="backyr" runat="server" Text="&lt;" style="z-index: 1; font-size: 12pt; left: 75px; top: 430px; position: absolute; height: 30px; width: 75px;" Font-Names="Calibri" OnClick="backyr_Click"/>
    <asp:Button ID="Button2" runat="server" Text="&gt;" style="z-index: 1; font-size: 12pt; left: 150px; top: 430px; position: absolute; height: 30px; width: 75px;" Font-Names="Calibri" OnClick="Button2_Click"/>
    <br />
    <br />
     <asp:Button ID="GetData" runat="server" Text="Get Data"  style="z-index: 1; font-size: 12pt; left: 325px; top: 500px; position: absolute; height: 30px; width: 150px;" OnClick="GetData_Click" />
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server" Enabled="False"></asp:TextBox>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Content>
