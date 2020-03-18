<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PessengerDetails.aspx.cs" Inherits="TicketReservationSystem.PessengerDetails" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="Ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /*Calendar Control CSS*/
        .cal_Theme1 .ajax__calendar_container {
            background-color: #DEF1F4;
            border: solid 1px #77D5F7;
            width: 200px;
        }

        .cal_Theme1 .ajax__calendar_header {
            background-color: #ffffff;
            margin-bottom: 4px;
        }

        .cal_Theme1 .ajax__calendar_title,
        .cal_Theme1 .ajax__calendar_next,
        .cal_Theme1 .ajax__calendar_prev {
            color: #004080;
            padding-top: 3px;
        }

        .cal_Theme1 .ajax__calendar_body {
            background-color: #ffffff;
            border: solid 1px #77D5F7;
        }

        .cal_Theme1 .ajax__calendar_dayname {
            text-align: center;
            font-weight: bold;
            margin-bottom: 4px;
            margin-top: 2px;
            color: #004080;
        }

        .cal_Theme1 .ajax__calendar_day {
            color: #004080;
            text-align: center;
        }

        .cal_Theme1 .ajax__calendar_hover .ajax__calendar_day,
        .cal_Theme1 .ajax__calendar_hover .ajax__calendar_month,
        .cal_Theme1 .ajax__calendar_hover .ajax__calendar_year,
        .cal_Theme1 .ajax__calendar_active {
            color: #004080;
            font-weight: bold;
            background-color: #DEF1F4;
        }

        .cal_Theme1 .ajax__calendar_today {
            font-weight: bold;
        }

        .cal_Theme1 .ajax__calendar_other,
        .cal_Theme1 .ajax__calendar_hover .ajax__calendar_today,
        .cal_Theme1 .ajax__calendar_hover .ajax__calendar_title {
            color: #bbbbbb;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>
    <div class="container mt-5">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <span class="text-primary border-bottom">Passenger Report</span>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="txtDateFrom">Date From</label>
                        <asp:TextBox ID="txtDateFrom" runat="server" oncopy="return false" onpaste="return false" oncut="return false" PlaceHolder="MM/DD/YYYY"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <Ajax:CalendarExtender ID="CalDateFrom" runat="server" CssClass="cal_Theme1" FirstDayOfWeek="Default" Format="dd-MMM-yyyy" PopupPosition="TopRight"
                            TargetControlID="txtDateFrom"></Ajax:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RFVDateFrom" runat="server" ControlToValidate="txtDateFrom"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="txtDateTo">Date To</label>
                        <asp:TextBox ID="txtDateTo" runat="server" oncopy="return false" onpaste="return false" oncut="return false" PlaceHolder="MM/DD/YYYY"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <Ajax:CalendarExtender ID="CalDateTo" runat="server" CssClass="cal_Theme1" FirstDayOfWeek="Default" Format="dd-MMM-yyyy" PopupPosition="TopRight"
                            TargetControlID="txtDateTo"></Ajax:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RFVDateTo" runat="server" ControlToValidate="txtDateTo"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-12 text-center mt-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-sm btn-primary" OnClick="btnSearch_Click" />
                </div>
            </div>

            <asp:Panel ID="PanelDetails" runat="server">
                <div class="col-lg-12 col-md-12 mt-1 table-responsive">
                    <asp:Repeater ID="PassengerRepeater" runat="server" OnItemDataBound="PassengerRepeater_ItemDataBound">
                        <HeaderTemplate>
                            <table class="table table-hover table-responsive" style="width: 100%">
                                <thead>
                                    <tr>
                                        <th scope="col">S No.</th>
                                        <th scope="col">Passenger Id</th>
                                        <th scope="col">Ticket Id</th>
                                        <th scope="col">Source</th>
                                        <th scope="col">Destination</th>
                                        <th scope="col">Booking Date</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">No.of Passenger</th>
                                        <th scope="col">Status</th>
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
                                    <asp:Label ID="lblBookingDate" runat="server" Text='<%#Eval("Booking_Date") %>'></asp:Label>
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
                            </tbody>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
