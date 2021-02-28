<%-- 
    Document   : search
    Created on : May 27, 2020, 2:54:38 PM
    Author     : David
--%>

<%@page import="com.cmonee.util.DBUtil"%>
<%@page import="com.cmonee.dao.MVInfoDAO"%>
<%@page import="com.cmonee.model.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>C'monee - Your choice of movie review</title>
        <link rel="stylesheet" href="css/components.css">
        <link rel="stylesheet" href="css/icons.css">
        <link rel="stylesheet" href="css/responsee.css">
        <link rel="stylesheet" href="owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="owl-carousel/owl.theme.css">     
        <link rel="stylesheet" href="css/template-style.css">
        <link href='https://fonts.googleapis.com/css?family=Playfair+Display&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>     
        <link rel="icon" href="img/favicon.png" type="image/png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="meetme/css/bootstrap.css">
        <link rel="stylesheet" href="meetme/vendors/linericon/style.css">
        <link rel="stylesheet" href="meetme/css/font-awesome.min.css">
        <link rel="stylesheet" href="meetme/vendors/owl-carousel/owl.carousel.min.css">
        <link rel="stylesheet" href="meetme/vendors/lightbox/simpleLightbox.css">
        <link rel="stylesheet" href="meetme/vendors/nice-select/css/nice-select.css">
        <link rel="stylesheet" href="meetme/vendors/animate-css/animate.css">
        <link rel="stylesheet" href="meetme/vendors/popup/magnific-popup.css">
        <link rel="stylesheet" href="meetme/vendors/flaticon/flaticon.css">
        <!-- main css -->
        <link rel="stylesheet" href="meetme/css/style.css">
        <link rel="stylesheet" href="meetme/css/responsive.css">
        <title>Search Result</title>
    </head>
    <body class="size-1140">
        <!-- HEADER -->
        <header role="banner" class="position-absolute">    
            <!-- Top Navigation -->
            <nav class="background-transparent background-transparent-hightlight full-width sticky">
                <div class="s-12 l-2">
                    <a href="index.html" class="logo">
                        <!-- Logo White Version -->
                        <img class="logo-white" src="img/LOGO_2.png" alt="">
                        <!-- Logo Dark Version -->
                        <img class="logo-dark" src="img/lOGO_1.png" alt="">
                    </a>
                </div>
                <div class="top-nav s-12 l-10">
                    <p class="nav-text"></p>
                    <ul class="right chevron">
                        <li><a href="index.html">Trang chủ</a></li>
                        <li><a href="GalleryController">Danh sách phim</a></li>
                        <li><a href="about.html">Về chúng tôi</a></li>
                        <li><a href="contact.html">Liên hệ</a></li>
                        <li><a href="login.html">Đăng nhập</a></li>
                        <li><a class="search-container">
                                <form action="SearchController">
                                    <input type="text" placeholder="Tìm kiếm..." name="search">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </form>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- MAIN -->
        <%
            ArrayList<Movie> listMovie = (ArrayList<Movie>) request.getAttribute("listMovie");
            String searchKeyword = request.getParameter("search");
        %>
        <main role="main">
            <!-- Content -->
            <article>
                <header class="section background-dark">
                    <div class="line">        
                        <h1 class="text-white margin-top-bottom-40 text-size-60 text-line-height-1">Danh sách phim</h1>
                        <p class="margin-bottom-0 text-size-16">Danh sách các phim đang / sắp được chiếu trên các cụm rạp khắp cả nước.</p>
                    </div>  
                </header>
                <section class="section-top-padding full-width">  
                    <div class="tabs background-primary-hightlight">
                        <div class="tab-item tab-active">
                            <h2 class="text-size-50 text-center">Các bộ phim tìm thấy</h2>
                            <p style="color: orange; font-weight: bold; margin-left: 12px; font-size: 30px;">Từ khóa: <span style="color:gray;"><%out.println(searchKeyword);%></span></p>
                                <% if (listMovie.size() < 1) {
                                     out.println("Không tìm thấy kết quả nào phù hợp với từ khóa của bạn.");}%>
                                
                                
                            <div class="tab-content lightbox-gallery">
                                <%if (listMovie.size() >0) {
                                    for (int i = 0; i < listMovie.size(); i++) {%>
                                <div class="s-12 m-6 l-3">
                                    <a class="image-with-hover-overlay image-hover-zoom margin-left-right-10 margin-top-bottom-10" href="<%=DBUtil.fullPath("MVInfoController?MovieId=") + listMovie.get(i).getId()%>">
                                        <div class="image-hover-overlay background-primary"> 
                                            <div class="image-hover-overlay-content text-center padding-2x">
                                                <h2 class="text-thin text-strong"><%=listMovie.get(i).getName()%></h2> 
                                                <h3 class="text-thin"><%=listMovie.get(i).getDirector()%> /<br> <%=MVInfoDAO.getCategory(listMovie.get(i).getCategoryId())%> / <%=listMovie.get(i).getNation()%></h3>
                                                <p>Nội dung phim</p> 
                                            </div> 
                                        </div> 
                                        <img src="<%=listMovie.get(i).getPoster()%>" alt="" title="Portfolio Image 6" />
                                    </a>  
                                </div><%}}%>
                            </div>
                        </div>
                    </div>
                </section> 
            </article>
        </main>      

        <!--================Footer Area =================-->
        <footer class="footer_area p_120">
            <div class="container">
                <div class="row footer_inner">
                    <div class="col-lg-5 col-sm-6">
                        <aside class="f_widget ab_widget">
                            <div class="f_title">
                                <h3>Về chúng tôi</h3>
                            </div>
                            <p>Tìm kiếm những bộ phim phù hợp với nhu cầu của bạn và mang lại những trải nghiệm tuyệt vời nhất.</p>
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | From <a href="index.html" target="_blank">C' monee</a> with <i class="fa fa-heart-o" aria-hidden="true"></i> 
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                        </aside>
                    </div>
                    <div class="col-lg-5 col-sm-6">
                        <aside class="f_widget news_widget">
                            <div class="f_title">
                                <h3>Nhận thông báo mới</h3>
                            </div>
                            <p>Để lại Email và nhận thông báo sớm nhất của chúng tôi</p>
                            <div id="mc_embed_signup">
                                <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative">
                                    <div class="input-group d-flex flex-row">
                                        <input name="EMAIL" placeholder="Nhập Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '" required type="email">
                                        <button class="btn sub-btn"><span class="lnr lnr-arrow-right"></span></button>    
                                    </div>        
                                    <div class="mt-10 info"></div>
                                </form>
                            </div>
                        </aside>
                    </div>
                    <div class="col-lg-2">
                        <aside class="f_widget social_widget">
                            <div class="f_title">
                                <h3>Theo dõi chúng tôi</h3>
                            </div>
                            <p>Khiến C'monee trở nên phổ biến hơn</p>
                            <ul class="list">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-behance"></i></a></li>
                            </ul>
                        </aside>
                    </div>
                </div>
            </div>
        </footer>
        <!--================End Footer Area =================-->

        <!--================Contact Success and Error message Area =================-->
        <div id="success" class="modal modal-message fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="fa fa-close"></i>
                        </button>
                        <h2>Thank you</h2>
                        <p>Your message is successfully sent...</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modals error -->

        <div id="error" class="modal modal-message fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <i class="fa fa-close"></i>
                        </button>
                        <h2>Sorry !</h2>
                        <p> Something went wrong </p>
                    </div>
                </div>
            </div>
        </div>
        <!--================End Contact Success and Error message Area =================-->




        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/stellar.js"></script>
        <script src="vendors/lightbox/simpleLightbox.min.js"></script>
        <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
        <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
        <script src="vendors/isotope/isotope.pkgd.min.js"></script>
        <script src="vendors/popup/jquery.magnific-popup.min.js"></script>
        <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/mail-script.js"></script>
        <script src="vendors/counter-up/jquery.waypoints.min.js"></script>
        <script src="vendors/counter-up/jquery.counterup.min.js"></script>
        <!-- contact js -->
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/contact.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/theme.js"></script>
        <script type="text/javascript" src="js/responsee.js"></script>
        <script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>
        <script type="text/javascript" src="js/template-scripts.js"></script>
    </body>
</html>
