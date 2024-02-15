using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        private static double TotalPrice;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Db.conn.Open();
                Response.Write("Connection open");

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
                    Response.Write("Connection closed");

                }
            }
        }

        protected void ShowDetails(object sender, EventArgs e)
        {
            ProductId = CarModels.SelectedItem.Value;
            Response.Write(ProductId);
            string htmlContent = "";

            try
            {
                Db.conn.Open();
                Response.Write("Connection open");
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
                        htmlContent += $@"<div class=""card"">
                                        <img class=""card-img-top"" src=""{dataReader["Image"]}"" alt=""{dataReader["Marca"]} {dataReader["Modello"]}"">
                                        <div class=""card-body"">
                                            <h5 class=""card-title"">{dataReader["Marca"]} {dataReader["Modello"]}</h5>
                                            <p class=""card-text"">A partire da: {Math.Round(double.Parse(dataReader["PrezzoBase"].ToString()), 2)} €</p>
                                            <a href=""#"" class=""btn btn-primary"">Go somewhere</a>
                                        </div>
                                    </div>";

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
                    Response.Write("Connection closed");
                }
            }
        }
    }
}