<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Starbucks</title>
    <link rel="stylesheet" href="../../../css/app.css">
    <link rel="stylesheet" href="../../../css/product.css">
</head>

<body>
    <div class="wrap">
        <header>
            <div class="static">
                <h1 class="logo">Starbucks®</h1>
                <p class="welcome">안녕하세요.<span>스타벅스입니다.</span></p>
            </div>
            <jsp:include page="../includes/navLink.jsp" />
            <div class="benefit">
                <p>스타벅스 리워드 회원 신규가입 첫 구매시,<br />무료 음료 혜택을 드려요!</p>
                <a href="./signup.html">회원가입</a>
                <a href="./login.html">로그인</a>
            </div>
        </header>
        <main>
            <!-- foryou -->
            <div class="swiper foryou">
                <h3 class="swiper-title">For you</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#"><img src="img/foryou_1.png" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/foryou_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/foryou_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/foryou_4.jpg" alt="" /></a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // foryou -->
            <!-- best-items -->
            <div class="swiper best-items">
                <h3 class="swiper-title">Best Items</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#"><img src="img/item_1.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/item_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/item_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/item_4.jpg" alt="" /></a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // best-items -->
            <!-- promotion -->
            <div class="swiper promotion">
                <h3 class="swiper-title">Promotion</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#">
                            <img src="img/promotion_1.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <img src="img/promotion_2.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <img src="img/promotion_3.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트이벤트이벤트이벤트</span>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#">
                            <img src="img/promotion_4.jpg" alt="" />
                            <span>디즈니 패브릭 포스터 증정 이벤트이벤트이벤트이벤트</span>
                        </a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // promotion -->
            <!-- news -->
            <div class="swiper news">
                <h3 class="swiper-title">News</h3>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="#"><img src="img/news_1.png" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/news_2.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/news_3.jpg" alt="" /></a>
                    </div>
                    <div class="swiper-slide">
                        <a href="#"><img src="img/news_4.jpg" alt="" /></a>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <!-- // news -->
            <!-- banner -->
            <ul class="banner">
                <li><a href="#"><img src="img/banner_1.png" alt="" /></a></li>
                <li><a href="#"><img src="img/banner_2.jpg" alt="" /></a></li>
                <li><a href="#"><img src="img/banner_3.jpg" alt="" /></a></li>
                <li><a href="#"><img src="img/banner_4.jpg" alt="" /></a></li>
            </ul>
            <!-- // banner -->
        </main>
        <div class="loading">
            <p>Coffee, Anyone?</p>
        </div>
        <jsp:include page="../includes/footer.jsp" />
        <!-- modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        상품 구매를 하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary">확인</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- //modal -->
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.min.js"></script>
    <script>
        document.querySelector('.loading').classList.add('success');

        // modal layer popup
        document.querySelector('.pay').addEventListener('click', () => {
            document.querySelector('.modal').classList.add('show');
        });
        
        let swiper = [];
        const buildSwiperSlider = () => {
            const allSliders = document.querySelectorAll('.swiper');
            let width = window.innerWidth;

            allSliders.forEach((slider, i) => {
                if (width <= 896 && swiper[i] == undefined) {
                    swiper[i] = new Swiper(slider, {
                        centeredSlides: true,
                        slidesPerView: 'auto',
                        loop: true,
                        observer: true,
                        observeParents: true,
                        pagination: {
                            el: '.swiper-pagination',
                        },
                    });
                } else if (width > 896 && swiper[i] != undefined) {
                    swiper[i].destroy();
                    if (swiper[i].destroyed) swiper[i] = undefined;
                }
            });
        }

        window.addEventListener('load', buildSwiperSlider);
        window.addEventListener('resize', buildSwiperSlider);

        const scrollPosition = () => {
            const header = document.querySelector('header');
            let scroll = this.scrollY;
            let headheight = header.clientHeight;

            if (scroll > headheight) {
                header.classList.add('fixed');
            } else {
                header.classList.remove('fixed');
            }
        }

        window.addEventListener('load', scrollPosition);
        window.addEventListener('scroll', scrollPosition);
    </script>
</body>

</html>