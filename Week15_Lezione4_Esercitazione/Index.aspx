<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Week15_Lezione4_Esercitazione.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex align-items-center">
        <h2>PREVENTIVO: </h2>
        <h2 id="TotalePreventivo" runat="server" class="ms-3">0 €</h2>
        <asp:Button ID="BtnTotale" runat="server" Text="CALCOLA PREVENTIVO" OnClick="CalculateTotal" CssClass="btn btn-danger ms-3" />
    </div>
    <div class="d-flex justify-content-center">
        <div id="CarDetails" runat="server">
        </div>

    </div>
    <div class="d-flex justify-content-between InfoCar">
        <div>
            <h3>MODELLO</h3>
            <asp:DropDownList ID="CarModels" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ShowDetails" CssClass="DropdownMenu">
                <asp:ListItem>Scegli un modello</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <h3>GARANZIA</h3>
            <asp:DropDownList ID="WarrantyYears" runat="server" AutoPostBack="true" OnSelectedIndexChanged="AddWarranty" CssClass="DropdownMenu">
                <asp:ListItem>Anni di Garanzia</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <h3>OPTIONALS</h3>
            <asp:CheckBoxList ID="OptionalsList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="AddOptionals">
            </asp:CheckBoxList>
        </div>

    </div>
</asp:Content>
