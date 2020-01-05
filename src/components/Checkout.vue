<template>
<div>
<table width="100%">
<tr>
<td width="50%" style="padding-left:10px">
	<form>
	<div class="form-group">
	<label for="exampleInputEmail1">Email address</label>
	<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
	<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
	</div>
	<div class="form-group">
	<label for="exampleInputPassword1">Password</label>
	<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
	</div>
	<button type="submit" class="btn btn-primary">Login</button>
	</form>
</td>
<td width="50%" style="text-align:center"><b> <button class="btn btn-lg btn-block btn-success text-uppercase" @click="guestCheckout">Guest Checkout</button> </b> <br /> Register Here</td>
</tr>
</table>
</div>

</template>


<script>
export default {
  name: 'Cart',
   data() {
      return {
         cart:[],
      }
  },

 
 methods: {
  guestCheckout() {
    this.$router.push({name:'GuestCheckout'})
  }
 }
}
</script>