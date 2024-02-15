using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Week15_Lezione4_Esercitazione
{
    public partial class Index : System.Web.UI.Page
    {
        private static string ProductId;
        private static string GaranziaId;
        private static double CarPrice;
        private static double WarrantyPrice;
        private static double OptionalsPrice;
        private static double TotalPrice = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Db.conn.Open();

                // recuperare i dati dal database
                var cmdSelect = new SqlCommand($@"
                                                SELECT *
                                                FROM Auto", Db.conn);
                SqlDataReader dataReader = cmdSelect.ExecuteReader();


                // inizializzare la variabile htmlContent

                if (dataReader.HasRows && !IsPostBack)
                {
                    while (dataReader.Read())
                    {
                        CarModels.Items.Add(new ListItem($"{dataReader["Marca"]} {dataReader["Modello"]}", $"{dataReader["ID"]}"));
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                if (Db.conn.State == System.Data.ConnectionState.Open)
                {
                    Db.conn.Close();

                }
            }
            try
            {
                Db.conn.Open();

                // recuperare i dati dal database
                var cmdSelect = new SqlCommand($@"
                                                SELECT *
                                                FROM AnniGaranzia", Db.conn);
                SqlDataReader dataReader = cmdSelect.ExecuteReader();


                // inizializzare la variabile htmlContent

                if (dataReader.HasRows && !IsPostBack)
                {
                    while (dataReader.Read())
                    {
                        WarrantyYears.Items.Add(new ListItem($"{dataReader["ID"]} Anno - Prezzo: {Math.Round(double.Parse(dataReader["Prezzo"].ToString()), 2)}€", $"{dataReader["ID"]}"));
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                if (Db.conn.State == System.Data.ConnectionState.Open)
                {
                    Db.conn.Close();

                }
            }
            try
            {
                Db.conn.Open();

                // recuperare i dati dal database
                var cmdSelect = new SqlCommand($@"
                                                SELECT *
                                                FROM Optionals", Db.conn);
                SqlDataReader dataReader = cmdSelect.ExecuteReader();


                // inizializzare la variabile htmlContent

                if (dataReader.HasRows && !IsPostBack)
                {
                    while (dataReader.Read())
                    {
                        OptionalsList.Items.Add(new ListItem($"{dataReader["Optional"]}: {Math.Round(double.Parse(dataReader["Prezzo"].ToString()), 2)}€", $"{dataReader["ID"]}"));
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                if (Db.conn.State == System.Data.ConnectionState.Open)
                {
                    Db.conn.Close();

                }
            }
            TotalePreventivo.InnerText = $"{TotalPrice} €";
        }

        protected void ShowDetails(object sender, EventArgs e)
        {
            ProductId = CarModels.SelectedItem.Value;
            Response.Write(ProductId);
            string htmlContent = "";

            try
            {
                Db.conn.Open();
                var cmdSelect = new SqlCommand($@"
                                                SELECT *
                                                FROM Auto
                                                WHERE ID='{ProductId}'"
                                                , Db.conn);
                SqlDataReader dataReader = cmdSelect.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        htmlContent += $@"<div class=""card p-4"">
                                        <img class=""card-img-top"" src=""{dataReader["Image"]}"" alt=""{dataReader["Marca"]} {dataReader["Modello"]}"">
                                        <div class=""card-body"">
                                            <h5 class=""card-title"">{dataReader["Marca"]} {dataReader["Modello"]}</h5>
                                            <p class=""card-text"">A partire da: <strong>{Math.Round(double.Parse(dataReader["PrezzoBase"].ToString()), 2)} €</strong></p>
                                        </div>
                                    </div>";

                        CarPrice = Math.Round(double.Parse(dataReader["PrezzoBase"].ToString()), 2);
                    }
                }
                CarDetails.InnerHtml = htmlContent;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                if (Db.conn.State == System.Data.ConnectionState.Open)
                {
                    Db.conn.Close();
                }
            }
        }

        protected void AddWarranty(object sender, EventArgs e)
        {
            GaranziaId = WarrantyYears.SelectedItem.Value;
            try
            {
                Db.conn.Open();
                var cmdSelect = new SqlCommand($@"
                                                SELECT *
                                                FROM AnniGaranzia
                                                WHERE ID='{GaranziaId}'"
                                                , Db.conn);
                SqlDataReader dataReader = cmdSelect.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        WarrantyPrice = Math.Round(double.Parse(dataReader["Prezzo"].ToString()), 2);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                if (Db.conn.State == System.Data.ConnectionState.Open)
                {
                    Db.conn.Close();
                }
            }
        }
        protected void AddOptionals(object sender, EventArgs e)
        {
            OptionalsPrice = 0;
            foreach (ListItem item in OptionalsList.Items)
            {
                if (item.Selected)
                {
                    try
                    {
                        Db.conn.Open();
                        var cmdSelect = new SqlCommand($@"
                                                SELECT *
                                                FROM Optionals
                                                WHERE ID='{item.Value}'"
                                                        , Db.conn);
                        SqlDataReader dataReader = cmdSelect.ExecuteReader();
                        if (dataReader.HasRows)
                        {
                            while (dataReader.Read())
                            {
                                OptionalsPrice += Math.Round(double.Parse(dataReader["Prezzo"].ToString()), 2);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                    finally
                    {
                        if (Db.conn.State == System.Data.ConnectionState.Open)
                        {
                            Db.conn.Close();

                        }
                    }

                }
            }
        }

        protected void CalculateTotal(object sender, EventArgs e)
        {
            TotalPrice = CarPrice + WarrantyPrice + OptionalsPrice;
            TotalePreventivo.InnerText = $"{TotalPrice} €";
        }
    }
}