<template>
  <v-app>
     <v-navigation-drawer v-model="drawer" app>
      <v-list dense>
        <v-list-item v-for="(option, index) in options" :key="index" @click="selectedIndex = index">
          <v-list-item-action>
			<font-awesome-icon :icon="['fas', option.icon]" />
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
        <Posters v-if="selected === options[3]"/>
        <Thought v-if="selected === options[4]"/>
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
import Posters from './components/Misc/Posters';
import Developers from './components/Developers/Developers';
import Operations from './components/Operations/Operations';

export default {
	name: 'App',

	components: {
		About, Developers, Operations, Thought, Posters
	},
	data: () => ({
		drawer: null,
		options: [
			{name: 'About Me', icon: 'skull'},
			{name: 'According To Devs', icon: 'search'},
			{name: 'According To Ops', icon: 'search'},
			{name: 'Posters', icon: 'image'},
			{name: 'One Important Thought', icon: 'exclamation'},
		],
		selectedIndex: 0
	}),
	computed:{
		selected(){
			return this.options[this.selectedIndex]
		}
	},
};
</script>
