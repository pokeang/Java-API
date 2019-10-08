<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<c:url value="resources/js/jquery-1.4.2.min.js" />"></script>
	<script type="text/javascript"
	src="<c:url value="resources/js/i18n/grid.locale-en.js" />"></script>
	<script type="text/javascript"
	src="<c:url value="resources/js/grid.addons.js" />"></script>
<script type="text/javascript"
	src="<c:url value="resources/js/jquery.jqGrid.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="resources/js/jquery-ui-custom.js" />"></script>
<link rel="stylesheet"
	href="<c:url value="resources/css/jquery-ui-custom.css" />"></link>
	<link rel="stylesheet"
	href="<c:url value="resources/css/ui.jqgrid.css" />"></link>
<title>Insert title here</title>
</head>
<body>
	
	<table id="list"></table>
	<div id="pager"></div>
	<script type="text/javascript">
	$(function () { // $("#id_g").val(), //id2 = 
		var mydata = [
	                    { id: "1",  invdate: "2007-10-21", name: "test",   note: "3note",   amount: "200.00", tax: "10.00", closed: true,  ship_via: "TN", total: "210.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "750"}, {no: "3", amount: "600"}, {no: "4", amount: "900"}] },
	                    { id: "2",  invdate: "2007-10-22", name: "test2",  note: "3note2",  amount: "300.00", tax: "20.00", closed: false, ship_via: "FE", total: "320.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "600"}, {no: "3", amount: "900"}] },
	                    { id: "3",  invdate: "2007-09-01", name: "test3",  note: "3note3",  amount: "400.00", tax: "30.00", closed: false, ship_via: "FE", total: "430.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "750"}, {no: "3", amount: "600"}, {no: "4", amount: "900"}] },
	                    { id: "4",  invdate: "2007-10-14", name: "test4",  note: "3note4",  amount: "200.00", tax: "10.00", closed: true,  ship_via: "TN", total: "210.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "500"}, {no: "3", amount: "900"}] },
	                    { id: "5",  invdate: "2007-10-31", name: "test5",  note: "3note5",  amount: "300.00", tax: "20.00", closed: false, ship_via: "FE", total: "320.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "750"}, {no: "3", amount: "600"}, {no: "4", amount: "900"}] },
	                    { id: "6",  invdate: "2007-09-06", name: "test6",  note: "3note6",  amount: "400.00", tax: "30.00", closed: false, ship_via: "FE", total: "430.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "400"}, {no: "3", amount: "900"}] },
	                    { id: "7",  invdate: "2007-10-04", name: "test7",  note: "3note7",  amount: "200.00", tax: "10.00", closed: true,  ship_via: "TN", total: "210.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "750"}, {no: "3", amount: "600"}, {no: "4", amount: "900"}] },
	                    { id: "8",  invdate: "2007-10-03", name: "test8",  note: "3note8",  amount: "300.00", tax: "20.00", closed: false, ship_via: "FE", total: "320.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "300"}, {no: "3", amount: "900"}] },
	                    { id: "9",  invdate: "2007-09-22", name: "test9",  note: "3note9",  amount: "400.00", tax: "30.00", closed: false, ship_via: "TN", total: "430.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "750"}, {no: "3", amount: "600"}, {no: "4", amount: "900"}] },
	                    { id: "10", invdate: "2007-09-08", name: "test10", note: "3note10", amount: "500.00", tax: "30.00", closed: true,  ship_via: "TN", total: "530.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "200"}, {no: "3", amount: "900"}] },
	                    { id: "11", invdate: "2007-09-28", name: "test11", note: "3note11", amount: "500.00", tax: "30.00", closed: false, ship_via: "FE", total: "530.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "750"}, {no: "3", amount: "600"}, {no: "4", amount: "900"}] },
	                    { id: "12", invdate: "2007-09-10", name: "test12", note: "3note12", amount: "500.00", tax: "30.00", closed: false, ship_via: "FE", total: "530.00",
	                        subgrid: [{no: "1", amount: "750"}, {no: "2", amount: "100"}, {no: "3", amount: "900"}] }
	                ],
	                initDatepicker = function (elem) {
	                    $(elem).datepicker({
	                        autoSize: true,
	                        changeYear: true,
	                        changeMonth: true,
	                        showButtonPanel: true,
	                        showWeek: true
	                    });
	                },
	                numberTemplate = {formatter: "number", align: "right", sorttype: "number",
	                    editrules: {number: true, required: true},
	                    searchoptions: { sopt: ["eq", "ne", "lt", "le", "gt", "ge", "nu", "nn", "in", "ni"] }},
	                showDetails = function ($form) {
	                    var $this = $(this),
	                        rowid1 = $this.jqGrid("getGridParam", "selrow"),
	                        rowid = $("#id_g").val(), //id2 = $form.find("input[name=id]").val(),
	                        localRowData = $this.jqGrid("getLocalRow", rowid);
	                    if ($("#mysubgrid").length === 0) {
	                        // if not in afterclickPgButtons for example
	                        $("#trv_closed").after('<tr class="FormData">' +
	                            '<td class="CaptionTD form-view-label ui-widget-content" width="40%"><b>Order Particulars</b></td>' +
	                            '<td class="DataTD form-view-data ui-helper-reset ui-widget-content"><div style="width:100%;height:100%">' +
	                            '<table id="mysubgrid"><tr><td>' +
	                            '</td></tr></table>' +
	                            '</div></td></tr>');
	                         $("#mysubgrid").jqGrid({
	                             datatype: "local",
	                             data: localRowData.subgrid,
	                             colNames: ["#", "Amount"],
	                             colModel: [
	                                 {name: "no", width: 40, sorttype: "integer"},
	                                 {name: "amount", width: 70, sorttype: "integer"}
	                             ],
	                             idPrefix: "s",
	                             sortname: "no",
	                             rowNum: 1000,
	                             height: "auto"
	                         });
	                    } else {
	                        // update $("#mysubgrid") with new data
	                        $("#mysubgrid").jqGrid("clearGridData")
	                            .jqGrid("setGridParam", {data: localRowData.subgrid})
	                            .trigger("reloadGrid");
	                    }
	                };
	                $("#list").jqGrid({
	                    datatype: "local",
	                    data: mydata,
	                    colNames: ["Client", "Date", "Amount", "Tax", "Total", "Closed", "Shipped via", "Notes"],
	                    colModel: [
	                        { name: "name", width: 65, editrules: {required: true} },
	                        { name: "invdate", width: 80, align: "center", sorttype: "date",
	                            formatter: "date",
	                            searchoptions: { sopt: ["eq", "ne", "lt", "le", "gt", "ge"], dataInit: initDatepicker } },
	                        { name: "amount", width: 75, template: numberTemplate },
	                        { name: "tax", width: 52, template: numberTemplate },
	                        { name: "total", width: 60, template: numberTemplate },
	                        {name: "closed", width: 70, align: "center", formatter: "checkbox",
	                            edittype: "checkbox", editoptions: {value: "Yes:No", defaultValue: "Yes"},
	                            stype: "select", searchoptions: { sopt: ["eq", "ne"], value: ":Any;true:Yes;false:No" } },
	                        {name: "ship_via", width: 105, align: "center", formatter: "select",
	                            edittype: "select", editoptions: { value: "FE:FedEx;TN:TNT;IN:Intim", defaultValue: "FE" },
	                            stype: "select", searchoptions: { sopt: ["eq", "ne"], value: ":Any;FE:FedEx;TN:TNT;IN:Intim" } },
	                        { name: "note", width: 60, sortable: false, search: false, edittype: "textarea" }
	                    ],
	                    cmTemplate: { editable: true },
	                    rowNum: 10,
	                    rowList: [5, 10, 20],
	                    pager: "#pager",
	                    gridview: true,
	                    rownumbers: true,
	                    autoencode: true,
	                    ignoreCase: true,
	                    sortname: "invdate",
	                    viewrecords: true,
	                    sortorder: "desc",
	                    shrinkToFit: false,
	                    height: "auto"
	                }).jqGrid("navGrid", "#pager", {edit: false, add: false, del: false, view: true, search: false}, {}, {}, {}, {}, {
	                    recreateForm: true,
	                    afterclickPgButtons: function (buttonName, $form, pos) {
	                        showDetails.call(this, $form);
	                    },
	                    beforeShowForm: showDetails,
	                    labelswidth: '40%'
	                });
	            });
	</script>
</body>
</html>