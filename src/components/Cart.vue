<template>
<div>
 <div class="container">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col">Product</th>
                            <th scope="col">Available</th>
                            <th scope="col" class="text-center">Quantity</th>
                            <th scope="col" class="text-right">Price</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item, i) in cart" v-bind:key="i">
                            <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
                            <td>{{ item.pid}}</td>
                            <td>{{ item.id}}</td>
                            <td><input class="form-control" type="text" value="1" /></td>
                            <td class="text-right">{{ item.amount}}</td>
                            <td class="text-right"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
                        </tr>
                       
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Sub-Total</td>
                            <td class="text-right">255,90 €</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Shipping</td>
                            <td class="text-right">6,90 €</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>Total</strong></td>
                            <td class="text-right"><strong>346,90 €</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <button class="btn btn-block btn-light">Continue Shopping</button>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <button class="btn btn-lg btn-block btn-success text-uppercase" @click="checkout">Checkout</button>
                </div>
            </div>
        </div>
    </div>
</div>
 
</div>

</template>


<script>
import axios from 'axios'

export default {
  name: 'Cart',
   data() {
      return {
         cart:[],
      }
  },

 mounted() {
  let url = "http://localhost:8080/";
  
   axios.get(url + "cart")
      .then(response => (this.cart = response.data))
 },
 methods: {
  deleteFromCart() {

  },
  checkout() {
    this.$router.push({name:'Checkout'})
  }
 }
}
</script>
