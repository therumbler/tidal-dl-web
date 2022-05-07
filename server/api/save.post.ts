import TidalDL from "~~/lib/tidaldl";
export default defineEventHandler(async (event) => {
  console.log("in save.post.ts");

  const body = await useBody(event);

  console.log("body.url: ", body.url);
  if (body.url === undefined) {
    return { error: "no body.url" };
  }

  const tidaldl = new TidalDL();
  const resp = await tidaldl.save(body.url);
  return resp;
});
