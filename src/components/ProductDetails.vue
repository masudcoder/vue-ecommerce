<template>
<div>
  product details
  {{ singleProduct.id}} {{ singleProduct.product_name}}
</div>

</template>


<script>
import axios from 'axios'
export default {
  name: 'ProductDetails',
   data() {
      return {
         singleProduct:[]
      }
  },

 mounted() {
  let url = "http://localhost:8080/product-details/";
  let pid = this.$route.params.tempid;
   axios.get(url + pid)
      .then(response => (this.singleProduct = response.data))
 }
}
</script>