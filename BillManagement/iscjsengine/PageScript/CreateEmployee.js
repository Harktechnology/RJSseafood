//Global Variables
{
    var masterData = [];
    var fileContainer = [];
    var fileName = '';
    var editEmployeeID = 0;
    var editEmployeeData = [];

}

//Load && Events
{
    $(document).ready(function () {

        editEmployeeID = ((GetQueryStrings()["EmployeeID"] == undefined || GetQueryStrings()["EmployeeID"] == null) ? 0 : GetQueryStrings()["EmployeeID"]);
        BindCreateEmployeeScreen();
        //EmpRegistration();

    });

    $(document).on('click', '#save-Employee', function () {
        if (ValidateEmployee() && $("span[error-active='true']").length == 0) {
            SaveEmployee();
        }

    });

    $(document).on('click', '#cancel', function () {
        GoBack();
    });

    $(document).on('click', '#update-Employee', function () {
        if (ValidateEmployee() && $("span[error-active='true']").length == 0) {
            UpdateEmployee();
        }

    });

    $(document).on('keyup', '[data-textbox]', function () {
        if ($.trim($(this).val()) != '') {
            $("span.validation-message[data-validation='" + $(this).attr("data-textbox") + "']").hide();
        }

    });

    $(document).on('change', '[data-Select]', function () {
        var $this = $(this);
        $("span.validation-message[data-validation='" + $this.attr("data-Select") + "']").hide();
        //  $("span.validation-message[data-validation='" + $this.attr("data-Select") + "']").attr('error-active', false);
    });

    $(document).on('change', '[data-Email]', function () {
        var $this = $(this);
        var contact = $this.attr('data-Email');
        var VAL = $this.val();
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var emailFirstCharacter = VAL.charAt(0);
        if (VAL != '') {
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (!mailformat.test(VAL)) {

                $("span.validation-message[data-validation='" + $this.attr("data-Email") + "']").show();
                $("span.validation-message[data-validation='" + $this.attr("data-Email") + "']").attr('error-active', true);
            }
            else {
                $("span.validation-message[data-validation='" + $this.attr("data-Email") + "']").hide();
                $("span.validation-message[data-validation='" + $this.attr("data-Email") + "']").attr('error-active', false);
            }
        }
        else {
            $("span.validation-message[data-validation='" + $this.attr("data-Email") + "']").hide();
            $("span.validation-message[data-validation='" + $this.attr("data-Email") + "']").attr('error-active', false);
        }
        if (VAL != '' && emailFirstCharacter == '_') {
            $("span.validation-message[data-validation='" + $this.attr("data-Email") + "']").show();
            $("span.validation-message[data-validation='" + $this.attr("data-Email") + "']").attr('error-active', true);
        }
        if (VAL != '') {
            $('#vendorEmail-Validation').hide();
        }

        $('#vendorDuplicateEmail-Validation').hide();

    });

    $(document).on('click', '#remove-Logo', function () {
        var html = "";
        fileName = [];
        fileContainer = [];
        html += '<h2>LOGO</h2>';
        html += '<span class="isc-btn-inp-typ-file-s1" style="top: 126px !Important;" >Choose Company Logo';
        html += '<input type="file" id="browseLogo" name="filename" accept="image/gif, image/jpeg, image/png" style="width: 200px;">';
        html += '</span>';
        $('#file_Viewer').html(html);
    });
}

//Dom
{
    var BindCreateEmployeeScreen = function () {

        masterData = GetMasterData();

       // BindDropDowns($('#slt-EmployeeType'), masterData["EmployeeType"], 'Choose Employee Type')
       // BindDropDowns($('#slt-Payment-Terms'), masterData["PaymentTerms"], 'Choose Payment Terms')
      //  BindDropDowns($('#slt-Prefferd-Payment-Method'), masterData["PrefferredPaymentType"], 'Choose Preferred Payment Method')


        var createEmployeeEntity = GetmatchedRecord(RolePermissions, 'EntityActionID', '3023');
        if (createEmployeeEntity.length > 0) {
            $('#save-Employee').show();
        }
        else {
            $('#save-Employee').hide();
        }
        if (editEmployeeID != 0) {
            editEmployeeData = GetEditEmployeeData();
            BindEditEmployeeDetails(editEmployeeData["EmployeeData"]);
        }
    }

    var BindEditEmployeeDetails = function (EmployeeData) {

        $('#Custname').val(EmployeeData[0]['EmployeeName'])
        if (EmployeeData[0]['CutomerType'] != "") {

            $('#slt-EmployeeType').val(EmployeeData[0]['CutomerType'])
        }
        else {
            $('#slt-EmployeeType').val(0)
        }

        $('#slt-EmployeeType').select2()
        if (EmployeeData[0]['PaymentTerms'] != null) {

            $('#slt-Payment-Terms').val(EmployeeData[0]['PaymentTerms'])
        }
        else {

            $('#slt-Payment-Terms').val(0)
        }
        $('#slt-Payment-Terms').select2()
        if (EmployeData[0]['PaymentMethod'] != null) {

            $('#slt-Prefferd-Payment-Method').val(EmployeData[0]['PaymentMethod'])
        }
        else {
            $('#slt-Prefferd-Payment-Method').val(0)
        }
        $('#slt-Prefferd-Payment-Method').select2()

        $('#Email').val(EmployeData[0]['Email'])
        $('#contact-Number').val(EmployeData[0]['ContactNumber'])
        $('#address').val(EmployeData[0]['EmployeAddress'])
        $('#city').val(EmployeData[0]['City'])
        $('#zip').val(EmployeData[0]['Zip'])
        $('#state').val(EmployeData[0]['State'])

        $('#shippingaddress').val(EmployeData[0]['Shippingaddress'])
        $('#billingaddress').val(EmployeData[0]['BillingAddress'])
        $('#txt-Account-Holder-Name').val(EmployeData[0]['AccountHoldername'])
        $('#txt-Account-Number').val(EmployeData[0]['AccountNumber'])
        $('#txt-Routing-Number').val(EmployeData[0]['RoutingNumber'])
        $('#txt-reenter-Account-Number').val(EmployeData[0]['AccountNumber'])

        $('#page-Title').html('Update Employe');
        $('#save-Employe').hide();
        if (EmployeData[0]["EmployeLogo"] != '' && EmployeData[0]["EmployeLogo"] != null) {
            fileName = EmployeData[0]["EmployeLogo"]
            EmployeLogoFrames(EmployeData[0]["EmployeLogo"]);
        }

        var updateEmployeEntity = GetmatchedRecord(RolePermissions, 'EntityActionID', '3024');
        if (updateEmployeEntity.length > 0) {
            $('#update-Employe').show();
        }
    }

    var EmployeLogoFrames = function (fileImage) {
        $('#file_Viewer').html('');
        var iframe = document.getElementById("bill_Frame");
        if (null !== iframe) {
            document.body.removeChild(iframe);
        }
        else {
            var iframe = document.createElement("iframe");
            iframe.id = "bill_Frame";
            var iframewidth = 390;
            var sourcePath = "Requested Source Path: " + EmployeLogoPathUrl + fileImage;
            //WriteSourcePath(sourcePath);
            iframe.src = EmployeLogoPathUrl + fileImage;
            iframe.className = 'isc-new-exp-pdf';
            iframe.setAttribute("style", "border: none; width: 100%; height: 100%; overflow: hidden; overflow-y: auto;");
            $('#iframe img').addClass('img-responsive');
            $('#file_Viewer').append(iframe);
            isAttchment = 1;
        }
    }
}

//Data
{
    var GetMasterData = function () {
        var _obj = {

        };
        var tempList = {};
        $.when(RequestServer("AddEmploye.aspx/GetFilterData", _obj)).done(function (response) {
            tempList = $.parseJSON(response);
        });
        return tempList;
    }

    //AJAX Call for file upload
    var saveFiles = function () {
        var response = '';

        if (fileContainer.length > 0) {
            fileResponse = [];
            var data = new FormData();
            data.append("Folder", 0);
            data.append("key", fileContainer[0]);
            $.ajax({
                async: false,
                type: "POST",
                url: "EmployeLogo.ashx",
                contentType: false,
                processData: false,
                data: data,
                success: function (result) {
                    fileResponse = result;
                },
                error: function (jqXHR, error, errorThrown) {
                    var error = e;
                },
                xhr: function (evt) {
                    var filexhr = $.ajaxSettings.xhr();
                    return filexhr;
                }
            });
        }
        return fileResponse;
    }

    var SaveEmployee = function () {
        var _obj = {
            'EmployeeName': $('#Emp_name').val(),
            'Designation': ($('#Designation').val()),
            'DOB': $('#Dob').val(),
            'Email': $('#Email').val(),
            'EmployeeAddress': $('#address').val(),
            'ContactNumber': $('#contact-Number').val(),
            'AlterNumber': $('#contact-Number2').val(),            
            'Bloodgroup': $('#BloodGroup').val(),
            //'Zip': $('#zip').val(),
            //'State': $('#state').val(),
            //'EmployeLogo': fileName,
            //'PaymentTerms': parseInt($('#slt-Payment-Terms').val()),
            //'PaymentMethod': parseInt($('#slt-Prefferd-Payment-Method').val()),
            //'Shippingaddress': $('#shippingaddress').val(),
            //'BillingAddress': $('#billingaddress').val(),
            //'AccountHoldername': $('#txt-Account-Holder-Name').val(),
            //'AccountNumber': $('#txt-Account-Number').val(),
            //'RoutingNumber': $('#txt-Routing-Number').val()
        }
        var insertObj = {
            'objEmployee': _obj
        }
        $.when(RequestServer("AddEmployee.aspx/SaveEmployee", insertObj)).done(function (response) {
            if (parseInt(response) > 0) {
                $.notify("Employee created successfully!", { position: "right top", className: "success" });
                GoBack()
            }
            else {
                $.notify("Server error occured while creating a Employe !!", { position: "right top", className: "error" });
            }
        });
    }

    var GetEditEmployeData = function () {
        var _obj = {
            'EmployeeID': parseInt(editEmployeID)
        };
        var tempList = {};
        $.when(RequestServer("AddEmploye.aspx/GetEditEmployeData", _obj)).done(function (response) {
            tempList = $.parseJSON(response);
        });
        return tempList;

    }

    var UpdateEmployee = function () {

        var _obj = {
            'EmployeeName': $('#Emp_name').val(),
            'Designation': ($('#Designation').val()),
            'DOB': $('#Dob').val(),
            'Email': $('#Email').val(),
            'EmployeeAddress': $('#address').val(),
            'ContactNumber': $('#contact-Number').val(),
            'AlterNumber': $('contact-Number2').val(),

            'Bloodgroup': $('#Blood Group').val(),
        }
        var updateObj = {
            'objEmployee': _obj
        }

        $.when(RequestServer("AddEmployee.aspx/UpdateEmployee", updateObj)).done(function (response) {
            if (parseInt(response) > 0) {
                $.notify("Employee updated successfully!", { position: "right top", className: "success" });
                GoBack()
            }
            else {
                $.notify("Server error occured while updating a Employee !!", { position: "right top", className: "error" });
            }
        });
    }
}

//Common
{

    var BindDropDowns = function ($el, lst, DefaultItem) {
        var html = '';
        if (DefaultItem != "") {
            html += '<option value="0">' + DefaultItem + '</option>';
        }
        if (lst.length > 0) {
            var distinctlst = GetDistinctArray(lst, 'KeyListID');
            distinctlst = ObjSorter(distinctlst, "Value1", '123');

            $.each(distinctlst, function (index, item) {

                html += '<option value="' + item["KeyListID"] + '">' + (item["Value1"] == null ? '-' : item["Value1"]) + '</option>';

            });
        }
        $el.html(html);
    }

    var GoBack = function () {
        setTimeout(function () {
            window.history.back();
        }, 1000);
    }

    var CustomRegistration = function () {
        $('.number-only').mask('#');
        $('[data-taxid]').mask('000-000-000')
        $('.alphabets-only').mask('ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ', {
            translation: {
                'Z': {
                    pattern: /[a-zA-Z ]/, reverse: true
                }
            }
        });

        $('.twAlbhabets-only').mask('ZZZZZZZZZZZZZZZZZZZZ', {
            translation: {
                'Z': {
                    pattern: /[a-zA-Z ]/, reverse: true
                }
            }
        })
    }

    var ValidateEmployee = function () {
        var isvalid = true;
        var EmployeeName = $.trim($('#Emp_name').val());
        var ContactNumber = $.trim($('#contact-Number').val());
        //var accountNumber = $.trim($('#txt-Account-Number').val());
        //var reEnterAccountNumber = $.trim($('#txt-reenter-Account-Number').val());
        if (EmployeeName == '' || EmployeeName == null) {
            isvalid = false;
            $('#EmployeeName-Validation').show();
        }

        //if (accountNumber != '' && (reEnterAccountNumber == '' || reEnterAccountNumber == null)) {
        //    $('#vendorEmptReAccNumber-Validation').show();
        //    isvalid = false;
        //}
        //if (reEnterAccountNumber != '' && accountNumber != reEnterAccountNumber) {
        //    $('#vendorReAccNumber-Validation').show();
        //    isvalid = false;
        //}

        //if (EmployeeName != '') {
        //    var existingEmployee = masterData["ExistingEmployees"];
        //    if (existingEmployee != null && existingEmployee != undefined && existingEmploye.length > 0) {
        //        if (editEmployeeID == 0) {
        //            var matchedEmployeeRecord = GetmatchedRecord(existingEmployee, 'EmployeeName', EmployeeName);
        //            if (matchedEmployeeRecord.length > 0) {
        //                isvalid = false;
        //                $.notify("Employee Name is already exists!", { position: "right top", EmployeeName: "error" });
        //            }
        //        }
        //        else {
        //            var unMatchedEmployees = GetunmatchedRecord(existingEmployee, 'EmployeeID', editEmployeID);
        //            var matchedEmployeeRecord = GetmatchedRecord(unMatchedEmployees, 'EmployeeName', EmployeeName);
        //            if (matchedEmployeeRecord.length > 0) {
        //                isvalid = false;
        //                $.notify("Employee Name is already exists!", { position: "right top", EmployeeName: "error" });
        //            }
        //        }
        //    }

        //}
        return isvalid;
    }
}

//File Drag And Drop
{
    var RegisterFileDrop = function () {

        //if (editBillId == 0)
        //{
        // if (fileContainer.length == 0) {

        $("#file_Viewer").on({

            'dragover dragenter': function (e) {
                $('#file_Viewer').addClass('isc-bill-drag')
                fileContainer = [];
                e.preventDefault();
                e.stopPropagation();

            },

            'drop': function (e, ui) {
                e.preventDefault();
                fileContainer = [];
                var dataTransfer = e.originalEvent.dataTransfer;
                var Files = dataTransfer.files;
                $('#file_Viewer').removeClass('isc-bill-drag');
                // var Files = $(this).prop("files");
                fileContainer = [];
                var type = Files[0]["type"];
                const size = (Files[0]["size"] / 1024 / 1024).toFixed(2);
                if (size > 10) {
                    $(this).val('');
                    $.notify("File Size should not  greater than 10 MB,Select another file  ", { position: "right top", className: "error" });
                }
                else if ($.inArray(type, ['image/png', 'image/jpg', 'image/jpeg']) == -1) {
                    $(this).val('');
                    $.notify("File extention is not allowed,Select another file  ", { position: "right top", className: "error" });
                }
                else {
                    fileContainer.push(Files[0])
                    fileSize = size;
                    saveFiles();
                    fileName = fileResponse["ModifiedFileName"];
                    VendorLogoFrames(fileName)
                }

            }
        });
    }
}

//Browse Logo
{
    $(document).on('change', '#browseLogo', function () {
        var Files = $(this).prop("files");
        fileContainer = [];
        var type = Files[0]["type"];
        const size = (Files[0]["size"] / 1024 / 1024).toFixed(2);
        if (size > 10) {
            $(this).val('');
            $.notify("File Size should not  greater than 10 MB,Select another file  ", { position: "right top", className: "error" });
        }
        else if ($.inArray(type, ['image/png', 'image/jpg', 'image/jpeg']) == -1) {
            $(this).val('');
            $.notify("File extention is not allowed,Select another file  ", { position: "right top", className: "error" });
        }
        else {
            fileContainer.push(Files[0])
            fileSize = size;
            saveFiles();
            fileName = fileResponse["ModifiedFileName"];
            EmployeLogoFrames(fileName)
        }
    });

}



$(document).on('click', '#remove-Logo', function () {

    var html = "";
    fileName = "";
    fileContainer = [];
    html += '<h2>LOGO</h2>';
    html += '<span class="isc-btn-inp-typ-file-s1" >Choose Company Logo';
    html += '<input type="file" id="browseLogo" name="filename" accept="image/gif, image/jpeg, image/png" style="width: 200px;">';
    html += '</span>';
    $('#file_Viewer').html(html);
});