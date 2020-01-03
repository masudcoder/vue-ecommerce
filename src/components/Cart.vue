<template>
<div>
  Cart Page
  <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Product ID</th>
      <th scope="col">amount</th>
      <th scope="col">Track Id</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <tr v-for="(item, i) in cart" v-bind:key="i">
      <th scope="row">{{ item.id}}</th>
      <td>{{ item.pid}} </td>
      <td>{{ item.amount}}</td>
      <td>{{ item.userTrackId}}</td>
      <td><button type="button" class="btn btn-danger">Delete</button></td>
    </tr>
  </tbody>
  </table>

 
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

  }
 }
}
</script>
