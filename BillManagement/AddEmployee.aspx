<%@ Page Title="" Language="C#" MasterPageFile="~/Application.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="BillManagement.AddEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .isc-bill-trk-viw-del-sel .select2-container{
            width:100% !important;
        }
          .isc-btn-inp-typ-file-s1 {
         margin: 0px 0px 0px 0px;
         overflow: hidden;
         white-space: nowrap;
         text-overflow: ellipsis;
         padding: 6px 8px 6px 8px;
         border-radius: 3px !important;
         background-color: #00a1b7;
         text-decoration: none;
         font-size: 12px;
         cursor: pointer;
         font-weight: 400;
         color: #ffffff;
         line-height: 14px;
         text-transform: capitalize;
         position: relative;
         border: none;
         letter-spacing: 0.7px;
         -webkit-transition: background-color 0.2s ease-out;
         -moz-transition: background-color 0.2s ease-out;
         -ms-transition: background-color 0.2s ease-out;
         -o-transition: background-color 0.2s ease-out;
         transition: background-color 0.2s ease-out;
         position: relative;
         position: absolute;
         bottom: 0px;
         display:none;
         }
         .isc-org-logo-area:hover .isc-btn-inp-typ-file-s1
        {
            display:block;
        }
         .isc-app-screen-sec-container-s1 {
             padding:0px !important;
         }
        .isc-g-b {
            padding-top: 8px !important;
            padding-bottom: 8px !important;
            left: -62px;
            width: 1353px;
            position: relative;
        }

        @media only screen and (max-width: 767px) {
           .isc-g-b {
                
                left: -34px !important;
                
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     

<div class="screen-row">
        <div class="isc-app-screen-header-container" style="height: 46px;">
            <div class="div-col-30per">
                <div class="screen-row">
                    <div class="isc-page-header">
                        <i class="fa fa-plus"></i>
                        <h2 style="line-height: 30px;" id="page-Title">Add Employee</h2>
                        <h6 class="mar-none"></h6>
                    </div>
                </div>
            </div>
            <div class="div-col-70per">
                <div class="cell-right pad-rig-5 " style="margin-top: 6px;">

                    <a class="isc-theme-blue-btn isc-sav-btn" id="save-Employee"<%-- onclick="employeeUpdate()"--%>>Save</a>
                     <a class="isc-theme-blue-btn isc-sav-btn" id="update-Employee" style="display:none">Update</a>
                     <a class="isc-theme-blue-btn pad-lft-12 isc-cnl-btn" id="cancel">Cancel</a>
                </div>
                <%-- <div class="cell-right  mar-top-10">

                    <a class="isc-theme-blue-btn" href="#">Submit </a>
                </div>--%>
            </div>
        </div>
        <div class="isc-app-screen-body-container" style="height: 287px;">
            <div class="screen-row">
                <div class="isc-app-screen-sec-container-s1 ">
                     <%--<h5 class="isc-bill-trk-hdr-txt mar-bot-med  isc-new-thm-pad isc-g-b">Company Logo : </h5>--%>
                    
                    <%--<div style="position:relative" class="isc-new-thm-pad">
                        <label class="mar-top-5">Company Logo  : </label>
                        <div class="isc-org-logo-area mar-top-10"  id="file_Viewer">
                                        <h2>LOGO</h2>
                                      <span class="isc-btn-inp-typ-file-s1" style="top:126px;">Choose Company Logo

                                    <input type="file" id="browseLogo" name="filename" accept="image/gif, image/jpeg, image/png" style="width: 200px;"/>
                                                        </span>
                            </div>
                        <i class="fa fa-refresh isc-lft-icon" id="remove-Logo" title="Reset Logo" style="position:absolute;bottom:1px;cursor:pointer;"></i>
                                    </div>--%>

                     <div class="screen-row isc-new-thm-pad">
                        <div class="screen-row mar-top-15" >
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Employee Name <sup class="isc-bill-trk-sup"><i class="fa fa-star" style="font-size: 7px;"></i></sup> : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                            <input id="Emp_name" type="text" data-textbox="EmployeeName" placeholder="Employee Name" class="form-control <%--isc-exp-mang-txt-bx1--%>">
                                     <span style="color:red;display:none;" class="validation-message" id="EmployeeName-Validation" data-validation="EmployeeName">Employee Name should not be empty</span>                                  
                                    </div>
                                </div>
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5"> Designation : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                        <div class="div-col-50per">
                                                            <input id="Designation" type="text" data-textbox="EmployeeName" placeholder="Employee Name" class="form-control <%--isc-exp-mang-txt-bx1--%>">
                                     <span style="color:red;display:none;" class="validation-message" id="Designation-Validation" data-validation="EmployeeName">Desigination Name should not be empty</span>                                  
                                    </div>
                                                        </div>
                                </div>
                            </div>
                        <div class="screen-row mar-top-10">
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5"> Email Id : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                            <input type="text" id="Email" placeholder="Enter Email Id" data-Email="EmployeeEmail" class="form-control <%--isc-exp-mang-txt-bx1--%>"/>
                                        <span class="validation-message" style="display:none; color:red" error-active="false" data-validation="EmployeeEmail">Email id is not valid.</span>
                                           <span style="color:red;display:none;" class="validation-message" id="vendorEmail-Validation" data-validation="EmployeeEmail">Email should not be empty</span>              
                                         <span style="color:red;display:none;" class="validation-message" id="vendorDuplicateEmail-Validation" data-validation="EmployeeEmail">Email Id already exist,Try any other Email Id</span>          
                                                        </div>
                                </div>
                            
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Contact Number : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                            <input type="text" data-textbox="ContactNumber"  id="contact-Number" phone-Number="true"  maxlength="11"  placeholder="Enter Contact Number" class="form-control number-only<%--isc-exp-mang-txt-bx1--%>">
                                    <span style="color:red;display:none;" class="validation-message" id="ContactNumber-Validation" data-validation="ContactNumber">Contact Number should not be empty</span>                                                      
                                    </div>
                                </div>
                             <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Alternative Contact Number : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                            <input type="text" data-textbox="ContactNumber"  id="contact-Number2" phone-Number="true"  maxlength="11"  placeholder="Enter AlternativeNumber Contact Number" class="form-control number-only<%--isc-exp-mang-txt-bx1--%>">
                                    <span style="color:red;display:none;" class="validation-message" id="ContactNumber-Validation" data-validation="ContactNumber">Contact AlternativeNumber should not be empty</span>                                                      
                                    </div>
                                </div>
                            <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5"> Dob : </label>
                                                        </div>
                                     <div class="div-col-50per">
                                                            <input type="date" data-textbox=" Dob"  id="Dob"  placeholder="Enter  Dob Number" class="form-control number-only<%--isc-exp-mang-txt-bx1--%>">
                                    <span style="color:red;display:none;" class="validation-message" id="DOB" data-validation=" Dob"> Dob should not be empty</span>                                                      
                                    </div>
                                </div>
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5"> Blood Group : </label>
                                                        </div>
                                     <div class="div-col-50per">
                                                            <input type="text" data-textbox="Blood Group"  id="BloodGroup"    placeholder="Enter Blood Group" class="form-control number-only/<%--isc-exp-mang-txt-bx1--%>">                                                      
                                    </div>
                                                        </div>
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Employee Address : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                         <textarea placeholder="Enter Employee Address" id="address" rows="4" class="form-control" style="resize:none;"></textarea>
                                                        </div>
                                </div>
                                    
                            </div>
                      <%--  <div class="screen-row mar-top-10">
                            
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">City : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                            <input type="text" placeholder="Enter City" id="city" class="form-control twAlbhabets-only isc-exp-mang-txt-bx1">
                                                        </div>
                                </div>
                                
                            </div>
                        <div class="screen-row mar-top-10 mar-bot-max">
                            <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">State : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                            <input type="text" placeholder="Enter State" id="state" class="form-control twAlbhabets-only">
                                                        </div>
                                </div>
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Zip : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                            <input type="text" maxlength="10" placeholder="Enter Zip" id="zip" class="form-control number-only">
                                                        </div>
                                </div>
                                

                            <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Preferred Payment Method<sup class="isc-bill-trk-sup"><i class="" style="font-size: 7px;"></i></sup> : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                             <div class="screen-row isc-dd-add-action-s1 shd-off-s1 dd-btn-siz-s1 isc-fix-dd-siz-s1 isc-bil-trk-sel isc-bill-trk-viw-del-sel isc-pay-bill-wdth isc-bkd-brd-vis">
                                                <select class="isc-select-dropdown select2 select2-hidden-accessible" tabindex="9"
                                                    aria-hidden="true" id="slt-Prefferd-Payment-Method" data-Select="vendorPrefPaymentTerm">
                                                    <option>Choose Preferred Payment Method</option>
                                                   
                                                </select>
                                                                   <span style="color:red;display:none;" class="validation-message" id="PrefferedPaymentTerm-Validation" data-validation="vendorPrefPaymentTerm">Preferred Payment Method should not be empty</span>
                                            </div>
                                                        </div>
                                </div>

                            <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Payment Terms<sup class="isc-bill-trk-sup"><i class="" style="font-size: 7px;"></i></sup> : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                             <div class="screen-row isc-dd-add-action-s1 shd-off-s1 dd-btn-siz-s1 isc-fix-dd-siz-s1 isc-bil-trk-sel isc-bill-trk-viw-del-sel isc-pay-bill-wdth isc-bkd-brd-vis">
                                                <select class="isc-select-dropdown select2 select2-hidden-accessible" tabindex="11"
                                                    aria-hidden="true" id="slt-Payment-Terms"  data-Select="vendorPaymentTerm">
                                                    <option value="0">Choose Payment Terms</option>
                                                   
                                                </select>
                                                                  <span style="color:red;display:none;" class="validation-message" id="vendorPaymentTerm-Validation" data-validation="vendorPaymentTerm">Payment Terms should not be empty</span>
                                            </div>
                                                        </div>
                                </div>

                            <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Shipping Address : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                         <textarea placeholder="Enter Shipping Address" id="shippingaddress" rows="4" class="form-control" style="resize:none;"></textarea>
                                                        </div>
                                </div>
                             <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Billing Address : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                                         <textarea placeholder="Enter Billing Address" id="billingaddress" rows="4" class="form-control" style="resize:none;"></textarea>
                                                        </div>
                                </div>
                            </div>

                 <h5 class="isc-bill-trk-hdr-txt mar-top-30 isc-new-thm-pad isc-g-b isc-mbl-mar-top-10" style="cursor:context-menu !important;">Bank Details : </h5>

                    <div class="screen-row mar-top-10">
                        <div class="screen-row mar-top-10">
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Account Holder's Name :</label>
                                                        </div>
                                    <div class="div-col-50per">
                                                             <div class="screen-row isc-dd-add-action-s1 shd-off-s1 dd-btn-siz-s1 isc-fix-dd-siz-s1 isc-bil-trk-sel isc-bill-trk-viw-del-sel">
                                               <select class="isc-select-dropdown select2 select2-hidden-accessible" tabindex="-1"
                                                    aria-hidden="true" id="txt-Account-Holder-Name">
                                                    <option>Acc Holder Name</option>
                                                </select>-
                                                                         <input type="text" placeholder="Enter Account Holder's Name" tabindex="17" data-textbox="vendorBnkAccHolderName"  id="txt-Account-Holder-Name" class="form-control >">
                                  <span style="color:red;display:none;" class="validation-message" id="vendorBnkAccHolderName-Validation" data-validation="vendorBnkAccHolderName">Account Holder's Name should not be empty</span>
                                                                            </div>
                                                        </div>
                                </div>
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Account Number
 : </label>
                                                        </div>
                                    <div class="div-col-50per">
                                         <input type="text" placeholder="Enter Account Number" id="txt-Account-Number" maxlength="16"  tabindex="19"   data-textbox="vendorAccNumber" class="form-control number-only">
                                                            <span style="color:red;display:none;" class="validation-message" id="vendorAccNumber-Validation" data-validation="vendorAccNumber">Account Number should not be empty</span>                    
                                                        </div>
                                </div>
                            </div>
                        <div class="screen-row mar-top-10">
                                

                            <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Routing Number :</label>
                                                        </div>
                                    <div class="div-col-50per">
                                                               <input type="text"  placeholder="Enter Routing Number" tabindex="18" maxlength="9" id="txt-Routing-Number"  data-textbox="vendorRoutingNumber"  class="form-control number-only">
                                     <span style="color:red;display:none;" class="validation-message" id="vendorRoutingNumber-Validation" data-validation="vendorRoutingNumber">Routing Number should not be empty</span>                    
                                    </div>
                                </div>
                                <div class="div-col-50per">
                                    <div class="div-col-30per">
                                                            <label class="mar-top-5">Confirm Account Number   :</label>
                                                        </div>
                                    <div class="div-col-50per">
                                                               <input type="text" placeholder="Enter Confirm Account Number"  maxlength="16" id="txt-reenter-Account-Number" tabindex="20"  data-textbox="vendorReAccNumber" class="form-control number-only">
                                         <span style="color:red;display:none;" class="validation-message" id="vendorEmptReAccNumber-Validation" data-validation="vendorReAccNumber">Confirm Account Number should be empty</span>                                        
                                      <span style="color:red;display:none;" class="validation-message" id="vendorReAccNumber-Validation" data-validation="vendorReAccNumber">Confirm Account Number should be match with the entered account number</span>                                        
                                    </div>
                                </div>
                            </div>--%>
                        <div class="screen-row mar-top-10">
                                
                                
                            </div>
                    </div>
                        </div>
                 
                    </div>
                </div>
    </div>

    <script src="iscjsengine/PageScript/CreateEmployee.js"></script>
</asp:Content>
