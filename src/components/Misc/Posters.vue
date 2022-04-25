<template>
<div class="margined">
  <v-container>
  <v-card
    class="mx-auto">
    <v-img
      class="white--text"
      height="200px"
      :src="require('../../assets/me.png')">

	<v-card-title class="align-end fill-height headline">Maciej Penar, M.Sc.Eng.</v-card-title>
		</v-img>

		<v-card-text>
			<span>Modus Operandi</span><br>
			<span class="text--primary">
				Once in a while I design the posters for my friends for some special occassions. It started as a joke (and in fact it still is) - basically each of these works was created to capture some more-or-less funny reference / thought addressed to specific person. 
				Personally I found comfort in creating these abominations - if any of my friends hung any of them on the wall - good for them. As a rule of thumb I print each poster once. I put the works here as a low-quality pictures. The quality of the upload is shit, but if anyone would be so stupid to think of selling these in any form - I do not give permission for such actions.
			</span>
		</v-card-text>
	</v-card>
  
	<br/>

	<h1>South Park: You're getting old</h1>
	<p>
		It is where the joke began. These 2 beauties are based on my favourite all-time classic South Park episode <i>`You're getting old`</i>. 
		Both posters reference the episode running joke - the gutter-level try-hard unfunny wild scenarios from the Adam Sandlers movies (well, that was true for movies with him at that time - although he did had good acts like i.e. "Funny People").
		I have to admit I always had a penchant for the anti-comedy. Posters were created for my Sunday-South-Park-Discussion-Club members, as my farewell gift.
	</p>
	<v-row no-gutters>
	<v-col align="center">
		<v-img class="white--text" height="521px" width="375px" :src="require('../../assets/posters/SP_1.jpg')"></v-img>
	</v-col >
	<v-col align="center">
		<v-img class="white--text" height="521px" width="375px"  :src="require('../../assets/posters/SP_2.jpg')"></v-img>
	</v-col>
	</v-row>
	
	<br/> <br/>
	
	<h1>One for the neck</h1>
	<p>
		The funny story about this one is that I could not find the poster for a given size - so I decided to create my own. The excerpt comes from <i>`Bing, Boil & Blow`</i> by <i>KMFDM</i> - as a tribute to one and only Lord of The Lard - Mr Watts, who actually delivered/redefined my musical taste.
		So the concept was to take my favourite illiteration by Him and present it with the image that I though represents it most accurately. The choice was pretty damn obvious as close-ups are disturbing/disgusting to me. Literally, every time when in horror movie something happens with eyes I scream like a child.
	</p>
	<v-row no-gutters>
	<v-col align="center">
		<v-img class="white--text" height="521px" width="375px" :src="require('../../assets/posters/Disturb.jpg')"></v-img>
	</v-col >
	</v-row>
	
	<br/> <br/>
	
	<h1>Where is here?</h1>
	<p>
		My daughter had a philosophical moment when she asked me `Where is here`. I thought it was <i>golden</i> question at that time. Without further ado, we tried a photoshoot of her and provided the text. Whole process took like 15-30 minutes, so the whole poster is rather undercooked.
		It though have a little-nice filter added which gradually desaturates/darkens the whole picture in a semi-random fashion. This is why the photo has vertical strips. Interestingly enough, the alternative version of the poster had the brightening effect and I actually liked it more.
		However, I had very weird deja-vu feeling about that version - and I still can't shake this feeling off. That was very unnverving feeling.
	</p>
	<v-row no-gutters>
	<v-col align="center">
		<v-img class="white--text" height="521px" width="375px" :src="require('../../assets/posters/Where.png')"></v-img>
	</v-col >
	</v-row>
	
	<h1>Head trauma</h1>
	<p>
		In order to process some events in my life I decided to do some posters for people in my life that had significant impact. I imposed some rules - i.e. every poster had to be shoot in a different style, some things (i.e. font) should be similar, every photo shoot should be done by myself without any 3-rd person interference,
		every consecutive poster should consequently be more body-centric - I wanted posters to focus on me/my body therefore by proxy share it with others - its a concept that I would be outrageous for myself few years ago. I put here SFW versions of the posters, because some of them were actually more <i>steamy</i>.
		One note: again Mr Watts sneaked into my posters as the <i>Violence</i> poster contains the lyrics from the song of the same title.
	</p>
	<v-row no-gutters>
	<v-col align="center">
		<v-img class="white--text" height="521px" width="375px" :src="require('../../assets/posters/Violence.png')"></v-img>
	</v-col >
	<v-col align="center">
		<v-img class="white--text" height="521px" width="375px"  :src="require('../../assets/posters/Vanishing.png')"></v-img>
	</v-col>
	<v-col align="center">
		<v-img class="white--text" height="521px" width="375px"  :src="require('../../assets/posters/Easy.png')"></v-img>
	</v-col>
	</v-row>
	
  </v-container>
</div>
</template>

<script>
export default {
	name: 'Posters',
	data: () => ({
	fields:[
		{text: 'Database Management Systems', subtext: 'NoSQL, NewSQL, RDBMS, OLTP, OLAP, Big Data, ...', icon: 'database'},
		{text: 'Stream Processing', subtext: 'Kafka, Samza, Storm, Spark, ...', icon: 'bolt'},
		{text: 'Data Mining / Data Science / Data Analysis', subtext: '... and other things in R', icon: 'chart-bar'},
		{text: 'IT Security', subtext: 'somehow novel for me', icon: 'user-secret'},
		{text: 'DevOps', subtext: 'virtualization, containers, app deployment, configuration management, ...', icon: 'warehouse'},
		{text: 'Software Engineering', subtext: 'Design Patterns, Languages, ....', icon: 'keyboard'},
		{text: 'Dentistry', subtext: '... I guess ...', icon: 'tooth'}
	]
	})
};
</script>

<style scoped>
.margined{
  max-width: 80%;
  margin:auto;
}
</style>
