using System;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.IO;
using Microsoft.SqlServer.Server;

public class FileExporter
{
    [SqlProcedure]
    public static void p_TDECrtDwnld(SqlString tableName, SqlString fileName, SqlString outputPath)
    {
        // Basic table name validation: alphanumeric and underscores only
        string cleanTableName = tableName.Value;
        if (System.Text.RegularExpressions.Regex.IsMatch(cleanTableName, @"^[A-Za-z0-9_]+$") == false)
        {
            throw new ArgumentException("Invalid table name.");
        }

        string query = string.Format("SELECT FileContent FROM [{0}] WHERE FileName = @FileName", cleanTableName);

        using (SqlConnection conn = new SqlConnection("context connection=true"))
        {
            conn.Open();
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@FileName", fileName.Value);
                byte[] fileBytes = cmd.ExecuteScalar() as byte[];

                if (fileBytes != null)
                {
                    File.WriteAllBytes(outputPath.Value, fileBytes);
                }
                else
                {
                    throw new Exception("No matching file found.");
                }
            }
        }
    }
}
