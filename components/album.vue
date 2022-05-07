<template>
  <li>
    <h4>{{ album?.title }}</h4>
    <img
      class="image"
      :src="
        'https://resources.tidal.com/images/' +
        album.cover?.replace(/-/g, '/') +
        '/750x750.jpg'
      "
    />
    <SaveButton :urlToSave="album.url" />
  </li>
</template>

<script>
export default {
  props: ["album"],
};
</script>
