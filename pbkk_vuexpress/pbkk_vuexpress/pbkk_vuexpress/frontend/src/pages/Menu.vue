<template>
    <div class="menu-section">
        <div class="heading">
            <span>menu</span>
            <h3>our special dishes</h3>
        </div>

        <div class="row">
            <div class="col-sm-4 col-12 filter-box">
                <div class="row search-box">
                    <input type="text" class="search-input" v-model="foodObj.name" placeholder="  Search" />
                </div>

                <div class="row filter-drop-down">
                    <p @click="displayFilterDrop">Filter<span v-if="showDropDown">x</span><span v-else>v</span></p>
                </div>

                <div class="row filter-heading">
                    <h1>Status</h1>
                </div>

                <div class="row filter-section">
                    <ul class="filter-option">
                        <li>
                            <input type="button" name="cbStatus" id="bsStatus" value="Rekomendasi" hidden
                                @click="filterStatusBtn($event)" />
                            <label for="bsStatus" class="d-flex justify-content-between">Rekomendasi
                                <button class="unselect-btn" @click="unselectStatusBtn($event)"
                                    value="Rekomendasi">X</button></label>
                        </li>
                        
                        <li>
                            <input type="button" name="cbStatus" id="mmStatus" value="Mie Manja" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="mmStatus" class="d-flex justify-content-between">Mie Manja (Tanpa Cabai)<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Mie Manja">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="cbStatus" id="mgStatus" value="Mie Goyang" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="mgStatus" class="d-flex justify-content-between">Mie Goyang (Mie Goreng)<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Mie Goyang">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="cbStatus" id="sdStatus" value="Mie Disko" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="sdStatus" class="d-flex justify-content-between">Mie Disko (Mie Rebus Kering)<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Mie Disko">X</button></label>
                        </li>  

                        <li>
                            <input type="button" name="rbStatus" id="rbStatus" value="Rice Bowl" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="rbStatus" class="d-flex justify-content-between">Rice Bowl<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Rice Bowl">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="gdStatus" id="gdStatus" value="Genk Dimsum" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="gdStatus" class="d-flex justify-content-between">Genk Dimsum<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Genk Dimsum">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="gsStatus" id="gsStatus" value="Genk Sushi" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="gsStatus" class="d-flex justify-content-between">Genk Sushi<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Genk Sushi">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="fpiStatus" id="fpiStatus" value="Frappe Coffee Ice" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="fpiStatus" class="d-flex justify-content-between">Frappe Coffee Ice<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Frappe Coffee Ice">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="fiStatus" id="fiStatus" value="Frappe Ice" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="fiStatus" class="d-flex justify-content-between">Frappe Ice<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Frappe Ice">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="ibStatus" id="ibStatus" value="Ice Bar" hidden
                            @click="filterStatusBtn($event)" />
                            <label for="ibStatus" class="d-flex justify-content-between">Ice Bar<button
                                class="unselect-btn" @click="unselectStatusBtn($event)"
                                value="Ice Bar">X</button></label>
                        </li>
                    </ul>
                    <hr />
                </div>

                <div class="row filter-heading">
                    <h1>Price</h1>
                </div>

                <div class="row filter-section">
                    <ul class="filter-option">

                        <li>
                            <input type="button" name="rPrice" id="rftPrice" value="15,20" hidden
                                @click="filterPriceBtn($event)" />
                            <label for="rftPrice" class="d-flex justify-content-between">Rp.15000 - Rp.20000 <button
                                    class="unselect-btn" @click="unselectPriceBtn($event)">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="rPrice" id="rttPrice" value="20,25" hidden
                                @click="filterPriceBtn($event)" />
                            <label for="rttPrice" class="d-flex justify-content-between">Rp.20000 - Rp.25000 <button
                                    class="unselect-btn" @click="unselectPriceBtn($event)">X</button></label>
                        </li>

                        <li>
                            <input type="button" name="rPrice" id="mtPrice" value="25" hidden
                                @click="filterPriceBtn($event)" />
                            <label for="mtPrice" class="d-flex justify-content-between">{{ ">" }} Rp.25000 <button
                                    class="unselect-btn" @click="unselectPriceBtn($event)">X</button></label>
                        </li>

                    </ul>
                    <hr />
                </div>
            </div>


            <div class="col-sm-8">
                <div class="row">
                    <div class="menu-tabs">
                        <input type="button" id="allFilterFoodBtn" name="allFilterFoodBtn" value="all"
                            class="menu-tab-item" @click="filterFoodBtn($event)" />
                        <input type="button" id="foodFilterFoodBtn" name="foodFilterFoodBtn" class="menu-tab-item"
                            value="Makanan" @click="filterFoodBtn($event)" />
                        <input type="button" id="drinkFilterFoodBtn" name="drinkFilterFoodBtn" class="menu-tab-item"
                            value="Minuman" @click="filterFoodBtn($event)" />
                    </div>
                </div>

                <div class="row box-container">
                    <div v-for="(f, index) in currentPageItems" :key="index">
                        <div class="box">
                            <a href="" class="fas fa-heart"></a>
                            <div class="image">
                                <img :src="require(`../assets/images/${f.src_menu}`)" alt="" />
                            </div>
                            <div class="content">
                                <h3>{{ f.nama_menu }}</h3>
                                <div class="stars">
                                    <div v-for="s in Math.floor(parseFloat(f.star_menu))" :key="s" class="d-inline">
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div v-if="parseFloat(f.star_menu) - Math.floor(parseFloat(f.star_menu)) == 0.5"
                                        class="d-inline">
                                        <i class="fas fa-star-half-alt"></i>
                                    </div>
                                    <span> ({{ f.vote_menu }}) </span>
                                </div>
                                <div class="price">
                                    Rp.{{ parseFloat(f.harga_menu) - parseFloat(f.diskon_menu) }}
                                    <span v-if="parseFloat(f.diskon_menu) != 0.00">Rp.{{ parseFloat(f.harga_menu)
                                    }}</span>
                                </div>
                                <button class="btn" @click="addItem(index)">Add to cart</button>
                            </div>
                        </div>
                    </div>
                    <div v-if="!filterFoods.length">
                        <div class="box">
                            <div class="content">
                                <h1 style="color: #057835fa;">No match found!</h1>
                            </div>
                            <div class="image">
                                <img src="../assets/images/notfound.png" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
                <div v-if="calculatePages > 1" class="action-row">

                    <button v-if="pageNum != 0" @click="previous()" class="action-btn"> {{ "<" }} </button>
                            <div v-for="(p, i) in calculatePages" :key="i" class="d-inline">
                                <span v-if="i == pageNum" class="highlight" @click="set(i)">{{ i + 1 }}</span>
                                <span v-else @click="set(i)">{{ i + 1 }}</span>
                            </div>
                            <button v-if="pageNum != calculatePages - 1" @click="next()" class="action-btn"> {{ ">" }}
                            </button>
                </div>
            </div>
        </div>

        <QuickView v-if="showQuickView" :food="sendId">
            <button class="btn" @click="closeView">X</button>
        </QuickView>
    </div>
</template>

<script>
import QuickView from "@/components/QuickView.vue";
import { mapState } from "vuex";
export default {
    name: "Menu",

    data() {
        return {
            foodObj: { name: "", category: "", status: [], price: "", type: "" },

            showQuickView: false,
            showDropDown: false,
            sendId: null,

            perPage: 6,
            pageNum: 0,
            previousCategoryClicked: "",
            previousPriceClicked: "",
            previousTypeClicked: "",
        };
    },

    computed: {
        ...mapState(["allFoods"]),

        filterFoods: function () {
            return this.allFoods.filter((f) => f.nama_menu.toLowerCase().match(this.foodObj.name.toLowerCase()) &&
                (f.jenis_menu.match(this.foodObj.category) || this.foodObj.category == "all" || this.foodObj.category == "") &&
                (this.evaluatePrice(f, this.foodObj.price)) &&
                f.jenis_menu.toLowerCase().match(this.foodObj.type.toLowerCase()) &&
                (this.evaluateStatus(f, this.foodObj.status)));
        },
        currentPageItems: function () {
            return this.filterFoods.slice(this.pageNum * this.perPage, this.pageNum * this.perPage + this.perPage);
        },
        calculatePages: function () {
            if (this.filterFoods.length % this.perPage != 0) {
                return Math.floor((this.filterFoods.length) / this.perPage) + 1;
            }
            else {
                return this.filterFoods.length / this.perPage;
            }
        }
    },
    methods: {
        set(val) {
            this.pageNum = val;
        },
        next() {
            this.pageNum++;
        },
        previous() {
            this.pageNum--;
        },
        checkMieDisko: function (food, statusArray) {
            if (statusArray.includes("Mie Disko")) {
                if (food.status_menu.includes("Mie Disko")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkMieGoyang: function (food, statusArray) {
            if (statusArray.includes("Mie Goyang")) {
                if (food.status_menu.includes("Mie Goyang")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkRiceBowl: function (food, statusArray) {
            if (statusArray.includes("Rice Bowl")) {
                if (food.status_menu.includes("Rice Bowl")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkGenkDimsum: function (food, statusArray) {
            if (statusArray.includes("Genk Dimsum")) {
                if (food.status_menu.includes("Genk Dimsum")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkGenkSushi: function (food, statusArray) {
            if (statusArray.includes("Genk Sushi")) {
                if (food.status_menu.includes("Genk Sushi")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkFrappeCoffeeIce: function (food, statusArray) {
            if (statusArray.includes("Frappe Coffee Ice")) {
                if (food.status_menu.includes("Frappe Coffee Ice")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkFrappeIce: function (food, statusArray) {
            if (statusArray.includes("Frappe Ice")) {
                if (food.status_menu.includes("Frappe Ice")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkIceBar: function (food, statusArray) {
            if (statusArray.includes("Ice Bar")) {
                if (food.status_menu.includes("Ice Bar")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkRekomendasi: function (food, statusArray) {
            if (statusArray.includes("Rekomendasi")) {
                if (food.status_menu.includes("Rekomendasi")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        checkMieManja: function (food, statusArray) {
            if (statusArray.includes("Mie Manja")) {
                if (food.status_menu.includes("Mie Manja")) {
                    return true;
                }
                else {
                    return false;
                }
            }
            return true;
        },
        evaluateStatus: function (food, statusArray) {
            this.pageNum = 0;
            if (statusArray.length != 0) {
                if (this.checkRekomendasi(food, statusArray) && this.checkMieManja(food, statusArray) 
                    && this.checkMieDisko(food, statusArray) && this.checkMieGoyang(food, statusArray) 
                    && this.checkRiceBowl(food, statusArray) && this.checkGenkDimsum(food, statusArray) 
                    && this.checkFrappeCoffeeIce(food, statusArray) && this.checkGenkSushi(food, statusArray)
                    && this.checkFrappeIce(food, statusArray) && this.checkIceBar(food, statusArray)) {
                    return food;
                }
            }
            else {
                return food;
            }
        },
        evaluatePrice: function (food, priceRange) {
            this.pageNum = 0;
            var cal = parseFloat(food.harga_menu) - parseFloat(food.diskon_menu);
            if (priceRange == "10,15") {
                if (10000 <= cal && cal <= 15000) {
                    return food;
                }
            }
            else if (priceRange == "15,20") {
                if (15000 <= cal && cal <= 20000) {
                    return food;
                }
            }
            else if (priceRange == "20,25") {
                if (20000 <= cal && cal <= 25000) {
                    return food;
                }
            }
            else if (priceRange == "10") {
                if (cal <= 10000) {
                    return food;
                }
            }
            else if (priceRange == "25") {
                if (cal >= 25000) {
                    return food;
                }
            }
            else if (priceRange == "") {
                return food;
            }
        },

        filterFoodBtn: function (e) {
            this.pageNum = 0;
            if (this.foodObj.category != e.target.value && this.previousCategoryClicked != "") {
                this.previousCategoryClicked.target.style.background = "#8e44ad";
            }
            this.foodObj.category = e.target.value;
            this.previousCategoryClicked = e;
            e.target.style.background = "#057835fa";
        },
        filterStatusBtn: function (e) {
            this.pageNum = 0;
            this.foodObj.status = []; 
            this.foodObj.status.push(e.target.value);
            document.querySelector(`[for=${e.target.id}]`).style.background = "#057835fa";
            document.querySelector(`[for=${e.target.id}]`).style.color = "white";
            document.querySelector(`[for=${e.target.id}]`).querySelector(":scope > button").style.display = "block";
            if (this.previousStatusClicked) {
                document.querySelector(`[for=${this.previousStatusClicked.target.id}]`).style.background = "inherit";
                document.querySelector(`[for=${this.previousStatusClicked.target.id}]`).style.color = "inherit";
                document.querySelector(`[for=${this.previousStatusClicked.target.id}]`).querySelector(":scope > button").style.display = "none";
            }
            this.previousStatusClicked = e;
        },

        filterPriceBtn: function (e) {
            this.pageNum = 0;
            this.foodObj.price = "";
            this.foodObj.price += e.target.value;
            document.querySelector(`[for=${e.target.id}]`).style.background = "#057835fa";
            document.querySelector(`[for=${e.target.id}]`).style.color = "white";
            document.querySelector(`[for=${e.target.id}]`).querySelector(":scope > button").style.display = "block";
            if (this.previousPriceClicked != "") {
                document.querySelector(`[for=${this.previousPriceClicked.target.id}]`).style.background = "inherit";
                document.querySelector(`[for=${this.previousPriceClicked.target.id}]`).style.color = "inherit";
                document.querySelector(`[for=${this.previousPriceClicked.target.id}]`).querySelector(":scope > button").style.display = "none";
            }
            this.previousPriceClicked = e;
        },
        filterTypeBtn: function (e) {
            this.pageNum = 0;
            this.foodObj.type = "";
            this.foodObj.type += e.target.value;
            document.querySelector(`[for=${e.target.id}]`).style.background = "#057835fa";
            document.querySelector(`[for=${e.target.id}]`).style.color = "white";
            document.querySelector(`[for=${e.target.id}]`).querySelector(":scope > button").style.display = "block";
            if (this.previousTypeClicked != "") {
                document.querySelector(`[for=${this.previousTypeClicked.target.id}]`).style.background = "inherit";
                document.querySelector(`[for=${this.previousTypeClicked.target.id}]`).style.color = "inherit";
                document.querySelector(`[for=${this.previousTypeClicked.target.id}]`).querySelector(":scope > button").style.display = "none";
            }
            this.previousTypeClicked = e;
        },
        unselectStatusBtn: function (e) {
            this.pageNum = 0;
            this.foodObj.status = this.foodObj.status.filter(function (a) { return a !== e.target.value; });
            e.target.parentNode.style.background = "inherit";
            e.target.parentNode.style.color = "inherit";
            e.target.parentNode.querySelector(":scope > button").style.display = "none";
        },
        unselectPriceBtn: function () {
            this.pageNum = 0;
            this.foodObj.price = "";
            document.querySelector(`[for=${this.previousPriceClicked.target.id}]`).style.background = "inherit";
            document.querySelector(`[for=${this.previousPriceClicked.target.id}]`).style.color = "inherit";
            document.querySelector(`[for=${this.previousPriceClicked.target.id}]`).querySelector(":scope > button").style.display = "none";
            this.previousPriceClicked = "";
        },
        unselectTypeBtn: function () {
            this.pageNum = 0;
            this.foodObj.type = "";
            document.querySelector(`[for=${this.previousTypeClicked.target.id}]`).style.background = "inherit";
            document.querySelector(`[for=${this.previousTypeClicked.target.id}]`).style.color = "inherit";
            document.querySelector(`[for=${this.previousTypeClicked.target.id}]`).querySelector(":scope > button").style.display = "none";
            this.previousTypeClicked = "";
        },
        addItem: function (index) {
            this.sendId = parseInt(this.currentPageItems[index].id_menu);
            this.showQuickView = !this.showQuickView;
        },

        closeView: function () {
            this.showQuickView = !this.showQuickView;
        },

        displayFilterDrop: function () {
            let divControl1 = document.getElementsByClassName("filter-heading");
            let divControl2 = document.getElementsByClassName("filter-section");
            for (var i = 0; i < divControl1.length; i++) {
                if (this.showDropDown) {
                    divControl1[i].style.display = "none";
                    divControl2[i].style.display = "none";
                }
                else {
                    divControl1[i].style.display = "block";
                    divControl2[i].style.display = "block";
                }
            }
            this.showDropDown = !this.showDropDown;
        }

    },
    components: { QuickView }
};
</script>

<style scoped>
input[type="button"] {
    background: none;
    color: inherit;
    border: none;
    padding: 0;
    font: inherit;
    cursor: pointer;
    outline: inherit;
}

.unselect-btn:active,
.unselect-btn:focus,
.action-btn:active,
.action-btn:focus {
    border: none;
    outline: none;
}

hr {
    border-top: 3px solid #8e44ad;
    width: 100%;
}

.unselect-btn {
    background: transparent;
    padding-right: 10px;
    cursor: pointer;
    color: inherit;
    display: none;
}


.filter-section {
    width: inherit;
}

.filter-heading {
    padding-top: 30px;
}

.filter-heading h1 {
    color: #8e44ad;
}

.filter-option {
    list-style-type: none;
    width: inherit;
}

.filter-option label {
    width: 100%;
    font-size: 15px;
    padding: 3px 0px;

}

.filter-option label:hover {
    color: white;
    background-color: #f38609 !important;
    transition: all 0.5s ease;
}

.search-box {
    width: 100%;
    justify-content: center;
    position: relative;
    display: flex;
}

.search-input {
    margin: 0;
    width: 100%;
    height: 40px;
    font-size: 20px;
    color: white;
    background: #8e44ad;
}

::placeholder {
    color: white;
}

.menu-section {
    padding: 2rem 9%;
}

.menu-section .menu-tabs {
    margin-bottom: 30px;
    flex: 0 0 100%;
    max-width: 100%;
    text-align: center;
    background-color: #8e44ad;
}

.menu-section .menu-tabs .menu-tab-item {
    display: inline-block;
    cursor: pointer;
    padding: 5px 30px;
    border-radius: 30%;
    font-size: 20px;
    color: whitesmoke;
    font-weight: 500;
    text-transform: capitalize;
    transition: all 0.3s ease;
    margin: 0;
}

.menu-section .menu-tabs .menu-tab-item:hover {
    background-color: #f38609 !important;
}

.menu-section .menu-tabs .menu-tab-item p {
    padding: none;
    margin: none;
}

.menu-section .box-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
    gap: 1.5rem;
}

.menu-section .box-container .box {
    border-radius: 0.5rem;
    position: relative;
    background: #f7f7f7;
    padding: 2rem;
    text-align: center;
}

.menu-section .box-container .box .fa-heart {
    position: absolute;
    top: 1.5rem;
    right: 1.5rem;
    font-size: 2.5rem;
    color: #666;
    cursor: pointer;
}

.menu-section .box-container .box .fa-heart:hover {
    color: #8e44ad;
}

.menu-section .box-container .box .image {
    margin: 1rem 0;
}

.menu-section .box-container .box .image img {
    height: 15rem;
}

.menu-section .box-container .box .content h3 {
    font-size: 2rem;
    color: #130f40;
}

.menu-section .box-container .box .content .stars {
    padding: 1rem 0;
    font-size: 1.7rem;
}

.menu-section .box-container .box .content .stars i {
    color: gold;
}

.menu-section .box-container .box .content .stars span {
    color: #666;
}

.menu-section .box-container .box .content .desc p {
    font-size: 14px;
    margin: 0;
}

.menu-section .box-container .box .content .price {
    font-size: 2rem;
    color: #130f40;
}

.menu-section .box-container .box .content .price span {
    font-size: 1.5rem;
    color: #666;
    text-decoration: line-through;
}

.menu-section .action-row {
    padding-top: 30px;
    width: 100%;
    text-align: center;
    font-size: 20px;
}

.menu-section .action-row .action-btn {
    background-color: #8e44ad;
    padding: 3px;
    border: 2px solid #8e44ad;
    border-radius: 30%;
    color: white;
}

.menu-section .action-row span {
    margin-right: 15px;
}

.menu-section .action-row span:hover {
    cursor: pointer;
}

.menu-section .action-row span.highlight {
    color: #f38609;
}

.menu-section .action-row span:first-of-type {
    margin-left: 15px;
}

.filter-drop-down {
    display: none;
}

@media (min-width: 576px) {

    .filter-heading,
    .filter-section {
        display: block !important;
    }
}

@media (max-width: 768px) {
    .menu-section .box-container {

        grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
        gap: 1rem;
    }

    .menu-section .box-container .box .content h3 {
        height: 4rem;
    }
}

@media (max-width: 576px) {

    .search-box,
    .filter-heading,
    .filter-section {
        width: auto;
    }

    .filter-option {
        width: 100%;
    }

    .filter-drop-down {
        display: block;
        background-color: #8e44ad;
        color: white;
        font-weight: 400;
        margin-bottom: 15px;
        margin-top: 15px;

    }

    .filter-drop-down p {
        font-size: 20px;
        padding: 5px 0px;
        margin: 0;
        display: flex;
        justify-content: space-between;
    }

    .filter-drop-down p span {
        font-size: 20px;
        padding-right: 10px;
        text-transform: lowercase;
        font-weight: 300;
    }

    .filter-heading,
    .filter-section {
        display: none;
    }

    .menu-tabs .menu-tab-item {
        font-size: 12px !important;
        padding: 5px 20px !important;
    }

    .menu-section .action-row {
        font-size: 16px !important;
    }

    .menu-section .action-row span {
        margin-right: 5px;
    }

    .menu-section .box-container .box .image img {
        height: 10rem;
    }

    .menu-section .box-container .box .desc p,
    .menu-section .box-container .box .content .stars {
        font-size: 10px !important;
    }

    .menu-section .box-container .box .content h3 {
        font-size: 14px !important;
        height: 28px;
    }
}
</style>