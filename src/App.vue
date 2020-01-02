<template>

  <div style="border:10px solid red">
   <Header />

   <div  style="border:5px solid blue">
    <!-- component matched by the route will render here -->
    <router-view></router-view>
  </div>
   <Footer />
  </div>
 
</template>

<script>
import Header from './components/Header.vue'
import Footer from './components/Footer.vue'

export default {
  name: 'app',
  components: {
   Header, Footer
  },
  data() {
      return {
         todosData:[],
         var1:"variable1",
         cId:[1,2,6],
         firstName: 'First NAme',
         lastName: 'Last NAme'
      }
  },

 

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
