<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="TicketReservationSystem.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="container m-5">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center">
                    Hello <asp:Label ID="lblName" runat="server" CssClass="text-success"></asp:Label>, Welcome to online bus reservation system
                </div>
            </div>
        </div>
    </div>
</asp:Content>
