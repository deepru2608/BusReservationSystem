<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="TicketReservationSystem.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="container mt-5">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center mt-3">
                    <span class="text-primary border-bottom">Change Password</span>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Current Password</label>
                        <asp:TextBox ID="txtCurrentPassword" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVCurrentPassword" runat="server" ControlToValidate="txtCurrentPassword"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>New Password</label>
                        <asp:TextBox ID="txtNewPassword" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVNewPassword" runat="server" ControlToValidate="txtNewPassword"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="ComConfirmPassword" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword"
                            ErrorMessage="Both password should be match!" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                    </div>
                </div>

                <div class="col-sm-12 text-center mt-2 mb-3">
                    <asp:Button ID="btnChange" Text="Change Password" runat="server" CssClass="btn btn-sm btn-primary" OnClick="btnChange_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
