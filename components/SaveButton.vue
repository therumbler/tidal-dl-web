<template>
  <div>
    <button @click="saveUrl">save {{ urlToSave }}</button>
    <div>{{ resp }}</div>
  </div>
</template>
<script>
export default {
  props: ["urlToSave"],
  methods: {
    async saveUrl() {
      const url = "/api/save";
      console.log("saving url", this.urlToSave);
      const data = {
        url: this.urlToSave,
      };
      console.log("saving data", data);
      console.log("url", url);
      const resp = await useFetch(url, {
        method: "POST",
        body: JSON.stringify(data),
      });
      console.log("response", resp.data._rawValue);
      //   this.resp = resp;
    },
  },
};
</script>
