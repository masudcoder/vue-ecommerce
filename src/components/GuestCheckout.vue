<template>
<div>
<table width="100%">
<tr>
<td width="50%" style="padding-left:10px">
	<form v-on:submit.prevent="submitGuestCheckoutForm" action="" method="post">
	<div class="form-group">
	<label for="exampleInputEmail1">Name</label>
	<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
	<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	</div>
	<div class="form-group">
	<label for="exampleInputPassword1">Phone</label>
	<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">

	</div>
	<input type="text" v-model="orderInfo.total" >
	<button type="submit" class="btn btn-primary">Submit Order</button>
	</form>
</td>
<td width="50%" style="text-align:center"></td>
</tr>
</table>
</div>

</template>


<script>
import axios from 'axios'

export default {
  name: 'GuestCheckout',
   data() {
      return {
        noUse:{},
        orderInfo:{
         email:'',
         product_id:2,
         product_price:100,
         quantity:5,
         total:500

        }
        
      }
  },

 
 methods: {
   //let url = "http://localhost:8080/";
   submitGuestCheckoutForm() {
       axios.post("http://localhost:8080/submitGuestOrder", this.orderInfo)
    .then(response => {
         this.noUse =  response.data;
          this.$router.push({ name: "Thanks" });
        })
    .catch(e => {
      this.errors.push(e)
    })
   }

 }
}


</script>