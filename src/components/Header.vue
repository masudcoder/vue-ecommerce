<template>
<div>
  <div class="jumbotron">
  <div class="container text-center">
    <h1>SpringCommerce</h1>      
    <p>Ecommerce Based Solution </p>
    <p>Version 0.1.2 </p>
  </div>
</div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><router-link to="/">Home</router-link></li>
        <li><router-link to="/about">About Us</router-link></li>
        <li><router-link to="/checkout">Checkout</router-link></li>
        <li><router-link to="/contact">Contact Us</router-link></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
        <router-link to="/about">Your Account</router-link></li></ul>
    </div>
  </div>
</nav>

</div>

</template>


<script>
export default {
  name: 'Header'
}
</script>