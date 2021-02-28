<%@page import="com.cmonee.model.Post"%>
<%@page import="java.time.YearMonth"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.cmonee.dao.MVInfoDAO"%>
<%@page import="com.cmonee.model.Movie"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Movie movie = (Movie) request.getAttribute("movie");
%>
<%
    Post post = new Post();
    post = MVInfoDAO.getPostInfo(movie.getPostId());
    String Category = MVInfoDAO.getCategory(movie.getCategoryId());
    String CountReviews = MVInfoDAO.countReviews(movie.getId());
%>

<!DOCTYPE html>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><%="C'monee review: " + movie.getName()%></title>
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
                                </form>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <main role="main">
            <!-- Content -->
            <main role="main">
                <!-- Content -->
                <article>
                    <header class="section background-dark">
                        <div class="line">        
                            <h1 class="text-white margin-top-bottom-40 text-size-60 text-line-height-1" style="font-family: ">Thông tin phim</h1>
                            <p class="margin-bottom-0 text-size-16">Các thông tin cơ bản về phim.</p>
                            <div><p txt=textfilm/text.txt></p></div>
                        </div>  
                    </header>
                    <section class="section background-white">
                        <div class="line">
                            <div class="s-12 m-12 l-6">  
                                <img src="<%=movie.getPoster()%>" style="width: 80%" alt="">
                            </div>
                            <div class="s-12 m-12 l-6">
                                <div class="padding-2x">
                                    <div class="line">
                                        <div class="margin-left-0 margin-bottom-30">
                                            <h3 class="text-size-25 margin-bottom-0"><%=movie.getName()%></h3>
                                            <p><b>Trạng thái: </b>
                                                        <%
                                                            String Status = new String();
                                                            if (movie.getIsPublished() == -1) {
                                                                Status = "Đã chiếu";
                                                            }
                                                            if (movie.getIsPublished() == 0) {
                                                                Status = "Đang chiếu";
                                                            }
                                                            if (movie.getIsPublished() == 1)
                                                                Status = "Sắp chiếu";
                                                        %>
                                                        <%=Status.toString()%>
                                                        </p>
                                                        <p><b>Đạo diễn: </b><%=movie.getDirector()%></p>
                                                        <p><b>Quốc gia: </b><%=movie.getNation()%></p>
                                                        <p><b>Năm: </b><%=movie.getYear()%></p>
                                                        <p><b>Ngày khởi chiếu: </b><%=movie.getDatePublished()%></p>
                                            <p><b>Thời lượng: </b>1 giờ 30 phút</p>
                                            <p><b>Thể loại: </b><%=Category.toString()%></p>
                                            <span class="heading"><b>User Rating</b></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star checked"></span>
                                            <span class="fa fa-star"></span>
                                            <p><b><%=movie.getRating()%></b> average based on <%=CountReviews.toString()%> reviews.</p>
                                            <hr style="border:3px solid #f1f1f1">
                                            <h4>Nội dung phim: <br><p style="text-align:justify"><%=movie.getDescription()%></p></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <iframe class="center" width="700" height="455" src="<%=movie.getTrailer()%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="section background-white text-center">
                        <div class="line">
                            <h2 class="text-size-40 text-center margin-bottom-30">Review</h2>
                            <hr class="break-small background-primary break-center margin-bottom-30">
                            <p class="text-left"> <%=post.getContents()%></p>

                            <hr class="break-small background-primary break-center margin-top-bottom-30">
                        </div>
                        <h2 class="text-size-40 text-center margin-bottom-30">Bình luận về phim</h2>
                        <div>
                            <form action="" id="usrform" class="" style="text-align: left; margin-left: 100px">
                                Name: <input type="text" name="usrname">
                            </form>
                            <br>
                            <textarea cols="150" rows="5" style="margin-left: 100px" placeholder="Để lại bình luận tại đây"></textarea>
                            <input type="submit">
                        </div>
                        <br>
                        <h3 class="text-size-20" style="text-align: left; margin-left: 100px">Bạn có muốn đánh giá rating cho phim?</h3>
                        <div class="rate" style="margin-left: 100px">
                            <input type="radio" id="star5" name="rate" value="5" />
                            <label for="star5" title="text">5 stars</label>
                            <input type="radio" id="star4" name="rate" value="4" />
                            <label for="star4" title="text">4 stars</label>
                            <input type="radio" id="star3" name="rate" value="3" />
                            <label for="star3" title="text">3 stars</label>
                            <input type="radio" id="star2" name="rate" value="2" />
                            <label for="star2" title="text">2 stars</label>
                            <input type="radio" id="star1" name="rate" value="1" />
                            <label for="star1" title="text">1 star</label>
                        </div>
                    </div>
        <section class="home_banner_area">
            <div class="line">
                <h3 class="text-size-25 text-center">Có thể bạn sẽ thích</h3>
                <div class="container box_1420">
                    <div class="banner_inner1 d-flex align-items-center">
                        <div class="banner_content1">
                            <div class="media">
                                <div class="center margin-left-30">
                                    <img src="img/poster/Hai/nang-3.jpg" alt="" style="width: 240px; height: 355px "class="center margin-left-right-10">
                                </div>
                                <div class="">
                                    <img src="img/poster/Hai/vqdn406.jpg" alt="" style="width: 240px; height: 355px" class="center margin-left-right-10">
                                </div>
                                <div class="">
                                    <img src="img/poster/Hai/bhnd.jpg" alt="" style="width: 240px; height: 355px" class="center margin-left-right-10">
                                </div>
                                <div class="">
                                    <img src="img/poster/HoatHinh/sam-sam.jpg" alt="" style="width: 240px; height: 355px" class="center margin-left-right-10">
                                </div>
                            </div>
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
                                    <form target="_blank" action="" method="get" class="subscribe_form relative">
                                        <div class="input-group d-flex flex-row">
                                            <input name="EMAIL" placeholder="Nhập Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '" required="" type="email">
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
