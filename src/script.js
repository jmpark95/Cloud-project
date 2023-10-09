document.addEventListener("DOMContentLoaded", async () => {
   try {
      const response = await fetch("https://cloud-project-gateway-5g50j8rg.ts.gateway.dev/viewcount");
      const data = await response.json();

      const viewCountDiv = document.getElementById("viewCount");
      viewCountDiv.textContent = `${data.count} times`;

      await fetch("https://cloud-project-gateway-5g50j8rg.ts.gateway.dev/increment", {
         method: "POST",
      });
   } catch (error) {
      console.error("Error:", error);
   }
});
