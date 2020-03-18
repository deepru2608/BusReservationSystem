<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddBus.aspx.cs" Inherits="TicketReservationSystem.AddBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="container mt-5">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h3><span class="text-primary border-bottom">Add New Bus</span></h3>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Bus Name</label>
                        <asp:TextBox ID="txtBusName" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVBusName" runat="server" ControlToValidate="txtBusName"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Bus Price</label>
                        <asp:TextBox ID="txtBusPrice" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVBusPrice" runat="server" ControlToValidate="txtBusPrice"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Seats Capability</label>
                        <asp:TextBox ID="txtSeats" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVSeats" runat="server" ControlToValidate="txtSeats"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-sm-12 text-center mt-2 mb-3">
                    <asp:Button ID="btnAddNewBus" Text="Add New Bus" runat="server" CssClass="btn btn-sm btn-primary" OnClick="btnAddNewBus_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
