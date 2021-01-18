
var validatePurMaths = false;
function PurMaths() {
    var TBPM = document.getElementById("TexBoxPurAmot").value;
    var TBPR = document.getElementById("TexBPR").value;

    event.preventDefault();


    if (TBPM.value == "" || TBPM.value <= "0") {
        Swal.fire('Amount Feilds is Blank')
        TBPM.focus();
        return false;
    }

    else if (TBPR.value == "" || TBPR.value <= "0") {
        Swal.fire('Purchase Rate is Blank')
        TBPR.focus();
        return false;
    }
    else {
        TBpCE = TBPM * TBPR;
        TBaM = TBPM;
        document.getElementById("TexBPCE").value = TBpCE;
        document.getElementById("TexBAM").value = TBaM;
        validatePurMaths = true;
        TBpfn.focus();
        return true;
    }


}