<template>
    <div>
        <iframe class="videoContainer" src="https://www.youtube.com/embed/dQw4w9WgXcQ?rel=0&amp;controls=0&amp;showinfo=0&amp;autoplay=1"  frameborder="0" allow="encrypted-media;autoplay" allowfullscreen/>   
    </div>
</template>

<script>
export default {
	name: 'Thought',
	data: () => ({})
};
</script>

<style scoped>

.videoContainer {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>