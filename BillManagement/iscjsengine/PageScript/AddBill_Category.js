//Global
{
    var rowID = 0;
    var existingGL = [];
    var editCategoryID = 0;
    var categoryData = [];
}

//Load and Events
{
    $(document).ready(function () {
        editCategoryID = ((GetQueryStrings()["EditCategoryID"] == undefined || GetQueryStrings()["EditCategoryID"] == null) ? 0 : GetQueryStrings()["EditCategoryID"]);
        BuildScreen();
        $('#slt-Status').select2();
    });

    $(document).on('click', '#add-SubCategory', function () {
        if (ValidateSubCategory()) {
            BindDefaultRow();
        }
        
    });

    $(document).on('click', '[data-deleteRow]', function () {
        var row = $(this).attr('data-deleteRow');
        $('div[div-Row=' + row + ']').remove();
    });
        
    $(document).on('click', '#btn-Save-Category', function () {
        if (ValidateCategory()) {
            SaveCategory();
        }
        
    });

    $(document).on('click', '#btn-Cancel', function () {
        GoBack();
    });

    $(document).on('click', '#btn-Update-Category', function () {
        if (ValidateCategory()) {
            UpdateCategory();
        }
    });
}

//Dom Manipulation
{
    var BuildScreen = function () {
        existingGL = GetExistingGLAccounts();
        if (existingGL["GLCodes"] == undefined) {
            existingGL = [];
        }
        else {
            existingGL = existingGL["GLCodes"];
        }
       
        if (editCategoryID != 0) {
            BindEditDetails();
            $('#pagetitle').html("Update Category ");
        }
    }

    var BindEditDetails = function () {
        var editData = GetEditData();

        if (editData != null) {
             categoryData = editData["Category"];
            $('#txt-CategoryName').val(categoryData[0]["CategoryName"] == null ? '' : categoryData[0]["CategoryName"]);
            $('#txt-GlCode').val(categoryData[0]["GLNumber"] == null ? '' : categoryData[0]["GLNumber"]);
            $('#txt-Desc').val(categoryData[0]["GLDescription"] == null ? '' : categoryData[0]["GLDescription"]);
            $('#slt-Status').val(categoryData[0]["IsActive"] == null ? '' : categoryData[0]["IsActive"]);

            var subCategoryData = editData["SubCategory"];
            if (subCategoryData != null && subCategoryData != undefined && subCategoryData.length > 0) {
                BindSubCategories(subCategoryData);
            }

            $('#btn-Save-Category').hide();
            $('#btn-Update-Category').show();
        }
    }

   var BindDefaultRow = function () {
       var html = '';
       var $el = $('#subCategories');
       var subCategory = $('#txt-SubCategory').val();
       var gl = $('#txt-Gl').val();
       html += '<div class="screen-row  mar-top-10" div-Row="' + rowID + '">';
       html+='<div class="div-col-35per "><div class="screen-row  "><div class="div-col-80per">';
       html += '<input type="text" class="form-control" disabled data-SubCategory="'+subCategory+'" value="' + subCategory + '" placeholder="Enter Sub-Category">';
       html+='</div></div></div><div class="div-col-30per ">';
       html+='<div class="screen-row "><div class="div-col-100per" style="width:93%;">';
       html += '<input type="text" class="form-control" disabled  data-Gl="' + gl + '" value="' + gl + '" placeholder="Enter GL Code"></div>';
       html += '<div class="div-col-5per"><a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" data-deleteRow="' + rowID + '"><i class="fa fa-trash-o"></i></a></div>';
       html += '</div></div>';
       html += '</div>';
       $('#txt-SubCategory').val('');
       $('#txt-Gl').val('')
       rowID = rowID + 1;
       $el.append(html);
   }

   var BindSubCategories = function (subCategoryData) {
       var html = '';
       var $el = $('#subCategories');
       if (subCategoryData != null && subCategoryData != undefined && subCategoryData.length > 0) {
           $.each(subCategoryData, function (index, item) {
               html += '<div class="screen-row  mar-top-10" div-Row="' + item["IdentityId"] + '">';
               html += '<div class="div-col-35per "><div class="screen-row  "><div class="div-col-80per">';
               html += '<input type="text" disabled class="form-control" data-SubCategory="' + (item["GLDescription"] == null ? '' : item["GLDescription"]) + '" value="' + (item["GLDescription"] == null ? '' : item["GLDescription"]) + '" placeholder="Enter Sub-Category">';
               html += '</div></div></div><div class="div-col-30per ">';
               html += '<div class="screen-row "><div class="div-col-100per">';
               html += '<input type="text" class="form-control" disabled data-Gl="' + (item["GLNumber"] == null ? '' : item["GLNumber"]) + '" value="' + (item["GLNumber"] == null ? '' : item["GLNumber"]) + '" placeholder="Enter GL Code">';
               html += '</div></div></div><div class="div-col-5per">';
               html += ' <a class="isc-action-badge-td-s1 pad-lft-5" title="Delete" data-deleteRow="' + item["IdentityId"] + '"><i class="fa fa-trash-o"></i></a>';
               html += '</div></div>';
           })
       }
       $el.append(html);
   }
}

//Data Manipulation
{
    var SaveCategory = function () {
        
        var lstSubCategory = [];
        var subCategoryList = $('[div-Row]');
        if (subCategoryList != undefined && subCategoryList.length) {
            $.each(subCategoryList, function (index, item) {
                var obj = {
                    'GlCategory':  $('#txt-CategoryName').val(),
                    'GLNumber': $(item).find('[data-Gl]').attr('data-Gl'),
                    'SubCategory': $(item).find('[data-SubCategory]').attr('data-SubCategory'),
                    'Status': parseInt($('#slt-Status').val())
                }
                lstSubCategory.push(obj);
            })
        }
        var objCategory = {
            'GlCategory': $('#txt-CategoryName').val(),
            'GLNumber': $('#txt-GlCode').val(),
            'GLDescription': $('#txt-Desc').val(),
            'Status': parseInt($('#slt-Status').val()),
            'lstSubCategories':lstSubCategory
        }
        var insertObj = {
            'ObjGLCategory':objCategory
        }

        $.when(RequestServer("AddBillCategory.aspx/SaveCategory", insertObj)).done(function (response) {
            if (parseInt(response) > 0) {
                $.notify("Category created successfully!", { position: "right top", className: "success" });
                GoBack()
            }
            else {
                $.notify("Server error occured while creating a category !!", { position: "right top", className: "error" });
            }
        });
       
    }

    var UpdateCategory = function () {

        var lstSubCategory = [];
        var subCategoryList = $('[div-Row]');
        if (subCategoryList != undefined && subCategoryList.length) {
            $.each(subCategoryList, function (index, item) {
                var obj = {
                    'GlCategory': $('#txt-CategoryName').val(),
                    'GLNumber': $(item).find('[data-Gl]').attr('data-Gl'),
                    'SubCategory': $(item).find('[data-SubCategory]').attr('data-SubCategory'),
                    'Status': parseInt($('#slt-Status').val())
                }
                lstSubCategory.push(obj);
            })
        }
        var objCategory = {
            'GlCategory': $('#txt-CategoryName').val(),
            'GLNumber': $('#txt-GlCode').val(),
            'GLDescription': $('#txt-Desc').val(),
            'Status': parseInt($('#slt-Status').val()),
            'IdentityID':parseInt(editCategoryID),
            'lstSubCategories': lstSubCategory
        }
        var insertObj = {
            'ObjGLCategory': objCategory
        }

        $.when(RequestServer("AddBillCategory.aspx/UpdateCategory", insertObj)).done(function (response) {
            if (parseInt(response) > 0) {
                $.notify("Category updated successfully!", { position: "right top", className: "success" });
                GoBack()
            }
            else {
                $.notify("Server error occured while updating a category !!", { position: "right top", className: "error" });
            }
        });

    }

    var GetEditData = function () {
        var obj = {
            'catgoryID':editCategoryID
        }
        var templist = {};
        $.when(RequestServer("AddBillCategory.aspx/GetCategoryData", obj)).done(function (response) {
            templist = $.parseJSON(response);
        });
        return templist;
    }

    var GetExistingGLAccounts = function () {
        var obj = {
           
        }
        var templist = {};
        $.when(RequestServer("AddBillCategory.aspx/GetExistingGL", obj)).done(function (response) {
            templist = $.parseJSON(response);
        });
        return templist;
    }
}

//Common
{
    var GoBack = function () {
        setTimeout(function () {
            window.location.replace("Bill_Category.aspx");

        }, 1000);
    }

    var ValidateCategory = function ()
    {
        var isValid = true;
        var categorName = $.trim($('#txt-CategoryName').val());
        var gl = $.trim($('#txt-GlCode').val());
        var status = $.trim($('#slt-Status').val());

        if (categorName == null || categorName == '') {
            isValid = false;
            $.notify("Category should not be empty  !!", { position: "right top", className: "error" });
        }

        if (gl == null || gl == '') {
            isValid = false;
            $.notify("GL Code should not be empty !!", { position: "right top", className: "error" });
        }

        if (status == null || status == '99999') {
            isValid = false;
            $.notify("Status should not be empty !!", { position: "right top", className: "error" });
        }

        if (existingGL != null && existingGL != undefined && existingGL.length > 0 && gl != ''); {
            if (editCategoryID == 0) {
                var matchedGl = GetmatchedRecord(existingGL, 'GLNumber', gl);
                if (matchedGl != null && matchedGl != undefined && matchedGl.length > 0) {
                    isValid = false;
                    $.notify("GL Code is already exists !!", { position: "right top", className: "error" });
                }
            }
            else {
                var GLList = GetunmatchedRecord(existingGL, 'GLNumber', categoryData[0]["GLNumber"]);
                var matchedGl = GetmatchedRecord(GLList, 'GLNumber', gl);
                if (matchedGl != null && matchedGl != undefined && matchedGl.length > 0) {
                    isValid = false;
                    $.notify("GL Code is already exists !!", { position: "right top", className: "error" });
                }
            }
           
        }

        //var subCategoryList = $('[div-Row]');
        //if (subCategoryList != undefined && subCategoryList.length) {
        //    $.each(subCategoryList, function (index, item) {
        //        if ($.trim($(item).find('[data-Gl]').attr('data-Gl')) == '') {
        //            isValid = false;
        //            $.notify("Sub-Category Gl Code should not be empty !!", { position: "right top", className: "error" });
        //        }
        //    })
        //}


        return isValid;
    }

    var ValidateSubCategory = function ()
    {
        var isValid = true;
        var categorName = $.trim($('#txt-SubCategory').val());
        var gl = $.trim($('#txt-Gl').val());
        if (categorName == null || categorName == '') {
            isValid = false;
            $.notify("Sub-Category should not be empty  !!", { position: "right top", className: "error" });
        }

        if (gl == null || gl == '') {
            isValid = false;
            $.notify("GL Code should not be empty !!", { position: "right top", className: "error" });
        }

        if (existingGL != null && existingGL != undefined && existingGL.length > 0 && gl != '') {
            var matchedGl = GetmatchedRecord(existingGL, 'GLNumber', gl);
            if (matchedGl != null && matchedGl != undefined && matchedGl.length > 0) {
                isValid = false;
                $.notify("GL Code is already exists !!", { position: "right top", className: "error" });
            }
            else {
                var obj = {
                    'GLNumber': gl,
                }
                existingGL.push(obj);
            }
        }

        return isValid
    }
}