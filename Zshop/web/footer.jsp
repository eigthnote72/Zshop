<%-- 
    Document   : footer
    Created on : Mar 14, 2022, 9:38:17 PM
    Author     : Eighth_Note
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer{
    background-color: rgb(44, 58, 71);
    margin-left: 10%; 
    margin-right: 10%;
}


@media screen and (max-width: 991px) {
    section.footer {
        margin-left: 0px;
        margin-right: 0px;
    }
}
.site-footer{
    background-color: rgb(187, 184, 184);
}
</style>
<footer class="site-footer background-black-2" style="margin-top: 100px">

            <div class="container">
                <div class="row" >

                    <div style="margin-right: 50px;"class="col-sm-12 col-md-6 col-lg-6 col-xl-4" >
                        <div class="footer-widget footer-widget__contact-widget">
                            <h3 class="footer-widget__title" style="margin-bottom: 5%;">Contact</h3><!-- //.footer-widget__title -->
                            <ul class="list-unstyled footer-widget__contact">
                                <li style="margin-bottom: 2%;">
                                    <i class="bi bi-telephone-fill"></i>
                                    <a href="tel:+84 865 350 702" style="text-decoration: none; color: rgb(43, 40, 40);">+84 816 521 125</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <i class="bi bi-envelope-fill" ></i>
                                    <a href="mailto:truongnxhe150804@fpt.edu.vn" style="text-decoration: none; color: rgb(43, 40, 40);">truongnxhe150804@fpt.edu.vn</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <i class="bi bi-geo-alt-fill" style="text-decoration: none; color: rgb(43, 40, 40);"></i>
                                    <a >Đại học FPT Hòa Lạc - Thạch Thất - Hà Nội</a>
                                </li>
                            </ul><!-- /.list-unstyled footer-widget__contact-->
                        </div><!-- /.footer-widget -->
                    </div>
                    <div class="col-sm-12 col-md-5 col-lg-5 col-xl-4">
                        <div class="footer-widget">
                            <h3 class="footer-widget__title" style="margin-bottom: 5%;">Explore</h3><!-- /.footer-widget__title -->
                            <ul class="list-unstyled footer-widget__links">
                                <li style="margin-bottom: 2%;">
                                    <a href="products" style="text-decoration: none; color: rgb(43, 40, 40);">New Products</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <a href="checkout" style="text-decoration: none; color: rgb(43, 40, 40);">My Account</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <a href="contact" style="text-decoration: none; color: rgb(43, 40, 40);">Support</a>
                                </li>
                                <li style="margin-bottom: 2%;">
                                    <a href="contact" style="text-decoration: none; color: rgb(43, 40, 40);">FAQs</a>
                                </li>
                            </ul><!-- /.list-unstyled footer-widget__contact -->
                        </div><!-- /.footer-widget -->
                    </div><!-- /.col-sm-12 col-md-6 col-lg-2 -->
                    <div class="col-sm-12 col-md-12 col-lg-12 col-xl-3">
                        <div class="footer-widget">
                            <h3 class="footer-widget__title" style="margin-bottom: 7%;">Newsletter</h3><!-- /.footer-widget__title -->
                            <form action="#" data-url="YOUR_MAILCHIMP_URL" class="mc-form">
                                <input type="email" style="width: 200px; margin-bottom: 10px; font-size: 18px; border-radius: 3px; border: none;" name="EMAIL" id="mc-email" placeholder="Email Address">
                                <button type="submit" style="background-color: rgb(30, 116, 214); color: white; width: 200px; height: 33px; font-size: 18px; font-weight: bold; border-radius: 5px; border: none;" >Subscribe</button>
                            </form>
                            <div class="mc-form__response"></div><!-- /.mc-form__response -->
                        </div><!-- /.footer-widget -->
                    </div><!-- /.col-sm-12 col-md-6 col-lg-2 -->
                </div><!-- /.row -->
            </div><!-- /.container -->
            <div class="bottom-footer">
                <div class="container">
                    <hr>
                    <div class="inner-container text-center">

                        <p class="thm-text-dark">© Copyright <span class="dynamic-year"></span> by Nguyễn Xuân Trường</p>
                    </div><!-- /.inner-container -->
                </div><!-- /.container -->
            </div><!-- /.bottom-footer -->
        </footer><!-- /.site-footer -->
