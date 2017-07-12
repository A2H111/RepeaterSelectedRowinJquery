<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepeaterExample.aspx.cs" Inherits="RepeaterSelectedRowJquery.RepeaterExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-3.0.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //Attach change event to radiobuttonlist controls
            $("input:radio").change(function (obj) {
                //Get the selected radiobutton value
                var type = $.trim($(this).val());
                //check if value selected is equal to Yes
                if (type == "Yes") {
                    //find the textbox control based on selected radiobutton control
                    //Use the props to enable and disable the textbox control
                    $(this).closest(".container").find(".txtbox").prop("disabled", false);
                }
                else
                    $(this).closest(".container").find(".txtbox").prop("disabled", true);
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td class="container">
                                <asp:RadioButtonList ID="rblIssues" runat="server" RepeatDirection="Horizontal" TextAlign="Right">
                                    <asp:ListItem Text="Yes" />
                                    <asp:ListItem Text="No" />
                                </asp:RadioButtonList><br />
                                <asp:TextBox ID="txtOnwerName" CssClass="txtbox" Enabled="false" runat="server" Text="Sample Value"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdventureWorksConnectionString %>"
                SelectCommand="SELECT Top 10 [FirstName], [LastName] FROM [DimCustomer]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
