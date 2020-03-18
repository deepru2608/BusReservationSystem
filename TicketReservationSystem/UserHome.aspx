<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="TicketReservationSystem.UserHome1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="container mt-5">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center">
                    Hello
                    <asp:Label ID="lblName" runat="server" CssClass="text-success"></asp:Label>, Welcome to online bus reservation system
                </div>

                <div class="col-sm-12 text-center mt-3">
                    <span class="text-primary border-bottom">Ticket Booking History</span>
                </div>
                <div class="col-lg-12 col-md-12 mt-1 table-responsive">
                    <asp:Repeater ID="TicketRepeater" runat="server" OnItemDataBound="TicketRepeater_ItemDataBound" OnItemCommand="TicketRepeater_ItemCommand">
                        <HeaderTemplate>
                            <table class="table table-hover table-responsive" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th scope="col">S No.</th>
                                        <th scope="col">Passenger Id</th>
                                        <th scope="col">Ticket Id</th>
                                        <th scope="col">Source</th>
                                        <th scope="col">Destination</th>
                                        <th scope="col">Journey Date</th>
                                        <th scope="col">Return Date</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">No.of Passenger</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                                <td>
                                    <asp:Label ID="lblCount" runat="server" Text='<%#Container.ItemIndex + 1 %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblPassId" runat="server" Text='<%#Eval("P_No") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblTicketId" runat="server" Text='<%#Eval("T_No") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblSource" runat="server" Text='<%#Eval("Source") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDestination" runat="server" Text='<%#Eval("Destination") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblJourneyDate" runat="server" Text='<%#Eval("JourneyDate") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblReturnDate" runat="server" Text='<%#Eval("ReturnDate") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("T_Amount") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblNoofPassenger" runat="server" Text='<%#Eval("NoOfPassenger") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Booking_Status") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="btnPrintOrCancel" runat="server" Text="Print Receipt" CssClass="btn btn-sm btn-primary" CommandName="SingleProcess"
                                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "P_No") %>' />
                                </td>
                            </tbody>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
