<template>
    <div class="checkout-container">
        <div class="checkout-form-container">
            <form id="checkoutForm" @submit="handleSubmit" novalidate autocomplete="off">
                <div class="checkout-heading">
                    <h3>Few more step to place your order<span>Total</span></h3>
                    <h3 v-if="user">{{ user.nama_pembeli }}'s Order<span>Rp.{{ calculateSummaryPrice()[2]}}</span></h3>
                </div>

                <div class="form-group details-group">
                    <h4>Notes</h4>
                    <div class="form-group">
                        <input type="text" name="coNotes" id="coNotes" placeholder="Put your notes in here"
                            class="form-control" v-model="checkoutObj.notes" />
                        <p class="error-mess" v-if="errorObj.notesErr.length > 0">{{ errorObj.notesErr[0] }}</p>
                    </div>
                </div>

                <div v-if="user" class="form-group">
                    <input type="submit" value="CONFIRM" class="btn"
                        :disabled="filterFoods.length ? false : true" />
                </div>

            </form>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";
export default {
    name: "Checkout",

    data() {
        return {
            checkoutObj: { notes: ""},
            errorObj: { notesErr: []},
            cartItem: [],
            itemQuantity: [],
        }
    },

    created() {
        this.getAllCartItem();
    },

    computed: {
        ...mapState(["allFoods", "user"]),

        filterFoods: function () {
            return this.allFoods.filter(
                (f) => this.matchID(f, this.cartItem)
            );
        },
    },

    methods: {

        matchID: function (food, cartArray) {
            let temp = "";
            cartArray.forEach(element => {
                if (parseInt(food.id_menu) == element) {
                    temp = food
                }
            });
            return temp
        },

        calculateSummaryPrice: function () {
            let subtotal = 0;
            let discount = 0;
            let i = 0;
            while (i < this.itemQuantity.length) {
                subtotal = subtotal + parseInt(this.filterFoods[i].harga_menu) * this.itemQuantity[i]
                discount = discount + parseInt(this.filterFoods[i].diskon_menu) * this.itemQuantity[i]
                i = i + 1
            }
            let total = subtotal - discount ;
            return [subtotal, discount, total];
        },

        async getAllCartItem() {
            if (this.user) {
                let existItem = await axios.get('/cartItem/' + this.user.id_pembeli);
                existItem.data.forEach(element => {
                    this.cartItem.push(element.cart_id_menu);
                    this.itemQuantity.push(element.item_qty);
                });
            }
        },

        resetCheckErr: function () {
            this.errorObj.notesErr = [];
        },

        checkEmptyErr: function () {
            for (var typeErr in this.errorObj) {
                if (this.errorObj[typeErr].length != 0) {
                    return false;
                }
            }
            return true;
        },

        inputUpcase: function (e) {
            e.target.value = e.target.value.toUpperCase()
        },

        checkForm: function () {
            this.resetCheckErr();
        },

        async sendBillDetails(billId, foodId, qty) {

            let menuDetails = await axios.get("/foods/" + foodId);

            let data = {
                pesanan_pm_id_pesanan: parseInt(billId),
                menu_id_menu: parseInt(foodId),
                item_qty: parseInt(qty),
                penjual_pm_id_penjual: menuDetails.data.penjual_me_id_penjual,
            }

            console.log("DATA DETAIL: ",data);

            await axios.post("/billdetails", data);
        },

        async handleSubmit(e) {
            this.checkForm();

            if (!this.checkEmptyErr()) {
                e.preventDefault();
            } else {
                e.preventDefault();
                let billId = (await axios.get("/billstatus/new")).data;

                console.log("IDNYA KAKAK:", billId);

                if (billId == "") {
                    billId = 1
                } else {
                    billId = parseInt(billId.id_pesanan) + 1
                }


                var now = new Date();
                var day = ("0" + now.getDate()).slice(-2);
                var month = ("0" + (now.getMonth() + 1)).slice(-2);
                var hour = ("0" + (now.getHours())).slice(-2);
                var min = ("0" + (now.getMinutes())).slice(-2);
                var currentTime = now.getFullYear() + "-" + month + "-" + day + " " + hour + ":" + min;

                let data = {
                    id_pesanan: parseInt(billId),
                    waktu_pesanan: currentTime,
                    jumlah_menu: this.allFoods.filter.length,
                    total_harga: parseInt(this.calculateSummaryPrice()[2]),
                    catatan_khusus: this.checkoutObj.notes,
                    status_pesanan: 1,
                    pembeli_ps_id_pembeli: parseInt(this.user.id_pembeli)
                }

                console.log("Data yang akan dikirim:", data); // Tambahkan console log di sini untuk memeriksa data

                axios.post("/billstatus", data);
                axios.delete("/cartItem/" + this.user.id_pembeli);

                this.cartItem.forEach((foodId, index) => {
                    this.sendBillDetails(billId, foodId, this.itemQuantity[index])
                });

                this.cartItem = [];
                this.itemQuantity = [];

                this.$router.push("/thank");

            }
        }
    }
};
</script>

<script setup>
// enables v-focus in templates
</script>

<style scoped>
.checkout-container {
    padding: 2rem 9%;
}

.checkout-container .checkout-form-container {
    background: #fff;
    height: 90vh;
}

.checkout-container .checkout-form-container form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -42%);
    max-width: 70rem;
    width: 100%;
    box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.05);
    border: 0.1rem solid rgba(0, 0, 0, 0.2);
    padding: 2rem;
    border-radius: 0.5rem;
    animation: fadeUp 0.4s linear;
}

.checkout-container .checkout-form-container form h3 {
    padding-bottom: 1rem;
    font-size: 2rem;
    text-transform: uppercase;
    color: #130f40;
    margin: 0;
}

.checkout-container .checkout-form-container form .form-control {
    margin: 0.7rem 0;
    border-radius: 0.5rem;
    background: #f7f7f7;
    padding: 2rem 1.2rem;
    font-size: 1.6rem;
    color: #130f40;
    text-transform: none;
    width: 100%;
    border: none;
}

.checkout-container .checkout-form-container form label {
    font-size: 2rem;
    margin: 0;
    padding: 0;
}

.checkout-container .checkout-form-container form span {
    font-size: 18px;
    padding-left: 5px;
    padding-right: 40px;
}

.checkout-container .checkout-form-container form .btn {
    margin: 1rem 0;
    width: 100%;
    text-align: center;
}

.checkout-container .checkout-form-container form p {
    padding-top: 1rem;
    font-size: 1.5rem;
    color: #666;
    margin: 0;
}

.checkout-container .checkout-form-container form p a {
    color: #8e44ad;
}

.checkout-container .checkout-form-container form p a:hover {
    color: #130f40;
    text-decoration: underline;
}

.checkout-container .checkout-form-container form .form-group {
    margin: 0;
}

.checkout-container .checkout-form-container form .form-group.details-group {
    margin-top: 40px;
}

.checkout-container .checkout-form-container form .form-group .error-mess {
    font-size: 1.5rem;
    position: relative;
    color: rgb(243, 47, 47);
    margin: 0;
    padding: 0;
}

.checkout-container .checkout-form-container form .checkout-heading h3 {
    display: flex;
    justify-content: space-between;
}

.checkout-container .checkout-form-container form .checkout-heading h3 span {
    padding-right: 0px;
    color: #8e44ad;;
}

.checkout-container .checkout-form-container form .checkout-heading h3:first-of-type span {
    padding-right: 0px;
    color: #130f40;
}
</style>