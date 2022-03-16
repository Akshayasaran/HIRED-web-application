function validateTab() {
  var activeTabs = document.getElementsByClassName(
    "tab-pane active px-sm-3 px-md-5"
  );
  var activeTab = activeTabs[0];
  var previousbutton = document.getElementById("previousbutton");
  activeTab.firstElementChild.classList.add("was-validated");
  if (activeTab.id == "bootstrap-wizard-tab1" && !validateAccount())
    previousbutton.click();
  if (activeTab.id == "bootstrap-wizard-tab2" && !validatePersonal())
    previousbutton.click();
  // if (activeTab.id == "bootstrap-wizard-tab3") validateEducation();
  // if (activeTab.id == "bootstrap-wizard-tab4") validateWork();
}

function validateAccount() {
  var account_name = document.getElementById("account-name");
  var account_email = document.getElementById("account-email");
  var password = document.getElementById("account-password");
  var cpassword = document.getElementById("account-confirm-password");
  var personal_summary = document.getElementById("account-summary");
  var account_terms = document.getElementById("account-terms");
  var validEmailRegex =
    /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

  if (account_name.value == null || account_name.value == "") return false;
  if (
    account_email.value == null ||
    account_email.value == "" ||
    !account_email.value.match(validEmailRegex)
  )
    return false;
  if (
    password.value == null ||
    password.value == "" ||
    password.value.length < 8
  )
    return false;
  if (password.value != cpassword.value) return false;
  if (!account_terms.checked) return false;
  return true;
}

function validatePersonal() {
  var gender = document.getElementById("personal-gender").value;
  var phone = document.getElementById("personal-phone").value;
  var dob = document.getElementById("personal-dob").value;
  var city = document.getElementById("personal-city").value;
  var state = document.getElementById("personal-state").value;
  var pincode = document.getElementById("personal-pincode").value;

  if (gender == "" || gender == null) return false;
  if (phone == "" || phone == null) return false;
  if (dob == "" || dob == null) return false;
  if (city == "" || city == null) return false;
  if (state == "" || state == null) return false;
  if (pincode == "" || pincode == null) return false;
  return true;
}

function validateEducation() {}
