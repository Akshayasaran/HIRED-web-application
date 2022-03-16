<%@page import="Bean.AvailableService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.IProfile"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">


    <!-- Mirrored from prium.github.io/falcon/v3.0.0-beta4/changelog.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Mar 2021 07:26:22 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Search | Hired</title>

        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
        <link rel="manifest" href="assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <script src="assets/js/config.js"></script>
        <script src="vendors/overlayscrollbars/OverlayScrollbars.min.js"></script>

        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        <link href="vendors/prism/prism-okaidia.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:100,200,300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
        <link href="vendors/overlayscrollbars/OverlayScrollbars.min.css" rel="stylesheet">
        <link href="assets/css/theme-rtl.min.css" rel="stylesheet" id="style-rtl">
        <link href="assets/css/theme.min.css" rel="stylesheet" id="style-default">
        <link href="assets/css/user-rtl.min.css" rel="stylesheet" id="user-style-rtl">
        <link href="assets/css/user.min.css" rel="stylesheet" id="user-style-default">
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

                                                        <!-- HIRED NAVIGATIO BAR START -->

                        <nav class="navbar navbar-light navbar-vertical navbar-expand-xl" style="display: none;">
                            <script>
                                var navbarStyle = localStorage.getItem("navbarStyle");
                                if (navbarStyle && navbarStyle !== 'transparent') {
                                    document.querySelector('.navbar-vertical').classList.add(`navbar-${navbarStyle}`);
                                }
                            </script>
                            <div class="d-flex align-items-center">
                                <div class="toggle-icon-wrapper">
                                    <button class="btn navbar-toggler-humburger-icon navbar-vertical-toggle"
                                        data-bs-toggle="tooltip" data-bs-placement="left"
                                        title="Toggle Navigation"><span class="navbar-toggle-icon"><span
                                                class="toggle-line"></span></span></button>
                                </div><a class="navbar-brand" href="<%=request.getContextPath()%>/v1.0.0/home.jsp">
                                    <div class="d-flex align-items-center py-3"><img class="me-2"
                                            src="<%=request.getContextPath()%>/v1.0.0/assets/img/illustrations/falcon.png"
                                            alt="" width="40" /><span class="font-sans-serif">Hired</span></div>
                                </a>
                            </div>
                            <div class="collapse navbar-collapse" id="navbarVerticalCollapse">
                                <div class="navbar-vertical-content scrollbar">
                                    <ul class="navbar-nav flex-column mb-3" id="navbarVerticalNav">
                                        <li class="nav-item">
                                            <!-- label-->
                                            <div class="row navbar-vertical-label-wrapper mb-2">
                                                <div class="col-auto navbar-vertical-label">Dashboard</div>
                                                <div class="col ps-0">
                                                    <hr class="mb-0 navbar-vertical-divider" />
                                                </div>
                                            </div><!-- parent pages-->
                                            <a class="nav-link"
                                                href="<%=request.getContextPath()%>/v1.0.0/home.jsp" role="button">
                                                <div class="d-flex align-items-center"><span class="nav-link-icon"><span
                                                            class="fas fa-chart-pie"></span></span><span
                                                        class="nav-link-text ps-1">Home</span></div>
                                            </a><!-- parent pages-->
                                            <a class="nav-link active" href="<%=request.getContextPath()%>/v1.0.0/search.jsp"
                                                role="button">
                                                <div class="d-flex align-items-center"><span class="nav-link-icon"><span
                                                            class="fas fa-search"></span></span><span
                                                        class="nav-link-text ps-1">Search</span></div>
                                            </a>

                                            <a class="nav-link" href="<%=request.getContextPath()%>/v1.0.0/category.jsp"
                                                role="button">
                                                <div class="d-flex align-items-center"><span class="nav-link-icon"><span
                                                            class="fas fa-shapes"></span></span><span
                                                        class="nav-link-text ps-1">Category</span></div>
                                            </a>

                                            <a class="nav-link"
                                                href="<%=request.getContextPath()%>/v1.0.0/appointment.jsp"
                                                role="button">
                                                <div class="d-flex align-items-center"><span class="nav-link-icon"><span
                                                            class="far fa-address-book"></span></span><span
                                                        class="nav-link-text ps-1">Appointment</span></div>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <!-- label-->
                                            <div class="row navbar-vertical-label-wrapper mt-3 mb-2">
                                                <div class="col-auto navbar-vertical-label">Profile</div>
                                                <div class="col ps-0">
                                                    <hr class="mb-0 navbar-vertical-divider" />
                                                </div>
                                            </div><!-- parent pages-->

                                            <a class="nav-link"
                                                href="<%=request.getContextPath()%>/v1.0.0/social/profile.jsp"
                                                role="button">
                                                <div class="d-flex align-items-center"><span class="nav-link-icon"><span
                                                            class="fas fa-user"></span></span><span
                                                        class="nav-link-text ps-1">Profile &amp; Account</span></div>
                                            </a><!-- parent pages-->

                                            <a class="nav-link" href="<%=request.getContextPath()%>/Logout"
                                                role="button">
                                                <div class="d-flex align-items-center"><span class="nav-link-icon"><span
                                                            class="fas fa-sign-out-alt"></span></span><span
                                                        class="nav-link-text ps-1">Logout</span></div>
                                            </a><!-- parent pages-->
                                </div>
                            </div>
                        </nav>
                        <nav class="navbar navbar-light navbar-glass navbar-top navbar-expand-xl"
                            style="display: none;">
                            <button class="btn navbar-toggler-humburger-icon navbar-toggler me-1 me-sm-3" type="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarStandard"
                                aria-controls="navbarStandard" aria-expanded="false"
                                aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span
                                        class="toggle-line"></span></span></button>
                            <a class="navbar-brand me-1 me-sm-3" href="<%=request.getContextPath()%>/v1.0.0/home.jsp">
                                <div class="d-flex align-items-center"><img class="me-2"
                                        src="<%=request.getContextPath()%>/v1.0.0/assets/img/illustrations/falcon.png"
                                        alt="" width="40" /><span class="font-sans-serif">Hired</span></div>
                            </a>
                            <div class="collapse navbar-collapse scrollbar" id="navbarStandard">
                                <ul class="navbar-nav" data-top-nav-dropdowns="data-top-nav-dropdowns">
                                    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
                                            role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false" id="dashboard">Dashboard</a>
                                        <div class="dropdown-menu dropdown-menu-card border-0 mt-0"
                                            aria-labelledby="dashboard">
                                            <div class="bg-white dark__bg-1000 rounded-3 py-2">

                                                <a class="dropdown-item link-600 fw-medium"
                                                    href="<%=request.getContextPath()%>/v1.0.0/home.jsp">Home</a>

                                                <a class="dropdown-item link-600 fw-medium"
                                                    href="<%=request.getContextPath()%>/v1.0.0/search.jsp">Search</a>

                                                <a class="dropdown-item link-600 fw-medium"
                                                    href="<%=request.getContextPath()%>/v1.0.0/category.jsp">category</a>

                                                <a class="dropdown-item link-600 fw-medium"
                                                    href="<%=request.getContextPath()%>/v1.0.0/appointment.jsp">Appointment</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" role="button"
                                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                            id="app">Profile</a>
                                        <div class="dropdown-menu dropdown-menu-card border-0 mt-0"
                                            aria-labelledby="app">
                                            <div class="bg-white dark__bg-1000 rounded-3 py-2">
                                                <a class="nav-link py-1 link-600 fw-medium"
                                                    href="<%=request.getContextPath()%>/v1.0.0/social/profile.jsp">Profile
                                                    &amp; Account</a>
                                                <a class="nav-link py-1 link-600 fw-medium"
                                                    href="<%=request.getContextPath()%>/Logout">Logout</a>

                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </div>


                            <ul class="navbar-nav navbar-nav-icons ms-auto flex-row align-items-center">

                                <li class="nav-item dropdown"><a class="nav-link pe-0" id="navbarDropdownUser" href="#"
                                        role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        <div class="avatar avatar-xl">
                                            <img class="rounded-circle"
                                                src="<%=request.getContextPath()%>/v1.0.0/images/<%= IProfile.getProfileImagePath(loginUser)%>" alt="" />
                                        </div>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end py-0"
                                        aria-labelledby="navbarDropdownUser">
                                        <div class="bg-white dark__bg-1000 rounded-2 py-2">
                                            <a class="dropdown-item"
                                                href="<%=request.getContextPath()%>/v1.0.0/social/profile.jsp">Profile
                                                &amp; account</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item"
                                                href="<%=request.getContextPath()%>/Logout">Logout</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                        <div class="content">
                            <nav class="navbar navbar-light navbar-glass navbar-top navbar-expand"
                                style="display: none;">
                                <button class="btn navbar-toggler-humburger-icon navbar-toggler me-1 me-sm-3"
                                    type="button" data-bs-toggle="collapse" data-bs-target="#navbarVerticalCollapse"
                                    aria-controls="navbarVerticalCollapse" aria-expanded="false"
                                    aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span
                                            class="toggle-line"></span></span></button>
                                <a class="navbar-brand me-1 me-sm-3"
                                    href="<%=request.getContextPath()%>/v1.0.0/home.jsp">
                                    <div class="d-flex align-items-center"><img class="me-2"
                                            src="<%=request.getContextPath()%>/v1.0.0/assets/img/illustrations/falcon.png"
                                            alt="" width="40" /><span class="font-sans-serif">Hired</span></div>
                                </a>

                                <ul class="navbar-nav align-items-center d-none d-lg-block">
                                    <li class="nav-item">
                                        <form action="<%=request.getContextPath()%>/v1.0.0/search.jsp" method="GET"
                                            class="position-relative" data-bs-toggle="search" data-bs-display="static">
                                            <div class="search-box" data-list='{"valueNames":["title"]}'>

                                                <input name="query" id="query" autocomplete="off"
                                                    class="form-control search-input fuzzy-search" type="text"
                                                    placeholder="Search..." aria-label="Search" />
                                                <span class="fas fa-search search-box-icon"></span>

                                                <button
                                                    class="btn btn-outline-primary rounded-pill position-absolute end-0 top-50 translate-middle shadow-none p-1 me-0 fs--2"
                                                    type="submit"> Search</button>
                                            </div>
                                        </form>
                                    </li>
                                </ul>

                                <ul class="navbar-nav navbar-nav-icons ms-auto flex-row align-items-center">
                                    <li class="nav-item dropdown"><a class="nav-link pe-0" id="navbarDropdownUser"
                                            href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <div class="avatar avatar-xl">
                                                <img class="rounded-circle"
                                                    src="<%=request.getContextPath()%>/v1.0.0/images/<%= IProfile.getProfileImagePath(loginUser)%>" alt="" />
                                            </div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end py-0"
                                            aria-labelledby="navbarDropdownUser">
                                            <div class="bg-white dark__bg-1000 rounded-2 py-2">
                                                <a class="dropdown-item"
                                                    href="<%=request.getContextPath()%>/v1.0.0/social/profile.jsp">Profile
                                                    &amp; account</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item"
                                                    href="<%=request.getContextPath()%>/Logout">Logout</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <nav class="navbar navbar-light navbar-glass navbar-top navbar-expand-lg"
                                style="display: none;" data-move-target="#navbarVerticalNav" data-navbar-top="combo">
                                <button class="btn navbar-toggler-humburger-icon navbar-toggler me-1 me-sm-3"
                                    type="button" data-bs-toggle="collapse" data-bs-target="#navbarVerticalCollapse"
                                    aria-controls="navbarVerticalCollapse" aria-expanded="false"
                                    aria-label="Toggle Navigation"><span class="navbar-toggle-icon"><span
                                            class="toggle-line"></span></span></button>
                                <a class="navbar-brand me-1 me-sm-3"
                                    href="<%=request.getContextPath()%>/v1.0.0/home.jsp">
                                    <div class="d-flex align-items-center"><img class="me-2"
                                            src="<%=request.getContextPath()%>/v1.0.0/assets/img/illustrations/falcon.png"
                                            alt="" width="40" /><span class="font-sans-serif">Hired</span></div>
                                </a>
                                <div class="collapse navbar-collapse scrollbar" id="navbarStandard">
                                    <ul class="navbar-nav" data-top-nav-dropdowns="data-top-nav-dropdowns">
                                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
                                                role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false" id="dashboard">Dashboard</a>
                                            <div class="dropdown-menu dropdown-menu-card border-0 mt-0"
                                                aria-labelledby="dashboard">
                                                <div class="bg-white dark__bg-1000 rounded-3 py-2">
                                                    <a class="dropdown-item link-600 fw-medium"
                                                        href="<%=request.getContextPath()%>/v1.0.0/home.jsp">Home</a>
                                                    <a class="dropdown-item link-600 fw-medium"
                                                        href="<%=request.getContextPath()%>/v1.0.0/search.jsp">Search</a>
                                                    <a class="dropdown-item link-600 fw-medium"
                                                        href="<%=request.getContextPath()%>/v1.0.0/category.jsp">Category</a>
                                                    <a class="dropdown-item link-600 fw-medium"
                                                        href="<%=request.getContextPath()%>/v1.0.0/appointment.jsp">Appointment</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
                                                role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                                                aria-expanded="false" id="app">Profile</a>
                                            <div class="dropdown-menu dropdown-menu-card border-0 mt-0"
                                                aria-labelledby="app">
                                                <div class="bg-white dark__bg-1000 rounded-3 py-2">
                                                    <a class="dropdown-item link-600 fw-medium"
                                                        href="<%=request.getContextPath()%>/v1.0.0/social/profile.jsp">Profile
                                                        &amp; Account</a>
                                                    <a class="dropdown-item link-600 fw-medium"
                                                        href="<%=request.getContextPath()%>/Logout">Logout</a>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <ul class="navbar-nav navbar-nav-icons ms-auto flex-row align-items-center">
                                    <li class="nav-item dropdown"><a class="nav-link pe-0" id="navbarDropdownUser"
                                            href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <div class="avatar avatar-xl">
                                                <img class="rounded-circle"
                                                     src="<%=request.getContextPath()%>/v1.0.0/images/<%= IProfile.getProfileImagePath(loginUser)%>" alt="" />
                                            </div>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end py-0"
                                            aria-labelledby="navbarDropdownUser">
                                            <div class="bg-white dark__bg-1000 rounded-2 py-2">
                                                <a class="dropdown-item"
                                                    href="<%=request.getContextPath()%>/v1.0.0/social/profile.jsp">Profile
                                                    &amp; account</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item"
                                                    href="<%=request.getContextPath()%>/Logout">Logout</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </nav>

                            <!-- HIRED NAVIGATION BAR END -->
                
                    <script>
                        var navbarPosition = localStorage.getItem('navbarPosition');
                        var navbarVertical = document.querySelector('.navbar-vertical');
                        var navbarTopVertical = document.querySelector('.content .navbar-top');
                        var navbarTop = document.querySelector('[data-layout] .navbar-top');
                        var navbarTopCombo = document.querySelector('.content [data-navbar-top="combo"]');
                        if (navbarPosition === 'top') {
                            navbarTop.removeAttribute('style');
                            navbarTopVertical.remove(navbarTopVertical);
                            navbarVertical.remove(navbarVertical);
                            navbarTopCombo.remove(navbarTopCombo);
                        } else if (navbarPosition === 'combo') {
                            navbarVertical.removeAttribute('style');
                            navbarTopCombo.removeAttribute('style');
                            navbarTop.remove(navbarTop);
                            navbarTopVertical.remove(navbarTopVertical);
                        } else {
                            navbarVertical.removeAttribute('style');
                            navbarTopVertical.removeAttribute('style');
                            navbarTop.remove(navbarTop);
                            navbarTopCombo.remove(navbarTopCombo);
                        }
                    </script>
                    <div class="card mb-3">
                        <div class="bg-holder d-none d-lg-block bg-card"></div>
                        <!--/.bg-holder-->
                        <div class="card-body position-relative">
                            <div class="row">
                                <div class="col-lg-8">
                                    <h3>Search</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">

                                        <!--Search Result-->
                                        <%                                            ArrayList<AvailableService> availableServices = null;
                                            String searchQuery = (String) request.getParameter("query");
                                            try {
                                                if (searchQuery != null && !searchQuery.isEmpty()) {
                                                    availableServices = AvailableService.searchService(searchQuery);
                                                } else {
                                                    availableServices = AvailableService.getAllService();
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                            if (availableServices != null && availableServices.size() > 0) {
                                                for (AvailableService service : availableServices) {
                                                    String serviceName = service.getServiceName();
                                                    String serviceAbrv = "" + serviceName.charAt(0);
                                                    String[] arr = serviceName.split(" ");
                                                    serviceAbrv += (arr.length > 1) ? arr[arr.length - 1].charAt(0) : "";
                                        %>

                                        <div style="float: right" class="dropdown font-sans-serif btn-reveal-trigger"><button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" type="button" id="dropdown-weather-update" data-bs-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false"><svg class="svg-inline--fa fa-ellipsis-h fa-w-16 fs--2" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <span class="fas fa-ellipsis-h fs--2"></span> Font Awesome fontawesome.com --></button>
                                            <div class="dropdown-menu dropdown-menu-end border py-2" aria-labelledby="dropdown-weather-update" style="margin: 0px;">
                                                <a class="dropdown-item" href="<%=request.getContextPath()%>/v1.0.0/social/profile.jsp?profileid=<%= service.getUserId() %>">View Profile</a>
                                                <!--<a class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#error-modal" href="#!">Book Appointment</a>-->
                                                <form method="POST" action="<%=request.getContextPath()%>/v1.0.0/appointment-book.jsp">
                                                    
                                                    <input type="hidden" name="provider-id" id="provider-id" value="<%= service.getUserId() %>"/>
                                                    <input type="hidden" name="provider-name" id="provider-name" value="<%= service.getUserName()%>"/>
                                                    <input type="hidden" name="service-id" id="service-id" value="<%= service.getServiceId()%>"/>
                                                    <input type="hidden" name="service-name" id="service-name" value="<%= service.getServiceName()%>"/>
                                                    <input type="hidden" name="appointment-operation" id="appointment-operation" value="add"/>
                                                    <button class="dropdown-item" type="submit" >Book Appointment</button>
                                                </form>
                                                <!--<a class="dropdown-item" type="submit" data-bs-toggle="modal" data-bs-target="#error-modal" href="#!">Book Appointment</a>-->
                                                <!--<button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#error-modal">Launch demo modal</button>-->
<!--                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item text-danger" href="#!">Remove</a>-->
                                            </div>
                                        </div>
                                        <div class="d-flex"><a href="#!"><div class="avatar avatar-3xl">
                                                    <div class="avatar-name rounded-circle"><span><%= serviceAbrv%></span></div>
                                                </div></a>
                                            <div class="flex-1 position-relative ps-3">
                                                <h2 class="fs-2 fw-bold font-sans-serif text-700 lh-1 mb-1"><%= service.getUserName()%></h2>
                                                <h6 class="fs-0 mb-0"><%= serviceName%></h6>
                                                <p class="mb-1">
                                                    <% if (service.isAvailability()) { %>
                                                    Available <span data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Available" aria-label="Available"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="green" class="bi bi-check" viewBox="0 0 16 16"><path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/></svg></span> 
                                                        <%} else { %>
                                                    Unavailable <span data-bs-toggle="tooltip" data-bs-placement="top" title="" data-bs-original-title="Unavailable" aria-label="Unavailable"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-x" viewBox="0 0 16 16"><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg></span> 
                                                        <% }%>
                                                </p>
                                                <p class="text-1000 mb-0">Work Timing - <%= service.getTimeFrom()%> - <%= service.getTimeTo()%></p>
<!--                                                <p class="text-1000 mb-0">Working Days - <%= service.getWorkingDays()%></p>-->
                                                <p class="text-1000 mb-0">Rating - <%= service.getRating()%></p>
                                                <div class="row align-items-center" style="padding:8px 0px 0px 16px" >
                                                    <%
                                                        String[] days = {"Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"};
                                                        for (int i = 0; i < 7; i++) {
                                                            String dayColor = service.getWorkingDays().charAt(i) == '0' ? "grey" : "#2c7be5";
                                                    %>
                                                    <div class="col-auto" style="padding: 0px;margin-right: 5px;">
                                                        <div class="avatar avatar-s">
                                                            <div class="avatar-name rounded-circle" style="background-color: <%= dayColor%>;"><span><%= days[i]%></span></div>
                                                        </div>
                                                    </div>
                                                    <% } %>
                                                </div>
                                                <div class="border-dashed-bottom my-3"></div>
                                            </div>
                                        </div>

                                        <%                                                }
                                        } else {
                                        %>
                                        <p class="mt-3 text-1000">No Services</p>
                                        <%
                                            }
                                        %>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <footer>
                        <div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
                            <div class="col-12 col-sm-auto text-center">
                                <p class="mb-0 text-600">Thank you for creating with Falcon <span class="d-none d-sm-inline-block">| </span><br class="d-sm-none" /> 2021 &copy; <a href="https://themewagon.com/">Themewagon</a></p>
                            </div>
                            <div class="col-12 col-sm-auto text-center">
                                <p class="mb-0 text-600">v3.0.0-beta4</p>
                            </div>
                        </div>
                    </footer>
                </div>
                <div class="modal fade" id="authentication-modal" tabindex="-1" role="dialog" aria-labelledby="authentication-modal-label" aria-hidden="true">
                    <div class="modal-dialog mt-6" role="document">
                        <div class="modal-content border-0">
                            <div class="modal-header px-5 position-relative modal-shape-header bg-shape">
                                <div class="position-relative z-index-1 light">
                                    <h4 class="mb-0 text-white" id="authentication-modal-label">Register</h4>
                                    <p class="fs--1 mb-0 text-white">Please create your free Falcon account</p>
                                </div><button class="btn-close btn-close-white position-absolute top-0 end-0 mt-2 me-2" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body py-4 px-5">
                                <form>
                                    <div class="mb-3"><label class="form-label" for="modal-auth-name">Name</label><input class="form-control" type="text" id="modal-auth-name" /></div>
                                    <div class="mb-3"><label class="form-label" for="modal-auth-email">Email address</label><input class="form-control" type="email" id="modal-auth-email" /></div>
                                    <div class="row gx-3">
                                        <div class="mb-3 col-sm-6"><label class="form-label" for="modal-auth-password">Password</label><input class="form-control" type="password" id="modal-auth-password" /></div>
                                        <div class="mb-3 col-sm-6"><label class="form-label" for="modal-auth-confirm-password">Confirm Password</label><input class="form-control" type="password" id="modal-auth-confirm-password" /></div>
                                    </div>
                                    <div class="form-check"><input class="form-check-input" type="checkbox" id="modal-auth-register-checkbox" /><label class="form-label" for="modal-auth-register-checkbox">I accept the <a href="#!">terms </a>and <a href="#!">privacy policy</a></label></div>
                                    <div class="mb-3"><button class="btn btn-primary d-block w-100 mt-3" type="submit" name="submit">Register</button></div>
                                </form>
                                <div class="position-relative mt-5">
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
                                <div class="col-6"><input class="btn-check" id="themeSwitcherLight" name="theme-color" type="radio" value="light" data-theme-control="theme" /><label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherLight"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="assets/img/generic/falcon-mode-default.jpg" alt=""/></span><span class="label-text">Light</span></label></div>
                                <div class="col-6"><input class="btn-check" id="themeSwitcherDark" name="theme-color" type="radio" value="dark" data-theme-control="theme" /><label class="btn d-inline-block btn-navbar-style fs--1" for="themeSwitcherDark"> <span class="hover-overlay mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0" src="assets/img/generic/falcon-mode-dark.jpg" alt=""/></span><span class="label-text"> Dark</span></label></div>
                            </div>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between">
                            <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/left-arrow-from-left.svg" width="20" alt="" />
                                <div class="flex-1">
                                    <h5 class="fs-0">RTL Mode</h5>
                                    <p class="fs--1 mb-0">Switch your language direction </p><a class="fs--1" href="documentation/configuration.html">RTL Documentation</a>
                                </div>
                            </div>
                            <div class="form-check form-switch"><input class="form-check-input ms-0" id="mode-rtl" type="checkbox" data-theme-control="isRTL" /></div>
                        </div>
                        <hr />
                        <div class="d-flex justify-content-between">
                            <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/arrows-h.svg" width="20" alt="" />
                                <div class="flex-1">
                                    <h5 class="fs-0">Fluid Layout</h5>
                                    <p class="fs--1 mb-0">Toggle container layout system </p><a class="fs--1" href="documentation/configuration.html">Fluid Documentation</a>
                                </div>
                            </div>
                            <div class="form-check form-switch"><input class="form-check-input ms-0" id="mode-fluid" type="checkbox" data-theme-control="isFluid" /></div>
                        </div>
                        <hr />
                        <div class="d-flex align-items-start"><img class="me-2" src="assets/img/icons/paragraph.svg" width="20" alt="" />
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
                        <p> <a class="fs--1" href="components/navbar/vertical.html#navbar-styles">See Documentation</a></p>
                        <div class="btn-group d-block w-100 btn-group-navbar-style">
                            <div class="row gx-2">
                                <div class="col-6"><input class="btn-check" id="navbar-style-transparent" type="radio" name="navbarStyle" value="transparent" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-transparent"> <img class="img-fluid img-prototype" src="assets/img/generic/default.png" alt="" /><span class="label-text"> Transparent</span></label></div>
                                <div class="col-6"><input class="btn-check" id="navbar-style-inverted" type="radio" name="navbarStyle" value="inverted" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-inverted"> <img class="img-fluid img-prototype" src="assets/img/generic/inverted.png" alt="" /><span class="label-text"> Inverted</span></label></div>
                                <div class="col-6"><input class="btn-check" id="navbar-style-card" type="radio" name="navbarStyle" value="card" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-card"> <img class="img-fluid img-prototype" src="assets/img/generic/card.png" alt="" /><span class="label-text"> Card</span></label></div>
                                <div class="col-6"><input class="btn-check" id="navbar-style-vibrant" type="radio" name="navbarStyle" value="vibrant" data-theme-control="navbarStyle" /><label class="btn d-block w-100 btn-navbar-style fs--1" for="navbar-style-vibrant"> <img class="img-fluid img-prototype" src="assets/img/generic/vibrant.png" alt="" /><span class="label-text"> Vibrant</span></label></div>
                            </div>
                        </div>
                        <div class="text-center mt-5"><img class="mb-4" src="assets/img/illustrations/settings.png" alt="" width="120" />
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
        <script src="vendors/popper/popper.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.min.js"></script>
        <script src="vendors/anchorjs/anchor.min.js"></script>
        <script src="vendors/is/is.min.js"></script>
        <script src="vendors/prism/prism.js"></script>
        <script src="vendors/fontawesome/all.min.js"></script>
        <script src="vendors/lodash/lodash.min.js"></script>
        <script src="../../../polyfill.io/v3/polyfill.min58be.js?features=window.scroll"></script>
        <script src="vendors/list.js/list.min.js"></script>
        <script src="assets/js/theme.js"></script>
        
        <div class="modal fade" id="error-modal" tabindex="-1" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 500px">
                  <div class="modal-content position-relative">
                    <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
                      <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-0">
                      <div class="rounded-top-lg py-3 ps-4 pe-6 bg-light">
                        <h4 class="mb-1" id="modalExampleDemoLabel">Add a new illustration </h4>
                      </div>
                      <div class="p-4 pb-0">
                        <form>
                          <div class="mb-3">
                            <label class="col-form-label" for="recipient-name">Recipient:</label>
                            <input class="form-control" id="recipient-name" type="text">
                          </div>
                          <div class="mb-3">
                            <label class="col-form-label" for="message-text">Message:</label>
                            <textarea class="form-control" id="message-text" spellcheck="false"></textarea>
                          </div>
                        </form>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
                      <button class="btn btn-primary" type="button">Understood </button>
                    </div>
                  </div>
                </div>
              </div>
        
    </body>


    <!-- Mirrored from prium.github.io/falcon/v3.0.0-beta4/changelog.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Mar 2021 07:26:22 GMT -->
</html>