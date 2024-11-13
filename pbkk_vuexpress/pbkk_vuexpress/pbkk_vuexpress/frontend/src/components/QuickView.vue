<template>
    <vue-basic-alert :duration="300" :closeIn="2000" ref="alert" />

    <div v-if="user" class="quick-view">
        <div class="quick-view-inner" v-for="f in selectedFood" :key="f">
            <h2 class="d-flex justify-content-between">{{ f.nama_menu }}
                <slot></slot>
            </h2>
            <div class="product-detail d-flex">
                <div class="image">
                    <img :src="require(`../assets/images/${f.src_menu}`)" alt="" />
                </div>
                <div class="content">
                    <p class="money">Rp.{{ parseFloat(f.harga_menu) - parseFloat(f.diskon_menu) }}<span
                            v-if="parseFloat(f.diskon_menu) > 0">Rp.{{
                                    parseFloat(f.harga_menu)
                            }}</span></p>
                    <div class="qty">
                        <label for="qty">Quantity:</label>
                        <input type="number" name="qty" id="qty" value="1" min="1" max="1000"
                            @change="onQtyChange($event)" />
                    </div>
                    <button class="btn" @click="addToCart">Add to cart</button>
                </div>
            </div>
        </div>
    </div>
    <div v-else class="quick-view">
        <div class="quick-view-inner">
            <h2 class="d-flex justify-content-between">Please login to use this method
                <slot></slot>
            </h2>
            <div class="link-to-login" style="text-align: center; margin-top: 120px;">
                <router-link class="btn" to="/login" style="padding: 28px; font-size: 24px">login now
                </router-link>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";
import VueBasicAlert from 'vue-basic-alert';
export default {
    props: ['food'],
    name: "QuickView",

    data() {
        return {
            qty: 1,
        }
    },

    computed: {
        ...mapState(["allFoods", "user"]),

        selectedFood: function () {
            return this.allFoods.filter((f) => parseInt(f.id_menu) == parseInt(this.food));
        }
    },

    methods: {
        onQtyChange: function (e) {
            if (e.target.value < 1) {
                e.target.value = 1;
                this.qty = e.target.value;
            } else {
                this.qty = e.target.value;
            }
        },

        async addToCart() {
            let existItem = await axios.get('/cartItem/' + parseInt(this.user.id_pembeli) + '/' + parseInt(this.food));

            if (existItem.data.length == 1) {
                let data = {
                    cart_id_pembeli: parseInt(this.user.id_pembeli),
                    cart_id_menu: parseInt(this.food),
                    item_qty: parseInt(this.qty) + parseInt(existItem.data[0].item_qty)
                };
                console.log("PUT data:", data); 
                await axios.put("/cartItem/", data);
                this.$refs.alert.showAlert('success', 'Thank you!', 'Add To Cart Successfully !');
            } else {
                let data = {
                    cart_id_pembeli: parseInt(this.user.id_pembeli),
                    cart_id_menu: parseInt(this.food),
                    item_qty: parseInt(this.qty)
                };
                console.log("POST data:", data); 
                await axios.post("/cartItem/", data);
                this.$refs.alert.showAlert('success', 'Thank you!', 'Add To Cart Successfully !');
            }

        }
    },

    components: {
        VueBasicAlert
    }
}
</script>

<style scoped>
.quick-view {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 99;
    background-color: rgba(0, 0, 0, 0.2);

    display: flex;
    align-items: center;
    justify-content: center;
}

.quick-view .quick-view-inner {
    width: 45vw;
    height: 45vh;
    background-color: #fff;
    padding: 32px;
}


.quick-view .quick-view-inner h2 {
    margin: 0;
    font-size: 32px;
    color: #8e44ad;
}

.quick-view .quick-view-inner .product-detail .image img {
    height: 20rem;
    margin: 20px;
}

.quick-view .quick-view-inner .product-detail .content {
    margin-top: 20px;
    font-size: 20px;
    width: 100%;
}

.quick-view .quick-view-inner .product-detail .content p span {
    margin-left: 5px;
    text-decoration: line-through;
    opacity: 0.5;
}

.quick-view .quick-view-inner .product-detail .content div label {
    margin-right: 10px;
}

.quick-view .quick-view-inner .product-detail .content .btn {
    margin-top: 20px;
    float: right;
}

@media (max-width: 768px) {

    .quick-view .quick-view-inner {
        width: 50vw;
        height: 40vh;

    }

    .quick-view .quick-view-inner h2 {
        font-size: 20px;
    }

    .quick-view .quick-view-inner .btn {
        font-size: 10px;
        padding: 0.3rem 0.9rem;
    }

    .quick-view .quick-view-inner .product-detail .image img {
        height: 12rem;
        margin: 30px;
        margin-left: 0px;

    }

    .quick-view .quick-view-inner .product-detail .content .desc {
        font-size: 12px;
    }

    .quick-view .quick-view-inner .product-detail .content .qty {
        font-size: 12px;
    }

    .link-to-login {
        margin-top: 20px !important;
    }
}

@media (max-width: 576px) {
    .quick-view .quick-view-inner {
        width: 90vw;
        height: 40vh;
    }

    .link-to-login {
        margin-top: 50px !important;
    }

    .link-to-login>a {
        padding: 20px !important;
        font-size: 18px !important;
    }

}
</style>