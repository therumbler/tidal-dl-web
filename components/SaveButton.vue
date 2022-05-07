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
      const body = JSON.stringify(data);
      console.log("saving body", body);
      console.log("url", url);
      // const resp = await useFetch(url, {
      //   method: "POST",
      //   body: body,
      //   headers: {'content-type': 'application/json; charset=UTF-8'},
      // });
      // console.log("response", resp.data._rawValue);

      const resp = await fetch(url, {
        method: "POST",
        body: body,
        headers: { "content-type": "application/json; charset=UTF-8" },
      });
      console.log("resp", resp);
      //   this.resp = resp;
    },
  },
};
</script>
