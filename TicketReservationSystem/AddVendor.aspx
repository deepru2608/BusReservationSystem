<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddVendor.aspx.cs" Inherits="TicketReservationSystem.AddVendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="container mt-5">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center mb-2">
                    <h3><span class="text-primary border-bottom">Add New Vendor</span></h3>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Vendor Name</label>
                        <asp:TextBox ID="txtVendorName" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVVendorName" runat="server" ControlToValidate="txtVendorName"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Vendor Email</label>
                        <asp:TextBox ID="txtVendorEmail" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVVendorEmail" runat="server" ControlToValidate="txtVendorEmail"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Vendor Mobile Number</label>
                        <asp:TextBox ID="txtVendorMobile" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVVendorMobile" runat="server" ControlToValidate="txtVendorMobile"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Text="Select Gender" Value="0" />
                            <asp:ListItem Text="Male" Value="Male" />
                            <asp:ListItem Text="Female" Value="Female" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVGender" runat="server" ControlToValidate="ddlGender"
                            ErrorMessage="Please select gender" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" InitialValue="Select Gender">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-sm-12 text-center mt-2 mb-3">
                    <asp:Button ID="btnAddNewVendor" Text="Add New Bus" runat="server" CssClass="btn btn-sm btn-primary" OnClick="btnAddNewVendor_Click" />
                </div>
            </div>

            <asp:Panel ID="PanelIdPassword" runat="server" CssClass="mb-3">
                <div class="row">
                    <div class="col-sm-12 text-center mb-2">
                        <h3><span class="text-primary border-bottom">Id and Password Details</span></h3>
                    </div>
                    <div class="col-sm-12 text-center">
                        <span>
                            Email Id : <asp:Label ID="lblShowEmail" runat="server" CssClass="text-success"></asp:Label><br />
                            Password : <asp:Label ID="lblShowPassword" runat="server" CssClass="text-success"></asp:Label>
                        </span>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
