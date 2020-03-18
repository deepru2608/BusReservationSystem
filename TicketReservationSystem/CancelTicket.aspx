<%@ Page Title="" Language="C#" MasterPageFile="~/UserMsater.Master" AutoEventWireup="true" CodeBehind="CancelTicket.aspx.cs" Inherits="TicketReservationSystem.CancelTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .rightAlign {
            text-align: right;
        }

        .leftAlign {
            text-align: left;
        }

        .button {
            background-color: #0A79DF;
            border-radius: 6px;
            border: 1px solid;
            margin-left: 40px;
            margin-top: 40px;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            width: 150px;
            height: 35px;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
        }

            .button:hover {
                color: #0A79DF;
                background-color: white;
                font-size: 15px;
                border: 1px solid #0A79DF;
            }

        .container {
            margin-left: 8%;
            margin-right: 8%;
        }

        .tableAlign {
            width: 100%;
        }

        .contentSize {
            font-size: 20px;
        }

        .rowPadding {
            padding-bottom: 10px;
        }

        .thHeading {
            font-size: 20px;
        }

        .thHeading1 {
            font-size: 21px;
        }

        .rowWidth {
            width: 50%;
        }

        .agreeSummary {
            font-size: 18px;
            padding-top: 40px;
        }

        .auto-style1 {
            text-align: right;
            height: 20px;
        }

        .tableBorder {
            border-bottom: 1px solid #E0E0E0;
        }

        .tableBorderBoth {
            border-bottom: 1px solid #E0E0E0;
            border-top: 1px solid #E0E0E0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
    <asp:ScriptManager ID="SM" runat="server"></asp:ScriptManager>
    <div class="container mt-4">
        <div class="jumbotron-fluid">
            <div class="row">
                <div class="col-sm-12 text-center mb-2">
                    <h3><span class="text-primary border-bottom">Cancel Ticket</span></h3>
                </div>
                <div class="col-sm-3 offset-md-3">
                    <div class="form-group">
                        <label>Ticked Id</label>
                        <asp:TextBox ID="txtTicketId" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVTicketId" runat="server" ControlToValidate="txtTicketId"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label>Passenger Id</label>
                        <asp:TextBox ID="txtPassId" runat="server" oncopy="return false" onpaste="return false" oncut="return false"
                            required="" class="form-control form-control-sm"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVPassId" runat="server" ControlToValidate="txtPassId"
                            ErrorMessage="This field is required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-12 text-center mt-2">
                    <asp:Button ID="btnCheck" Text="Check" runat="server" CssClass="btn btn-sm btn-primary" OnClick="btnCheck_Click" />
                </div>
            </div>

            <asp:Panel ID="PanelCancel" runat="server">
                <div class="row">
                    <div class="col-sm-12 text-center mb-1">
                        <h4><span class="text-primary border-bottom">Booking Details</span></h4>
                    </div>
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label for="lblProcessDate">Process Date : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblProcessDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblPassengerName">Passenger Name : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblPassengerName" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblAddress">Address : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblAge">Age : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblAge" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblMobile">Mobile No : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblGender">Gender : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label for="lblTicketNoAgain" class="col-form-label">Ticket No : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblTicketNoAgain" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblJourneyDate" class="col-form-label">Journey Date : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblJourneyDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblReturnDate" class="col-form-label">Return Date: </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblReturnDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblAmount" class="col-form-label">Amount : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblAmount" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblSource" class="col-form-label">Source : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblSource" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="lblDestination" class="col-form-label">Destination : </label>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblDestination" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 text-center mt-2">
                        <asp:Button ID="btnCancelNow" Text="Cancel Ticket" runat="server" CssClass="btn btn-sm btn-primary" OnClick="btnCancelNow_Click" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
