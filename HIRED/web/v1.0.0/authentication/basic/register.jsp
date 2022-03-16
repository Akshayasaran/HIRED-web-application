<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  
<!-- Mirrored from prium.github.io/falcon/v3.0.0-beta4/authentication/basic/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Mar 2021 07:25:12 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Register - Hired</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="../../assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="../../assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="../../assets/img/favicons/favicon.ico">
    <link rel="manifest" href="../../assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="../../assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="../../assets/js/config.js"></script>
    <script src="../../vendors/overlayscrollbars/OverlayScrollbars.min.js"></script>

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com/">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:100,200,300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="../../vendors/overlayscrollbars/OverlayScrollbars.min.css" rel="stylesheet">
    <link href="../../assets/css/theme-rtl.min.css" rel="stylesheet" id="style-rtl">
    <link href="../../assets/css/theme.min.css" rel="stylesheet" id="style-default">
    <link href="../../assets/css/user-rtl.min.css" rel="stylesheet" id="user-style-rtl">
    <link href="../../assets/css/user.min.css" rel="stylesheet" id="user-style-default">
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
        Cookie[] cookies = request.getCookies();
        if(cookies!= null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("message"))
                    if(cookie.getValue().equals("register_exist"))
                        out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>User already exist!</strong><button class='btn-close' type='button' data-bs-dismiss='alert' aria-label='Close'></button></div>");
                    if(cookie.getValue().equals("register_failed"))
                        out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>User could not be added!</strong><button class='btn-close' type='button' data-bs-dismiss='alert' aria-label='Close'></button></div>");                
                    if(cookie.getValue().equals("register_error"))
                        out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>Something went wrong! Please try again later.</strong><button class='btn-close' type='button' data-bs-dismiss='alert' aria-label='Close'></button></div>");                    
                    if(cookie.getValue().equals("register_mismatch"))
                        out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'><strong>Password doesn't match</strong><button class='btn-close' type='button' data-bs-dismiss='alert' aria-label='Close'></button></div>");                    
            }
        }
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
        <div class="row flex-center min-vh-100 py-6">
          <div class="col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4"><a class="d-flex flex-center mb-4" href="<%=request.getContextPath()%>/v1.0.0/home.jsp"><img class="me-2" src="../../assets/img/illustrations/falcon.png" alt="" width="58" /><span class="font-sans-serif fw-bolder fs-5 d-inline-block">Hired</span></a>
            <div class="card">
              <div class="card-body p-4 p-sm-5">
                <div class="row flex-between-center mb-2">
                  <div class="col-auto">
                    <h5>Register</h5>
                  </div>
                  <div class="col-auto fs--1 text-600"><span class="mb-0 undefined">Have an account?</span> <span><a href="login.jsp">Login</a></span></div>
                </div>
                <form class="needs-validation" novalidate="" action="../../../Register" method="POST">
                  <div class="mb-3"><input class="form-control" type="text" name="user_name" placeholder="Name" required/>
                    <div class="valid-feedback">Looks good!</div>
                    <div class="invalid-feedback">Please enter a valid Name</div>
                  </div>
                  <div class="mb-3"><input class="form-control" type="email" name="emailid" placeholder="Email address" required/>
                    <div class="valid-feedback">Looks good!</div>
                    <div class="invalid-feedback">Please enter a valid Email address</div>
                  </div>
                  <div class="row gx-3">
                    <div class="mb-3 col-sm-6"><input class="form-control" name="password1" type="password" placeholder="Password" required/>
                      <div class="valid-feedback">Looks good!</div>
                      <div class="invalid-feedback">Please enter a valid Password</div>
                    </div>
                    <div class="mb-3 col-sm-6"><input class="form-control" name="password2" id="ConfirmPassword" type="password" placeholder="Confirm Password" required/>                        
                        <div class="valid-feedback">Looks good!</div>
                      <div class="invalid-feedback">Please enter a valid Password</div>
                    </div>
                  </div>
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="usertype" id="btnradio1" autocomplete="off" checked value="Individual">
                    <label class="btn btn-outline-primary" for="btnradio1">Individual</label>
                  
                    <input type="radio" class="btn-check" name="usertype" id="btnradio2" autocomplete="off" value="Organisation">
                    <label class="btn btn-outline-primary" for="btnradio2">Organisation</label>
                  </div>
                  <div class="form-check"><input class="form-check-input" type="checkbox" id="basic-register-checkbox" required/><label class="form-label" for="basic-register-checkbox">I accept the <a href="#!">terms </a>and <a href="#!">privacy policy</a></label>
                    <div class="invalid-feedback">You must agree before submitting.</div>
                  </div>
                  <div class="mb-3"><button class="btn btn-primary d-block w-100 mt-3" type="submit" name="submit">Register</button></div>
                </form>
                <div class="position-relative mt-4">
                  <hr class="bg-300" />
                  <div class="divider-content-center">or register with</div>
                </div>
                <div class="row g-2 mt-2">
                  <div class="col-sm-6"><a class="btn btn-outline-google-plus btn-sm d-block w-100" href="#"><span class="fab fa-google-plus-g me-2" data-fa-transform="grow-8"></span> google</a></div>
                  <div class="col-sm-6"><a class="btn btn-outline-facebook btn-sm d-block w-100" href="#"><span class="fab fa-facebook-square me-2" data-fa-transform="grow-8"></span> facebook</a></div>
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
                <div class="col-6"><input class="btn-check" id="themeSwitcherLight" name="theme-color" type="radio" value="light" data-theme-control="theme" /><label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherLight"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="../../assets/img/generic/falcon-mode-default.jpg" alt=""/></span><span class="label-text">Light</span></label></div>
                <div class="col-6"><input class="btn-check" id="themeSwitcherDark" name="theme-color" type="radio" value="dark" data-theme-control="theme" /><label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherDark"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="../../assets/img/generic/falcon-mode-dark.jpg" alt=""/></span><span class="label-text"> Dark</span></label></div>
              </div>
            </div>
            <hr />
            <div class="d-flex justify-content-between">
              <div class="d-flex align-items-start"><img class="me-2" src="../../assets/img/icons/left-arrow-from-left.svg" width="20" alt="" />
                <div class="flex-1">
                  <h5 class="fs-0">RTL Mode</h5>
                  <p class="fs--1 mb-0">Switch your language direction </p><a class="fs--1" href="../../documentation/configuration.html">RTL Documentation</a>
                </div>
              </div>
              <div class="form-check form-switch"><input class="form-check-input ms-0" id="mode-rtl" type="checkbox" data-theme-control="isRTL" /></div>
            </div>
            <hr />
            <div class="d-flex justify-content-between">
              <div class="d-flex align-items-start"><img class="me-2" src="../../assets/img/icons/arrows-h.svg" width="20" alt="" />
                <div class="flex-1">
                  <h5 class="fs-0">Fluid Layout</h5>
                  <p class="fs--1 mb-0">Toggle container layout system </p><a class="fs--1" href="../../documentation/configuration.html">Fluid Documentation</a>
                </div>
              </div>
              <div class="form-check form-switch"><input class="form-check-input ms-0" id="mode-fluid" type="checkbox" data-theme-control="isFluid" /></div>
            </div>
            <hr />
            <div class="d-flex align-items-start"><img class="me-2" src="../../assets/img/icons/paragraph.svg" width="20" alt="" />
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
            <p> <a class="fs--1" href="../../components/navbar/vertical.html#navbar-styles">See Documentation</a></p>
            <div class="btn-group d-block w-100 btn-group-navbar-style">
              <div class="row gx-2">
                <div class="col-6"><input class="btn-check" id="navbar-style-transparent" type="radio" name="navbarStyle" value="transparent" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-transparent"> <img class="img-fluid img-prototype" src="../../assets/img/generic/default.png" alt="" /><span class="label-text"> Transparent</span></label></div>
                <div class="col-6"><input class="btn-check" id="navbar-style-inverted" type="radio" name="navbarStyle" value="inverted" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-inverted"> <img class="img-fluid img-prototype" src="../../assets/img/generic/inverted.png" alt="" /><span class="label-text"> Inverted</span></label></div>
                <div class="col-6"><input class="btn-check" id="navbar-style-card" type="radio" name="navbarStyle" value="card" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-card"> <img class="img-fluid img-prototype" src="../../assets/img/generic/card.png" alt="" /><span class="label-text"> Card</span></label></div>
                <div class="col-6"><input class="btn-check" id="navbar-style-vibrant" type="radio" name="navbarStyle" value="vibrant" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-vibrant"> <img class="img-fluid img-prototype" src="../../assets/img/generic/vibrant.png" alt="" /><span class="label-text"> Vibrant</span></label></div>
              </div>
            </div>
            <div class="text-center mt-5"><img class="mb-4" src="../../assets/img/illustrations/settings.png" alt="" width="120" />
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
    <script src="../../vendors/popper/popper.min.js"></script>
    <script src="../../vendors/bootstrap/bootstrap.min.js"></script>
    <script src="../../vendors/anchorjs/anchor.min.js"></script>
    <script src="../../vendors/is/is.min.js"></script>
    <script src="../../vendors/fontawesome/all.min.js"></script>
    <script src="../../vendors/lodash/lodash.min.js"></script>
    <script src="../../../../../polyfill.io/v3/polyfill.min58be.js?features=window.scroll"></script>
    <script src="../../vendors/list.js/list.min.js"></script>
    <script src="../../assets/js/theme.js"></script>
  </body>


<!-- Mirrored from prium.github.io/falcon/v3.0.0-beta4/authentication/basic/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Mar 2021 07:25:12 GMT -->
</html>