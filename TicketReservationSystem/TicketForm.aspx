<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMsater.Master" AutoEventWireup="true" CodeBehind="TicketForm.aspx.cs" Inherits="TicketReservationSystem.TicketForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>
    <div class="container mt-4">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Select Source</label>
                        <asp:DropDownList ID="ddlSource" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVSource" runat="server" ControlToValidate="ddlSource"
                            ErrorMessage="Please select Source location" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" InitialValue="Select Location">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Select Destination</label>
                        <asp:DropDownList ID="ddlDestination" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVDestination" runat="server" ControlToValidate="ddlDestination"
                            ErrorMessage="Please select Destination location" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" InitialValue="Select Location">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Name</label>
                        <asp:TextBox ID="txtPName" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVPName" runat="server" ControlToValidate="txtPName"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Age</label>
                        <asp:TextBox ID="txtPAge" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVPAge" runat="server" ControlToValidate="txtPAge"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Mobile</label>
                        <asp:TextBox ID="txtPMobile" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVPMobile" runat="server" ControlToValidate="txtPMobile"
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
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>No. of Passenger</label>
                        <asp:TextBox ID="txtNoOfPassenger" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVNoOfPassenger" runat="server" ControlToValidate="txtNoOfPassenger"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Address</label>
                        <asp:TextBox ID="txtPAddress" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVPAddress" runat="server" ControlToValidate="txtPAddress"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-12 text-center mt-2">
                    <asp:Button ID="btnPayNow" Text="Pay Now" runat="server" CssClass="btn btn-sm btn-primary" OnClick="btnPayNow_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
