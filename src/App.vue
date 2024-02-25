<template>
  <v-app>
	<v-app-bar :elevation="2" color="pink" dark>
	  <template v-slot:prepend>
		  <v-app-bar-nav-icon  variant="text" @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
	  </template>

	  <v-app-bar-title>{{selected.name}}</v-app-bar-title>
	</v-app-bar>
	
	<v-navigation-drawer 
		v-model="drawer" 
        location="left"
        temporary>
      <v-list dense>
        <v-list-item 
        v-for="(option, index) in options" 
        :key="index" @click="selectedIndex = index" 
        :to="option.route">
        
          <template v-slot:prepend>
            <font-awesome-icon class="pr-md-4 mx-lg-auto" :icon="['fas', option.icon]" />
          </template>
          <v-list-item-title>{{option.name}}</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script setup>
  //
</script>

<script>
  export default {
    data: () => ({
      drawer: false,
      group: null,
	  options: [
		{name: 'About Me', icon: 'skull', route: '/'},
		{name: 'According To Devs', icon: 'search', route: '/developers'},
		{name: 'According To Ops', icon: 'search', route: '/operations'},
		{name: 'Experiments', icon: 'search', route: '/experiments'},
		{name: 'Posters', icon: 'image', route: '/posters'},
		{name: 'One Important Thought', icon: 'exclamation', route: '/thought'},
	  ],
	  selectedIndex: 0
    }),
    watch: {
      group () {
        this.drawer = false
      },
    },
	computed:{
		selected(){
			return this.options[this.selectedIndex]
		}
	},
  }
</script>

