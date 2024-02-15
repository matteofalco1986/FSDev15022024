<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Week15_Lezione4_Esercitazione.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="CarModels" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ShowDetails">
        <asp:ListItem>Scegli un modello</asp:ListItem>
    </asp:DropDownList>
    <div id="CarDetails" runat="server">

    </div>
</asp:Content>
