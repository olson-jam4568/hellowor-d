<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Querytop.aspx.cs" Inherits="Full_Website.Querytop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:ListBox ID="ListBoxTop1" runat="server" style="z-index: 1; left: 75px; top: 190px; position: absolute; height: 200px; width: 250px;" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="PRJ_NAME" DataValueField="PRJ_ID" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
    <asp:ListBox ID="ListBoxTop2" runat="server" Style="z-index: 1; left: 375px; top: 190px; position: absolute; height: 200px; width: 250px;" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="MLOC_NAME" DataValueField="MLOC_ID" Enabled="False" OnSelectedIndexChanged="ListBoxTop2_SelectedIndexChanged"></asp:ListBox>
    <asp:ListBox ID="ListBoxTop3" runat="server" Style="z-index: 1; left: 675px; top: 190px; position: absolute; height: 200px; width: 250px;" DataSourceID="SqlDataSource3" DataTextField="PARAM_NAME" DataValueField="PARAM_ID" OnSelectedIndexChanged="ListBoxTop3_SelectedIndexChanged"></asp:ListBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" SelectCommand="SELECT [PRJ_ID], [PRJ_NAME] FROM [PROJECT]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="spMlocDropDownFromProj" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="PRJ_ID" SessionField="PRJ_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource3_Selecting" SelectCommand="spParamDropDownFromMloc" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="MLOC_ID" SessionField="MLOC_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource> 
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource4_Selecting" SelectCommand="spTopTenNoDates" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="PRJ_ID" SessionField="PRJ_ID" Type="Int32" />
            <asp:SessionParameter Name="MLOC_ID" SessionField="MLOC_ID" Type="Int32" />
            <asp:SessionParameter Name="PARAM_ID" SessionField="PARAM_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WQ_FOURConnectionString %>" OnSelecting="SqlDataSource5_Selecting" SelectCommand="spLowTenNoDates" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="PRJ_ID" SessionField="PRJ_ID" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="MLOC_ID" SessionField="MLOC_ID" Type="Int32" />
            <asp:SessionParameter DefaultValue="" Name="PARAM_ID" SessionField="PARAM_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <asp:Label ID="Label1" runat="server" Text="Start Date (mm/dd/yyyy)" Style="z-index: 1; left: 375px; top: 400px; position: absolute; height: 25px; width: 234px;" Visible="False"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="End Date (mm/dd/yyyy)" Style="z-index: 1; left: 675px; top: 400px; position: absolute; height: 25px; width: 200px;" Visible="False"></asp:Label>
    <asp:Calendar ID="Calendar1" runat="server" Style="z-index: 1; left: 375px; top: 450px; position: absolute;" Visible="False"></asp:Calendar>
    <asp:Calendar ID="Calendar2" runat="server" Style="z-index: 1; left: 675px; top: 450px; position: absolute;" Visible="False"></asp:Calendar>
    <asp:TextBox ID="TextBox1" runat="server" Style="z-index: 1; left: 375px; top: 425px; position: absolute;" Visible="False"></asp:TextBox>
    <asp:TextBox ID="TextBox2" runat="server" Style="z-index: 1; left: 675px; top: 425px; position: absolute;" Visible="False"></asp:TextBox>
    </ContentTemplate>
    </asp:UpdatePanel>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:Button ID="GetTopTen" runat="server" Text="Highest Measurements" OnClick="GetTopTen_Click" Width="250px" />
            <br />
    <asp:Button ID="GetLowTen" runat="server" Text="Lowest Measurements" OnClick="GetLowTen_Click" Height="29px" Width="251px" />
            <br />
            <br />
            <asp:Button ID="Dates" runat="server" Text="Refine by Dates" OnClick="Dates_Click" />
            <br /><br /><br /><br /><br /><br />
            <asp:Label ID="Label3" runat="server" Text="Highest Ten Measurements" Visible="False"></asp:Label>
            <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" Enabled="False" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="RES_MEASURE" HeaderText="RES_MEASURE" SortExpression="RES_MEASURE" />
            <asp:BoundField DataField="UNIT" HeaderText="UNIT" SortExpression="UNIT" />
            <asp:BoundField DataField="PARAM_NAME" HeaderText="PARAM_NAME" SortExpression="PARAM_NAME" />
            <asp:BoundField DataField="RES_DATE_TIME" HeaderText="RES_DATE_TIME" SortExpression="RES_DATE_TIME" />
            <asp:BoundField DataField="MLOC_NAME" HeaderText="MLOC_NAME" SortExpression="MLOC_NAME" />
            <asp:BoundField DataField="PRJ_NAME" HeaderText="PRJ_NAME" SortExpression="PRJ_NAME" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
            <br /><br />
            <asp:Label ID="Label4" runat="server" Text="Smallest Ten Measurements" Visible="False"></asp:Label>
            <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" Enabled="False" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="RES_MEASURE" HeaderText="RES_MEASURE" SortExpression="RES_MEASURE" />
            <asp:BoundField DataField="UNIT" HeaderText="UNIT" SortExpression="UNIT" />
            <asp:BoundField DataField="PARAM_NAME" HeaderText="PARAM_NAME" SortExpression="PARAM_NAME" />
            <asp:BoundField DataField="RES_DATE_TIME" HeaderText="RES_DATE_TIME" SortExpression="RES_DATE_TIME" />
            <asp:BoundField DataField="MLOC_NAME" HeaderText="MLOC_NAME" SortExpression="MLOC_NAME" />
            <asp:BoundField DataField="PRJ_NAME" HeaderText="PRJ_NAME" SortExpression="PRJ_NAME" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
