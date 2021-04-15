<template>
  <v-app>
     <v-navigation-drawer v-model="drawer" app>
      <v-list dense>
        <v-list-item v-for="(option, index) in options" :key="index" @click="selectedIndex = index">
          <v-list-item-action>
            <v-icon>{{option.icon}}</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>{{option.name}}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app color="pink" dark>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>{{selected.name}}</v-toolbar-title>
    </v-app-bar>

    <v-content>
        <About v-if="selected === options[0]"/>
        <Developers v-if="selected === options[1]"/>
        <Operations v-if="selected === options[2]"/>
        <Thought v-if="selected === options[3]"/>
    </v-content>
    <v-footer app>
      <v-col class="text-center caption" cols="12">
        Copyright (c) {{ new Date().getFullYear() }} Penar Maciej. All rights reserved.
      </v-col>
    </v-footer>
  </v-app>
</template>

<script>
import About from './components/Misc/About';
import Thought from './components/Misc/Thought';
import Developers from './components/Developers/Developers';
import Operations from './components/Operations/Operations';

export default {
  name: 'App',

  components: {
    About, Developers, Operations, Thought,
  },
  data: () => ({
    drawer: null,
    options: [
      {name: 'About Me', icon: 'fa-skull'},
      {name: 'According To Devs', icon: 'fa-user-graduate'},
      {name: 'According To Ops', icon: 'fa-user-graduate'},
      {name: 'One Important Thought', icon: 'fa-search'},
    ],
    selectedIndex: 0
   }),
  computed:{
    selected(){
      return this.options[this.selectedIndex]
    }
  }
};
</script>
