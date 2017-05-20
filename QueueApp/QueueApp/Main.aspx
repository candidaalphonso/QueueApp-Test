<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="QueueApp.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <script src="Javascript.js"></script>
   <%-- <script>
        function GetValue(obj) {
            document.getElementById("hdnType").value = document.getElementById(obj.id).value;
        }
    </script>--%>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
</head>
<body>
    <h3>
        <center>Queue App</center>
    </h3>
    <form id="form1" runat="server">
        <div style="float: left; width: 50%;">
            <table>
                <tr>
                    <td class="header"><b>New Customer</b></td>
                </tr>
                <tr>
                    <td><b>Services</b></td>

                </tr>
                <tr>
                    <td>
                        <asp:RadioButtonList CssClass="radio" BorderStyle="None" runat="server" ID="rdbServices">
                            <asp:ListItem Selected="True" Value="Housing" Text="Housing"></asp:ListItem>
                            <asp:ListItem Value="Benefits" Text="Benefits"></asp:ListItem>
                            <asp:ListItem Value="Council Tax" Text="Council Tax"></asp:ListItem>
                            <asp:ListItem Value="Fly-tipping" Text="Fly-tipping"></asp:ListItem>
                            <asp:ListItem Value="Missed Bin" Text="Missed Bin"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>

                        <div class="buttondiv">
                            <asp:Button ID="btnCitizen" ForeColor="White" OnClick="btnCitizen_Click" CssClass="button" OnClientClick="GetValue(this);" runat="server" Text="Citizen" />
                            <asp:Button ID="btnOrganisation" OnClick="btnOrganisation_Click" ForeColor="White" CssClass="button" OnClientClick="GetValue(this);" runat="server" Text="Organisation" />
                            <asp:Button ID="btnAnonymous" OnClick="btnAnonymous_Click" ForeColor="White" CssClass="button" OnClientClick="GetValue(this);" runat="server" Text="Anonymous" />
                        </div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <b>
                            <asp:Label runat="server" ID="lblTitle" Text="Title"></asp:Label></b><br />
                        <asp:DropDownList runat="server" Width="91%" ID="drpTitle">
                            <asp:ListItem Text="Mr." Value="Mr." Selected="True">Mr.</asp:ListItem>
                            <asp:ListItem  Text="Mrs." Value="Mrs.">Mrs.</asp:ListItem>
                            <asp:ListItem Text="Miss." Value="Miss.">Miss.</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>
                            <asp:Label runat="server" ID="lblFname" Text="First Name"></asp:Label></b><br />
                        <asp:TextBox ID="txtFname" placeholder="First Name" Width="90%" CausesValidation="true" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFname"  ValidationGroup="validate" runat="server" ControlToValidate="txtFname" SetFocusOnError="true" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>
                            <asp:Label runat="server" ID="lblLname" Text="Last Name"></asp:Label></b><br />
                        <asp:TextBox ID="txtLname" placeholder="Last Name" Width="90%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLname"  ValidationGroup="validate"  runat="server" ControlToValidate="txtLname" SetFocusOnError="true" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnSubmit" CssClass="button"  ValidationGroup="validate" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                    </td>
                </tr>
            </table>

        </div>
        <div style="float: left; width: 50%;">
            <table>
                <tr>
                    <td class="header"><b>New Customer</b></td>
                </tr>
                <tr>
                    <td>List of the customers being queued</td>

                </tr>
                <tr>
                    <asp:GridView ID="grdQueue"  HeaderStyle-HorizontalAlign="Left" GridLines="Horizontal" EmptyDataText="No records"  runat="server">
                    </asp:GridView>
                </tr>
            </table>
            <asp:HiddenField ID="hdnType" runat="server" />
        </div>
    </form>
</body>
</html>
