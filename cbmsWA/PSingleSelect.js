(function ($) {
    var checkboxes = $('.checkBox > input[type=checkbox]');
    $(checkboxes).on('click', function (evt) {
        var selected = $(this).attr('id');
      
        $(checkboxes).each(function (index) {
            var parentPR = $(this).parents('tr');
            if ($(this).attr('id') !== selected) {
                $(this).prop("checked", false);
                parentPR.removeClass("selected_row");
            } else {

                if ($(this).prop("checked")) {
                    if (!parentPR.hasClass("selected_row")) {
                        parentPR.addClass("selected_row");
                    }
                    $("#TextBPDELETE").val(parentPR.children("th:nth-child(2)").text());
                    $("#LinkButtDelete").removeClass("aspNetDisabled").attr("href", "javascript: __doPostBack('LinkButtDelete', '')");
                } else {
                    $("#TextBPDELETE").val("");
                    parentPR.removeClass("selected_row");
                    $("#LinkButtDelete").addClass("aspNetDisabled").removeAttr("href");
                }
                
            }

        });

    });




}).apply(this, [jQuery]);
