import Tidal from "~~/lib/tidal";
export default defineEventHandler(async (event) => {
  const body = await useBody(event);
  const data = JSON.parse(body);
  console.log("saving url ", data.url);

  const tidal = new Tidal();
  const resp = await tidal.save(data.url);
  return resp;
});
