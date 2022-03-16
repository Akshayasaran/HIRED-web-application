<%@page import="Bean.User"%>
<%@page import="Bean.IProfile"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Falcon | Dashboard &amp; Web App Templat</title>

        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="../assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="../assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="../assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicons/favicon.ico">
        <link rel="manifest" href="../assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="../assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <script src="../assets/js/config.js"></script>
        <script src="../vendors/overlayscrollbars/OverlayScrollbars.min.js"></script>
        <script src="./validation.js"></script>

        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        <link href="../vendors/flatpickr/flatpickr.min.css" rel="stylesheet">
        <link href="../vendors/dropzone/dropzone.min.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:100,200,300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
        <link href="../vendors/overlayscrollbars/OverlayScrollbars.min.css" rel="stylesheet">
        <link href="../assets/css/theme-rtl.min.css" rel="stylesheet" id="style-rtl">
        <link href="../assets/css/theme.min.css" rel="stylesheet" id="style-default">
        <link href="../assets/css/user-rtl.min.css" rel="stylesheet" id="user-style-rtl">
        <link href="../assets/css/user.min.css" rel="stylesheet" id="user-style-default">
        <script>
            var isRTL = JSON.parse(localStorage.getItem('isRTL'));
            if (isRTL) {
                var linkDefault = document.getElementById('style-default');
                var userLinkDefault = document.getElementById('user-style-default');
                linkDefault.setAttribute('disabled', true);
                userLinkDefault.setAttribute('disabled', true);
                document.querySelector('html').setAttribute('dir', 'rtl');
            } else {
                var linkRTL = document.getElementById('style-rtl');
                var userLinkRTL = document.getElementById('user-style-rtl');
                linkRTL.setAttribute('disabled', true);
                userLinkRTL.setAttribute('disabled', true);
            }
        </script>
    </head>

    <body>

        <%

            session = request.getSession();
            String loginUser = "";
            if (session != null && session.getAttribute("loginUser") != null) {
                loginUser = (String) session.getAttribute("loginUser");
            } else {
                Cookie cookie = new Cookie("message", "login_first");
                cookie.setMaxAge(5);
                response.addCookie(cookie);
                response.sendRedirect(request.getContextPath() + "/v1.0.0/authentication/basic/login.jsp");
            }

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("message")) {
                        if (cookie.getValue().equals("profile_fail")) {
                            out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>Profile could not be added!</strong><button class='btn-close' type='button' data-bs-dismiss='alert' aria-label='Close'></button></div>");
                        }
                    }
                    if (cookie.getValue().equals("profile_error")) {
                        out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>Something went wrong! Please try again later.</strong><button class='btn-close' type='button' data-bs-dismiss='alert' aria-label='Close'></button></div>");
                    }
                }
            }
            String profileOperation = request.getParameter("operation");
            profileOperation = profileOperation == null ? "" : profileOperation;
            User userBean = User.getUserById(loginUser);
            IProfile profileBean = IProfile.getProfileById(loginUser);

        %>

        <!-- ===============================================-->
        <!--    Main Content-->
        <!-- ===============================================-->
        <main class="main" id="top">
            <div class="container" data-layout="container">
                <script>
                    var isFluid = JSON.parse(localStorage.getItem('isFluid'));
                    if (isFluid) {
                        var container = document.querySelector('[data-layout]');
                        container.classList.remove('container');
                        container.classList.add('container-fluid');
                    }
                </script>

                <div class="row justify-content-center pt-6">
                    <div class="col-sm-10 col-lg-7 col-xxl-5"><a class="d-flex flex-center mb-4" href="../home.jsp"><img class="me-2" src="../assets/img/illustrations/falcon.png" alt="" width="45" /><span class="font-sans-serif fw-bolder fs-4 d-inline-block">Hired</span></a>
                        <div class="card theme-wizard mb-5" id="wizard">
                            <div class="card-header bg-light pt-3 pb-2">
                                <ul class="nav justify-content-between nav-wizard">
                                    <li class="nav-item"><a class="nav-link active fw-semi-bold" href="#bootstrap-wizard-tab1" data-bs-toggle="tab" data-wizard-step="data-wizard-step"><span class="nav-item-circle-parent"><span class="nav-item-circle"><span class="fas fa-lock"></span></span></span><span class="d-none d-md-block mt-1 fs--1">Account</span></a></li>
                                    <li class="nav-item"><a class="nav-link fw-semi-bold" href="#bootstrap-wizard-tab2" data-bs-toggle="tab" data-wizard-step="data-wizard-step"><span class="nav-item-circle-parent"><span class="nav-item-circle"><span class="fas fa-user"></span></span></span><span class="d-none d-md-block mt-1 fs--1">Personal</span></a></li>
                                    <li class="nav-item"><a class="nav-link fw-semi-bold" href="#bootstrap-wizard-tab3" data-bs-toggle="tab" data-wizard-step="data-wizard-step"><span class="nav-item-circle-parent"><span class="nav-item-circle"><span class="fas fa-university"></span></span></span><span class="d-none d-md-block mt-1 fs--1">Education</span></a></li>
                                    <li class="nav-item"><a class="nav-link fw-semi-bold" href="#bootstrap-wizard-tab4" data-bs-toggle="tab" data-wizard-step="data-wizard-step"><span class="nav-item-circle-parent"><span class="nav-item-circle"><span class="fas fa-tools"></span></span></span><span class="d-none d-md-block mt-1 fs--1">Work</span></a></li>
                                    <li class="nav-item"><a class="nav-link fw-semi-bold" href="#bootstrap-wizard-tab5" data-bs-toggle="tab" data-wizard-step="data-wizard-step"><span class="nav-item-circle-parent"><span class="nav-item-circle"><span class="fas fa-thumbs-up"></span></span></span><span class="d-none d-md-block mt-1 fs--1">Done</span></a></li>
                                </ul>
                            </div>
                            <div class="card-body py-4" id="wizard-controller">
                                <form action="<%= request.getContextPath()%>/ProfileUpdate" method="POST" id="profile-form" enctype="multipart/form-data" >
                                    <form></form>
                                    <div class="tab-content">
                                        <div class="tab-pane active px-sm-3 px-md-5" role="tabpanel" aria-labelledby="bootstrap-wizard-tab1" id="bootstrap-wizard-tab1">
                                            <form class="needs-validation" novalidate="novalidate">
                                                <input type="hidden" form="profile-form" id="profile-operation" name="profile-operation" value="<%= profileOperation%>"/>
                                                       <div class="mb-3"><label class="form-label" for="account-name">Name*</label><input form="profile-form" form="profile-form" class="form-control" type="text" name="account-name" placeholder="John Smith" required="required" id="account-name" value="<%= userBean != null ? userBean.getUserName() : ""%>" />
                                                    <div class="invalid-feedback">You must add Name</div>
                                                </div>
                                                <div class="mb-3"><label class="form-label" for="account-email">Email*</label><input form="profile-form" class="form-control" type="email" value="<%= userBean != null ? userBean.getEmailId() : ""%>" name="account-email" placeholder="Email address" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,}$" required="required" id="account-email" data-wizard-validate-email="true" />
                                                    <div class="invalid-feedback">You must add email</div>
                                                </div>
                                                <div class="row g-2">
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="account-password">Password*</label><input form="profile-form" class="form-control" type="password" value="<%= userBean != null ? userBean.getPassword() : ""%>" name="account-password" placeholder="Password"  pattern="[a-zA-Z0-9]{8,}$" required="required" id="account-password" data-wizard-validate-password="true" />
                                                            <div class="invalid-feedback">please enter password</div>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="account-confirm-password">Confirm Password*</label><input form="profile-form" class="form-control" type="password" value="<%= userBean != null ? userBean.getPassword() : ""%>" name="account-confirm-password" pattern="[a-zA-Z0-9]{8,}$" placeholder="Confirm Password" required="required" id="account-confirm-password" />
                                                            <div class="invalid-feedback">please enter password</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3"><label class="form-label" for="account-summary">Personal Summary</label><textarea form="profile-form" class="form-control" rows="4" name="account-summary" id="account-summary"> <%= profileBean != null ? profileBean.getAccountSummary() : ""%> </textarea></div>
                                                <div class="form-check"><input form="profile-form" class="form-check-input" type="checkbox" name="account-terms" required="required" checked="checked" id="account-terms" /><label class="form-check-label" for="account-terms">I accept the <a href="#!">terms </a>and <a href="#!">privacy policy</a></label></div>
                                            </form>
                                        </div>

                                        <div class="tab-pane px-sm-3 px-md-5" role="tabpanel" aria-labelledby="bootstrap-wizard-tab2" id="bootstrap-wizard-tab2">
                                            <form class="needs-validation" novalidate="novalidate" enctype="multipart/form-data" >
                                                <div class="mb-3">
                                                    <input form="profile-form" type="file" name="personal-dp-picture" id="personal-dp-picture" />
                                                    <div class="row" data-dropzone="data-dropzone" data-options='{"maxFiles":1,"data":[{"name":"avatar.png","url":"../assets/img/team"}]}'>
                                                        <div class="fallback"></div>
                                                        <div class="col-md-auto">
                                                            <div class="dz-preview dz-preview-single">
                                                                <div class="dz-preview-cover d-flex align-items-center justify-content-center mb-3 mb-md-0">
                                                                    <div class="avatar avatar-4xl"><img class="rounded-circle" src="../assets/img/team/avatar.png" alt="..." data-dz-thumbnail="data-dz-thumbnail" /></div>
                                                                    <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress=""></span></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md">
                                                            <div class="dz-message dropzone-area px-2 py-3" data-dz-message="data-dz-message">
                                                                <div class="text-center"><img class="me-2" src="../assets/img/icons/cloud-upload.svg" width="25" alt="" />Upload your profile picture<p class="mb-0 fs--1 text-400">Upload a 300x300 jpg image with <br />a maximum size of 400KB</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="mb-3"><label class="form-label" for="personal-gender">Gender*</label><select form="profile-form" class="form-select" name="personal-gender" required="required" id="personal-gender">
                                                        <option value="">Select your gender ...</option>
                                                        <% String[] genderArray = new String[]{"Male", "Female", "Other"};
                                                            for (int i = 0; i < 3; i++) {
                                                        %>
                                                        <option value="<%= genderArray[i]%>"
                                                                <% if (profileBean != null && profileBean.getPersonalGender().equals(genderArray[i])) { %>
                                                                selected
                                                                <% }%>
                                                                ><%= genderArray[i]%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                    <div class="invalid-feedback">Select one</div>
                                                </div>
                                                <div class="mb-3"><label class="form-label" for="personal-phone">Phone*</label><input form="profile-form" class="form-control" type="text" value="<%= profileBean != null ? profileBean.getPersonalPhone() : ""%>" name="personal-phone" placeholder="Phone" required="required" id="personal-phone" />
                                                    <div class="invalid-feedback">Provide a Phone number</div></div>
                                                <div class="mb-3"><label class="form-label" for="personal-dob">Date of Birth*</label><input form="profile-form" class="form-control datetimepicker" type="text" value="<%= profileBean != null ? profileBean.getPersonalDOB() : ""%>" placeholder="yyyy-mm-dd" data-options='{"dateFormat":"Y-m-d","disableMobile":true}' required="required" name="personal-dob" id="personal-dob" />
                                                    <div class="invalid-feedback">Provide your Date of Birth</div>
                                                </div>
                                                <div class="mb-3"><label class="form-label" for="personal-address">Address</label><textarea form="profile-form" class="form-control" rows="4" name="personal-address" id="personal-address"><%= profileBean != null ? profileBean.getPersonalAddress() : ""%></textarea></div>
                                                <div class="mb-3"><label class="form-label" for="personal-city">City</label><input form="profile-form" class="form-control" type="text" value="<%= profileBean != null ? profileBean.getPersonalCity() : ""%>" name="personal-city" placeholder="Chennai" required="required" id="personal-city" />
                                                    <div class="invalid-feedback">Provide a City</div></div>
                                                <div class="mb-3"><label class="form-label" for="personal-state">State</label><input form="profile-form" class="form-control" type="text" value="<%= profileBean != null ? profileBean.getPersonalState() : ""%>" name="personal-state" placeholder="Tamil Nadu" required="required" id="personal-state" />
                                                    <div class="invalid-feedback">Provide a State</div></div>
                                                <div class="mb-3"><label class="form-label" for="personal-pincode">PIN Code*</label><input form="profile-form" class="form-control" type="text" value="<%= profileBean != null ? profileBean.getPersonalPINCode() : ""%>" name="personal-pincode" placeholder="600123" required="required" id="personal-pincode" />
                                                    <div class="invalid-feedback">Provide a PIN Code</div></div>
                                            </form>
                                        </div>
                                        <div class="tab-pane px-sm-3 px-md-5" role="tabpanel" aria-labelledby="bootstrap-wizard-tab3" id="bootstrap-wizard-tab3">
                                            <!-- <form class="form-validation"> -->
                                            <form class="needs-validation" novalidate="novalidate">
                                                <div class="row g-2">
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="education-study-field">Field of Study</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getEducationFieldStudy() : ""%>" class="form-control" placeholder="Computer Science, Medical" type="text" name="education-study-field" id="education-study-field" /></div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="mb-3"><label class="form-label" for="education-degree">Degree</label><select form="profile-form" class="form-select" name="education-degree" id="education-degree">
                                                                <option value="">Select your Degree ...</option>

                                                                <% String[] degreeArray = new String[]{"Phd", "Mtech", "ME", "MBA", "MSc", "MA", "Btech", "BE", "BBA", "BSc", "BA", "High School", "Uneducated"};
                                                                    for (int i = 0; i < degreeArray.length; i++) {
                                                                %>
                                                                <option value="<%= degreeArray[i]%>"
                                                                        <% if (profileBean != null && profileBean.getEducationDegree().equals(degreeArray[i])) { %>
                                                                        selected
                                                                        <% }%>
                                                                        ><%= degreeArray[i]%></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select></div>
                                                    </div>
                                                </div>
                                                <div class="row g-2">
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="education-city">City</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getEducationCity() : ""%>" class="form-control" placeholder="Chennai" name="education-city" type="text" id="education-city" /></div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="education-state">State</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getEducationState() : ""%>" class="form-control" placeholder="Tamil Nadu" name="education-state" type="text" id="education-state" /></div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="education-school-name">School Name</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getEducationSchoolName() : ""%>" class="form-control" placeholder="School Name" name="education-school-name" type="text" id="education-school-name" /></div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group mb-0"><label class="form-label" for="education-graduation-date">Graduation Date</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getEducationGraduationDate() : ""%>" class="form-control datetimepicker" type="text" placeholder="yyyy-mm-dd" data-options='{"dateFormat":"Y-m-d","disableMobile":true}' name="education-graduation-date" id="education-graduation-date" /></div>
                                                        <div class="form-check"><input form="profile-form"
                                                                                       <% if (profileBean != null && profileBean.getEducationStillGraduating() != null) {
                                                                                       %>
                                                                                       checked="checked"                                                            
                                                                                       <%
                                                                                           }
                                                                                       %>
                                                                                       class="form-check-input" name="education-stillgraduating" id="education-stillgraduating" type="checkbox" value="" /><label class="form-check-label" for="education-stillgraduating">Still Graduating</label></div>
                                                    </div>
                                                    <div class="mb-3"><label class="form-label" for="education-resume-file">Add your Resume</label><input form="profile-form" class="form-control" name="education-resume-file" id="education-resume-file" type="file" /></div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="tab-pane px-sm-3 px-md-5" role="tabpanel" aria-labelledby="bootstrap-wizard-tab4" id="bootstrap-wizard-tab4">
                                            <!-- <form class="form-validation"> -->
                                            <form class="needs-validation" novalidate="novalidate">
                                                <div class="row g-2">
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="work-job-title">Job Title</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getWorkJobTitle() : ""%>" class="form-control" placeholder="Manager" type="text" name="work-job-title" id="work-job-title" /></div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="work-company-name">Company Name</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getWorkCompanyName() : ""%>" class="form-control" placeholder="IBM" type="text" name="work-company-name" id="work-company-name" /></div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="work-job-location">Location</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getWorkJobLocation() : ""%>" class="form-control" placeholder="Chennai" type="text" name="work-job-location" id="work-job-location" /></div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mb-3"><label class="form-label" for="work-experience-year">Years of Experience</label><input form="profile-form" value="<%= profileBean != null ? profileBean.getWorkExperienceYear() : ""%>" class="form-control" placeholder="Years of Experience" type="text" name="work-experience-year" id="work-experience-year" /></div>
                                                        <div class="form-check"><input form="profile-form" class="form-check-input" 
                                                                                       <% if (profileBean != null && profileBean.getWorkStillWorking() != null) {
                                                                                       %>
                                                                                       checked="checked"                                                            
                                                                                       <%
                                                                                           }
                                                                                       %>
                                                                                       name="work-still-working" id="work-still-working" type="checkbox" value="" /><label class="form-check-label" for="work-still-working">Still Working</label></div>
                                                    </div>
                                                    <div class="mb-3"><label class="form-label" for="work-job-description">Job Description</label><textarea form="profile-form" class="form-control" rows="4" placeholder="Tell us about your role there." name="work-job-description" id="work-job-description"><%= profileBean != null ? profileBean.getWorkJobDescription() : ""%></textarea></div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane text-center px-sm-3 px-md-5" role="tabpanel" aria-labelledby="bootstrap-wizard-tab5" id="bootstrap-wizard-tab5">
                                            <div class="wizard-lottie-wrapper">
                                                <div class="lottie wizard-lottie mx-auto my-3" data-options='{"path":"../assets/img/animated-icons/celebration.json"}'></div>
                                            </div>
                                            <h4 class="mb-1">Your account is all set!</h4>
                                            <!-- <p>Now you can access to your account</p><a class="btn btn-primary px-5 my-3" href="wizard.html">Start Over</a> -->
                                            <p>Click here to save to changes and continue</p><input type="submit" class="btn btn-primary px-5 my-3" value="Save Changes" form="profile-form">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer bg-light">
                                <div class="px-sm-3 px-md-5">
                                    <ul class="pager wizard list-inline mb-0">
                                        <li class="previous"><button id="previousbutton" class="btn btn-link ps-0" type="button"><span class="fas fa-chevron-left me-2" data-fa-transform="shrink-3"></span>Prev</button></li>
                                        <li class="next"><button id="nextbutton" onclick="validateTab();" class="btn btn-primary px-5 px-sm-6" type="button">Next<span class="fas fa-chevron-right ms-2" data-fa-transform="shrink-3"> </span></button></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal fade" id="error-modal" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 400px">
                            <div class="modal-content position-relative p-5">
                                <div class="d-flex align-items-center">
                                    <div class="lottie me-3" data-options='{"path":"../assets/img/animated-icons/warning-light.json"}'></div>
                                    <div class="flex-1"><button class="btn btn-link text-danger position-absolute top-0 end-0 mt-2 me-2" data-bs-dismiss="modal"><span class="fas fa-times"></span></button>
                                        <p class="mb-0">You don't have access to the link. Please try again.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main><!-- ===============================================-->
        <!--    End of Main Content-->
        <!-- ===============================================-->

        <div class="modal fade modal-fixed-right modal-theme overflow-hidden" id="settings-modal" tabindex="-1" role="dialog" aria-labelledby="settings-modal-label" aria-hidden="true">
            <div class="modal-dialog modal-dialog-vertical" role="document">
                <div class="modal-content border-0 vh-100 scrollbar-overlay">
                    <div class="modal-header modal-header-settings bg-shape">
                        <div class="z-index-1 py-1 light">
                            <h5 class="text-white" id="settings-modal-label"> <span class="fas fa-palette me-2 fs-0"></span>Settings</h5>
                            <p class="mb-0 fs--1 text-white opacity-75"> Set your own customized style</p>
                        </div><button class="btn-close btn-close-white z-index-1 mt-0" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-card" id="themeController">
                        <h5 class="fs-0">Color Scheme</h5>
                        <p class="fs--1">Choose the perfect color mode for your app. </p>
                        <div class="btn-group d-block w-100 btn-group-navbar-style">
                            <div class="row gx-2">
                                <div class="col-6"><input class="btn-check" id="themeSwitcherLight" name="theme-color" type="radio" value="light" data-theme-control="theme" /><label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherLight"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="../assets/img/generic/falcon-mode-default.jpg" alt=""/></span><span class="label-text">Light</span></label></div>
                                <div class="col-6"><input class="btn-check" id="themeSwitcherDark" name="theme-color" type="radio" value="dark" data-theme-control="theme" /><label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherDark"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="../assets/img/generic/falcon-mode-dark.jpg" alt=""/></span><span class="label-text"> Dark</span></label></div>
                            </div>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between">
                            <div class="d-flex align-items-start"><img class="me-2" src="../assets/img/icons/left-arrow-from-left.svg" width="20" alt="" />
                                <div class="flex-1">
                                    <h5 class="fs-0">RTL Mode</h5>
                                    <p class="fs--1 mb-0">Switch your language direction </p><a class="fs--1" href="../documentation/configuration.html">RTL Documentation</a>
                                </div>
                            </div>
                            <div class="form-check form-switch"><input class="form-check-input ms-0" id="mode-rtl" type="checkbox" data-theme-control="isRTL" /></div>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between">
                            <div class="d-flex align-items-start"><img class="me-2" src="../assets/img/icons/arrows-h.svg" width="20" alt="" />
                                <div class="flex-1">
                                    <h5 class="fs-0">Fluid Layout</h5>
                                    <p class="fs--1 mb-0">Toggle container layout system </p><a class="fs--1" href="../documentation/configuration.html">Fluid Documentation</a>
                                </div>
                            </div>
                            <div class="form-check form-switch"><input class="form-check-input ms-0" id="mode-fluid" type="checkbox" data-theme-control="isFluid" /></div>
                        </div>
                        <hr />
                        <div class="d-flex align-items-start"><img class="me-2" src="../assets/img/icons/paragraph.svg" width="20" alt="" />
                            <div class="flex-1">
                                <h5 class="fs-0 d-flex align-items-center">Navigation Position </h5>
                                <p class="fs--1 mb-2">Select a suitable navigation system for your web application </p>
                                <div>
                                    <div class="form-check form-check-inline"><input class="form-check-input" id="option-navbar-vertical" type="radio" name="navbar" value="vertical" data-theme-control="navbarPosition" /><label class="form-check-label" for="option-navbar-vertical">Vertical</label></div>
                                    <div class="form-check form-check-inline"><input class="form-check-input" id="option-navbar-top" type="radio" name="navbar" value="top" data-theme-control="navbarPosition" /><label class="form-check-label" for="option-navbar-top">Top</label></div>
                                    <div class="form-check form-check-inline me-0"><input class="form-check-input" id="option-navbar-combo" type="radio" name="navbar" value="combo" data-theme-control="navbarPosition" /><label class="form-check-label" for="option-navbar-combo">Combo</label></div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <h5 class="fs-0 d-flex align-items-center">Vertical Navbar Style</h5>
                        <p class="fs--1 mb-0">Switch between styles for your vertical navbar </p>
                        <p> <a class="fs--1" href="../components/navbar/vertical.html#navbar-styles">See Documentation</a></p>
                        <div class="btn-group d-block w-100 btn-group-navbar-style">
                            <div class="row gx-2">
                                <div class="col-6"><input class="btn-check" id="navbar-style-transparent" type="radio" name="navbarStyle" value="transparent" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-transparent"> <img class="img-fluid img-prototype" src="../assets/img/generic/default.png" alt="" /><span class="label-text"> Transparent</span></label></div>
                                <div class="col-6"><input class="btn-check" id="navbar-style-inverted" type="radio" name="navbarStyle" value="inverted" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-inverted"> <img class="img-fluid img-prototype" src="../assets/img/generic/inverted.png" alt="" /><span class="label-text"> Inverted</span></label></div>
                                <div class="col-6"><input class="btn-check" id="navbar-style-card" type="radio" name="navbarStyle" value="card" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-card"> <img class="img-fluid img-prototype" src="../assets/img/generic/card.png" alt="" /><span class="label-text"> Card</span></label></div>
                                <div class="col-6"><input class="btn-check" id="navbar-style-vibrant" type="radio" name="navbarStyle" value="vibrant" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-vibrant"> <img class="img-fluid img-prototype" src="../assets/img/generic/vibrant.png" alt="" /><span class="label-text"> Vibrant</span></label></div>
                            </div>
                        </div>
                        <div class="text-center mt-5"><img class="mb-4" src="../assets/img/illustrations/settings.png" alt="" width="120" />
                            <h5>Like What You See?</h5>
                            <p class="fs--1">Get Falcon now and create beautiful dashboards with hundreds of widgets.</p><a class="btn btn-primary" href="https://themes.getbootstrap.com/product/falcon-admin-dashboard-webapp-template/" target="_blank">Purchase</a>
                        </div>
                    </div>
                </div>
            </div>
        </div><a class="card setting-toggle" href="#settings-modal" data-bs-toggle="modal">
            <div class="card-body d-flex align-items-center py-md-2 px-2 py-1">
                <div class="bg-soft-primary position-relative rounded-start" style="height:34px;width:28px">
                    <div class="settings-popover"><span class="ripple"><span class="fa-spin position-absolute all-0 d-flex flex-center"><span class="icon-spin position-absolute all-0 d-flex flex-center"><svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M19.7369 12.3941L19.1989 12.1065C18.4459 11.7041 18.0843 10.8487 18.0843 9.99495C18.0843 9.14118 18.4459 8.28582 19.1989 7.88336L19.7369 7.59581C19.9474 7.47484 20.0316 7.23291 19.9474 7.03131C19.4842 5.57973 18.6843 4.28943 17.6738 3.20075C17.5053 3.03946 17.2527 2.99914 17.0422 3.12011L16.393 3.46714C15.6883 3.84379 14.8377 3.74529 14.1476 3.3427C14.0988 3.31422 14.0496 3.28621 14.0002 3.25868C13.2568 2.84453 12.7055 2.10629 12.7055 1.25525V0.70081C12.7055 0.499202 12.5371 0.297594 12.2845 0.257272C10.7266 -0.105622 9.16879 -0.0653007 7.69516 0.257272C7.44254 0.297594 7.31623 0.499202 7.31623 0.70081V1.23474C7.31623 2.09575 6.74999 2.8362 5.99824 3.25599C5.95774 3.27861 5.91747 3.30159 5.87744 3.32493C5.15643 3.74527 4.26453 3.85902 3.53534 3.45302L2.93743 3.12011C2.72691 2.99914 2.47429 3.03946 2.30587 3.20075C1.29538 4.28943 0.495411 5.57973 0.0322686 7.03131C-0.051939 7.23291 0.0322686 7.47484 0.242788 7.59581L0.784376 7.8853C1.54166 8.29007 1.92694 9.13627 1.92694 9.99495C1.92694 10.8536 1.54166 11.6998 0.784375 12.1046L0.242788 12.3941C0.0322686 12.515 -0.051939 12.757 0.0322686 12.9586C0.495411 14.4102 1.29538 15.7005 2.30587 16.7891C2.47429 16.9504 2.72691 16.9907 2.93743 16.8698L3.58669 16.5227C4.29133 16.1461 5.14131 16.2457 5.8331 16.6455C5.88713 16.6767 5.94159 16.7074 5.99648 16.7375C6.75162 17.1511 7.31623 17.8941 7.31623 18.7552V19.2891C7.31623 19.4425 7.41373 19.5959 7.55309 19.696C7.64066 19.7589 7.74815 19.7843 7.85406 19.8046C9.35884 20.0925 10.8609 20.0456 12.2845 19.7729C12.5371 19.6923 12.7055 19.4907 12.7055 19.2891V18.7346C12.7055 17.8836 13.2568 17.1454 14.0002 16.7312C14.0496 16.7037 14.0988 16.6757 14.1476 16.6472C14.8377 16.2446 15.6883 16.1461 16.393 16.5227L17.0422 16.8698C17.2527 16.9907 17.5053 16.9504 17.6738 16.7891C18.7264 15.7005 19.4842 14.4102 19.9895 12.9586C20.0316 12.757 19.9474 12.515 19.7369 12.3941ZM10.0109 13.2005C8.1162 13.2005 6.64257 11.7893 6.64257 9.97478C6.64257 8.20063 8.1162 6.74905 10.0109 6.74905C11.8634 6.74905 13.3792 8.20063 13.3792 9.97478C13.3792 11.7893 11.8634 13.2005 10.0109 13.2005Z" fill="#2A7BE4"></path></svg></span></span></span></div>
                </div><small class="text-uppercase text-primary fw-bold bg-soft-primary py-2 pe-2 ps-1 rounded-end">customize</small>
            </div>
        </a>

        <!-- ===============================================-->
        <!--    JavaScripts-->
        <!-- ===============================================-->
        <script src="../vendors/popper/popper.min.js"></script>
        <script src="../vendors/bootstrap/bootstrap.min.js"></script>
        <script src="../vendors/anchorjs/anchor.min.js"></script>
        <script src="../vendors/is/is.min.js"></script>
        <script src="../assets/js/flatpickr.js"></script>
        <script src="../vendors/dropzone/dropzone.min.js"></script>
        <script src="../vendors/lottie/lottie.min.js"></script>
        <script src="../vendors/validator/validator.min.js"></script>
        <script src="../vendors/fontawesome/all.min.js"></script>
        <script src="../vendors/lodash/lodash.min.js"></script>
        <script src="../../../../polyfill.io/v3/polyfill.min58be.js?features=window.scroll"></script>
        <script src="../vendors/list.js/list.min.js"></script>
        <script src="../assets/js/theme.js"></script>
    </body>

</html>