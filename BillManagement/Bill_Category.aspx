<%@ Page Title="" Language="C#" MasterPageFile="~/Application.Master" AutoEventWireup="true" CodeBehind="Bill_Category.aspx.cs" Inherits="BillManagement.Bill_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         @media only screen and (max-width: 767px) {
            .form-control {
                
                width: 200px !important;
            }
        }
        .isc-h-53 {
            height: 53px;
        }

        .form-control ::placeholder {
            color: #000 !important;
        }

        .isc-h-53 {
            height: 53px !important;
        }

        .isc-groupby-container {
            padding: 10px;
            border: 1px solid #ecf0f1;
            width: 100%;
            /* margin: 5px; */
            position: relative;
            display: none;
            margin-bottom: 10px;
        }

        .isc-groupby-search:hover {
            background-color: Orange;
        }

        .isc-groupby-search {
            display: inline-block;
            background: #2980b9;
            color: #fff;
            border-radius: 3px !important;
            padding: 4px 8px;
            cursor: pointer;
            margin-top: 3px;
        }

            .isc-groupby-search i {
                color: #fff;
            }

        .isc-groupby-container-close {
            position: absolute;
            top: 5px;
            right: 5px;
        }

            .isc-groupby-container-close a {
                background-color: #dcdcdc;
                cursor: pointer;
                padding: 2px 5px;
                border-radius: 50% !important;
            }

                .isc-groupby-container-close a i {
                    font-weight: 400;
                    font-size: 12px;
                    color: #8a8a8a;
                }

        .mar-lft-10 {
            margin-left: 10px !important;
        }

        /*.isc-table-read-optimal td {
            font-size: 13px;
        }*/

        input.form-control::placeholder {
            color: #000 !important;
            font-size: 13px;
        }
        /*.isc-filter-container{
           height:65px;
        }*/
       .isc-btn-inp-typ-file-s1 {
    background-color: #1589ee;
    font-size: 12px; 
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="isc-app-main-body-layout-container">
        <div class="isc-app-screen-content-s1">

            <div class="screen-row">
                <div class="isc-app-screen-header-container" style="height: 46px;">
                    <div class="screen-row">
                    <div class="div-col-30per">
                        <div class="screen-row">
                            <div class="isc-page-header">
                                <i class="fa fa-file"></i>
                                <h2 style="line-height: 30px;">Category List</h2>
                                <h6 class="mar-none"></h6>
                            </div>
                        </div>
                    </div>
                    <div class="div-col-70per">


                        <div class="cell-right">
                            <div class="align-right  pad-rig-5 " >

                                <a class="isc-theme-blue-btn filter-toggle-btn-cls" id="filter-toggle-btn" title="Filter"><i class="fa fa-filter"></i></a>
                                <%--<a class="isc-theme-blue-btn groupby-toggle-btn-cls" id="groupby-toggle-btn" title="Group By"><i class="fa fa-sitemap"></i></a>--%>
                            </div>

                        </div>

                        <div class="cell-right pad-rig-5 " style="margin-top: 6px;">
                            <a title="Add Category" id="add-Category" href="AddBillCategory.aspx" class="isc-theme-blue-btn"><i class="fa fa-plus"></i></a>

                        </div>
                        <div class="cell-right">
                            <div class="align-right  pad-rig-5 " >

                                <a class="isc-theme-blue-btn filter-toggle-btn-cls" id="filter-toggle-btnv" title="Import GL">Import GL</a>
                            </div>



                        </div>
                        <%--  <div class="cell-right pad-rig-5 " style="margin-top: 6px;">

                    <a class="isc-theme-blue-btn" href="#">Import GL</a>
                </div>--%>
                    </div>
                        </div>
                    
                </div>
                <div class="isc-app-screen-body-container" style="height: 270px;">
                    <div class="screen-row">
                        <div class="isc-app-screen-sec-container-s1 ">


                            <div class="screen-row">
                        <div class="isc-filter-container  mar-top-10" id="isc-filter-container" style="display: none;">
                            <div class="screen-row">   
                                <div class="div-col-80per"> 
                                <div class="cell-left ">
                                        <input type="text" class="form-control" id="txt-Category" placeholder="Enter Category" />

                                    </div>
                                    <div class="cell-left pad-lft-15">
                                       <%-- <input type="text" class="form-control" id="txt-AddedOn" placeholder="Select Added On" />--%>
                                        <input type="date" class="form-control" id="txt-AddedOn"/>

                                    </div>
                                    <div class="cell-left  pad-lft-15">
                                        <select class="form-control select2" tabindex="-1" id="slt-Added-By" aria-hidden="true">
                                            <option value="0">Select Added By</option>



                                        </select>
                                    </div>

                                    <div class="cell-left  pad-lft-15">
                                        <select class="form-control select2 select2-hidden-accessible" id="slt-Status" tabindex="-1" aria-hidden="true">
                                            <option value="999999">Select Status</option>
                                            <option value="1">Active		
                                            </option>
                                            <option value="0">Inactive
                                            </option>


                                        </select>
                                    </div>
                                    </div>
                                <div class="div-col-20per">
                                    <div class="cell-left">
                                    <div id="Btn_serch" class="isc-filter-search isc-go  mar-lft-10" title="Search">
                            <a title="Search"><i class="fa fa-search" ></i> Search</a>
                        </div>
                            <div id="btn_Reset" class="isc-filter-search isc-reset" title="Reset">
                            <a><i class="fa fa-times" ></i> Reset</a>
                        </div>
                                        </div>

                                    <div class="isc-filter-container-close" id="isc-filter-container-close">
                                        <a style="cursor: pointer" title="Close"><i class="fa fa-times"></i></a>
                                    </div>
                                    </div>
                                </div>
                                </div>
                    </div>
                    <div class="screen-row ">
                                    <div class="isc-filter-container mar-top-10" id="Filter-model" style="height: 50px;">




                                        <div class="cell-left ">
                                            <div class="screen-row " style="margin-top: 6px;">
                                                <span class="isc-btn-inp-typ-file-s1">Browse

                                                    <input type="file" name="filename" style="width: 200px;" id="GL-file" title="Add File" />
                                                </span>


                                            </div>
                                        </div>

                                        <div class="cell-left ">
                                            <label class="isc-fil-lbl" style="margin-left: 10px; margin-top: 7px;">File Name : <span id="file-Name"></span></label>

                                        </div>
                                        <div class="isc-filter-container-close" id="isc-import-close">
                                            <a style="cursor: pointer" title="Close"><i class="fa fa-times"></i></a>
                                        </div>
                                    </div>

                                    <div class="cell-right">
                                        <label class="isc-fil-lbl grn-clr" style="display: none">Uploaded successfully </label>
                                    </div>

                                </div>
                            <div class="screen-row">
                                <div class="isc-groupby-container isc-h-53" id="isc-groupby-container" style="display: none;">
                                    <div class="cell-left ">
                                        <input type="text" class="form-control " placeholder="Bill Category">
                                    </div>
                                    <div class="cell-left  pad-lft-15">
                                        <select class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                            <option>Added By</option>
                                            <option>Frank Abagnale		
                                            </option>
                                            <option>Edward Abbey
                                            </option>


                                        </select>
                                    </div>
                                    <div class="cell-left  pad-lft-15">
                                        <select class="form-control select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                            <option>Status</option>
                                            <option>Active		
                                            </option>
                                            <option>Inactive
                                            </option>


                                        </select>
                                    </div>


                                    <div class="isc-groupby-search isc-go  mar-lft-10" title="Search">
                                        <a title="Search"><i class="fa fa-search"></i></a>
                                    </div>
                                    <div class="isc-groupby-search isc-reset" title="Reset">
                                        <a><i class="fa fa-refresh"></i></a>
                                    </div>


                                    <div class="isc-groupby-container-close" id="isc-groupby-container-close">
                                        <a><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                            </div>


                            <div class="screen-row <%--isc-tab-src-cont-res--%> isc-lst-scrl-cont">
                                <table   class="isc-table-read-optimal isc-table-sorter-s1 mar-top-10">
                                    <thead>
                                        <tr>
                                            <th style="width: 4%;" class=""></th>
                                            <th style="width: 20%;" class="" title="Category/Sub-Category">Category/Sub-Category
                                            </th>
                                            <th style="width: 12%;" class="" title="GL Code">GL Code
                                            </th>
                                            <th style="width: 20%;" class="" title="Description">Description
                                            </th>
                                            <th style="width: 12%;" class="" title="Added On">Added On
                                            </th>
                                            <th style="width: 12%;" class="" title="Added By">Added By
                                            </th>
                                            <th style="width: 10%;" class="" title="Status">Status
                                            </th>
                                            <th style="width: 10%;" class="" title="Action">Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbl_CategoryList-Bdy">
                                    </tbody>
                                </table>
                                <%--<table class="isc-table-read-optimal isc-table-sorter-s1 ">
                                             <thead>
		<tr style="cursor: pointer;">
       <th style="width:2%;" class="header">
                                                            <div class="checker"><span><input type="checkbox"></span></div>
                                                        </th>
                                                           <th title="Bill Category" style="width:40%;">Bill Category</th>                                                             
                                                            <th title="Description" style="width:40%;">Description</th>
                                                           <th title="Status" style="width:10%;">Status</th>
                                                            <th title="Action"class="text-center" style="width:10%;">Action</th>
                           
	  </tr>
           </thead>
                                <tbody class="">
		<tr style="cursor: pointer;">
			<td>
           <div class="checker"><span><input type="checkbox"></span></div>
                                                       </td>
                                                            <td>Utilities</td>
                                                            <td>Utilities</td>
                                                         <td><div class="isc-td-inline-status-ch-s1">
                                                <a class="isc-lbl-act-read-list-s1 isc-wrk-flw-sta-aprove">Active</a>
                                            </div></td>
            <td style="text-align: center;">
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Edit" data-toggle="modal" href="#mp_paid"><i class="fa fa-pencil-square-o"></i></a>
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#MP_Delete" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
                                        
                                             </td>
   	</tr>
 <tr style="cursor: pointer;">
			<td>
           <div class="checker"><span><input type="checkbox"></span></div>
                                                       </td>
                                                            <td>Insurance Medical & Healthcare</td>
                                                            <td>Insurance Medical & Healthcare</td>
                                                         <td><div class="isc-td-inline-status-ch-s1">
                                                <a class="isc-lbl-act-read-list-s1 isc-wrk-flw-sta-aprove">Active</a>
                                            </div></td>
            <td style="text-align: center;">
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Edit" data-toggle="modal" href="#mp_paid"><i class="fa fa-pencil-square-o"></i></a>
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#MP_Delete" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
                                        
                                             </td>
   	</tr>
                                    <tr style="cursor: pointer;">
			<td>
           <div class="checker"><span><input type="checkbox"></span></div>
                                                       </td>
                                                            <td>Investment</td>
                                                            <td>Investment</td>
                                                         <td><div class="isc-td-inline-status-ch-s1">
                                                <a class="isc-lbl-act-read-list-s1 isc-wrk-flw-sta-aprove">Active</a>
                                            </div></td>
            <td style="text-align: center;">
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Edit" data-toggle="modal" href="#mp_paid"><i class="fa fa-pencil-square-o"></i></a>
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#MP_Delete" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
                                        
                                             </td>
   	</tr>
                                    <tr style="cursor: pointer;">
			<td>
           <div class="checker"><span><input type="checkbox"></span></div>
                                                       </td>
                                                            <td>Recreation</td>
                                                            <td>Recreation</td>
                                                         <td><div class="isc-td-inline-status-ch-s1">
                                                <a class="isc-lbl-act-read-list-s1 isc-inactive-clr">Inactive</a>
                                            </div></td>
            <td style="text-align: center;">
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Edit" data-toggle="modal" href="#mp_paid"><i class="fa fa-pencil-square-o"></i></a>
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#MP_Delete" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
                                        
                                             </td>
   	</tr>
                                    <tr style="cursor: pointer;">
			<td>
           <div class="checker"><span><input type="checkbox"></span></div>
                                                       </td>
                                                            <td>Miscellaneous</td>
                                                            <td>Miscellaneous</td>
                                                         <td><div class="isc-td-inline-status-ch-s1">
                                                <a class="isc-lbl-act-read-list-s1 isc-inactive-clr">Inactive</a>
                                            </div></td>
            <td style="text-align: center;">
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Edit" data-toggle="modal" href="#mp_paid"><i class="fa fa-pencil-square-o"></i></a>
                                            <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#MP_Delete" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
                                        
                                             </td>
   	</tr>
	</tbody>
                                            </table>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade isc-popup-detail-form-s1 in Mp_Relese" id="mp_paid" tabindex="-1" role="basic" aria-hidden="false">
                    <div class="modal-dialog" style="width: 700px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="screen-row">
                                    <div class="cell-left">
                                        <h4 class="modal-title">Bill Category</h4>
                                    </div>
                                    <div class="cell-right">
                                        <a data-dismiss="modal"><i class="fa fa-times-circle"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-body pad-20">




                                <div class="screen-row ">

                                    <div class="div-col-30per">
                                        <div class="isc-pay-lbl-txt">
                                            <label class="mar-top-5">
                                                Bill Category
                                        <span style="color: red; font-size: 14px;">*</span>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="div-col-65per">
                                        <input type="text" placeholder="Enter Bill Category" class="form-control">
                                    </div>
                                </div>
                                <div class="screen-row mar-top-15">

                                    <div class="div-col-30per">
                                        <div class="isc-pay-lbl-txt">
                                            <label class="mar-top-5">
                                                Description
                                            </label>
                                        </div>
                                    </div>

                                    <div class="div-col-65per">
                                        <textarea placeholder="Enter Description" rows="4" class="form-control" style="resize: none;" spellcheck="false"></textarea>
                                    </div>
                                </div>
                                <div class="screen-row mar-top-15">

                                    <div class="div-col-30per">
                                        <div class="isc-pay-lbl-txt">
                                            <label class="mar-top-5">
                                                Status <span style="color: red; font-size: 14px;">*</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="div-col-65per">
                                        <div class="screen-row isc-dd-add-action-s1 shd-off-s1 dd-btn-siz-s1 isc-fix-dd-siz-s1 isc-bill-trk-wdth">
                                            <select class="isc-select-dropdown select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                <option>Active</option>
                                                <option>Inactive</option>

                                            </select>
                                        </div>

                                    </div>


                                </div>



                            </div>
                            <div class="modal-footer">

                                <div class="cell-right pad-lft-max">
                                    <div class="isc-pop-btn-cen-cell-s1">
                                        <button type="button" class="btn blue isc-btn-pop-action-s1" data-dismiss="modal">
                                            Save</button>
                                    </div>
                                </div>
                                <div class="cell-right">
                                    <div class="isc-pop-btn-cen-cell-s1">
                                        <button type="button" class="btn blue isc-btn-pop-action-s1" data-dismiss="modal" style="background-color: #95a5a6 !important;">
                                            Cancel</button>
                                    </div>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                    </div>

                    <!-- /.mokdmadal-dialog -->
                </div>




                <div class="modal fade isc-popup-detail-form-s1 in Mp_Relese" id="add_mp_paid" tabindex="-1" role="basic" aria-hidden="false">
                    <div class="modal-dialog" style="width: 700px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="screen-row">
                                    <div class="cell-left">
                                        <h4 class="modal-title">Create Bill Category</h4>
                                    </div>
                                    <div class="cell-right">
                                        <a data-dismiss="modal"><i class="fa fa-times-circle"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-body pad-20">
                                <div class="screen-row ">

                                    <div class="div-col-30per">
                                        <div class="isc-pay-lbl-txt">
                                            <label class="mar-top-5">
                                                Bill Category
                                        <span style="color: red; font-size: 14px;">*</span>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="div-col-65per">
                                        <input type="text" placeholder="Enter Bill Category" class="form-control">
                                    </div>
                                </div>
                                <div class="screen-row mar-top-15">

                                    <div class="div-col-30per">
                                        <div class="isc-pay-lbl-txt">
                                            <label class="mar-top-5">
                                                Description
                                            </label>
                                        </div>
                                    </div>

                                    <div class="div-col-65per">
                                        <textarea placeholder="Enter Description" rows="4" class="form-control" style="resize: none;" spellcheck="false"></textarea>
                                    </div>
                                </div>
                                <div class="screen-row mar-top-15">

                                    <div class="div-col-30per">
                                        <div class="isc-pay-lbl-txt">
                                            <label class="mar-top-5">
                                                Status <span style="color: red; font-size: 14px;">*</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="div-col-65per">
                                        <div class="screen-row isc-dd-add-action-s1 shd-off-s1 dd-btn-siz-s1 isc-fix-dd-siz-s1 isc-bill-trk-wdth">
                                            <select class="isc-select-dropdown select2 select2-hidden-accessible" tabindex="-1" aria-hidden="true">
                                                <option>Active</option>
                                                <option>Inactive</option>

                                            </select>
                                        </div>

                                    </div>


                                </div>
                            </div>
                            <div class="modal-footer">

                                <div class="cell-right pad-lft-max">
                                    <div class="isc-pop-btn-cen-cell-s1">
                                        <button type="button" class="btn blue isc-btn-pop-action-s1" data-dismiss="modal">
                                            Create</button>
                                    </div>
                                </div>
                                <div class="cell-right">
                                    <div class="isc-pop-btn-cen-cell-s1">
                                        <button type="button" class="btn blue isc-btn-pop-action-s1" data-dismiss="modal" style="background-color: #95a5a6 !important;">
                                            Cancel</button>
                                    </div>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                    </div>

                    <!-- /.mokdmadal-dialog -->
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade isc-popup-detail-form-s1 in" id="mp_delete-Category" tabindex="-1" role="basic" aria-hidden="false" style="display: none;">
        <div class="modal-dialog" style="width: 400px;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="screen-row">
                        <div class="cell-left float-left">
                            <h4 class="modal-title">Delete Category</h4>
                        </div>
                        <div class="cell-right">
                            <a><i class="fa fa-times-circle" style="color: #8A8A8A; cursor: pointer;" title="Close" submit-cancel="true" aria-hidden="true"></i></a>
                            <%--<button type="button" hide-pop-up="true" class="close img-typ-sq" title="Cancel"  delete-cancel="true" aria-hidden="true">
                            </button>--%>
                        </div>
                    </div>
                </div>
                <div class="screen-row">

                    <div class="modal-body" style="min-height: 75px !important;">
                        <div class="screen-row">
                            <div class="form-body">
                                <div class="form-group">
                                    <div class="screen-row">
                                        <h4 style="color:#000;font-weight:500;">Are you sure want to delete the Category?</h4>

                                    </div>

                                </div>

                            </div>

                        </div>


                    </div>

                </div>
                <div class="modal-footer">
                    <div class="isc-pop-btn-cen-cell-s1">
                        <button type="button" class="btn blue isc-btn-pop-action-s1" style="cursor: pointer" id="btn-delete-ok" data-dismiss="modal">
                            OK</button>
                        <button type="button" class="btn blue isc-btn-pop-action-s1" submit-cancel="true" style="cursor: pointer; background-color: #aeaeae !important;" id="close-submit">
                            Cancel</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.mokdmadal-dialog -->
        </div>
    </div>
    <div class="modal fade isc-popup-detail-form-s1 in" id="mp_bill-view" tabindex="-1" role="basic" aria-hidden="false">
        <div class="modal-dialog" style="width: 550px;">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="screen-row">
                        <div class="cell-left">
                            <h4 class="modal-title">GL Import</h4>
                        </div>
                        <div class="cell-right">
                            <a><i class="fa fa-times-circle" style="cursor: pointer" title="Close" data-dismiss="modal" close-importpopup="true"></i></a>
                            <%-- <button type="button" class="close img-typ-sq" aria-hidden="true">
</button>--%>
                        </div>
                    </div>
                </div>
                <div class="screen-row">

                    <div class="modal-body" style="min-height: 450px !important;">
                        <div class="screen-row">
                            <div class="form-body">

                                <div class="screen-row">
                                    <div class="isc-pay-btn-cont" style="float: right; margin-bottom: 15px;">
                                        <a class="isc-theme-blue-btn" id="btn-Save-ExcelData">Upload </a>
                                        <a class="isc-theme-blue-btn" style="margin-left: 10px;" close-importpopup="true">Cancel </a>
                                    </div>
                                </div>

                                <table class="isc-table-read-optimal isc-table-sorter-s1 ">
                                    <thead>
                                        <tr>

                                            <th style="width: 20%;" title="Category">Category
                                            </th>
                                            <th style="width: 23%;" title="Category GL">Category GL
                                            </th>
                                            <th style="width: 20%;" title="Subcategory GL">Subcategory GL
                                            </th>
                                            <th style="width: 20%;" title="GL Description">GL Description
                                            </th>
                                            <th style="width: 20%;" title="Validation Error">Validation Error
                                            </th>
                                            <th style="width: 10%;">Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbl-excel-Data">
                                        <tr>

                                            <td>
                                                <h5>1854</h5>
                                            </td>
                                            <td>
                                                <h5>Cash in Bank - (Regular) Bank of America </h5>
                                            </td>
                                            <td>
                                                <h5>- </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>


                                        <tr>

                                            <td>
                                                <h5>1242</h5>
                                            </td>
                                            <td>
                                                <h5>Cash on Hand - (CD account) </h5>
                                            </td>
                                            <td>
                                                <h5>- </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>

                                        <tr>

                                            <td>
                                                <h5>1245</h5>
                                            </td>
                                            <td>
                                                <h5>Cash on Hand ( Payroll ) Chase Bank </h5>
                                            </td>
                                            <td>
                                                <h5>- </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>

                                        <tr>

                                            <td>
                                                <h5>1466</h5>
                                            </td>
                                            <td>
                                                <h5>Undeposited funds John Hancock Investments</h5>
                                            </td>
                                            <td>
                                                <h5>- </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>

                                        <tr>

                                            <td>
                                                <h5>1342</h5>
                                            </td>
                                            <td>
                                                <h5>Cash In Bank Chase Bank (Payroll) </h5>
                                            </td>
                                            <td>
                                                <h5>- </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td>
                                                <h5>1854</h5>
                                            </td>
                                            <td>
                                                <h5>Cash in Bank - (Regular) Bank of America </h5>
                                            </td>
                                            <td>
                                                <h5>- </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>


                                        <tr>

                                            <td>
                                                <h5>1242</h5>
                                            </td>
                                            <td>
                                                <h5>Cash on Hand - (CD account) </h5>
                                            </td>
                                            <td>
                                                <h5>- </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>

                                        <tr>

                                            <td>
                                                <h5>1245</h5>
                                            </td>
                                            <td>
                                                <h5>Cash on Hand ( Payroll ) Chase Bank </h5>
                                            </td>
                                            <td>
                                                <h5>- </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>


                                        <tr>

                                            <td>
                                                <h5>1242</h5>
                                            </td>
                                            <td>
                                                <h5>Bank Adjustment Account - Auditor info </h5>
                                            </td>
                                            <td>
                                                <h5>GL Code is not matched </h5>
                                            </td>


                                            <td>


                                                <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" href="#"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>


                            </div>

                        </div>


                    </div>

                </div>

                <!-- /.modal-content -->
            </div>
            <!-- /.mokdmadal-dialog -->
        </div>
    </div>
    <script>
        $('#filter-toggle-btnv,#isc-import-close').click(function () {
            $('#Filter-model').toggle();
        });
        $('#filter-toggle-btn1,#isc-filter-container-close1').click(function () {
            $('#isc-filter-container1').toggle();
        });
    </script>
    <script>
        $('#groupby-toggle-btn,#isc-groupby-container-close').click(function () {
            $('#isc-groupby-container').toggle();
        });
        $('#groupby-toggle-btn1,#isc-groupby-container-close1').click(function () {
            $('#isc-groupby-container1').toggle();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#filter_togle").click(function () {
                $("#filter_con").toggle();


            });
            $('#filter-toggle-btn,#isc-filter-container-close').click(function () {
                $('#isc-filter-container').toggle();
            });

            $("#filter_clse").click(function () {

                $(".rem_filt_con").hide();
                $(".isc-sec-filter-s1 li").removeClass("active");
            });
            $("#filter_togle_s1").click(function () {
                $("#filter_con_s1").toggle();


            });
            $("#filter_clse_s1").click(function () {

                $(".rem_filt_con").hide();
                $(".isc-sec-filter-s1 li").removeClass("active");
            });

        });
        $(document).ready(function () {
            $(document).on('click', '.isc-tr-show-parentfiles-s1', function (e) {
                e.preventDefault();
                var $this = $(this);
                $this.nextUntil('tr.isc-tr-show-parentfiles-s1').slideToggle(function () { });
                
            });
        });




    </script>

    <script src="iscjsengine/PageScript/BillCategoryList.js"></script>

</asp:Content>
