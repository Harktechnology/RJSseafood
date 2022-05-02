using BillManagement.BussinessObjects;
using ISCLibrary.DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using static BillManagement.BusinessLogic.CredentialLogics;

namespace BillManagement.BusinessLogic
{
    public class EmployeeDTO
    {
        public static string GetInvoicelst(INvoiceFilterfilter List, string connection)
        
        {
            DataSet ds = new DataSet();
            Common _objCommon = new Common();
            string Strresult = string.Empty;
            try
            {
                int clientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                int accountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                SqlParameter[] sqlParam = {

                     new SqlParameter("@start", SqlDbType.Int) { Value = List.Start },
                     new SqlParameter("@skip", SqlDbType.Int) { Value = List.Skip },
                     new SqlParameter("@orderby", SqlDbType.VarChar) { Value = List.OrderBy },
                   new SqlParameter("@clientID", SqlDbType.Int) { Value = clientID },
                   //  new SqlParameter("@emp_name", SqlDbType.VarChar) { Value = List.EMP_NAME },              
                   //  new SqlParameter("@designation", SqlDbType.VarChar) { Value = List.DESIGNATION },
                   //   new SqlParameter("@dob", SqlDbType.VarChar) { Value = List.DOB },
                   //  new SqlParameter("@email", SqlDbType.VarChar) { Value = List.EMAIL },
                  

                   //new SqlParameter("@address", SqlDbType.VarChar) { Value = List.ADDRESS },

                   //  new SqlParameter("@contact_no", SqlDbType.VarChar) { Value = List.CONTACT_NO },


                      //new SqlParameter("@vendor", SqlDbType.NVarChar) { Value = List.Vendor },
                      //new SqlParameter("@dueindays", SqlDbType.NVarChar) { Value = List.Dueinday },
                      //new SqlParameter("@duefrom", SqlDbType.NVarChar) { Value = List.Duefrom },
                      //new SqlParameter("@dueTo", SqlDbType.NVarChar) { Value = List.Dueto },
                      //new SqlParameter("@from", SqlDbType.NVarChar) { Value = List.From },
                      //new SqlParameter("@to", SqlDbType.NVarChar) { Value = List.To },
                      //new SqlParameter("@approvalstatus", SqlDbType.NVarChar) { Value = List.Approvalstatus },
                      //new SqlParameter("@paymentstatus", SqlDbType.NVarChar) { Value = List.Paymentstatus },
                 };
                ds = SqlQueryExecutor.ExecuteStoredProcedure("SP_InvoiceEmployeelist300", sqlParam, connection);
                foreach (DataTable table in ds.Tables)
                {
                    if (table.Rows.Count > 0)
                    {
                        table.TableName = Convert.ToString(table.Rows[0]["TableName"]);
                    }
                }
                Strresult = _objCommon.DataSetToStringWithTableName(ds);
            }
            catch (Exception ex)
            {

            }
            return Strresult;
        }
        public static string FetchCustomerInfoScreenData(int EMP_ID, string connection)
        {
            DataSet ds = new DataSet();
            Common _objCommon = new Common();
            string Strresult = string.Empty;
            try
            {
                int ClientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                int UserRoleId = Convert.ToInt32(HttpContext.Current.Session["Role"].ToString());

                SqlParameter[] sqlParam = {
                    new SqlParameter("@EMP_ID", SqlDbType.Int) { Value = EMP_ID },
                    new SqlParameter("@clientID", SqlDbType.Int) { Value = ClientID }
               };
                ds = SqlQueryExecutor.ExecuteStoredProcedure("SP_GetCustomerInfo", sqlParam, connection);

                if (ds.Tables.Count > 0)
                {
                    foreach (DataTable table in ds.Tables)
                    {
                        if (table.Rows.Count > 0)
                        {
                            table.TableName = Convert.ToString(table.Rows[0]["TableName"]);
                        }
                    }
                    Strresult = _objCommon.DataSetToStringWithTableName(ds);
                }

            }
            catch (Exception ex)
            {

            }
            return Strresult;
        }

        public static int NotesInsert(string Notes, int EMP_ID, string connection)
        {
            int PostStatus = 0;

            try
            {
                int ClientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                int AccountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                SqlParameter[] sqlActionsParameter =
                                   {
                                     new SqlParameter("@EMP_ID", SqlDbType.Int) { Value = EMP_ID },
                                     new SqlParameter("@clientID", SqlDbType.Int) { Value = ClientID },
                                     new SqlParameter("@notes", SqlDbType.NVarChar) { Value = Notes },
                                      new SqlParameter("@createdBy", SqlDbType.Int) { Value = AccountID },
                                      new SqlParameter("@retVal", SqlDbType.Int) { Value = 0 },

                            };
                PostStatus = SqlQueryExecutor.ExecuteWriteStoredProcedure("SP_InsertCustomer360Notes", sqlActionsParameter, connection);
            }
            catch (Exception ex)
            {
                PostStatus = 0;
                throw ex;
            }
            return PostStatus;
        }

        public static int NotesUpdate(string Notes, int EMP_ID, int notesId, string connection)
        {
            int PostStatus = 0;

            try
            {
                int ClientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                int AccountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                SqlParameter[] sqlActionsParameter =
                                   {
                                     new SqlParameter("@custmerID", SqlDbType.Int) { Value = EMP_ID },
                                     new SqlParameter("@clientID", SqlDbType.Int) { Value = ClientID },
                                     new SqlParameter("@notes", SqlDbType.NVarChar) { Value = Notes },
                                      new SqlParameter("@updatedBy", SqlDbType.Int) { Value = AccountID },
                                      new SqlParameter("@notesID", SqlDbType.Int) { Value = notesId },

                            };
                PostStatus = SqlQueryExecutor.ExecuteWriteStoredProcedure("SP_UpdateCustomer360Note", sqlActionsParameter, connection);
            }
            catch (Exception ex)
            {
                PostStatus = 0;
                throw ex;
            }
            return PostStatus;
        }

        public static int InsertDocument(CustomerDocument documentObj, string connection)
        {
            int PostStatus = 0;

            try
            {
                int ClientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                int AccountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                SqlParameter[] sqlActionsParameter =
                                   {
                                     new SqlParameter("@clientID", SqlDbType.Int) { Value = ClientID },
                                     new SqlParameter("@fileName", SqlDbType.NVarChar) { Value = documentObj.FileName },
                                     new SqlParameter("@lastModified", SqlDbType.NVarChar) { Value = documentObj.LastModifiedBy },
                                     new SqlParameter("@fileModifiedName", SqlDbType.NVarChar) { Value = documentObj.FileModifiedName },
                                     new SqlParameter("@createdBy", SqlDbType.Int) { Value =AccountID },
                                      //new SqlParameter("@EMP_ID", SqlDbType.Int) { Value =documentObj.Em},
                                      new SqlParameter("@retVal", SqlDbType.Int) { Value = 0 }
                            };
                PostStatus = SqlQueryExecutor.ExecuteWriteStoredProcedure("EMPLOYEE1", sqlActionsParameter, connection);
            }
            catch (Exception ex)
            {
                PostStatus = 0;
                throw ex;
            }
            return PostStatus;
        }

        public static int InsertContact(Customercontact ContactObj, string connection)
        {
            int PostStatus = 0;

            try
            {
                int ClientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                int AccountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                SqlParameter[] sqlActionsParameter =
                                   {
                                     new SqlParameter("@firstName", SqlDbType.NVarChar) { Value = ContactObj.FirstName },
                                     new SqlParameter("@lastName", SqlDbType.NVarChar) { Value = ContactObj.LastName },
                                     new SqlParameter("@email", SqlDbType.NVarChar) { Value = ContactObj.Email },
                                     new SqlParameter("@phoneNumber", SqlDbType.NVarChar) { Value = ContactObj.Phone },
                                     new SqlParameter("@createdBy", SqlDbType.Int) { Value = AccountID },
                                     //new SqlParameter("@EMP_ID", SqlDbType.Int) { Value = ContactObj.EMP_ID },
                                     new SqlParameter("@clientID", SqlDbType.Int) { Value = ClientID },
                                      new SqlParameter("@retVal", SqlDbType.Int) { Value = 0 }
                            };
                PostStatus = SqlQueryExecutor.ExecuteWriteStoredProcedure("SP_InsertCustomer360Contact", sqlActionsParameter, connection);
            }
            catch (Exception ex)
            {
                PostStatus = 0;
                throw ex;
            }
            return PostStatus;
        }
        public static int DeleteContact(Customercontact ContactObj, string connection)
        {
            int PostStatus = 0;

            try
            {
                int ClientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                int AccountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                SqlParameter[] sqlActionsParameter =
                                   {
                                     //new SqlParameter("@EMP_ID", SqlDbType.Int) { Value = ContactObj.EMP_ID },
                                     new SqlParameter("@clientID", SqlDbType.Int) { Value = ClientID },
                                     new SqlParameter("@contactID", SqlDbType.Int) { Value = ContactObj.ContactID },

                            };
                PostStatus = SqlQueryExecutor.ExecuteWriteStoredProcedure("SP_DeleteCustomer360Contact", sqlActionsParameter, connection);
            }
            catch (Exception ex)
            {
                PostStatus = 0;
                throw ex;
            }
            return PostStatus;
        }
        public static int UpdateContact(Customercontact ContactObj, string connection)
        {
            int PostStatus = 0;

            try
            {
                int ClientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                int AccountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                SqlParameter[] sqlActionsParameter =
                                   {
                                     new SqlParameter("@firstName", SqlDbType.NVarChar) { Value = ContactObj.FirstName },
                                     new SqlParameter("@lastName", SqlDbType.NVarChar) { Value = ContactObj.LastName },
                                     new SqlParameter("@email", SqlDbType.NVarChar) { Value = ContactObj.Email },
                                     new SqlParameter("@phoneNumber", SqlDbType.NVarChar) { Value = ContactObj.Phone },
                                     new SqlParameter("@updatedBy", SqlDbType.Int) { Value = AccountID },
                                     //new SqlParameter("@EMP_ID", SqlDbType.Int) { Value = ContactObj.EMP_ID },
                                     new SqlParameter("@clientID", SqlDbType.Int) { Value = ClientID },
                                     new SqlParameter("@contactID", SqlDbType.Int) { Value = ContactObj.ContactID },
                            };
                PostStatus = SqlQueryExecutor.ExecuteWriteStoredProcedure("SP_UpdateCustomer360Contact", sqlActionsParameter, connection);
            }
            catch (Exception ex)
            {
                PostStatus = 0;
                throw ex;
            }
            return PostStatus;
        }

        public static DataSet GetGetBillListData(string EMP_ID, string connection)
        {
            DataSet ds = new DataSet();
            try
            {
                int AccountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                int UserRoleId = Convert.ToInt32(HttpContext.Current.Session["Role"].ToString());
                int clientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                SqlParameter[] sqlParam = {
                new SqlParameter("@EMP_ID", SqlDbType.NVarChar) { Value = EMP_ID },
                new SqlParameter("@clientID", SqlDbType.NVarChar) { Value = clientID }
               };
                ds = SqlQueryExecutor.ExecuteStoredProcedure("SP_GetCustomerDetails", sqlParam, connection);
            }
            catch (Exception ex)
            {

            }
            return ds;
        }

        public static DataSet GetInvoiceData(string connection)
        {
            DataSet ds = new DataSet();
            try
            {
                int AccountID = Convert.ToInt32(HttpContext.Current.Session["AccountID"].ToString());
                int UserRoleId = Convert.ToInt32(HttpContext.Current.Session["Role"].ToString());
                int clientID = Convert.ToInt32(HttpContext.Current.Session["ClientID"].ToString());
                SqlParameter[] sqlParam = {
                    new SqlParameter("@clientID", SqlDbType.Int) { Value = clientID }
               };
                ds = SqlQueryExecutor.ExecuteStoredProcedure("SP_GetInvoice360KPIDataList", sqlParam, connection);
            }
            catch (Exception ex)
            {

            }
            return ds;
        }
    }
}
