import "phoenix_html";
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import topbar from "../vendor/topbar";

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
});

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" });
window.addEventListener("phx:page-loading-start", (_info) => topbar.show(300));
window.addEventListener("phx:page-loading-stop", (_info) => topbar.hide());

// connect if there are any LiveViews on the page
liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()

document.addEventListener("DOMContentLoaded", async () => {
  const map = L.map("map").setView([37.7749, -122.4194], 12); // Centered on San Francisco

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    maxZoom: 19,
    attribution: "© OpenStreetMap contributors",
  }).addTo(map);

  const endpoint = "http://localhost:4000/api/graphql";

  const query = `
    query {
      foodPermits {
        applicant
        block
        latitude
        longitude
      }
    }
  `;

  try {
    const data = await fetch(endpoint, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ query }),
    });

    const json = await data.json();
    console.log("JSON: ", json);

    json.data.foodPermits.forEach((permit) => {
      var marker = L.marker([permit.latitude, permit.longitude]).addTo(map);
      marker.bindPopup(`<b>${permit.applicant}</b><br>${permit.block}`);
    });
  } catch (error) {
    console.error("Error: ", error);
  }
});

window.liveSocket = liveSocket;
