<template>
    <section class="about-section">
        <div class="heading">
            <span>About Us</span>
            <h3>Whismie, mie instan dengan cita rasa autentik!</h3>
        </div>

        <div class="row">
            <div class="about-content">
                <img src="../assets/images/about-whismie.jpg" alt="about whismie" style="width: 1000 height: 1000;">
                <div class="about-content-text">
                    <p>Terbuat dari bahan berkualitas dengan bumbu rempah pilihan, Whismie menawarkan sensasi rasa yang unik dan memuaskan. 
                        Teksturnya yang kenyal dan lembut serta varian rasanya yang beragam membuat Whismie cocok dinikmati kapan saja. 
                        Sempurna untuk yang mencari kenikmatan cepat, praktis, dan ramah di kantong. 
                        Rasakan kelezatan Whismie, teman makan yang tak tergantikan!
                    </p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="about-article">
                <h3>food brings people together</h3>
            </div>
        </div>

        <div class="row gallery">
            <div class="wrapper">
                <img src="../assets/images/about/mie-1.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/dimsum-2.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/ricebowl-2.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/mie-2.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/dimsum-1.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/sushi-2.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/gelato-1.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/ricebowl-1.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/sushi-1.jpg" alt="about whismie" style="width: 100%; height: auto;">
                <img src="../assets/images/about/gelato-2.jpg" alt="about whismie" style="width: 100%; height: auto;">
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: "About",
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Satisfy&display=swap");

.about-section {
    padding: 2rem 9%;
}

.about-section .about-content {
    display: flex;
    width: 100%;

}

.about-section .about-content img {
    background-color: rgb(249, 249, 249);
}

.about-section .about-content .about-content-text {
    font-size: 16px;
    padding-left: 50px;
}

.about-section .about-article {
    margin-top: 50px;
    padding: 10px;
    text-align: center;
    background-color: #8e44ad;
    width: 100%;
}

.about-section .about-article h3 {
    font-family: 'Satisfy', cursive;
    font-size: 32px;
    color: white;
}


.about-section .gallery {
    overflow: hidden;
    padding: 100px;
}

.about-section .gallery .wrapper {
    position: relative;
    flex-grow: 1;
    margin: auto;
    max-width: 1200px;
    max-height: 1200px;
    display: grid;
    grid-template-columns: repeat(8, 1fr);
    grid-template-rows: repeat(4, 1fr);
    grid-gap: 2vmin;
    justify-items: center;
    align-items: center;
}

.about-section .gallery .wrapper img {
    z-index: 1;
    grid-column: span 2;
    max-width: 100%;
    margin-bottom: -52%;
    clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
    transform: scale(1);
    transition: all .25s;
}

.about-section .gallery .wrapper img:nth-child(7n + 1) {
    grid-column: 2 / span 2;
}

.about-section .gallery .wrapper img:hover {
    z-index: 2;
    transform: scale(2);
}

@media (max-width: 768px) {
    .about-section .about-content img {
        width: 250px;
    }

    .about-section .gallery .wrapper img:hover {
        transform: scale(2.5);
    }
}

@media (max-width: 576px) {
    .about-section .about-content img {
        width: inherit;
    }

    .about-section .about-content {
        display: block;
    }

    .about-section .about-content .about-content-text {
        padding-left: 0px;
    }

    .about-section .gallery {
        padding: 50px 0px;
    }

    .about-section .gallery .wrapper img {
        max-width: 100%;

    }

    .about-section .gallery .wrapper {
        grid-gap: 2vmin;
    }

    .about-section .gallery .wrapper img:hover {
        transform: scale(2);
    }

}
</style>