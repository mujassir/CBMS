
        var validateShowMath = false

    function showmath() {
        var PAmount = document.getElementById("TexBoxPurAmot");
        var Prate = document.getElementById("TexBPR");
        var PFname = document.getElementById("TexBPCN");
        var PSname = document.getElementById("TextBPSN");
        var PRaddress = document.getElementById("TexBRA");
        var PIdnumber = document.getElementById("TexBPIDNo");
        var PBclick = document.getElementById("LinkButtSave");

        event.preventDefault();

        if (PAmount.value == "" || PAmount.value == "0" || PAmount.value == ".") {
            Swal.fire('Amount Feilds is Blank')
            PAmount.focus();
            return false;
        }
        else if (Prate.value == "" || Prate.value == "0" || Prate.value == ".") {
            Swal.fire('Purchase Rate is Blank')
            Prate.focus();
            return false;
        }
        else if (PFname.value == "") {
            Swal.fire('First Name Required')
            PFname.focus();
            return false;
        }
        else if (PSname.value == "") {
            Swal.fire('Surname Name Required')
            PSname.focus();
            return false;
        }
        else if (PRaddress.value == "") {
            Swal.fire('Address Required')
            PRaddress.focus();
            return false;
        }
        else if (PIdnumber.value == "") {
            Swal.fire('Id Number Required')
            PIdnumber.focus();
            return false;
        }
        else {
            validateShowMath = true;
            PBclick.click();
            return true;      
        }
    }


