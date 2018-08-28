/* 选项框全选或全不选函数 */
function checkAll(){
	$("#checkAll").click(function () {
        if ($("#checkAll").prop('checked')) {
            $("#checkAll").prop("checked", true);
            $("input[name=checkitem]:checkbox").prop("checked", true);
        } else {
            $("#checkAll").prop("checked", false);
            $("input[name=checkitem]:checkbox").prop("checked", false);
        }
    }); 
    //当其中不勾选某一个选项的时候,则去掉全选复选框
    $(":checkbox[name=checkitem]").click(function () {
        $("#checkAll").prop('checked',
            $(":checkbox[name='checkitem']").length == $(":checkbox[name='checkitem']:checked").length);
    });
}
$(document).ready(function(){
	checkAll();  /* 调用选项框全选函数 */

});