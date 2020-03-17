<%@ Page Title="" Language="C#" MasterPageFile="~/UserMsater.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TicketReservationSystem.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <div class="container mt-1">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center">
                    Hello <asp:Label ID="lblName" runat="server" CssClass="text-success"></asp:Label>, Welcome to online bus reservation system
                </div>
            </div>
        </div>
    </div>
</asp:Content>
