<template>

  <div>
 

  <ul id="example-1">
     <li v-for="(item, i) in todosData" v-bind:key="i" >
     <router-link :to="{ path: '/ProductDetails/'+item.id }">{{ item.product_name}}</router-link>
     </li>
  </ul>
    
 

   
  </div>
 
</template>

<script>


import axios from 'axios'



export default {
  name: 'app',
  components: {
 
  },
  data() {
      return {
         todosData:[]
      }
  },

 mounted() {
   axios.get('http://localhost:8080/',{},{
   headers: {
          "Access-Control-Allow-Origin": "*"
        }})
      .then(response => (this.todosData = response.data))
 },
 created() {
   
 },
 beforeMount() {
  
 },
 
beforeCreate() {
   
 },
 
 beforeUpdate() {
 
 },
 updated() {
 
 },
 beforeDestroy() {
 
 },
 destroyed() {
 
 },

 methods: {
    nameMethod() {
      //this.var1 = "nameMethod";
      return ( this.firstName + ' ' + this.lastName);
    },
    nameMethod2() {
      this.var1 = "nameMethod2";
      return ( this.firstName + ' ' + this.lastName);
    }
  },

  computed: {
  fullNameComputed: {
    // getter
    get: function () {
      return '--'
    },
    // setter
    set: function (newValue) {
      this.var1 = "fullNameComputed"
      var names = newValue.split(' ')
      this.firstName = names[0]
      this.lastName = names[names.length - 1]
    }
  }
}

}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
