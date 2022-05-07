export default function Tidal() {
  this.token = "CzET4vdadNUFQ5JU";
}

Tidal.prototype.search = async function (query) {
  const url = `https://api.tidalhifi.com/v1/search?query=${query}&limit=20&token=${this.token}&countryCode=CA`;
  const response = await fetch(url);
  const results = await response.json();
  console.log("search results", results);
  return results;
};

Tidal.prototype.save = async function (url) {
  console.log("trying to save", url);
  return { success: true };
};
