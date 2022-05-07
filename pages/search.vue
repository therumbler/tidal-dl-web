<template>
  <div>
    <h1>Search Tidal</h1>
    <form class="form" @submit.prevent="performSearch">
      <input type="text" v-model="query" placeholder="Search" />
      <input type="submit" value="Search" />
    </form>

    <div>
      <h2>Top Hit</h2>
      <Result :result="results?.topHit" />
      <h2>Albums</h2>
      <ul>
        <Album
          :album="album"
          v-for="album in results?.albums.items"
          :key="album.id"
        />
      </ul>
      <h2>Artists</h2>
      <ul>
        <Artist
          :artist="artist"
          v-for="artist in results?.artists.items"
          :key="artist.id"
        />
      </ul>
    </div>
    <div>{{ results }}</div>
  </div>
</template>
<style scoped>
.image {
  max-width: 100%;
}
</style>
<script setup>
import Tidal from "~~/lib/tidal";
const useResults = () => useState("results");
const useQuery = () => useState("query");
const results = useResults();
const query = useQuery();
function filterResults(results) {
  console.log("filterResults", results);
  const filteredResults = results.filter(
    (result) => result.contentType == "video"
  );
  console.log("filteredResults", filteredResults);
  return filteredResults;
}
async function performSearch() {
  console.log("performSearch");
  console.log("searching for ", query.value);
  const tidal = new Tidal();
  const response = await tidal.search(query.value);
  results.value = response;
  return response;
}
</script>
