<template>
<div>
  
  <div class="product_details_container">
   {{ singleProduct.product_name}} {{ amount }}
  <input type="number" min="1" v-model="amount" />
  <button v-on:click="addtoCart()" class="btn btn-success add_to_cart_btn">Add to Cart</button>
  </div>

</div>

</template>


<script>
import axios from 'axios'

export default {
  name: 'ProductDetails',
   data() {
      return {
         singleProduct:[],
         amount:1,
         noUse:{}
      }
  },

 mounted() {
  let url = "http://localhost:8080/product-details/";
  let pid = this.$route.params.tempid;
   axios.get(url + pid)
      .then(response => (this.singleProduct = response.data))
 },
 methods: {
  addtoCart() {
    

    let url = "http://localhost:8080/";
    let pid = this.$route.params.tempid;
    
    axios.post(url + "addToCart", {
         pid:pid,
         amount:this.amount,
         userTrackId:'track_id_123'
         })
    .then(response => {
         this.noUse =  response.data;
          this.$router.push({ name: "Cart" });
          // let status = JSON.parse(response.data.status);
          //redirect logic
          if (status == '200') {
            //this.$router.push('http://127.0.0.1:8081/cart');
           } else {
            // this.$router.push('http://127.0.0.1:8081/cart');
           }
        })
    .catch(e => {
      this.errors.push(e)
    })

    
  }
 }
}
</script>
