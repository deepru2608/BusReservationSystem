<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TicketReservationSystem.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bus Ticket Reservation System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="Library/twitter-bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Library/CustomCss/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" />
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.0/css/mdb.min.css" rel="stylesheet" />
</head>
<body style="background-color: #758AA2">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SMLogin" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UP" runat="server">
            <ContentTemplate>
                <div class="box">
                    <h1>Sign In</h1>
                    <asp:TextBox ID="txtLoginEmail" runat="server" CssClass="textBoxCss" placeholder="Login Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVLoginEmail" runat="server" ControlToValidate="txtLoginEmail" SetFocusOnError="true" ErrorMessage="Email must be required"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="REVLoginEmail" runat="server" ControlToValidate="txtLoginEmail" SetFocusOnError="true" ErrorMessage="Please enter the correct email"
                        Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Login"></asp:RegularExpressionValidator>


                    <asp:TextBox ID="txtPassword" runat="server" CssClass="textBoxCss" placeholder="Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ControlToValidate="txtPassword" SetFocusOnError="true" ErrorMessage="Password must be required"
                        Display="Dynamic" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator><br />
                    <asp:CheckBox ID="cblRemember" runat="server" Text="Remember Me" class="LoginAncher" CssClass="mt-2 LoginAncher" />

                    <asp:Button ID="btnLogin" runat="server" CssClass="CustomButtom" Text="Sign In" ValidationGroup="Login" OnClick="btnLogin_Click" />
                    <p style="color: white">Don't Have an account..? <a class="LoginAncher" href="#" data-toggle="modal" 
                        data-target="#modalRegisterForm">Sign Up Here</a></p>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>



        <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header text-center" style="background-color: #2ecc71">
                        <h4 class="modal-title w-100 font-weight-bold" style="">Sign up</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <asp:UpdatePanel ID="UPRegister" runat="server">
                        <ContentTemplate>
                            <div class="modal-body mx-3">
                                <div class="md-form mb-5">
                                    <i class="fas fa-user prefix grey-text"></i>
                                    <asp:TextBox ID="txtName" runat="server" class="form-control validate" placeholder="Your Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVName" runat="server" ControlToValidate="txtName" SetFocusOnError="true" ErrorMessage="Name field must be required"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                                    <Ajax:FilteredTextBoxExtender ID="FTEName" runat="server" FilterMode="ValidChars"
                                        TargetControlID="txtName" ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz " />
                                </div>
                                <div class="md-form mb-5">
                                    <i class="fas fa-phone prefix grey-text"></i>
                                    <asp:TextBox ID="txtPhone" runat="server" class="form-control validate" placeholder="Phone"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVPhone" runat="server" ControlToValidate="txtPhone" SetFocusOnError="true" ErrorMessage="Phone number must be required"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                                    <Ajax:FilteredTextBoxExtender ID="FTEPhone" runat="server" FilterMode="ValidChars"
                                        TargetControlID="txtPhone" ValidChars="1234567890" />
                                </div>
                                <div class="md-form mb-5">
                                    <i class="fas fa-envelope prefix grey-text"></i>
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control validate" placeholder="Email Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="txtEmail" SetFocusOnError="true" ErrorMessage="Email must be required"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REVEmail" runat="server" ControlToValidate="txtEmail" SetFocusOnError="true" ErrorMessage="Please enter the correct email"
                                        Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Register"></asp:RegularExpressionValidator>
                                    <Ajax:FilteredTextBoxExtender ID="FTEEmail1" runat="server" FilterMode="ValidChars"
                                        TargetControlID="txtEmail" ValidChars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz._@1234567890" />
                                </div>
                                <div class="mb-5">
                                    <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal" CellPadding="10">
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="md-form mb-4">
                                    <i class="fas fa-lock prefix grey-text"></i>
                                    <asp:TextBox ID="txtPasswordReg" runat="server" class="form-control validate" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVPasswordReg" runat="server" ControlToValidate="txtPasswordReg" SetFocusOnError="true" ErrorMessage="Password must be required"
                                        Display="Dynamic" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnRegister" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="modal-footer d-flex justify-content-center">
                        <asp:Button ID="btnRegister" runat="server" Text="Sign up" class="CustomButtom" ValidationGroup="Register"
                            OnClick="btnRegister_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="Library/jquery/jquery.min.js"></script>
    <script src="Library/twitter-bootstrap/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.0/js/mdb.min.js"></script>
</body>
</html>
