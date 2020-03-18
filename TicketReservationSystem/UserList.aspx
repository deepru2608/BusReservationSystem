<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="TicketReservationSystem.UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="container mt-5">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h3><span class="text-primary border-bottom">Registered Users</span></h3>
                </div>

                <div class="col-lg-12 col-md-12 mt-1 table-responsive">
                    <asp:Repeater ID="UsersRepeater" runat="server">
                        <HeaderTemplate>
                            <table class="table table-hover table-responsive" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th scope="col">S No.</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Mobile</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">User_Role</th>
                                    </tr>
                                </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                                <td>
                                    <asp:Label ID="lblCount" runat="server" Text='<%#Container.ItemIndex + 1 %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblPassId" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblTicketId" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblSource" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDestination" runat="server" Text='<%#Eval("Gender") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblBookingDate" runat="server" Text='<%#Eval("User_Role") %>'></asp:Label>
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
