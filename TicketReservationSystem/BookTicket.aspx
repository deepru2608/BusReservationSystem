<%@ Page Title="" Language="C#" MasterPageFile="~/VendorMsater.Master" AutoEventWireup="true" CodeBehind="BookTicket.aspx.cs" Inherits="TicketReservationSystem.BookTicket" %>

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
    <div class="container mt-4">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center mb-2">
                    <h3><span class="text-primary border-bottom">Book New Ticket</span></h3>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label>Select Bus</label>
                        <asp:DropDownList ID="ddlBusDetails" runat="server" CssClass="form-control form-control-sm"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RFVBusDetails" runat="server" ControlToValidate="ddlBusDetails"
                            ErrorMessage="Please select any bus" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" InitialValue="Select Bus">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="txtJourneyDate">Journey Date</label>
                        <asp:TextBox ID="txtJourneyDate" runat="server" oncopy="return false" onpaste="return false" oncut="return false" PlaceHolder="MM/DD/YYYY"
                            required="" class="form-control form-control-sm" AutoCompleteType="Disabled"></asp:TextBox>
                        <Ajax:CalendarExtender ID="CalJourneyDate" runat="server" CssClass="cal_Theme1" FirstDayOfWeek="Default" Format="dd-MMM-yyyy" PopupPosition="TopRight"
                            TargetControlID="txtJourneyDate"></Ajax:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RFVJourneyDate" runat="server" ControlToValidate="txtJourneyDate"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="txtReturnDate">Return Date</label>
                        <asp:TextBox ID="txtReturnDate" runat="server" oncopy="return false" onpaste="return false" oncut="return false" PlaceHolder="MM/DD/YYYY"
                            required="" class="form-control form-control-sm" AutoCompleteType="Disabled"></asp:TextBox>
                        <Ajax:CalendarExtender ID="CalReturnDate" runat="server" CssClass="cal_Theme1" FirstDayOfWeek="Default" Format="dd-MMM-yyyy" PopupPosition="TopRight"
                            TargetControlID="txtReturnDate"></Ajax:CalendarExtender>
                    </div>
                </div>
                <div class="col-sm-12 text-center">
                    <asp:Button ID="btnCheck" runat="server" Text="Check Availability" CssClass="btn btn-sm btn-primary" OnClick="btnCheck_Click" />
                </div>
            </div>


            <asp:Panel ID="PanelAvailableStatus" runat="server" CssClass="mt-4">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h4><span class="text-primary border-bottom">Status on Journey Date</span></h4>
                    </div>
                    <div class="col-md-8 text-center offset-md-2">
                        Total Seats : <asp:Label id="lblTotalSeats" runat="server" CssClass="text-primary" />
                        Booked Seats : <asp:Label id="lblBookedSeats" runat="server" CssClass="text-primary" />
                        Available Seats : <asp:Label id="lblAvailableSeats" runat="server" CssClass="text-primary" />
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-12 text-center">
                        <h4><span class="text-primary border-bottom">Status on Return Date</span></h4>
                    </div>
                    <div class="col-md-8 text-center offset-md-2">
                        Total Seats : <asp:Label id="lblTotalSeatsReturn" runat="server" CssClass="text-primary" />
                        Booked Seats : <asp:Label id="lblBookedSeatsReturn" runat="server" CssClass="text-primary" />
                        Available Seats : <asp:Label id="lblAvailableSeatsReturn" runat="server" CssClass="text-primary" />
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-sm-12 text-center">
                        <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="btn btn-sm btn-primary" OnClick="btnBookNow_Click" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
