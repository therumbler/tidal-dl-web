<template>
  <li>
    <h4>{{ artist?.name }}</h4>
    <img
      class="image"
      :src="
        'https://resources.tidal.com/images/' +
        artist.picture?.replace(/-/g, '/') +
        '/750x750.jpg'
      "
    />
  </li>
</template>
<script>
export default {
  props: ["artist"],
};
</script>
