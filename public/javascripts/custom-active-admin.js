$(document).ready(function() {
    $(".admin_role_select").change(function(){show_hide_company_select();});
    show_hide_company_select();
    setup_slimbox();
});

function show_hide_company_select(){
    var role = $(".admin_role_select").val();
    if(role == "1" || role == "2"){
        $(".admin_company_select").parent().show();
    }
    else {
        $(".admin_company_select").parent().hide();
    }
}

function setup_slimbox(){
    $("a[rel='lightbox']").slimbox({/* Put custom options here */}, null, function(el) {
        return (this == el) || ((this.rel.length > 8) && (this.rel == el.rel));
    });
}
