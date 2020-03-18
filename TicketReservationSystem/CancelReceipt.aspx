<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelReceipt.aspx.cs" Inherits="TicketReservationSystem.CancelReceipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PRINT RECEIPT</title>
    <link rel="icon" type="image/png" href="Image/NDMCLogo.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
</head>
<body>
    <form id="form1" runat="server">
        <div id="pnlContents" runat="server">
            <div style="text-align: center;">
                <ul style="list-style: none; padding-top: 20px;">
                    <li><h3>Online Bus Ticket Reservation System</h3></li>
                </ul>
            </div>
            <div class="container">
                <center><span class="thHeading tableBorder"><i class="border-bottom"><b>Confirmation Receipt</b></i></span></center>
                <br />

                <table class="tableAlign" style="width: 100%">
                    <%--<tr class="rowPadding">
                    <td>
                        <span class="font-weight-bold">Receipt No : <asp:Label ID="lblReceiptNo" runat="server"></asp:Label></span>
                    </td>
                </tr>--%>
                    <tr>
                        <td>
                            <span>Passenger No :
                                <asp:Label ID="lblPassNo" runat="server"></asp:Label></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>
                                Ticket No : <asp:Label ID="lblTicketNo" runat="server"></asp:Label></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>Source: </span>
                            <asp:Label ID="lblSource" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>Destination: </span>
                            <asp:Label ID="lblDestination" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="tableAlign" style="width: 100%">
                    <tr>
                        <td class="rowWidth">
                            <span class="thHeading tableBorder" style="width: 100%;"><i><b>Passenger Details</b></i></span>
                            <table class="tableAlign" style="width: 100%; margin-top: 2%">
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblProcessDate">Process Date : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblProcessDate" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblPassengerName">Passenger Name : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblPassengerName" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblAddress">Address : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblAge">Age : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblAge" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblMobile">Mobile No : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblMobile" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblGender">Gender : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblGender" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="padding-bottom: 40px; padding-top: 20px">
                            <span class="thHeading tableBorder" style="width: 100%;"><i><b>Ticket Details</b></i></span><br />
                            <table class="tableAlign" style="width: 100%; margin-top: 2%">
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblTicketNoAgain" class="col-form-label">Ticket No : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblTicketNoAgain" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblJourneyDate" class="col-form-label">Journey Date : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblJourneyDate" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblReturnDate" class="col-form-label">Return Date: </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblReturnDate" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblAmount" class="col-form-label">Amount : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblAmount" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="tableBorder">
                                        <label for="lblStatus" class="col-form-label">Status : </label>
                                    </td>
                                    <td class="rightAlign tableBorder">
                                        <asp:Label ID="lblStatus" runat="server" Text="Cancel"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                
                
                <span class="agreeSummary"><i>
                    <label>I have read the term & condition for the booking of Online Bus Reservation and I undertake to abide by them.</label></i></span><br />
                <span style="color: red; font-weight: bold"><u>Note:</u> </span><br />
                <b>(1).</b> Please carry this receipt at the time of travelling.<br />
                <object align="right">Online Receipt Generated</object><br />
                <object align="right">Date & Time :
                    <asp:Label ID="lblDateTime" runat="server"></asp:Label></object>
            </div>
        </div>
        <div class="container" style="margin-bottom: 50px; margin-top: 20px; text-align: center">
            <asp:Button ID="btnPrint" runat="server" class="button" Text="Print Receipt" OnClientClick="return PrintPanel();"></asp:Button>
            <asp:Button ID="btnBack" runat="server" CssClass="button" Text="Back" OnClick="btnBack_Click" />
        </div>

        <script>
            function PrintPanel() {
                var panel = document.getElementById("<%=pnlContents.ClientID %>");
                var printWindow = window.open('', '', 'height=700,width=900');
                printWindow.document.write('<html><head><title>DIV Contents</title>');
                printWindow.document.write('</head><body >');
                printWindow.document.write('<div width=100%>' + panel.innerHTML + '</div>');
                printWindow.document.write('</body></html>');
                printWindow.document.close();
                setTimeout(function () {
                    printWindow.print();
                }, 500);
                return false;
            }
        </script>
    </form>
</body>
</html>
